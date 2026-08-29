// Webhook Wave : confirmation asynchrone d'un paiement de checkout session.
// ⚠️ Vérification de signature à adapter une fois la doc/le secret Wave obtenus
// (voir https://docs.wave.com/business — en-tête Wave-Signature en HMAC).

import { corsHeaders } from '../_shared/cors.ts';
import { activateSubscription } from '../_shared/subscriptions.ts';

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });

  try {
    const payload = await req.json();

    // TODO: vérifier la signature Wave-Signature avec WAVE_WEBHOOK_SECRET avant de faire confiance au payload.

    const eventType = payload?.type;
    const session = payload?.data;

    if (eventType === 'checkout.session.completed' && session?.client_reference) {
      await activateSubscription({
        userId: session.client_reference,
        provider: 'wave',
        externalReference: session.id ?? session.transaction_id ?? 'unknown',
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
