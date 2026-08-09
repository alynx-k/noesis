-- Temporary: one throwaway catalog row (no content) to verify the
-- generate-course on-demand pipeline end-to-end before expanding the real
-- catalog. Removed by the next migration once verified.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id)
values ('test-pipeline-verification', '4eme', 'histoire', 'Le peuplement du monde', 1, null);
