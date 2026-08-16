import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

import { flattenCourseContent } from '../_shared/course-content.ts';

const ANTHROPIC_API_KEY = Deno.env.get('ANTHROPIC_API_KEY');
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;

const MAX_COURSES = 6;
const TARGET_QUESTION_COUNT = 6;

type PracticeQuestion = { courseId: string; courseTitle: string; question: string; hint: string; expected: string };

function extractText(data: unknown): string {
  const textBlock = Array.isArray((data as { content?: unknown })?.content)
    ? (data as { content: { type?: string; text?: string }[] }).content.find((block) => block.type === 'text')
    : undefined;
  return textBlock?.text ?? '';
}

function extractJson<T>(rawText: string): T | null {
  try {
    const jsonMatch = rawText.match(/[[{][\s\S]*[\]}]/);
    return JSON.parse(jsonMatch ? jsonMatch[0] : rawText) as T;
  } catch (parseError) {
    console.error('Failed to parse model JSON:', parseError, rawText);
    return null;
  }
}

async function callClaude(promptText: string, maxTokens: number): Promise<string> {
  const response = await fetch('https://api.anthropic.com/v1/messages', {
    method: 'POST',
    headers: {
      'content-type': 'application/json',
      'x-api-key': ANTHROPIC_API_KEY ?? '',
      'anthropic-version': '2023-06-01',
    },
    body: JSON.stringify({
      model: 'claude-sonnet-5',
      max_tokens: maxTokens,
      messages: [{ role: 'user', content: promptText }],
    }),
  });

  if (!response.ok) {
    const errorBody = await response.text();
    console.error('Anthropic API error:', response.status, errorBody);
    return '';
  }

  return extractText(await response.json());
}

// Shared by both modes at the call site below — the free-tier quota is "3
// tests/day", and a test is generated once (mode: 'build') then graded once
// (mode: 'grade') in the normal client flow, so this must be checked and
// consumed exactly once per test, not once per mode. It's charged at build
// time: that's the step that was previously completely unmetered (a free
// account could tap "Générer le test" unlimited times without ever
// finishing one and never be counted or blocked), and it's also the more
// expensive step (it can additionally invoke generate-course per course).
async function checkAndConsumeQuota(
  supabaseClient: ReturnType<typeof createClient>,
  userId: string,
): Promise<{ allowed: true } | { allowed: false; message: string }> {
  const { data: profile } = await supabaseClient
    .from('profiles')
    .select('access_status')
    .eq('user_id', userId)
    .maybeSingle();

  if ((profile?.access_status ?? 'gratuit_limite') === 'premium') {
    return { allowed: true };
  }

  const startOfToday = new Date();
  startOfToday.setUTCHours(0, 0, 0, 0);

  const { count: usedToday, error: countError } = await supabaseClient
    .from('ai_usage_log')
    .select('id', { count: 'exact', head: true })
    .eq('user_id', userId)
    .eq('feature', 'prepare_homework')
    .gte('created_at', startOfToday.toISOString());

  if (!countError && (usedToday ?? 0) >= 3) {
    return {
      allowed: false,
      message: 'Tu as atteint tes 3 tests gratuits du jour. Reviens demain, ou passe premium pour un accès illimité.',
    };
  }

  return { allowed: true };
}

