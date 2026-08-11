import type { GradeId, SeriesId } from '@/constants/grades';
import { supabase } from '@/lib/supabase';

export type GradeProfile = {
  grade: GradeId;
  serie: SeriesId | null;
  firstSelectedAt: Date;
  lastChangedAt: Date;
};

type ProfileRow = {
  grade: GradeId;
  serie: SeriesId | null;
  grade_first_selected_at: string;
  grade_last_changed_at: string;
};

function rowToProfile(row: ProfileRow): GradeProfile {
  return {
    grade: row.grade,
    serie: row.serie,
    firstSelectedAt: new Date(row.grade_first_selected_at),
    lastChangedAt: new Date(row.grade_last_changed_at),
  };
}

export async function getGradeProfile(): Promise<GradeProfile | null> {
  const { data, error } = await supabase
    .from('profiles')
    .select('grade, serie, grade_first_selected_at, grade_last_changed_at')
    .maybeSingle();

  if (error) {
    console.error('Failed to load grade profile:', error);
    return null;
  }
  if (!data) {
    return null;
  }
  return rowToProfile(data as ProfileRow);
}

export async function setInitialGrade(
  userId: string,
  grade: GradeId,
  serie: SeriesId | null = null,
): Promise<{ error: string | null }> {
  const now = new Date().toISOString();
  const { error } = await supabase.from('profiles').insert({
    user_id: userId,
    grade,
    serie,
    grade_first_selected_at: now,
    grade_last_changed_at: now,
  });

  if (error) {
    console.error('Failed to save initial grade:', error);
    return { error: "Impossible d'enregistrer ta classe, réessaie." };
  }
  return { error: null };
}

export type GradeChangeEligibility = {
  allowed: boolean;
  nextAllowedDate: Date | null;
};

// Grade changes are unrestricted — students can switch classes as often as
// they want. (An earlier version capped this to one change/month after an
// initial 48h free window; removed at the user's request so grades can be
// browsed freely.)
export function getGradeChangeEligibility(_profile: GradeProfile, _now: Date = new Date()): GradeChangeEligibility {
  return { allowed: true, nextAllowedDate: null };
}

export async function updateGrade(
  userId: string,
  grade: GradeId,
  serie: SeriesId | null = null,
): Promise<{ error: string | null }> {
  const { error } = await supabase
    .from('profiles')
    .update({ grade, serie, grade_last_changed_at: new Date().toISOString() })
    .eq('user_id', userId);

  if (error) {
    console.error('Failed to update grade:', error);
    return { error: 'Impossible de changer de classe, réessaie.' };
  }
  return { error: null };
}
