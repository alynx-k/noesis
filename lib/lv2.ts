import type { Lv2Id } from '@/constants/lv2';
import { supabase } from '@/lib/supabase';

export async function getLv2(): Promise<Lv2Id | null> {
  const { data, error } = await supabase.from('profiles').select('lv2').maybeSingle();

  if (error) {
    console.error('Failed to load lv2 choice:', error);
    return null;
  }
  return (data?.lv2 as Lv2Id | null) ?? null;
}

export async function setLv2(userId: string, lv2: Lv2Id): Promise<{ error: string | null }> {
  const { error } = await supabase.from('profiles').update({ lv2 }).eq('user_id', userId);

  if (error) {
    console.error('Failed to save lv2 choice:', error);
    return { error: "Impossible d'enregistrer ton choix, réessaie." };
  }
  return { error: null };
}
