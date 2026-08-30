import { useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export const FOCUS_SESSION_DURATIONS = [15, 25, 45, 60] as const;

export function useCompleteFocusSession() {
  const queryClient = useQueryClient();
  const { session } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (durationMinutes: number) => {
      const { data, error } = await supabase.rpc('complete_focus_session', {
        p_duration_minutes: durationMinutes,
      });
      if (error) throw error;
      const row = Array.isArray(data) ? data[0] : data;
      return row as { xp_awarded: number };
    },
    onSuccess: () => {
      if (!userId) return;
      queryClient.invalidateQueries({ queryKey: queryKeys.streak(userId) });
    },
  });
}
