import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type FlashcardDeckSummary = {
  id: string;
  lesson_id: string | null;
  user_id: string | null;
  title: string;
  lessons: { title: string; subject_id: string; subjects: { name: string } | null } | null;
  flashcards: { id: string }[];
};

// RLS renvoie les decks pré-faits publiés de la classe/série de l'élève, plus
// ses propres decks personnalisés (Phase 6).
export function useFlashcardDecks() {
  return useQuery({
    queryKey: queryKeys.flashcardDecks,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('flashcard_decks')
        .select('id, lesson_id, user_id, title, lessons(title, subject_id, subjects(name)), flashcards(id)');
      if (error) throw error;
      return data as unknown as FlashcardDeckSummary[];
    },
  });
}

export function useCreatePersonalDeck() {
  const queryClient = useQueryClient();
  const { session } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (title: string) => {
      if (!userId) throw new Error('Non authentifié');
      const { data, error } = await supabase
        .from('flashcard_decks')
        .insert({ user_id: userId, title })
        .select('id')
        .single();
      if (error) throw error;
      return data as { id: string };
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.flashcardDecks });
    },
  });
}

export function useDeletePersonalDeck() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (deckId: string) => {
      const { error } = await supabase.from('flashcard_decks').delete().eq('id', deckId);
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.flashcardDecks });
    },
  });
}

export function useFlashcardDecksForLesson(lessonId: string | undefined) {
  return useQuery({
    queryKey: ['flashcard-decks', 'lesson', lessonId ?? ''] as const,
    enabled: !!lessonId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('flashcard_decks')
        .select('id, lesson_id, title, lessons(title, subject_id, subjects(name)), flashcards(id)')
        .eq('lesson_id', lessonId);
      if (error) throw error;
      return data as unknown as FlashcardDeckSummary[];
    },
  });
}

export type Flashcard = {
  id: string;
  deck_id: string;
  front_md: string;
  back_md: string;
  sort_order: number;
};

export function useFlashcardsForDeck(deckId: string | undefined) {
  return useQuery({
    queryKey: queryKeys.flashcards(deckId ?? ''),
    enabled: !!deckId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('flashcards')
        .select('id, deck_id, front_md, back_md, sort_order')
        .eq('deck_id', deckId)
        .order('sort_order');
      if (error) throw error;
      return data as Flashcard[];
    },
  });
}

export function useCreateFlashcard(deckId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (params: { frontMd: string; backMd: string; sortOrder: number }) => {
      const { error } = await supabase.from('flashcards').insert({
        deck_id: deckId,
        front_md: params.frontMd,
        back_md: params.backMd,
        sort_order: params.sortOrder,
      });
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.flashcards(deckId) });
    },
  });
}

export function useUpdateFlashcard(deckId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (params: { cardId: string; frontMd: string; backMd: string }) => {
      const { error } = await supabase
        .from('flashcards')
        .update({ front_md: params.frontMd, back_md: params.backMd })
        .eq('id', params.cardId);
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.flashcards(deckId) });
    },
  });
}

export function useDeleteFlashcard(deckId: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (cardId: string) => {
      const { error } = await supabase.from('flashcards').delete().eq('id', cardId);
      if (error) throw error;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.flashcards(deckId) });
    },
  });
}

export type SrsState = { due_at: string; interval_days: number };

export function useSrsReviews() {
  const { session } = useAuth();
  const userId = session?.user.id;

  return useQuery({
    queryKey: queryKeys.srsReviews(userId ?? ''),
    enabled: !!userId,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('srs_reviews')
        .select('flashcard_id, due_at, interval_days')
        .eq('user_id', userId);
      if (error) throw error;
      const map = new Map<string, SrsState>();
      for (const row of data ?? []) {
        map.set(row.flashcard_id as string, { due_at: row.due_at as string, interval_days: row.interval_days as number });
      }
      return map;
    },
  });
}

export function isDueToday(state: SrsState | undefined): boolean {
  if (!state) return true;
  return state.due_at <= new Date().toISOString().slice(0, 10);
}

export type ReviewFlashcardResult = { due_at: string; interval_days: number; xp_awarded: number };

export function useReviewFlashcard() {
  const queryClient = useQueryClient();
  const { session } = useAuth();
  const userId = session?.user.id;

  return useMutation({
    mutationFn: async (params: { flashcardId: string; known: boolean }) => {
      const { data, error } = await supabase.rpc('review_flashcard', {
        p_flashcard_id: params.flashcardId,
        p_known: params.known,
      });
      if (error) throw error;
      return (Array.isArray(data) ? data[0] : data) as ReviewFlashcardResult;
    },
    onSuccess: () => {
      if (!userId) return;
      queryClient.invalidateQueries({ queryKey: queryKeys.srsReviews(userId) });
      queryClient.invalidateQueries({ queryKey: queryKeys.streak(userId) });
    },
  });
}
