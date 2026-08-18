-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie (volet Histoire), categoryid=124.
-- Moodle course id 885: "1ère_HISTOIRE_T3_L3: LES VIOLENCES DE MASSE: les
-- Génocides du XXè siècle à nos jours"
-- (https://lyc.ecole-ci.org/course/view.php?id=885), resource id 4269.
-- Contenu réécrit à partir du PDF source (définitions violence de
-- masse/génocide, la Shoah comme étude de cas, moyens juridiques de lutte).
-- Faits, dates et chiffres réels (Lemkin 1944, convention ONU 1948,
-- statistiques de la Shoah, TPIY/TPIR/CPI) repris tels quels ; explications
-- reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-h-violences-masse-genocides',
  '1ere',
  'A',
  'histoire-geographie',
  $$Les violences de masse : les génocides du XXe siècle à nos jours$$,
  16,
  '1ere-a-hg-h-deuxieme-guerre-mondiale',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Invités par le club d'Histoire-Géographie à suivre une conférence sur les guerres civiles, des élèves de 1ère A découvrent les violences de masse et les actes génocidaires subis par des populations en Afrique. Choqués, ils décident de mener des recherches pour comprendre les violences de masse et les génocides du XXe siècle à nos jours, connaître les caractéristiques des génocides, et apprécier les actions de lutte contre ces crimes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'une violence de masse ?$$,
        'body', $$Une violence de masse est une forme de violence généralement non intentionnelle, portant sur un grand nombre de personnes, sans ciblage préalable spécifique. Elle n'est en général pas préméditée, ne vise pas un groupe particulier à l'avance, mais occasionne d'énormes dégâts humains et matériels. Exemples : le massacre de civils pendant la Deuxième Guerre mondiale, ou la répression pendant la colonisation en Côte d'Ivoire.$$,
        'highlights', array[$$non intentionnelle, non ciblée à l'avance$$, $$dégâts humains et matériels massifs$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui distingue une violence de masse d'un génocide ?$$, 'solution', $$Une violence de masse n'est pas nécessairement préméditée ni dirigée contre un groupe ciblé à l'avance, alors que le génocide implique une intention délibérée et planifiée d'exterminer un groupe spécifique.$$)
      ),
      jsonb_build_object(
        'heading', $$La notion de génocide$$,
        'body', $$Le mot « génocide » est créé en 1944 par le juriste polonais Raphaël Lemkin, qui le fait valoir au tribunal de Nuremberg puis auprès de l'ONU, qui l'adopte officiellement le 9 décembre 1948. Selon Lemkin, un génocide est une violence de masse planifiée et organisée, avec l'intention d'exterminer un groupe en raison de sa race, sa nationalité, sa religion, son ethnie ou son opinion politique. Trois critères distinctifs permettent de le caractériser : l'extermination totale ou partielle du groupe, la soumission intentionnelle à des conditions devant entraîner sa destruction physique, et des mesures visant à entraver les naissances en son sein — un seul de ces critères suffit à qualifier un génocide.$$,
        'highlights', array[$$Raphaël Lemkin, 1944 → adopté par l'ONU le 9/12/1948$$, $$3 critères distinctifs (un seul suffit)$$]::text[],
        'fixation', jsonb_build_object('question', $$Qui a inventé le mot « génocide », et en quelle année ?$$, 'solution', $$Le juriste polonais Raphaël Lemkin, en 1944.$$)
      ),
      jsonb_build_object(
        'heading', $$La Shoah : un exemple de génocide$$,
        'body', $$L'extermination des Juifs d'Europe par l'Allemagne nazie découle de leur assimilation, avec les Slaves, les Tziganes et d'autres groupes (homosexuels, handicapés), à une « race inférieure » face aux Aryens jugés supérieurs. Dès 1942, les Juifs sont déportés vers des camps de concentration (Buchenwald, Mauthausen), des camps d'extermination (Auschwitz, Majdanek) et des centres d'euthanasie, capturés lors de rafles avec la complicité des autorités, puis battus, mutilés, stérilisés, affamés et tués par le gaz (Cyclone B). Sur 8 300 000 Juifs vivant en Europe en 1939, 5 978 000 ont péri dans les camps, soit 72% de la communauté juive — des taux atteignant localement 85% en Pologne et près de 90% dans les pays baltes.$$,
        'highlights', array[$$déportation dès 1942$$, $$72% des Juifs d'Europe exterminés$$, $$camps : concentration, extermination, euthanasie$$]::text[],
        'property', jsonb_build_object('label', $$Chiffres clés$$, 'text', $$8 300 000 Juifs en Europe en 1939 → 5 978 000 morts (72%). Localement : 85% en Pologne, 82% en Tchécoslovaquie, ~90% dans les pays baltes.$$),
        'fixation', jsonb_build_object('question', $$Quel pourcentage de la communauté juive d'Europe a péri dans les camps entre 1939 et 1945 ?$$, 'solution', $$72% (5 978 000 sur 8 300 000).$$)
      ),
      jsonb_build_object(
        'heading', $$Les moyens juridiques de lutte contre les génocides$$,
        'body', $$La communauté internationale s'est dotée d'outils juridiques : la Déclaration Universelle des Droits de l'Homme (DUDH, 10 décembre 1948, Paris) et le Droit International Humanitaire (Genève, 1949), ainsi que des tribunaux : le procès de Nuremberg, le Tribunal Pénal International pour l'ex-Yougoslavie (TPIY, institué le 25 mai 1993), le Tribunal Pénal International pour le Rwanda (TPIR, institué le 8 novembre 1994), et la Cour Pénale Internationale (CPI) à La Haye, en fondation depuis le 1er juillet 2002, chargée de juger tous les crimes contre l'humanité. Les sanctions vont de la peine de mort à l'emprisonnement à vie : le général Ratko Mladic a ainsi été condamné à perpétuité pour le massacre de Srebrenica.$$,
        'highlights', array[$$DUDH (1948), DIH (Genève, 1949)$$, $$TPIY (1993), TPIR (1994), CPI (2002)$$, $$sanctions : peine de mort, prison à vie$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les deux tribunaux pénaux internationaux créés dans les années 1990 pour juger des crimes de génocide ?$$, 'solution', $$Le Tribunal Pénal International pour l'ex-Yougoslavie (TPIY, 1993) et le Tribunal Pénal International pour le Rwanda (TPIR, 1994).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une émission télévisée, un élève de 1ère découvre les violences de masse et les actes génocidaires subis par des populations pendant les guerres. Pour les prévenir, des mesures juridiques ont été adoptées par la communauté internationale.$$,
      'questions', array[
        $$Quel est le thème développé dans cette situation ?$$,
        $$Définis le génocide et donne quelques exemples.$$,
        $$Quelles sont les mesures prises par la communauté internationale pour prévenir les actes génocidaires ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel gaz a été utilisé par les nazis pour exterminer massivement les déportés dans les camps ?$$,
      'hint', $$Il porte un nom de code militaire.$$,
      'expected', $$Le Cyclone B.$$
    ),
    jsonb_build_object(
      'question', $$À quelle date la Convention pour la prévention et la répression du crime de génocide a-t-elle été adoptée par l'ONU ?$$,
      'hint', $$C'est le même jour que la Déclaration Universelle des Droits de l'Homme.$$,
      'expected', $$Le 9 décembre 1948.$$
    ),
    jsonb_build_object(
      'question', $$Où siège la Cour Pénale Internationale (CPI) ?$$,
      'hint', $$C'est une ville des Pays-Bas.$$,
      'expected', $$À La Haye.$$
    ),
    jsonb_build_object(
      'question', $$Combien de critères distinctifs suffisent à qualifier un génocide, selon la définition du cours ?$$,
      'hint', $$Un seul suffit parmi les trois cités.$$,
      'expected', $$Un seul critère suffit.$$
    )
  ),
  now()
);
