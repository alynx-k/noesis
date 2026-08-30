// Edge function : génère une leçon en statut brouillon via Gemini, à partir du
// programme officiel ivoirien. Réservée aux comptes admin (table public.admins).
//
// Requiert les secrets Supabase :
//   GEMINI_API_KEY   — clé API Google AI Studio / Gemini
//   GEMINI_MODEL     — optionnel, défaut "gemini-2.5-flash"
//
// Appel : POST avec un JWT admin en Authorization, body JSON :
//   { subjectSlug: string, grade: string, serie?: 'A'|'C'|'D', title: string, topicHint?: string }

import { createClient } from 'jsr:@supabase/supabase-js@2';
import { corsHeaders } from '../_shared/cors.ts';

const GEMINI_MODEL = Deno.env.get('GEMINI_MODEL') ?? 'gemini-3.6-flash';

type RequestBody = {
  subjectSlug: string;
  grade: string;
  serie?: 'A' | 'C' | 'D';
  title: string;
  topicHint?: string;
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

    // Client scopé à l'appelant, pour vérifier son statut admin sans élever ses privilèges.
    const callerClient = createClient(supabaseUrl, anonKey, {
      global: { headers: { Authorization: authHeader } },
    });

    const { data: isAdmin, error: adminCheckError } = await callerClient.rpc('is_admin');
    if (adminCheckError || !isAdmin) {
      return jsonResponse({ error: 'Réservé aux comptes admin.' }, 403);
    }

    const body = (await req.json()) as RequestBody;
    if (!body.subjectSlug || !body.grade || !body.title) {
      return jsonResponse({ error: 'subjectSlug, grade et title sont requis.' }, 400);
    }

    // Client service_role : écrit le brouillon en base indépendamment des policies RLS élève.
    const adminClient = createClient(supabaseUrl, serviceRoleKey);

    const { data: subject, error: subjectError } = await adminClient
      .from('subjects')
      .select('id, name')
      .eq('slug', body.subjectSlug)
      .single();

    if (subjectError || !subject) {
      return jsonResponse({ error: `Matière inconnue: ${body.subjectSlug}` }, 400);
    }

    const contentMd = await generateLessonMarkdown({
      apiKey: geminiApiKey,
      subjectName: subject.name,
      grade: body.grade,
      serie: body.serie,
      title: body.title,
      topicHint: body.topicHint,
    });

    const { data: lesson, error: insertError } = await adminClient
      .from('lessons')
      .insert({
        subject_id: subject.id,
        grade: body.grade,
        serie: body.serie ?? null,
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

    return jsonResponse({ lessonId: lesson.id }, 201);
  } catch (err) {
    return jsonResponse({ error: err instanceof Error ? err.message : 'Erreur inconnue' }, 500);
  }
});

async function generateLessonMarkdown(params: {
  apiKey: string;
  subjectName: string;
  grade: string;
  serie?: string;
  title: string;
  topicHint?: string;
}): Promise<string> {
  const { apiKey, subjectName, grade, serie, title, topicHint } = params;

  const prompt = `Tu es un professeur du programme officiel ivoirien (Côte d'Ivoire).
Rédige une leçon complète en français, au format Markdown, pour :
- Matière : ${subjectName}
- Classe : ${grade}${serie ? ` (série ${serie})` : ''}
- Titre de la leçon : ${title}
${topicHint ? `- Précisions : ${topicHint}` : ''}

Contraintes :
- Reste strictement fidèle au programme officiel ivoirien pour cette classe.
- Structure la leçon avec des titres ## et ###, des exemples concrets, et une section finale "### À retenir".
- N'invente aucune notion hors-programme. En cas de doute sur un fait précis, reste sur les bases consensuelles du programme plutôt que d'inventer un détail.
- Ne produis que le Markdown de la leçon, sans texte d'introduction ni de conclusion hors-sujet.`;

  const response = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/${GEMINI_MODEL}:generateContent?key=${apiKey}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents: [{ role: 'user', parts: [{ text: prompt }] }],
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
