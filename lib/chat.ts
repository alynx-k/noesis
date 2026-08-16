import { supabase } from '@/lib/supabase';

export type ChatMessage = { role: 'user' | 'assistant'; content: string };

export type ChatSessionSummary = {
  id: string;
  title: string | null;
  createdAt: string;
  updatedAt: string;
};

const TITLE_MAX_LENGTH = 40;

// First few words of the opening message, not a real summary — cheap,
// synchronous, and reads exactly like what the user typed rather than an
// AI-generated paraphrase they didn't ask for.
export function deriveSessionTitle(firstMessage: string): string {
  const cleaned = firstMessage.trim().replace(/\s+/g, ' ');
  if (cleaned.length <= TITLE_MAX_LENGTH) {
    return cleaned;
  }
  return cleaned.slice(0, TITLE_MAX_LENGTH).trimEnd() + '…';
}

export async function listChatSessions(userId: string): Promise<ChatSessionSummary[]> {
  const { data, error } = await supabase
    .from('chat_sessions')
    .select('id, title, created_at, updated_at')
    .eq('user_id', userId)
    .order('updated_at', { ascending: false });

  if (error) {
    throw new Error(error.message);
  }

  return (data ?? []).map((row) => ({
    id: row.id as string,
    title: row.title as string | null,
    createdAt: row.created_at as string,
    updatedAt: row.updated_at as string,
  }));
}

export async function createChatSession(userId: string): Promise<string> {
  const { data, error } = await supabase.from('chat_sessions').insert({ user_id: userId }).select('id').single();

  if (error || !data) {
    throw new Error(error?.message ?? 'Impossible de créer la conversation.');
  }
  return data.id as string;
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
    // Throwing (rather than swallowing and resolving normally) is what
    // lets useSaveChatMessage's mutation actually detect the failure —
    // this used to always resolve, so the student had no way of finding
    // out a message never made it to the database short of reopening the
    // conversation later and noticing it missing.
    throw new Error(error.message);
  }
}

export async function renameChatSession(sessionId: string, title: string): Promise<void> {
  const { error } = await supabase.from('chat_sessions').update({ title }).eq('id', sessionId);
  if (error) {
    throw new Error(error.message);
  }
}

export async function deleteChatSession(sessionId: string): Promise<void> {
  const { error } = await supabase.from('chat_sessions').delete().eq('id', sessionId);
  if (error) {
    throw new Error(error.message);
  }
}
