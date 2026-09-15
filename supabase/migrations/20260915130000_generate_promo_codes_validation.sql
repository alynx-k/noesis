-- Fix : generate_promo_codes() n'importe quels p_count/p_premium_days
-- (négatifs, zéro, ou absurdement grands) sans validation.

create or replace function public.generate_promo_codes(p_count int, p_premium_days int)
returns setof text
language plpgsql
security definer
set search_path = public
as $$
declare
  chars constant text := 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  v_code text;
  i int;
  j int;
begin
  if not public.is_admin() then
    raise exception 'Réservé aux administrateurs';
  end if;

  if p_count <= 0 or p_count > 1000 then
    raise exception 'p_count doit être compris entre 1 et 1000';
  end if;

  if p_premium_days <= 0 or p_premium_days > 3650 then
    raise exception 'p_premium_days doit être compris entre 1 et 3650';
  end if;

  for i in 1..p_count loop
    loop
      v_code := '';
      for j in 1..8 loop
        v_code := v_code || substr(chars, floor(random() * length(chars) + 1)::int, 1);
      end loop;
      exit when not exists (select 1 from public.promo_codes where promo_codes.code = v_code);
    end loop;

    insert into public.promo_codes (code, premium_days) values (v_code, p_premium_days);
    return next v_code;
  end loop;
end;
$$;
