// Webhook Orange Money : reçoit la notification définie par notif_url lors de la
// création du paiement (voir create-checkout-session). ⚠️ Le format exact du
// payload de notification est à confirmer avec la doc marchand Orange CI.
// Vérifié par secret partagé (voir _shared/webhook-auth.ts) : create-checkout-session
// ajoute déjà ?secret=ORANGE_WEBHOOK_SECRET à notif_url.

import { corsHeaders } from '../_shared/cors.ts';
import { activateSubscription } from '../_shared/subscriptions.ts';
import { verifyWebhookSecret } from '../_shared/webhook-auth.ts';

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });

  if (!verifyWebhookSecret(req, 'ORANGE_WEBHOOK_SECRET')) {
    return new Response(JSON.stringify({ error: 'Non autorisé' }), {
      status: 401,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }

  try {
    const payload = await req.json();

    const status = payload?.status ?? payload?.txnstatus;
    const reference = payload?.reference ?? payload?.order_id;

    if ((status === 'SUCCESS' || status === 'SUCCESSFULL') && reference) {
      await activateSubscription({
        userId: reference,
        provider: 'orange',
        externalReference: payload?.txnid ?? payload?.pay_token ?? 'unknown',
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
