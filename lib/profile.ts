import { supabase } from './supabase';
import type { Grade, Serie } from '../constants/grades';
import type { ObjectiveId } from '../constants/objectives';

export async function completeOnboarding(params: {
  userId: string;
  grade: Grade;
  serie: Serie | null;
  objectiveIds: ObjectiveId[];
}) {
  const { userId, grade, serie, objectiveIds } = params;
  const { error } = await supabase
    .from('profiles')
    .update({
      grade,
      serie,
      objective_ids: objectiveIds,
      onboarding_completed_at: new Date().toISOString(),
    })
    .eq('id', userId);

  if (error) throw error;
}
