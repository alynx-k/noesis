import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

import { flattenCourseContent } from '../_shared/course-content.ts';

const ANTHROPIC_API_KEY = Deno.env.get('ANTHROPIC_API_KEY');
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;

type ChatContentPart = { type: 'text'; text: string } | { type: 'image'; image: string };
type ChatMessage = { role: 'user' | 'assistant'; content: string | ChatContentPart[] };
type ExerciseContext = { type: 'exercise'; courseId: string; questionNumber: number };
type FicheContext = { type: 'fiche'; deckId: string };
type TutorContext = ExerciseContext | FicheContext;

const MAX_IMAGES_PER_MESSAGE = 1;

function parseImageDataUrl(value: string): { mediaType: string; base64: string } | null {
  const match = value.match(/^data:(image\/[a-zA-Z+]+);base64,(.+)$/);
  return match ? { mediaType: match[1], base64: match[2] } : null;
}

function isValidContentPart(part: unknown): part is ChatContentPart {
  if (typeof part !== 'object' || part === null) {
    return false;
  }
  const p = part as Record<string, unknown>;
  if (p.type === 'text') {
    return typeof p.text === 'string';
  }
  if (p.type === 'image') {
    return typeof p.image === 'string' && parseImageDataUrl(p.image) !== null;
  }
  return false;
}

function isValidMessage(message: unknown): message is ChatMessage {
  if (typeof message !== 'object' || message === null) {
    return false;
  }
  const m = message as Record<string, unknown>;
  if (m.role !== 'user' && m.role !== 'assistant') {
    return false;
  }
  if (typeof m.content === 'string') {
    return true;
  }
  if (Array.isArray(m.content)) {
    const imageCount = m.content.filter((part) => (part as Record<string, unknown>)?.type === 'image').length;
    return imageCount <= MAX_IMAGES_PER_MESSAGE && m.content.every(isValidContentPart);
  }
  return false;
}

// Without these, the browser's CORS preflight (OPTIONS) gets no
// Access-Control-Allow-* headers back and the actual POST never gets sent —
// supabase-js surfaces that as a generic "Failed to send a request" with no
// HTTP status, easy to mistake for a real network outage. Native (iOS/
// Android) callers never hit this since CORS is a browser-only mechanism,
// which is why this only shows up testing the chat through Expo web.
const CORS_HEADERS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
};

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json', ...CORS_HEADERS },
  });
}

function toAnthropicContent(content: string | ChatContentPart[]): string | Record<string, unknown>[] {
  if (typeof content === 'string') {
    return content;
  }
  return content.map((part) => {
    if (part.type === 'text') {
      return { type: 'text', text: part.text };
    }
    const parsed = parseImageDataUrl(part.image)!;
    return { type: 'image', source: { type: 'base64', media_type: parsed.mediaType, data: parsed.base64 } };
  });
}

// Kept short on purpose: this is a chat, not an essay — every reply costs
// tokens, and a wall of text reads as robotic rather than like a tutor
// actually talking to a student.
const STYLE_INSTRUCTIONS =
  "Réponds en 2 à 4 phrases maximum, jamais plus. Parle comme une vraie personne à l'oral — direct, naturel, un peu familier — jamais comme une notice ou un manuel. Pas de listes à puces, pas de formules toutes faites du genre « il est important de noter que ». Va droit au but.";

const GENERAL_SYSTEM_PROMPT = `Tu es un tuteur particulier pour un élève du système éducatif ivoirien. Réponds toujours en français, de façon encourageante, adaptée au niveau collège/lycée. ${STYLE_INSTRUCTIONS} Si la question sort du cadre scolaire, réponds vite puis ramène gentiment la conversation vers les révisions.`;

