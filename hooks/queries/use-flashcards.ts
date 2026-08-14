import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useAuth } from '@/context/auth';
import { generateFlashcards, getDeckCards, getDeckFiche, getDecks } from '@/lib/flashcards';

export function useFlashcardDecks() {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.flashcards.decks(user?.id),
    queryFn: getDecks,
    enabled: !!user,
  });
}

export function useGenerateFlashcards() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: (images: string[]) => generateFlashcards(images),
    onSuccess: (result) => {
      if (!('error' in result)) {
        queryClient.invalidateQueries({ queryKey: queryKeys.flashcards.decks(user?.id) });
      }
    },
  });
}

export function useDeckFiche(deckId: string) {
  return useQuery({
    queryKey: [...queryKeys.flashcards.deck(deckId), 'fiche'],
    queryFn: () => getDeckFiche(deckId),
    enabled: !!deckId,
  });
}

export function useDeckCards(deckId: string) {
  return useQuery({
    queryKey: [...queryKeys.flashcards.deck(deckId), 'cards'],
    queryFn: () => getDeckCards(deckId),
    enabled: !!deckId,
  });
}
