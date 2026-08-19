-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- SVT, categoryid=125.
-- Moodle course id 895: "SVT 1ère A_L1_Le Reflexe conditionnel"
-- (https://lyc.ecole-ci.org/course/view.php?id=895), resource id 4389.
-- Contenu réécrit à partir du PDF source (expérience de Pavlov, mécanisme
-- nerveux du réflexe conditionnel, avantages). Faits scientifiques réels
-- (expérience de Pavlov, structures nerveuses impliquées) repris tels
-- quels ; explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-svt-reflexe-conditionnel',
  '1ere',
  'A',
  'svt',
  $$Le réflexe conditionnel$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 1ère A donne à manger à son chien chaque jour dans une assiette rouge. Deux mois après, il remarque que son chien se met à saliver dès qu'il le voit avec l'assiette rouge, avant même d'avoir mangé. Pour comprendre ce comportement, la classe décide de déterminer sa nature, ses caractéristiques, son mécanisme, et ses avantages.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'expérience de Pavlov$$,
        'body', $$Pavlov et ses collaborateurs ont montré, chez un chien affamé porteur d'une fistule salivaire, que la nourriture seule provoque une salivation, tandis que le son d'un métronome seul n'en provoque aucune. Mais lorsque le son est associé plusieurs fois de suite à la nourriture, le son seul finit par déclencher la salivation. Si l'association n'est plus entretenue (le son est répété sans nourriture pendant plusieurs jours), la salivation provoquée par le son diminue progressivement jusqu'à disparaître : c'est l'extinction.$$,
        'highlights', array[$$son seul → pas de salivation$$, $$son + nourriture répétés → son seul déclenche la salivation$$, $$sans entretien → extinction$$]::text[],
        'fixation', jsonb_build_object('question', $$Que se passe-t-il si le son du métronome est présenté seul, plusieurs jours de suite, sans plus jamais l'associer à la nourriture ?$$, 'solution', $$La salivation provoquée par le son diminue progressivement jusqu'à disparaître complètement : c'est le phénomène d'extinction.$$)
      ),
      jsonb_build_object(
        'heading', $$Stimulus absolu et stimulus conditionnel$$,
        'body', $$Avant l'apprentissage, la viande déclenche immédiatement la salivation : c'est le stimulus absolu (ou inconditionnel), et la réaction qu'il déclenche est le réflexe inné de salivation, dû à des voies nerveuses présentes dès la naissance. Pendant l'apprentissage, le son (stimulus neutre au départ) est associé plusieurs fois au stimulus absolu, et finit par déclencher seul la salivation : il devient alors le stimulus conditionnel, et la réaction obtenue est le réflexe acquis (ou conditionnel).$$,
        'highlights', array[$$stimulus absolu = viande → réflexe inné$$, $$stimulus conditionnel = son (après apprentissage) → réflexe acquis$$]::text[],
        'property', jsonb_build_object('label', $$Conditions d'obtention du réflexe conditionnel$$, 'text', $$Le stimulus neutre doit toujours être associé au stimulus absolu ; le stimulus absolu précède toujours le stimulus neutre ; l'apprentissage doit être répété plusieurs fois dans le même sens ; le réflexe conditionnel doit être entretenu, sinon il s'éteint.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre un réflexe inné et un réflexe acquis (conditionnel) ?$$, 'solution', $$Le réflexe inné existe dès la naissance grâce à des voies nerveuses préexistantes (déclenché par le stimulus absolu), tandis que le réflexe acquis résulte d'un apprentissage associant un stimulus neutre au stimulus absolu (déclenché ensuite par le stimulus devenu conditionnel).$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme nerveux du réflexe conditionnel$$,
        'body', $$Le réflexe inné (salivation à la vue/au goût de la viande) met en jeu la langue (récepteur), une fibre nerveuse afférente, le bulbe rachidien (centre nerveux) et une fibre efférente jusqu'à la glande salivaire (effecteur) — ce circuit ne nécessite pas le cerveau. Le réflexe conditionnel, lui, nécessite la présence du cerveau : au cours de l'apprentissage, une nouvelle liaison nerveuse s'établit progressivement, au niveau du cortex cérébral, entre l'aire corticale auditive (qui reçoit le son) et l'aire corticale gustative liée au centre salivaire. Une fois cette liaison établie, le son seul active le centre salivaire via ce nouveau circuit cortical.$$,
        'highlights', array[$$réflexe inné : bulbe rachidien (sans cerveau)$$, $$réflexe conditionnel : nouvelle liaison corticale (avec cerveau)$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi le réflexe conditionnel nécessite-t-il la présence du cerveau, contrairement au réflexe inné ?$$, 'solution', $$Parce que la nouvelle liaison nerveuse qui permet au stimulus neutre (devenu conditionnel) de déclencher la réponse se met en place au niveau du cortex cérébral, entre l'aire auditive et l'aire gustative — un circuit qui n'existe pas dans le réflexe inné, lequel passe uniquement par le bulbe rachidien.$$),
        'fixation', jsonb_build_object('question', $$Quel centre nerveux suffit à réaliser le réflexe inné de salivation, sans intervention du cerveau ?$$, 'solution', $$Le bulbe rachidien.$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages des réflexes conditionnels$$,
        'body', $$Les réflexes conditionnels acquis au cours de la vie permettent l'adaptation de l'individu à son milieu et donnent naissance à des comportements automatiques comme la marche, l'écriture, la lecture, la natation ou la conduite d'une voiture. Ils servent au développement de l'automatisme, à l'éducation (langage, écriture, lecture) et au dressage des animaux (chiens policiers, chiens guides d'aveugles, chiens de chasse).$$,
        'highlights', array[$$automatismes : marche, écriture, conduite$$, $$dressage animal : chiens policiers, guides d'aveugles$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux exemples de comportements automatiques rendus possibles par les réflexes conditionnels chez l'homme.$$, 'solution', $$Par exemple la marche et l'écriture (également valables : la lecture, la conduite d'une voiture, la natation).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors de la conquête spatiale, des singes ont été entraînés à appuyer sur une touche pour obtenir de la nourriture, mais seulement lorsqu'un voyant lumineux était allumé. Au fil de sept séries de huit essais, le temps de réaction du singe (délai entre l'allumage du voyant et l'appui sur la touche) diminue progressivement, jusqu'à ce que le singe appuie presque instantanément dès la 4ème série.$$,
      'questions', array[
        $$Explique pourquoi, à partir de la 4ème série, le singe appuie presque instantanément sur la touche dès l'allumage du voyant.$$,
        $$Nomme le type de réflexe mis en évidence dans cette expérience.$$,
        $$Réalise un schéma simplifié du trajet de l'influx nerveux correspondant à ce comportement (récepteur → centre nerveux → effecteur).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans l'expérience de Pavlov, qu'est-ce que le stimulus absolu (ou inconditionnel) ?$$,
      'hint', $$C'est ce qui déclenche la salivation dès le départ, sans apprentissage.$$,
      'expected', $$La viande (la nourriture).$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la disparition progressive d'un réflexe conditionnel qui n'est plus entretenu ?$$,
      'hint', $$C'est un mot en huit lettres.$$,
      'expected', $$L'extinction.$$
    ),
    jsonb_build_object(
      'question', $$Quelle nouvelle liaison nerveuse se forme au cours de l'apprentissage du réflexe conditionnel de salivation ?$$,
      'hint', $$Elle relie deux aires du cortex cérébral.$$,
      'expected', $$Une liaison entre l'aire corticale auditive et l'aire corticale gustative (liée au centre salivaire).$$
    ),
    jsonb_build_object(
      'question', $$Cite une condition nécessaire pour obtenir un réflexe conditionnel durable.$$,
      'hint', $$Pense à l'ordre et à la répétition des stimuli.$$,
      'expected', $$Par exemple que le stimulus absolu précède toujours le stimulus neutre, et que l'association soit répétée plusieurs fois (également valable : le réflexe doit être entretenu pour ne pas s'éteindre).$$
    )
  ),
  now()
);
