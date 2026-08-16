import AsyncStorage from '@react-native-async-storage/async-storage';

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

// ---------------------------------------------------------------------
// Periodic upgrade nudge (Home banner) — separate from the limit-reached
// upsell (PremiumUpsellCard), which only ever shows at the moment a free
// account actually hits its daily cap. This one is a softer, occasional
// reminder for free accounts that may not have hit a limit recently.
// ---------------------------------------------------------------------

const NUDGE_SUPPRESSED_UNTIL_KEY = 'noesis:premium-nudge-suppressed-until';
const NUDGE_COOLDOWN_DAYS = 7;

export async function shouldShowPremiumNudge(): Promise<boolean> {
  const raw = await AsyncStorage.getItem(NUDGE_SUPPRESSED_UNTIL_KEY);
  if (!raw) {
    return true;
  }
  return Date.now() >= Number(raw);
}

// Called both on dismiss ("not now") and after the user taps through to the
// subscription screen — either way, seeing the pitch again a minute later
// would just be annoying.
export async function suppressPremiumNudge(): Promise<void> {
  const until = Date.now() + NUDGE_COOLDOWN_DAYS * 24 * 60 * 60 * 1000;
  await AsyncStorage.setItem(NUDGE_SUPPRESSED_UNTIL_KEY, String(until));
}

// ---------------------------------------------------------------------
// "Welcome to Premium" transition detection — see
// components/premium-welcome-overlay.tsx, which uses this to fire a
// celebration exactly once, the first time it ever observes an account
// going from non-premium to premium.
// ---------------------------------------------------------------------

const LAST_KNOWN_STATUS_KEY_PREFIX = 'noesis:last-known-access-status:';

export async function checkForPremiumTransition(userId: string, currentStatus: AccessStatus): Promise<boolean> {
  const key = LAST_KNOWN_STATUS_KEY_PREFIX + userId;
  const previous = await AsyncStorage.getItem(key);
  await AsyncStorage.setItem(key, currentStatus);
  // previous === null means "first time this device has ever checked" —
  // required so a long-time Premium account doesn't get a false "welcome"
  // after a reinstall, when there's no prior baseline to compare against.
  return currentStatus === 'premium' && previous !== null && previous !== 'premium';
}
