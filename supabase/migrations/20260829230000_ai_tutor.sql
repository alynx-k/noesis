-- Phase 7 : Tuteur IA (chat)
-- Un élève Premium discute avec le tuteur IA sans limite ; un élève gratuit
-- dispose d'un nombre limité d'essais (voir AI_FREE_TRIAL_LIMIT côté edge
-- function ai-tutor-chat). Écriture des conversations/messages uniquement
-- via l'edge function (service role) — même pattern que subscriptions.

alter table public.profiles
  add column ai_trials_used int not null default 0;

comment on column public.profiles.ai_trials_used is 'Nombre de messages envoyés au tuteur IA par un élève gratuit. Incrémenté uniquement par la fonction ai-tutor-chat.';

create table public.ai_conversations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  title text not null default 'Nouvelle conversation',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.ai_conversations is 'Conversation d''un élève avec le tuteur IA. Écrite uniquement par ai-tutor-chat (service role).';

create index ai_conversations_user_idx on public.ai_conversations (user_id, updated_at desc);

create table public.ai_messages (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references public.ai_conversations (id) on delete cascade,
  role text not null check (role in ('user', 'assistant')),
  content text not null,
  created_at timestamptz not null default now()
);

comment on table public.ai_messages is 'Message d''une conversation avec le tuteur IA. Écrite uniquement par ai-tutor-chat (service role).';

create index ai_messages_conversation_idx on public.ai_messages (conversation_id, created_at);

alter table public.ai_conversations enable row level security;

create policy "Élève voit ses propres conversations"
  on public.ai_conversations for select
  to authenticated
  using (auth.uid() = user_id);

alter table public.ai_messages enable row level security;

create policy "Élève voit les messages de ses propres conversations"
  on public.ai_messages for select
  to authenticated
  using (
    exists (
      select 1 from public.ai_conversations c
      where c.id = ai_messages.conversation_id and c.user_id = auth.uid()
    )
  );
