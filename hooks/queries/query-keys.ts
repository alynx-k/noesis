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
  placement: {
    forUser: (userId: string | undefined) => ['placement', userId] as const,
  },
  profile: {
    forUser: (userId: string | undefined) => ['profile', userId] as const,
  },
  flashcards: {
    decks: (userId: string | undefined) => ['flashcard-decks', userId] as const,
    deck: (deckId: string) => ['flashcard-deck', deckId] as const,
  },
  focusSessions: {
    all: (userId: string | undefined) => ['focus-sessions', userId] as const,
  },
  leaderboard: {
    all: () => ['leaderboard'] as const,
  },
  courseHistory: {
    forUser: (userId: string | undefined) => ['course-history', userId] as const,
  },
  achievements: {
    forUser: (userId: string | undefined) => ['achievements', userId] as const,
  },
};
