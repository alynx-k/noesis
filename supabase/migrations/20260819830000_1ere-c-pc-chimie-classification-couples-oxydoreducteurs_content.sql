-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2394: "LEÇON 11: CLASSIFICATION QUANTITATIVE DES
-- COUPLES OXYDANTS/RÉDUCTEURS" (https://lyc.ecole-ci.org/course/view.php?id=2394),
-- resource id 22086. Contenu réécrit à partir du PDF source (pile de
-- Daniell, potentiel d'oxydoréduction, classification quantitative des
-- couples, prévision des réactions, exemples de piles électrochimiques
-- usuelles). Tout le contenu est factuel (électrochimie) : schémas,
-- demi-équations, potentiels standards réels et exercices numériques sont
-- repris/adaptés tels quels ; explications reformulées. Cette leçon ouvre
-- le thème « Oxydoréduction » du programme de 1ère C ; les leçons
-- numérotées 9 et 10 n'apparaissent pas dans la liste de cours de cette
-- catégorie sur la plateforme source (lacune structurelle, comme la
-- leçon 4 en chimie organique).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-classification-couples-oxydoreducteurs',
  '1ere',
  'C',
  'physique-chimie',
  $$Classification quantitative des couples oxydants/réducteurs$$,
  7,
  '1ere-c-pc-chimie-esterification-hydrolyse',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un réparateur d'appareils électroménagers du quartier commerce de Grand-Lahou insère une lame de cuivre et une lame de zinc dans une tomate, devant un groupe d'élèves de 1ère C. À l'aide d'un voltmètre, il mesure une différence de potentiel entre les deux lames et annonce qu'il vient de réaliser une pile. Fascinés, les élèves entreprennent, sous la supervision de leur professeur, de schématiser une pile, d'expliquer son fonctionnement, de déterminer sa f.é.m., puis de schématiser d'autres piles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La pile de Daniell$$,
        'body', $$Une pile électrochimique transforme l'énergie chimique en énergie électrique en séparant physiquement les deux couples oxydant-réducteur d'une réaction, tout en faisant circuler les électrons par un circuit extérieur. La pile de Daniell est constituée d'une lame de zinc plongée dans une solution de sulfate de zinc, et d'une lame de cuivre plongée dans une solution de sulfate de cuivre, les deux compartiments (demi-piles) étant reliés par un pont salin. La lame de zinc constitue la borne (-) : les atomes de zinc y cèdent des électrons (oxydation, Zn → Zn²⁺ + 2e⁻). La lame de cuivre constitue la borne (+) : les ions Cu²⁺ y captent ces électrons (réduction, Cu²⁺ + 2e⁻ → Cu). L'équation-bilan globale est Zn + Cu²⁺ → Cu + Zn²⁺. Le pôle négatif d'une pile est toujours le siège d'une oxydation, le pôle positif celui d'une réduction ; la notation conventionnelle de cette pile est : (-) Zn/Zn²⁺ ‖ Cu²⁺/Cu (+).$$,
        'highlights', array[$$pile électrochimique : énergie chimique → énergie électrique$$, $$borne (-) = oxydation ; borne (+) = réduction$$, $$Daniell : Zn + Cu²⁺ → Cu + Zn²⁺$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans la pile de Daniell, que devient la masse de la lame de zinc au cours du fonctionnement de la pile ?$$, 'solution', $$Elle diminue, car les atomes de zinc s'oxydent en ions Zn²⁺ qui passent en solution.$$)
      ),
      jsonb_build_object(
        'heading', $$Généralisation à d'autres piles$$,
        'body', $$Pour deux couples oxydant-réducteur Mn²⁺/Mn et Mn'²⁺/Mn', la borne négative d'une pile est toujours constituée par le métal le plus réducteur, et la borne positive par le métal le moins réducteur (l'oxydant le plus fort). Par exemple, dans la pile Cu/Pb, le plomb (plus réducteur) constitue la borne négative et le cuivre la borne positive : Pb + Cu²⁺ → Pb²⁺ + Cu.$$,
        'highlights', array[$$borne (-) = métal le plus réducteur$$, $$borne (+) = métal le moins réducteur$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la pile Cu/Cu²⁺ ‖ Ag⁺/Ag, la masse de l'électrode de cuivre augmente-t-elle ou diminue-t-elle ?$$, 'solution', $$Elle diminue : le cuivre, plus réducteur que l'argent, constitue la borne négative et s'oxyde (Cu → Cu²⁺ + 2e⁻).$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on chaque compartiment d'une pile, contenant une électrode et sa solution ?$$, 'solution', $$Une demi-pile.$$)
      ),
      jsonb_build_object(
        'heading', $$Le potentiel d'oxydoréduction$$,
        'body', $$Le couple de référence H⁺/H2 a un potentiel choisi nul à toute température (E°(H⁺/H2) = 0 V), mesuré grâce à l'électrode standard à hydrogène (ESH). Le potentiel d'oxydoréduction d'un couple Mn+/M est la f.é.m. de la pile formée par la demi-pile de ce couple associée à l'ESH. Si le métal M est moins réducteur que H2, son potentiel est positif ; s'il est plus réducteur, son potentiel est négatif. En pratique, on utilise souvent la demi-pile Cu²⁺/Cu (de potentiel normal E°(Cu²⁺/Cu) = 0,34 V) comme référence secondaire, plus commode que l'ESH. La force électromotrice (f.é.m.) d'une pile est la différence entre le potentiel du couple à la borne positive et celui du couple à la borne négative : E° = E°(+) − E°(−).$$,
        'highlights', array[$$E°(H⁺/H2) = 0 V (référence)$$, $$E°(Cu²⁺/Cu) = 0,34 V (référence secondaire usuelle)$$, $$f.é.m. : E° = E°(borne +) − E°(borne −)$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule la f.é.m. standard de la pile Fe²⁺/Fe (E° = -0,44 V) et Ag⁺/Ag (E° = +0,80 V).$$, 'solution', $$E° = 0,80 − (−0,44) = 1,24 V (borne + : Ag ; borne − : Fe).$$),
        'fixation', jsonb_build_object('question', $$Quel est, par convention, le potentiel standard du couple H⁺/H2 ?$$, 'solution', $$0,00 V, à toute température.$$)
      ),
      jsonb_build_object(
        'heading', $$Classification quantitative et prévision des réactions$$,
        'body', $$La connaissance des potentiels standards permet de classer les couples oxydant-réducteur sur une échelle : plus l'oxydant d'un couple est fort, plus son potentiel est élevé (pouvoir oxydant croissant, POC, vers le haut) ; plus le réducteur d'un couple est fort, plus son potentiel est faible (pouvoir réducteur croissant, PRC, vers le bas). Exemples de potentiels standards (en V) : Zn²⁺/Zn = -0,77 ; Fe²⁺/Fe = -0,44 ; Pb²⁺/Pb = -0,13 ; H⁺/H2 = 0,00 ; Cu²⁺/Cu = 0,34 ; Ag⁺/Ag = 0,80. La seule réaction spontanée possible entre deux couples est celle entre l'oxydant le plus fort et le réducteur le plus fort (règle du gamma).$$,
        'highlights', array[$$POC : pouvoir oxydant croissant (potentiel élevé)$$, $$PRC : pouvoir réducteur croissant (potentiel faible)$$, $$réaction spontanée : oxydant fort + réducteur fort$$]::text[],
        'fixation', jsonb_build_object('question', $$Entre les couples Au³⁺/Au (E° = 1,5 V) et Mg²⁺/Mg (E° = -2,37 V), quelle réaction spontanée est possible ?$$, 'solution', $$Les ions Au³⁺ (oxydant le plus fort) réagissent avec le magnésium Mg (réducteur le plus fort) : 3 Mg + 2 Au³⁺ → 3 Mg²⁺ + 2 Au.$$)
      ),
      jsonb_build_object(
        'heading', $$Quelques piles électrochimiques usuelles$$,
        'body', $$La pile de Volta (inventée en 1800 par Alessandro Volta) fonctionne selon Zn + 2H2O → Zn²⁺ + 2HO⁻ + H2. La pile Leclanché, inventée par Georges Leclanché, est la première pile saline : Zn(s) + 2MnO2(s) + 2H⁺(aq) → Zn²⁺(aq) + 2MnO(OH)(s). Une pile alcaline (comme la pile Duracell) a un électrolyte basique. Une pile neuve est chargée et se décharge à l'usage ; lorsqu'un réactif est entièrement consommé, elle est usagée et ne doit pas être rechargée. Contrairement aux piles, les accumulateurs (batteries) peuvent être rechargés : en imposant, via un générateur, un courant en sens inverse du sens spontané (électrolyse), leurs réactifs se reconstituent.$$,
        'highlights', array[$$pile de Volta (1800) : Zn + 2H2O → Zn²⁺ + 2HO⁻ + H2$$, $$pile Leclanché : première pile saline$$, $$accumulateur : rechargeable, contrairement à une pile$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle différence fondamentale distingue une pile usagée d'un accumulateur déchargé ?$$, 'solution', $$La pile usagée ne peut pas être rechargée (un réactif est entièrement consommé), tandis que l'accumulateur déchargé peut être rechargé en imposant un courant en sens inverse.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Après le cours de chimie sur la classification quantitative des couples oxydant-réducteur, ton groupe d'élèves de 1ère C du Lycée Moderne de Grand-Lahou veut fabriquer des piles pour vérifier ses acquis, en utilisant les couples suivants — pile A : E°(Zn²⁺/Zn) = -0,76 V et E°(Ag⁺/Ag) = +0,80 V ; pile B : E°(Cu²⁺/Cu) = +0,34 V et E°(Hg²⁺/Hg) = +0,86 V.$$,
      'questions', array[
        $$Définis la f.é.m. d'une pile.$$,
        $$Donne le schéma conventionnel de chacune des deux piles A et B, et écris les demi-équations électroniques à leurs électrodes.$$,
        $$Déduis-en les équations-bilans de fonctionnement des piles A et B, puis détermine la f.é.m. de chacune.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans une pile électrochimique, quelle réaction se produit toujours au pôle négatif ?$$,
      'hint', $$C'est le pôle où le métal perd des électrons.$$,
      'expected', $$Une oxydation.$$
    ),
    jsonb_build_object(
      'question', $$Écris la demi-équation d'oxydation du zinc.$$,
      'hint', $$Zn perd 2 électrons.$$,
      'expected', $$Zn → Zn²⁺ + 2e⁻.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le potentiel standard du couple de référence H⁺/H2, et à quelle électrode ce potentiel est-il mesuré ?$$,
      'hint', $$C'est la valeur de référence de toute la classification.$$,
      'expected', $$0,00 V, mesuré à l'électrode standard à hydrogène (ESH).$$
    ),
    jsonb_build_object(
      'question', $$Entre les couples Zn²⁺/Zn (E° = -0,77 V) et Pb²⁺/Pb (E° = -0,13 V), lequel des deux métaux constitue la borne positive d'une pile Pb/Zn ?$$,
      'hint', $$La borne positive correspond au potentiel le plus élevé.$$,
      'expected', $$Le plomb (Pb), car son potentiel standard (-0,13 V) est supérieur à celui du zinc (-0,77 V).$$
    )
  ),
  now()
);
