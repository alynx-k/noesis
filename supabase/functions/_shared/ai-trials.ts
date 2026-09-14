// Quota d'essais gratuits partagé entre toutes les fonctionnalités du tuteur
// IA (chat, correction de devoir par photo, préparation de devoir par photo) —
// le PRD les regroupe sous un seul quota ("nombre limité d'essais").
// Renouvelé chaque semaine ISO (pas cumulatif à vie).

export const AI_FREE_TRIAL_LIMIT = 3;

function getIsoWeekKey(date: Date): string {
  const d = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()));
  const dayNum = (d.getUTCDay() + 6) % 7;
  d.setUTCDate(d.getUTCDate() - dayNum + 3);
  const firstThursday = new Date(Date.UTC(d.getUTCFullYear(), 0, 4));
  const firstDayNum = (firstThursday.getUTCDay() + 6) % 7;
  firstThursday.setUTCDate(firstThursday.getUTCDate() - firstDayNum + 3);
  const weekNum = 1 + Math.round((d.getTime() - firstThursday.getTime()) / (7 * 24 * 3600 * 1000));
  return `${d.getUTCFullYear()}-W${String(weekNum).padStart(2, '0')}`;
}

export async function checkAiQuota(
  // deno-lint-ignore no-explicit-any
  callerClient: any,
  // deno-lint-ignore no-explicit-any
  adminClient: any,
  userId: string
): Promise<{ isPremium: boolean; trialsUsed: number }> {
  const { data: isPremium, error: premiumError } = await callerClient.rpc('is_premium');
  if (premiumError) throw new Error(premiumError.message);
  if (isPremium) return { isPremium: true, trialsUsed: 0 };

  const { data: profile, error: profileError } = await adminClient
    .from('profiles')
    .select('ai_trials_used, ai_trials_reset_week')
    .eq('id', userId)
    .single();
  if (profileError || !profile) throw new Error('Profil introuvable.');

  // Semaine différente de la dernière connue -> quota renouvelé. On ne
  // persiste ce renouvellement qu'au moment d'une consommation réelle
  // (consumeTrial), pas ici, pour ne pas écrire à chaque simple vérification.
  if (profile.ai_trials_reset_week !== getIsoWeekKey(new Date())) {
    return { isPremium: false, trialsUsed: 0 };
  }
  return { isPremium: false, trialsUsed: profile.ai_trials_used as number };
}

// N'incrémenter qu'après un usage réussi : un appel Gemini en échec, ou une
// photo jugée illisible, ne doit pas coûter un essai à l'élève.
export async function consumeTrial(
  // deno-lint-ignore no-explicit-any
  adminClient: any,
  userId: string,
  trialsUsed: number
): Promise<number> {
  const nextUsed = trialsUsed + 1;
  await adminClient
    .from('profiles')
    .update({ ai_trials_used: nextUsed, ai_trials_reset_week: getIsoWeekKey(new Date()) })
    .eq('id', userId);
  return Math.max(0, AI_FREE_TRIAL_LIMIT - nextUsed);
}
