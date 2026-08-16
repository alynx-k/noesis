-- Wave Checkout is a one-off payment, not a card-style recurring charge
-- (Mobile Money in West Africa has no auto-renewal), so a paid period needs
-- a real expiry that gets enforced, not an unbounded 'premium' flag that
-- stays true forever once set once.
alter table public.profiles
  add column premium_until timestamptz;

-- One row per checkout attempt, created before we ever redirect the user to
-- Wave. Its id is what we hand Wave as `client_reference` — the only piece
-- of data that survives the whole round trip (session creation -> Wave's
-- hosted checkout -> webhook) and lets the webhook find its way back to a
-- user_id and plan. `wave_checkout_id` is filled in right after Wave
-- confirms the session was created, so support can reconcile a row even if
-- the webhook itself is delayed or lost.
create table public.subscription_orders (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  plan text not null check (plan in ('monthly', 'yearly')),
  amount integer not null,
  wave_checkout_id text unique,
  status text not null default 'pending' check (status in ('pending', 'completed', 'failed')),
  created_at timestamptz not null default now(),
  completed_at timestamptz
);

create index subscription_orders_user_idx on public.subscription_orders (user_id, created_at desc);

alter table public.subscription_orders enable row level security;

create policy "Users can view their own orders"
  on public.subscription_orders for select
  using (auth.uid() = user_id);

-- Deliberately no insert/update policy for authenticated/anon: every write
-- happens through create-checkout-session and wave-webhook, both using the
-- service-role client — the same "only a service-role process may write"
-- boundary already enforced on profiles.access_status.

-- Nightly sweep back to the free tier once a paid period lapses. This is
-- the only enforcement point for expiry, so every other place that reads
-- access_status (grade-answer, prepare-homework, correct-homework, the
-- client) needs no changes at all.
create extension if not exists pg_cron with schema extensions;

select cron.schedule(
  'downgrade-expired-premium',
  '0 3 * * *',
  $$ update public.profiles set access_status = 'gratuit_limite' where access_status = 'premium' and premium_until < now(); $$
);
