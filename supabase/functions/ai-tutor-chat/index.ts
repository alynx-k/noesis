// Edge function : chat avec le tuteur IA (Gemini), historique multi-tour.
// Premium = illimité ; gratuit = AI_FREE_TRIAL_LIMIT messages à vie
// (profiles.ai_trials_used), puis erreur 403 invitant à passer Premium.
//
// Requiert les secrets Supabase :
//   GEMINI_API_KEY   — clé API Google AI Studio / Gemini
//   GEMINI_MODEL     — optionnel, défaut "gemini-2.5-flash"
//
// Appel : POST avec un JWT élève en Authorization, body JSON :
//   { conversationId?: string, message: string }

import { createClient } from 'jsr:@supabase/supabase-js@2';
import { corsHeaders } from '../_shared/cors.ts';

const GEMINI_MODEL = Deno.env.get('GEMINI_MODEL') ?? 'gemini-3.6-flash';
export const AI_FREE_TRIAL_LIMIT = 3;

type RequestBody = {
  conversationId?: string;
  message: string;
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

    // Client scopé à l'appelant : vérifie son identité/statut Premium sans élever ses privilèges.
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

    const { data: isPremium, error: premiumError } = await callerClient.rpc('is_premium');
    if (premiumError) {
      return jsonResponse({ error: premiumError.message }, 500);
    }

    const body = (await req.json()) as RequestBody;
    if (!body.message || !body.message.trim()) {
      return jsonResponse({ error: 'message est requis.' }, 400);
    }

    // Client service_role : lit/écrit les conversations indépendamment des policies RLS élève.
    const adminClient = createClient(supabaseUrl, serviceRoleKey);

    const { data: profile, error: profileError } = await adminClient
      .from('profiles')
      .select('grade, serie, ai_trials_used')
      .eq('id', user.id)
      .single();
    if (profileError || !profile) {
      return jsonResponse({ error: 'Profil introuvable.' }, 400);
    }

    if (!isPremium && profile.ai_trials_used >= AI_FREE_TRIAL_LIMIT) {
      return jsonResponse(
        { error: 'Limite d\'essais gratuits atteinte. Passe Premium pour continuer.', trialsRemaining: 0 },
        403
      );
    }

    // Résout ou crée la conversation.
    let conversationId = body.conversationId;
    if (conversationId) {
      const { data: existing, error: convError } = await adminClient
        .from('ai_conversations')
        .select('id, user_id')
        .eq('id', conversationId)
        .single();
      if (convError || !existing || existing.user_id !== user.id) {
        return jsonResponse({ error: 'Conversation introuvable.' }, 404);
      }
    } else {
      const title = body.message.trim().slice(0, 40) + (body.message.trim().length > 40 ? '…' : '');
      const { data: created, error: createError } = await adminClient
        .from('ai_conversations')
        .insert({ user_id: user.id, title })
        .select('id')
        .single();
      if (createError || !created) {
        return jsonResponse({ error: createError?.message ?? 'Impossible de créer la conversation.' }, 500);
      }
      conversationId = created.id;
    }

    const { error: userMsgError } = await adminClient
      .from('ai_messages')
      .insert({ conversation_id: conversationId, role: 'user', content: body.message.trim() });
    if (userMsgError) {
      return jsonResponse({ error: userMsgError.message }, 500);
    }

    const { data: history, error: historyError } = await adminClient
      .from('ai_messages')
      .select('role, content')
      .eq('conversation_id', conversationId)
      .order('created_at');
    if (historyError || !history) {
      return jsonResponse({ error: historyError?.message ?? 'Historique introuvable.' }, 500);
    }

    const reply = await callGemini({
      apiKey: geminiApiKey,
      grade: profile.grade,
      serie: profile.serie,
      history,
    });

    const { error: replyError } = await adminClient
      .from('ai_messages')
      .insert({ conversation_id: conversationId, role: 'assistant', content: reply });
    if (replyError) {
      return jsonResponse({ error: replyError.message }, 500);
    }

    await adminClient.from('ai_conversations').update({ updated_at: new Date().toISOString() }).eq('id', conversationId);

    let trialsRemaining: number | null = null;
    if (!isPremium) {
      const nextUsed = profile.ai_trials_used + 1;
      await adminClient.from('profiles').update({ ai_trials_used: nextUsed }).eq('id', user.id);
      trialsRemaining = Math.max(0, AI_FREE_TRIAL_LIMIT - nextUsed);
    }

    return jsonResponse({ conversationId, reply, trialsRemaining }, 200);
  } catch (err) {
    return jsonResponse({ error: err instanceof Error ? err.message : 'Erreur inconnue' }, 500);
  }
});

async function callGemini(params: {
  apiKey: string;
  grade: string;
  serie: string | null;
  history: { role: string; content: string }[];
}): Promise<string> {
  const { apiKey, grade, serie, history } = params;

  const systemInstruction = `Tu es un tuteur pédagogique pour un(e) élève de ${grade}${serie ? ` (série ${serie})` : ''} en Côte d'Ivoire, qui suit le programme officiel ivoirien.
Explique clairement et adapte ton niveau de langage à cette classe. Encourage la compréhension : guide l'élève vers la réponse plutôt que de la donner brute quand c'est un exercice ou un devoir. Réponds en français, de façon concise et structurée.`;

  const contents = history.map((m) => ({
    role: m.role === 'assistant' ? 'model' : 'user',
    parts: [{ text: m.content }],
  }));

  const response = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/${GEMINI_MODEL}:generateContent?key=${apiKey}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        systemInstruction: { parts: [{ text: systemInstruction }] },
        contents,
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
