import { supabase } from '@/lib/supabase';

export type PracticeQuestion = {
  courseId: string;
  courseTitle: string;
  question: string;
  hint: string;
  expected: string;
};

export type PracticeResultItem = { question: string; verdict: string; feedback: string };
export type StudyPlanEntry = { courseId: string; courseTitle: string };

export async function buildPracticeTest(courseIds: string[]): Promise<{ questions: PracticeQuestion[] } | { error: string }> {
  const { data, error } = await supabase.functions.invoke('prepare-homework', {
    body: { mode: 'build', courseIds },
  });

  if (error || !Array.isArray(data?.questions) || data.questions.length === 0) {
    console.error('Failed to build practice test:', error, data);
    return { error: data?.error ?? 'Impossible de préparer le test, réessaie.' };
  }

  return { questions: data.questions };
}

export async function gradePracticeTest(
  questions: PracticeQuestion[],
  answers: string[],
): Promise<
  | { status: 'graded'; score: string; items: PracticeResultItem[]; studyPlan: StudyPlanEntry[] }
  | { status: 'limitReached'; message: string }
  | { status: 'error'; message: string }
> {
  const { data, error } = await supabase.functions.invoke('prepare-homework', {
    body: { mode: 'grade', questions, answers },
  });

  if (error) {
    console.error('Failed to grade practice test:', error, data);
    return { status: 'error', message: 'Impossible de corriger le test, réessaie.' };
  }
  if (data?.limitReached) {
    return { status: 'limitReached', message: data.message ?? 'Limite atteinte.' };
  }
  if (!data?.score) {
    return { status: 'error', message: data?.error ?? 'Impossible de corriger le test, réessaie.' };
  }

  return { status: 'graded', score: data.score, items: data.items ?? [], studyPlan: data.studyPlan ?? [] };
}
