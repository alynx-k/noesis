import { useMutation, useQueryClient } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { GradeId, SeriesId } from '@/constants/grades';
import { Lv2Id } from '@/constants/lv2';
import type { NiveauWaitlistId } from '@/constants/onboarding';
import { useAuth } from '@/context/auth';
import { setInitialGrade } from '@/lib/grade';
import { setLv2 } from '@/lib/lv2';
import { completeOnboarding, joinNiveauWaitlist, OnboardingAnswers, uploadAvatar } from '@/lib/onboarding';

export function useSetInitialGrade() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: ({ grade, serie }: { grade: GradeId; serie: SeriesId | null }) => {
      if (!user) throw new Error('Not authenticated');
      return setInitialGrade(user.id, grade, serie);
    },
    onSuccess: (result) => {
      if (!result.error) {
        queryClient.invalidateQueries({ queryKey: queryKeys.profile.forUser(user?.id) });
      }
    },
  });
}

export function useCompleteOnboarding() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: async (answers: Omit<OnboardingAnswers, 'avatarUrl'> & { avatarLocalUri: string | null }) => {
      if (!user) throw new Error('Not authenticated');
      const avatarUrl = answers.avatarLocalUri ? await uploadAvatar(user.id, answers.avatarLocalUri) : null;
      return completeOnboarding(user.id, { ...answers, avatarUrl });
    },
    onSuccess: (result) => {
      if (!result.error) {
        queryClient.invalidateQueries({ queryKey: queryKeys.profile.forUser(user?.id) });
      }
    },
  });
}

export function useJoinNiveauWaitlist() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: (tier: NiveauWaitlistId) => {
      if (!user) throw new Error('Not authenticated');
      return joinNiveauWaitlist(user.id, tier);
    },
    onSuccess: (result) => {
      if (!result.error) {
        queryClient.invalidateQueries({ queryKey: queryKeys.profile.forUser(user?.id) });
      }
    },
  });
}

export function useSetLv2() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: (lv2: Lv2Id) => {
      if (!user) throw new Error('Not authenticated');
      return setLv2(user.id, lv2);
    },
    onSuccess: (result) => {
      if (!result.error) {
        queryClient.invalidateQueries({ queryKey: queryKeys.profile.forUser(user?.id) });
      }
    },
  });
}
