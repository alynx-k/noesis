import { useQuery } from '@tanstack/react-query';

import { ExerciseQuestion, getCourseTitle, getExerciseQuestions } from '@/lib/courses';
import { CONTENT_STALE_TIME } from '@/lib/query-client';

type ExerciseData = {
  questions: ExerciseQuestion[];
  courseTitle: string;
};

async function fetchExercise(courseId: string): Promise<ExerciseData> {
  const [questions, courseTitle] = await Promise.all([getExerciseQuestions(courseId), getCourseTitle(courseId)]);
  return { questions, courseTitle };
}

export function useExercise(courseId: string) {
  return useQuery({
    queryKey: ['exercise', courseId],
    queryFn: () => fetchExercise(courseId),
    staleTime: CONTENT_STALE_TIME,
    enabled: !!courseId,
  });
}
