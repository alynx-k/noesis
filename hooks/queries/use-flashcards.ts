import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { supabase } from '../../lib/supabase';
import { useAuth } from '../../context/auth';
import { queryKeys } from './query-keys';

export type FlashcardDeckSummary = {
  id: string;
  lesson_id: string;
  title: string;
  lessons: { title: string; subject_id: string; subjects: { name: string } | null } | null;
  flashcards: { id: string }[];
};

// RLS ne renvoie déjà que les decks publiés de la classe/série de l'élève.
export function useFlashcardDecks() {
  return useQuery({
    queryKey: queryKeys.flashcardDecks,
    queryFn: async () => {
      const { data, error } = await supabase
        .from('flashcard_decks')
        .select('id, lesson_id, title, lessons(title, subject_id, subjects(name)), flashcards(id)');
      if (error) throw error;
      return data as unknown as FlashcardDeckSummary[];
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
