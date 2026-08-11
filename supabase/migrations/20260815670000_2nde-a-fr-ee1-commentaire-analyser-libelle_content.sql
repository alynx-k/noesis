-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3228: "EE 1: Com_Composé Analyser_libellé_construire_sens"
-- (https://lyc.ecole-ci.org/course/view.php?id=3228)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Com_Composé_S1_Analyser_libellé_construire_sens.pdf" (5 pages,
-- Leçon 2 : le commentaire composé, séance 1 : analyser le libellé et
-- construire le sens du texte). Support text: Victor Hugo, "Veni, Vidi,
-- Vixi" (not reproduced here).
-- Rewritten/paraphrased from the source PDF: the généralités on the
-- commentaire composé exam exercise, the components of a libellé (centres
-- d'intérêt), and the five-step method to analyse the libellé and
-- construct the meaning of a text (lecture, identification des centres
-- d'intérêt, observation du paratexte et des caractéristiques globales,
-- analyse minutieuse par balayages successifs). 100% original wording; no
-- sentence, and no line of the Victor Hugo poem, copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee1-commentaire-analyser-libelle',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le commentaire composé — analyser le libellé$$,
  18,
  '2nde-a-fr-eoi3-petit-bodiel-bilan-critique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours de leurs recherches à la bibliothèque, des élèves de la classe de seconde A du Lycée Moderne X découvrent, dans un ouvrage, un sujet de commentaire composé. Curieux de comprendre le fonctionnement de cet exercice, ils s'organisent pour analyser le libellé, identifier les centres d'intérêt, rechercher et organiser les idées en vue de rédiger l'introduction et un centre d'intérêt.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Généralités sur le commentaire composé$$,
        'body', $$L'épreuve du commentaire composé porte sur un texte en prose ou en vers, choisi en raison de sa qualité littéraire. Le candidat est invité à rendre compte de la lecture personnelle qu'il en fait : l'analyse consiste donc à montrer les qualités stylistiques et les richesses thématiques du texte, dans un développement rigoureux et bien argumenté.$$,
        'highlights', array[$$commentaire composé$$, $$qualités stylistiques$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quel type de texte porte l'épreuve du commentaire composé ?$$, 'solution', $$Sur un texte en prose ou en vers, choisi pour sa qualité littéraire.$$)
      ),
      jsonb_build_object(
        'heading', $$Le libellé et les centres d'intérêt$$,
        'body', $$Le libellé du sujet peut suggérer plusieurs points de départ pour une lecture efficace et pertinente : il attire l'attention du candidat sur des éléments de structure dont l'examen permet de mieux saisir la signification essentielle du texte. Ces indications ne sont ni exhaustives ni contraignantes. Généralement, les indications du libellé portent sur deux ou trois points, appelés les centres d'intérêt du texte.$$,
        'highlights', array[$$libellé$$, $$centres d'intérêt$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on les points suggérés par le libellé, sur lesquels s'appuie l'analyse ?$$, 'solution', $$Les centres d'intérêt du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$La démarche pour analyser le libellé et construire le sens du texte$$,
        'body', $$Pour analyser le libellé et construire le sens du texte, il faut suivre plusieurs étapes : lire entièrement et attentivement le libellé et le texte ; identifier les centres d'intérêt donnés dans le libellé ; observer le paratexte (l'auteur, les références du texte, le contexte historique et littéraire) ; observer les caractéristiques globales du texte (son genre, son type, sa progression) ; puis analyser minutieusement le texte en procédant à des balayages successifs (étude du lexique, de la syntaxe, de la rhétorique, du rythme et des sonorités), en relevant les indices textuels pertinents et en étudiant les effets de sens de ces indices.$$,
        'highlights', array[$$paratexte$$, $$balayages successifs$$, $$indices textuels$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Ce qu'elle consiste à faire$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$1. Lecture$$, $$Lire entièrement et attentivement le libellé et le texte$$),
            jsonb_build_array($$2. Centres d'intérêt$$, $$Identifier les centres d'intérêt donnés dans le libellé$$),
            jsonb_build_array($$3. Paratexte$$, $$Observer l'auteur, les références, le contexte historique et littéraire$$),
            jsonb_build_array($$4. Caractéristiques globales$$, $$Observer le genre, le type et la progression du texte$$),
            jsonb_build_array($$5. Analyse minutieuse$$, $$Étudier le lexique, la syntaxe, la rhétorique, le rythme et les sonorités$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Que faut-il observer lors de l'étape consacrée au paratexte ?$$, 'solution', $$L'auteur, les références du texte, ainsi que le contexte historique et littéraire.$$)
      ),
      jsonb_build_object(
        'heading', $$Construire un centre d'intérêt : indices, analyse, interprétation$$,
        'body', $$Pour construire un centre d'intérêt, on procède en trois temps : on relève d'abord les indices textuels qui s'y rapportent (mots, expressions, procédés d'écriture) ; on les analyse ensuite en identifiant le champ lexical ou le procédé grammatical qu'ils forment ; on en propose enfin une interprétation, c'est-à-dire ce que ces indices révèlent sur le sens du texte, par exemple un sentiment du locuteur ou une intention de l'auteur.$$,
        'highlights', array[$$indices textuels$$, $$interprétation$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un texte où reviennent des mots comme « morne », « ennui » et « peine », quel centre d'intérêt ces indices pourraient-ils construire ?$$, 'solution', $$Un centre d'intérêt autour d'un sentiment de tristesse ou d'amertume, puisque ces mots appartiennent à un même champ lexical de la souffrance morale.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois étapes pour construire un centre d'intérêt ?$$, 'solution', $$Relever les indices textuels, les analyser (champ lexical, procédé), puis en proposer une interprétation.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit préparer un commentaire composé sur un texte dont le libellé suggère deux centres d'intérêt : la solitude du personnage principal et l'espoir malgré les difficultés.$$,
      'questions', array[
        $$Rappelle les cinq étapes de la démarche pour analyser un libellé et construire le sens d'un texte.$$,
        $$Explique ce qu'il faut observer lors de l'étude du paratexte.$$,
        $$Pour le centre d'intérêt « la solitude du personnage », quels types d'indices textuels pourrait-on rechercher ?$$,
        $$Explique la différence entre relever un indice textuel et l'interpréter.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Sur quoi porte l'épreuve du commentaire composé ?$$,
      'hint', $$Un texte choisi pour sa valeur littéraire.$$,
      'expected', $$Sur un texte en prose ou en vers, choisi pour sa qualité littéraire.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on les points suggérés par le libellé ?$$,
      'hint', $$Ils orientent la lecture du texte.$$,
      'expected', $$Les centres d'intérêt.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il faire avant même d'analyser le texte en détail ?$$,
      'hint', $$Une étape de lecture globale.$$,
      'expected', $$Lire entièrement et attentivement le libellé et le texte.$$
    ),
    jsonb_build_object(
      'question', $$Que désigne-t-on par « balayages successifs » dans la méthode du commentaire composé ?$$,
      'hint', $$Plusieurs relectures ciblées.$$,
      'expected', $$L'étude successive du lexique, de la syntaxe, de la rhétorique, du rythme et des sonorités du texte.$$
    )
  ),
  now()
);
