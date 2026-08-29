import { useQuery } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { queryKeys } from './query-keys';

export type Subject = {
  id: string;
  slug: string;
  name: string;
  sort_order: number;
};

export function useSubjects() {
  return useQuery({
    queryKey: queryKeys.subjects,
    queryFn: async () => {
      const { data, error } = await supabase.from('subjects').select('*').order('sort_order');
      if (error) throw error;
      return data as Subject[];
    },
  });
}
