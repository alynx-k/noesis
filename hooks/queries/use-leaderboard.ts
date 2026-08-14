import { useQuery } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { getLeaderboard } from '@/lib/leaderboard';

export function useLeaderboard() {
  return useQuery({
    queryKey: queryKeys.leaderboard.all(),
    queryFn: getLeaderboard,
  });
}
