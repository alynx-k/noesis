-- 20260814100000_add_serie_lycee.sql added the `serie` column to `profiles`
-- but the table's insert/update privileges are locked down to an explicit
-- per-column allow-list (see 20260806100000_lock_down_access_status.sql) —
-- any payload touching an ungranted column is rejected outright with
-- "permission denied for table profiles", which is exactly what broke
-- picking a lycée grade (2nde/1ère/Terminale) client-side. Add `serie` to
-- the same allow-list as `grade`.
grant insert (serie) on public.profiles to authenticated;
grant update (serie) on public.profiles to authenticated;
