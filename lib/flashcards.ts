import { supabase } from '@/lib/supabase';

export type FlashcardDeck = {
  id: string;
  title: string;
  createdAt: Date;
  cardCount: number;
};

export type Flashcard = {
  id: string;
  question: string;
  answer: string;
};

export type FicheTable = {
  headers: string[];
  rows: string[][];
};

export type FicheSection = {
  heading: string;
  body: string;
  highlights: string[];
  table: FicheTable | null;
  callout: string | null;
};

export type FicheChapter = {
  title: string;
  intro: string;
  sections: FicheSection[];
};

export type Fiche = {
  chapters: FicheChapter[];
};

// These three used to swallow their Supabase error and resolve with a
// fallback (null/[]) instead of throwing — meaning the isError branches
// already built in flashcards.tsx/flashcard-deck.tsx (SkeletonList's
// sibling ErrorState, with a retry) could never actually fire from a real
// network/DB failure. A genuine fetch error was indistinguishable from "no
// decks yet" or "this deck has no fiche", so the student got a misleading
// empty/onboarding state with no way to retry instead of the error UI that
// was built for exactly this.
export async function getDeckFiche(deckId: string): Promise<Fiche | null> {
  const { data, error } = await supabase.from('flashcard_decks').select('fiche').eq('id', deckId).single();

  if (error) {
    console.error('Failed to load deck fiche:', error);
    throw new Error(error.message);
  }

  return (data?.fiche as Fiche | null) ?? null;
}

export async function getDecks(): Promise<FlashcardDeck[]> {
  const { data, error } = await supabase
    .from('flashcard_decks')
    .select('id, title, created_at, flashcards(count)')
    .order('created_at', { ascending: false });

  if (error) {
    console.error('Failed to load flashcard decks:', error);
    throw new Error(error.message);
  }

  return (data ?? []).map((row) => ({
    id: row.id as string,
    title: row.title as string,
    createdAt: new Date(row.created_at as string),
    cardCount: Array.isArray(row.flashcards) ? (row.flashcards[0]?.count ?? 0) : 0,
  }));
}

export async function getDeckCards(deckId: string): Promise<Flashcard[]> {
  const { data, error } = await supabase
    .from('flashcards')
    .select('id, question, answer')
    .eq('deck_id', deckId)
    .order('created_at', { ascending: true });

  if (error) {
    console.error('Failed to load flashcards:', error);
    throw new Error(error.message);
  }

  return (data ?? []) as Flashcard[];
}

export type GenerateFlashcardsResult =
  | { deckId: string; title: string; cardCount: number }
  | { error: string };

export async function generateFlashcards(images: string[]): Promise<GenerateFlashcardsResult> {
  const { data, error } = await supabase.functions.invoke('generate-flashcards', {
    body: { images },
  });

  if (error || !data?.deckId) {
    console.error('Failed to generate flashcards:', error, data);
    return { error: data?.error ?? "Impossible de générer les fiches, réessaie." };
  }

  return { deckId: data.deckId, title: data.title, cardCount: data.cardCount };
}
