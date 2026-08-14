import { useQuery } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useProfile } from '@/hooks/queries/use-profile';
import { useAuth } from '@/context/auth';
import { loadCourseHistory } from '@/lib/course-history';

export function useCourseHistory() {
  const { user } = useAuth();
  const profileQuery = useProfile();
  const grade = profileQuery.data?.grade ?? null;
  const serie = profileQuery.data?.serie ?? null;

  return useQuery({
    queryKey: queryKeys.courseHistory.forUser(user?.id),
    queryFn: () => loadCourseHistory(grade as string, serie),
    enabled: !!grade,
  });
}
