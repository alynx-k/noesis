// Edge function : tuteur IA sur photo de devoir — deux modes :
//   - correct  : corrige un devoir manuscrit déjà fait par l'élève
//   - prepare  : guide la préparation d'un énoncé de devoir (pas la réponse directe)
// Photo illisible ou hors-sujet -> { illegible: true }, sans coûter d'essai.
// Premium = illimité ; gratuit = AI_FREE_TRIAL_LIMIT essais partagés avec
// ai-tutor-chat (profiles.ai_trials_used).
//
// Requiert les secrets Supabase :
//   GEMINI_API_KEY   — clé API Google AI Studio / Gemini
//   GEMINI_MODEL     — optionnel, défaut "gemini-3.6-flash"
//
// Appel : POST avec un JWT élève en Authorization, body JSON :
//   { mode: 'correct' | 'prepare', imageBase64: string, mimeType?: string }

import { createClient } from 'jsr:@supabase/supabase-js@2';
import { corsHeaders } from '../_shared/cors.ts';
import { AI_FREE_TRIAL_LIMIT, checkAiQuota, consumeTrial } from '../_shared/ai-trials.ts';

const GEMINI_MODEL = Deno.env.get('GEMINI_MODEL') ?? 'gemini-3.6-flash';
const ILLEGIBLE_MARKER = 'ILLISIBLE';

type RequestBody = {
  mode: 'correct' | 'prepare';
  imageBase64: string;
  mimeType?: string;
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
    if (body.mode !== 'correct' && body.mode !== 'prepare') {
      return jsonResponse({ error: 'mode doit être "correct" ou "prepare".' }, 400);
    }
    if (!body.imageBase64) {
      return jsonResponse({ error: 'imageBase64 est requis.' }, 400);
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

    const reply = await callGeminiVision({
      apiKey: geminiApiKey,
      mode: body.mode,
      grade: profile.grade,
      serie: profile.serie,
      imageBase64: body.imageBase64,
      mimeType: body.mimeType ?? 'image/jpeg',
    });

    if (reply.trim().toUpperCase().startsWith(ILLEGIBLE_MARKER)) {
      // Ne coûte pas d'essai : ce n'est pas une aide réellement délivrée (US-35).
      return jsonResponse({ illegible: true, trialsRemaining: isPremium ? null : Math.max(0, AI_FREE_TRIAL_LIMIT - trialsUsed) }, 200);
    }

    const trialsRemaining = isPremium ? null : await consumeTrial(adminClient, user.id, trialsUsed);

    return jsonResponse({ illegible: false, result: reply, trialsRemaining }, 200);
  } catch (err) {
    return jsonResponse({ error: err instanceof Error ? err.message : 'Erreur inconnue' }, 500);
  }
});

async function callGeminiVision(params: {
  apiKey: string;
  mode: 'correct' | 'prepare';
  grade: string;
  serie: string | null;
  imageBase64: string;
  mimeType: string;
}): Promise<string> {
  const { apiKey, mode, grade, serie, imageBase64, mimeType } = params;

  const classeDesc = `${grade}${serie ? ` (série ${serie})` : ''}`;
  const prompt =
    mode === 'correct'
      ? `Tu es un tuteur qui corrige le devoir manuscrit d'un(e) élève de ${classeDesc} en Côte d'Ivoire (programme officiel ivoirien).
Voici une photo de son devoir déjà rempli. Pour chaque réponse : dis si elle est juste ou fausse, explique pourquoi, et donne la bonne réponse en cas d'erreur. Sois concret et structuré. Réponds en français.
Si la photo ne contient aucun texte lisible du tout (page blanche, image totalement floue ou noire), réponds uniquement par le mot "${ILLEGIBLE_MARKER}" (rien d'autre).`
      : `Tu es un tuteur qui aide un(e) élève de ${classeDesc} en Côte d'Ivoire (programme officiel ivoirien) à préparer un devoir.
Voici une photo de l'énoncé du devoir (pas encore fait). Guide l'élève étape par étape : rappelle les notions nécessaires, pose des questions, donne des pistes de méthode — mais ne donne jamais la réponse finale toute faite. Réponds en français.
Si la photo ne contient aucun texte lisible du tout (page blanche, image totalement floue ou noire), réponds uniquement par le mot "${ILLEGIBLE_MARKER}" (rien d'autre).`;

  const response = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/${GEMINI_MODEL}:generateContent?key=${apiKey}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents: [
          {
            role: 'user',
            parts: [{ text: prompt }, { inlineData: { mimeType, data: imageBase64 } }],
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
