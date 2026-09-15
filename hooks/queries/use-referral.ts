import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export function useReferralStats() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: ['referrals', userId ?? ''] as const,
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('referrals')
        .select('referrer_id, referee_id')
        .or(`referrer_id.eq.${userId},referee_id.eq.${userId}`);
      if (error) throw error;
      const rows = data ?? [];
      return {
        hasRedeemed: rows.some((r) => r.referee_id === userId),
        referredCount: rows.filter((r) => r.referrer_id === userId).length,
      };
    },
  });
}

export function useRedeemReferralCode() {
  const queryClient = useQueryClient();
  const { session } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (code: string) => {
      const referral = await supabase.rpc('redeem_referral_code', { p_code: code });
      if (!referral.error) {
        const row = Array.isArray(referral.data) ? referral.data[0] : referral.data;
        return row as { granted_days: number };
      }

      // Pas un code de parrainage valide : peut-être un code promo (usage
      // unique, sans parrain associé) — même champ de saisie pour les deux.
      const promo = await supabase.rpc('redeem_promo_code', { p_code: code });
      if (promo.error) throw promo.error;
      const row = Array.isArray(promo.data) ? promo.data[0] : promo.data;
      if (!row) throw new Error('Code invalide.');
      return { granted_days: row.granted_days } as { granted_days: number };
    },
    onSuccess: () => {
      if (!userId) return;
      queryClient.invalidateQueries({ queryKey: ['referrals', userId] });
      queryClient.invalidateQueries({ queryKey: queryKeys.subscription(userId) });
    },
  });
}
