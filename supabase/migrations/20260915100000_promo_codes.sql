-- Codes promo à usage unique : chacun accorde un nombre de jours de Premium
-- à l'élève qui le saisit, indépendamment du parrainage (pas de parrain
-- associé). Générés manuellement par l'administrateur (le développeur),
-- distribués hors app (réseaux sociaux, bêta-testeurs, etc.).

create table public.promo_codes (
  code text primary key,
  premium_days int not null,
  redeemed_by uuid references public.profiles (id),
  redeemed_at timestamptz,
  created_at timestamptz not null default now()
);

comment on table public.promo_codes is 'Codes promo à usage unique donnant un nombre de jours de Premium. Générés par generate_promo_codes(), consommés par redeem_promo_code().';

alter table public.promo_codes enable row level security;
-- Aucune policy pour authenticated/anon : la validité d'un code se vérifie
-- uniquement via redeem_promo_code() (security definer), jamais par lecture
-- directe de la table (éviterait de pouvoir lister/deviner des codes).

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

  execute $sql$
    alter table public.subscriptions
    add constraint subscriptions_provider_check
    check (provider in ('iap_ios', 'iap_android', 'wave', 'mtn', 'orange', 'referral', 'gift'))$sql$;
end $$;

create or replace function public.generate_promo_codes(p_count int, p_premium_days int)
returns setof text
language plpgsql
security definer
set search_path = public
as $$
declare
  chars constant text := 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  code text;
  i int;
  j int;
begin
  if not public.is_admin() then
    raise exception 'Réservé aux administrateurs';
  end if;

  for i in 1..p_count loop
    loop
      code := '';
      for j in 1..8 loop
        code := code || substr(chars, floor(random() * length(chars) + 1)::int, 1);
      end loop;
      exit when not exists (select 1 from public.promo_codes where promo_codes.code = code);
    end loop;

    insert into public.promo_codes (code, premium_days) values (code, p_premium_days);
    return next code;
  end loop;
end;
$$;

revoke execute on function public.generate_promo_codes(int, int) from public;

create or replace function public.redeem_promo_code(p_code text)
returns table (granted_days int)
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_code record;
begin
  if v_user is null then
    raise exception 'Non authentifié';
  end if;

  select * into v_code from public.promo_codes where code = upper(trim(p_code)) for update;
  if v_code is null then
    raise exception 'Code promo introuvable';
  end if;
  if v_code.redeemed_by is not null then
    raise exception 'Ce code promo a déjà été utilisé';
  end if;

  update public.promo_codes
    set redeemed_by = v_user, redeemed_at = now()
    where code = v_code.code;

  insert into public.subscriptions (user_id, provider, status, current_period_end)
  values (v_user, 'gift', 'active', now() + (v_code.premium_days || ' days')::interval)
  on conflict (user_id) do update
    set status = 'active',
        current_period_end = greatest(public.subscriptions.current_period_end, now()) + (v_code.premium_days || ' days')::interval;

  return query select v_code.premium_days;
end;
$$;

grant execute on function public.redeem_promo_code(text) to authenticated;
