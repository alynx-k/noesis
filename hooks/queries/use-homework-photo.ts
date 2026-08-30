import { useMutation } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';

export type HomeworkPhotoResult = {
  illegible: boolean;
  result?: string;
  trialsRemaining: number | null;
};

export function useSubmitHomeworkPhoto() {
  const { refreshProfile } = useAuth();

  return useMutation({
    mutationFn: async (params: { mode: 'correct' | 'prepare'; imageBase64: string; mimeType: string }) => {
      const { data, error } = await supabase.functions.invoke<HomeworkPhotoResult>('homework-photo', {
        body: params,
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
    },
  });
}
