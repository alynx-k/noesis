-- Phase 11 : Parrainage
-- Chaque élève a un code de parrainage unique ; un nouveau code saisi crédite
-- 7 jours de Premium au parrain ET au filleul (PRD ne fixe pas le nombre de
-- jours exact — choix fait ici, cohérent avec un cadeau "une semaine offerte").

alter table public.profiles
  add column referral_code text unique;

comment on column public.profiles.referral_code is 'Code de parrainage personnel, généré à la création du compte.';

-- Le parrainage crédite des jours Premium comme un moyen de paiement à part.
-- Le nom exact de la contrainte auto-générée n'est pas garanti : on le
-- retrouve dynamiquement plutôt que de le supposer.
do $$
declare
  v_constraint_name text;
begin
  select conname into v_constraint_name
  from pg_constraint
  where conrelid = 'public.subscriptions'::regclass
    and contype = 'c'
    and pg_get_constraintdef(oid) ilike '%provider%';

  if v_constraint_name is not null then
    execute format('alter table public.subscriptions drop constraint %I', v_constraint_name);
  end if;

  execute $sql$alter table public.subscriptions
    add constraint subscriptions_provider_check
    check (provider in ('iap_ios', 'iap_android', 'wave', 'mtn', 'orange', 'referral'))$sql$;
end $$;

create table public.referrals (
  id uuid primary key default gen_random_uuid(),
  referrer_id uuid not null references auth.users (id) on delete cascade,
  referee_id uuid not null references auth.users (id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (referee_id),
  check (referrer_id <> referee_id)
);

comment on table public.referrals is 'Utilisation réussie d''un code de parrainage. Un élève ne peut être filleul qu''une seule fois. Écrite uniquement via redeem_referral_code().';

create index referrals_referrer_idx on public.referrals (referrer_id);

alter table public.referrals enable row level security;

create policy "Élève voit ses parrainages (en tant que parrain ou filleul)"
  on public.referrals for select
  to authenticated
  using (auth.uid() = referrer_id or auth.uid() = referee_id);

-- ---------------------------------------------------------------------------
-- Génération du code (appelée par handle_new_user, jamais par le client).
-- ---------------------------------------------------------------------------

create or replace function public.generate_referral_code()
returns text
language plpgsql
security definer
set search_path = public
as $$
declare
  chars constant text := 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'; -- sans 0/O/1/I, ambigus à l'oral/écrit
  code text;
  i int;
begin
  loop
    code := '';
    for i in 1..6 loop
      code := code || substr(chars, floor(random() * length(chars) + 1)::int, 1);
    end loop;
    exit when not exists (select 1 from public.profiles where referral_code = code);
  end loop;
  return code;
end;
$$;

revoke execute on function public.generate_referral_code() from public;

-- Recréée en entier (même corps que Phase 1) avec l'ajout du code de parrainage.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, phone, email, referral_code)
  values (new.id, new.phone, new.email, public.generate_referral_code());
  return new;
end;
$$;

-- ---------------------------------------------------------------------------
-- redeem_referral_code() : crédite parrain + filleul.
-- ---------------------------------------------------------------------------

create or replace function public.redeem_referral_code(p_code text)
returns table (granted_days int)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_referrer uuid;
  v_days constant int := 7;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  select id into v_referrer from public.profiles where referral_code = upper(trim(p_code));
  if v_referrer is null then
    raise exception 'Code de parrainage introuvable';
  end if;

  if v_referrer = v_user then
    raise exception 'Tu ne peux pas utiliser ton propre code';
  end if;

  if exists (select 1 from public.referrals where referee_id = v_user) then
    raise exception 'Tu as déjà utilisé un code de parrainage';
  end if;

  insert into public.referrals (referrer_id, referee_id) values (v_referrer, v_user);

  insert into public.subscriptions (user_id, provider, status, current_period_end)
  values (v_referrer, 'referral', 'active', now() + (v_days || ' days')::interval)
  on conflict (user_id) do update
    set status = 'active',
        current_period_end = greatest(public.subscriptions.current_period_end, now()) + (v_days || ' days')::interval;

  insert into public.subscriptions (user_id, provider, status, current_period_end)
  values (v_user, 'referral', 'active', now() + (v_days || ' days')::interval)
  on conflict (user_id) do update
    set status = 'active',
        current_period_end = greatest(public.subscriptions.current_period_end, now()) + (v_days || ' days')::interval;

  return query select v_days;
end;
$$;

grant execute on function public.redeem_referral_code(text) to authenticated;

-- ---------------------------------------------------------------------------
-- Backfill : les comptes créés avant cette migration n'ont pas de code.
-- ---------------------------------------------------------------------------

update public.profiles set referral_code = public.generate_referral_code() where referral_code is null;

alter table public.profiles alter column referral_code set not null;
