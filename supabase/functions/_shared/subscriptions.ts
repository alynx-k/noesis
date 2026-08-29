import { createClient } from 'jsr:@supabase/supabase-js@2';

// Durée d'une période Premium payée. Pas de plans multiples pour l'instant
// (voir docs/PRD.md) : un seul abonnement mensuel, quel que soit le moyen de paiement.
export const PREMIUM_PERIOD_DAYS = 30;

export function adminClient() {
  return createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!);
}

export async function activateSubscription(params: {
  userId: string;
  provider: 'wave' | 'mtn' | 'orange' | 'iap_ios' | 'iap_android';
  externalReference: string;
}) {
  const client = adminClient();
  const periodEnd = new Date(Date.now() + PREMIUM_PERIOD_DAYS * 24 * 60 * 60 * 1000).toISOString();

  const { error } = await client.from('subscriptions').upsert(
    {
      user_id: params.userId,
      provider: params.provider,
      status: 'active',
      current_period_end: periodEnd,
      external_reference: params.externalReference,
    },
    { onConflict: 'user_id' }
  );

  if (error) throw error;
}
