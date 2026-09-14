-- Fix : generate_promo_codes() utilisait une variable locale nommée "code",
-- ambiguë avec la colonne promo_codes.code dans la clause exists(...).

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
