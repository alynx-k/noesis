-- Removes the throwaway row used to verify the generate-course pipeline
-- end-to-end (see 20260804100000_test_course_temp.sql).
delete from public.courses where id = 'test-pipeline-verification';
