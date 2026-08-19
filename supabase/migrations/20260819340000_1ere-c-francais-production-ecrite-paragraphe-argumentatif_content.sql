-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2329: "EE 10: Prdtion-écrite_Rédiger_paragr_argument"
-- (https://lyc.ecole-ci.org/course/view.php?id=2329), resource id 21354.
-- Content is methodological, illustrated with the real Alphonse Boolamou
-- de Ligouri and Michel Tournier prompts and factual examples (football,
-- published academic journals), used for pedagogical analysis — not
-- reproduction of a creative narrative work.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-production-ecrite-paragraphe-argumentatif',
  '1ere',
  'C',
  'francais',
  $$La production écrite : rédiger un paragraphe argumentatif$$,
  10,
  '1ere-c-francais-production-ecrite-analyser-rechercher',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ayant analysé le sujet et recherché les idées sur l'assertion « S'il y a un domaine dans lequel l'Afrique a vite réduit l'écart de son retard par rapport aux autres continents, notamment l'Europe, c'est bien dans celui du football » (Alphonse Boolamou de Ligouri), les élèves de 1ère doivent maintenant rédiger entièrement un paragraphe argumentatif du développement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les composantes du paragraphe argumentatif$$,
        'body', $$Le développement de la production écrite est constitué d'au moins trois paragraphes argumentatifs. Un paragraphe argumentatif est composé de trois éléments : l'exposition de l'argument, son explication, et l'exemple d'illustration. Le premier paragraphe du développement est précédé d'une phrase d'introduction. Comme tous les autres, il se termine par une conclusion partielle, qui comprend le bilan partiel de l'idée développée et l'annonce du paragraphe suivant.$$,
        'highlights', array[$$paragraphe argumentatif = argument + explication + exemple d'illustration$$, $$au moins 3 paragraphes dans le développement ; chacun se termine par une conclusion partielle (bilan + annonce du suivant)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois éléments composant un paragraphe argumentatif dans une production écrite ?$$, 'solution', $$L'exposition de l'argument, son explication, et un exemple d'illustration.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de rédaction d'un paragraphe$$,
        'body', $$Un paragraphe bien construit énonce d'abord l'argument, l'explique avec un connecteur comme « en effet », puis l'illustre par un exemple précis introduit par une formule comme « c'est le cas de... ».$$,
        'highlights', array[$$formule d'explication : « en effet »$$, $$formule d'exemple : « c'est le cas de... »$$]::text[],
        'example', jsonb_build_object('statement', $$Voici un paragraphe rédigé sur le sujet du football africain : « Les vedettes du football africain sont des catalyseurs du rayonnement de leur pays. En effet, des pays africains sont honorés et connus sur l'échiquier mondial. Ces pays ont un regain de notoriété grâce aux vedettes du football qui en sont originaires. Ils en constituent de vrais ambassadeurs. C'est le cas de Didier Drogba, dont le talent a fait connaître la Côte d'Ivoire à travers le monde au même titre que les autres pays européens. » Identifie les trois composantes de ce paragraphe.$$, 'solution', $$Argument : « Les vedettes du football africain sont des catalyseurs du rayonnement de leur pays. » Explication : « En effet, des pays africains sont honorés et connus sur l'échiquier mondial... Ils en constituent de vrais ambassadeurs. » Exemple : « C'est le cas de Didier Drogba, dont le talent a fait connaître la Côte d'Ivoire à travers le monde. »$$),
        'fixation', jsonb_build_object('question', $$Quelle formule permet d'introduire l'exemple d'illustration dans un paragraphe argumentatif ?$$, 'solution', $$« C'est le cas de... » (ou d'autres formules équivalentes comme « nous en voulons pour preuve... »).$$)
      ),
      jsonb_build_object(
        'heading', $$Application : rédiger un paragraphe pour réfuter une opinion$$,
        'body', $$Pour le sujet « Réfutez la pensée de Michel Tournier selon laquelle pour certains écrivains le lecteur n'apparaît nullement comme le destinataire obligé de leur écrit », un premier paragraphe peut développer l'argument selon lequel certains livres visent un public érudit précis.$$,
        'highlights', array[$$un paragraphe = une seule idée développée en profondeur$$]::text[],
        'example', jsonb_build_object('statement', $$Voici le paragraphe rédigé : « Certains livres sont destinés essentiellement à un public érudit, notamment aux savants et aux chercheurs dans les domaines de la science, de l'histoire, de la littérature, de la physique, des religions. Cette catégorie de production est caractérisée par un niveau de langue soutenu et un contenu réservé à des spécialistes. Nous en voulons pour preuve les thèses, ou des revues scientifiques dont le contenu s'adresse exclusivement aux chercheurs et met l'accent sur les avancées technologiques. » Identifie les trois composantes.$$, 'solution', $$Argument : « Certains livres sont destinés essentiellement à un public érudit... » Explication : « Cette catégorie de production est caractérisée par un niveau de langue soutenu et un contenu réservé à des spécialistes. » Exemple : « Nous en voulons pour preuve les thèses, ou des revues scientifiques dont le contenu s'adresse exclusivement aux chercheurs... »$$),
        'fixation', jsonb_build_object('question', $$Que doit contenir la conclusion partielle qui termine chaque paragraphe argumentatif ?$$, 'solution', $$Un bilan partiel de l'idée développée dans ce paragraphe, et l'annonce du paragraphe suivant.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le sujet : « L'accès généralisé à internet a considérablement transformé les habitudes de lecture des jeunes africains. » (vu dans la leçon précédente), avec l'argument suivant à développer : « Internet favorise l'accès à des contenus variés et gratuits, ce qui diversifie les habitudes de lecture des jeunes. »$$,
      'questions', array[
        $$Rédige la phrase d'exposition de cet argument.$$,
        $$Rédige l'explication de cet argument, en utilisant le connecteur « en effet ».$$,
        $$Rédige un exemple d'illustration précis, introduit par une formule appropriée (« c'est le cas de... » ou équivalent), puis une conclusion partielle qui fait le bilan de ce paragraphe et annonce un paragraphe suivant portant sur un risque ou une limite de cette évolution.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de paragraphes argumentatifs au minimum doit comporter le développement d'une production écrite ?$$,
      'hint', $$C'est précisé explicitement dans la méthodologie.$$,
      'expected', $$Au moins trois paragraphes argumentatifs.$$
    ),
    jsonb_build_object(
      'question', $$Quel élément précède le premier paragraphe argumentatif du développement ?$$,
      'hint', $$Il assure la transition depuis l'introduction du devoir.$$,
      'expected', $$Une phrase d'introduction.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les trois composantes obligatoires d'un paragraphe argumentatif ?$$,
      'hint', $$Elles vont de l'idée générale à l'illustration concrète.$$,
      'expected', $$L'exposition de l'argument, son explication, et l'exemple d'illustration.$$
    ),
    jsonb_build_object(
      'question', $$Que doit annoncer la conclusion partielle d'un paragraphe argumentatif ?$$,
      'hint', $$Elle assure la cohérence avec la suite du développement.$$,
      'expected', $$Le paragraphe suivant, après avoir fait le bilan partiel de l'idée qui vient d'être développée.$$
    )
  ),
  now()
);
