import { supabase } from '@/lib/supabase';

export type LeagueTier =
  | 'bronze'
  | 'argent'
  | 'or'
  | 'platine'
  | 'diamant'
  | 'heroique'
  | 'maitre'
  | 'grand_maitre';

export type LeagueEntry = {
  userId: string;
  pseudonym: string;
  lessonsThisWeek: number;
  rank: number;
  isYou: boolean;
};

export type LeagueStanding = {
  tier: LeagueTier;
  weekStart: string;
  groupSize: number;
  promotionZone: boolean;
  relegationZone: boolean;
  entries: LeagueEntry[];
};

type LeagueRow = {
  member_user_id: string;
  pseudonym: string;
  lessons_this_week: number;
  rank: number;
  is_you: boolean;
  tier: LeagueTier;
  promotion_zone: boolean;
  relegation_zone: boolean;
  group_size: number;
  week_start: string;
};

// Backed by the get_my_league() security definer function (see
// supabase/migrations/20260828110000_leagues.sql) — same trust model as the
// old get_leaderboard(): RLS blocks any client-side cross-user read, so
// this RPC is the only path to seeing where you stand against your league.
// Ranks by lessons completed THIS WEEK (not lifetime totals), within a
// ~30-person group of the same grade and tier — resets every Monday.
export async function getMyLeague(): Promise<LeagueStanding | null> {
  const { data, error } = await supabase.rpc('get_my_league');

  if (error) {
    throw new Error(error.message);
  }
  const rows = (data as LeagueRow[] | null) ?? [];
  if (rows.length === 0) {
    return null;
  }

  const [first] = rows;
  return {
    tier: first.tier,
    weekStart: first.week_start,
    groupSize: first.group_size,
    promotionZone: rows.some((row) => row.is_you && row.promotion_zone),
    relegationZone: rows.some((row) => row.is_you && row.relegation_zone),
    entries: rows.map((row) => ({
      userId: row.member_user_id,
      pseudonym: row.pseudonym,
      lessonsThisWeek: row.lessons_this_week,
      rank: row.rank,
      isYou: row.is_you,
    })),
  };
}
