import { useQuery } from '@tanstack/react-query';

import { useAuth } from '@/context/auth';
import { useCoursesForGrade } from '@/hooks/queries/use-courses';
import { getRecentActivity } from '@/lib/activity';

export type RecentActivityEntry =
  | { type: 'course'; courseTitle: string; at: Date }
  | { type: 'focus'; durationMinutes: number; at: Date };

export function useRecentActivity() {
  const { user } = useAuth();
  const coursesQuery = useCoursesForGrade();

  const activityQuery = useQuery({
    queryKey: ['recent-activity', user?.id],
    queryFn: getRecentActivity,
    enabled: !!user,
  });

  const isPending = activityQuery.isPending || coursesQuery.isPending;
  if (isPending || !activityQuery.data) {
    return { data: undefined as RecentActivityEntry[] | undefined, isPending: true };
  }

  const titleById = new Map((coursesQuery.data ?? []).map((course) => [course.id, course.title]));

  const data: RecentActivityEntry[] = activityQuery.data.map((item) =>
    item.type === 'course'
      ? { type: 'course', courseTitle: titleById.get(item.courseId) ?? 'Leçon', at: item.at }
      : { type: 'focus', durationMinutes: item.durationMinutes, at: item.at },
  );

  return { data, isPending: false };
}
