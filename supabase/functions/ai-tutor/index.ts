import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

import { flattenCourseContent } from '../_shared/course-content.ts';

const ANTHROPIC_API_KEY = Deno.env.get('ANTHROPIC_API_KEY');
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;

type ChatMessage = { role: 'user' | 'assistant'; content: string };
type ExerciseContext = { type: 'exercise'; courseId: string; questionNumber: number };
type FicheContext = { type: 'fiche'; deckId: string };
type TutorContext = ExerciseContext | FicheContext;

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
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const { messages, context } = await req.json();

    if (
      !Array.isArray(messages) ||
      messages.length === 0 ||
      messages.some(
        (message: unknown) =>
          typeof message !== 'object' ||
          message === null ||
          !('role' in message) ||
          !('content' in message) ||
          ((message as ChatMessage).role !== 'user' && (message as ChatMessage).role !== 'assistant') ||
          typeof (message as ChatMessage).content !== 'string',
      )
    ) {
      return new Response(JSON.stringify({ error: 'Invalid request' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
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
      return new Response(JSON.stringify({ error: 'Unauthorized' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' },
      });
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
        messages: (messages as ChatMessage[]).map((message) => ({ role: message.role, content: message.content })),
      }),
    });

    if (!anthropicResponse.ok) {
      const errorBody = await anthropicResponse.text();
      console.error('Anthropic API error:', anthropicResponse.status, errorBody);
      return new Response(JSON.stringify({ error: 'Anthropic API error' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
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
      return new Response(JSON.stringify({ error: 'Internal error' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    return new Response(JSON.stringify({ reply }), {
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('ai-tutor error:', error);
    return new Response(JSON.stringify({ error: 'Internal error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
