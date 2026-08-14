import { useQuery } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { CONTENT_STALE_TIME } from '@/lib/query-client';
import { CourseDetail, getCoursesForGrade, getOrGenerateCourse } from '@/lib/courses';
import { useProfile } from '@/hooks/queries/use-profile';

export function useCoursesForGrade() {
  const profileQuery = useProfile();
  const grade = profileQuery.data?.grade ?? null;
  const serie = profileQuery.data?.serie ?? null;

  return useQuery({
    queryKey: queryKeys.courses.forGrade(grade, serie),
    queryFn: () => getCoursesForGrade(grade as string, serie),
    enabled: !!grade,
  });
}

async function fetchCourseDetail(courseId: string): Promise<CourseDetail> {
  const result = await getOrGenerateCourse(courseId);
  if ('error' in result) {
    throw new Error(result.error);
  }
  return result;
}

export function useCourseDetail(courseId: string) {
  return useQuery({
    queryKey: queryKeys.courses.detail(courseId),
    queryFn: () => fetchCourseDetail(courseId),
    // Content is immutable once generated — no need to ever refetch a
    // successfully-loaded course in the background.
    staleTime: CONTENT_STALE_TIME,
    enabled: !!courseId,
  });
}
