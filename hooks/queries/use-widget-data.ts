import { useQuery } from '@tanstack/react-query';

import { useNextUpCourse } from '@/hooks/queries/use-next-up';
import { useAuth } from '@/context/auth';
import { refreshWidgetData } from '@/lib/home-widget';

export function useWidgetData() {
  const { user } = useAuth();
  const nextUpQuery = useNextUpCourse();
  const matiere = nextUpQuery.data?.courseTitle ?? 'tes cours';

  return useQuery({
    queryKey: ['widget-data', user?.id, matiere],
    queryFn: () => refreshWidgetData(matiere),
    enabled: !!user,
  });
}
