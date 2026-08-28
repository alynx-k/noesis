import { GradeId, SeriesId } from '@/constants/grades';

// Centralized query key builders so every call site invalidates the same
// shape of key it read — a hand-typed array here and a hand-typed array at
// the invalidation call site is how caches silently go stale.
export const queryKeys = {
  courses: {
    forGrade: (grade: GradeId | null, serie: SeriesId | null) => ['courses', grade, serie] as const,
    detail: (courseId: string) => ['course', courseId] as const,
  },
  progress: {
    forCourse: (userId: string | undefined, courseId: string) => ['progress', userId, courseId] as const,
    all: (userId: string | undefined) => ['progress', userId] as const,
  },
  spacedRepetition: {
    forCourse: (userId: string | undefined, courseId: string) => ['spaced-repetition', userId, courseId] as const,
    datesForCourses: (userId: string | undefined, courseIds: string[]) =>
      ['next-review-dates', userId, ...courseIds] as const,
  },
  streak: {
    forUser: (userId: string | undefined) => ['streak', userId] as const,
  },
  profile: {
    forUser: (userId: string | undefined) => ['profile', userId] as const,
  },
  accessStatus: {
    forUser: (userId: string | undefined) => ['access-status', userId] as const,
  },
  flashcards: {
    decks: (userId: string | undefined) => ['flashcard-decks', userId] as const,
    deck: (deckId: string) => ['flashcard-deck', deckId] as const,
  },
  focusSessions: {
    all: (userId: string | undefined) => ['focus-sessions', userId] as const,
  },
  league: {
    mine: () => ['league', 'mine'] as const,
  },
  courseHistory: {
    // Deliberately just the prefix (no grade/serie) — use-spaced-repetition.ts
    // invalidates with this alone, which TanStack Query matches against any
    // key starting with it, so it correctly invalidates every grade/serie
    // variant at once. use-course-history.ts extends this with grade/serie
    // for the actual fetch key (see there for why that part matters).
    forUser: (userId: string | undefined) => ['course-history', userId] as const,
  },
  achievements: {
    forUser: (userId: string | undefined) => ['achievements', userId] as const,
  },
  referral: {
    code: (userId: string | undefined) => ['referral-code', userId] as const,
  },
};
