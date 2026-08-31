// Edge function : initie un paiement Premium via Wave, MTN Mobile Money ou Orange Money.
//
// Wave et Orange renvoient une URL de paiement hébergée (le client l'ouvre dans un
// navigateur/WebView). MTN pousse une demande de validation directement sur le
// téléphone du payeur (pas d'URL) : le client doit fournir un numéro.
//
// ⚠️ Les appels aux API Wave/MTN/Orange ci-dessous sont écrits à partir de la
// documentation publique de chaque fournisseur, mais n'ont pas pu être testés
// faute de compte marchand réel. À vérifier/ajuster une fois les identifiants
// obtenus (voir README pour la liste des comptes à créer).
//
// Requiert les secrets Supabase :
//   WAVE_API_KEY, WAVE_SUCCESS_URL, WAVE_ERROR_URL
//   MTN_SUBSCRIPTION_KEY, MTN_API_USER, MTN_API_KEY, MTN_TARGET_ENVIRONMENT
//   ORANGE_CLIENT_ID, ORANGE_CLIENT_SECRET, ORANGE_MERCHANT_KEY, ORANGE_RETURN_URL
//   ORANGE_WEBHOOK_SECRET (voir _shared/webhook-auth.ts — WAVE_WEBHOOK_SECRET et
//   MTN_WEBHOOK_SECRET sont lus directement par leurs webhooks respectifs, à
//   ajouter manuellement à l'URL de callback enregistrée dans chaque tableau
//   de bord fournisseur puisque ce fichier ne la construit pas pour eux)

import { createClient } from 'jsr:@supabase/supabase-js@2';
import { corsHeaders } from '../_shared/cors.ts';

const PREMIUM_AMOUNT_XOF = 2000; // Prix mensuel indicatif, à ajuster.

type Provider = 'wave' | 'mtn' | 'orange';

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });

  try {
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) return jsonResponse({ error: 'Authorization manquante' }, 401);

    const supabase = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_ANON_KEY')!, {
      global: { headers: { Authorization: authHeader } },
    });
    const {
      data: { user },
      error: userError,
    } = await supabase.auth.getUser();
    if (userError || !user) return jsonResponse({ error: 'Non authentifié' }, 401);

    const body = (await req.json()) as { provider: Provider; phone?: string };

    if (body.provider === 'wave') {
      const result = await createWaveSession(user.id);
      return jsonResponse({ type: 'redirect', checkoutUrl: result.wave_launch_url }, 200);
    }

    if (body.provider === 'orange') {
      const result = await createOrangeSession(user.id);
      return jsonResponse({ type: 'redirect', checkoutUrl: result.payment_url }, 200);
    }

    if (body.provider === 'mtn') {
      if (!body.phone) return jsonResponse({ error: 'Numéro de téléphone requis pour MTN' }, 400);
      await requestMtnPayment(user.id, body.phone);
      return jsonResponse({ type: 'push', message: 'Valide la demande de paiement sur ton téléphone.' }, 200);
    }

    return jsonResponse({ error: `Fournisseur inconnu: ${body.provider}` }, 400);
  } catch (err) {
    return jsonResponse({ error: err instanceof Error ? err.message : 'Erreur inconnue' }, 500);
  }
});

async function createWaveSession(userId: string) {
  const apiKey = Deno.env.get('WAVE_API_KEY');
  if (!apiKey) throw new Error('WAVE_API_KEY non configurée');

  const res = await fetch('https://api.wave.com/v1/checkout/sessions', {
    method: 'POST',
    headers: { Authorization: `Bearer ${apiKey}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({
      amount: String(PREMIUM_AMOUNT_XOF),
      currency: 'XOF',
      client_reference: userId,
      success_url: Deno.env.get('WAVE_SUCCESS_URL') ?? 'noesis://subscription/success',
      error_url: Deno.env.get('WAVE_ERROR_URL') ?? 'noesis://subscription/error',
    }),
  });
  if (!res.ok) throw new Error(`Wave a répondu ${res.status}: ${await res.text()}`);
  return res.json();
}

async function createOrangeSession(userId: string) {
  const clientId = Deno.env.get('ORANGE_CLIENT_ID');
  const clientSecret = Deno.env.get('ORANGE_CLIENT_SECRET');
  const merchantKey = Deno.env.get('ORANGE_MERCHANT_KEY');
  if (!clientId || !clientSecret || !merchantKey) throw new Error('Identifiants Orange Money non configurés');

  const tokenRes = await fetch('https://api.orange.com/oauth/v3/token', {
    method: 'POST',
    headers: {
      Authorization: `Basic ${btoa(`${clientId}:${clientSecret}`)}`,
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: 'grant_type=client_credentials',
  });
  if (!tokenRes.ok) throw new Error(`Orange OAuth a répondu ${tokenRes.status}: ${await tokenRes.text()}`);
  const { access_token } = await tokenRes.json();

  const payRes = await fetch('https://api.orange.com/orange-money-webpay/ci/v1/webpayment', {
    method: 'POST',
    headers: { Authorization: `Bearer ${access_token}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({
      merchant_key: merchantKey,
      currency: 'XOF',
      order_id: userId,
      amount: PREMIUM_AMOUNT_XOF,
      return_url: Deno.env.get('ORANGE_RETURN_URL') ?? 'noesis://subscription/success',
      cancel_url: 'noesis://subscription/error',
      notif_url: `${Deno.env.get('SUPABASE_URL')}/functions/v1/orange-webhook?secret=${Deno.env.get('ORANGE_WEBHOOK_SECRET') ?? ''}`,
      reference: userId,
    }),
  });
  if (!payRes.ok) throw new Error(`Orange Money a répondu ${payRes.status}: ${await payRes.text()}`);
  return payRes.json();
}

async function requestMtnPayment(userId: string, phone: string) {
  const subscriptionKey = Deno.env.get('MTN_SUBSCRIPTION_KEY');
  const apiUser = Deno.env.get('MTN_API_USER');
  const apiKey = Deno.env.get('MTN_API_KEY');
  const targetEnv = Deno.env.get('MTN_TARGET_ENVIRONMENT') ?? 'mtnci';
  if (!subscriptionKey || !apiUser || !apiKey) throw new Error('Identifiants MTN MoMo non configurés');

  const tokenRes = await fetch('https://sandbox.momodeveloper.mtn.com/collection/token/', {
    method: 'POST',
    headers: {
      Authorization: `Basic ${btoa(`${apiUser}:${apiKey}`)}`,
      'Ocp-Apim-Subscription-Key': subscriptionKey,
    },
  });
  if (!tokenRes.ok) throw new Error(`MTN token a répondu ${tokenRes.status}: ${await tokenRes.text()}`);
  const { access_token } = await tokenRes.json();

  const referenceId = crypto.randomUUID();
  const payRes = await fetch('https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${access_token}`,
      'X-Reference-Id': referenceId,
      'X-Target-Environment': targetEnv,
      'Ocp-Apim-Subscription-Key': subscriptionKey,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      amount: String(PREMIUM_AMOUNT_XOF),
      currency: 'XOF',
      externalId: userId,
      payer: { partyIdType: 'MSISDN', partyId: phone },
      payerMessage: 'Abonnement Premium Noesis',
      payeeNote: userId,
    }),
  });
  if (!payRes.ok) throw new Error(`MTN requesttopay a répondu ${payRes.status}: ${await payRes.text()}`);
}

function jsonResponse(body: unknown, status: number) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  });
}
