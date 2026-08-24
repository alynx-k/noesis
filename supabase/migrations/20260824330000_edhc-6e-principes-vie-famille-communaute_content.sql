-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 4 : LES PRINCIPES ET RÈGLES DE VIE EN FAMILLE ET EN
-- COMMUNAUTÉ" (id 1724). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$L'administration de ton établissement refuse la tenue d'une conférence organisée par le Club Santé, faute d'en avoir été informée à temps. Certains membres acceptent la décision, d'autres refusent d'entendre raison. Pour préserver l'entente entre eux, un groupe d'élèves va s'informer sur les principes et règles de vie en famille et en communauté.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition des principes et règles de vie$$,
        'body', $$Les principes et règles de vie sont un ensemble de valeurs, de normes, de comportements et d'attitudes fixés par les parents ou la société pour assurer le bon fonctionnement de la vie en communauté. On distingue les valeurs individuelles (l'honnêteté, la dignité, la politesse, la courtoisie) et les valeurs sociales (la solidarité, la tolérance, l'hospitalité, le respect).$$,
        'highlights', array[$$valeurs individuelles : honnêteté, dignité, politesse, courtoisie$$, $$valeurs sociales : solidarité, tolérance, hospitalité, respect$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux valeurs individuelles.$$, 'solution', $$Par exemple : l'honnêteté et la politesse (deux parmi honnêteté, dignité, politesse, courtoisie).$$)
      ),
      jsonb_build_object(
        'heading', $$Le règlement intérieur de l'école$$,
        'body', $$Le règlement intérieur de l'école est un document administratif qui organise la vie au sein d'un établissement. Il comporte un organigramme indiquant la place de chaque acteur, ainsi que les comportements et attitudes admis. Exemples d'articles : "Est considéré comme élève de l'établissement celui qui s'est acquitté de son droit d'inscription" ; "Tout travail de classe non fait sera sanctionné par la note zéro."$$,
        'highlights', array[$$règlement intérieur = document qui organise la vie de l'établissement (droits, devoirs, sanctions)$$]::text[],
        'example', jsonb_build_object('statement', $$Un élève n'a pas payé ses frais d'inscription. Que dit le règlement intérieur à son sujet ?$$, 'solution', $$Il n'est pas considéré comme élève de l'établissement tant qu'il ne s'est pas acquitté de son droit d'inscription.$$),
        'fixation', jsonb_build_object('question', $$Que risque un élève qui ne fait pas un travail de classe, selon le règlement intérieur cité ?$$, 'solution', $$La note zéro (article 7, alinéa 3).$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance du respect des principes et règles de vie$$,
        'body', $$Pour la famille, le respect de ces principes favorise la réussite scolaire, l'épanouissement individuel, la cohésion familiale et le bien-être social. Pour la société, il favorise la discipline, la cohésion sociale, la paix et le développement. La vie en société est régie par ces valeurs individuelles et sociales, et leur respect garantit une société harmonieuse.$$,
        'highlights', array[$$famille : réussite scolaire, épanouissement, cohésion familiale$$, $$société : discipline, cohésion sociale, paix, développement$$]::text[],
        'example', jsonb_build_object('statement', $$"Saluer ses parents au réveil" relève-t-il des principes de vie en famille ou en communauté ?$$, 'solution', $$En famille.$$),
        'fixation', jsonb_build_object('question', $$Que favorise le respect des règles de vie au niveau de la société ?$$, 'solution', $$La discipline, la cohésion sociale, la paix, et le développement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les manguiers de la cour du voisin sont chargés de fruits mûrs. Ton frère cadet te propose de profiter de l'absence des habitants pour aller cueillir quelques mangues.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Cite une valeur individuelle et une valeur sociale liées aux principes de vie en communauté.$$,
        $$Justifie ton refus de la proposition de ton frère.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$"Respecter le règlement intérieur de l'école" est-il un principe de vie en famille ou en communauté ?$$,
      'hint', $$Cela concerne la vie à l'école, hors du foyer.$$,
      'expected', $$En communauté.$$
    ),
    jsonb_build_object(
      'question', $$"Céder sa place à une personne âgée" illustre quelle valeur sociale ?$$,
      'hint', $$C'est une marque de considération envers les aînés.$$,
      'expected', $$Le respect (ou l'hospitalité/la courtoisie envers les aînés).$$
    ),
    jsonb_build_object(
      'question', $$Complète : "Le règlement intérieur est l'______ des ______ qui régissent la vie au sein d'un établissement scolaire."$$,
      'hint', $$Deux mots : un pour "totalité", un pour "normes".$$,
      'expected', $$"Le règlement intérieur est l'ensemble des règles qui régissent la vie au sein d'un établissement scolaire."$$
    ),
    jsonb_build_object(
      'question', $$Le respect des principes de vie favorise-t-il "de mauvais résultats scolaires" ou "une éducation de qualité" ?$$,
      'hint', $$C'est un bienfait, pas un inconvénient.$$,
      'expected', $$"Une éducation de qualité."$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-principes-vie-famille-communaute';
