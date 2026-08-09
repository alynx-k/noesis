-- Physique-Chimie 4ème — Production d'une tension alternative.
-- Real content sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2013 "Lecon6_Production d'une Tension
-- alternative", resource id 16452 ("Je lis le résumé de la leçon"), PDF
-- "PC 4ème_L6_Production dune Tension alternative.pdf" (7 pages, thème
-- Courants et tensions alternatifs). Rewritten in original wording —
-- paraphrased, not copied from the source PDF — keeping the same
-- technical content: tension produced by moving a magnet near a coil, the
-- LED / oscilloscope evidence that this tension is alternating (versus a
-- battery's continuous tension), the alternator's rotor (magnet) and
-- stator (coil), and its applications (bicycle dynamo, hydroelectric and
-- thermal power plants).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une visite guidée d'une centrale thermique, des élèves de 4ème apprennent qu'un ingénieur y explique la production de la tension électrique. De retour en classe, ils veulent produire eux-mêmes une tension à partir d'un aimant et d'une bobine, visualiser cette tension, la comparer à celle d'une pile, et comprendre comment ce principe est exploité, de la dynamo de vélo jusqu'aux grandes centrales électriques.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Tension produite par un aimant en mouvement près d'une bobine$$,
        'body', $$Une bobine est reliée à un galvanomètre. Lorsqu'un aimant reste immobile devant elle, l'aiguille du galvanomètre ne bouge pas. Dès que l'on déplace l'aimant à proximité d'une des faces de la bobine, l'aiguille dévie, d'abord dans un sens, puis dans l'autre si le mouvement se poursuit. Ce déplacement de l'aimant fait donc apparaître une tension dans le circuit de la bobine.$$,
        'highlights', array[$$tension induite$$, $$déplacement de l'aimant$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le déplacement d'un aimant au voisinage d'une des faces d'une bobine fait apparaître une tension dans le circuit de cette bobine. Sans mouvement relatif, aucune tension n'apparaît.$$),
        'example', jsonb_build_object('statement', $$Un aimant immobile est placé devant une bobine reliée à un galvanomètre : l'aiguille ne bouge pas. On approche alors rapidement l'aimant de la bobine. Que se passe-t-il ?$$, 'solution', $$L'aiguille du galvanomètre dévie, car le déplacement de l'aimant fait apparaître une tension dans le circuit de la bobine.$$),
        'fixation', jsonb_build_object('question', $$Une bobine et un aimant restent tous deux parfaitement immobiles l'un devant l'autre. Une tension apparaît-elle dans le circuit de la bobine ?$$, 'solution', $$Non, car il n'y a pas de déplacement de l'aimant par rapport à la bobine.$$)
      ),
      jsonb_build_object(
        'heading', $$Nature de la tension produite : une tension alternative$$,
        'body', $$En reliant la bobine à deux diodes électroluminescentes (DEL) montées tête-bêche, on observe qu'elles s'allument l'une après l'autre à mesure que l'aimant se déplace : la tension change donc de sens au fil du temps. Observée à l'oscilloscope, la tension produite par la pile trace une droite horizontale constante (tension continue), tandis que celle produite par l'aimant et la bobine trace une courbe qui oscille tantôt au-dessus, tantôt en dessous de l'axe des temps : c'est une tension alternative.$$,
        'highlights', array[$$tension alternative$$, $$tension continue$$, $$oscilloscope$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une tension continue, comme celle d'une pile, garde toujours le même sens : à l'oscilloscope, elle donne une droite horizontale. Une tension alternative change périodiquement de sens au cours du temps : à l'oscilloscope, elle donne une courbe qui oscille de part et d'autre de l'axe des temps.$$),
        'example', jsonb_build_object('statement', $$Deux DEL montées tête-bêche sont reliées à une bobine devant laquelle on déplace un aimant de va-et-vient. Elles s'allument chacune leur tour. Que révèle cette observation sur la tension produite ?$$, 'solution', $$Elle révèle que la tension change de sens au cours du temps : chaque DEL ne s'allume que lorsque le courant circule dans le sens qui lui convient, donc la tension est alternative.$$),
        'fixation', jsonb_build_object('question', $$Quelle forme prend, sur l'écran d'un oscilloscope, la tension continue produite par une pile ?$$, 'solution', $$Une droite horizontale constante, au-dessus ou en dessous de l'axe des temps.$$)
      ),
      jsonb_build_object(
        'heading', $$L'alternateur : rotor et stator$$,
        'body', $$Un alternateur est un générateur qui produit une tension alternative grâce à deux parties : le rotor, la partie tournante qui porte l'aimant, et le stator, la partie fixe qui porte la bobine. La rotation continue du rotor devant le stator fait apparaître une tension alternative aux bornes de la bobine.$$,
        'highlights', array[$$alternateur$$, $$rotor$$, $$stator$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Dans un alternateur, le rotor (aimant tournant) entraîne l'apparition d'une tension alternative dans le stator (bobine fixe). Plus la rotation du rotor est rapide, plus la tension produite est grande.$$),
        'example', jsonb_build_object('statement', $$Dans un alternateur, quelle est la partie qui tourne et quelle est celle qui reste fixe ?$$, 'solution', $$Le rotor, qui porte l'aimant, tourne ; le stator, qui porte la bobine, reste fixe.$$),
        'fixation', jsonb_build_object('question', $$Quel est le rôle du rotor dans un alternateur ?$$, 'solution', $$Le rotor porte l'aimant et tourne, ce qui fait apparaître une tension alternative dans la bobine du stator.$$)
      ),
      jsonb_build_object(
        'heading', $$Applications de l'alternateur$$,
        'body', $$Sur un vélo, une génératrice de bicyclette utilise le mouvement de la roue : un galet en contact avec le pneu entraîne la rotation de l'aimant (rotor) devant la bobine (stator), produisant la tension alternative qui allume le phare. À plus grande échelle, une centrale hydroélectrique utilise le mouvement de l'eau pour faire tourner une turbine reliée à un alternateur, tandis qu'une centrale thermique brûle du charbon, du pétrole ou du gaz pour produire de la vapeur d'eau qui entraîne cette même turbine.$$,
        'highlights', array[$$génératrice de bicyclette$$, $$centrale hydroélectrique$$, $$centrale thermique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Toute centrale électrique (hydroélectrique, thermique) repose sur une turbine qui entraîne un alternateur : c'est la rotation de cette turbine, provoquée par l'eau ou la vapeur, qui produit la tension alternative distribuée par le réseau.$$),
        'example', jsonb_build_object('statement', $$Un cycliste s'arrête : le phare de son vélo, alimenté par une génératrice, s'éteint aussitôt. Pourquoi ?$$, 'solution', $$Sans rotation de la roue, le galet n'entraîne plus l'aimant : il n'y a plus de mouvement relatif entre l'aimant et la bobine, donc plus de tension produite, et le phare s'éteint.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui fait tourner la turbine reliée à l'alternateur dans une centrale hydroélectrique ?$$, 'solution', $$Le mouvement de l'eau.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Chaque soir, un cycliste se déplace à vélo, phare allumé grâce à une génératrice de bicyclette posée contre la roue. Son fils affirme que cette génératrice contient une bobine et un aimant, sans savoir laquelle des deux parties est mobile.$$,
      'questions', array[
        $$Quelle partie de la génératrice de bicyclette est entraînée en rotation par le galet en contact avec la roue ?$$,
        $$Quel type de tension (continue ou alternative) est produit aux bornes de la bobine pendant le pédalage ?$$,
        $$Que se passe-t-il pour cette tension, et donc pour le phare, si le cycliste s'arrête complètement ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une bobine reliée à un galvanomètre fait face à un aimant immobile : l'aiguille ne bouge pas. Que faut-il faire pour qu'une tension apparaisse ?$$,
      'hint', $$Pense à la condition nécessaire pour qu'une tension soit induite.$$,
      'expected', $$Il faut déplacer l'aimant par rapport à la bobine : sans mouvement relatif, aucune tension n'apparaît.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre la courbe observée à l'oscilloscope pour la tension d'une pile et celle produite par un aimant en mouvement devant une bobine ?$$,
      'hint', $$L'une est une droite, l'autre change de sens.$$,
      'expected', $$La tension d'une pile donne une droite horizontale constante (tension continue), alors que celle de l'aimant en mouvement donne une courbe qui oscille de part et d'autre de l'axe des temps (tension alternative).$$
    ),
    jsonb_build_object(
      'question', $$Dans un alternateur, quel est le nom de la partie tournante et celui de la partie fixe ?$$,
      'hint', $$L'une porte l'aimant, l'autre porte la bobine.$$,
      'expected', $$Le rotor est la partie tournante (elle porte l'aimant) ; le stator est la partie fixe (elle porte la bobine).$$
    ),
    jsonb_build_object(
      'question', $$Explique le principe commun à une centrale hydroélectrique et à une centrale thermique pour produire de l'électricité.$$,
      'hint', $$Les deux types de centrales font tourner le même type de dispositif.$$,
      'expected', $$Dans les deux cas, une turbine est entraînée en rotation (par l'eau dans une centrale hydroélectrique, par de la vapeur d'eau dans une centrale thermique) et cette turbine fait tourner un alternateur, qui produit la tension alternative distribuée.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-production-tension-alternative';
