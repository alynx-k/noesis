import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
const WAVE_WEBHOOK_SECRET = Deno.env.get('WAVE_WEBHOOK_SECRET');

const TIMESTAMP_TOLERANCE_SECONDS = 300;

function timingSafeEqual(a: string, b: string): boolean {
  if (a.length !== b.length) {
    return false;
  }
  let mismatch = 0;
  for (let i = 0; i < a.length; i++) {
    mismatch |= a.charCodeAt(i) ^ b.charCodeAt(i);
  }
  return mismatch === 0;
}

// Wave-Signature: "t=<unix ts>,v1=<hex hmac>[,v1=<hex hmac>...]" — multiple
// v1 entries happen during a webhook secret rotation, so any match is valid.
async function verifyWaveSignature(header: string | null, rawBody: string, secret: string): Promise<boolean> {
  if (!header) {
    return false;
  }
  const parts = Object.fromEntries(
    header.split(',').map((part) => {
      const [key, ...rest] = part.split('=');
      return [key, rest.join('=')];
    }),
  );
  const timestamp = parts.t;
  const signatures = header
    .split(',')
    .filter((part) => part.startsWith('v1='))
    .map((part) => part.slice('v1='.length));

  if (!timestamp || signatures.length === 0) {
    return false;
  }
  if (Math.abs(Date.now() / 1000 - Number(timestamp)) > TIMESTAMP_TOLERANCE_SECONDS) {
    return false;
  }

  const key = await crypto.subtle.importKey('raw', new TextEncoder().encode(secret), { name: 'HMAC', hash: 'SHA-256' }, false, [
    'sign',
  ]);
  const signatureBytes = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(timestamp + rawBody));
  const computed = Array.from(new Uint8Array(signatureBytes))
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('');

  return signatures.some((signature) => timingSafeEqual(signature, computed));
}

// A paid period stacks on top of any remaining time rather than resetting
// it — resubscribing a day before expiry shouldn't lose that day. Plain
// calendar-month/year arithmetic is fine here; this doesn't need to be more
// precise than what a human reading "1 mois" / "1 an" would expect.
function addPlanDuration(base: Date, plan: string): Date {
  const result = new Date(base);
  if (plan === 'monthly') {
    result.setUTCMonth(result.getUTCMonth() + 1);
  } else {
    result.setUTCFullYear(result.getUTCFullYear() + 1);
  }
  return result;
}

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response('Method not allowed', { status: 405 });
  }
  if (!WAVE_WEBHOOK_SECRET) {
    console.error('WAVE_WEBHOOK_SECRET is not configured');
    return new Response('Not configured', { status: 503 });
  }

  const rawBody = await req.text();
  const signatureHeader = req.headers.get('Wave-Signature');
  const isValid = await verifyWaveSignature(signatureHeader, rawBody, WAVE_WEBHOOK_SECRET);
  if (!isValid) {
    console.error('Rejected wave-webhook call with an invalid or missing signature');
    return new Response('Invalid signature', { status: 401 });
  }

  let event: { type?: string; data?: Record<string, unknown> };
  try {
    event = JSON.parse(rawBody);
  } catch {
    return new Response('Invalid JSON', { status: 400 });
  }

  // Any event type we don't act on is a 200, not an error — Wave retries
  // non-2xx responses for 24h, and a permanently-unhandled event type would
  // just retry forever for no reason.
  if (event.type !== 'checkout.session.completed' || event.data?.payment_status !== 'succeeded') {
    return new Response('Ignored', { status: 200 });
  }

  const clientReference = event.data?.client_reference;
  if (typeof clientReference !== 'string') {
    console.error('checkout.session.completed event missing client_reference');
    return new Response('Missing client_reference', { status: 200 });
  }

  const serviceClient = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

  const { data: order, error: orderError } = await serviceClient
    .from('subscription_orders')
    .select('id, user_id, plan, status')
    .eq('id', clientReference)
    .maybeSingle();

  if (orderError || !order) {
    console.error('wave-webhook: no matching subscription order for', clientReference, orderError);
    return new Response('Order not found', { status: 200 });
  }

  // Wave retries the same event up to 5 times over 24h — without this check
  // a slow/duplicated retry would credit the same payment twice.
  if (order.status === 'completed') {
    return new Response('Already processed', { status: 200 });
  }

  const { data: profile } = await serviceClient
    .from('profiles')
    .select('premium_until')
    .eq('user_id', order.user_id)
    .maybeSingle();

  const currentUntil = profile?.premium_until ? new Date(profile.premium_until as string) : null;
  const base = currentUntil && currentUntil > new Date() ? currentUntil : new Date();
  const premiumUntil = addPlanDuration(base, order.plan as string);

  const { error: updateError } = await serviceClient
    .from('profiles')
    .update({ access_status: 'premium', premium_until: premiumUntil.toISOString() })
    .eq('user_id', order.user_id);

  if (updateError) {
    console.error('wave-webhook: failed to grant premium:', updateError);
    return new Response('Internal error', { status: 500 });
  }

  await serviceClient
    .from('subscription_orders')
    .update({ status: 'completed', completed_at: new Date().toISOString() })
    .eq('id', order.id);

  return new Response('OK', { status: 200 });
});
