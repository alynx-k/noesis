-- REAL methodology sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2335: "EE 13: Résumé_Texte_Argu_Identifier_Situat_argumentation"
-- (https://lyc.ecole-ci.org/course/view.php?id=2335), resource id 21426.
-- The pedagogical method (thème, thèse de l'auteur, structure paragraphe
-- par paragraphe avec titres, visée argumentative) is reproduced from the
-- source, which is methodological and not subject to copyright concern.
-- As in the prior migration, the source's texte-support ("Foot africain :
-- danger !", Alphonse Boolamou de Ligouri, 2006) and its evaluation text
-- (Michel Tournier, "Le vol du vampire", 1981) were NOT reproduced — both
-- are full copyrighted argumentative essays. The original "Jeunes
-- footballeurs africains" text composed for the previous migration
-- (1ere-c-francais-resume-argumentatif-repondre-questions) is reused here
-- for continuity, and a second original short text is composed for the
-- evaluation, preserving the same teaching point.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-resume-argumentatif-situation-argumentation',
  '1ere',
  'C',
  'francais',
  $$Le résumé du texte argumentatif : identifier la situation d'argumentation$$,
  13,
  '1ere-c-francais-resume-argumentatif-repondre-questions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ayant dégagé le thème du texte « Jeunes footballeurs africains : la ruée dangereuse » et expliqué certaines de ses expressions en contexte, les élèves de 1ère veulent maintenant identifier la situation d'argumentation complète du texte, avant de procéder à son résumé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les composantes de la situation d'argumentation$$,
        'body', $$Identifier la situation d'argumentation d'un texte consiste à dégager quatre éléments : le thème (le sujet général traité) ; la thèse de l'auteur (l'opinion, le point de vue qu'il défend sur ce thème) ; la structure du texte (les grandes étapes ou séquences du raisonnement, avec le rôle de chaque paragraphe) ; et la visée argumentative (le but poursuivi par l'auteur : convaincre, dénoncer, proposer une solution).$$,
        'highlights', array[$$situation d'argumentation = thème + thèse de l'auteur + structure + visée argumentative$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les quatre éléments à identifier pour dégager la situation d'argumentation d'un texte ?$$, 'solution', $$Le thème, la thèse de l'auteur, la structure du texte, et la visée argumentative.$$)
      ),
      jsonb_build_object(
        'heading', $$La thèse de l'auteur$$,
        'body', $$La thèse de l'auteur est distincte du thème : le thème indique de quoi parle le texte, tandis que la thèse indique ce que l'auteur affirme ou soutient à propos de ce thème — sa prise de position, son opinion propre, qui pourrait être contestée par d'autres points de vue.$$,
        'highlights', array[$$thème = de quoi parle le texte ; thèse = ce que l'auteur affirme à ce sujet$$]::text[],
        'example', jsonb_build_object('statement', $$Le thème du texte « Jeunes footballeurs africains : la ruée dangereuse » est l'exploitation des jeunes talents footballistiques africains. Quelle est la thèse de l'auteur sur ce thème ?$$, 'solution', $$L'auteur soutient que cette exploitation est le fruit d'un système d'intermédiaires malhonnêtes profitant du manque de structures locales, et qu'une régulation et des investissements sont nécessaires pour y remédier.$$),
        'fixation', jsonb_build_object('question', $$En quoi la thèse de l'auteur diffère-t-elle du thème du texte ?$$, 'solution', $$Le thème est le sujet général et neutre du texte ; la thèse est la prise de position personnelle de l'auteur sur ce sujet, qui engage son point de vue.$$)
      ),
      jsonb_build_object(
        'heading', $$Dégager la structure fine du texte$$,
        'body', $$Pour dégager la structure d'un texte argumentatif de façon précise, on peut attribuer un titre synthétique à chaque paragraphe, qui résume son rôle dans l'argumentation. En regroupant ensuite les paragraphes dont les titres partagent une même fonction (présenter, développer, conclure), on obtient les grandes séquences du texte.$$,
        'highlights', array[$$titrer chaque paragraphe → regrouper les titres proches en grandes séquences$$]::text[],
        'example', jsonb_build_object('statement', $$Donne un titre au premier paragraphe du texte « Jeunes footballeurs africains », qui présente le phénomène du rêve d'une carrière européenne alimenté par de faux agents.$$, 'solution', $$Titre possible : « Le rêve d'une carrière européenne exploité par de faux agents ».$$),
        'fixation', jsonb_build_object('question', $$À quoi sert de donner un titre synthétique à chaque paragraphe d'un texte argumentatif ?$$, 'solution', $$Cela permet de dégager précisément le rôle de chaque paragraphe dans l'argumentation, puis de regrouper les paragraphes en grandes séquences pour obtenir la structure globale du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Application complète : la situation d'argumentation$$,
        'body', $$Pour le texte « Jeunes footballeurs africains : la ruée dangereuse » (6 paragraphes) : Thème — l'exploitation des jeunes talents footballistiques africains. Thèse — cette exploitation résulte d'un système d'intermédiaires sans scrupules profitant du manque de structures locales, qu'il faut réguler. Structure — Paragraphe 1 (le rêve exploité par de faux agents), Paragraphe 2 (le prix payé par les familles et le drame de l'enfant livré à lui-même), Paragraphe 3 (les vrais bénéficiaires : les réseaux d'intermédiaires), Paragraphe 4 (le paradoxe : un talent réel mais mal exploité, faute d'infrastructures), Paragraphe 5 (les conséquences sur le football local), Paragraphe 6 (l'appel à la régulation et à l'investissement). On peut regrouper ces paragraphes en trois séquences : Séquence 1 (P1-3) présentation du phénomène et de son mécanisme ; Séquence 2 (P4-5) analyse du paradoxe et de ses conséquences ; Séquence 3 (P6) appel à l'action. Visée argumentative — dénoncer cette exploitation et appeler à des solutions concrètes.$$,
        'highlights', array[$$3 séquences : présentation du phénomène (P1-3) → analyse du paradoxe et conséquences (P4-5) → appel à l'action (P6)$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans quelle séquence du texte se trouve le paragraphe qui analyse les conséquences de l'exode des jeunes talents sur le football local ?$$, 'solution', $$Dans la deuxième séquence (paragraphes 4-5), consacrée à l'analyse du paradoxe et de ses conséquences.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un nouveau texte à analyser, intitulé « Internet et lecture des jeunes : une révolution silencieuse » : « Internet a profondément transformé l'accès à la lecture pour les jeunes générations, y compris en Afrique. Autrefois limités aux bibliothèques et aux livres physiques, souvent rares et coûteux, les jeunes lisent désormais sur leurs téléphones et tablettes, à toute heure et en tout lieu. Cette révolution a incontestablement démocratisé l'accès à la lecture : des milliers d'ouvrages, d'articles et de blogs, souvent gratuits, sont désormais accessibles en quelques clics, là où un livre physique restait hors de portée de nombreuses familles. Mais cette abondance soudaine a aussi transformé la manière même de lire : les jeunes lecteurs naviguent d'un contenu court à un autre, papillonnant entre notifications et articles brefs, au détriment d'une lecture longue et concentrée. Il serait pourtant réducteur de rejeter cette évolution en bloc. Il revient plutôt aux familles et aux enseignants d'accompagner les jeunes lecteurs, en leur apprenant à naviguer avec discernement dans cet océan de contenus, pour que la révolution numérique de la lecture devienne une chance plutôt qu'une perte. »$$,
      'questions', array[
        $$Dégage le thème et la thèse de l'auteur pour ce texte.$$,
        $$Attribue un titre synthétique à chacun des quatre paragraphes de ce texte.$$,
        $$Regroupe ces paragraphes en grandes séquences, puis formule la visée argumentative du texte.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que désigne la « thèse de l'auteur » dans un texte argumentatif ?$$,
      'hint', $$Elle diffère du simple thème traité.$$,
      'expected', $$L'opinion ou le point de vue précis que l'auteur défend à propos du thème traité — sa prise de position personnelle.$$
    ),
    jsonb_build_object(
      'question', $$Comment procède-t-on pour dégager finement la structure d'un texte argumentatif ?$$,
      'hint', $$Cela commence au niveau de chaque paragraphe.$$,
      'expected', $$On attribue un titre synthétique à chaque paragraphe, résumant son rôle, puis on regroupe les paragraphes aux fonctions proches en grandes séquences.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les quatre éléments composant la situation d'argumentation d'un texte ?$$,
      'hint', $$Ils couvrent le sujet, l'opinion, l'organisation et le but.$$,
      'expected', $$Le thème, la thèse de l'auteur, la structure du texte, et la visée argumentative.$$
    ),
    jsonb_build_object(
      'question', $$Dans le texte « Jeunes footballeurs africains », à quelle séquence appartient le paragraphe présentant les vrais bénéficiaires du système (les réseaux d'intermédiaires) ?$$,
      'hint', $$C'est encore la présentation du phénomène, pas encore l'analyse des conséquences.$$,
      'expected', $$À la première séquence (paragraphes 1 à 3), consacrée à la présentation du phénomène et de son mécanisme.$$
    )
  ),
  now()
);
