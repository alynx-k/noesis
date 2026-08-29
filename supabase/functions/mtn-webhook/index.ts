// Webhook MTN Mobile Money : callback de confirmation d'un requesttopay
// (voir create-checkout-session). ⚠️ MTN peut aussi nécessiter un polling actif
// de GET /collection/v1_0/requesttopay/{referenceId} selon la configuration du
// compte marchand — à confirmer une fois les identifiants réels obtenus.

import { corsHeaders } from '../_shared/cors.ts';
import { activateSubscription } from '../_shared/subscriptions.ts';

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });

  try {
    const payload = await req.json();

    const status = payload?.status;
    const userId = payload?.externalId;

    if (status === 'SUCCESSFUL' && userId) {
      await activateSubscription({
        userId,
        provider: 'mtn',
        externalReference: payload?.financialTransactionId ?? 'unknown',
      });
    }

    return new Response(JSON.stringify({ received: true }), {
      status: 200,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: err instanceof Error ? err.message : 'Erreur inconnue' }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }
});
