-- Physique-Chimie 3ème — Oxydation des corps purs simples.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème chemistry competency (oxydation
-- vive/lente, combustion du carbone, du soufre, du magnésium, rouille du
-- fer). Original wording throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une expérience, un professeur enflamme un morceau de charbon dans un flacon de dioxygène : une flamme vive apparaît. Il montre ensuite aux élèves un vieux clou en fer, laissé plusieurs mois dans un coin humide de l'atelier, recouvert d'une couche brun-rouge. Les deux corps, carbone et fer, ont réagi avec le dioxygène de l'air, mais de façon très différente. Pourquoi ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Notion d'oxydation d'un corps pur simple$$,
        'body', $$L'oxydation d'un corps pur simple est la réaction chimique au cours de laquelle ce corps se combine avec le dioxygène pour former un oxyde. Selon sa vitesse, on distingue une oxydation vive, rapide et souvent lumineuse (combustion), d'une oxydation lente, qui se déroule progressivement, parfois sur plusieurs jours ou plusieurs années.$$,
        'highlights', array[$$oxydation$$, $$oxyde$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$L'oxydation d'un corps pur simple X est sa combinaison avec le dioxygène de l'air pour donner un oxyde : X + O2 → oxyde de X. On distingue l'oxydation vive (rapide, souvent avec flamme ou lumière) de l'oxydation lente (progressive, sans flamme).$$),
        'example', jsonb_build_object('statement', $$Une bûche de bois brûle rapidement avec une flamme, tandis qu'un clou en fer se recouvre de rouille en plusieurs semaines. Quel type d'oxydation illustre chacun de ces deux exemples ?$$, 'solution', $$La combustion de la bûche est une oxydation vive ; la formation de rouille sur le clou est une oxydation lente.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui distingue une oxydation vive d'une oxydation lente ?$$, 'solution', $$L'oxydation vive est rapide et souvent accompagnée d'une flamme ou de lumière, alors que l'oxydation lente est progressive et se déroule sans flamme.$$)
      ),
      jsonb_build_object(
        'heading', $$Oxydation vive du carbone et du soufre$$,
        'body', $$Le carbone et le soufre sont des corps purs simples non métalliques qui brûlent dans le dioxygène pour former des oxydes gazeux. La combustion du carbone produit du dioxyde de carbone, qui trouble l'eau de chaux ; la combustion du soufre produit du dioxyde de soufre, reconnaissable à son odeur piquante.$$,
        'highlights', array[$$combustion du carbone$$, $$combustion du soufre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Combustion du carbone : C + O2 → CO2. Combustion du soufre : S + O2 → SO2. Le dioxyde de carbone trouble l'eau de chaux ; le dioxyde de soufre a une odeur âcre et piquante.$$),
        'example', jsonb_build_object('statement', $$Écris l'équation de la combustion du carbone dans le dioxygène.$$, 'solution', $$C + O2 → CO2.$$),
        'fixation', jsonb_build_object('question', $$Comment peut-on mettre en évidence la présence de dioxyde de carbone produit lors de la combustion du carbone ?$$, 'solution', $$En faisant barboter le gaz produit dans de l'eau de chaux : elle se trouble en présence de dioxyde de carbone.$$)
      ),
      jsonb_build_object(
        'heading', $$Oxydation vive d'un métal : le magnésium$$,
        'body', $$Certains métaux, comme le magnésium, brûlent aussi dans le dioxygène. Le ruban de magnésium, enflammé, produit une lumière blanche très vive et forme un solide blanc, l'oxyde de magnésium.$$,
        'highlights', array[$$magnésium$$, $$oxyde de magnésium$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Combustion du magnésium : 2 Mg + O2 → 2 MgO. Cette réaction est très lumineuse et exothermique ; elle produit un solide blanc, l'oxyde de magnésium.$$),
        'example', jsonb_build_object('statement', $$Écris et équilibre l'équation de la combustion du magnésium dans le dioxygène.$$, 'solution', $$2 Mg + O2 → 2 MgO. Vérification : 2 atomes Mg et 2 atomes O de chaque côté.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la couleur du solide obtenu après la combustion complète d'un ruban de magnésium ?$$, 'solution', $$Un solide blanc, l'oxyde de magnésium (MgO).$$)
      ),
      jsonb_build_object(
        'heading', $$Oxydation lente : la rouille du fer$$,
        'body', $$Le fer, en présence de dioxygène et d'humidité, s'oxyde lentement pour former de la rouille, un oxyde de fer de couleur brun-rouge. Cette oxydation lente ne produit ni flamme ni lumière, mais fragilise progressivement le métal.$$,
        'highlights', array[$$rouille$$, $$oxydation lente du fer$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'oxydation lente du fer en présence de dioxygène et d'humidité forme de la rouille, un oxyde de fer de formule voisine de Fe2O3. Cette réaction, beaucoup plus lente qu'une combustion, ne dégage ni flamme ni lumière visible.$$),
        'example', jsonb_build_object('statement', $$Un vieux portail en fer, laissé sous la pluie pendant plusieurs mois, se couvre d'une couche brun-rouge friable. De quel phénomène s'agit-il ?$$, 'solution', $$C'est de la rouille, résultat de l'oxydation lente du fer par le dioxygène de l'air en présence d'humidité.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi peint-on souvent les objets en fer exposés à l'extérieur ?$$, 'solution', $$Pour les protéger du contact avec le dioxygène et l'humidité de l'air, et ainsi ralentir ou empêcher leur oxydation (la formation de rouille).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une expérience, un professeur enflamme successivement un morceau de charbon (carbone) et un ruban de magnésium dans deux flacons remplis de dioxygène, puis montre aux élèves un vieux clou rouillé conservé depuis plusieurs mois dans un endroit humide.$$,
      'questions', array[
        $$Écris l'équation de la combustion du charbon (carbone) dans le dioxygène.$$,
        $$Écris l'équation de la combustion du ruban de magnésium dans le dioxygène.$$,
        $$Le clou rouillé illustre-t-il une oxydation vive ou une oxydation lente ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris et équilibre l'équation de la combustion du soufre dans le dioxygène.$$,
      'hint', $$Le soufre S réagit avec O2 pour donner un seul produit.$$,
      'expected', $$S + O2 → SO2.$$
    ),
    jsonb_build_object(
      'question', $$Écris et équilibre l'équation de la combustion du magnésium dans le dioxygène.$$,
      'hint', $$Compte les atomes de magnésium et d'oxygène de chaque côté.$$,
      'expected', $$2 Mg + O2 → 2 MgO.$$
    ),
    jsonb_build_object(
      'question', $$Un gaz produit par une combustion trouble l'eau de chaux. De quel gaz s'agit-il, et quelle combustion a pu le produire ?$$,
      'hint', $$Pense au test caractéristique de ce gaz.$$,
      'expected', $$C'est du dioxyde de carbone (CO2), produit par exemple par la combustion du carbone.$$
    ),
    jsonb_build_object(
      'question', $$Explique pourquoi la formation de rouille sur un objet en fer est qualifiée d'oxydation lente et non d'oxydation vive.$$,
      'hint', $$Compare la vitesse de la réaction et la présence ou non d'une flamme.$$,
      'expected', $$Parce qu'elle se produit progressivement, sur plusieurs jours ou mois, sans flamme ni lumière, contrairement à une combustion qui est rapide et souvent lumineuse.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-oxydation';
