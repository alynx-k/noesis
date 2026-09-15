// Edge function : ingère une leçon à partir d'un PDF de cours déjà collecté
// (fonds de PDF existant), à la différence de generate-course qui invente une
// leçon de zéro. La matière/classe/série/titre sont déterminés par l'appelant
// (admin), PAS par Gemini : Gemini se limite à lire le PDF fourni et à en
// restructurer fidèlement le contenu en Markdown, sans rien y ajouter.
// Réservée aux comptes admin (table public.admins).
//
// Requiert les secrets Supabase :
//   GEMINI_API_KEY   — clé API Google AI Studio / Gemini
//   GEMINI_MODEL     — optionnel, défaut "gemini-3.6-flash"
//
// Appel : POST avec un JWT admin en Authorization, body JSON :
//   { subjectSlug: string, grade: string, serie?: 'A'|'C'|'D', title: string,
//     chapterOrder?: number, pdfBase64: string }

import { createClient } from 'jsr:@supabase/supabase-js@2';
import { corsHeaders } from '../_shared/cors.ts';

const GEMINI_MODEL = Deno.env.get('GEMINI_MODEL') ?? 'gemini-3.6-flash';
const ILLEGIBLE_MARKER = 'ILLISIBLE';

type RequestBody = {
  subjectSlug: string;
  grade: string;
  serie?: 'A' | 'C' | 'D';
  title: string;
  chapterOrder?: number;
  pdfBase64: string;
};

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) {
      return jsonResponse({ error: 'Authorization manquante' }, 401);
    }

    const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
    const anonKey = Deno.env.get('SUPABASE_ANON_KEY')!;
    const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
    const geminiApiKey = Deno.env.get('GEMINI_API_KEY');

    if (!geminiApiKey) {
      return jsonResponse({ error: 'GEMINI_API_KEY non configurée côté Supabase.' }, 500);
    }

    // Client scopé à l'appelant : vérifie son statut admin sans élever ses privilèges.
    const callerClient = createClient(supabaseUrl, anonKey, {
      global: { headers: { Authorization: authHeader } },
    });

    const { data: isAdmin, error: adminCheckError } = await callerClient.rpc('is_admin');
    if (adminCheckError || !isAdmin) {
      return jsonResponse({ error: 'Réservé aux comptes admin.' }, 403);
    }

    const body = (await req.json()) as RequestBody;
    if (!body.subjectSlug || !body.grade || !body.title || !body.pdfBase64) {
      return jsonResponse({ error: 'subjectSlug, grade, title et pdfBase64 sont requis.' }, 400);
    }

    // Client service_role : écrit le brouillon indépendamment des policies RLS élève.
    const adminClient = createClient(supabaseUrl, serviceRoleKey);

    const { data: subject, error: subjectError } = await adminClient
      .from('subjects')
      .select('id, name')
      .eq('slug', body.subjectSlug)
      .single();

    if (subjectError || !subject) {
      return jsonResponse({ error: `Matière inconnue: ${body.subjectSlug}` }, 400);
    }

    const contentMd = await extractLessonMarkdown({
      apiKey: geminiApiKey,
      subjectName: subject.name,
      grade: body.grade,
      serie: body.serie,
      title: body.title,
      pdfBase64: body.pdfBase64,
    });

    if (contentMd.trim().toUpperCase().startsWith(ILLEGIBLE_MARKER)) {
      return jsonResponse({ illegible: true }, 200);
    }

    const { data: lesson, error: insertError } = await adminClient
      .from('lessons')
      .insert({
        subject_id: subject.id,
        grade: body.grade,
        serie: body.serie ?? null,
        chapter_order: body.chapterOrder ?? 0,
        title: body.title,
        content_md: contentMd,
        status: 'draft',
        generated_by: 'gemini',
      })
      .select('id')
      .single();

    if (insertError) {
      return jsonResponse({ error: insertError.message }, 500);
    }

    return jsonResponse({ illegible: false, lessonId: lesson.id }, 201);
  } catch (err) {
    return jsonResponse({ error: err instanceof Error ? err.message : 'Erreur inconnue' }, 500);
  }
});

async function extractLessonMarkdown(params: {
  apiKey: string;
  subjectName: string;
  grade: string;
  serie?: string;
  title: string;
  pdfBase64: string;
}): Promise<string> {
  const { apiKey, subjectName, grade, serie, title, pdfBase64 } = params;

  const prompt = `Voici un document PDF de cours du programme ivoirien pour :
- Matière : ${subjectName}
- Classe : ${grade}${serie ? ` (série ${serie})` : ''}
- Titre : ${title}

Restructure fidèlement le contenu de ce PDF en une leçon complète au format Markdown, en français :
- Ne répète pas le titre "${title}" en en-tête : il est déjà affiché séparément par l'application. Commence directement par le contenu (situation d'apprentissage, introduction, ou premier point du cours).
- Reste strictement fidèle au contenu du document fourni — n'invente rien, ne complète pas avec des connaissances externes au document.
- Corrige uniquement les artefacts d'extraction PDF évidents (mots coupés, sauts de ligne parasites, numéros de page, en-têtes/pieds de page répétés).
- Structure avec des titres ## et ###, des listes à puces ou numérotées, et une section finale "### À retenir" si le document permet de la déduire fidèlement.

Contraintes strictes de format (le rendu de l'app ne supporte QUE ce sous-ensemble Markdown) :
- JAMAIS de LaTeX ni de symboles \\commande (pas de $...$, pas de \\mathbb, \\in, \\notin, etc.) : écris les notations mathématiques en texte/Unicode simple (ex. "l'ensemble N", "appartient à", symboles ∈ ∉ ≤ ≥ × ÷ directement dans le texte) ou entre \`backticks\` pour une expression/formule courte (ex. \`3(x + 5) = 3x + 15\`).
- JAMAIS de tableau Markdown (pas de lignes avec des barres verticales |) : transforme tout tableau du document (énoncé/corrigé, vrai/faux, etc.) en liste à puces ou numérotée, une ligne par élément.
- Utilise uniquement **gras** pour l'emphase, jamais d'italique, de titres # (niveau 1), de liens, ni de ligne de séparation (---).
- Ne produis que le Markdown de la leçon, sans texte d'introduction ni de conclusion hors-sujet.
Si le PDF ne contient aucun texte exploitable (page blanche, scan illisible), réponds uniquement par le mot "${ILLEGIBLE_MARKER}" (rien d'autre).`;

  const response = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/${GEMINI_MODEL}:generateContent?key=${apiKey}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents: [
          {
            role: 'user',
            parts: [{ text: prompt }, { inlineData: { mimeType: 'application/pdf', data: pdfBase64 } }],
          },
        ],
      }),
    }
  );

  if (!response.ok) {
    const errText = await response.text();
    throw new Error(`Gemini a répondu ${response.status}: ${errText}`);
  }

  const data = await response.json();
  const text = data?.candidates?.[0]?.content?.parts?.[0]?.text;
  if (!text) {
    throw new Error('Réponse Gemini vide ou inattendue.');
  }
  return text as string;
}

function jsonResponse(body: unknown, status: number) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  });
}
