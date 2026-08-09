import { supabase } from '@/lib/supabase';

export type HomeworkCorrectionItem = {
  question: string;
  studentAnswer: string;
  verdict: string;
  feedback: string;
};

export type HomeworkCorrectionResult =
  | { status: 'matched'; courseId: string; courseTitle: string; summary: string; items: HomeworkCorrectionItem[] }
  | { status: 'unmatched' }
  | { status: 'limitReached'; message: string }
  | { status: 'error'; message: string };

export async function correctHomework(images: string[]): Promise<HomeworkCorrectionResult> {
  const { data, error } = await supabase.functions.invoke('correct-homework', { body: { images } });

  if (error) {
    console.error('Failed to correct homework:', error, data);
    return { status: 'error', message: 'Impossible de corriger le devoir, réessaie.' };
  }
  if (data?.limitReached) {
    return { status: 'limitReached', message: data.message ?? 'Limite atteinte.' };
  }
  if (data?.matched === false) {
    return { status: 'unmatched' };
  }
  if (data?.error || !data?.matched) {
    return { status: 'error', message: 'Impossible de corriger le devoir, réessaie.' };
  }

  return {
    status: 'matched',
    courseId: data.courseId,
    courseTitle: data.courseTitle,
    summary: data.summary,
    items: Array.isArray(data.items) ? data.items : [],
  };
}
