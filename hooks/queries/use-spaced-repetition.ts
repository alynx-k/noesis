import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useAuth } from '@/context/auth';
import { getNextReviewDates, scheduleNextReview } from '@/lib/spaced-repetition';

export function useNextReviewDates(courseIds: string[]) {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.spacedRepetition.datesForCourses(user?.id, courseIds),
    queryFn: () => getNextReviewDates(courseIds),
    enabled: courseIds.length > 0,
  });
}

export function useScheduleNextReview() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: ({ courseId, accuracyRate }: { courseId: string; accuracyRate: number }) => {
      if (!user) throw new Error('Not authenticated');
      return scheduleNextReview(user.id, courseId, accuracyRate);
    },
    onSuccess: () => {
      // Broad invalidation: the exact next-review-dates query key includes
      // the full course-id list, which this hook doesn't know here — so
      // invalidate every query under that prefix rather than reconstruct it.
      queryClient.invalidateQueries({ queryKey: ['next-review-dates', user?.id] });
      queryClient.invalidateQueries({ queryKey: queryKeys.courseHistory.forUser(user?.id) });
    },
  });
}
