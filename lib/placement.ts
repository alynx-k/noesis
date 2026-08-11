import type { Subject } from '@/constants/courses';
import type { GradeId, SeriesId } from '@/constants/grades';
import { getCoursesForGrade } from '@/lib/courses';
import { initializeNeutralReviewState } from '@/lib/spaced-repetition';

export async function applyPlacement(
  userId: string,
  grade: GradeId,
  lastSeenBySubject: Partial<Record<Subject, string>>,
  serie: SeriesId | null = null,
): Promise<void> {
  const coursesForGrade = await getCoursesForGrade(grade, serie);
  const tasks: Promise<void>[] = [];

  for (const subject of Object.keys(lastSeenBySubject) as Subject[]) {
    const lastSeenCourseId = lastSeenBySubject[subject];
    if (!lastSeenCourseId) {
      continue;
    }

    const coursesForSubject = coursesForGrade.filter((course) => course.subject === subject);
    const lastSeenIndex = coursesForSubject.findIndex((course) => course.id === lastSeenCourseId);
    if (lastSeenIndex === -1) {
      continue;
    }

    for (const course of coursesForSubject.slice(0, lastSeenIndex + 1)) {
      tasks.push(initializeNeutralReviewState(userId, course.id));
    }
  }

  await Promise.all(tasks);
}