async function buildQuestionSet(
  supabaseClient: ReturnType<typeof createClient>,
  courseIds: string[],
): Promise<{ questions: PracticeQuestion[] } | { error: string }> {
  const { data: courses } = await supabaseClient
    .from('courses')
    .select('id, subject, title, content, exercise_questions')
    .in('id', courseIds);

  if (!courses || courses.length === 0) {
    return { error: 'Courses not found' };
  }

  const pool: PracticeQuestion[] = [];
  const contentByCourse = new Map<string, { title: string; content: string }>();

  for (const course of courses) {
    let content = course.content;
    let exerciseQuestions = course.exercise_questions;

    if (!content || !exerciseQuestions) {
      const { data: generated, error: generateError } = await supabaseClient.functions.invoke('generate-course', {
        body: { courseId: course.id },
      });
      if (generateError || !generated?.content) {
        console.error('Failed to ensure course content:', course.id, generateError);
        continue;
      }
      content = generated.content;
      exerciseQuestions = generated.exerciseQuestions;
    }

    const flat = flattenCourseContent(content);
    if (flat) {
      contentByCourse.set(course.id, { title: course.title as string, content: flat });
    }

    if (Array.isArray(exerciseQuestions)) {
      for (const q of exerciseQuestions as { question?: unknown; hint?: unknown; expected?: unknown }[]) {
        if (typeof q.question === 'string' && typeof q.hint === 'string' && typeof q.expected === 'string') {
          pool.push({ courseId: course.id as string, courseTitle: course.title as string, question: q.question, hint: q.hint, expected: q.expected });
        }
      }
    }
  }

  if (pool.length < TARGET_QUESTION_COUNT && contentByCourse.size > 0) {
    const combined = Array.from(contentByCourse.entries())
      .map(([id, { title, content }]) => `### Cours "${title}" (id: ${id})\n${content}`)
      .join('\n\n');

    const missing = TARGET_QUESTION_COUNT - pool.length;
    const rawText = await callClaude(
      `Tu es un outil automatisé qui ne produit QUE du JSON. Voici plusieurs cours du système éducatif ivoirien :\n\n${combined}\n\nRédige ${missing} questions d'exercice ORIGINALES (jamais copiées d'un manuel), qui testent la compréhension de ces cours, réparties entre les différents cours ci-dessus. Réponds UNIQUEMENT avec ce JSON :\n[{ "courseId": "l'id exact du cours concerné", "question": "...", "hint": "un indice qui renvoie au cours sans donner la réponse", "expected": "ce qu'une bonne réponse doit contenir, formulé pour un correcteur automatique" }]`,
      2000,
    );
    const extra = rawText ? extractJson<{ courseId?: string; question?: string; hint?: string; expected?: string }[]>(rawText) : null;
    if (Array.isArray(extra)) {
      for (const q of extra) {
        if (q.courseId && contentByCourse.has(q.courseId) && q.question && q.hint && q.expected) {
          pool.push({
            courseId: q.courseId,
            courseTitle: contentByCourse.get(q.courseId)!.title,
            question: q.question,
            hint: q.hint,
            expected: q.expected,
          });
        }
      }
    }
  }

  if (pool.length === 0) {
    return { error: 'Could not build a practice test' };
  }

  return { questions: pool.slice(0, Math.max(TARGET_QUESTION_COUNT, pool.length >= TARGET_QUESTION_COUNT ? TARGET_QUESTION_COUNT : pool.length)) };
}

