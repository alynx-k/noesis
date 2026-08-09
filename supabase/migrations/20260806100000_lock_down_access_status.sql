-- Fixes a real gap in the previous migration: Supabase grants UPDATE/INSERT
-- on public.profiles to authenticated/anon at the TABLE level by default,
-- and a column-specific REVOKE does not override that broader table-level
-- grant (verified live: a client PATCH setting access_status='premium'
-- still succeeded after the earlier `revoke update (access_status) ...`).
--
-- The correct fix is default-deny: revoke the table-level privilege
-- entirely, then re-grant UPDATE/INSERT only for the exact columns the app
-- legitimately writes from the client (see lib/grade.ts, lib/lv2.ts).
-- access_status is deliberately left out of both allow-lists — only a
-- service-role process (the future Stripe webhook) can change it.
revoke update on public.profiles from authenticated, anon;
revoke insert on public.profiles from authenticated, anon;

grant update (grade, grade_last_changed_at, lv2) on public.profiles to authenticated;
grant insert (user_id, grade, grade_first_selected_at, grade_last_changed_at) on public.profiles to authenticated;
