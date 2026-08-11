-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=163 ("Etude de l'œuvre intégrale").
-- Moodle course id 3739: "EOI 1: Roman_LD_1"
-- (https://lyc.ecole-ci.org/course/view.php?id=3739)
-- Resource "Je lis le résumé de la leçon", mod_resource id 38042,
-- redirecting to pluginfile "2nde_EOI_Roman_LD_1.pdf" (11 pages): étude de
-- l'œuvre intégrale "Petit Bodiel" d'Amadou Hampâté Bâ (éd. NEI, 1993),
-- axe d'étude : le récit de l'initiation ratée du personnage de Petit
-- Bodiel, séance de lecture dirigée n°2/3 sur les fragments 1 à 3
-- (pp. 12-18).
-- Rewritten/paraphrased from the source PDF: the presentation of the work
-- and its study focus, the five-step method of "lecture dirigée" applied
-- in the document (situer le fragment, dégager le fil conducteur,
-- construire le sens par l'étude du champ lexical/des verbes/de la
-- modalité, tirer un bilan partiel), and a general, non-verbatim summary
-- of the studied episode (Petit Bodiel's initiation by the old anteater
-- Yendou and his encounter with the King of the spirits, which grants him
-- trickery powers). No excerpt of the novel's actual text (quoted at
-- length in the source PDF) is reproduced here; all narrative content is
-- an original paraphrase.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-eoi1-petit-bodiel-lecture-dirigee',
  '2nde',
  'A',
  'francais',
  $$Étude de l'œuvre intégrale : « Petit Bodiel » — la lecture dirigée$$,
  15,
  '2nde-a-fr-gt-enonciation-indices-grammaticaux',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Désireux d'enrichir leur culture littéraire en vue de participer au Festival du Livre et des Arts du Denguélé (FESTILAD), organisé par l'ONG CILAD (Les Citoyens du Lire et des Arts du Denguélé), les élèves de la classe de seconde A du Lycée Moderne 1 Odienné étudient l'œuvre narrative intitulée « Petit Bodiel » d'Amadou Hampâté Bâ, parue aux Éditions NEI en 1993, inscrite à leur programme de lecture. Ils s'organisent pour enrichir leur connaissance du genre en prose, introduire l'étude de l'œuvre, en construire le sens et en faire le bilan, à travers la méthode de la lecture dirigée.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Présenter l'œuvre étudiée$$,
        'body', $$« Petit Bodiel », d'Amadou Hampâté Bâ, est un récit narratif publié aux Éditions NEI en 1993. L'axe d'étude retenu par la classe est le récit de l'initiation ratée du personnage principal : bien que Petit Bodiel semble sortir grandi de son parcours initiatique, cette réussite apparente cache en réalité un détournement des valeurs authentiques que l'initiation est censée transmettre.$$,
        'highlights', array[$$Petit Bodiel$$, $$Amadou Hampâté Bâ$$, $$initiation ratée$$]::text[],
        'fixation', jsonb_build_object('question', $$Qui est l'auteur de « Petit Bodiel » et en quelle année l'œuvre a-t-elle été publiée ?$$, 'solution', $$Amadou Hampâté Bâ, publié aux Éditions NEI en 1993.$$)
      ),
      jsonb_build_object(
        'heading', $$La méthode de la lecture dirigée$$,
        'body', $$Étudier une œuvre intégrale par lecture dirigée suppose de suivre une démarche précise sur chaque extrait retenu. On situe d'abord le fragment dans l'œuvre (à quel moment de l'histoire il se place, quels personnages y interviennent), puis on dégage son fil conducteur, c'est-à-dire l'idée qui porte l'ensemble du passage. On construit ensuite le sens du texte en étudiant les procédés d'écriture (le champ lexical dominant, le choix des verbes et des temps, la modalité du discours), avant de tirer un bilan partiel qui résume ce que le fragment apporte à la compréhension globale de l'œuvre.$$,
        'highlights', array[$$lecture dirigée$$, $$fil conducteur$$, $$bilan partiel$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Ce qu'elle apporte$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Situer le fragment$$, $$Replace l'extrait dans la chronologie et les personnages de l'œuvre$$),
            jsonb_build_array($$Dégager le fil conducteur$$, $$Identifie l'idée directrice du passage$$),
            jsonb_build_array($$Construire le sens$$, $$Étudie le champ lexical, les verbes, la modalité du discours$$),
            jsonb_build_array($$Tirer un bilan partiel$$, $$Résume l'apport du fragment à la compréhension de l'œuvre$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Que permet de dégager la deuxième étape de la lecture dirigée ?$$, 'solution', $$Le fil conducteur, c'est-à-dire l'idée qui porte l'ensemble du fragment étudié.$$)
      ),
      jsonb_build_object(
        'heading', $$Résumer l'épisode étudié$$,
        'body', $$Dans les fragments étudiés en classe, Petit Bodiel reçoit l'enseignement d'un vieil initié, Yendou l'Oryctérope, réputé pour son savoir occulte. Sur les conseils de son maître, Petit Bodiel observe le roi des esprits se baigner et en profite pour tremper dans la rivière un gris-gris protecteur, ce qui le rend soudain invulnérable et extraordinairement rusé. Sa transformation stupéfie sa propre mère : l'enfant négligent et mal élevé qu'elle connaissait se comporte désormais comme un personnage aux qualités hors du commun, au point d'être reconnu comme un « maître des ruses ».$$,
        'highlights', array[$$initiation$$, $$gris-gris$$, $$métamorphose$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la mère de Petit Bodiel est-elle si surprise par le comportement de son fils ?$$, 'solution', $$Parce que sa transformation est soudaine et radicale : d'un enfant aux défauts marqués, il devient un personnage aux qualités et aux pouvoirs extraordinaires.$$),
        'fixation', jsonb_build_object('question', $$Grâce à quel objet Petit Bodiel obtient-il des pouvoirs extraordinaires ?$$, 'solution', $$Grâce à un gris-gris protecteur qu'il trempe dans la rivière où se baigne le roi des esprits.$$)
      ),
      jsonb_build_object(
        'heading', $$Comprendre pourquoi l'initiation est jugée « ratée »$$,
        'body', $$Malgré une réussite apparente, l'initiation de Petit Bodiel est qualifiée de « ratée » par l'axe d'étude retenu, car le personnage n'acquiert pas ses nouvelles qualités par l'effort, le travail ou la sagesse, mais par un raccourci magique et par la ruse. L'œuvre invite ainsi le lecteur à s'interroger sur la valeur réelle d'un pouvoir obtenu sans mérite véritable.$$,
        'highlights', array[$$initiation ratée$$, $$mérite$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi peut-on dire que l'initiation de Petit Bodiel est « ratée » malgré son succès apparent ?$$, 'solution', $$Parce que ses nouvelles qualités ne sont pas le fruit du mérite, du travail ou de la sagesse, mais d'un raccourci magique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit présenter à ses camarades le fragment étudié en classe sur la transformation de Petit Bodiel, en suivant la méthode de la lecture dirigée.$$,
      'questions', array[
        $$Présente l'œuvre « Petit Bodiel » : son auteur, sa date de publication et son axe d'étude.$$,
        $$Rappelle les quatre étapes de la méthode de la lecture dirigée.$$,
        $$Résume, avec tes propres mots, la transformation vécue par Petit Bodiel.$$,
        $$Explique pourquoi cette initiation, bien que réussie en apparence, est qualifiée de « ratée ».$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qui est l'auteur de « Petit Bodiel » ?$$,
      'hint', $$Un grand écrivain et penseur ouest-africain.$$,
      'expected', $$Amadou Hampâté Bâ.$$
    ),
    jsonb_build_object(
      'question', $$Quel est l'axe d'étude retenu pour l'œuvre « Petit Bodiel » ?$$,
      'hint', $$Il concerne le parcours du personnage principal.$$,
      'expected', $$Le récit de l'initiation ratée du personnage de Petit Bodiel.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la première étape de la méthode de la lecture dirigée ?$$,
      'hint', $$Elle replace le passage dans son contexte.$$,
      'expected', $$Situer le fragment dans l'œuvre.$$
    ),
    jsonb_build_object(
      'question', $$Qui initie Petit Bodiel dans l'épisode étudié ?$$,
      'hint', $$Un vieil animal réputé pour son savoir occulte.$$,
      'expected', $$Yendou l'Oryctérope.$$
    )
  ),
  now()
);
