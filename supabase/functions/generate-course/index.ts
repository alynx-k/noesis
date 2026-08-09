import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

const ANTHROPIC_API_KEY = Deno.env.get('ANTHROPIC_API_KEY');
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;

const GRADE_LABELS: Record<string, string> = {
  '6eme': '6ème',
  '5eme': '5ème',
  '4eme': '4ème',
  '3eme': '3ème',
  '2nde': '2nde',
  '1ere': '1ère',
  terminale: 'Terminale',
};

const SUBJECT_LABELS: Record<string, string> = {
  histoire: 'Histoire',
  geographie: 'Géographie',
  mathematiques: 'Mathématiques',
  anglais: 'Anglais',
  francais: 'Français',
  edhc: 'EDHC',
  'physique-chimie': 'Physique-Chimie',
  svt: 'SVT',
  espagnol: 'Espagnol',
  allemand: 'Allemand',
};

function buildPrompt(gradeLabel: string, subjectLabel: string, title: string, previousTitle: string | null): string {
  const context = previousTitle
    ? `Ce cours suit directement, dans la progression du programme, un cours intitulé "${previousTitle}" — évite de répéter ce qui y est déjà expliqué en détail, mais tu peux t'appuyer dessus.`
    : "C'est le premier cours de cette partie du programme.";

  return `Tu es un outil automatisé qui ne produit QUE du JSON, jamais de texte conversationnel.

Rédige un cours de ${subjectLabel} de niveau ${gradeLabel} (système éducatif ivoirien), sur le sujet exact suivant, tel qu'il apparaît au programme officiel : "${title}".

${context}

Le cours doit être un contenu 100% ORIGINAL que tu rédiges toi-même à partir de tes connaissances générales sur le sujet — jamais une copie ou une paraphrase proche d'un manuel scolaire existant. Adopte un ton direct, concret, qui parle à un(e) élève ivoirien(ne) : commence par une question ou un fait accrocheur, développe ensuite l'explication avec des faits précis (dates, chiffres, noms propres quand c'est pertinent), et termine par un paragraphe qui commence par "Et si on te le demande précisément à l'examen :" donnant la définition ou le résumé exact à retenir.

Réponds UNIQUEMENT avec un objet JSON valide, sans balises markdown, exactement au format :
{
  "paragraphs": ["paragraphe 1", "paragraphe 2", "..."],
  "exerciseQuestions": [
    { "question": "...", "hint": "...", "expected": "..." }
  ]
}

Règles :
- "paragraphs" : 5 à 6 paragraphes, chacun 3 à 6 phrases.
- "exerciseQuestions" : exactement 4 questions qui testent la compréhension du cours, de la plus simple (définition) à la plus exigeante (explication, exemple). Pour chacune :
  - "question" : la question posée à l'élève.
  - "hint" : un indice qui renvoie vers un passage du cours ("Relis le passage sur...", "Relis la toute fin du cours...") sans donner la réponse.
  - "expected" : ce qu'une bonne réponse doit contenir, formulé pour qu'un correcteur automatique puisse juger une réponse libre de l'élève.
- N'invente aucune fausse date ni fausse statistique : si tu n'es pas certain d'un détail précis, reste sur des explications générales plutôt que d'inventer un chiffre.`;
}

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const { courseId } = await req.json();

    if (typeof courseId !== 'string' || !courseId) {
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

    // Service-role client: course content is shared curriculum, not
    // per-user data, so writing it needs to bypass the read-only RLS
    // policy regular users have on this table.
    const serviceClient = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

    const { data: course, error: courseError } = await serviceClient
      .from('courses')
      .select('id, grade, subject, title, requires_course_id, content, exercise_questions')
      .eq('id', courseId)
      .single();

    if (courseError || !course) {
      return new Response(JSON.stringify({ error: 'Course not found' }), {
        status: 404,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    if (course.content && course.exercise_questions) {
      return new Response(JSON.stringify({ id: course.id, content: course.content, exerciseQuestions: course.exercise_questions }), {
        headers: { 'Content-Type': 'application/json' },
      });
    }

    let previousTitle: string | null = null;
    if (course.requires_course_id) {
      const { data: previous } = await serviceClient
        .from('courses')
        .select('title')
        .eq('id', course.requires_course_id)
        .single();
      previousTitle = previous?.title ?? null;
    }

    const gradeLabel = GRADE_LABELS[course.grade] ?? course.grade;
    const subjectLabel = SUBJECT_LABELS[course.subject] ?? course.subject;
    const prompt = buildPrompt(gradeLabel, subjectLabel, course.title, previousTitle);

    const anthropicResponse = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        'x-api-key': ANTHROPIC_API_KEY ?? '',
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-sonnet-5',
        max_tokens: 4000,
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

    let parsed: { paragraphs?: string[]; exerciseQuestions?: { question: string; hint: string; expected: string }[] };
    try {
      const jsonMatch = rawText.match(/\{[\s\S]*\}/);
      parsed = JSON.parse(jsonMatch ? jsonMatch[0] : rawText);
    } catch (parseError) {
      console.error('Failed to parse model output:', parseError, rawText);
      return new Response(JSON.stringify({ error: 'Generation failed' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const paragraphs = Array.isArray(parsed.paragraphs) ? parsed.paragraphs.filter((p) => typeof p === 'string') : [];
    const exerciseQuestions = Array.isArray(parsed.exerciseQuestions)
      ? parsed.exerciseQuestions.filter(
          (q) => q && typeof q.question === 'string' && typeof q.hint === 'string' && typeof q.expected === 'string',
        )
      : [];

    if (paragraphs.length === 0 || exerciseQuestions.length === 0) {
      return new Response(JSON.stringify({ error: 'Generation produced no usable content' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const content = { paragraphs };

    const { error: updateError } = await serviceClient
      .from('courses')
      .update({ content, exercise_questions: exerciseQuestions, content_generated_at: new Date().toISOString() })
      .eq('id', courseId);

    if (updateError) {
      console.error('Failed to save generated course:', updateError);
      return new Response(JSON.stringify({ error: 'Failed to save course' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    return new Response(JSON.stringify({ id: courseId, content, exerciseQuestions }), {
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('generate-course error:', error);
    return new Response(JSON.stringify({ error: 'Internal error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
