-- Phase 1 : Auth & Onboarding
-- Table profils élève + création automatique à l'inscription + RLS.

create table public.profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  phone text,
  email text,
  grade text,
  serie text check (serie in ('A', 'C', 'D')),
  objective_ids text[] not null default '{}',
  onboarding_completed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.profiles is 'Profil élève : classe, série (lycée), objectifs de révision.';

-- Une classe valide n'est requise qu'une fois l'onboarding terminé, pas à la création de la ligne.
alter table public.profiles
  add constraint profiles_grade_check
  check (
    onboarding_completed_at is null
    or grade in ('6e', '5e', '4e', '3e', '2nde', '1ere', 'terminale')
  );

alter table public.profiles
  add constraint profiles_serie_requires_lycee_check
  check (serie is null or grade in ('1ere', 'terminale'));

create index profiles_grade_serie_idx on public.profiles (grade, serie);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger profiles_set_updated_at
  before update on public.profiles
  for each row
  execute function public.set_updated_at();

-- Crée automatiquement une ligne de profil (vide) dès qu'un compte auth est créé,
-- que ce soit par téléphone (OTP) ou par email (OTP). L'onboarding la complète ensuite.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, phone, email)
  values (new.id, new.phone, new.email);
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row
  execute function public.handle_new_user();

alter table public.profiles enable row level security;

create policy "Un élève voit son propre profil"
  on public.profiles for select
  using (auth.uid() = id);

create policy "Un élève modifie son propre profil"
  on public.profiles for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- Pas de policy insert/delete : la création se fait uniquement via le trigger
-- (security definer) et la suppression via la cascade sur auth.users.
