import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type AiConversation = {
  id: string;
  title: string;
  updated_at: string;
};

export function useAiConversations() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: queryKeys.aiConversations(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('ai_conversations')
        .select('id, title, updated_at')
        .order('updated_at', { ascending: false });
      if (error) throw error;
      return data as AiConversation[];
    },
  });
}

export type AiMessage = {
  id: string;
  role: 'user' | 'assistant';
  content: string;
  created_at: string;
};

export function useAiMessages(conversationId: string | undefined) {
  return useQuery({
    queryKey: queryKeys.aiMessages(conversationId ?? ''),
    enabled: !!conversationId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('ai_messages')
        .select('id, role, content, created_at')
        .eq('conversation_id', conversationId)
        .order('created_at');
      if (error) throw error;
      return data as AiMessage[];
    },
  });
}

export type SendTutorMessageResult = {
  conversationId: string;
  reply: string;
  trialsRemaining: number | null;
};

export function useSendTutorMessage() {
  const queryClient = useQueryClient();
  const { session, refreshProfile } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (params: { conversationId?: string; message: string }) => {
      const { data, error } = await supabase.functions.invoke<SendTutorMessageResult>('ai-tutor-chat', {
        body: params,
      });
      if (error) {
        // Le message d'erreur détaillé (ex: quota d'essais atteint) est dans le
        // corps JSON de la réponse HTTP, pas dans error.message par défaut.
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
    onSuccess: async (data) => {
      if (!userId) return;
      queryClient.invalidateQueries({ queryKey: queryKeys.aiMessages(data.conversationId) });
      queryClient.invalidateQueries({ queryKey: queryKeys.aiConversations(userId) });
      await refreshProfile();
    },
  });
}
