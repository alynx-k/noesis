import { startOfWeekIso } from '@/lib/objectives';
import { supabase } from '@/lib/supabase';

// A "quiz" is a completed practice test — the same real event already
// metered by prepare-homework's daily free-tier quota, distinct from
// finishing a course's own lesson content (lib/objectives.ts's weekly
// lessons target).
export const WEEKLY_QUIZ_TARGET = 10;
export const WEEKLY_QUIZ_BONUS_XP = 50;

export async function getQuizzesCompletedThisWeek(userId: string): Promise<number> {
  const { count, error } = await supabase
    .from('ai_usage_log')
    .select('id', { count: 'exact', head: true })
    .eq('user_id', userId)
    .eq('feature', 'prepare_homework')
    .gte('created_at', startOfWeekIso());

  if (error || count === null) {
    console.error('Failed to load quizzes completed this week:', error);
    return 0;
  }
  return count;
}

export type UserXp = { totalXp: number; lastWeeklyBonusWeek: string | null };

export async function getUserXp(userId: string): Promise<UserXp> {
  const { data, error } = await supabase
    .from('user_xp')
    .select('total_xp, last_weekly_bonus_week')
    .eq('user_id', userId)
    .maybeSingle();

  if (error) {
    console.error('Failed to load user xp:', error);
    return { totalXp: 0, lastWeeklyBonusWeek: null };
  }

  return {
    totalXp: (data?.total_xp as number | undefined) ?? 0,
    lastWeeklyBonusWeek: (data?.last_weekly_bonus_week as string | null | undefined) ?? null,
  };
}

// Unlock-on-detection, same shape as lib/achievements.ts: the caller checks
// the real weekly quiz count against WEEKLY_QUIZ_TARGET and only calls this
// the first time it's crossed for a given week. Reads the current total
// itself (rather than an atomic increment) since this fires at most once a
// week for a single user — not worth a database function for that.
export async function claimWeeklyQuizBonus(userId: string, currentXp: number, weekStart: string): Promise<void> {
  const { error } = await supabase.from('user_xp').upsert({
    user_id: userId,
    total_xp: currentXp + WEEKLY_QUIZ_BONUS_XP,
    last_weekly_bonus_week: weekStart,
  });

  if (error) {
    console.error('Failed to claim weekly quiz bonus:', error);
  }
}
