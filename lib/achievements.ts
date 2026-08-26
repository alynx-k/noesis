import { supabase } from '@/lib/supabase';

export type UnlockedAchievement = {
  achievementId: string;
  unlockedAt: Date;
};

export async function getUnlockedAchievements(userId: string): Promise<UnlockedAchievement[]> {
  const { data, error } = await supabase.from('user_achievements').select('achievement_id, unlocked_at').eq('user_id', userId);

  if (error || !data) {
    console.error('Failed to load unlocked achievements:', error);
    return [];
  }

  return data.map((row) => ({
    achievementId: row.achievement_id as string,
    unlockedAt: new Date(row.unlocked_at as string),
  }));
}

// Client evaluates the catalog against real stats (see
// constants/achievements.ts) and calls this the moment a threshold is first
// met — permanent once granted, per the table's own design comment.
// ignoreDuplicates makes this safe to call again for an already-unlocked
// achievement (e.g. two screens noticing the same threshold at once).
export async function unlockAchievement(userId: string, achievementId: string): Promise<void> {
  const { error } = await supabase
    .from('user_achievements')
    .upsert({ user_id: userId, achievement_id: achievementId }, { onConflict: 'user_id,achievement_id', ignoreDuplicates: true });

  if (error) {
    console.error('Failed to unlock achievement:', error);
  }
}
