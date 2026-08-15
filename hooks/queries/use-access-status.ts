import { useQuery } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useAuth } from '@/context/auth';
import { getAccessStatus } from '@/lib/subscription';

export function useAccessStatus() {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.accessStatus.forUser(user?.id),
    queryFn: getAccessStatus,
    enabled: !!user,
  });
}
