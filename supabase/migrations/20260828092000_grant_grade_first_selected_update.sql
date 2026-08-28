-- grade_first_selected_at was only ever granted for INSERT (see
-- 20260806100000_lock_down_access_status.sql), never UPDATE, because the
-- only prior writer (lib/grade.ts's setInitialGrade) is a plain INSERT that
-- never hits an ON CONFLICT DO UPDATE branch. lib/onboarding.ts's
-- completeOnboarding uses upsert() instead (a returning waitlist student
-- already has a profiles row, so their real grade pick is an update, not an
-- insert) — Postgres requires UPDATE privilege on every column in the SET
-- list of an upsert's DO UPDATE clause, which surfaced this pre-existing
-- gap as "permission denied for table profiles" (42501).
grant update (grade_first_selected_at) on public.profiles to authenticated;
