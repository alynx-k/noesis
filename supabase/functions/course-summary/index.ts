// Edge function : génère une synthèse de cours à partir d'une ou plusieurs
// photos de notes de l'élève. Reste fidèle au contenu photographié (pas
// d'ancrage sur le programme officiel — à la différence de ai-tutor-chat et
// homework-photo). Seul le texte généré est conservé, pas les photos.
// Premium = illimité ; gratuit = AI_FREE_TRIAL_LIMIT essais partagés avec
// ai-tutor-chat/homework-photo.
//
// Requiert les secrets Supabase :
//   GEMINI_API_KEY   — clé API Google AI Studio / Gemini
//   GEMINI_MODEL     — optionnel, défaut "gemini-3.6-flash"
//
// Appel : POST avec un JWT élève en Authorization, body JSON :
//   { images: { base64: string, mimeType?: string }[] }

import { createClient } from 'jsr:@supabase/supabase-js@2';
import { corsHeaders } from '../_shared/cors.ts';
import { AI_FREE_TRIAL_LIMIT, checkAiQuota, consumeTrial } from '../_shared/ai-trials.ts';

const GEMINI_MODEL = Deno.env.get('GEMINI_MODEL') ?? 'gemini-3.6-flash';
const ILLEGIBLE_MARKER = 'ILLISIBLE';
const MAX_IMAGES = 10;
const MAX_TITLE_LENGTH = 80;

type RequestBody = {
  images: { base64: string; mimeType?: string }[];
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

    const callerClient = createClient(supabaseUrl, anonKey, {
      global: { headers: { Authorization: authHeader } },
    });

    const {
      data: { user },
      error: userError,
    } = await callerClient.auth.getUser();
    if (userError || !user) {
      return jsonResponse({ error: 'Non authentifié' }, 401);
    }

    const body = (await req.json()) as RequestBody;
    if (!Array.isArray(body.images) || body.images.length === 0) {
      return jsonResponse({ error: 'images est requis (au moins une photo).' }, 400);
    }
    if (body.images.length > MAX_IMAGES) {
      return jsonResponse({ error: `Maximum ${MAX_IMAGES} photos par synthèse.` }, 400);
    }
    if (body.images.some((img) => !img.base64)) {
      return jsonResponse({ error: 'Une des photos est invalide.' }, 400);
    }

    const adminClient = createClient(supabaseUrl, serviceRoleKey);

    const { isPremium, trialsUsed } = await checkAiQuota(callerClient, adminClient, user.id);
    if (!isPremium && trialsUsed >= AI_FREE_TRIAL_LIMIT) {
      return jsonResponse(
        { error: 'Limite d\'essais gratuits atteinte. Passe Premium pour continuer.', trialsRemaining: 0 },
        403
      );
    }

    const { data: profile, error: profileError } = await adminClient
      .from('profiles')
      .select('grade, serie')
      .eq('id', user.id)
      .single();
    if (profileError || !profile) {
      return jsonResponse({ error: 'Profil introuvable.' }, 400);
    }

    const { title, contentMd } = await generateSummary({
      apiKey: geminiApiKey,
      grade: profile.grade,
      serie: profile.serie,
      images: body.images,
    });

    if (contentMd.trim().toUpperCase().startsWith(ILLEGIBLE_MARKER)) {
      return jsonResponse({ illegible: true, trialsRemaining: isPremium ? null : Math.max(0, AI_FREE_TRIAL_LIMIT - trialsUsed) }, 200);
    }

    const { data: created, error: insertError } = await adminClient
      .from('course_summaries')
      .insert({ user_id: user.id, title, content_md: contentMd })
      .select('id, title, content_md, created_at')
      .single();
    if (insertError || !created) {
      return jsonResponse({ error: insertError?.message ?? 'Impossible d\'enregistrer la synthèse.' }, 500);
    }

    const trialsRemaining = isPremium ? null : await consumeTrial(adminClient, user.id, trialsUsed);

    return jsonResponse({ illegible: false, summary: created, trialsRemaining }, 200);
  } catch (err) {
    return jsonResponse({ error: err instanceof Error ? err.message : 'Erreur inconnue' }, 500);
  }
});

async function generateSummary(params: {
  apiKey: string;
  grade: string;
  serie: string | null;
  images: { base64: string; mimeType?: string }[];
}): Promise<{ title: string; contentMd: string }> {
  const { apiKey, grade, serie, images } = params;
  const classeDesc = `${grade}${serie ? ` (série ${serie})` : ''}`;

  const prompt = `Tu aides un(e) élève de ${classeDesc} en Côte d'Ivoire à réviser. Voici ${images.length > 1 ? `${images.length} photos des pages de son cahier (dans l'ordre)` : 'une photo de son cahier'}.
Rédige une synthèse claire et condensée de ce cours, fidèle uniquement à ce qui est écrit sur ${images.length > 1 ? 'ces photos' : 'cette photo'} — n'ajoute aucune information qui n'y figure pas. Structure-la avec des titres (## ou ###), du **gras** pour les termes clés, et des listes à puces ou numérotées pour les points/étapes/exemples.
Réponds STRICTEMENT sous cette forme : la première ligne est un titre court (sans dièse #, sans autre formatage), suivie d'une ligne vide, puis le corps de la synthèse en Markdown.
Si aucune des photos ne contient de texte lisible (page blanche, image totalement floue ou noire), réponds uniquement par le mot "${ILLEGIBLE_MARKER}" (rien d'autre).`;

  const imageParts = images.map((img) => ({
    inlineData: { mimeType: img.mimeType ?? 'image/jpeg', data: img.base64 },
  }));

  const response = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/${GEMINI_MODEL}:generateContent?key=${apiKey}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents: [{ role: 'user', parts: [{ text: prompt }, ...imageParts] }],
      }),
    }
  );

  if (!response.ok) {
    const errText = await response.text();
    throw new Error(`Gemini a répondu ${response.status}: ${errText}`);
  }

  const data = await response.json();
  const text = data?.candidates?.[0]?.content?.parts?.[0]?.text as string | undefined;
  if (!text) {
    throw new Error('Réponse Gemini vide ou inattendue.');
  }

  if (text.trim().toUpperCase().startsWith(ILLEGIBLE_MARKER)) {
    return { title: '', contentMd: ILLEGIBLE_MARKER };
  }

  const trimmedText = text.trim();
  const [firstLine, ...rest] = trimmedText.split('\n');
  const title = (firstLine.trim().replace(/^#+\s*/, '') || 'Synthèse de cours').slice(0, MAX_TITLE_LENGTH);
  // Si Gemini n'a pas suivi le format "titre, ligne vide, corps" (réponse sur
  // une seule ligne/un seul bloc), on garde le texte complet non tronqué comme
  // corps plutôt que le titre tronqué, pour ne perdre aucun contenu généré.
  const contentMd = rest.join('\n').trim() || trimmedText;

  return { title, contentMd };
}

function jsonResponse(body: unknown, status: number) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  });
}
