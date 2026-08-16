import * as Linking from 'expo-linking';

import { supabase } from '@/lib/supabase';

export async function getMyReferralCode(): Promise<string | null> {
  const { data, error } = await supabase.from('profiles').select('referral_code').maybeSingle();
  if (error) {
    console.error('Failed to load referral code:', error);
    return null;
  }
  return (data?.referral_code as string | undefined) ?? null;
}

export async function redeemReferralCode(code: string): Promise<{ rewardDays: number } | { error: string }> {
  const { data, error } = await supabase.functions.invoke('redeem-referral-code', { body: { code } });

  if (error || !data || typeof data.rewardDays !== 'number') {
    console.error('Failed to redeem referral code:', error, data);
    return { error: data?.error ?? 'Impossible de valider ce code, réessaie.' };
  }
  return { rewardDays: data.rewardDays };
}

// No generic link — WhatsApp is the one channel students and parents
// actually use to share things in Côte d'Ivoire, so this opens a chat
// composer directly (wa.me) instead of the OS's generic share sheet.
function shareMessage(code: string): string {
  return `Salut ! Je révise avec Noesis, l'app qui suit le programme ivoirien. Utilise mon code ${code} à l'inscription et on gagne chacun 7 jours de Premium gratuits.`;
}

export function buildWhatsAppShareUrl(code: string): string {
  return `https://wa.me/?text=${encodeURIComponent(shareMessage(code))}`;
}

export async function shareReferralCodeViaWhatsApp(code: string): Promise<void> {
  await Linking.openURL(buildWhatsAppShareUrl(code));
}
