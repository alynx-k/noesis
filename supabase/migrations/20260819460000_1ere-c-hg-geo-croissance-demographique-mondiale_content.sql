-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie, categoryid=136.
-- Moodle course id 949: "1ère G2- La croissance démographique mondiale et
-- ses problèmes" (https://lyc.ecole-ci.org/course/view.php?id=949),
-- resource id 5025. Contenu réécrit à partir du PDF source (croissance à
-- double vitesse, structures démographiques comparées, foyers de
-- peuplement, politiques malthusiennes et anti-malthusiennes). Chiffres
-- et statistiques réels (FNUAP, taux de natalité/mortalité) et référence
-- factuelle à Thomas Malthus (1766-1834, théorie historique, domaine
-- public) repris tels quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-geo-croissance-demographique-mondiale',
  '1ere',
  'C',
  'histoire-geographie',
  $$La croissance démographique dans le monde et ses problèmes$$,
  2,
  '1ere-c-hg-geo-dynamisme-demographique-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ta classe participe à une conférence organisée par le club Histoire-Géographie sur le thème « population mondiale : défis et opportunités ». Le conférencier déclare : « Aujourd'hui, les problèmes de développement durable deviennent de plus en plus préoccupants aussi bien dans les pays pauvres que dans les pays riches ; c'est la croissance globale de la population mondiale qui en est la cause. » De retour en classe, vous menez des recherches pour caractériser la croissance de la population mondiale, apprécier ses problèmes et suggérer des solutions.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une croissance démographique à double vitesse$$,
        'body', $$Depuis le XIXe siècle, la population mondiale ne cesse de croître : 1 milliard d'habitants en 1800, 2,5 milliards en 1950, environ 7,7 milliards aujourd'hui. Mais cette croissance est très inégale. Dans les pays développés, la croissance est lente : la transition démographique y est achevée (baisse conjointe des taux de natalité et de mortalité), sous l'effet du coût élevé de la vie et de l'éducation des enfants, de l'émancipation de la femme et des politiques antinatalistes. Dans les pays en développement, on observe au contraire une explosion démographique : le taux de mortalité a fortement baissé (8,4 pour 1000) grâce à l'amélioration des infrastructures et de la santé, tandis que le taux de natalité reste élevé (28,2 pour 1000 en 2020), soutenu par les pratiques culturelles et religieuses, les mariages précoces et l'amélioration des conditions de vie.$$,
        'highlights', array[$$pays développés : transition démographique achevée → croissance lente$$, $$pays en développement : mortalité en baisse + natalité élevée → explosion démographique$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la croissance démographique reste-t-elle forte dans les pays en développement malgré la baisse de la mortalité ?$$, 'solution', $$Parce que le taux de natalité y demeure élevé (28,2 pour 1000 en 2020), sous l'effet des pratiques culturelles, des mariages précoces et de l'amélioration des conditions de vie, alors que la mortalité a fortement diminué.$$)
      ),
      jsonb_build_object(
        'heading', $$Deux structures démographiques opposées$$,
        'body', $$La pyramide des âges des pays en développement a une forme triangulaire (ou « en parasol ») : base large (jeunesse nombreuse, fécondité de 4 à 6 enfants par femme), flancs concaves (population adulte moins nombreuse), sommet effilé (peu de vieillards, faible espérance de vie). À l'inverse, la pyramide des pays développés présente une base rétrécie (natalité et fécondité faibles), des flancs convexes (population adulte importante) et un sommet écrasé ou large (plus de 10% de vieillards, espérance de vie ≥ 80 ans) ; sa forme générale rappelle une ogive, un as de pique ou une urne.$$,
        'highlights', array[$$PED : pyramide triangulaire/parasol — base large, sommet effilé$$, $$PD : pyramide en ogive/as de pique/urne — base rétrécie, sommet large$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle forme de pyramide des âges correspond à une population où plus de 10% des habitants ont plus de 65 ans ?$$, 'solution', $$Une pyramide de pays développé, au sommet écrasé ou large, caractéristique d'une forte proportion de personnes âgées et d'une espérance de vie longue (≥80 ans).$$),
        'fixation', jsonb_build_object('question', $$Que signifie une base large sur une pyramide des âges ?$$, 'solution', $$Qu'il y a une forte proportion de jeunes, résultat d'un taux de natalité et d'une fécondité élevés.$$)
      ),
      jsonb_build_object(
        'heading', $$Une répartition inégale de la population mondiale$$,
        'body', $$La population mondiale est inégalement répartie (densité moyenne : 56 hab/km²), en raison de contraintes naturelles (froid extrême, montagnes, déserts arides, forêts denses). Trois grands foyers de peuplement concentrent 4,75 milliards d'habitants (61% de la population mondiale) : l'Asie de l'Est (2,3 milliards, Chine, Japon, Corée...), l'Asie du Sud (1,7 milliard, Inde, Pakistan, Bangladesh...) et l'Europe (743 millions). D'autres foyers secondaires existent : le golfe de Guinée (260 millions), le nord-est des États-Unis (150 millions), le sud-est du Brésil (116 millions). À l'inverse, les régions froides et polaires, les déserts chauds et les forêts denses restent très faiblement peuplés.$$,
        'highlights', array[$$densité mondiale moyenne : 56 hab/km²$$, $$3 grands foyers = 61% de la population mondiale (Asie de l'Est, Asie du Sud, Europe)$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite les trois principaux foyers de peuplement mondiaux.$$, 'solution', $$L'Asie de l'Est, l'Asie du Sud et l'Europe.$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes et politiques démographiques$$,
        'body', $$Dans les pays en développement, la croissance accélérée engendre des problèmes socio-économiques (pauvreté, famine, insuffisance d'infrastructures, bidonvilles, exode rural) et environnementaux (pollution, désertification). Face à cela, l'économiste Thomas Malthus (1766-1834) préconisait déjà la restriction démographique (espacement des naissances, recul de l'âge du mariage) : de nombreux pays adoptent des politiques antinatalistes, sous forme souple (planning familial, scolarisation des filles) comme au Brésil ou en Algérie, ou sous forme radicale (limitation du nombre d'enfants par famille) comme en Chine. Dans les pays développés, à l'inverse, le problème est le vieillissement de la population et l'insuffisance de main-d'œuvre : les partisans de politiques anti-malthusiennes y proposent d'encourager les naissances (allocations familiales, congés de maternité allongés, aide au logement).$$,
        'highlights', array[$$PED : pauvreté, famine, bidonvilles → politiques antinatalistes (souples ou radicales)$$, $$PD : vieillissement, manque de main-d'œuvre → politiques anti-malthusiennes (natalistes)$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la différence entre une politique antinataliste « souple » et une politique antinataliste « radicale » ?$$, 'solution', $$La forme souple repose sur la sensibilisation (planning familial, scolarisation de la jeune fille, distribution de contraceptifs), tandis que la forme radicale impose des mesures contraignantes (limitation légale du nombre d'enfants par famille, comme en Chine).$$),
        'fixation', jsonb_build_object('question', $$Pourquoi les pays développés mènent-ils des politiques natalistes plutôt qu'antinatalistes ?$$, 'solution', $$Parce qu'ils sont confrontés au vieillissement de leur population et à l'insuffisance de main-d'œuvre, et cherchent donc à encourager les naissances plutôt qu'à les limiter.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$La Radiotélévision Ivoirienne (RTI) a consacré une émission à la journée mondiale de la population. Le représentant du Programme des Nations Unies pour le Développement (PNUD) en Côte d'Ivoire a affirmé : « Il y a urgence que les gouvernants dans les pays en développement intègrent dans leur politique la question de l'évolution démographique. » Un élève ayant suivi cette émission pense au contraire que les pays développés sont plus impactés par l'évolution démographique.$$,
      'questions', array[
        $$Identifie le problème posé dans cette situation.$$,
        $$Explique les propos du représentant du PNUD : « Il y a urgence que les gouvernants dans les pays en développement intègrent dans leur politique la question de l'évolution démographique. »$$,
        $$Penses-tu que les solutions aux problèmes démographiques doivent différer d'un pays à un autre ? Justifie ta réponse en comparant les problèmes des pays en développement et ceux des pays développés.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Pourquoi la croissance démographique est-elle qualifiée de « à double vitesse » dans le monde ?$$,
      'hint', $$Compare pays développés et pays en développement.$$,
      'expected', $$Parce qu'elle est lente dans les pays développés (transition démographique achevée) et rapide, voire explosive, dans les pays en développement (mortalité en baisse, natalité restée élevée).$$
    ),
    jsonb_build_object(
      'question', $$Décris la forme de la pyramide des âges typique d'un pays en développement.$$,
      'hint', $$Elle rappelle une forme géométrique simple.$$,
      'expected', $$Une forme triangulaire ou « en parasol » : base large, flancs concaves, sommet effilé.$$
    ),
    jsonb_build_object(
      'question', $$Quels facteurs naturels expliquent les faibles densités de population dans certaines régions du monde ?$$,
      'hint', $$Il s'agit de contraintes climatiques ou de relief.$$,
      'expected', $$Le froid extrême, les montagnes, les déserts chauds et arides, et les forêts denses.$$
    ),
    jsonb_build_object(
      'question', $$Que préconisait Thomas Malthus face à la croissance démographique ?$$,
      'hint', $$Il s'agit d'un économiste britannique du 18e-19e siècle.$$,
      'expected', $$Il préconisait la restriction démographique : l'espacement des naissances, le recul de l'âge du mariage et l'abstinence sexuelle, pour éviter que la population ne croisse plus vite que les ressources disponibles.$$
    )
  ),
  now()
);
