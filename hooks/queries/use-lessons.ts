import { useQuery } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { queryKeys } from './query-keys';

// Grâce aux policies RLS, cette requête ne renvoie déjà que le contenu publié
// correspondant à la classe/série de l'élève connecté.
export type LessonSummary = {
  id: string;
  subject_id: string;
  title: string;
  chapter_order: number;
};

export function useVisibleLessons() {
  return useQuery({
    queryKey: ['lessons', 'visible'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('lessons')
        .select('id, subject_id, title, chapter_order')
        .order('chapter_order');
      if (error) throw error;
      return data as LessonSummary[];
    },
  });
}

export function useLessonsForSubject(subjectId: string | undefined) {
  return useQuery({
    queryKey: queryKeys.lessons(subjectId ?? ''),
    enabled: !!subjectId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('lessons')
        .select('id, subject_id, title, chapter_order')
        .eq('subject_id', subjectId)
        .order('chapter_order');
      if (error) throw error;
      return data as LessonSummary[];
    },
  });
}

export type Lesson = LessonSummary & {
  content_md: string;
};

export function useLesson(lessonId: string | undefined) {
  return useQuery({
    queryKey: queryKeys.lesson(lessonId ?? ''),
    enabled: !!lessonId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('lessons')
        .select('id, subject_id, title, chapter_order, content_md')
        .eq('id', lessonId)
        .single();
      if (error) throw error;
      return data as Lesson;
    },
  });
}
