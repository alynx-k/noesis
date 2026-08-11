-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3742: "SF 1: La prise de notes 1 et 2"
-- (https://lyc.ecole-ci.org/course/view.php?id=3742)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "13 et 14 SF la prise de notes 1 et 2.pdf" (7 pages, Leçon 2 (savoir-
-- faire) : les techniques de communication, séance 1 : la prise de notes à
-- partir d'un énoncé oral, séance 2 : la prise de notes à partir d'un
-- énoncé écrit).
-- Rewritten/paraphrased from the source PDF: the definition of note-
-- taking, the grammatical/lexical techniques (nominalisation, abréviations
-- courantes, symboles scientifiques et mathématiques, lettres grecques,
-- mots tronqués, abréviation des points cardinaux), and the source's own
-- worked examples (Napoléon/censure de la presse, Côte d'Ivoire/PPTE).
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-sf1-prise-de-notes',
  '2nde',
  'A',
  'francais',
  $$Savoir-faire : la prise de notes$$,
  12,
  '2nde-a-fr-pl12-implicite',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La mairie de la localité recrute, pour la période des vacances, de jeunes garçons et filles pour être chargés de communication. Pour être retenus, ces derniers devront savoir utiliser un document écrit et connaître les techniques de communication. En vue de se donner des chances de réussir à ce concours, les élèves de seconde A s'organisent pour se former à l'utilisation d'un document écrit ou oral, ainsi qu'aux techniques de prise de notes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la prise de notes ?$$,
        'body', $$La prise de notes à partir d'un énoncé oral est une activité qui consiste à garder une trace écrite d'une intervention, d'un cours ou d'une conférence, afin de noter rapidement les informations nécessaires de façon claire et concise. La prise de notes à partir d'un énoncé écrit, elle, consiste à retenir par écrit l'essentiel d'un texte, d'une œuvre ou de tout autre document écrit.$$,
        'highlights', array[$$prise de notes$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le but principal de la prise de notes ?$$, 'solution', $$Garder rapidement une trace écrite, claire et concise, des informations nécessaires d'un énoncé oral ou écrit.$$)
      ),
      jsonb_build_object(
        'heading', $$Utiliser les outils grammaticaux et les abréviations courantes$$,
        'body', $$Une première technique consiste à procéder à la nominalisation d'une proposition subordonnée relative ou complétive, ce qui permet de condenser une idée en un groupe nominal plus court. On peut aussi employer des abréviations courantes et conventionnelles, en supprimant parfois les voyelles.$$,
        'highlights', array[$$nominalisation$$, $$abréviations$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Abréviation$$, $$Signification$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Bcp$$, $$beaucoup$$),
            jsonb_build_array($$Càd$$, $$c'est-à-dire$$),
            jsonb_build_array($$Cf$$, $$se reporter à$$),
            jsonb_build_array($$déf$$, $$définition$$),
            jsonb_build_array($$pdt$$, $$pendant$$),
            jsonb_build_array($$cdlt$$, $$cordialement (voyelles supprimées)$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Comment noter rapidement le mot « cordialement » en supprimant ses voyelles ?$$, 'solution', $$« cdlt ».$$),
        'fixation', jsonb_build_object('question', $$Que permet la nominalisation d'une proposition subordonnée lors d'une prise de notes ?$$, 'solution', $$Elle permet de condenser une idée en un groupe nominal plus court.$$)
      ),
      jsonb_build_object(
        'heading', $$Utiliser des symboles scientifiques et des lettres grecques$$,
        'body', $$Les symboles scientifiques, notamment mathématiques, sont un excellent moyen de prise de notes rapide : par exemple 0 ou Ø pour « aucun, pas de », la flèche vers le haut (↑) pour « augmentation, croissance », le signe = pour « égal », ~ pour « équivalent », > pour « plus grand », ≥ pour « plus grand ou égal ». On peut également employer des lettres grecques comme symboles : α (alpha), β (bêta), π (pi), φ (phi) pour « philosophie », ψ (psi) pour « psychologie », θ (thêta) pour « théâtre ».$$,
        'highlights', array[$$symboles scientifiques$$, $$lettres grecques$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie le symbole ↑ dans une prise de notes ?$$, 'solution', $$Une augmentation ou une croissance.$$)
      ),
      jsonb_build_object(
        'heading', $$Employer des mots tronqués et l'abréviation des points cardinaux$$,
        'body', $$On peut aussi tronquer certains mots courants pour aller plus vite : « expo » pour exposition, « ciné » pour cinéma, « amphi » pour amphithéâtre, « info » pour information, « prépa » pour préparation, « fac » pour faculté, « Bac » pour baccalauréat, « resto » pour restaurant, « télé » pour télévision. Enfin, les points cardinaux se notent par leur seule initiale : N pour Nord, S pour Sud, O (ou W) pour Ouest, E pour Est.$$,
        'highlights', array[$$mots tronqués$$, $$points cardinaux$$]::text[],
        'example', jsonb_build_object('statement', $$Comment noter rapidement le mot « préparation » lors d'une prise de notes ?$$, 'solution', $$« prépa ».$$),
        'fixation', jsonb_build_object('question', $$Par quelle lettre note-t-on le point cardinal « Ouest » ?$$, 'solution', $$Par O (ou W).$$)
      ),
      jsonb_build_object(
        'heading', $$Appliquer la technique : condenser l'essentiel d'un message$$,
        'body', $$Prendre des notes efficacement, c'est enfin savoir réduire un développement entier à ses informations essentielles : une date, un fait, un acteur. Ainsi, un long developpement historique expliquant qu'un dirigeant a décidé de contrôler la presse en interdisant certains journaux peut se noter simplement par la date et l'action principale. De même, un texte annonçant qu'un pays a intégré un programme international en une année donnée peut se réduire à cette date suivie du sigle du programme.$$,
        'highlights', array[$$condensation$$, $$essentiel du message$$]::text[],
        'example', jsonb_build_object('statement', $$Comment noter, de façon condensée, un texte qui explique qu'en 2012 la Côte d'Ivoire a intégré le programme des Pays Pauvres Très Endettés ?$$, 'solution', $$« 2012, CI PPTE ».$$),
        'fixation', jsonb_build_object('question', $$Quelles informations doit-on prioriser lorsqu'on condense un message en prise de notes ?$$, 'solution', $$Les informations essentielles : dates, faits principaux, acteurs.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un cours d'histoire, le professeur explique longuement qu'en 1960, la Côte d'Ivoire a accédé à l'indépendance et que Félix Houphouët-Boigny en est devenu le premier président. Un élève doit prendre des notes rapides pour retenir l'essentiel de cette explication.$$,
      'questions', array[
        $$Propose une prise de notes condensée de cette explication, en utilisant une abréviation ou un symbole.$$,
        $$Quelle technique as-tu utilisée pour condenser l'information (nominalisation, abréviation, symbole, mot tronqué) ?$$,
        $$Pourquoi est-il important de savoir prendre des notes rapidement pendant un cours ou une conférence ?$$,
        $$Donne un exemple d'abréviation courante que tu pourrais utiliser pour noter le mot « cependant ».$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que signifie l'abréviation « Càd » ?$$,
      'hint', $$C'est une expression très utilisée à l'oral pour reformuler.$$,
      'expected', $$« C'est-à-dire ».$$
    ),
    jsonb_build_object(
      'question', $$Quel symbole peut représenter « aucun » ou « pas de » en prise de notes ?$$,
      'hint', $$Un chiffre ou une lettre barrée.$$,
      'expected', $$0 ou Ø.$$
    ),
    jsonb_build_object(
      'question', $$Comment note-t-on rapidement le mot « télévision » ?$$,
      'hint', $$Un mot tronqué très courant.$$,
      'expected', $$« télé ».$$
    ),
    jsonb_build_object(
      'question', $$Quelle lettre grecque symbolise souvent la « philosophie » en prise de notes ?$$,
      'hint', $$Elle ressemble à la lettre « phi ».$$,
      'expected', $$φ (phi).$$
    )
  ),
  now()
);