async function buildSystemPrompt(
  supabaseClient: ReturnType<typeof createClient>,
  context: TutorContext | undefined,
): Promise<string> {
  if (!context) {
    return GENERAL_SYSTEM_PROMPT;
  }

  if (context.type === 'exercise') {
    const { data: course, error } = await supabaseClient
      .from('courses')
      .select('grade, content, exercise_questions')
      .eq('id', context.courseId)
      .single();

    const questions: unknown = course?.exercise_questions;
    const criteria =
      Array.isArray(questions) && context.questionNumber <= questions.length
        ? questions[context.questionNumber - 1]
        : undefined;
    const courseContent = course ? flattenCourseContent(course.content) : null;

    if (error || !course || !courseContent || !criteria) {
      return GENERAL_SYSTEM_PROMPT;
    }

    return `Tu es un tuteur particulier qui aide un élève de niveau ${course.grade} (système éducatif ivoirien) à comprendre une question d'exercice, sans jamais donner directement la réponse complète attendue — aide-le à la trouver lui-même, par des explications et des indices. ${STYLE_INSTRUCTIONS}

Voici le cours de référence. Base tes explications UNIQUEMENT sur ce cours, jamais sur d'autres connaissances externes :

"""
${courseContent}
"""

Question sur laquelle l'élève bloque : "${criteria.question}"`;
  }

  const { data: deck, error } = await supabaseClient
    .from('flashcard_decks')
    .select('title, fiche')
    .eq('id', context.deckId)
    .single();

  const fiche: unknown = deck?.fiche;

  if (error || !deck || !fiche || typeof fiche !== 'object') {
    return GENERAL_SYSTEM_PROMPT;
  }

  return `Tu es un tuteur particulier qui aide un élève du système éducatif ivoirien à réviser à partir d'une fiche de révision intitulée "${deck.title}". ${STYLE_INSTRUCTIONS}

Voici le contenu de la fiche. Base tes explications UNIQUEMENT sur ce contenu, jamais sur d'autres connaissances externes :

"""
${JSON.stringify(fiche)}
"""`;
}

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, { headers: CORS_HEADERS });
  }

  if (req.method !== 'POST') {
    return jsonResponse({ error: 'Method not allowed' }, 405);
  }

  try {
    const { messages, context } = await req.json();

    if (!Array.isArray(messages) || messages.length === 0 || messages.some((message) => !isValidMessage(message))) {
      return jsonResponse({ error: 'Invalid request' }, 400);
    }

    const authHeader = req.headers.get('Authorization') ?? '';
    const supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
      global: { headers: { Authorization: authHeader } },
    });

    const {
      data: { user },
      error: userError,
    } = await supabaseClient.auth.getUser();

    if (userError || !user) {
      return jsonResponse({ error: 'Unauthorized' }, 401);
    }

    const systemPrompt = await buildSystemPrompt(supabaseClient, context as TutorContext | undefined);

    const anthropicResponse = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        'x-api-key': ANTHROPIC_API_KEY ?? '',
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-sonnet-5',
        max_tokens: 300,
        system: systemPrompt,
        messages: (messages as ChatMessage[]).map((message) => ({
          role: message.role,
          content: toAnthropicContent(message.content),
        })),
      }),
    });

    if (!anthropicResponse.ok) {
      const errorBody = await anthropicResponse.text();
      console.error('Anthropic API error:', anthropicResponse.status, errorBody);
      return jsonResponse({ error: 'Anthropic API error' }, 502);
    }

    const data = await anthropicResponse.json();
    // content[0] isn't reliably the text block — the model sometimes emits a
    // leading `thinking` block first, which has no `.text`.
    const textBlock = Array.isArray(data?.content)
      ? data.content.find((block: { type?: string }) => block.type === 'text')
      : undefined;
    const reply = textBlock?.text ?? '';

    if (!reply) {
      console.error('ai-tutor: no text block in Anthropic response', data);
      return jsonResponse({ error: 'Internal error' }, 500);
    }

    return jsonResponse({ reply });
  } catch (error) {
    console.error('ai-tutor error:', error);
    return jsonResponse({ error: 'Internal error' }, 500);
  }
});
