import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
const WAVE_API_KEY = Deno.env.get('WAVE_API_KEY');

// Prices are decided here, never taken from the client request — the same
// rule prepare-homework's quota check already follows. A tampered request
// body must not be able to buy a year of Premium for the price of a month.
const PLAN_PRICES: Record<string, number> = { monthly: 1500, yearly: 12000 };

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  if (!WAVE_API_KEY) {
    console.error('WAVE_API_KEY is not configured');
    return new Response(JSON.stringify({ error: 'Le paiement est momentanément indisponible.' }), {
      status: 503,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const body = await req.json();
    const plan = typeof body?.plan === 'string' ? body.plan : '';
    const amount = PLAN_PRICES[plan];
    if (!amount) {
      return new Response(JSON.stringify({ error: 'Invalid plan' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const authHeader = req.headers.get('Authorization') ?? '';
    const supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
      global: { headers: { Authorization: authHeader } },
    });
    const {
      data: { user },
      error: userError,
    } = await supabaseClient.auth.getUser();

    if (userError || !user) {
      return new Response(JSON.stringify({ error: 'Unauthorized' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    // Service-role: subscription_orders has no client-facing insert policy
    // (see the migration) — only this function and wave-webhook may write it.
    const serviceClient = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

    const { data: order, error: orderError } = await serviceClient
      .from('subscription_orders')
      .insert({ user_id: user.id, plan, amount })
      .select('id')
      .single();

    if (orderError || !order) {
      console.error('Failed to create subscription order:', orderError);
      return new Response(JSON.stringify({ error: 'Impossible de démarrer le paiement.' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const resultBaseUrl = `${SUPABASE_URL}/functions/v1/checkout-result`;
    const waveResponse = await fetch('https://api.wave.com/v1/checkout/sessions', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${WAVE_API_KEY}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        amount: String(amount),
        currency: 'XOF',
        client_reference: order.id,
        success_url: `${resultBaseUrl}?status=success`,
        error_url: `${resultBaseUrl}?status=error`,
      }),
    });

    if (!waveResponse.ok) {
      const errorBody = await waveResponse.text();
      console.error('Wave checkout session creation failed:', waveResponse.status, errorBody);
      await serviceClient.from('subscription_orders').update({ status: 'failed' }).eq('id', order.id);
      return new Response(JSON.stringify({ error: 'Impossible de démarrer le paiement.' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const session = await waveResponse.json();
    await serviceClient.from('subscription_orders').update({ wave_checkout_id: session.id }).eq('id', order.id);

    return new Response(JSON.stringify({ waveLaunchUrl: session.wave_launch_url }), {
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('create-checkout-session error:', error);
    return new Response(JSON.stringify({ error: 'Internal error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
