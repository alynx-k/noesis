-- Physique-Chimie 3ème — Puissance et énergie électriques.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème electricity competency (P=UI,
-- W=P×t, kWh, facture d'électricité en F CFA). Original wording
-- throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une famille ivoirienne reçoit chaque mois une facture d'électricité et se demande pourquoi son réfrigérateur, allumé en permanence, coûte plus cher à l'usage que ses ampoules, allumées seulement quelques heures par jour. Comment calcule-t-on la puissance d'un appareil électrique et l'énergie qu'il consomme réellement ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Puissance électrique d'un appareil$$,
        'body', $$Un appareil électrique traversé par un courant sous une certaine tension reçoit une puissance électrique, qui dépend de la tension à ses bornes et de l'intensité du courant qui le traverse.$$,
        'highlights', array[$$puissance électrique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$P=U×I, où P est la puissance électrique en watts (W), U la tension en volts (V), et I l'intensité du courant en ampères (A).$$),
        'example', jsonb_build_object('statement', $$Une ampoule est branchée sous une tension de 220 V et traversée par un courant de 0,3 A. Calcule sa puissance.$$, 'solution', $$P=U×I=220×0,3=66 W.$$),
        'fixation', jsonb_build_object('question', $$Un fer à repasser fonctionne sous 220 V et est traversé par un courant de 4 A. Calcule sa puissance.$$, 'solution', $$P=220×4=880 W.$$)
      ),
      jsonb_build_object(
        'heading', $$Énergie électrique consommée$$,
        'body', $$Un appareil électrique consomme une énergie d'autant plus grande que sa puissance est élevée et qu'il fonctionne longtemps. Cette énergie électrique se calcule en multipliant la puissance par la durée de fonctionnement.$$,
        'highlights', array[$$énergie électrique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$W=P×t, où W est l'énergie électrique en joules (J) si P est en watts (W) et t en secondes (s). Pour des durées plus longues, on utilise aussi le kilowattheure (kWh) : W(kWh)=P(kW)×t(h).$$),
        'example', jsonb_build_object('statement', $$Une ampoule de puissance 60 W fonctionne pendant 3 heures. Calcule l'énergie électrique consommée en joules, puis en kWh.$$, 'solution', $$t=3 h=10 800 s. W=P×t=60×10 800=648 000 J. En kWh : W=0,06 kW×3 h=0,18 kWh.$$),
        'fixation', jsonb_build_object('question', $$Un four électrique de puissance 2000 W fonctionne pendant 30 minutes. Calcule l'énergie consommée en kWh.$$, 'solution', $$P=2 kW, t=0,5 h. W=2×0,5=1 kWh.$$)
      ),
      jsonb_build_object(
        'heading', $$Conversion entre joule et kilowattheure$$,
        'body', $$Le kilowattheure est une unité pratique pour mesurer de grandes quantités d'énergie électrique, notamment sur les factures d'électricité, car le joule donnerait des nombres bien trop grands pour un usage quotidien.$$,
        'highlights', array[$$kilowattheure$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$1 kWh = 1000 W × 3600 s = 3 600 000 J = 3,6×10⁶ J.$$),
        'example', jsonb_build_object('statement', $$Convertis 2 kWh en joules.$$, 'solution', $$2×3 600 000=7 200 000 J, soit 7,2×10⁶ J.$$),
        'fixation', jsonb_build_object('question', $$Convertis 5 400 000 J en kWh.$$, 'solution', $$5 400 000 ÷ 3 600 000=1,5 kWh.$$)
      ),
      jsonb_build_object(
        'heading', $$Facture d'électricité$$,
        'body', $$La compagnie d'électricité facture l'énergie réellement consommée, en kWh, au prix fixé par kWh. Pour connaître le coût d'utilisation d'un appareil, il faut donc connaître sa puissance, sa durée d'utilisation, et le prix du kWh.$$,
        'highlights', array[$$facture d'électricité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Coût = W(kWh) × prix du kWh.$$),
        'example', jsonb_build_object('statement', $$Un climatiseur de puissance 1,5 kW fonctionne 4 h par jour. Sachant que le kWh coûte 100 F CFA, calcule le coût quotidien de son fonctionnement.$$, 'solution', $$W=1,5×4=6 kWh. Coût=6×100=600 F CFA.$$),
        'fixation', jsonb_build_object('question', $$Une télévision de puissance 100 W fonctionne 5 h par jour, avec un kWh à 100 F CFA. Calcule son coût quotidien.$$, 'solution', $$P=0,1 kW, W=0,1×5=0,5 kWh. Coût=0,5×100=50 F CFA.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une famille veut estimer sa consommation électrique mensuelle. Elle utilise un réfrigérateur de puissance 150 W allumé en permanence (24 h/24), et 4 ampoules de 15 W chacune, allumées 5 h par jour, pendant 30 jours. Le kWh coûte 100 F CFA.$$,
      'questions', array[
        $$Calcule l'énergie consommée par le réfrigérateur en un mois (30 jours), en kWh.$$,
        $$Calcule l'énergie consommée par les 4 ampoules en un mois, en kWh.$$,
        $$Calcule le coût total de cette consommation mensuelle (réfrigérateur et ampoules réunis).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un moteur électrique est traversé par un courant de 5 A sous une tension de 220 V. Calcule sa puissance.$$,
      'hint', $$Utilise P=U×I.$$,
      'expected', $$P=220×5=1100 W.$$
    ),
    jsonb_build_object(
      'question', $$Un lave-linge de puissance 2000 W fonctionne pendant 45 minutes. Calcule l'énergie consommée en kWh.$$,
      'hint', $$Convertis la durée en heures, puis utilise W=P×t avec P en kW.$$,
      'expected', $$t=0,75 h ; W=2×0,75=1,5 kWh.$$
    ),
    jsonb_build_object(
      'question', $$Convertis 900 000 J en kWh.$$,
      'hint', $$Rappelle-toi que 1 kWh=3 600 000 J.$$,
      'expected', $$900 000 ÷ 3 600 000=0,25 kWh.$$
    ),
    jsonb_build_object(
      'question', $$Une pompe à eau de puissance 750 W fonctionne 2 h par jour. Le kWh coûte 100 F CFA. Calcule le coût de son fonctionnement pendant 10 jours.$$,
      'hint', $$Calcule d'abord l'énergie totale consommée en kWh, puis multiplie par le prix du kWh.$$,
      'expected', $$P=0,75 kW ; t=2×10=20 h ; W=0,75×20=15 kWh ; coût=15×100=1500 F CFA.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-puissance-energie-electriques';
