-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 5 : Les gaz" (id 2091). Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 6ème se rend à bicyclette à l'école quand il fait une crevaison. Chez le vulcanisateur, la chambre à air gonflée est plongée dans une bassine d'eau pour repérer la fuite : des bulles d'air apparaissent en plusieurs points. Arrivé en classe, il raconte sa mésaventure, et les élèves cherchent à connaître les propriétés des gaz mises en évidence.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Existence de l'air et propriétés des gaz$$,
        'body', $$Un tube à essai retourné dans l'eau ne laisse pas entrer l'eau : il contient de l'air. Quand on l'incline, des bulles d'air s'échappent et l'eau prend sa place — preuve que l'air, invisible, existe bien. L'air est la couche gazeuse qui enveloppe la Terre, formée de plusieurs gaz (oxygène, gaz carbonique, azote...). D'autres gaz existent, comme le gaz butane. Les gaz sont compressibles (leur volume diminue sous compression), expansibles (ils occupent tout l'espace offert quand on les détend), et élastiques (ils reprennent leur volume initial quand on cesse de les comprimer/détendre).$$,
        'highlights', array[$$l'air = mélange de gaz (oxygène, gaz carbonique, azote) qui enveloppe la Terre$$, $$3 propriétés des gaz : compressibles, expansibles, élastiques$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle expérience simple prouve l'existence de l'air, pourtant invisible ?$$, 'solution', $$Un tube à essai retourné dans l'eau, incliné, laisse échapper des bulles d'air.$$)
      ),
      jsonb_build_object(
        'heading', $$Notion de pression d'un gaz$$,
        'body', $$Quand on appuie sur le piston d'une seringue, on ressent une poussée : c'est la pression du gaz, la poussée qu'il exerce sur la surface avec laquelle il est en contact. Lorsqu'on comprime un gaz, son volume diminue et sa pression augmente. Lorsqu'on le détend, son volume augmente et sa pression diminue. Les gaz sont aussi des fluides, comme les liquides.$$,
        'highlights', array[$$pression d'un gaz = poussée exercée sur une surface en contact$$, $$compression : volume ↓, pression ↑ ; détente : volume ↑, pression ↓$$]::text[],
        'example', jsonb_build_object('statement', $$Un ballon de football se dégonfle et perd en volume. Que se passe-t-il pour la pression de l'air à l'intérieur ?$$, 'solution', $$Elle diminue (moins d'air comprimé = moins de pression).$$),
        'fixation', jsonb_build_object('question', $$Que se passe-t-il pour la pression d'un gaz lorsqu'on le comprime ?$$, 'solution', $$Elle augmente (tandis que son volume diminue).$$)
      ),
      jsonb_build_object(
        'heading', $$Recueillement, conservation d'un gaz, et sécurité$$,
        'body', $$Un gaz peut être transvasé ou recueilli par déplacement d'eau : on remplit un récipient d'eau, on y introduit le tube contenant le gaz, et le gaz chasse l'eau en remontant. Pour conserver le gaz recueilli, on maintient le bocal retourné dans l'eau, qui l'empêche de s'échapper. Certains gaz sont dangereux, notamment les gaz combustibles (propane, butane, méthane) : les cuisines utilisant le gaz butane doivent être bien aérées, car une fuite peut provoquer un incendie.$$,
        'highlights', array[$$recueillement/transvasement d'un gaz = par déplacement d'eau$$, $$gaz combustibles dangereux : propane, butane, méthane → aération nécessaire$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi une cuisine utilisant le gaz butane doit-elle être bien aérée ?$$, 'solution', $$Parce qu'une fuite de gaz combustible non évacuée peut s'accumuler et provoquer un incendie.$$),
        'fixation', jsonb_build_object('question', $$Comment recueille-t-on un gaz au laboratoire ?$$, 'solution', $$Par déplacement d'eau.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le pneu du vélo d'un ami se dégonfle après un passage sur une pointe. Chez le vulcanisateur, la chambre à air plongée dans l'eau laisse échapper des bulles.$$,
      'questions', array[
        $$Dis ce que met en évidence la formation de bulles dans l'eau.$$,
        $$Indique la propriété des gaz mise en évidence par cette observation.$$,
        $$Propose une explication à cette propriété.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Le volume d'un gaz augmente-t-il ou diminue-t-il lorsqu'il est détendu ?$$,
      'hint', $$C'est le contraire de la compression.$$,
      'expected', $$Il augmente.$$
    ),
    jsonb_build_object(
      'question', $$Les gaz ont-ils une forme propre ?$$,
      'hint', $$Comme les liquides, ce sont des fluides.$$,
      'expected', $$Non, ils n'ont pas de forme propre : ils occupent tout l'espace offert.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la propriété d'un gaz qui reprend sa position initiale après compression ou détente ?$$,
      'hint', $$C'est comme un ressort.$$,
      'expected', $$L'élasticité.$$
    ),
    jsonb_build_object(
      'question', $$Complète : "Le transvasement d'un gaz se fait par la méthode de déplacement de ______."$$,
      'hint', $$C'est un liquide très commun.$$,
      'expected', $$"...déplacement d'eau."$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-gaz';
