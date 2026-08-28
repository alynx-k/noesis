-- 20260827130000_onboarding_extras.sql added niveau_waitlist, motivations,
-- daily_time_preference, city, avatar_url to profiles, but the table's
-- insert/update privileges are locked to an explicit per-column allow-list
-- (see 20260806100000_lock_down_access_status.sql and the same fix already
-- applied once for `serie` in 20260817510000) — any payload touching an
-- ungranted column is rejected outright with "permission denied for table
-- profiles" (a 403 from PostgREST), which is exactly what broke finishing
-- onboarding. Add the new columns to the same allow-list as grade/serie.
grant insert (niveau_waitlist, motivations, daily_time_preference, city, avatar_url) on public.profiles to authenticated;
grant update (niveau_waitlist, motivations, daily_time_preference, city, avatar_url) on public.profiles to authenticated;
