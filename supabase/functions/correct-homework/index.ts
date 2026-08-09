import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

import { flattenCourseContent } from '../_shared/course-content.ts';

const ANTHROPIC_API_KEY = Deno.env.get('ANTHROPIC_API_KEY');
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;

const MAX_IMAGES = 5;

type ImageInput = { base64: string; mediaType: string };

function parseDataUrl(value: string): ImageInput | null {
  const match = value.match(/^data:(image\/[a-zA-Z+]+);base64,(.+)$/);
  if (match) {
    return { mediaType: match[1], base64: match[2] };
  }
  if (/^[A-Za-z0-9+/=]+$/.test(value.slice(0, 100))) {
    return { mediaType: 'image/jpeg', base64: value };
  }
  return null;
}

function extractText(data: unknown): string {
  const textBlock = Array.isArray((data as { content?: unknown })?.content)
    ? ((data as { content: { type?: string; text?: string }[] }).content.find((block) => block.type === 'text'))
    : undefined;
  return textBlock?.text ?? '';
}

function extractJson<T>(rawText: string): T | null {
  try {
    const jsonMatch = rawText.match(/\{[\s\S]*\}/);
    return JSON.parse(jsonMatch ? jsonMatch[0] : rawText) as T;
  } catch (parseError) {
    console.error('Failed to parse model JSON:', parseError, rawText);
    return null;
  }
}

