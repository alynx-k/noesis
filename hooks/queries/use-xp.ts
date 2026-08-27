import { useQuery, useQueryClient } from '@tanstack/react-query';
import { useEffect } from 'react';

import { useAuth } from '@/context/auth';
import { startOfWeekIso } from '@/lib/objectives';
import { claimWeeklyQuizBonus, getQuizzesCompletedThisWeek, getUserXp, WEEKLY_QUIZ_TARGET } from '@/lib/xp';

export function useWeeklyQuizChallenge() {
  const { user } = useAuth();
  const queryClient = useQueryClient();
  const weekStart = startOfWeekIso().slice(0, 10);

  const quizCountQuery = useQuery({
    queryKey: ['weekly-quiz-count', user?.id, weekStart],
    queryFn: () => getQuizzesCompletedThisWeek(user!.id),
    enabled: !!user,
  });
  const xpQuery = useQuery({
    queryKey: ['user-xp', user?.id],
    queryFn: () => getUserXp(user!.id),
    enabled: !!user,
  });

  const quizCount = quizCountQuery.data ?? 0;
  const totalXp = xpQuery.data?.totalXp ?? 0;
  const statsReady = !quizCountQuery.isPending && !xpQuery.isPending;
  const alreadyClaimedThisWeek = xpQuery.data?.lastWeeklyBonusWeek === weekStart;

  useEffect(() => {
    if (!user || !statsReady || quizCount < WEEKLY_QUIZ_TARGET || alreadyClaimedThisWeek) {
      return;
    }
    claimWeeklyQuizBonus(user.id, totalXp, weekStart).then(() => {
      queryClient.invalidateQueries({ queryKey: ['user-xp', user.id] });
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user, statsReady, quizCount, alreadyClaimedThisWeek, weekStart]);

  return {
    quizCount: Math.min(quizCount, WEEKLY_QUIZ_TARGET),
    target: WEEKLY_QUIZ_TARGET,
    isPending: !statsReady,
  };
}
