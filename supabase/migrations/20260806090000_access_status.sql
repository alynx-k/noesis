-- Access status driving the AI-evaluation daily limit (see
-- supabase/functions/grade-answer/index.ts): every account starts as
-- 'gratuit_limite' (3 evaluations/day) — no temporary free trial, no third
-- "essai" status by design. 'premium' lifts the limit entirely.
--
-- Replaces the is_premium boolean added earlier for the achievements
-- cosmetic gate: both tracked the same real-world "paid subscriber"
-- concept under different names, so this consolidates them into one field
-- instead of keeping two sources of truth that could drift apart.
alter table public.profiles
  add column access_status text not null default 'gratuit_limite'
    check (access_status in ('gratuit_limite', 'premium'));

alter table public.profiles drop column is_premium;

-- Column-level privilege, separate from the table's row-level policies: a
-- client can still update/insert their own profiles row (grade, lv2...),
-- but can never set access_status themselves via `.update()` or a raw
-- insert — only a service-role process (the future Stripe webhook) can
-- flip this to 'premium'.
revoke update (access_status) on public.profiles from authenticated, anon;
revoke insert (access_status) on public.profiles from authenticated, anon;
