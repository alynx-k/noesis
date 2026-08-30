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
      const { data, error } = await supabase.rpc('redeem_referral_code', { p_code: code });
      if (error) throw error;
      const row = Array.isArray(data) ? data[0] : data;
      return row as { granted_days: number };
    },
    onSuccess: () => {
      if (!userId) return;
      queryClient.invalidateQueries({ queryKey: ['referrals', userId] });
      queryClient.invalidateQueries({ queryKey: queryKeys.subscription(userId) });
    },
  });
}
