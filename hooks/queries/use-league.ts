import { useQuery } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type LeagueRow = {
  rank: number;
  xp: number;
  is_me: boolean;
  tier: number;
  week_start: string;
};

export function useMyLeagueBoard() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: queryKeys.leagueBoard(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase.rpc('get_my_league_board');
      if (error) throw error;
      return (data ?? []) as LeagueRow[];
    },
  });
}
