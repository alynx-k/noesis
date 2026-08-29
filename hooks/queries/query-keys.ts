export const queryKeys = {
  subjects: ['subjects'] as const,
  lessons: (subjectId: string) => ['lessons', subjectId] as const,
  lesson: (lessonId: string) => ['lesson', lessonId] as const,
  progress: (userId: string) => ['lesson-progress', userId] as const,
  streak: (userId: string) => ['streak', userId] as const,
  subscription: (userId: string) => ['subscription', userId] as const,
};
