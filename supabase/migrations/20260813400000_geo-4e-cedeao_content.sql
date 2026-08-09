-- REAL SOURCE: ecole-ci.org / Collège Numérique (coll.ecole-ci.org), course
-- id=1890 "4ème_GEOGRAPHIE_T2_L1: La Communauté Economique des Etats de
-- l'Afrique de l'Ouest (CEDEAO): Succès et Limites" (category 23, Histoire -
-- Géographie, QUATRIEME), résumé PDF "4ème G4-La CEDEAO Succès et
-- Limites.pdf" (mod/resource id=14987, published on ecole-ci.online),
-- Thème 2: Les regroupements économiques en Afrique de l'Ouest et en
-- Europe : exemple de la CEDEAO et de l'UE. Facts, dates and figures below
-- (28 mai 1975, 15 États membres, répartition francophone/anglophone/
-- lusophone, organes, bilan) are taken directly from that official lesson
-- PDF. 100% original wording — no sentence copied from the source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Chez toi, tu regardes avec des camarades de classe une émission de la chaîne Africa Business 24 consacrée à l'intégration économique en Afrique. Le présentateur affirme : « L'intégration en Afrique de l'Ouest piétine. La CEDEAO est minée par de nombreuses difficultés — insécurité, attaques terroristes, faiblesse des infrastructures, financement limité — mais elle reste championne en Afrique dans le domaine de la libre circulation. » Tu décides de mener des recherches pour mieux connaître cette organisation, son fonctionnement et son bilan.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La naissance et l'espace de la CEDEAO$$,
        'body', $$L'idée d'une organisation régionale ouest-africaine est lancée en avril 1972 par les présidents Gnassingbé Eyadéma du Togo et Yakubu Gowon du Nigeria. Elle se concrétise le 28 mai 1975 à Lagos, au Nigeria, avec la signature du traité créant la Communauté économique des États de l'Afrique de l'Ouest (CEDEAO). L'organisation regroupe quinze États membres : huit pays francophones (Côte d'Ivoire, Mali, Niger, Burkina Faso, Sénégal, Guinée, Bénin, Togo), cinq pays anglophones (Ghana, Liberia, Nigeria, Gambie, Sierra Leone) et deux pays lusophones (Guinée-Bissau, Cap-Vert). Selon le document de référence de la leçon, la CEDEAO couvre une superficie de 5,2 millions de km² et compte près de 386 millions d'habitants.$$,
        'highlights', array[$$28 mai 1975$$, $$traité de Lagos$$, $$quinze États membres$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La CEDEAO est créée le 28 mai 1975 à Lagos, à la suite d'une initiative lancée en 1972 par le Togo et le Nigeria ; elle regroupe quinze États membres d'Afrique de l'Ouest, répartis entre pays francophones, anglophones et lusophones.$$),
        'table', jsonb_build_object(
          'headers', array[$$Groupe linguistique$$, $$Nombre d'États$$, $$Exemples$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Francophones$$, $$8$$, $$Côte d'Ivoire, Mali, Sénégal, Togo$$),
            jsonb_build_array($$Anglophones$$, $$5$$, $$Ghana, Nigeria, Sierra Leone$$),
            jsonb_build_array($$Lusophones$$, $$2$$, $$Guinée-Bissau, Cap-Vert$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$En quelle année et dans quelle ville le traité créant la CEDEAO est-il signé ?$$, 'solution', $$En 1975 (le 28 mai), à Lagos, au Nigeria.$$)
      ),
      jsonb_build_object(
        'heading', $$Les objectifs et les atouts économiques de la CEDEAO$$,
        'body', $$La CEDEAO poursuit plusieurs objectifs : assurer le bien-être de ses populations, promouvoir la coopération et le développement dans tous les secteurs économiques, instaurer un passeport commun facilitant la mobilité, créer à terme une monnaie unique, et bâtir un vaste marché commun. Elle s'appuie pour cela sur d'importants atouts : de vastes terres arables et pastorales, de grands bassins fluviaux propices à l'irrigation, et un sous-sol riche en ressources minières et énergétiques — or (notamment au Ghana), diamants (notamment en Sierra Leone), pétrole et gaz (notamment au Nigeria), ainsi que fer, bauxite et manganèse. La région produit aussi en abondance des céréales et cultures vivrières ou de rente (mil, maïs, riz, café, cacao, coton), et dispose, selon le document de la leçon, d'une population estimée à plus de 86 millions d'habitants formant une main-d'œuvre et un marché de consommation importants.$$,
        'highlights', array[$$monnaie unique$$, $$ressources minières$$, $$marché commun$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux ressources du sous-sol ouest-africain qui constituent un atout économique pour la CEDEAO.$$, 'solution', $$Par exemple l'or (surtout au Ghana) et le pétrole (surtout au Nigeria) ; on peut aussi citer les diamants de Sierra Leone ou le fer et la bauxite.$$),
        'fixation', jsonb_build_object('question', $$Cite deux objectifs de la CEDEAO.$$, 'solution', $$Par exemple assurer le bien-être des populations et créer un vaste marché de consommation ; on peut aussi citer la mise en place d'une monnaie unique ou d'un passeport commun.$$)
      ),
      jsonb_build_object(
        'heading', $$Le fonctionnement des institutions de la CEDEAO$$,
        'body', $$La CEDEAO s'organise autour de plusieurs types d'organes. Les organes de décision comprennent la Conférence des chefs d'État et de gouvernement, organe suprême qui fixe les grandes orientations, le Conseil des ministres, qui veille au bon fonctionnement de la communauté, et le Parlement de la communauté. Les organes d'exécution comptent la Commission de la CEDEAO, chargée de la mise en œuvre des décisions et composée de neuf commissaires, ainsi que des commissions techniques spécialisées (agriculture, commerce, transport, industrie) et une commission chargée de la défense, de la sécurité et de la paix. Le contrôle et l'arbitrage reviennent à la Cour de justice de la communauté, dont le siège est à Abuja. Enfin, des organes à vocation économique et sociale complètent le dispositif : le Conseil économique et social, l'Organisation ouest-africaine de la santé, et la Banque d'investissement et de développement de la CEDEAO (BIDC), qui finance des projets publics et privés dans la région.$$,
        'highlights', array[$$Conférence des chefs d'État$$, $$Commission de la CEDEAO$$, $$Cour de justice$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Institution$$, $$Rôle principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Conférence des chefs d'État et de gouvernement$$, $$Organe suprême : oriente et contrôle la CEDEAO$$),
            jsonb_build_array($$Commission de la CEDEAO$$, $$Met en œuvre les décisions au quotidien$$),
            jsonb_build_array($$Cour de justice de la communauté$$, $$Règle les différends (siège à Abuja)$$),
            jsonb_build_array($$Banque d'investissement et de développement (BIDC)$$, $$Finance les projets de développement$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Où siège la Cour de justice de la CEDEAO, et quel est son rôle ?$$, 'solution', $$Elle siège à Abuja et règle les différends liés à l'interprétation et à l'application des textes de la communauté.$$)
      ),
      jsonb_build_object(
        'heading', $$Le bilan de la CEDEAO : succès et limites$$,
        'body', $$La CEDEAO peut se prévaloir de plusieurs succès : sur le plan politique et sécuritaire, ses forces de l'ECOMOG sont intervenues pour rétablir ou maintenir la paix dans des pays comme le Liberia, la Guinée-Bissau ou la Gambie ; sur le plan économique, elle a adopté un tarif extérieur commun et favorisé la libre circulation des capitaux et des travailleurs ; sur le plan social, elle a instauré la libre circulation des personnes et une carte d'identité biométrique commune. Mais l'organisation se heurte encore à de nombreuses limites : l'absence d'une monnaie unique effective, des irrégularités dans le paiement des cotisations par les États membres, la concurrence des produits étrangers, la faiblesse des échanges commerciaux entre pays membres, des tensions de leadership entre États francophones et anglophones, ainsi que la persistance de crises internes et d'attaques djihadistes dans plusieurs pays de la sous-région.$$,
        'highlights', array[$$ECOMOG$$, $$libre circulation$$, $$limites de l'intégration$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La CEDEAO a remporté des succès réels, notamment en matière de libre circulation des personnes et d'interventions de paix (ECOMOG), mais son intégration économique reste freinée par l'absence de monnaie unique, la faiblesse des échanges internes et des crises sécuritaires persistantes.$$),
        'example', jsonb_build_object('statement', $$Dans quels pays les forces de l'ECOMOG sont-elles intervenues pour rétablir ou maintenir la paix, selon le document de la leçon ?$$, 'solution', $$Au Liberia, en Guinée-Bissau et en Gambie.$$),
        'fixation', jsonb_build_object('question', $$Cite une limite qui freine encore l'intégration économique de la CEDEAO.$$, 'solution', $$Par exemple l'absence d'une monnaie unique, la faiblesse des échanges internes, ou les crises et attaques dans certains États membres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors de l'installation de la quatrième législature du Parlement de la CEDEAO, son président déclare : « Sur le plan de l'intégration, des progrès importants ont été accomplis, notamment dans la libre circulation des personnes et des biens. Toutefois, de nombreux défis demeurent, avec les attaques terroristes. »$$,
      'questions', array[
        $$Quand et où la CEDEAO a-t-elle été créée, et combien d'États regroupe-t-elle ?$$,
        $$Cite deux institutions de la CEDEAO et leur rôle.$$,
        $$Explique en quoi la libre circulation des personnes est un succès de la CEDEAO.$$,
        $$Cite deux limites qui freinent encore l'intégration régionale de la CEDEAO.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$En quelle année et dans quelle ville la CEDEAO est-elle créée ?$$,
      'hint', $$C'est en 1975, dans la capitale économique du Nigeria à l'époque.$$,
      'expected', $$En 1975 (le 28 mai), à Lagos.$$
    ),
    jsonb_build_object(
      'question', $$Combien d'États membres compte la CEDEAO, et cite deux d'entre eux.$$,
      'hint', $$Le nombre est le même que celui des jours d'un mois court.$$,
      'expected', $$Quinze États membres, par exemple la Côte d'Ivoire et le Ghana.$$
    ),
    jsonb_build_object(
      'question', $$Quel organe de la CEDEAO constitue son organe suprême, chargé des grandes orientations ?$$,
      'hint', $$Il réunit les chefs d'État des pays membres.$$,
      'expected', $$La Conférence des chefs d'État et de gouvernement.$$
    ),
    jsonb_build_object(
      'question', $$Cite une limite qui empêche encore la CEDEAO d'atteindre une pleine intégration économique.$$,
      'hint', $$Pense à la monnaie ou aux échanges commerciaux entre pays membres.$$,
      'expected', $$Par exemple l'absence d'une monnaie unique effective, ou la faiblesse des échanges commerciaux entre États membres.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-4e-cedeao';
