// Course catalog and content now live in the `courses` Supabase table
// (see lib/courses.ts) instead of being hardcoded here — this file only
// keeps the shared subject vocabulary, matching every value used across
// DISCIPLINES' `subjects` arrays (constants/disciplines.ts). Histoire-
// Géographie is the one discipline split into two subjects for the course
// list UI; every other discipline maps 1:1 to a single subject here.
export type Subject =
  | 'geographie'
  | 'histoire'
  | 'mathematiques'
  | 'anglais'
  | 'francais'
  | 'edhc'
  | 'physique-chimie'
  | 'svt'
  | 'espagnol'
  | 'allemand'
  | 'philosophie'
  | 'tice';

export const SUBJECT_LABELS: Record<Subject, string> = {
  geographie: 'Géographie',
  histoire: 'Histoire',
  mathematiques: 'Mathématiques',
  anglais: 'Anglais',
  francais: 'Français',
  edhc: 'EDHC',
  'physique-chimie': 'Physique-Chimie',
  svt: 'SVT',
  espagnol: 'Espagnol',
  allemand: 'Allemand',
  philosophie: 'Philosophie',
  tice: 'TICE',
};
