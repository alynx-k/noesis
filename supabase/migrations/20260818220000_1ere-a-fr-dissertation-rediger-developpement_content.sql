-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1852: "EE 7: Dissert_littér_Rédiger_partie_dvpment"
-- (https://lyc.ecole-ci.org/course/view.php?id=1852), resource id 15686 —
-- "Séance 4 : rédiger une partie du développement" (Leçon 3 : la
-- dissertation littéraire). Explications méthodologiques réécrites à
-- partir du PDF source (composantes du paragraphe argumentatif, trois
-- types de raisonnement, formules d'insertion des exemples). Les
-- références d'œuvres et d'auteurs réels citées comme exemples sont des
-- faits bibliographiques réels, réutilisés comme dans les leçons
-- précédentes ; le paragraphe rédigé d'exemple est une composition
-- originale bâtie sur ces mêmes références factuelles.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-dissertation-rediger-developpement',
  '1ere',
  'A',
  'francais',
  $$La dissertation littéraire : rédiger le développement$$,
  7,
  '1ere-a-fr-dissertation-elaborer-plan',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir élaboré un plan détaillé pour leur sujet de dissertation, les élèves de 1ère A doivent maintenant transformer ce plan en un développement rédigé, en respectant la structure du paragraphe argumentatif et un raisonnement clair.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les composantes du paragraphe argumentatif$$,
        'body', $$Le développement est une succession de paragraphes argumentatifs, chacun signalé par la mise en page (alinéa). Chaque paragraphe doit comporter : une phrase présentant l'idée directrice (si l'on passe à une autre idée, il faut changer de paragraphe) ; les arguments qui développent cette idée, reliés par des connecteurs logiques (d'abord, aussi, ensuite, en outre, par ailleurs, enfin...) et qui lui donnent sa validité ; des exemples qui illustrent chaque argument et lui donnent une dimension concrète.$$,
        'highlights', array[$$idée directrice$$, $$arguments + connecteurs logiques$$, $$exemples concrets$$]::text[],
        'property', jsonb_build_object('label', $$Règle$$, 'text', $$Un changement d'idée directrice impose un changement de paragraphe.$$),
        'fixation', jsonb_build_object('question', $$Que doit-on faire quand on passe à une nouvelle idée directrice dans le développement ?$$, 'solution', $$Changer de paragraphe.$$)
      ),
      jsonb_build_object(
        'heading', $$Les trois types de raisonnement$$,
        'body', $$Un paragraphe peut être construit selon trois modes de raisonnement : le raisonnement déductif, qui part de l'idée directrice pour aller vers les arguments puis les exemples (idée → arguments → exemples) ; le raisonnement inductif, qui part au contraire des exemples pour remonter aux arguments puis à l'idée directrice (exemples → arguments → idée) ; et le raisonnement par analogie ou par confrontation, qui met en parallèle deux éléments par comparaison ou par opposition.$$,
        'highlights', array[$$déductif : idée → arguments → exemples$$, $$inductif : exemples → arguments → idée$$, $$analogie/confrontation$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Raisonnement$$, $$Ordre$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Déductif$$, $$Idée directrice → arguments → exemples$$),
            jsonb_build_array($$Inductif$$, $$Exemples → arguments → idée directrice$$),
            jsonb_build_array($$Analogie / confrontation$$, $$Comparaison ou opposition entre deux éléments$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre le raisonnement déductif et le raisonnement inductif ?$$, 'solution', $$Le déductif part de l'idée générale pour aller vers les exemples ; l'inductif part des exemples concrets pour remonter à l'idée générale.$$)
      ),
      jsonb_build_object(
        'heading', $$Insérer un exemple avec des formules adaptées$$,
        'body', $$Pour intégrer un exemple de façon fluide dans un paragraphe, on utilise des formules de liaison telles que : « Ainsi... », « C'est ainsi que... », « L'exemple de... montre bien cela », « Qu'il suffise de rappeler... », « Ce fait est illustré par... », « Prenons le cas de... », « On peut songer à... ». Ces formules évitent de juxtaposer brutalement l'argument et l'exemple sans transition.$$,
        'highlights', array[$$formules de liaison pour un exemple$$]::text[],
        'example', jsonb_build_object('statement', $$Utilise la formule « On peut songer à... » pour introduire l'exemple de L'enfant noir de Camara Laye à l'appui de l'argument « la littérature transmet des connaissances sur le passé ».$$, 'solution', $$La littérature permet aussi de transmettre des connaissances sur le passé. On peut songer à L'enfant noir de Camara Laye, qui donne à voir la vie quotidienne en Afrique avant la colonisation.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi utiliser une formule de liaison avant de citer un exemple ?$$, 'solution', $$Pour éviter de juxtaposer brutalement l'argument et l'exemple, et assurer une transition fluide dans le paragraphe.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de paragraphe rédigé (raisonnement déductif)$$,
        'body', $$Voici un paragraphe construit selon un raisonnement déductif, pour l'argument « la littérature dénonce les rivalités et la démagogie politiques » : l'idée directrice ouvre le paragraphe, suivie des arguments, puis des exemples précis introduits par des formules de liaison.$$,
        'highlights', array[$$idée → arguments → exemples précis$$],
        'example', jsonb_build_object('statement', $$Rédige ce paragraphe en raisonnement déductif.$$, 'solution', $$La littérature dénonce aussi les rivalités politiques et la démagogie des hommes politiques. D'une part, elle expose les batailles que se livrent les hommes pour les postes de pouvoir : c'est ainsi que la pièce On se chamaille pour un siège de Hyacinthe Kacou met en scène deux adversaires prêts à tout pour obtenir un poste de député. D'autre part, elle dévoile le mensonge politique dont usent certains dirigeants pour s'attirer les faveurs du peuple. On peut songer à ce propos au recueil Tribaliques d'Henri Lopès, où de fausses promesses sont faites aux populations par des hommes politiques démagogues.$$),
        'fixation', jsonb_build_object('question', $$Dans le paragraphe ci-dessus, à quoi correspond la phrase « La littérature dénonce aussi les rivalités politiques et la démagogie des hommes politiques » ?$$, 'solution', $$C'est l'idée directrice du paragraphe, énoncée en première phrase, conformément au raisonnement déductif.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit rédiger un paragraphe pour l'argument « la lecture permet au lecteur de découvrir des cultures différentes de la sienne », en s'appuyant sur une œuvre de son choix (par exemple Le monde s'effondre de Chinua Achebe, qui décrit la culture Ibo au Nigeria).$$,
      'questions', array[
        $$Rédige ce paragraphe en raisonnement déductif (idée directrice, puis argument, puis exemple).$$,
        $$Utilise au moins une formule de liaison vue dans ce cours pour introduire l'exemple.$$,
        $$Réécris le même paragraphe en raisonnement inductif (en partant de l'exemple pour remonter à l'idée directrice).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que doit contenir obligatoirement un paragraphe argumentatif de dissertation ?$$,
      'hint', $$Trois éléments : une phrase, des justifications, et des illustrations.$$,
      'expected', $$Une idée directrice, des arguments (reliés par des connecteurs logiques), et des exemples qui les illustrent.$$
    ),
    jsonb_build_object(
      'question', $$Dans quel ordre se présentent les éléments d'un paragraphe en raisonnement inductif ?$$,
      'hint', $$C'est l'inverse du raisonnement déductif.$$,
      'expected', $$Exemples, puis arguments, puis idée directrice.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux connecteurs logiques utiles pour relier les arguments d'un paragraphe.$$,
      'hint', $$Ils marquent l'ajout ou l'enchaînement d'idées.$$,
      'expected', $$Par exemple « d'abord » et « ensuite » (également valables : « en outre », « par ailleurs », « enfin »).$$
    ),
    jsonb_build_object(
      'question', $$Cite une formule utile pour introduire un exemple dans un paragraphe.$$,
      'hint', $$Elle sert à annoncer une illustration concrète.$$,
      'expected', $$Par exemple « On peut songer à... » (également valables : « Ainsi... », « Prenons le cas de... », « Ce fait est illustré par... »).$$
    )
  ),
  now()
);
