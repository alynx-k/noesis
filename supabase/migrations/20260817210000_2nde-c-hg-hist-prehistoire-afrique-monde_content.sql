-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Histoire-Géographie, categoryid=114. Moodle course id 3651: "2nde H4- La
-- préhistoire en Afrique et dans le reste du monde"
-- (https://lyc.ecole-ci.org/course/view.php?id=3651). Resource "Je lis le
-- résumé de la leçon", mod_resource id 37015, redirecting to pluginfile "2nde
-- H4- La préhistoire en Afrique et dans le reste du monde.pdf". Cross-checked
-- against the already-sourced Seconde A lesson for this exact same
-- title/filename (categoryid=102): identical PDF filename and, on page-1
-- inspection of the situation d'apprentissage, identical wording, confirming
-- this Histoire-Géographie lesson is common-trunk content shared by Seconde A
-- and Seconde C on this platform. Rewritten/paraphrased from the source PDF
-- (Thème 2, Leçon 1). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-hg-hist-prehistoire-afrique-monde',
  '2nde',
  'C',
  'histoire',
  $$La préhistoire en Afrique et dans le reste du monde$$,
  4,
  '2nde-c-hg-hist-methodologie-dissertation-commentaire',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une conférence organisée par le club d'histoire-géographie de son établissement, un intervenant affirme que « l'Afrique est le berceau de l'humanité » et que « l'homme actuel est le fruit d'une évolution des espèces débutée avec l'australopithèque ». Certains élèves contestent cette thèse. Pour trancher, une classe de seconde décide de mener des recherches sur les grandes périodes de la préhistoire et sur l'évolution de l'espèce humaine.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le paléolithique, l'âge de la pierre taillée$$,
        'body', $$La préhistoire, qui s'étend d'environ -7 000 000 d'années jusqu'à l'invention de l'écriture vers -3000, se divise en deux grandes périodes. Le paléolithique (du grec « ancienne pierre ») en constitue la première et la plus longue phase, de -7 millions d'années à -8000 ans, marquée par des outils de pierre grossiers et peu perfectionnés. On y distingue trois étapes : le paléolithique inférieur, avec des galets aménagés à l'état brut ; le paléolithique moyen, où apparaissent des outils plus travaillés comme les pointes et les pics ; et le paléolithique supérieur, marqué par des armes plus efficaces comme les flèches et les harpons. Pendant cette longue période, les hommes vivaient de chasse, de pêche et de cueillette, se déplaçaient sans cesse à la recherche de nourriture (ils étaient nomades), et la maîtrise du feu leur permit d'améliorer considérablement leurs conditions de vie.$$,
        'highlights', array[$$paléolithique$$, $$outils de pierre taillée$$, $$nomadisme$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le paléolithique, ou « âge de la pierre taillée », est la première et la plus longue période de la préhistoire (-7 millions d'années à -8000 ans), caractérisée par des outils de pierre grossiers et un mode de vie nomade fondé sur la chasse, la pêche et la cueillette.$$),
        'fixation', jsonb_build_object('question', $$Que signifie étymologiquement le mot « paléolithique » ?$$, 'solution', $$« Ancienne pierre » (du grec palaios, ancien, et lithos, pierre).$$)
      ),
      jsonb_build_object(
        'heading', $$Le néolithique, une période de révolutions$$,
        'body', $$Le néolithique, ou « âge de la pierre polie », constitue la dernière phase de la préhistoire, de -8000 ans jusqu'à l'invention de l'écriture vers -3000 (une date qui varie selon les régions : en Côte d'Ivoire, par exemple, cette période se prolonge jusque vers -1500 ans). Elle se caractérise par de véritables révolutions : les outils deviennent polis, plus légers et plus tranchants (faucilles, meules, haches polies) ; surtout, l'homme devient producteur grâce à l'agriculture et à l'élevage, qui lui assurent des réserves de nourriture bien plus fiables que la chasse et la cueillette. Cette transformation profonde de son mode de vie pousse l'homme à se sédentariser et à organiser une véritable vie en société, tandis que se développe aussi un art plus élaboré (céramique, peintures rupestres).$$,
        'highlights', array[$$néolithique$$, $$agriculture et élevage$$, $$sédentarisation$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi l'apparition de l'agriculture et de l'élevage a-t-elle poussé l'homme à se sédentariser ?$$, 'solution', $$Parce que ces activités nécessitent de rester sur place pour cultiver la terre et s'occuper des troupeaux, contrairement à la chasse et à la cueillette qui imposaient des déplacements constants.$$),
        'fixation', jsonb_build_object('question', $$Quelle période de transition marque la fin du paléolithique et annonce le néolithique ?$$, 'solution', $$Le mésolithique (environ -10 000 à -8000 ans).$$)
      ),
      jsonb_build_object(
        'heading', $$L'hominisation : les grandes étapes de l'évolution humaine$$,
        'body', $$L'apparition de l'homme, il y a environ 7 millions d'années, résulte d'un long processus d'évolution : les primates quadrupèdes qui le précédaient se sont progressivement redressés pour marcher sur deux pieds (bipédie). Cette hominisation s'est faite en plusieurs étapes successives, chacune marquée par une augmentation de la capacité crânienne et une amélioration des outils et du mode de vie, de l'australopithèque jusqu'à l'homme moderne.$$,
        'highlights', array[$$hominisation$$, $$bipédie$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Époque approximative$$, $$Caractéristique principale$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Australopithèque$$, $$-7 millions d'années$$, $$Marche debout, petite capacité crânienne (400 cm³), outils grossiers$$),
            jsonb_build_array($$Homo habilis$$, $$-3 millions d'années$$, $$« Homme habile », capacité crânienne de 600 cm³, maîtrise un langage simple$$),
            jsonb_build_array($$Homo erectus$$, $$-2 millions d'années$$, $$« Homme debout », manipule le feu, capacité crânienne de 950 cm³$$),
            jsonb_build_array($$Homo sapiens$$, $$-100 000 ans$$, $$« Homme sage », intelligence développée, capacité crânienne de 1700 cm³$$),
            jsonb_build_array($$Homo sapiens sapiens$$, $$-30 000 ans$$, $$Homme moderne, vie sociale organisée, pratique l'art$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle innovation technique majeure caractérise l'homo erectus ?$$, 'solution', $$La maîtrise du feu.$$)
      ),
      jsonb_build_object(
        'heading', $$L'Afrique, berceau de l'humanité$$,
        'body', $$C'est en Afrique, en particulier dans la région du rift à l'est du continent, que l'on a retrouvé les traces les plus anciennes de présence humaine, notamment sur le site d'Oldoway en Afrique orientale. D'autres découvertes majeures ont été faites ailleurs sur le continent : le squelette de « Lucy », emblématique de l'ancienneté du peuplement africain, ou plus récemment celui de « Toumaï », au Tchad, considéré comme l'un des plus anciens représentants connus de la lignée humaine. L'Afrique est ainsi le seul continent où l'on retrouve les traces de toutes les grandes phases de l'évolution humaine, ce qui en fait, selon les préhistoriens, le véritable berceau de l'humanité.$$,
        'highlights', array[$$Oldoway$$, $$Lucy$$, $$Toumaï$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi les préhistoriens considèrent-ils l'Afrique comme le « berceau de l'humanité » ?$$, 'solution', $$Parce que c'est sur ce continent que l'on retrouve les traces les plus anciennes de présence humaine et l'ensemble des grandes phases de l'évolution de l'homme.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un présentateur de documentaire affirme que « l'Afrique est le berceau de l'humanité » et que « l'homme actuel est le fruit d'une évolution des espèces débutée avec l'australopithèque ». Un élève de seconde doit expliquer et démontrer cette double affirmation à l'aide de ce qu'il sait de la préhistoire.$$,
      'questions', array[
        $$Distingue le paléolithique du néolithique par leurs outils et leur mode de vie.$$,
        $$Cite dans l'ordre les grandes étapes de l'hominisation, de l'australopithèque à l'homme moderne.$$,
        $$Explique pourquoi le passage à l'agriculture et à l'élevage a transformé le mode de vie humain au néolithique.$$,
        $$Donne deux exemples de découvertes archéologiques qui font de l'Afrique le berceau de l'humanité.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on la première et la plus longue période de la préhistoire, caractérisée par des outils de pierre taillée ?$$,
      'hint', $$Son nom vient du grec « ancienne pierre ».$$,
      'expected', $$Le paléolithique.$$
    ),
    jsonb_build_object(
      'question', $$Quelles deux activités nouvelles apparaissent au néolithique et permettent à l'homme de devenir producteur ?$$,
      'hint', $$L'une concerne les plantes, l'autre les animaux.$$,
      'expected', $$L'agriculture et l'élevage.$$
    ),
    jsonb_build_object(
      'question', $$Quel site d'Afrique orientale a livré les traces les plus anciennes de présence humaine ?$$,
      'hint', $$C'est un site situé en Tanzanie.$$,
      'expected', $$Oldoway.$$
    ),
    jsonb_build_object(
      'question', $$Quel nom porte le célèbre squelette découvert en Afrique qui témoigne de l'ancienneté du peuplement humain sur le continent ?$$,
      'hint', $$C'est un prénom féminin.$$,
      'expected', $$Lucy.$$
    )
  ),
  now()
);
