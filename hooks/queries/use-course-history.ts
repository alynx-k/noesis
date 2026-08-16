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
    // Extends the shared prefix with grade/serie — loadCourseHistory's
    // result depends on both, so without this, changing grade in Réglages
    // left this screen silently serving the previous grade's course list/
    // stats until some unrelated query happened to invalidate the
    // (grade/serie-less) key this used to be.
    queryKey: [...queryKeys.courseHistory.forUser(user?.id), grade, serie],
    queryFn: () => loadCourseHistory(grade as string, serie),
    enabled: !!grade,
  });
}
