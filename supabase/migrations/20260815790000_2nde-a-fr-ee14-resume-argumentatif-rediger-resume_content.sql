-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=164 ("Expression écrite").
-- Moodle course id 781: "EE 14: Résumé_Texte_Argu_Rédiger_résumé"
-- (https://lyc.ecole-ci.org/course/view.php?id=781)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "2nde_EE_Résumé_Texte_Argu_S6_7_Rédiger_résumé.pdf" (4 pages, séances 5
-- et 6 : rédiger le résumé). Textes support : Stella et Joël de Rosnay,
-- "Savoir s'alimenter" ; Venance Konan, "La Côte d'Ivoire un beau pays !"
-- (citations publiques déjà présentes dans les intitulés, non développées
-- ici).
-- Rewritten/paraphrased from the source PDF: the method for computing the
-- target word count (reduction to a quarter of the original length, with a
-- ±10% tolerance), and the "RETENONS" rule listing the constraints a
-- written résumé must respect (follow the text's order, no abbreviating,
-- no title, mention the word count, single block with no
-- introduction/conclusion). The source's own two worked résumés are
-- referenced only by their computed word counts, not reproduced. 100%
-- original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-ee14-resume-argumentatif-rediger-resume',
  '2nde',
  'A',
  'francais',
  $$Expression écrite : le résumé du texte argumentatif — rédiger le résumé$$,
  30,
  '2nde-a-fr-ee13-resume-argumentatif-reformulation-idees',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir sélectionné, enchaîné et reformulé les idées essentielles du texte, les élèves de seconde A abordent la dernière étape : rédiger effectivement le résumé, en respectant un volume de mots précis et des règles de présentation strictes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Calculer le volume du résumé$$,
        'body', $$Avant de rédiger, il faut calculer le nombre de mots que doit comporter le résumé : on réduit le texte au quart de son volume initial, puis on applique une marge de tolérance de plus ou moins 10 % autour de ce chiffre pour obtenir une fourchette acceptable.$$,
        'highlights', array[$$au quart$$, $$marge de tolérance de 10 %$$]::text[],
        'example', jsonb_build_object('statement', $$Un texte de 400 mots doit être résumé au quart. Quelle est la fourchette de mots acceptable, avec une marge de 10 % ?$$, 'solution', $$400 divisé par 4 donne 100 mots ; avec une marge de 10 mots en plus ou en moins, le résumé doit compter entre 90 et 110 mots.$$),
        'fixation', jsonb_build_object('question', $$Comment calcule-t-on le nombre de mots que doit comporter un résumé ?$$, 'solution', $$On divise le nombre de mots du texte par quatre, puis on applique une marge de tolérance de plus ou moins 10 %.$$)
      ),
      jsonb_build_object(
        'heading', $$Respecter l'ordre et la forme du texte source$$,
        'body', $$Le résumé doit obligatoirement suivre l'ordre dans lequel les idées apparaissent dans le texte d'origine : on ne peut ni réorganiser, ni inverser l'ordre des idées essentielles déjà sélectionnées et reformulées.$$,
        'highlights', array[$$ordre du texte$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans quel ordre les idées essentielles doivent-elles apparaître dans le résumé ?$$, 'solution', $$Dans le même ordre que dans le texte d'origine.$$)
      ),
      jsonb_build_object(
        'heading', $$Les règles de présentation du résumé$$,
        'body', $$Le résumé doit respecter des contraintes précises de rédaction : il ne comporte pas de titre, il ne doit pas être schématisé (les mots ne sont pas abrégés), il se rédige en un seul bloc de texte, sans introduction, sans développement en plusieurs parties, et sans conclusion. Le nombre de mots utilisé est mentionné au bas de la copie.$$,
        'highlights', array[$$sans titre$$, $$en un bloc$$, $$nombre de mots mentionné$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Règle$$, $$Ce qu'elle interdit ou impose$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Suivre l'ordre du texte$$, $$Interdit de réorganiser les idées$$),
            jsonb_build_array($$Ne pas schématiser$$, $$Interdit d'abréger les mots$$),
            jsonb_build_array($$Rédiger sans titre$$, $$Interdit d'ajouter un titre au résumé$$),
            jsonb_build_array($$Rédiger en un bloc$$, $$Interdit l'introduction, le développement en parties et la conclusion$$),
            jsonb_build_array($$Mentionner le nombre de mots$$, $$Impose d'indiquer ce nombre au bas de la copie$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les contraintes de présentation que le résumé doit respecter ?$$, 'solution', $$Suivre l'ordre du texte, ne pas abréger les mots, ne pas mettre de titre, rédiger en un seul bloc sans introduction ni conclusion, et mentionner le nombre de mots au bas de la copie.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un texte argumentatif de 360 mots dénonce la pollution plastique des océans, à partir des idées essentielles déjà sélectionnées, enchaînées et reformulées lors des étapes précédentes.$$,
      'questions', array[
        $$Calcule le nombre de mots que devra comporter le résumé de ce texte, ainsi que la fourchette de tolérance.$$,
        $$Rappelle deux règles de présentation que ce résumé devra respecter.$$,
        $$Rédige, en un bloc, un résumé fictif de deux phrases respectant l'ordre des idées essentielles.$$,
        $$Indique où et comment il faut mentionner le nombre de mots utilisé dans le résumé rédigé.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment calcule-t-on le nombre de mots que doit comporter un résumé ?$$,
      'hint', $$Une fraction du texte, avec une marge.$$,
      'expected', $$On divise le nombre de mots du texte par quatre, puis on applique une marge de tolérance de plus ou moins 10 %.$$
    ),
    jsonb_build_object(
      'question', $$Dans quel ordre les idées essentielles doivent-elles apparaître dans le résumé ?$$,
      'hint', $$Celui du texte source.$$,
      'expected', $$Dans le même ordre que dans le texte d'origine.$$
    ),
    jsonb_build_object(
      'question', $$Le résumé peut-il comporter une introduction et une conclusion ?$$,
      'hint', $$Non, une forme particulière.$$,
      'expected', $$Non, il se rédige en un seul bloc, sans introduction, sans développement en parties, ni conclusion.$$
    ),
    jsonb_build_object(
      'question', $$Que doit-on mentionner au bas de la copie du résumé ?$$,
      'hint', $$Un chiffre.$$,
      'expected', $$Le nombre de mots utilisé dans le résumé rédigé.$$
    )
  ),
  now()
);
