import { supabase } from '@/lib/supabase';

export type AccessStatus = 'gratuit_limite' | 'premium';

// Every account starts 'gratuit_limite' (3 AI evaluations/day, enforced in
// supabase/functions/grade-answer) — no temporary free trial, no third
// "essai" status. 'premium' lifts the limit and unlocks cosmetic extras
// (see components/achievement-badge.tsx's shimmer). Flipping an account to
// 'premium' today requires a direct DB update from a trusted context — the
// client can't set this itself (see the migration's revoked column
// privileges). Wiring this to a real subscription (Stripe + a webhook that
// updates this column) is a separate, later task.
export async function getAccessStatus(): Promise<AccessStatus> {
  const { data, error } = await supabase.from('profiles').select('access_status').maybeSingle();

  if (error) {
    console.error('Failed to load access status:', error);
    return 'gratuit_limite';
  }
  return (data?.access_status as AccessStatus | undefined) ?? 'gratuit_limite';
}
