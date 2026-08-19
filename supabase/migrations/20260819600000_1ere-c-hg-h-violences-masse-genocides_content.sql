-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie (matière Histoire), categoryid=136.
-- Moodle course id 2447: "1ère H8-Les violences de masse Les génocides du
-- xxème siècles à nos jours"
-- (https://lyc.ecole-ci.org/course/view.php?id=2447), resource id 22710.
-- Contenu réécrit à partir du PDF source (violences de masse, définition
-- juridique du génocide, la Shoah, moyens de lutte juridiques et
-- judiciaires). Dates, chiffres, noms de tribunaux et de responsables
-- condamnés réels repris tels quels (données factuelles, non protégées).
-- Dernière leçon d'Histoire-Géographie pour la 1ère C.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-h-violences-masse-genocides',
  '1ere',
  'C',
  'histoire-geographie',
  $$Les violences de masse : les génocides du XXe siècle à nos jours$$,
  16,
  '1ere-c-hg-h-deuxieme-guerre-mondiale',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Invités par le club d'Histoire-Géographie à suivre une conférence sur les guerres civiles, des élèves de 1ère découvrent les violences de masse et les actes génocidaires subis par des populations en Afrique. Choqués et soucieux d'en savoir davantage, ils décident de mener des recherches pour comprendre les violences de masse et les génocides du XXe siècle à nos jours, connaître les caractéristiques des génocides, et apprécier les actions de lutte contre les génocides et les crimes contre l'humanité.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les violences de masse$$,
        'body', $$Une violence de masse est une forme de violence généralement non intentionnelle, portant sur un grand nombre de personnes qui ne sont pas ciblées à l'avance. Elle se caractérise par l'absence de préméditation, l'absence de ciblage préalable d'un groupe spécifique, et d'énormes dégâts humains et matériels. Exemples : le massacre de civils pendant la Deuxième Guerre mondiale, ou la répression pendant la colonisation en Côte d'Ivoire.$$,
        'highlights', array[$$violence de masse : non intentionnelle, non ciblée à l'avance, dégâts humains/matériels importants$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui distingue une violence de masse d'un acte prémédité ?$$, 'solution', $$Une violence de masse n'est généralement pas préméditée et ne vise pas de groupe de manière spécifique au préalable, contrairement à un acte planifié à l'avance.$$)
      ),
      jsonb_build_object(
        'heading', $$Le génocide : une violence de masse planifiée$$,
        'body', $$Le mot « génocide » est créé par le juriste polonais Raphaël Lemkin en 1944, employé d'abord au tribunal de Nuremberg puis adopté officiellement par l'ONU le 9 décembre 1948. Selon Lemkin, un génocide est une violence de masse planifiée et organisée, dont l'intention est d'exterminer un groupe en raison de sa race, sa nationalité, sa religion, son ethnie ou son opinion politique. Trois critères distinctifs permettent de le reconnaître : l'extermination totale ou partielle d'un groupe, la soumission intentionnelle à des conditions d'existence devant entraîner sa destruction physique, ou des mesures visant à entraver les naissances au sein du groupe — un seul critère vérifié suffit à qualifier un acte de génocide.$$,
        'highlights', array[$$génocide = violence de masse + intentionnalité + planification/organisation$$, $$3 critères (1 seul suffit) : extermination totale/partielle, conditions d'existence destructrices, entrave aux naissances$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi le génocide se distingue-t-il d'une simple violence de masse ?$$, 'solution', $$Le génocide ajoute à la violence de masse une intention délibérée d'exterminer un groupe précis (race, nationalité, religion, ethnie, opinion politique), avec planification et organisation — alors qu'une violence de masse ordinaire n'est ni préméditée, ni dirigée contre un groupe ciblé à l'avance.$$),
        'fixation', jsonb_build_object('question', $$Qui a créé le mot « génocide », et en quelle année a-t-il été adopté par l'ONU ?$$, 'solution', $$Raphaël Lemkin, en 1944 ; le mot a été officiellement adopté par l'ONU le 9 décembre 1948.$$)
      ),
      jsonb_build_object(
        'heading', $$La Shoah : un exemple de génocide$$,
        'body', $$L'idéologie nazie désigne les Juifs, avec les Slaves et les Tziganes, comme des « races inférieures » face aux Aryens jugés supérieurs. À partir de 1942, les Juifs sont déportés vers des camps de concentration (Buchenwald, Mauthausen), d'extermination (Auschwitz, Majdanek) et des centres d'euthanasie, capturés lors de rafles avec la complicité des autorités. Les victimes y sont battues, stérilisées, soumises aux travaux forcés, affamées et tuées par gaz (Cyclone B). Le bilan est terrible : sur 8,3 millions de Juifs vivant en Europe en 1939, 5 978 000 périssent dans les camps, soit 72% de la communauté juive (jusqu'à 90% dans les pays baltes).$$,
        'highlights', array[$$déportation dès 1942 : camps de concentration, d'extermination, centres d'euthanasie$$, $$bilan : 5 978 000 morts sur 8,3 millions de Juifs en Europe (1939) = 72%$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel pourcentage de la communauté juive d'Europe a péri dans les camps, selon le bilan de la Shoah ?$$, 'solution', $$72% (5 978 000 morts sur 8,3 millions de Juifs vivant en Europe en 1939).$$)
      ),
      jsonb_build_object(
        'heading', $$Les actions de lutte et de prévention contre les génocides$$,
        'body', $$Sur le plan juridique, la Déclaration universelle des droits de l'homme (10 décembre 1948, Paris) et le droit international humanitaire (Genève, 1949) posent les bases de la prévention. Des tribunaux internationaux jugent les responsables : le procès de Nuremberg, le TPIY (Tribunal pénal international pour l'ex-Yougoslavie, créé le 25 mai 1993), le TPIR (Tribunal pénal international pour le Rwanda, créé le 8 novembre 1994), et la Cour pénale internationale (CPI, à La Haye depuis le 1er juillet 2002). Les sanctions incluent la peine de mort, l'emprisonnement (à vie pour le général Ratko Mladić, condamné pour le massacre de Srebrenica) et les réparations.$$,
        'highlights', array[$$textes : DUDH (1948) + DIH (Genève, 1949)$$, $$tribunaux : Nuremberg, TPIY (1993), TPIR (1994), CPI (La Haye, 2002)$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la création de tribunaux pénaux internationaux spécifiques (TPIY, TPIR) était-elle nécessaire, en plus de la CPI ?$$, 'solution', $$Parce que la CPI n'a été instituée qu'en 2002 ; avant cette date, il fallait créer des tribunaux ad hoc pour juger les crimes de génocide commis lors de conflits spécifiques, comme en ex-Yougoslavie (1993) ou au Rwanda (1994).$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux tribunaux pénaux internationaux créés dans les années 1990 pour juger des crimes de génocide, et pour quels conflits ?$$, 'solution', $$Le TPIY (1993), pour l'ex-Yougoslavie, et le TPIR (1994), pour le Rwanda.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une émission télévisée, un élève de 1ère découvre les violences de masse et les actes génocidaires subis par des populations pendant des guerres. Pour les prévenir, des mesures ont été mises en place par la communauté internationale.$$,
      'questions', array[
        $$Quel est le thème développé dans cette situation ?$$,
        $$Définis le génocide et donne deux exemples de génocides du XXe siècle.$$,
        $$Quelles sont les mesures prises par la communauté internationale pour prévenir les actes génocidaires ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la définition d'une violence de masse ?$$,
      'hint', $$Elle n'est ni planifiée ni dirigée contre un groupe précis à l'avance.$$,
      'expected', $$Une forme de violence généralement non intentionnelle, portant sur un grand nombre de personnes qui ne sont pas ciblées à l'avance, occasionnant d'énormes dégâts humains et matériels.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois critères distinctifs d'un génocide, selon la définition de Lemkin (un seul suffit).$$,
      'hint', $$Ils touchent l'extermination, les conditions de vie, et les naissances.$$,
      'expected', $$L'extermination totale ou partielle d'un groupe, la soumission intentionnelle à des conditions d'existence destructrices, et les mesures visant à entraver les naissances au sein du groupe.$$
    ),
    jsonb_build_object(
      'question', $$Quel gaz les nazis ont-ils utilisé dans les camps d'extermination, jugé plus « efficace » que les gaz d'échappement ?$$,
      'hint', $$Son nom évoque un phénomène météorologique.$$,
      'expected', $$Le Cyclone B.$$
    ),
    jsonb_build_object(
      'question', $$Où et depuis quand siège la Cour pénale internationale (CPI) ?$$,
      'hint', $$C'est une ville des Pays-Bas.$$,
      'expected', $$À La Haye, depuis le 1er juillet 2002.$$
    )
  ),
  now()
);
