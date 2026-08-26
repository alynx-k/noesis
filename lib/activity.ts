import { supabase } from '@/lib/supabase';

export type RecentActivityItem =
  | { type: 'course'; courseId: string; at: Date }
  | { type: 'focus'; durationMinutes: number; at: Date };

// Real events only, drawn from the two tables that already log a timestamp
// (course_progress.completed_at, focus_sessions.completed_at) — there's no
// unified activity-log table or XP/points ledger, so this merges the two
// sources client-side rather than inventing either.
export async function getRecentActivity(): Promise<RecentActivityItem[]> {
  const [courseProgress, focusSessions] = await Promise.all([
    supabase
      .from('course_progress')
      .select('course_id, completed_at')
      .eq('completed', true)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })
      .limit(5),
    supabase
      .from('focus_sessions')
      .select('duration_minutes, completed_at')
      .eq('succeeded', true)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })
      .limit(5),
  ]);

  if (courseProgress.error || focusSessions.error) {
    console.error('Failed to load recent activity:', courseProgress.error ?? focusSessions.error);
    return [];
  }

  const items: RecentActivityItem[] = [
    ...(courseProgress.data ?? []).map((row) => ({
      type: 'course' as const,
      courseId: row.course_id as string,
      at: new Date(row.completed_at as string),
    })),
    ...(focusSessions.data ?? []).map((row) => ({
      type: 'focus' as const,
      durationMinutes: row.duration_minutes as number,
      at: new Date(row.completed_at as string),
    })),
  ];

  return items.sort((a, b) => b.at.getTime() - a.at.getTime());
}
