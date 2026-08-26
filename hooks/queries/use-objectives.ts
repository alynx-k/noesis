import { useQuery } from '@tanstack/react-query';

import { useAuth } from '@/context/auth';
import { useCourseHistory } from '@/hooks/queries/use-course-history';
import { useStreak } from '@/hooks/queries/use-streak';
import { buildObjectives, getLessonsCompletedThisWeek, Objective } from '@/lib/objectives';

export function useObjectives(): { data: Objective[] | undefined; isPending: boolean } {
  const { user } = useAuth();
  const streakQuery = useStreak();
  const historyQuery = useCourseHistory();

  const weeklyLessonsQuery = useQuery({
    queryKey: ['lessons-completed-this-week', user?.id],
    queryFn: () => getLessonsCompletedThisWeek(user!.id),
    enabled: !!user,
  });

  const attemptedEntries = (historyQuery.data ?? []).flatMap((section) => section.courses).filter((entry) => entry.total > 0);
  const averageScore =
    attemptedEntries.length > 0
      ? Math.round(attemptedEntries.reduce((sum, entry) => sum + entry.goodPercentage, 0) / attemptedEntries.length)
      : null;

  const isPending = streakQuery.isPending || historyQuery.isPending || weeklyLessonsQuery.isPending;

  return {
    isPending,
    data: isPending
      ? undefined
      : buildObjectives({
          lessonsThisWeek: weeklyLessonsQuery.data ?? 0,
          streak: streakQuery.data?.streak ?? 0,
          averageScore,
        }),
  };
}
