import type { GradeId, SeriesId } from '@/constants/grades';
import type { Lv2Id } from '@/constants/lv2';
import type { DailyTimeId, MotivationId, NiveauWaitlistId } from '@/constants/onboarding';
import { supabase } from '@/lib/supabase';

export type OnboardingAnswers = {
  grade: GradeId;
  serie: SeriesId | null;
  lv2: Lv2Id | null;
  motivations: MotivationId[];
  dailyTime: DailyTimeId | null;
  city: string | null;
  avatarUrl: string | null;
};

// Single commit at the end of the flow (see app/onboarding/pret.tsx) rather
// than one write per screen — everything up to that point lives in
// OnboardingContext's local state, so a student who abandons partway
// through never leaves a half-set profile row behind.
export async function completeOnboarding(
  userId: string,
  answers: OnboardingAnswers,
): Promise<{ error: string | null }> {
  const now = new Date().toISOString();
  const motivations = answers.motivations.length > 0 ? answers.motivations : null;
  const city = answers.city?.trim() || null;

  // Try insert first (the common case — no profiles row yet). A student who
  // first joined the niveau waitlist and came back to pick a real grade
  // already has a row, so this collides on the user_id primary key
  // (23505) — fall back to a plain update instead of using upsert's
  // INSERT ... ON CONFLICT DO UPDATE, which needs privileges beyond plain
  // insert/update grants and has been unreliable on this project (see
  // migrations 20260828090000 onward).
  const { error: insertError } = await supabase.from('profiles').insert({
    user_id: userId,
    grade: answers.grade,
    serie: answers.serie,
    lv2: answers.lv2,
    niveau_waitlist: null,
    grade_first_selected_at: now,
    grade_last_changed_at: now,
    motivations,
    daily_time_preference: answers.dailyTime,
    city,
    avatar_url: answers.avatarUrl,
  });

  if (!insertError) {
    return { error: null };
  }

  if (insertError.code !== '23505') {
    console.error('Failed to complete onboarding:', insertError);
    return { error: "Impossible d'enregistrer ton profil, réessaie." };
  }

  const { error: updateError } = await supabase
    .from('profiles')
    .update({
      grade: answers.grade,
      serie: answers.serie,
      lv2: answers.lv2,
      niveau_waitlist: null,
      grade_first_selected_at: now,
      grade_last_changed_at: now,
      motivations,
      daily_time_preference: answers.dailyTime,
      city,
      avatar_url: answers.avatarUrl,
    })
    .eq('user_id', userId);

  if (updateError) {
    console.error('Failed to complete onboarding (update fallback):', updateError);
    return { error: "Impossible d'enregistrer ton profil, réessaie." };
  }
  return { error: null };
}

// The niveau screen's "Supérieur"/"Autre" branch — there's no grade content
// for either tier yet, so this just records real intent (for future
// prioritization) instead of forcing a fake grade selection.
export async function joinNiveauWaitlist(userId: string, tier: NiveauWaitlistId): Promise<{ error: string | null }> {
  const { error: insertError } = await supabase.from('profiles').insert({
    user_id: userId,
    grade: null,
    niveau_waitlist: tier,
  });

  if (!insertError) {
    return { error: null };
  }

  if (insertError.code !== '23505') {
    console.error('Failed to join niveau waitlist:', insertError);
    return { error: "Impossible d'enregistrer ta demande, réessaie." };
  }

  // Already has a row (e.g. switched from one waitlist tier to another).
  const { error: updateError } = await supabase
    .from('profiles')
    .update({ niveau_waitlist: tier })
    .eq('user_id', userId);

  if (updateError) {
    console.error('Failed to join niveau waitlist (update fallback):', updateError);
    return { error: "Impossible d'enregistrer ta demande, réessaie." };
  }
  return { error: null };
}

export async function uploadAvatar(userId: string, localUri: string): Promise<string | null> {
  try {
    const response = await fetch(localUri);
    const arrayBuffer = await response.arrayBuffer();
    const path = `${userId}/avatar.jpg`;
    const { error: uploadError } = await supabase.storage
      .from('avatars')
      .upload(path, arrayBuffer, { contentType: 'image/jpeg', upsert: true });

    if (uploadError) {
      console.error('Failed to upload avatar:', uploadError);
      return null;
    }
    const { data } = supabase.storage.from('avatars').getPublicUrl(path);
    // Cache-bust: same path every time (upsert), so without this a stale
    // CDN/browser-cached image would keep showing after a re-upload.
    return `${data.publicUrl}?t=${Date.now()}`;
  } catch (error) {
    console.error('Failed to read avatar file:', error);
    return null;
  }
}
