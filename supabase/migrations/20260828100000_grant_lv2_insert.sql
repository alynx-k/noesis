-- lv2 was only ever granted for UPDATE (see 20260806100000_lock_down_access_status.sql)
-- because the only prior writer (lib/lv2.ts's setLv2, via select-language.tsx)
-- runs strictly after the initial profiles insert already happened. The
-- onboarding flow now collects lv2 earlier and writes it in the same insert
-- as grade/serie (see lib/onboarding.ts's completeOnboarding) — without this
-- grant that insert would fail with the same "permission denied for table
-- profiles" (42501) already hit for the other onboarding columns.
grant insert (lv2) on public.profiles to authenticated;
