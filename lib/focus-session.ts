import { supabase } from '@/lib/supabase';

export async function startFocusSession(userId: string, durationMinutes: number): Promise<string | null> {
  const { data, error } = await supabase
    .from('focus_sessions')
    .insert({ user_id: userId, duration_minutes: durationMinutes })
    .select('id')
    .single();

  if (error || !data) {
    console.error('Failed to start focus session:', error);
    return null;
  }
  return data.id as string;
}

export async function finishFocusSession(sessionId: string, succeeded: boolean): Promise<void> {
  const { error } = await supabase
    .from('focus_sessions')
    .update({ completed_at: new Date().toISOString(), succeeded })
    .eq('id', sessionId);

  if (error) {
    console.error('Failed to finish focus session:', error);
  }
}

// Total minutes across every successful focus session — only sessions that
// actually finished count, same convention as getSuccessfulSessionCount and
// getLaunches (an abandoned session isn't real focus time).
export async function getTotalLearningMinutes(): Promise<number> {
  const { data, error } = await supabase.from('focus_sessions').select('duration_minutes').eq('succeeded', true);

  if (error || !data) {
    console.error('Failed to load total learning minutes:', error);
    return 0;
  }
  return data.reduce((sum, row) => sum + (row.duration_minutes as number), 0);
}

export async function getSuccessfulSessionCount(): Promise<number> {
  const { count, error } = await supabase
    .from('focus_sessions')
    .select('id', { count: 'exact', head: true })
    .eq('succeeded', true);

  if (error || count === null) {
    console.error('Failed to load successful session count:', error);
    return 0;
  }
  return count;
}

export type Launch = {
  id: string;
  durationMinutes: number;
  completedAt: Date;
  // 1-based order this launch happened in, oldest first — drives which
  // destination in the space atlas each launch reached.
  sequence: number;
};

// Ascending (oldest first) so `sequence` lines up with the space atlas'
// unlock thresholds.
export async function getLaunches(): Promise<Launch[]> {
  const { data, error } = await supabase
    .from('focus_sessions')
    .select('id, duration_minutes, completed_at')
    .eq('succeeded', true)
    .order('completed_at', { ascending: true });

  if (error || !data) {
    console.error('Failed to load launches:', error);
    return [];
  }

  return data.map((row, index) => ({
    id: row.id as string,
    durationMinutes: row.duration_minutes as number,
    completedAt: new Date(row.completed_at as string),
    sequence: index + 1,
  }));
}
