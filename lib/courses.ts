import { supabase } from '@/lib/supabase';

export type CourseSummary = {
  id: string;
  grade: string;
  subject: string;
  title: string;
  orderIndex: number;
  requiresCourseId: string | null;
};

export type ExerciseQuestion = {
  question: string;
  hint: string;
  expected: string;
};

// "Propriété"/"Définition" callout box within a section.
export type CourseHighlightBox = { label: string; text: string };
export type CourseExample = { statement: string; solution: string };
// Term/definition table (e.g. an English lesson's vocabulary list) — same
// shape as flashcards' FicheTable, rendered by components/data-table.tsx.
export type CourseTable = { headers: string[]; rows: string[][] };
// In-line "exercice de fixation" — its correction is revealed on tap rather
// than shown immediately, same interaction as the hint-reveal in exercise.tsx.
export type CourseFixation = { question: string; solution: string };

// Geometric figures are redrawn from scratch (own coordinates) rather than
// reproduced from any source image — see components/geometry-diagram.tsx.
export type CourseDiagram = {
  viewBox: [number, number];
  points: { x: number; y: number; label?: string }[];
  segments: [number, number][];
  dashedSegments?: [number, number][];
  rightAngleAt?: number[];
  circle?: { cx: number; cy: number; r: number } | null;
};

export type CourseSection = {
  heading: string;
  body: string;
  highlights: string[];
  table?: CourseTable | null;
  property?: CourseHighlightBox | null;
  example?: CourseExample | null;
  fixation?: CourseFixation | null;
  diagram?: CourseDiagram | null;
};

// The richer, source-grounded shape (situation d'apprentissage → sections →
// situation d'évaluation) used for courses rewritten from an official
// programme document. Older/not-yet-rewritten courses still store the flat
// { paragraphs } shape produced by generate-course — CourseContent covers
// both, and callers must check which one they got (see 'sections' in content
// in app/course/[id].tsx).
export type CourseContentV2 = {
  situation: { text: string };
  sections: CourseSection[];
  evaluation: { scenario: string; questions: string[] } | null;
};

export type CourseContent = CourseContentV2 | { paragraphs: string[] };

export type CourseDetail = {
  id: string;
  title: string;
  content: CourseContent;
  exerciseQuestions: ExerciseQuestion[];
};

export async function getExerciseQuestions(courseId: string): Promise<ExerciseQuestion[]> {
  const { data, error } = await supabase.from('courses').select('exercise_questions').eq('id', courseId).single();

  if (error || !data?.exercise_questions) {
    console.error('Failed to load exercise questions:', error);
    return [];
  }

  return data.exercise_questions as ExerciseQuestion[];
}

export async function getCourseTitle(courseId: string): Promise<string> {
  const { data, error } = await supabase.from('courses').select('title').eq('id', courseId).single();

  if (error || !data?.title) {
    console.error('Failed to load course title:', error);
    return '';
  }

  return data.title as string;
}

export async function getCoursesForGrade(grade: string): Promise<CourseSummary[]> {
  const { data, error } = await supabase
    .from('courses')
    .select('id, grade, subject, title, order_index, requires_course_id')
    .eq('grade', grade)
    .order('subject', { ascending: true })
    .order('order_index', { ascending: true });

  if (error || !data) {
    console.error('Failed to load courses for grade:', error);
    return [];
  }

  return data.map((row) => ({
    id: row.id as string,
    grade: row.grade as string,
    subject: row.subject as string,
    title: row.title as string,
    orderIndex: row.order_index as number,
    requiresCourseId: row.requires_course_id as string | null,
  }));
}

// Fetches the course, generating its content on the fly (via the
// generate-course edge function) the first time anyone opens it. Every
// student after that gets the cached result straight from the table.
export async function getOrGenerateCourse(courseId: string): Promise<CourseDetail | { error: string }> {
  const { data: existing, error: fetchError } = await supabase
    .from('courses')
    .select('id, title, content, exercise_questions')
    .eq('id', courseId)
    .single();

  if (fetchError || !existing) {
    console.error('Failed to load course:', fetchError);
    return { error: "Ce cours n'existe pas." };
  }

  if (existing.content && existing.exercise_questions) {
    return {
      id: existing.id as string,
      title: existing.title as string,
      content: existing.content as CourseContent,
      exerciseQuestions: existing.exercise_questions as ExerciseQuestion[],
    };
  }

  const { data, error } = await supabase.functions.invoke('generate-course', {
    body: { courseId },
  });

  if (error || !data?.content?.paragraphs) {
    console.error('Failed to generate course:', error, data);
    return { error: data?.error ?? 'Impossible de générer ce cours, réessaie.' };
  }

  return {
    id: existing.id as string,
    title: existing.title as string,
    content: data.content as CourseContent,
    exerciseQuestions: data.exerciseQuestions as ExerciseQuestion[],
  };
}
