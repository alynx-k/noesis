export const AI_FREE_TRIAL_LIMIT = 3;

// Même algorithme que supabase/functions/_shared/ai-trials.ts (semaine ISO) —
// dupliqué ici car l'edge function (Deno) et l'app (React Native) ne
// partagent pas de module commun. Utilise les composants UTC (pas locaux) :
// le serveur calcule toujours en UTC, donc la clé doit être ancrée sur le
// même instant UTC pour rester en accord près d'un changement de semaine,
// quel que soit le fuseau horaire réglé sur le téléphone de l'élève.
export function getIsoWeekKey(date: Date): string {
  const d = new Date(Date.UTC(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate()));
  const dayNum = (d.getUTCDay() + 6) % 7;
  d.setUTCDate(d.getUTCDate() - dayNum + 3);
  const firstThursday = new Date(Date.UTC(d.getUTCFullYear(), 0, 4));
  const firstDayNum = (firstThursday.getUTCDay() + 6) % 7;
  firstThursday.setUTCDate(firstThursday.getUTCDate() - firstDayNum + 3);
  const weekNum = 1 + Math.round((d.getTime() - firstThursday.getTime()) / (7 * 24 * 3600 * 1000));
  return `${d.getUTCFullYear()}-W${String(weekNum).padStart(2, '0')}`;
}
