import type { Subject } from '@/constants/courses';
import type { GradeId, SeriesId } from '@/constants/grades';
import { getCoursesForGrade } from '@/lib/courses';
import { supabase } from '@/lib/supabase';
import { initializeNeutralReviewState } from '@/lib/spaced-repetition';

// Server-persisted replacement for lib/placement-storage.ts's AsyncStorage
// flag, so the "have I been through placement" state survives a reinstall.
export async function getPlacementState(): Promise<{ handled: boolean }> {
  const { data, error } = await supabase.from('placement_state').select('user_id').maybeSingle();

  if (error) {
    throw new Error(error.message);
  }
  return { handled: !!data };
}

export async function recordPlacementHandled(userId: string, skipped: boolean): Promise<void> {
  const { error } = await supabase
    .from('placement_state')
    .upsert({ user_id: userId, skipped, handled_at: new Date().toISOString() });

  if (error) {
    throw new Error(error.message);
  }
}

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
