-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie, categoryid=124.
-- Moodle course id 2000: "1ère_G2: LA CROISSANCE DEMOGRAPHIQUE MONDIALE ET
-- SES PROBLEMES" (https://lyc.ecole-ci.org/course/view.php?id=2000),
-- resource id 17462. Contenu réécrit à partir du PDF source (croissance à
-- double vitesse, structures démographiques contrastées, foyers de
-- peuplement, politiques malthusiennes et anti-malthusiennes). Chiffres
-- et faits réels (FNUAP, taux cités) repris tels quels ; explications
-- reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-geo-croissance-demographique-mondiale',
  '1ere',
  'A',
  'histoire-geographie',
  $$La croissance démographique dans le monde et ses problèmes$$,
  2,
  '1ere-a-hg-geo-dynamisme-demographique-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une conférence sur le thème « population mondiale : défis et opportunités », un conférencier affirme que les problèmes de développement durable, de plus en plus préoccupants, sont causés par la croissance globale de la population mondiale, aussi bien dans les pays pauvres que dans les pays riches. La classe décide de mener des recherches pour caractériser cette croissance, en comprendre les problèmes et envisager des solutions.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une croissance démographique à double vitesse$$,
        'body', $$Depuis le XIXe siècle, la population mondiale ne cesse de croître : d'environ 1 milliard d'habitants en 1800, elle a atteint 2,5 milliards en 1950 et environ 7,7 milliards aujourd'hui. Mais cette croissance n'est pas uniforme : dans les pays développés, elle est lente (transition démographique achevée, taux d'accroissement naturel très faible d'environ 0,07%), grâce au coût élevé de l'éducation, à l'émancipation des femmes et aux politiques antinatalistes. Dans les pays en développement, elle reste rapide : le taux de mortalité a fortement baissé (8,4‰) tandis que le taux de natalité demeure élevé (28,2‰ en 2020), du fait de pratiques culturelles favorables aux naissances et de mariages précoces.$$,
        'highlights', array[$$pays développés : croissance lente, transition achevée$$, $$pays en développement : natalité élevée, mortalité en baisse$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que la croissance démographique mondiale est « à double vitesse » ?$$, 'solution', $$Parce qu'elle est lente dans les pays développés (transition démographique achevée) et rapide dans les pays en développement (mortalité en baisse, natalité encore élevée).$$)
      ),
      jsonb_build_object(
        'heading', $$Des structures de population contrastées$$,
        'body', $$La pyramide des âges des pays en développement a une forme triangulaire (ou en parasol) : base large (jeunesse nombreuse, fécondité de 4 à 6 enfants par femme), flancs concaves (population adulte moins nombreuse), sommet effilé (peu de personnes âgées, faible espérance de vie). À l'inverse, celle des pays développés a une base rétrécie (faible natalité), des flancs convexes (population adulte importante) et un sommet large (plus de 10% de personnes âgées, espérance de vie ≥ 80 ans) ; sa forme générale rappelle une ogive, un as de pique ou une urne.$$,
        'highlights', array[$$PED : forme triangulaire/parasol, base large$$, $$pays développés : ogive/urne, sommet large$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle forme de pyramide des âges correspond à un pays où la fécondité est de 5 enfants par femme et l'espérance de vie relativement faible ?$$, 'solution', $$Une forme triangulaire (ou en parasol), typique des pays en développement : base large due à la forte fécondité, sommet effilé du fait de la faible espérance de vie.$$),
        'fixation', jsonb_build_object('question', $$Que signifie un sommet « écrasé » ou large dans une pyramide des âges ?$$, 'solution', $$Une forte proportion de personnes âgées, donc une espérance de vie longue — caractéristique des pays développés.$$)
      ),
      jsonb_build_object(
        'heading', $$Répartition mondiale et politiques dans les pays en développement$$,
        'body', $$La population mondiale (densité moyenne de 56 hab/km²) est très inégalement répartie : trois grands foyers de peuplement (Asie de l'Est, Asie du Sud, Europe) regroupent à eux seuls 61% de la population mondiale, tandis que les régions polaires, les déserts et les forêts denses restent presque vides. Dans les pays en développement, la croissance rapide entraîne pauvreté, sous-alimentation, insuffisance des infrastructures et dégradation environnementale. S'inspirant du malthusianisme (Thomas Malthus, 1766-1834, qui prônait la restriction des naissances face au risque d'épuisement des ressources), certains pays adoptent des politiques antinatalistes souples (planning familial, scolarisation des filles) tandis que d'autres, notamment en Asie, ont recouru à des mesures radicales (limitation du nombre d'enfants par famille, stérilisation), avec des conséquences sociales parfois lourdes.$$,
        'highlights', array[$$3 foyers = 61% de la population mondiale$$, $$malthusianisme : restriction des naissances$$, $$formes souples vs radicales$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre une politique antinataliste « souple » et une politique « radicale » ?$$, 'solution', $$La forme souple mise sur la sensibilisation (planning familial, scolarisation des filles) ; la forme radicale impose des contraintes fortes (limitation légale du nombre d'enfants, stérilisation), avec des conséquences sociales parfois graves.$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes et politiques dans les pays développés$$,
        'body', $$Les pays développés font face au problème inverse : vieillissement de la population, insuffisance de main-d'œuvre, difficulté de renouvellement des générations, et charge croissante des retraites et des soins pour les personnes âgées. Face à cela, les partisans de l'anti-malthusianisme estiment qu'une population nombreuse est une richesse (main-d'œuvre, marché), et proposent des mesures pour encourager les naissances : subventions scolaires, allocations familiales, facilités de logement, congés de maternité allongés — des mesures limitées par le coût élevé de la vie.$$,
        'highlights', array[$$vieillissement, manque de main-d'œuvre$$, $$anti-malthusianisme : encourager les naissances$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi les anti-malthusiens considèrent-ils une population nombreuse comme une richesse plutôt qu'un problème ?$$, 'solution', $$Parce qu'elle constitue une main-d'œuvre importante et un marché dynamique, et que les puissances démographiques (Chine, Inde, Indonésie...) sont aussi des puissances économiques.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conférencier affirme : « Les pays en développement sont les principaux responsables de la croissance accélérée de la population mondiale. Si rien n'est fait, il leur sera difficile d'atteindre les objectifs du millénaire pour le développement. »$$,
      'questions', array[
        $$Explique le passage : « Les pays en développement sont les principaux responsables de la croissance accélérée de la population mondiale. »$$,
        $$Cite deux problèmes liés à la croissance démographique dans les pays en développement, et deux problèmes liés à la démographie dans les pays développés.$$,
        $$Partages-tu le point de vue selon lequel, si rien n'est fait, les pays en développement auront du mal à atteindre leurs objectifs de développement ? Justifie.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$La transition démographique est-elle achevée dans la majorité des pays développés ou des pays en développement ?$$,
      'hint', $$C'est lié à la lenteur de la croissance.$$,
      'expected', $$Dans la majorité des pays développés.$$
    ),
    jsonb_build_object(
      'question', $$Quelle forme de pyramide des âges est typique des pays développés ?$$,
      'hint', $$Trois formes possibles sont citées dans le cours.$$,
      'expected', $$Une forme d'ogive, d'as de pique ou en urne (base rétrécie, sommet large).$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les trois principaux foyers de peuplement mondial cités dans ce cours ?$$,
      'hint', $$Ils regroupent 61% de la population mondiale.$$,
      'expected', $$L'Asie de l'Est, l'Asie du Sud et l'Europe.$$
    ),
    jsonb_build_object(
      'question', $$Qui est à l'origine de la théorie prônant la restriction des naissances face au risque d'épuisement des ressources ?$$,
      'hint', $$C'est un pasteur et économiste britannique du XVIIIe-XIXe siècle.$$,
      'expected', $$Thomas Robert Malthus (1766-1834).$$
    )
  ),
  now()
);
