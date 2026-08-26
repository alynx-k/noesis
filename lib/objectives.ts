import { supabase } from '@/lib/supabase';

// Fixed, system-defined objective templates — not yet user-customizable
// (there's no goal-authoring UI/table for that), but every number here is
// computed live from real progress data, never invented.
export type Objective = {
  id: string;
  title: string;
  current: number;
  target: number;
};

const WEEKLY_LESSONS_TARGET = 5;
const STREAK_TARGET = 7;
const SCORE_TARGET = 80;

function startOfWeekIso(): string {
  const now = new Date();
  const day = now.getDay(); // 0 = Sunday
  const mondayOffset = day === 0 ? -6 : 1 - day;
  const monday = new Date(now);
  monday.setDate(now.getDate() + mondayOffset);
  monday.setHours(0, 0, 0, 0);
  return monday.toISOString();
}

// Lessons completed since Monday — course_progress.completed_at is written
// by context/progress.tsx's completeCourse, so this is a real, live count.
export async function getLessonsCompletedThisWeek(userId: string): Promise<number> {
  const { count, error } = await supabase
    .from('course_progress')
    .select('course_id', { count: 'exact', head: true })
    .eq('user_id', userId)
    .eq('completed', true)
    .gte('completed_at', startOfWeekIso());

  if (error || count === null) {
    console.error('Failed to load lessons completed this week:', error);
    return 0;
  }
  return count;
}

export function buildObjectives(params: {
  lessonsThisWeek: number;
  streak: number;
  averageScore: number | null;
}): Objective[] {
  return [
    {
      id: 'weekly-lessons',
      title: `Terminer ${WEEKLY_LESSONS_TARGET} leçons cette semaine`,
      current: Math.min(params.lessonsThisWeek, WEEKLY_LESSONS_TARGET),
      target: WEEKLY_LESSONS_TARGET,
    },
    {
      id: 'streak',
      title: `Maintenir une série de ${STREAK_TARGET} jours`,
      current: Math.min(params.streak, STREAK_TARGET),
      target: STREAK_TARGET,
    },
    {
      id: 'score',
      title: `Atteindre ${SCORE_TARGET}% de score moyen`,
      current: Math.min(params.averageScore ?? 0, SCORE_TARGET),
      target: SCORE_TARGET,
    },
  ];
}
