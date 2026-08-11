-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3215: "GT" (https://lyc.ecole-ci.org/course/view.php?id=3215)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31819,
-- redirecting to pluginfile "5 PL 2nde ENONCIATION les indices
-- grammaticaux (1).pdf" (5 pages, Leçon 4 : l'énonciation, séance 1 :
-- étudier les marques de l'énonciation / les indices grammaticaux). This
-- lesson complements PL6 ("les indices lexicaux") by covering the
-- grammatical markers of enunciation.
-- Rewritten/paraphrased from the source PDF: the grammatical indices
-- relating to the destinataire (pronoms, adjectifs possessifs, mode
-- impératif), punctuation as a marker of emotion, interjections,
-- modalisateurs, and distancing figures of style. 100% original wording;
-- no sentence, and no line of the Victor Hugo evaluation text, copied from
-- the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-gt-enonciation-indices-grammaticaux',
  '2nde',
  'A',
  'francais',
  $$L'énonciation : les indices grammaticaux$$,
  14,
  '2nde-a-fr-sf2-exposer-oral',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour renforcer leurs acquis en lecture et en production de textes, les élèves de seconde A relèvent de courts extraits qu'ils trouvent intéressants. Ils remarquent que la présence de l'énonciateur et de son destinataire dans un texte ne se révèle pas seulement par le vocabulaire employé, mais aussi par des marques grammaticales précises. Ils s'organisent pour identifier ces indices grammaticaux, les analyser et les utiliser judicieusement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les indices grammaticaux se rapportant à l'énonciateur et au destinataire$$,
        'body', $$Les indices de personne se rapportant à l'énonciateur (celui qui parle) sont les pronoms personnels sujets et compléments de la première personne (je, moi, nous), les pronoms possessifs (le mien, le nôtre...) et les adjectifs possessifs (mon, ma, mes, notre, nos). Les indices se rapportant au destinataire (celui à qui l'on parle) sont, de la même façon, les pronoms personnels de la deuxième personne (tu, toi, vous), les pronoms possessifs (le tien, la vôtre...), les adjectifs possessifs (ton, ta, tes, votre, vos), ainsi que le mode impératif, qui s'adresse directement au destinataire.$$,
        'highlights', array[$$énonciateur$$, $$destinataire$$, $$mode impératif$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Indices$$, $$Se rapportant à l'énonciateur$$, $$Se rapportant au destinataire$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Pronoms personnels$$, $$je, moi, nous$$, $$tu, toi, vous$$),
            jsonb_build_array($$Adjectifs possessifs$$, $$mon, ma, mes, notre, nos$$, $$ton, ta, tes, votre, vos$$),
            jsonb_build_array($$Autre marque$$, $$—$$, $$le mode impératif$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle marque grammaticale, propre au destinataire, n'existe pas du côté de l'énonciateur ?$$, 'solution', $$Le mode impératif, qui s'adresse directement au destinataire.$$)
      ),
      jsonb_build_object(
        'heading', $$La ponctuation, marque de l'émotivité$$,
        'body', $$Certains signes de ponctuation traduisent une certaine émotivité du locuteur, révélant son état émotionnel lors de la production de l'énoncé : les points d'exclamation, les points d'interrogation, les guillemets et les tirets.$$,
        'highlights', array[$$ponctuation$$, $$émotivité$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel signe de ponctuation traduit le plus souvent la surprise ou une forte émotion ?$$, 'solution', $$Le point d'exclamation.$$)
      ),
      jsonb_build_object(
        'heading', $$Les interjections$$,
        'body', $$Les interjections, comme « Ho ! » ou « hélas ! », traduisent elles aussi l'état émotionnel du locuteur : surprise, tristesse, joie, désolation, etc.$$,
        'highlights', array[$$interjections$$]::text[],
        'example', jsonb_build_object('statement', $$Que traduit l'interjection « hélas ! » dans un énoncé ?$$, 'solution', $$Elle traduit généralement la tristesse ou la désolation du locuteur.$$),
        'fixation', jsonb_build_object('question', $$Que traduisent en général les interjections dans un énoncé ?$$, 'solution', $$L'état émotionnel du locuteur (surprise, tristesse, joie, désolation...).$$)
      ),
      jsonb_build_object(
        'heading', $$Les modalisateurs, indices de jugement$$,
        'body', $$Tout comme les indices de personne, les modalisateurs introduisent de la subjectivité dans l'énoncé : ils traduisent le fait que le locuteur exprime une opinion ou un jugement personnel, et non un fait neutre et objectif.$$,
        'highlights', array[$$modalisateurs$$, $$subjectivité$$]::text[],
        'fixation', jsonb_build_object('question', $$Que révèle la présence d'un modalisateur dans un énoncé ?$$, 'solution', $$Que le locuteur exprime une opinion ou un jugement personnel, et non un fait neutre.$$)
      ),
      jsonb_build_object(
        'heading', $$Les figures de style de la distanciation$$,
        'body', $$Certaines figures de style, comme l'ironie ou l'hyperbole, sont des procédés de distanciation : elles permettent au locuteur de se démarquer d'une opinion qu'il ne partage pas, en la présentant de façon exagérée ou moqueuse plutôt que de l'exprimer directement.$$,
        'highlights', array[$$distanciation$$, $$ironie$$]::text[],
        'fixation', jsonb_build_object('question', $$À quoi servent les figures de style de la distanciation, comme l'ironie ?$$, 'solution', $$Elles permettent au locuteur de se démarquer d'une opinion qu'il ne partage pas.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève écrit à son ami : « Ho ! Tu ne devineras jamais ce qui m'est arrivé ce matin ! Range vite tes affaires et viens m'écouter : c'est une histoire incroyable, je te le promets. »$$,
      'questions', array[
        $$Relève dans ce texte un indice grammatical se rapportant à l'énonciateur, puis un autre se rapportant au destinataire.$$,
        $$Relève l'interjection présente dans ce texte et explique ce qu'elle traduit.$$,
        $$Relève une marque de l'impératif et explique à qui elle s'adresse.$$,
        $$Quels signes de ponctuation traduisent l'émotivité du locuteur dans ce texte ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite un pronom personnel se rapportant à l'énonciateur.$$,
      'hint', $$La première personne.$$,
      'expected', $$Par exemple « je », « moi » ou « nous ».$$
    ),
    jsonb_build_object(
      'question', $$Quel mode verbal s'adresse directement au destinataire ?$$,
      'hint', $$On l'utilise pour donner un ordre.$$,
      'expected', $$Le mode impératif.$$
    ),
    jsonb_build_object(
      'question', $$Que traduisent les interjections dans un énoncé ?$$,
      'hint', $$Elles expriment un état intérieur.$$,
      'expected', $$L'état émotionnel du locuteur (surprise, tristesse, joie, désolation...).$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de figure de style de la distanciation.$$,
      'hint', $$On dit le contraire de ce que l'on pense.$$,
      'expected', $$L'ironie (ou l'hyperbole).$$
    )
  ),
  now()
);
