import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;

// A taste of the full product, not a token gesture — long enough to matter,
// short enough that giving it to both sides on every redemption stays cheap.
const REWARD_DAYS = 7;

function addDays(base: Date, days: number): Date {
  const result = new Date(base);
  result.setUTCDate(result.getUTCDate() + days);
  return result;
}

async function grantRewardDays(
  serviceClient: ReturnType<typeof createClient>,
  userId: string,
  days: number,
): Promise<void> {
  const { data: profile } = await serviceClient
    .from('profiles')
    .select('premium_until')
    .eq('user_id', userId)
    .maybeSingle();

  const currentUntil = profile?.premium_until ? new Date(profile.premium_until as string) : null;
  // Stacks on top of remaining time exactly like a Wave renewal does — a
  // referral reward shouldn't shorten time a paying Premium user already has.
  const base = currentUntil && currentUntil > new Date() ? currentUntil : new Date();

  await serviceClient
    .from('profiles')
    .update({ access_status: 'premium', premium_until: addDays(base, days).toISOString() })
    .eq('user_id', userId);
}

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const body = await req.json();
    const code = typeof body?.code === 'string' ? body.code.trim().toUpperCase() : '';
    if (!code) {
      return new Response(JSON.stringify({ error: 'Code invalide.' }), {
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

    const serviceClient = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

    const { data: referrer } = await serviceClient
      .from('profiles')
      .select('user_id')
      .eq('referral_code', code)
      .maybeSingle();

    if (!referrer) {
      return new Response(JSON.stringify({ error: 'Ce code de parrainage n’existe pas.' }), {
        headers: { 'Content-Type': 'application/json' },
      });
    }
    if (referrer.user_id === user.id) {
      return new Response(JSON.stringify({ error: 'Tu ne peux pas utiliser ton propre code.' }), {
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const { data: existing } = await serviceClient
      .from('referrals')
      .select('id')
      .eq('referred_id', user.id)
      .maybeSingle();

    if (existing) {
      return new Response(JSON.stringify({ error: 'Tu as déjà utilisé un code de parrainage.' }), {
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const { error: insertError } = await serviceClient.from('referrals').insert({
      referrer_id: referrer.user_id,
      referred_id: user.id,
      code,
      status: 'rewarded',
      rewarded_at: new Date().toISOString(),
    });

    if (insertError) {
      console.error('Failed to record referral:', insertError);
      return new Response(JSON.stringify({ error: 'Impossible de valider ce code, réessaie.' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    await Promise.all([
      grantRewardDays(serviceClient, referrer.user_id as string, REWARD_DAYS),
      grantRewardDays(serviceClient, user.id, REWARD_DAYS),
    ]);

    return new Response(JSON.stringify({ rewardDays: REWARD_DAYS }), {
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('redeem-referral-code error:', error);
    return new Response(JSON.stringify({ error: 'Internal error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
