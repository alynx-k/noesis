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
async function openWhatsAppMessage(message: string): Promise<void> {
  await Linking.openURL(`https://wa.me/?text=${encodeURIComponent(message)}`);
}

function genericShareMessage(code: string): string {
  return `Salut ! Je révise avec Noesis, l'app qui suit le programme ivoirien. Utilise mon code ${code} à l'inscription et on gagne chacun 7 jours de Premium gratuits.`;
}

export function buildWhatsAppShareUrl(code: string): string {
  return `https://wa.me/?text=${encodeURIComponent(genericShareMessage(code))}`;
}

export async function shareReferralCodeViaWhatsApp(code: string): Promise<void> {
  await openWhatsAppMessage(genericShareMessage(code));
}

// Shared at the exact moment that earned it — a fresh destination unlock —
// rather than from a generic "invite" screen, which is what actually makes
// people tap share instead of scrolling past it.
export async function shareDestinationUnlockViaWhatsApp(destinationName: string, code: string | null): Promise<void> {
  const base = `Je viens de débloquer ${destinationName} sur Noesis en restant concentré pendant ma session de révision 🚀`;
  const withCode = code
    ? `${base} Rejoins-moi avec le code ${code}, on gagne chacun 7 jours de Premium.`
    : base;
  await openWhatsAppMessage(withCode);
}

export async function shareStreakViaWhatsApp(streakDays: number, code: string | null): Promise<void> {
  const base = `${streakDays} jours de suite à réviser sur Noesis, je ne lâche rien 🔥`;
  const withCode = code ? `${base} Utilise mon code ${code} à l'inscription, on gagne chacun 7 jours de Premium.` : base;
  await openWhatsAppMessage(withCode);
}
