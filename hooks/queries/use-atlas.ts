import { useQuery } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useAuth } from '@/context/auth';
import { getAtlasOverview } from '@/lib/atlas';
import { getLaunches } from '@/lib/focus-session';

export function useAtlasOverview() {
  const { user } = useAuth();

  return useQuery({
    queryKey: ['atlas-overview', user?.id],
    queryFn: getAtlasOverview,
    enabled: !!user,
  });
}

export function useLaunches() {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.focusSessions.all(user?.id),
    queryFn: getLaunches,
    enabled: !!user,
  });
}
