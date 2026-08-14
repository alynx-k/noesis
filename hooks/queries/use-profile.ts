import { useQuery, useQueryClient } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useAuth } from '@/context/auth';
import { getGateProfile } from '@/lib/profile';

export function useProfile() {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.profile.forUser(user?.id),
    queryFn: getGateProfile,
    enabled: !!user,
  });
}

export function useInvalidateProfile() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return () => queryClient.invalidateQueries({ queryKey: queryKeys.profile.forUser(user?.id) });
}
