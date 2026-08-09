// Course catalog and content now live in the `courses` Supabase table
// (see lib/courses.ts) instead of being hardcoded here — this file only
// keeps the shared subject vocabulary used to group Histoire-Géographie's
// two subjects in the course list UI.
export type Subject = 'geographie' | 'histoire';

export const SUBJECT_LABELS: Record<Subject, string> = {
  geographie: 'Géographie',
  histoire: 'Histoire',
};
