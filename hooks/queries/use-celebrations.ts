import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type PendingCelebration = {
  event_type: 'league_promotion' | 'streak_milestone';
  event_key: string;
  tier: number | null;
  streak_days: number | null;
};

export function usePendingCelebrations() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: queryKeys.pendingCelebrations(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase.rpc('get_pending_celebrations');
      if (error) throw error;
      return (data ?? []) as PendingCelebration[];
    },
  });
}

export function useMarkCelebrationSeen() {
  const queryClient = useQueryClient();
  const { session } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (celebration: Pick<PendingCelebration, 'event_type' | 'event_key'>) => {
      const { error } = await supabase.rpc('mark_celebration_seen', {
        p_event_type: celebration.event_type,
        p_event_key: celebration.event_key,
      });
      if (error) throw error;
    },
    onSuccess: () => {
      if (!userId) return;
      queryClient.invalidateQueries({ queryKey: queryKeys.pendingCelebrations(userId) });
    },
  });
}
