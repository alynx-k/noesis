import { supabase } from '@/lib/supabase';

export type ChatMessage = { role: 'user' | 'assistant'; content: string };

// One ongoing session per user, created lazily — see the migration comment
// for why this isn't a multi-thread inbox.
export async function getOrCreateChatSession(userId: string): Promise<string> {
  const { data: existing, error: fetchError } = await supabase
    .from('chat_sessions')
    .select('id')
    .eq('user_id', userId)
    .maybeSingle();

  if (fetchError) {
    throw new Error(fetchError.message);
  }
  if (existing) {
    return existing.id as string;
  }

  const { data: created, error: insertError } = await supabase
    .from('chat_sessions')
    .insert({ user_id: userId })
    .select('id')
    .single();

  if (insertError || !created) {
    throw new Error(insertError?.message ?? 'Impossible de démarrer la conversation.');
  }
  return created.id as string;
}

export async function getChatMessages(sessionId: string): Promise<ChatMessage[]> {
  const { data, error } = await supabase
    .from('chat_messages')
    .select('role, content')
    .eq('session_id', sessionId)
    .order('created_at', { ascending: true });

  if (error) {
    throw new Error(error.message);
  }
  return (data ?? []) as ChatMessage[];
}

export async function saveChatMessage(sessionId: string, message: ChatMessage): Promise<void> {
  const { error } = await supabase.from('chat_messages').insert({
    session_id: sessionId,
    role: message.role,
    content: message.content,
  });

  if (error) {
    console.error('Failed to save chat message:', error);
  }
}
