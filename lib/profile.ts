import type { User } from '@supabase/supabase-js';

import type { GradeId, SeriesId } from '@/constants/grades';
import type { Lv2Id } from '@/constants/lv2';
import { supabase } from '@/lib/supabase';

// Prefers the prénom captured at signup (stored in Supabase Auth's
// user_metadata, not the profiles table — it needs to exist before any
// profile row does, since the profile row is only created later during
// grade onboarding). Falls back to a capitalized version of the email's
// local part for accounts created before this existed, or signed in via
// Google/Apple (no prénom prompt on that path).
export function getDisplayName(user: User | null | undefined): string {
  const prenom = typeof user?.user_metadata?.prenom === 'string' ? user.user_metadata.prenom.trim() : '';
  if (prenom) {
    return prenom;
  }
  const email = user?.email;
  if (!email) {
    return '';
  }
  const local = email.split('@')[0];
  return local.charAt(0).toUpperCase() + local.slice(1);
}

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
