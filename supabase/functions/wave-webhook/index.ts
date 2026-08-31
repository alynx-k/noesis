// Webhook Wave : confirmation asynchrone d'un paiement de checkout session.
// Vérifié par secret partagé (voir _shared/webhook-auth.ts) en attendant de
// pouvoir implémenter la vérification HMAC Wave-Signature réelle une fois le
// compte marchand actif (https://docs.wave.com/business).
// Requiert le secret Supabase WAVE_WEBHOOK_SECRET, à ajouter en paramètre
// ?secret=... de l'URL de callback enregistrée dans le tableau de bord Wave.

import { corsHeaders } from '../_shared/cors.ts';
import { activateSubscription } from '../_shared/subscriptions.ts';
import { verifyWebhookSecret } from '../_shared/webhook-auth.ts';

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });

  if (!verifyWebhookSecret(req, 'WAVE_WEBHOOK_SECRET')) {
    return new Response(JSON.stringify({ error: 'Non autorisé' }), {
      status: 401,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }

  try {
    const payload = await req.json();

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
