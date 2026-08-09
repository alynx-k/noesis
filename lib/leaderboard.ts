import { supabase } from '@/lib/supabase';

export type LeaderboardEntry = {
  rank: number;
  pseudonym: string;
  completedCount: number;
  isYou: boolean;
};

// Backed by the get_leaderboard() security definer function (see
// supabase/migrations/20260808010000_get_leaderboard.sql) — the client has
// no RLS-permitted way to read other users' progress directly, so this is
// the only path to a cross-user ranking.
export async function getLeaderboard(): Promise<LeaderboardEntry[]> {
  const { data, error } = await supabase.rpc('get_leaderboard');

  if (error || !data) {
    console.error('Failed to load leaderboard:', error);
    return [];
  }

  return (data as { rank: number; pseudonym: string; completed_count: number; is_you: boolean }[]).map((row) => ({
    rank: row.rank,
    pseudonym: row.pseudonym,
    completedCount: row.completed_count,
    isYou: row.is_you,
  }));
}
