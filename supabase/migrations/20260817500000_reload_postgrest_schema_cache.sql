-- Force PostgREST to reload its schema cache immediately. Without this,
-- the `serie` columns added on profiles/courses (20260814100000) aren't
-- visible to the REST API until PostgREST's next scheduled schema reload,
-- causing every insert/update that references `serie` to fail client-side
-- with a generic "column not found in schema cache" error.
notify pgrst, 'reload schema';
