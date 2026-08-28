-- New onboarding screens (see app/onboarding/*) collect a few more real,
-- optional pieces of profile data. All nullable: existing users and anyone
-- who skips a step just have no value until they go through it.

alter table public.profiles
  -- Set when a student picks "Supérieur" or "Autre" on the niveau screen —
  -- there's no course content for those tiers yet, so this just records
  -- real intent for later prioritization instead of faking a grade.
  add column niveau_waitlist text check (niveau_waitlist in ('superieur', 'autre')),
  -- Multi-select motivations from the "Quels sont tes objectifs ?" screen —
  -- stored for future data collection, no personalization logic reads this
  -- yet.
  add column motivations text[],
  add column daily_time_preference text check (daily_time_preference in ('moins_30', '30_60', '1h_2h', 'plus_2h')),
  add column city text,
  add column avatar_url text;

-- Avatar photos, uploaded from the "Parle-nous un peu de toi" onboarding
-- screen. Public bucket (avatars are just profile pictures, not sensitive)
-- with per-user write access: each file lives at "<user_id>/avatar.jpg", so
-- the folder-name check is enough to scope writes to the owner.
insert into storage.buckets (id, name, public)
values ('avatars', 'avatars', true)
on conflict (id) do nothing;

create policy "Avatar images are publicly readable"
  on storage.objects for select
  using (bucket_id = 'avatars');

create policy "Users can upload their own avatar"
  on storage.objects for insert
  with check (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "Users can update their own avatar"
  on storage.objects for update
  using (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "Users can delete their own avatar"
  on storage.objects for delete
  using (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);
