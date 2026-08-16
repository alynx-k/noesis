-- Every profile gets a short, shareable code the moment it's created —
-- generated server-side (not client-chosen) so it can't collide or be
-- spoofed. 6 chars from an md5 digest keeps it short enough to read out
-- loud or paste into a WhatsApp message, while the retry loop below makes
-- a collision (vanishingly unlikely at this app's scale) fail closed
-- instead of ever letting a signup fail on it.
alter table public.profiles
  add column referral_code text unique;

create or replace function public.generate_referral_code()
returns trigger as $$
declare
  candidate text;
begin
  if new.referral_code is not null then
    return new;
  end if;
  loop
    candidate := upper(substr(md5(random()::text || clock_timestamp()::text), 1, 6));
    exit when not exists (select 1 from public.profiles where referral_code = candidate);
  end loop;
  new.referral_code := candidate;
  return new;
end;
$$ language plpgsql;

create trigger set_referral_code
  before insert on public.profiles
  for each row execute function public.generate_referral_code();

update public.profiles set referral_code = upper(substr(md5(random()::text || clock_timestamp()::text || user_id::text), 1, 6))
  where referral_code is null;

alter table public.profiles alter column referral_code set not null;

-- One row per successful redemption. `referred_id` is unique so an account
-- can redeem at most one code ever — the moment of redemption (see the
-- redeem-referral-code edge function) is also when both sides are
-- rewarded, so 'pending' vs 'rewarded' really only distinguishes "this row
-- exists" from a future world where rewarding is deferred to a later
-- qualifying action instead of being immediate.
create table public.referrals (
  id uuid primary key default gen_random_uuid(),
  referrer_id uuid not null references auth.users (id) on delete cascade,
  referred_id uuid not null unique references auth.users (id) on delete cascade,
  code text not null,
  status text not null default 'pending' check (status in ('pending', 'rewarded')),
  created_at timestamptz not null default now(),
  rewarded_at timestamptz,
  constraint referrals_no_self_referral check (referrer_id <> referred_id)
);

create index referrals_referrer_idx on public.referrals (referrer_id);

alter table public.referrals enable row level security;

create policy "Users can view referrals they made"
  on public.referrals for select
  using (auth.uid() = referrer_id);

-- Deliberately no insert/update policy for authenticated/anon: only
-- redeem-referral-code (service-role) may write this table — same
-- write-boundary already used for access_status and subscription_orders.
