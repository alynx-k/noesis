-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Histoire.
-- Cours : "Leçon 1 : L'histoire et son objet" (Thème 1 : Les bases de
-- l'étude de l'histoire). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans la cour de leur établissement, des élèves de 6ème nouvellement affectés échangent sur l'intérêt des disciplines scolaires. Certains soutiennent que « l'Histoire ne sert qu'à parler des guerres et de leurs héros » et qu'elle n'apporte rien à une nation ; d'autres pensent au contraire qu'elle représente la mémoire d'un peuple. Pour trancher, ils décident de mener des recherches afin d'identifier l'objet de l'histoire, sa démarche et son utilité.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'objet d'étude de l'histoire$$,
        'body', $$Le mot « Histoire » vient du grec « historia », qui signifie enquête ; son fondateur est le Grec Hérodote. L'histoire est la science qui étudie le passé de l'homme, à travers deux notions : l'événement (un fait important qui a marqué la vie d'une société, d'un peuple ou d'une nation, comme l'indépendance de la Côte d'Ivoire le 7 août 1960) et la civilisation (l'ensemble des croyances, des traditions, des cultures et des modes de vie qui caractérisent un peuple). Il n'existe pas de peuple sans civilisation.$$,
        'highlights', array[$$histoire (grec "historia" = enquête, fondateur Hérodote) = science du passé de l'homme$$, $$événement = fait marquant ; civilisation = croyances + traditions + cultures + modes de vie d'un peuple$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un exemple d'événement historique.$$, 'solution', $$Par exemple : l'indépendance de la Côte d'Ivoire le 7 août 1960, ou la Seconde Guerre mondiale (1939-1945).$$)
      ),
      jsonb_build_object(
        'heading', $$La démarche de l'historien$$,
        'body', $$La démarche de l'historien comprend cinq étapes : la détermination du problème, l'élaboration d'hypothèses, la recherche ou la collecte d'informations, la vérification des hypothèses, et la conclusion du travail par la rédaction d'un rapport. Cette démarche rigoureuse fait de l'histoire une véritable science, dans sa recherche de la vérité.$$,
        'highlights', array[$$5 étapes : problème → hypothèses → collecte d'informations → vérification → conclusion/rapport$$]::text[],
        'example', jsonb_build_object('statement', $$Pour reconstituer l'histoire de son village, une classe de 6ème formule d'abord des hypothèses, puis va recueillir des témoignages, avant de rédiger un rapport. Quelle étape manque dans cette description ?$$, 'solution', $$La vérification des hypothèses à partir des informations recueillies, avant la conclusion.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la première étape de la démarche de l'historien ?$$, 'solution', $$La détermination du problème.$$)
      ),
      jsonb_build_object(
        'heading', $$L'intérêt de l'étude de l'histoire$$,
        'body', $$L'histoire est importante car elle enseigne la vérité, la justice, la sagesse, la prudence, la tolérance et la solidarité. Elle permet de connaître le passé pour mieux vivre le présent et construire un avenir meilleur, de mesurer les progrès accomplis par les hommes, de prendre conscience de son appartenance à une famille, un peuple, une nation, et forme à l'impartialité et à la vie de citoyen.$$,
        'highlights', array[$$intérêts : vérité, tolérance, mémoire collective, formation du citoyen impartial$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux valeurs que l'étude de l'histoire enseigne.$$, 'solution', $$Par exemple : la vérité et la tolérance (deux parmi : justice, sagesse, prudence, solidarité).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Depuis le début de l'année, Gabriel ne participe pas régulièrement aux cours d'histoire. Face à ses camarades venus le voir, il affirme : « Cette discipline n'est pas indispensable pour ma formation, je préfère les sciences. » Son ami Robert lui répond : « Tu te trompes, l'histoire est aussi une science qui obéit à une démarche rigoureuse dans la quête de la vérité. »$$,
      'questions', array[
        $$Identifie le problème que soulève cette situation.$$,
        $$Explique en quoi l'histoire est une science, comme le soutient Robert.$$,
        $$Es-tu d'accord avec Gabriel lorsqu'il dit que l'histoire n'est pas indispensable pour sa formation ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$D'où vient le mot "Histoire" et que signifie-t-il ?$$,
      'hint', $$C'est un mot grec.$$,
      'expected', $$Du grec "historia", qui signifie enquête.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une civilisation ?$$,
      'hint', $$Pense aux croyances, traditions et modes de vie.$$,
      'expected', $$L'ensemble des croyances, des traditions, des cultures et des modes de vie qui caractérisent un peuple.$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre les étapes de la démarche de l'historien : conclusion, élaboration des hypothèses, vérification des hypothèses, collecte d'informations, détermination du problème.$$,
      'hint', $$Tout commence par un problème à résoudre.$$,
      'expected', $$1. Détermination du problème, 2. Élaboration des hypothèses, 3. Collecte d'informations, 4. Vérification des hypothèses, 5. Conclusion.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi dit-on que l'histoire est une science ?$$,
      'hint', $$Ce n'est pas un simple récit d'anecdotes.$$,
      'expected', $$Parce qu'elle suit une démarche rigoureuse (hypothèses, vérification, conclusion) dans sa recherche de la vérité.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-6e-histoire-objet';
