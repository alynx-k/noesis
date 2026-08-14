import { useQuery } from '@tanstack/react-query';

import { useAuth } from '@/context/auth';
import { getMonthOverview } from '@/lib/streak';

export function useMonthOverview(reference: Date = new Date()) {
  const { user } = useAuth();

  return useQuery({
    queryKey: ['month-overview', user?.id, reference.getFullYear(), reference.getMonth()],
    queryFn: () => getMonthOverview(reference),
    enabled: !!user,
  });
}
