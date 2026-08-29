import { Card, createEmptyCard, fsrs, Grade, Rating, State } from 'ts-fsrs';

import { supabase } from '@/lib/supabase';

const f = fsrs();

type StoredState = {
  due: string;
  stability: number;
  difficulty: number;
  elapsed_days: number;
  scheduled_days: number;
  learning_steps: number;
  reps: number;
  lapses: number;
  state: number;
  last_review: string | null;
};

function rowToCard(row: StoredState): Card {
  return {
    due: new Date(row.due),
    stability: row.stability,
    difficulty: row.difficulty,
    elapsed_days: row.elapsed_days,
    scheduled_days: row.scheduled_days,
    learning_steps: row.learning_steps,
    reps: row.reps,
    lapses: row.lapses,
    state: row.state as State,
    last_review: row.last_review ? new Date(row.last_review) : undefined,
  };
}

function accuracyToGrade(accuracyRate: number): Grade {
  if (accuracyRate >= 1) {
    return Rating.Easy;
  }
  if (accuracyRate >= 0.75) {
    return Rating.Good;
  }
  if (accuracyRate >= 0.5) {
    return Rating.Hard;
  }
  return Rating.Again;
}

export async function scheduleNextReview(
  userId: string,
  courseId: string,
  accuracyRate: number,
): Promise<Date | null> {
  const { data: existingRow, error: fetchError } = await supabase
    .from('spaced_repetition_state')
    .select('due, stability, difficulty, elapsed_days, scheduled_days, learning_steps, reps, lapses, state, last_review')
    .eq('course_id', courseId)
    .maybeSingle();

  if (fetchError) {
    console.error('Failed to load spaced repetition state:', fetchError);
    return null;
  }

  const previousCard = existingRow ? rowToCard(existingRow as StoredState) : createEmptyCard(new Date());
  const grade = accuracyToGrade(accuracyRate);
  const { card: nextCard } = f.next(previousCard, new Date(), grade);

  const { error: upsertError } = await supabase.from('spaced_repetition_state').upsert(
    {
      user_id: userId,
      course_id: courseId,
      due: nextCard.due.toISOString(),
      stability: nextCard.stability,
      difficulty: nextCard.difficulty,
      elapsed_days: nextCard.elapsed_days,
      scheduled_days: nextCard.scheduled_days,
      learning_steps: nextCard.learning_steps,
      reps: nextCard.reps,
      lapses: nextCard.lapses,
      state: nextCard.state,
      last_review: nextCard.last_review ? nextCard.last_review.toISOString() : null,
      updated_at: new Date().toISOString(),
    },
    { onConflict: 'user_id,course_id' },
  );

  if (upsertError) {
    console.error('Failed to save spaced repetition state:', upsertError);
    return null;
  }

  return nextCard.due;
}

// One round trip for a subject's whole course list instead of one per course.
export async function getNextReviewDates(courseIds: string[]): Promise<Record<string, Date | null>> {
  if (courseIds.length === 0) {
    return {};
  }

  const { data, error } = await supabase.from('spaced_repetition_state').select('course_id, due').in('course_id', courseIds);

  if (error) {
    throw new Error(error.message);
  }

  const map: Record<string, Date | null> = {};
  courseIds.forEach((id) => {
    map[id] = null;
  });
  (data ?? []).forEach((row) => {
    map[row.course_id as string] = new Date(row.due as string);
  });
  return map;
}

