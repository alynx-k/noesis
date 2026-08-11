-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3702: "SVT 2nd A_L2_Les habitudes alimentaires et la
-- santé de l'homme" (https://lyc.ecole-ci.org/course/view.php?id=3702)
-- Resource "Je lis le résumé de la leçon", mod_resource id 37664, redirecting
-- to pluginfile "SVT 2nd A_L2_Les habitudes alimentaires et la santé de
-- lhomme.pdf" (10 pages; internally labelled "Leçon 9" under the theme "La
-- nutrition et la santé de l'homme").
-- Rewritten/paraphrased from the source PDF: malnutrition-linked diseases
-- (endemic goitre, obesity, atherosclerosis), the goitre case explained by
-- food quality (iodine-poor / goitrogenic foods such as cassava, cabbage,
-- sweet potato, turnips), obesity/atherosclerosis explained by food
-- quantity (energy excess, BMI, atheroma plaques), and the conclusion that
-- a varied and balanced diet plus physical activity prevents these
-- diseases. 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-habitudes-alimentaires-sante',
  '2nde',
  'A',
  'svt',
  $$Les habitudes alimentaires et la santé de l'homme$$,
  2,
  '2nde-a-svt-diversite-comportements-alimentaires',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En vacances à Man, où l'alimentation est essentiellement composée de manioc, un élève de seconde A constate que le goitre y est une maladie endémique. De retour chez lui, il raconte cette observation à ses camarades de classe. Curieux, ils décident de s'informer sur les maladies liées aux habitudes alimentaires et de chercher à expliquer leur apparition.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Des maladies liées à l'alimentation$$,
        'body', $$Lorsque l'alimentation ne couvre pas correctement les besoins de l'organisme, on parle de malnutrition, et divers troubles peuvent apparaître. Le goitre endémique se traduit par un gonflement anormal de la glande thyroïde, située au niveau du cou. L'obésité correspond à un stockage excessif de graisse dans l'organisme, qui peut avoir des causes héréditaires mais résulte surtout d'une alimentation inadaptée. L'artériosclérose, quant à elle, correspond à un dépôt de plaques riches en « mauvais cholestérol » (LDL) sur la paroi interne des artères, à la suite d'un excès alimentaire en graisses animales. Ces trois maladies montrent que des habitudes alimentaires inadaptées peuvent avoir des conséquences graves sur la santé.$$,
        'highlights', array[$$malnutrition$$, $$goitre endémique$$, $$obésité$$, $$artériosclérose$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La malnutrition est une alimentation qui ne répond pas correctement aux besoins de l'organisme, que ce soit par la qualité ou par la quantité des aliments consommés.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois maladies liées à l'alimentation présentées dans cette leçon ?$$, 'solution', $$Le goitre endémique, l'obésité et l'artériosclérose.$$)
      ),
      jsonb_build_object(
        'heading', $$La qualité des aliments : l'exemple du goitre$$,
        'body', $$Dans les régions montagneuses où l'alimentation repose essentiellement sur le manioc, comme à Man, le goitre est fréquent. Or le manioc, tout comme le chou, la patate douce ou les navets, est naturellement pauvre en iode. Lorsque l'alimentation manque durablement d'iode, la glande thyroïde ne parvient plus à fabriquer suffisamment d'hormones thyroïdiennes : ses cellules accumulent alors une substance appelée colloïde, ce qui provoque le gonflement de la glande, c'est-à-dire le goitre. Cet exemple montre qu'une maladie liée à l'alimentation peut s'expliquer non pas par la quantité, mais par la qualité, c'est-à-dire la composition, des aliments consommés.$$,
        'highlights', array[$$carence en iode$$, $$glande thyroïde$$, $$aliments pauvres en iode$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Aliment pauvre en iode$$, $$Effet sur la thyroïde$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Manioc$$, $$Apport en iode insuffisant si consommé en grande quantité et de façon exclusive$$),
            jsonb_build_array($$Chou, patate douce, navets$$, $$Peuvent aggraver la carence en iode et favoriser le goitre$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi le goitre endémique touche-t-il particulièrement certaines régions montagneuses de Côte d'Ivoire ?$$, 'solution', $$Parce que l'alimentation y repose essentiellement sur le manioc, un aliment pauvre en iode, ce qui entraîne à long terme un dysfonctionnement de la thyroïde.$$),
        'fixation', jsonb_build_object('question', $$Quel minéral fait défaut dans l'alimentation d'une personne atteinte de goitre endémique ?$$, 'solution', $$L'iode.$$)
      ),
      jsonb_build_object(
        'heading', $$La quantité des aliments : obésité et artériosclérose$$,
        'body', $$Malgré la richesse de ses vivres, la Côte d'Ivoire connaît une hausse de l'obésité et de l'artériosclérose, liée à de nouvelles habitudes alimentaires : on accusait autrefois surtout les graisses, mais l'excès de protides est aujourd'hui également mis en cause. Lorsque les apports alimentaires dépassent durablement la dépense énergétique d'une personne sédentaire, l'organisme stocke le surplus sous forme de graisse dans des cellules appelées adipocytes, ce qui entraîne une prise de poids excessive : c'est l'obésité. Ces graisses excédentaires, riches en mauvais cholestérol, peuvent aussi se déposer sur la paroi des artères vieillissantes et y former des plaques d'athérome ; les artères perdent alors leur élasticité et deviennent rigides et cassantes, ce qui définit l'artériosclérose. Pour évaluer la corpulence, on calcule l'indice de masse corporelle (IMC), qui rapporte la masse au carré de la taille.$$,
        'highlights', array[$$excès alimentaire$$, $$adipocytes$$, $$plaque d'athérome$$, $$IMC$$]::text[],
        'property', jsonb_build_object('label', $$Formule$$, 'text', $$IMC = masse (kg) / taille² (m)$$),
        'table', jsonb_build_object(
          'headers', array[$$État$$, $$IMC$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Maigreur$$, $$En dessous de 19$$),
            jsonb_build_array($$Normal$$, $$De 19 à 25$$),
            jsonb_build_array($$Surpoids$$, $$De 25 à 30$$),
            jsonb_build_array($$Obésité$$, $$Au-dessus de 30$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on les cellules qui stockent l'excès de graisse dans l'organisme ?$$, 'solution', $$Les adipocytes.$$)
      ),
      jsonb_build_object(
        'heading', $$Prévenir les maladies liées à l'alimentation$$,
        'body', $$Au total, les maladies liées aux habitudes alimentaires s'expliquent soit par leurs causes physiologiques, soit par la qualité, soit par la quantité des aliments consommés. Pour les éviter, il est nécessaire d'adopter une alimentation à la fois variée, c'est-à-dire couvrant l'ensemble des besoins qualitatifs de l'organisme (vitamines, minéraux, protides, lipides, glucides), et équilibrée, c'est-à-dire adaptée en quantité à la dépense énergétique de chacun. Cette alimentation doit en outre être associée à la pratique régulière d'une activité physique pour limiter les risques d'obésité et de maladies cardiovasculaires.$$,
        'highlights', array[$$alimentation variée$$, $$alimentation équilibrée$$, $$activité physique$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux qualités attendues d'une bonne alimentation, en plus d'une activité physique régulière ?$$, 'solution', $$Elle doit être variée et équilibrée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le père d'un ami, victime d'une crise cardiaque, est hospitalisé. Les examens révèlent la présence de plaques d'athérome dans une de ses artères. Un élève doit expliquer à son ami comment l'alimentation a pu contribuer à cette maladie et quelles habitudes alimentaires adopter pour l'éviter.$$,
      'questions', array[
        $$Définis la malnutrition et cite les trois maladies alimentaires étudiées dans cette leçon.$$,
        $$Explique pourquoi une alimentation à base de manioc peut favoriser l'apparition du goitre endémique.$$,
        $$Décris comment un excès d'aliments peut conduire à l'obésité puis à l'artériosclérose.$$,
        $$Propose deux mesures alimentaires permettant de prévenir ces maladies.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle carence alimentaire est à l'origine du goitre endémique ?$$,
      'hint', $$C'est un minéral indispensable au fonctionnement de la thyroïde.$$,
      'expected', $$Une carence en iode.$$
    ),
    jsonb_build_object(
      'question', $$Comment s'appelle le dépôt de graisses riches en mauvais cholestérol sur la paroi des artères ?$$,
      'hint', $$C'est ce dépôt qui provoque l'artériosclérose.$$,
      'expected', $$Une plaque d'athérome.$$
    ),
    jsonb_build_object(
      'question', $$Quelle formule permet de calculer l'indice de masse corporelle (IMC) ?$$,
      'hint', $$Elle relie la masse et le carré de la taille.$$,
      'expected', $$IMC = masse (kg) / taille² (m).$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux caractéristiques d'une alimentation qui prévient les maladies nutritionnelles ?$$,
      'hint', $$Une bonne alimentation doit couvrir les besoins qualitatifs et quantitatifs de l'organisme.$$,
      'expected', $$Elle doit être variée et équilibrée.$$
    )
  ),
  now()
);