async function callClaude(imageContent: Record<string, unknown>[], promptText: string, maxTokens: number) {
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
      messages: [{ role: 'user', content: [...imageContent, { type: 'text', text: promptText }] }],
    }),
  });

  if (!response.ok) {
    const errorBody = await response.text();
    console.error('Anthropic API error:', response.status, errorBody);
    return null;
  }

  return extractText(await response.json());
}

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const { images } = await req.json();

    if (!Array.isArray(images) || images.length === 0 || images.length > MAX_IMAGES) {
      return new Response(JSON.stringify({ error: 'Invalid request' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const parsedImages = images.map((image) => (typeof image === 'string' ? parseDataUrl(image) : null));
    if (parsedImages.some((image) => image === null)) {
      return new Response(JSON.stringify({ error: 'Invalid image data' }), {
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

    const { data: profile } = await supabaseClient
      .from('profiles')
      .select('access_status, grade')
      .eq('user_id', user.id)
      .maybeSingle();

    if ((profile?.access_status ?? 'gratuit_limite') !== 'premium') {
      const startOfToday = new Date();
      startOfToday.setUTCHours(0, 0, 0, 0);

      const { count: usedToday, error: countError } = await supabaseClient
        .from('ai_usage_log')
        .select('id', { count: 'exact', head: true })
        .eq('user_id', user.id)
        .eq('feature', 'correct_homework')
        .gte('created_at', startOfToday.toISOString());

      if (!countError && (usedToday ?? 0) >= 3) {
        return new Response(
          JSON.stringify({
            limitReached: true,
            message: 'Tu as atteint tes 3 corrections gratuites du jour. Reviens demain, ou passe premium pour un accès illimité.',
          }),
          { headers: { 'Content-Type': 'application/json' } },
        );
      }
    }

    if (!profile?.grade) {
      return new Response(JSON.stringify({ error: 'Missing grade' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const { data: candidateCourses } = await supabaseClient
      .from('courses')
      .select('id, subject, title')
      .eq('grade', profile.grade);

    if (!candidateCourses || candidateCourses.length === 0) {
      return new Response(JSON.stringify({ error: 'No courses for this grade' }), {
        status: 404,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const imageContent = (parsedImages as ImageInput[]).map((image) => ({
      type: 'image',
      source: { type: 'base64', media_type: image.mediaType, data: image.base64 },
    }));

    const catalogList = candidateCourses.map((c) => `${c.id} | ${c.subject} | ${c.title}`).join('\n');

    const matchRawText = await callClaude(
      imageContent,
      `Tu es un outil automatisé qui ne produit QUE du JSON. Voici une photo d'un devoir d'élève. Voici la liste des cours disponibles pour son niveau (format "id | matière | titre") :\n\n${catalogList}\n\nIdentifie le cours DE CETTE LISTE dont le sujet correspond le mieux au devoir photographié. Réponds uniquement avec ce JSON : {"courseId": "l'id exact tel qu'il apparaît dans la liste, ou null si aucun cours ne correspond clairement"}`,
      200,
    );

    const match = matchRawText ? extractJson<{ courseId: string | null }>(matchRawText) : null;
    const matchedCourseId = match?.courseId ?? null;
    const matchedCourse = matchedCourseId ? candidateCourses.find((c) => c.id === matchedCourseId) : undefined;

    if (!matchedCourse) {
      return new Response(JSON.stringify({ matched: false }), {
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const { data: generated, error: generateError } = await supabaseClient.functions.invoke('generate-course', {
      body: { courseId: matchedCourse.id },
    });

    if (generateError || !generated?.content) {
      console.error('Failed to ensure course content:', generateError);
      return new Response(JSON.stringify({ error: 'Failed to load course content' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const courseContent = flattenCourseContent(generated.content);
    if (!courseContent) {
      return new Response(JSON.stringify({ error: 'Course has no usable content' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const referenceExercises = Array.isArray(generated.exerciseQuestions)
      ? JSON.stringify(generated.exerciseQuestions)
      : '(aucun)';

    const correctionRawText = await callClaude(
      imageContent,
      `Tu es un correcteur pour un(e) élève ivoirien(ne) qui a photographié son devoir sur le cours "${matchedCourse.title}" (${matchedCourse.subject}).

Voici le cours de référence. Base-toi UNIQUEMENT sur ce cours pour corriger, jamais sur d'autres connaissances externes ; n'invente rien qui n'y figure pas :
"""
${courseContent}
"""

Exercices de référence connus pour ce cours (peuvent t'aider à comprendre le type de questions attendu, mais le devoir photographié peut être différent) :
${referenceExercises}

Lis le devoir sur la photo, identifie chaque question répondue par l'élève, et corrige-la en te basant uniquement sur le cours ci-dessus. Réponds UNIQUEMENT avec ce JSON, sans texte autour :
{
  "summary": "résumé global de la performance en 2-3 phrases, encourageant mais honnête",
  "items": [
    { "question": "la question telle que lue sur la photo", "studentAnswer": "la réponse de l'élève telle que lue", "verdict": "correct" ou "partiel" ou "incorrect", "feedback": "explication courte, basée sur le cours, de ce qui est juste ou à corriger" }
  ]
}
Si l'image est illisible ou ne contient pas de devoir exploitable, réponds avec {"summary": "Photo illisible, réessaie avec une photo plus nette.", "items": []}.`,
      1500,
    );

    const correction = correctionRawText
      ? extractJson<{ summary?: string; items?: unknown[] }>(correctionRawText)
      : null;

    if (!correction || typeof correction.summary !== 'string') {
      return new Response(JSON.stringify({ error: 'Correction failed' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const items = Array.isArray(correction.items)
      ? correction.items.filter(
          (item): item is { question: string; studentAnswer: string; verdict: string; feedback: string } =>
            !!item &&
            typeof (item as Record<string, unknown>).question === 'string' &&
            typeof (item as Record<string, unknown>).verdict === 'string',
        )
      : [];

    const { error: usageError } = await supabaseClient
      .from('ai_usage_log')
      .insert({ user_id: user.id, feature: 'correct_homework' });

    if (usageError) {
      console.error('Failed to log ai usage:', usageError);
    }

    return new Response(
      JSON.stringify({
        matched: true,
        courseId: matchedCourse.id,
        courseTitle: matchedCourse.title,
        summary: correction.summary,
        items,
      }),
      { headers: { 'Content-Type': 'application/json' } },
    );
  } catch (error) {
    console.error('correct-homework error:', error);
    return new Response(JSON.stringify({ error: 'Internal error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
