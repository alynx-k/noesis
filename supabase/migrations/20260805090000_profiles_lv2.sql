-- Second-language choice (LV2): a student studies either Espagnol or
-- Allemand at their real school, never both — this stores which one they
-- picked so only that discipline is ever shown to them. Asked once, the
-- first time they open the app after choosing their grade (see
-- app/select-language.tsx and app/(tabs)/index.tsx's gating chain).
-- Nullable: not yet chosen until the student passes through that screen.
alter table public.profiles
  add column lv2 text check (lv2 in ('espagnol', 'allemand'));
