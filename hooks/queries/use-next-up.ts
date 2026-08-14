import { useQuery } from '@tanstack/react-query';

import { useProfile } from '@/hooks/queries/use-profile';
import { getNextUpCourse } from '@/lib/course-history';

export function useNextUpCourse() {
  const profileQuery = useProfile();
  const grade = profileQuery.data?.grade ?? null;
  const serie = profileQuery.data?.serie ?? null;

  return useQuery({
    queryKey: ['next-up-course', grade, serie],
    queryFn: () => getNextUpCourse(grade as string, serie),
    enabled: !!grade,
  });
}
