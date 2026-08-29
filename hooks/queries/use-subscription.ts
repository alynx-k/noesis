import { useQuery, useMutation } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type Subscription = {
  provider: 'iap_ios' | 'iap_android' | 'wave' | 'mtn' | 'orange';
  status: 'active' | 'expired' | 'cancelled';
  current_period_end: string;
};

export function useSubscription() {
  const { session } = useAuth();
  const userId = session?.user.id;

  const query = useQuery({
    queryKey: queryKeys.subscription(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase.from('subscriptions').select('*').eq('user_id', userId).maybeSingle();
      if (error) throw error;
      return (data as Subscription | null) ?? null;
    },
  });

  const isPremium =
    !!query.data && query.data.status === 'active' && new Date(query.data.current_period_end) > new Date();

  return { ...query, subscription: query.data ?? null, isPremium };
}

type MobileMoneyProvider = 'wave' | 'mtn' | 'orange';
type CheckoutResult = { type: 'redirect'; checkoutUrl: string } | { type: 'push'; message: string };

export function useStartCheckout() {
  return useMutation({
    mutationFn: async (params: { provider: MobileMoneyProvider; phone?: string }) => {
      const { data, error } = await supabase.functions.invoke<CheckoutResult>('create-checkout-session', {
        body: params,
      });
      if (error) throw error;
      if (!data) throw new Error('Réponse vide du serveur de paiement.');
      return data;
    },
  });
}
