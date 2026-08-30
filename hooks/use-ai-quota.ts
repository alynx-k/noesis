import { useAuth } from '../context/auth';
import { useSubscription } from './queries/use-subscription';
import { AI_FREE_TRIAL_LIMIT } from '../constants/ai-tutor';

// Quota d'essais gratuits partagé entre les fonctionnalités du tuteur IA
// (chat, correction/préparation de devoir par photo) — voir profiles.ai_trials_used.
export function useAiQuota() {
  const { isPremium } = useSubscription();
  const { profile } = useAuth();

  const trialsRemaining = isPremium ? null : Math.max(0, AI_FREE_TRIAL_LIMIT - (profile?.ai_trials_used ?? 0));
  const isLocked = !isPremium && trialsRemaining === 0;

  return { isPremium, trialsRemaining, isLocked };
}
