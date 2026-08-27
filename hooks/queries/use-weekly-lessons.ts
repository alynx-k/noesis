import { useQuery } from '@tanstack/react-query';

import { useAuth } from '@/context/auth';
import { getLessonsCompletedThisWeek } from '@/lib/objectives';

// Same query key as use-objectives.ts's internal fetch, so the two share a
// cache entry when both are on screen instead of double-fetching.
export function useWeeklyLessonsCompleted() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ['lessons-completed-this-week', user?.id],
    queryFn: () => getLessonsCompletedThisWeek(user!.id),
    enabled: !!user,
  });
}
