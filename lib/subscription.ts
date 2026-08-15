import { supabase } from '@/lib/supabase';

// Mirrors the check constraint added in
// supabase/migrations/20260806090000_access_status.sql. The client can read
// this column but never write it — see that migration's follow-up
// (20260806100000_lock_down_access_status.sql) for why: only a service-role
// process (the future Stripe webhook) is allowed to flip an account to
// 'premium'.
export type AccessStatus = 'gratuit_limite' | 'premium';

export async function getAccessStatus(): Promise<AccessStatus> {
  const { data, error } = await supabase.from('profiles').select('access_status').maybeSingle();

  if (error) {
    console.error('Failed to load access status:', error);
    return 'gratuit_limite';
  }
  return (data?.access_status as AccessStatus | undefined) ?? 'gratuit_limite';
}
