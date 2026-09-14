import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type CourseSummary = {
  id: string;
  title: string;
  content_md: string;
  created_at: string;
};

export function useCourseSummaries() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: queryKeys.courseSummaries(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('course_summaries')
        .select('id, title, content_md, created_at')
        .order('created_at', { ascending: false });
      if (error) throw error;
      return data as CourseSummary[];
    },
  });
}

type CreateSummaryResult = {
  illegible: boolean;
  summary?: CourseSummary;
  trialsRemaining: number | null;
};

export function useCreateCourseSummary() {
  const queryClient = useQueryClient();
  const { session, refreshProfile } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (images: { base64: string; mimeType: string }[]) => {
      const { data, error } = await supabase.functions.invoke<CreateSummaryResult>('course-summary', {
        body: { images },
      });
      if (error) {
        const context = (error as { context?: Response }).context;
        let message = error.message;
        if (context && typeof context.json === 'function') {
          try {
            const body = await context.json();
            if (body?.error) message = body.error;
          } catch {
            // corps non-JSON, on garde le message par défaut
          }
        }
        throw new Error(message);
      }
      if (!data) throw new Error('Réponse vide du tuteur IA.');
      return data;
    },
    onSuccess: async () => {
      await refreshProfile();
      if (userId) await queryClient.invalidateQueries({ queryKey: queryKeys.courseSummaries(userId) });
    },
  });
}

export function useDeleteCourseSummary() {
  const queryClient = useQueryClient();
  const { session } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase.from('course_summaries').delete().eq('id', id);
      if (error) throw error;
    },
    onSuccess: () => {
      if (userId) queryClient.invalidateQueries({ queryKey: queryKeys.courseSummaries(userId) });
    },
  });
}
