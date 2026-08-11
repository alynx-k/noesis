-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3236: "EE 5: Production-écrite_Analyser_sujet-Rech_idées"
-- (https://lyc.ecole-ci.org/course/view.php?id=3236)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Prdtion-écrite_S7_Analyser_sujet-Rech_idées.pdf" (7 pages,
-- séance 7 : la production écrite, analyser le sujet et rechercher les
-- idées). Sujet support : une citation de Stella et Joël de Rosnay sur les
-- comportements qui exposent l'homme aux maladies et à la mort prématurée.
-- Rewritten/paraphrased from the source PDF: the two-step method to
-- analyse a production-écrite subject (identification et analyse des mots
-- clés, pour délimiter le champ de réflexion) and to brainstorm ideas by
-- varying domains (sportif, politique, social, économique, culturel,
-- historique...), illustrated with the source's own worked example on
-- health-endangering behaviours. 100% original wording; no sentence copied
-- from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee5-production-ecrite-analyser-sujet',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : la production écrite — analyser le sujet et rechercher les idées$$,
  22,
  '2nde-a-fr-ee4-commentaire-rediger-introduction',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Face à un sujet de production écrite qui les invite à étayer, dans un développement argumenté et illustré d'exemples, une affirmation sur les comportements qui exposent l'homme aux maladies et à la mort prématurée, les élèves de seconde A s'organisent pour apprendre la démarche qui permet d'analyser un sujet et d'en rechercher les idées, avant même de commencer la rédaction.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La composition du sujet$$,
        'body', $$Le sujet d'une production écrite comporte généralement deux parties : une citation ou une affirmation à commenter, et une consigne qui précise le travail attendu (par exemple, étayer cette affirmation dans un développement argumenté et illustré d'exemples).$$,
        'highlights', array[$$citation$$, $$consigne$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux parties qui composent généralement un sujet de production écrite ?$$, 'solution', $$Une citation ou affirmation à commenter, et une consigne précisant le travail attendu.$$)
      ),
      jsonb_build_object(
        'heading', $$Identifier et analyser les mots clés$$,
        'body', $$Comprendre le sujet suppose d'abord de repérer ses mots clés et de déterminer leurs différents sens possibles, afin de délimiter le champ de réflexion. Chaque mot clé peut être reformulé par des synonymes ou des expressions équivalentes, ce qui permet de mieux cerner ce que le sujet attend réellement.$$,
        'highlights', array[$$mots clés$$, $$champ de réflexion$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Mot clé du sujet$$, $$Sens possibles$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$« préparons »$$, $$exposons, livrons, cédons$$),
            jsonb_build_array($$« le terrain »$$, $$notre corps, notre santé, notre vie, notre bien-être$$),
            jsonb_build_array($$« emporteront prématurément »$$, $$mort hâtive, perdre la vie précipitamment, mort précoce$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi est-il utile de chercher plusieurs sens possibles pour chaque mot clé d'un sujet ?$$, 'solution', $$Cela permet de mieux délimiter le champ de réflexion et d'éviter de mal interpréter ce que le sujet demande réellement.$$),
        'fixation', jsonb_build_object('question', $$Que faut-il faire, pour chaque mot clé identifié, afin de bien comprendre le sujet ?$$, 'solution', $$Déterminer ses différents sens possibles.$$)
      ),
      jsonb_build_object(
        'heading', $$Rechercher les idées en variant les domaines$$,
        'body', $$Une fois le sujet compris, la recherche des idées peut se faire en variant les domaines de recherche : le plan sportif, politique, social, économique, culturel, historique, audiovisuel, etc. Il est important de noter qu'à ce stade, les idées sont recherchées en vrac : il n'y a pas encore d'organisation à faire.$$,
        'highlights', array[$$recherche des idées$$, $$domaines$$]::text[],
        'fixation', jsonb_build_object('question', $$Faut-il organiser les idées dès l'étape de la recherche ?$$, 'solution', $$Non, à ce stade les idées sont recherchées en vrac, sans organisation.$$)
      ),
      jsonb_build_object(
        'heading', $$Illustrer chaque idée par un exemple$$,
        'body', $$Pour chaque idée trouvée, il est utile d'associer immédiatement un exemple concret qui l'illustre. Ainsi, pour la question « Quelles sont les actions de l'homme qui l'exposent aux maladies et à la mort précoce ? », on peut relever des idées comme le rejet de déchets chimiques dans l'atmosphère, l'utilisation abusive de produits chimiques en agriculture, ou une alimentation déséquilibrée, chacune accompagnée d'un exemple précis.$$,
        'highlights', array[$$exemples concrets$$]::text[],
        'example', jsonb_build_object('statement', $$Quel exemple concret peut illustrer l'idée d'une « alimentation déséquilibrée » comme cause de maladie ?$$, 'solution', $$Par exemple, manger trop gras, trop salé ou trop sucré, et grignoter entre les repas.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi est-il utile d'associer un exemple à chaque idée trouvée lors de la recherche ?$$, 'solution', $$Pour rendre l'idée concrète et pouvoir l'utiliser directement dans l'argumentation du développement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit traiter le sujet suivant : « Étayez, dans un développement argumenté et illustré d'exemples, l'affirmation selon laquelle l'usage excessif des réseaux sociaux nuit à la réussite scolaire des jeunes. »$$,
      'questions', array[
        $$Identifie les mots clés de ce sujet et propose un sens pour chacun d'eux.$$,
        $$Dans quels domaines pourrais-tu chercher des idées pour traiter ce sujet ?$$,
        $$Propose trois idées en vrac qui pourraient répondre à ce sujet.$$,
        $$Pour l'une de tes idées, propose un exemple concret qui l'illustre.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les deux parties d'un sujet de production écrite ?$$,
      'hint', $$L'une donne le thème, l'autre le travail à faire.$$,
      'expected', $$Une citation ou affirmation à commenter, et une consigne précisant le travail attendu.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il repérer en premier pour comprendre un sujet ?$$,
      'hint', $$Les mots les plus importants.$$,
      'expected', $$Les mots clés du sujet.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux domaines dans lesquels on peut chercher des idées pour traiter un sujet.$$,
      'hint', $$Par exemple sportif, social...$$,
      'expected', $$Par exemple le domaine social et le domaine économique (on peut aussi citer sportif, politique, culturel, historique).$$
    ),
    jsonb_build_object(
      'question', $$Faut-il organiser les idées dès qu'on les trouve ?$$,
      'hint', $$Non, pas à cette étape.$$,
      'expected', $$Non, les idées sont d'abord recherchées en vrac, sans organisation.$$
    )
  ),
  now()
);
