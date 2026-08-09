-- Scanned-document flashcards (Parkeur-style): a deck groups the cards
-- generated from one scan session, each card is a simple question/answer
-- pair flipped during study. Independent from the written courses/exercises
-- system — no spaced-repetition scheduling for these yet.
create table public.flashcard_decks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  title text not null,
  created_at timestamptz not null default now()
);

create table public.flashcards (
  id uuid primary key default gen_random_uuid(),
  deck_id uuid not null references public.flashcard_decks (id) on delete cascade,
  user_id uuid not null references auth.users (id) on delete cascade,
  question text not null,
  answer text not null,
  created_at timestamptz not null default now()
);

create index flashcards_deck_id_idx on public.flashcards (deck_id);

alter table public.flashcard_decks enable row level security;
alter table public.flashcards enable row level security;

create policy "Users can view their own decks"
  on public.flashcard_decks for select
  using (auth.uid() = user_id);

create policy "Users can insert their own decks"
  on public.flashcard_decks for insert
  with check (auth.uid() = user_id);

create policy "Users can delete their own decks"
  on public.flashcard_decks for delete
  using (auth.uid() = user_id);

create policy "Users can view their own flashcards"
  on public.flashcards for select
  using (auth.uid() = user_id);

create policy "Users can insert their own flashcards"
  on public.flashcards for insert
  with check (auth.uid() = user_id);

create policy "Users can delete their own flashcards"
  on public.flashcards for delete
  using (auth.uid() = user_id);
