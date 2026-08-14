import type { GradeId, SeriesId } from '@/constants/grades';
import type { Lv2Id } from '@/constants/lv2';
import { supabase } from '@/lib/supabase';

export type GateProfile = {
  grade: GradeId | null;
  serie: SeriesId | null;
  lv2: Lv2Id | null;
};

// Single-row read of everything the onboarding gate needs, so resolving the
// gate is one round trip instead of the separate grade.ts/lv2.ts calls used
// elsewhere (settings.tsx, which changes one field at a time and keeps using those).
export async function getGateProfile(): Promise<GateProfile | null> {
  const { data, error } = await supabase.from('profiles').select('grade, serie, lv2').maybeSingle();

  if (error) {
    throw new Error(error.message);
  }
  if (!data) {
    return null;
  }
  return {
    grade: (data.grade as GradeId | null) ?? null,
    serie: (data.serie as SeriesId | null) ?? null,
    lv2: (data.lv2 as Lv2Id | null) ?? null,
  };
}
