import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

import { useAuth } from '@/context/auth';
import { ChatMessage, getChatMessages, getOrCreateChatSession, saveChatMessage } from '@/lib/chat';

async function fetchChatSession(userId: string): Promise<{ sessionId: string; messages: ChatMessage[] }> {
  const sessionId = await getOrCreateChatSession(userId);
  const messages = await getChatMessages(sessionId);
  return { sessionId, messages };
}

export function useChatSession() {
  const { user } = useAuth();

  return useQuery({
    queryKey: ['chat-session', user?.id],
    queryFn: () => fetchChatSession(user!.id),
    enabled: !!user,
  });
}

export function useSaveChatMessage(sessionId: string | undefined) {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: (message: ChatMessage) => {
      if (!sessionId) throw new Error('No active chat session');
      return saveChatMessage(sessionId, message);
    },
    onSuccess: () => {
      // Doesn't need to refetch the message list — the chat UI already holds
      // the message locally the instant it's sent — just keeps the cached
      // session fresh for the next time this screen mounts.
      queryClient.invalidateQueries({ queryKey: ['chat-session', user?.id], refetchType: 'none' });
    },
  });
}
