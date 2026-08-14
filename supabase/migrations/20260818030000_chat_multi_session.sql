-- Upgrades the single ongoing chat session (see 20260818020000) into a real
-- multi-conversation history: a titled, deletable, renamable list of
-- sessions per user, sorted by last activity — the shape needed for a
-- sidebar of past conversations grouped by date.
alter table public.chat_sessions add column title text;

-- Bumps a session's updated_at whenever a message is added to it, so the
-- sidebar can sort by "most recently active" without the client having to
-- remember to touch the parent row on every message insert.
create function public.touch_chat_session_updated_at()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  update public.chat_sessions set updated_at = now() where id = new.session_id;
  return new;
end;
$$;

create trigger chat_messages_touch_session
  after insert on public.chat_messages
  for each row execute function public.touch_chat_session_updated_at();

create policy "Users can update their own chat sessions"
  on public.chat_sessions for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "Users can delete their own chat sessions"
  on public.chat_sessions for delete
  using (auth.uid() = user_id);
