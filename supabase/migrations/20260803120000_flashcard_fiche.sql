-- Adds the structured "fiche de révision" (written revision sheet) that the
-- scanner now generates alongside flashcards: chapters, each with sections
-- that can carry highlighted key terms, an optional table, and an optional
-- "à retenir" callout. Nullable since decks generated before this change
-- have no fiche.
alter table public.flashcard_decks
  add column fiche jsonb;
