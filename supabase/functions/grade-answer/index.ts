import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

import { flattenCourseContent } from '../_shared/course-content.ts';

const ANTHROPIC_API_KEY = Deno.env.get('ANTHROPIC_API_KEY');
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;

type Verdict = 'correct' | 'partial' | 'incorrect';
type ErrorType = 'étourderie' | 'confusion' | 'méthode';

function parseGradingResponse(rawText: string): { verdict: Verdict; errorType: ErrorType | null } {
  const lines = rawText
    .trim()
    .split('\n')
    .map((line) => line.trim().toUpperCase());

  let verdict: Verdict = 'incorrect';
  let errorType: ErrorType | null = null;

  for (const line of lines) {
    if (line.startsWith('VERDICT')) {
      if (line.includes('PARTIEL')) {
        verdict = 'partial';
      } else if (line.includes('INCORRECT')) {
        verdict = 'incorrect';
      } else if (line.includes('CORRECT')) {
        verdict = 'correct';
      }
    }
    if (line.startsWith('ERREUR')) {
      if (line.includes('ETOURDERIE') || line.includes('ÉTOURDERIE')) {
        errorType = 'étourderie';
      } else if (line.includes('CONFUSION')) {
        errorType = 'confusion';
      } else if (line.includes('METHODE') || line.includes('MÉTHODE')) {
        errorType = 'méthode';
      }
    }
  }

  if (verdict === 'correct') {
    errorType = null;
  } else if (errorType === null) {
    // The model occasionally fails to pick one of the three categories for an
    // incorrect/partial answer (e.g. answers like "je ne sais pas"). Since a
    // non-correct verdict must always have an error type for the consecutive
    // failure counter to work, fall back to a reasonable default.
    errorType = 'méthode';
  }

  return { verdict, errorType };
}

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const { questionNumber, studentAnswer, courseId } = await req.json();

    if (
      typeof studentAnswer !== 'string' ||
      typeof courseId !== 'string' ||
      typeof questionNumber !== 'number' ||
      questionNumber < 1
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

    // 3 AI evaluations/day for the 'gratuit_limite' status (no free trial —
    // every account starts here; only 'premium' lifts it). This only counts
    // real exercise attempts: answer_attempts rows, one per grade-answer
    // call. The initial diagnostic (app/diagnostic.tsx) never calls this
    // function and never writes to answer_attempts, so it structurally
    // can't consume any of this quota.
    const { data: profile } = await supabaseClient
      .from('profiles')
      .select('access_status')
      .eq('user_id', user.id)
      .maybeSingle();

    if ((profile?.access_status ?? 'gratuit_limite') !== 'premium') {
      const startOfToday = new Date();
      startOfToday.setUTCHours(0, 0, 0, 0);

      const { count: attemptsToday, error: countError } = await supabaseClient
        .from('answer_attempts')
        .select('id', { count: 'exact', head: true })
        .eq('user_id', user.id)
        .gte('created_at', startOfToday.toISOString());

      if (!countError && (attemptsToday ?? 0) >= 3) {
        return new Response(
          JSON.stringify({
            limitReached: true,
            message:
              'Tu as atteint tes 3 évaluations gratuites du jour. Reviens demain, ou passe premium pour un accès illimité.',
          }),
          { headers: { 'Content-Type': 'application/json' } },
        );
      }
    }

    const { data: course, error: courseError } = await supabaseClient
      .from('courses')
      .select('grade, subject, content, exercise_questions')
      .eq('id', courseId)
      .single();

    const questions: unknown = course?.exercise_questions;
    const criteria =
      Array.isArray(questions) && questionNumber <= questions.length ? questions[questionNumber - 1] : undefined;
    const courseContent = course ? flattenCourseContent(course.content) : null;

    if (
      courseError ||
      !course ||
      !courseContent ||
      !criteria ||
      typeof criteria.question !== 'string' ||
      typeof criteria.expected !== 'string'
    ) {
      return new Response(JSON.stringify({ error: 'Invalid request' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const prompt = `Tu es un correcteur pour un cours de niveau ${course.grade} (système éducatif ivoirien).

Voici le cours de référence. Base-toi UNIQUEMENT sur ce cours et les éléments attendus ci-dessous pour juger la réponse, jamais sur d'autres connaissances externes :

"""
${courseContent}
"""

Question posée à l'élève : "${criteria.question}"

Ce qu'une bonne réponse doit contenir : ${criteria.expected}

Réponse de l'élève : "${studentAnswer}"

Juge cette réponse, puis réponds STRICTEMENT dans ce format, sur deux lignes, sans rien d'autre :
VERDICT: CORRECT ou PARTIEL ou INCORRECT
ERREUR: ETOURDERIE ou CONFUSION ou METHODE ou AUCUNE

Pour la ligne ERREUR (seulement si VERDICT n'est pas CORRECT) :
- ETOURDERIE : la personne semble connaître la réponse mais s'est trompée par inattention
- CONFUSION : elle mélange deux notions proches
- METHODE : elle n'a pas la bonne approche pour répondre à ce type de question
Si VERDICT est CORRECT, mets ERREUR: AUCUNE.`;

    const anthropicResponse = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        'x-api-key': ANTHROPIC_API_KEY ?? '',
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-sonnet-5',
        max_tokens: 50,
        messages: [{ role: 'user', content: prompt }],
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
    const textBlock = Array.isArray(data?.content) ? data.content.find((block: { type?: string }) => block.type === 'text') : undefined;
    const rawText = textBlock?.text ?? '';
    const { verdict, errorType } = parseGradingResponse(rawText);

    const { error: insertError } = await supabaseClient.from('answer_attempts').insert({
      user_id: user.id,
      course_id: courseId,
      question_number: questionNumber,
      error_type: errorType,
      verdict,
    });

    if (insertError) {
      console.error('Failed to save answer attempt:', insertError);
    }

    return new Response(JSON.stringify({ verdict }), {
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('grade-answer error:', error);
    return new Response(JSON.stringify({ error: 'Internal error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
