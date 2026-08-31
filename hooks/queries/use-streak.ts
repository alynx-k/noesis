import { useQuery } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type Streak = {
  current_streak: number;
  longest_streak: number;
  last_active_date: string | null;
  freezes_available: number;
};

export function useStreak() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: queryKeys.streak(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('streaks')
        .select('current_streak, longest_streak, last_active_date, freezes_available')
        .eq('user_id', userId)
        .maybeSingle();
      if (error) throw error;
      return (data ?? { current_streak: 0, longest_streak: 0, last_active_date: null, freezes_available: 2 }) as Streak;
    },
  });
}
