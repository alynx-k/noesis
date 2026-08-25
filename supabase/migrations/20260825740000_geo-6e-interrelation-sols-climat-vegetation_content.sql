-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 4 : L'interrelation entre les sols, le climat et la
-- végétation" (Thème 1 : Les bases de l'étude de la géographie).
-- Contenu réécrit à partir du PDF source ; situation d'apprentissage,
-- définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En consultant des cartes du milieu physique ivoirien, des élèves de 6ème remarquent qu'entre le nord et le sud du pays, les paysages varient beaucoup. Pour comprendre ces variations, ils décident de mener des recherches afin d'identifier les différents types de sols et de végétation en Côte d'Ivoire et dans le monde, et d'établir une relation entre les sols, le climat et la végétation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les types de sols et de végétation en Côte d'Ivoire$$,
        'body', $$Le sol est la partie superficielle et meuble de la terre, formée de débris de roche, de plantes décomposées et de restes d'animaux. La végétation est l'ensemble des plantes naturelles ou cultivées d'une région. En Côte d'Ivoire, on distingue trois types de sols : les sols ferralitiques (riches et profonds, au sud, à l'ouest et au centre), les sols ferrugineux (peu profonds, au nord et au centre), et les sols hydromorphes (riches en eau, sur le littoral et dans les bas-fonds). Deux grandes formations végétales dominent : la forêt (dense sempervirente au sud/ouest, avec lianes et grands arbres toujours verts ; claire mésophile au centre, avec chute du feuillage en saison sèche) et la savane (au nord, se déclinant en savane boisée, arborée, arbustive et herbeuse).$$,
        'highlights', array[$$3 sols ivoiriens : ferralitiques (S/O/Centre), ferrugineux (Nord/Centre), hydromorphes (littoral/bas-fonds)$$, $$2 formations végétales : forêt (dense au S/O, claire au Centre) et savane (Nord)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel type de sol trouve-t-on dans les zones marécageuses du littoral ivoirien ?$$, 'solution', $$Les sols hydromorphes.$$)
      ),
      jsonb_build_object(
        'heading', $$Le milieu physique par région$$,
        'body', $$Au Sud, le climat attiéen (chaud et humide) est associé à des sols ferralitiques profonds et fertiles, et à une forêt dense. À l'Ouest (montagnes, chaud et humide), on retrouve le même type de sol et de forêt dense. Au Centre, le climat baouléen (climat de transition) correspond à des sols ferrugineux moins fertiles et à une savane arborée ou forêt claire. Au Nord, le climat soudanien correspond à des sols ferrugineux peu profonds et durs, et à une savane arbustive.$$,
        'highlights', array[$$Sud/Ouest : climat chaud-humide + sols ferralitiques + forêt dense$$, $$Centre : climat de transition + sols ferrugineux + savane arborée$$, $$Nord : climat soudanien + sols ferrugineux durs + savane arbustive$$]::text[],
        'example', jsonb_build_object('statement', $$Une région a un climat baouléen de transition. Quel type de sol et de végétation peut-on y attendre ?$$, 'solution', $$Des sols ferrugineux moins fertiles, avec une savane arborée ou une forêt claire.$$),
        'fixation', jsonb_build_object('question', $$Quel type de végétation domine dans la zone du climat soudanien, au nord ?$$, 'solution', $$La savane arbustive.$$)
      ),
      jsonb_build_object(
        'heading', $$La relation d'interdépendance$$,
        'body', $$À chaque type de climat correspond une végétation particulière, qui pousse elle-même sur un type de sol particulier : le climat influence le sol et conditionne la végétation. En retour, une végétation abondante protège le sol contre l'érosion. Il existe donc une interdépendance : climat, sol et végétation s'influencent mutuellement, et cette relation détermine les types de cultures possibles dans chaque région.$$,
        'highlights', array[$$climat → conditionne sol et végétation ; végétation abondante → protège le sol de l'érosion$$, $$interdépendance climat-sol-végétation → détermine les cultures possibles$$]::text[],
        'fixation', jsonb_build_object('question', $$Que se passe-t-il pour un sol si la végétation qui le recouvre disparaît ?$$, 'solution', $$Le sol n'est plus protégé et devient vulnérable à l'érosion.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En observant une carte physique de la Côte d'Ivoire, un élève de CM2 découvre qu'entre le sud et le nord du pays, la végétation varie et que les cultures agricoles diffèrent également d'une région à l'autre, sur un même territoire national.$$,
      'questions', array[
        $$Dis de quoi il est question dans cette situation.$$,
        $$Indique les types de sols et de végétation correspondant aux zones sud et nord de la Côte d'Ivoire.$$,
        $$Explique la différence des cultures agricoles entre le nord et le sud du pays.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Les sols ferralitiques se trouvent-ils plutôt au sud/ouest, ou au nord de la Côte d'Ivoire ?$$,
      'hint', $$Ce sont des sols riches et profonds, liés à un climat humide.$$,
      'expected', $$Au sud, à l'ouest et au centre.$$
    ),
    jsonb_build_object(
      'question', $$Quelle formation végétale domine tout le nord de la Côte d'Ivoire ?$$,
      'hint', $$Elle est composée principalement d'herbes.$$,
      'expected', $$La savane.$$
    ),
    jsonb_build_object(
      'question', $$La disparition de la végétation protège-t-elle ou expose-t-elle le sol à l'érosion ?$$,
      'hint', $$La végétation joue un rôle protecteur.$$,
      'expected', $$Elle l'expose à l'érosion.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi les cultures agricoles diffèrent-elles entre le nord et le sud de la Côte d'Ivoire ?$$,
      'hint', $$Pense à l'interdépendance climat-sol-végétation.$$,
      'expected', $$Parce que le climat, le type de sol et la végétation varient d'une région à l'autre, ce qui détermine les cultures adaptées à chaque zone.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-interrelation-sols-climat-vegetation';
