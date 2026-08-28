-- Same fix as 20260817500000: PostgREST caches column privileges, and the
-- grants added in 20260828090000 (niveau_waitlist, motivations,
-- daily_time_preference, city, avatar_url) aren't picked up until it
-- reloads — without this, onboarding keeps failing with a 403 even though
-- the grant is already in place.
notify pgrst, 'reload schema';
