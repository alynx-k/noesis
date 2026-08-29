import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export function useCompletedLessonIds() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: queryKeys.progress(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase.from('lesson_progress').select('lesson_id').eq('user_id', userId);
      if (error) throw error;
      return new Set((data ?? []).map((row) => row.lesson_id as string));
    },
  });
}

type CompleteLessonResult = { already_completed: boolean; xp_awarded: number };

export function useCompleteLesson() {
  const queryClient = useQueryClient();
  const { session } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (lessonId: string) => {
      const { data, error } = await supabase.rpc('complete_lesson', { p_lesson_id: lessonId });
      if (error) throw error;
      // rpc renvoie un tableau (returns table)
      return (Array.isArray(data) ? data[0] : data) as CompleteLessonResult;
    },
    onSuccess: () => {
      if (!userId) return;
      queryClient.invalidateQueries({ queryKey: queryKeys.progress(userId) });
      queryClient.invalidateQueries({ queryKey: queryKeys.streak(userId) });
    },
  });
}
