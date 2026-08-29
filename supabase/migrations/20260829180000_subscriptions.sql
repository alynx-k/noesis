-- Phase 3 : Abonnement Premium
-- Statut d'abonnement unifié quel que soit le moyen de paiement (IAP, Wave, MTN, Orange).

create table public.subscriptions (
  user_id uuid primary key references auth.users (id) on delete cascade,
  provider text not null check (provider in ('iap_ios', 'iap_android', 'wave', 'mtn', 'orange')),
  status text not null default 'active' check (status in ('active', 'expired', 'cancelled')),
  current_period_end timestamptz not null,
  external_reference text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.subscriptions is 'Statut Premium courant d''un élève. Écrite uniquement par les edge functions (service role) via checkout/webhooks de paiement.';

create trigger subscriptions_set_updated_at
  before update on public.subscriptions
  for each row
  execute function public.set_updated_at();

-- Réutilisée par les policies des phases suivantes (exercices, flashcards perso, tuteur IA).
create or replace function public.is_premium()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1 from public.subscriptions
    where user_id = auth.uid()
      and status = 'active'
      and current_period_end > now()
  );
$$;

alter table public.subscriptions enable row level security;

create policy "Un élève voit son propre abonnement"
  on public.subscriptions for select
  to authenticated
  using (auth.uid() = user_id);

-- Pas de policy insert/update/delete : seules les edge functions (service role,
-- après confirmation réelle du paiement) peuvent écrire dans cette table.