async function gradeQuestionSet(
  supabaseClient: ReturnType<typeof createClient>,
  questions: PracticeQuestion[],
  answers: string[],
): Promise<{ verdicts: string[]; feedback: string[] } | { error: string }> {
  const { data: courses } = await supabaseClient
    .from('courses')
    .select('id, content')
    .in('id', Array.from(new Set(questions.map((q) => q.courseId))));

  const contentById = new Map<string, string>();
  for (const course of courses ?? []) {
    const flat = flattenCourseContent(course.content);
    if (flat) {
      contentById.set(course.id as string, flat);
    }
  }

  const items = questions
    .map((q, index) => {
      const content = contentById.get(q.courseId) ?? '(cours non disponible)';
      return `Question ${index + 1} (cours "${q.courseTitle}") :
Cours de référence : """${content}"""
Question : "${q.question}"
Ce qu'une bonne réponse doit contenir : ${q.expected}
Réponse de l'élève : "${answers[index] ?? ''}"`;
    })
    .join('\n\n');

  const rawText = await callClaude(
    `Tu es un correcteur pour un(e) élève ivoirien(ne). Corrige chaque question ci-dessous en te basant UNIQUEMENT sur le cours de référence donné pour cette question, jamais sur d'autres connaissances externes.\n\n${items}\n\nRéponds UNIQUEMENT avec ce JSON, une entrée par question dans le même ordre :\n[{ "verdict": "correct" ou "partiel" ou "incorrect", "feedback": "explication courte basée sur le cours" }]`,
    2500,
  );

  const parsed = rawText ? extractJson<{ verdict?: string; feedback?: string }[]>(rawText) : null;
  if (!Array.isArray(parsed) || parsed.length !== questions.length) {
    return { error: 'Grading failed' };
  }

  return {
    verdicts: parsed.map((p) => (typeof p.verdict === 'string' ? p.verdict : 'incorrect')),
    feedback: parsed.map((p) => (typeof p.feedback === 'string' ? p.feedback : '')),
  };
}

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const body = await req.json();
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

    if (body?.mode === 'build') {
      const courseIds = Array.isArray(body.courseIds) ? body.courseIds.slice(0, MAX_COURSES) : [];
      if (courseIds.length === 0) {
        return new Response(JSON.stringify({ error: 'Invalid request' }), {
          status: 400,
          headers: { 'Content-Type': 'application/json' },
        });
      }

      const quota = await checkAndConsumeQuota(supabaseClient, user.id);
      if (!quota.allowed) {
        return new Response(JSON.stringify({ limitReached: true, message: quota.message }), {
          headers: { 'Content-Type': 'application/json' },
        });
      }

      const result = await buildQuestionSet(supabaseClient, courseIds);
      if ('error' in result) {
        return new Response(JSON.stringify({ error: result.error }), {
          status: 502,
          headers: { 'Content-Type': 'application/json' },
        });
      }

      const { error: usageError } = await supabaseClient
        .from('ai_usage_log')
        .insert({ user_id: user.id, feature: 'prepare_homework' });
      if (usageError) {
        console.error('Failed to log ai usage:', usageError);
      }

      return new Response(JSON.stringify({ questions: result.questions }), {
        headers: { 'Content-Type': 'application/json' },
      });
    }

    if (body?.mode === 'grade') {
      const questions = Array.isArray(body.questions) ? (body.questions as PracticeQuestion[]) : [];
      const answers = Array.isArray(body.answers) ? (body.answers as string[]) : [];

      if (questions.length === 0 || answers.length !== questions.length) {
        return new Response(JSON.stringify({ error: 'Invalid request' }), {
          status: 400,
          headers: { 'Content-Type': 'application/json' },
        });
      }

      // No quota check here — the test this is grading was already charged
      // one unit of the 3/day quota when it was built (mode: 'build', see
      // checkAndConsumeQuota). Checking again here would silently halve the
      // advertised "3 tests/day" to 1.5 (one unit for the build, a second
      // for the grade of that same test).
      const result = await gradeQuestionSet(supabaseClient, questions, answers);
      if ('error' in result) {
        return new Response(JSON.stringify({ error: result.error }), {
          status: 502,
          headers: { 'Content-Type': 'application/json' },
        });
      }

      const correctCount = result.verdicts.filter((v) => v.toLowerCase().startsWith('correct')).length;

      // Grounded programmatically, not by the model: a course is on the
      // study plan if any of its questions weren't answered correctly —
      // never an invented recommendation.
      const weakCourseIds = new Set(
        questions.filter((_, index) => !result.verdicts[index]?.toLowerCase().startsWith('correct')).map((q) => q.courseId),
      );
      const studyPlan = Array.from(weakCourseIds).map((courseId) => ({
        courseId,
        courseTitle: questions.find((q) => q.courseId === courseId)!.courseTitle,
      }));

      return new Response(
        JSON.stringify({
          score: `${correctCount}/${questions.length}`,
          items: questions.map((q, index) => ({
            question: q.question,
            verdict: result.verdicts[index],
            feedback: result.feedback[index],
          })),
          studyPlan,
        }),
        { headers: { 'Content-Type': 'application/json' } },
      );
    }

    return new Response(JSON.stringify({ error: 'Invalid mode' }), {
      status: 400,
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('prepare-homework error:', error);
    return new Response(JSON.stringify({ error: 'Internal error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
