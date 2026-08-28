import { useQuery } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { getMyLeague } from '@/lib/league';

export function useMyLeague() {
  return useQuery({
    queryKey: queryKeys.league.mine(),
    queryFn: getMyLeague,
  });
}
