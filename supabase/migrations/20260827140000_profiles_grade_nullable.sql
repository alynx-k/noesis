-- Students who pick "Supérieur" or "Autre" on the niveau onboarding screen
-- have no grade content to attach to (see niveau_waitlist) — they still get
-- a profiles row (to record that real waitlist intent), just with no grade
-- yet. The existing check constraint already allows NULL implicitly (checks
-- only run on non-null values), so this only needs to drop NOT NULL.
alter table public.profiles
  alter column grade drop not null;
