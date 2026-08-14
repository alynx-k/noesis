import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

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
