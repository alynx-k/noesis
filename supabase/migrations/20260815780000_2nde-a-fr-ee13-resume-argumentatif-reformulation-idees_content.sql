-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 3244: "EE 13: Résumé_Texte_Argu_Reformulation_IE"
-- (https://lyc.ecole-ci.org/course/view.php?id=3244)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Résumé_Texte_Argu_S4_Reformulation_IE.pdf" (4 pages, séance 4 :
-- reformuler les idées essentielles). Textes support : Stella et Joël de
-- Rosnay, "Savoir s'alimenter" ; Venance Konan, "La Côte d'Ivoire un beau
-- pays !" ; Francis Bebey, avant-propos de la revue Recherche Pédagogie et
-- Culture, n°29-30, 1977 (citations publiques déjà présentes dans les
-- intitulés, non développées ici).
-- Rewritten/paraphrased from the source PDF: the "RETENONS" rule for
-- reformulating essential ideas (synonyms, generic/englobant terms for
-- enumerations, simplifying complex sentences, turning direct
-- interrogatives into indirect ones), illustrated with the source's own
-- before/after comparison table. 100% original wording; no sentence copied
-- from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee13-resume-argumentatif-reformulation-idees',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le résumé du texte argumentatif — reformuler les idées essentielles$$,
  29,
  '2nde-a-fr-ee12-resume-argumentatif-selection-enchainement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir sélectionné et enchaîné les idées essentielles du texte, les élèves de seconde A doivent maintenant les reformuler avec leurs propres mots, afin de ne pas recopier l'auteur et de préparer un résumé personnel, condensé et fidèle au sens du texte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Pourquoi reformuler les idées essentielles$$,
        'body', $$Reformuler consiste à réécrire une idée essentielle avec d'autres mots que ceux de l'auteur, sans en changer le sens. Cette étape est indispensable car un résumé ne doit jamais être un simple copier-coller de phrases du texte d'origine : il doit prouver que l'idée a été comprise, pas seulement repérée.$$,
        'highlights', array[$$reformuler$$, $$sans recopier$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi ne doit-on jamais recopier telles quelles les phrases du texte dans un résumé ?$$, 'solution', $$Parce que le résumé doit prouver que l'idée a été comprise et reformulée, pas seulement repérée et recopiée.$$)
      ),
      jsonb_build_object(
        'heading', $$Utiliser des synonymes et des termes englobants$$,
        'body', $$Pour reformuler, on remplace les mots du texte par des synonymes, et on remplace une énumération d'éléments par un seul mot englobant qui les regroupe tous (par exemple, remplacer une liste de maladies par le mot « maladies »).$$,
        'highlights', array[$$synonymes$$, $$mots englobants$$]::text[],
        'example', jsonb_build_object('statement', $$Comment reformuler, avec un mot englobant, une phrase qui énumère plusieurs maladies liées à l'alimentation ?$$, 'solution', $$En les regroupant sous un terme général comme « ses maladies mortelles », sans toutes les énumérer.$$),
        'fixation', jsonb_build_object('question', $$Par quoi remplace-t-on une énumération d'éléments lorsqu'on reformule une idée ?$$, 'solution', $$Par un seul mot englobant qui regroupe tous ces éléments.$$)
      ),
      jsonb_build_object(
        'heading', $$Simplifier les phrases complexes et les interrogations$$,
        'body', $$Reformuler suppose aussi de transformer les phrases complexes du texte en phrases simples, et de transformer les phrases interrogatives directes de l'auteur en phrases déclaratives ou en interrogatives indirectes, plus adaptées au ton neutre d'un résumé.$$,
        'highlights', array[$$phrases simples$$, $$interrogative indirecte$$]::text[],
        'example', jsonb_build_object('statement', $$Comment reformuler une question rhétorique de l'auteur du type « Peut-on aller contre des habitudes aussi enracinées ? » ?$$, 'solution', $$En une phrase déclarative simple, par exemple : « On ne peut guère combattre les anciennes habitudes. »$$),
        'fixation', jsonb_build_object('question', $$Que doit-on faire des phrases interrogatives directes de l'auteur, lors de la reformulation ?$$, 'solution', $$Les transformer en phrases déclaratives ou en interrogatives indirectes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un texte affirme, sous forme de question : « Peut-on encore ignorer les conséquences du réchauffement climatique sur nos villes ? », puis énumère la montée des eaux, les canicules et les tempêtes plus fréquentes comme conséquences.$$,
      'questions', array[
        $$Reformule la question rhétorique en une phrase déclarative simple.$$,
        $$Reformule l'énumération des conséquences à l'aide d'un mot englobant.$$,
        $$Propose un synonyme pour remplacer le mot « conséquences » dans ta reformulation.$$,
        $$Relie tes deux idées reformulées par un connecteur logique adapté.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Pourquoi doit-on reformuler les idées essentielles avant de rédiger le résumé ?$$,
      'hint', $$Pour prouver la compréhension.$$,
      'expected', $$Pour prouver que l'idée a été comprise, et non simplement recopiée depuis le texte.$$
    ),
    jsonb_build_object(
      'question', $$Comment reformule-t-on une énumération d'éléments dans le texte source ?$$,
      'hint', $$Un seul mot qui les regroupe.$$,
      'expected', $$En la remplaçant par un mot englobant qui regroupe tous les éléments énumérés.$$
    ),
    jsonb_build_object(
      'question', $$Que devient une phrase interrogative directe de l'auteur, une fois reformulée ?$$,
      'hint', $$Une forme plus neutre.$$,
      'expected', $$Une phrase déclarative ou une interrogative indirecte.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux façons principales de reformuler les mots du texte ?$$,
      'hint', $$Synonymes et généralisation.$$,
      'expected', $$Utiliser des synonymes, et remplacer les énumérations par des mots englobants.$$
    )
  ),
  now()
);
