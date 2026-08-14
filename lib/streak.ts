import { supabase } from '@/lib/supabase';

// Records today's activity toward the streaks table (added alongside the
// TanStack Query rewrite) — safe to call multiple times per day, since
// public.record_activity() is idempotent for same-day calls. Called from
// every activity-producing mutation (course completion, focus session
// success, flashcard review).
export async function recordActivity(): Promise<void> {
  const { error } = await supabase.rpc('record_activity');
  if (error) {
    console.error('Failed to record activity:', error);
  }
}

export type StreakInfo = {
  streak: number;
  weekDays: boolean[]; // Monday..Sunday of the current week
};

function startOfWeek(reference: Date): Date {
  const day = reference.getDay(); // 0 = Sunday
  const mondayOffset = day === 0 ? -6 : 1 - day;
  const monday = new Date(reference);
  monday.setDate(reference.getDate() + mondayOffset);
  monday.setHours(0, 0, 0, 0);
  return monday;
}

function toDateStrings(values: (string | null)[]): string[] {
  return values.filter((value): value is string => value !== null).map((value) => new Date(value).toDateString());
}

// A day counts toward the streak as soon as there's any real activity that
// day: at least one graded answer, a completed course, or a successful
// focus session. (Document scanning will join this list once it exists.)
// Exported for lib/notification-scheduler.ts, which needs the same
// activity-day set to detect "session done today" and days-since-last-
// activity — kept as the single source of truth rather than duplicating
// these three queries there.
export async function getActiveDays(): Promise<Set<string>> {
  const [answerAttempts, courseProgress, focusSessions] = await Promise.all([
    supabase.from('answer_attempts').select('created_at'),
    supabase.from('course_progress').select('completed_at').eq('completed', true).not('completed_at', 'is', null),
    supabase.from('focus_sessions').select('completed_at').eq('succeeded', true).not('completed_at', 'is', null),
  ]);

  if (answerAttempts.error || courseProgress.error || focusSessions.error) {
    console.error(
      'Failed to load activity days:',
      answerAttempts.error ?? courseProgress.error ?? focusSessions.error,
    );
    return new Set();
  }

  const days = [
    ...toDateStrings((answerAttempts.data ?? []).map((row) => row.created_at)),
    ...toDateStrings((courseProgress.data ?? []).map((row) => row.completed_at)),
    ...toDateStrings((focusSessions.data ?? []).map((row) => row.completed_at)),
  ];

  return new Set(days);
}

// Today is allowed to be empty without breaking the streak yet — it only
// resets once a full day has passed with no activity at all.
export async function getStreakInfo(): Promise<StreakInfo> {
  const activeDays = await getActiveDays();

  const cursor = new Date();
  if (!activeDays.has(cursor.toDateString())) {
    cursor.setDate(cursor.getDate() - 1);
  }
  let streak = 0;
  while (activeDays.has(cursor.toDateString())) {
    streak += 1;
    cursor.setDate(cursor.getDate() - 1);
  }

  const monday = startOfWeek(new Date());
  const weekDays: boolean[] = [];
  for (let i = 0; i < 7; i++) {
    const day = new Date(monday);
    day.setDate(monday.getDate() + i);
    weekDays.push(activeDays.has(day.toDateString()));
  }

  return { streak, weekDays };
}

export type MonthOverview = {
  monthLabel: string;
  days: { date: Date; active: boolean; isToday: boolean }[];
};

// Calendar view of the current month, for the "vue d'ensemble" screen.
export async function getMonthOverview(reference: Date = new Date()): Promise<MonthOverview> {
  const activeDays = await getActiveDays();

  const year = reference.getFullYear();
  const month = reference.getMonth();
  const daysInMonth = new Date(year, month + 1, 0).getDate();
  const today = new Date();

  const days = Array.from({ length: daysInMonth }, (_, index) => {
    const date = new Date(year, month, index + 1);
    return {
      date,
      active: activeDays.has(date.toDateString()),
      isToday: date.toDateString() === today.toDateString(),
    };
  });

  const monthLabel = reference.toLocaleDateString('fr-FR', { month: 'long', year: 'numeric' });

  return { monthLabel: monthLabel.charAt(0).toUpperCase() + monthLabel.slice(1), days };
}
