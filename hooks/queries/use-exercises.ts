import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type ExerciseOption = { id: string; text: string };

export type Exercise = {
  id: string;
  lesson_id: string;
  question_md: string;
  options: ExerciseOption[];
  sort_order: number;
};

export function useExercises(lessonId: string | undefined) {
  return useQuery({
    queryKey: queryKeys.exercises(lessonId ?? ''),
    enabled: !!lessonId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('exercises')
        .select('id, lesson_id, question_md, options, sort_order')
        .eq('lesson_id', lessonId)
        .order('sort_order');
      if (error) throw error;
      return data as Exercise[];
    },
  });
}

export type ExerciseAttempt = { selected_option_id: string; is_correct: boolean };

export function useExerciseProgress() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: queryKeys.exerciseProgress(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('exercise_progress')
        .select('exercise_id, selected_option_id, is_correct')
        .eq('user_id', userId);
      if (error) throw error;
      const map = new Map<string, ExerciseAttempt>();
      for (const row of data ?? []) {
        map.set(row.exercise_id as string, {
          selected_option_id: row.selected_option_id as string,
          is_correct: row.is_correct as boolean,
        });
      }
      return map;
    },
  });
}

export type SubmitExerciseResult = {
  already_completed: boolean;
  is_correct: boolean;
  correct_option_id: string;
  explanation_md: string;
  xp_awarded: number;
};

export function useSubmitExercise() {
  const queryClient = useQueryClient();
  const { session } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (params: { exerciseId: string; selectedOptionId: string }) => {
      const { data, error } = await supabase.rpc('submit_exercise_attempt', {
        p_exercise_id: params.exerciseId,
        p_selected_option_id: params.selectedOptionId,
      });
      if (error) throw error;
      return (Array.isArray(data) ? data[0] : data) as SubmitExerciseResult;
    },
    onSuccess: () => {
      if (!userId) return;
      queryClient.invalidateQueries({ queryKey: queryKeys.exerciseProgress(userId) });
      queryClient.invalidateQueries({ queryKey: queryKeys.streak(userId) });
    },
  });
}
