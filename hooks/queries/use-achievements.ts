import { useQuery, useQueryClient } from '@tanstack/react-query';
import { useEffect } from 'react';

import { ACHIEVEMENTS, Achievement } from '@/constants/achievements';
import { useAuth } from '@/context/auth';
import { useProgress } from '@/context/progress';
import { useCourseHistory } from '@/hooks/queries/use-course-history';
import { useSuccessfulSessionCount } from '@/hooks/queries/use-atlas';
import { useStreak } from '@/hooks/queries/use-streak';
import { getUnlockedAchievements, unlockAchievement } from '@/lib/achievements';

export type AchievementStatus = {
  achievement: Achievement;
  unlocked: boolean;
  unlockedAt: Date | null;
};

export function useAchievements(): { data: AchievementStatus[] | undefined; isPending: boolean } {
  const { user } = useAuth();
  const queryClient = useQueryClient();
  const { completedCourseIds } = useProgress();
  const streakQuery = useStreak();
  const historyQuery = useCourseHistory();
  const sessionCountQuery = useSuccessfulSessionCount();

  const unlockedQuery = useQuery({
    queryKey: ['user-achievements', user?.id],
    queryFn: () => getUnlockedAchievements(user!.id),
    enabled: !!user,
  });

  const attemptedEntries = (historyQuery.data ?? []).flatMap((section) => section.courses).filter((entry) => entry.total > 0);
  const averageScore =
    attemptedEntries.length > 0
      ? Math.round(attemptedEntries.reduce((sum, entry) => sum + entry.goodPercentage, 0) / attemptedEntries.length)
      : null;
  const streak = streakQuery.data?.streak ?? 0;
  const successfulSessions = sessionCountQuery.data ?? 0;
  const completedLessons = completedCourseIds.length;

  const statsReady = !streakQuery.isPending && !historyQuery.isPending && !sessionCountQuery.isPending;

  // Unlock-on-detection: the first time a real threshold is crossed, write
  // the row (permanent from then on) rather than requiring every mutation
  // site across the app to know about every achievement.
  useEffect(() => {
    if (!user || !statsReady || !unlockedQuery.data) {
      return;
    }
    const unlockedIds = new Set(unlockedQuery.data.map((a) => a.achievementId));
    const stats = { completedLessons, streak, averageScore, successfulSessions };
    const newlyUnlocked = ACHIEVEMENTS.filter((achievement) => !unlockedIds.has(achievement.id) && achievement.isUnlocked(stats));

    if (newlyUnlocked.length === 0) {
      return;
    }
    Promise.all(newlyUnlocked.map((achievement) => unlockAchievement(user.id, achievement.id))).then(() => {
      queryClient.invalidateQueries({ queryKey: ['user-achievements', user.id] });
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user, statsReady, unlockedQuery.data, completedLessons, streak, averageScore, successfulSessions]);

  const isPending = !statsReady || unlockedQuery.isPending;

  if (isPending) {
    return { data: undefined, isPending: true };
  }

  const unlockedMap = new Map((unlockedQuery.data ?? []).map((a) => [a.achievementId, a.unlockedAt]));

  return {
    isPending: false,
    data: ACHIEVEMENTS.map((achievement) => ({
      achievement,
      unlocked: unlockedMap.has(achievement.id),
      unlockedAt: unlockedMap.get(achievement.id) ?? null,
    })),
  };
}
