import { useQuery } from '@tanstack/react-query';

import { useNextUpCourse } from '@/hooks/queries/use-next-up';
import { useAuth } from '@/context/auth';
import { refreshWidgetData } from '@/lib/home-widget';
import { getDisplayName } from '@/lib/profile';

export function useWidgetData() {
  const { user } = useAuth();
  const nextUpQuery = useNextUpCourse();
  const matiere = nextUpQuery.data?.courseTitle ?? 'tes cours';
  const prenom = getDisplayName(user);

  return useQuery({
    queryKey: ['widget-data', user?.id, matiere],
    queryFn: () => refreshWidgetData(matiere, prenom),
    enabled: !!user,
  });
}
