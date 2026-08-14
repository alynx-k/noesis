import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { GradeId, SeriesId } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { getGradeProfile, updateGrade } from '@/lib/grade';

export function useGradeProfile() {
  const { user } = useAuth();

  return useQuery({
    queryKey: ['grade-profile', user?.id],
    queryFn: getGradeProfile,
    enabled: !!user,
  });
}

export function useUpdateGrade() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: ({ grade, serie }: { grade: GradeId; serie: SeriesId | null }) => {
      if (!user) throw new Error('Not authenticated');
      return updateGrade(user.id, grade, serie);
    },
    onSuccess: (result) => {
      if (!result.error) {
        queryClient.invalidateQueries({ queryKey: ['grade-profile', user?.id] });
        // Keep the onboarding gate's profile cache in sync too, so a grade
        // change here doesn't leave the subject grid on Home showing the
        // old grade's courses until its own cache happens to go stale.
        queryClient.invalidateQueries({ queryKey: queryKeys.profile.forUser(user?.id) });
      }
    },
  });
}
