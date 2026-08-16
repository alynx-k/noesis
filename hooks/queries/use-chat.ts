import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

import { toast } from '@/components/ui/toast';
import { useAuth } from '@/context/auth';
import {
  ChatMessage,
  createChatSession,
  deleteChatSession,
  getChatMessages,
  listChatSessions,
  renameChatSession,
  saveChatMessage,
} from '@/lib/chat';

export function useChatSessions() {
  const { user } = useAuth();

  return useQuery({
    queryKey: ['chat-sessions', user?.id],
    queryFn: () => listChatSessions(user!.id),
    enabled: !!user,
  });
}

export function useChatMessages(sessionId: string | null) {
  return useQuery({
    queryKey: ['chat-messages', sessionId],
    queryFn: () => getChatMessages(sessionId!),
    enabled: !!sessionId,
  });
}

export function useCreateChatSession() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: () => createChatSession(user!.id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['chat-sessions', user?.id] });
    },
  });
}

export function useSaveChatMessage() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: ({ sessionId, message }: { sessionId: string; message: ChatMessage }) =>
      saveChatMessage(sessionId, message),
    onSuccess: (_data, variables) => {
      // The chat UI already holds the message locally the instant it's
      // sent, so no need to refetch the message list itself — just keep the
      // cached session (title/order in the sidebar) fresh.
      queryClient.invalidateQueries({ queryKey: ['chat-messages', variables.sessionId], refetchType: 'none' });
      queryClient.invalidateQueries({ queryKey: ['chat-sessions', user?.id] });
    },
    // Called from ai-chat.tsx as a fire-and-forget saveMessage.mutate(...)
    // — this is the only place a persistence failure can actually reach
    // the student, since saveChatMessage now throws instead of swallowing
    // the error. Without it, a message could silently fail to save with
    // the student none the wiser until they reopened the conversation
    // later and found it missing.
    onError: (error) => {
      console.error('Failed to save chat message:', error);
      toast.show('Message non enregistré, vérifie ta connexion.', { variant: 'error' });
    },
  });
}

export function useRenameChatSession() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: ({ sessionId, title }: { sessionId: string; title: string }) => renameChatSession(sessionId, title),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['chat-sessions', user?.id] });
    },
  });
}

export function useDeleteChatSession() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: (sessionId: string) => deleteChatSession(sessionId),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['chat-sessions', user?.id] });
    },
  });
}
