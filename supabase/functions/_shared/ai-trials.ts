// Quota d'essais gratuits partagé entre toutes les fonctionnalités du tuteur
// IA (chat, correction de devoir par photo, préparation de devoir par photo) —
// le PRD les regroupe sous un seul quota ("nombre limité d'essais").

export const AI_FREE_TRIAL_LIMIT = 3;

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
    .select('ai_trials_used')
    .eq('id', userId)
    .single();
  if (profileError || !profile) throw new Error('Profil introuvable.');

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
  await adminClient.from('profiles').update({ ai_trials_used: nextUsed }).eq('id', userId);
  return Math.max(0, AI_FREE_TRIAL_LIMIT - nextUsed);
}
