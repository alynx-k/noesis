import { useAuth } from '../context/auth';
import { useSubscription } from './queries/use-subscription';
import { AI_FREE_TRIAL_LIMIT, getIsoWeekKey } from '../constants/ai-tutor';

// Quota d'essais gratuits partagé entre les fonctionnalités du tuteur IA
// (chat, correction/préparation de devoir par photo, synthèse de cours) —
// voir profiles.ai_trials_used, renouvelé chaque semaine ISO.
export function useAiQuota() {
  const { isPremium } = useSubscription();
  const { profile } = useAuth();

  const trialsUsed = profile?.ai_trials_reset_week === getIsoWeekKey(new Date()) ? profile.ai_trials_used : 0;
  const trialsRemaining = isPremium ? null : Math.max(0, AI_FREE_TRIAL_LIMIT - trialsUsed);
  const isLocked = !isPremium && trialsRemaining === 0;

  return { isPremium, trialsRemaining, isLocked };
}
