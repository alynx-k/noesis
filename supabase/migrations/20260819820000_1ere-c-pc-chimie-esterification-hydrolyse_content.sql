-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2393: "LEÇON 8: ESTÉRIFICATION ET HYDROLYSE D'UN ESTER"
-- (https://lyc.ecole-ci.org/course/view.php?id=2393), resource id 22074.
-- Contenu réécrit à partir du PDF source (réaction d'estérification,
-- réaction d'hydrolyse d'un ester, notion d'équilibre chimique, rendement).
-- Tout le contenu est factuel (chimie organique) : équations-bilans,
-- données expérimentales (tableaux de mesures, courbes nESTER=f(t)),
-- formules de rendement et exercices numériques sont repris/adaptés tels
-- quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-esterification-hydrolyse',
  '1ere',
  'C',
  'physique-chimie',
  $$Estérification et hydrolyse d'un ester$$,
  6,
  '1ere-c-pc-chimie-ethanol',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de la classe de 1ère C2 du Lycée Municipal de Guibéroua organisent une sortie d'étude dans une usine de fabrication de produits cosmétiques. Le guide leur apprend que certains parfums sont fabriqués à partir de composés d'origine animale ou végétale appelés esters. Émerveillés, ils décident, sous la supervision de leur professeur, de définir les réactions d'estérification et d'hydrolyse des esters, de connaître leurs caractéristiques, d'expliquer la notion d'équilibre chimique et d'exploiter les équations-bilans de ces réactions.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La réaction d'estérification$$,
        'body', $$La réaction d'estérification est la réaction entre un acide carboxylique et un alcool ; elle conduit à la formation d'un ester et d'eau : R-COOH + R'-OH → R-CO-O-R' + H2O. En mélangeant de façon équimolaire de l'acide éthanoïque et de l'éthanol en présence d'acide sulfurique concentré, chauffés à 100°C, un suivi par dosage acido-basique montre que la quantité d'ester formé augmente rapidement au début, puis de plus en plus lentement, pour atteindre une valeur limite (0,67 mol pour 1 mol de réactifs initiaux) qui ne varie plus, même après plusieurs heures supplémentaires. La réaction d'estérification est donc lente et limitée ; elle ne consomme ni ne produit de chaleur, elle est dite athermique.$$,
        'highlights', array[$$estérification : acide carboxylique + alcool → ester + eau$$, $$réaction lente, limitée et athermique$$, $$limite atteinte : ex. 0,67 mol d'ester pour 1 mol de réactifs$$]::text[],
        'example', jsonb_build_object('statement', $$Écris l'équation-bilan de l'estérification entre l'acide éthanoïque et l'éthanol.$$, 'solution', $$CH3-COOH + CH3-CH2-OH → CH3-CO-O-CH2-CH3 + H2O.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux produits obtenus lors d'une réaction d'estérification ?$$, 'solution', $$Un ester et de l'eau.$$)
      ),
      jsonb_build_object(
        'heading', $$La réaction d'hydrolyse d'un ester$$,
        'body', $$La réaction d'hydrolyse d'un ester est la réaction de l'eau sur un ester ; elle donne un alcool et un acide carboxylique : R-CO-O-R' + H2O → R-COOH + R'-OH. En chauffant, après ajout d'acide sulfurique, un mélange équimolaire d'éthanoate d'éthyle et d'eau, un suivi de la quantité d'ester restant montre qu'elle diminue rapidement au début puis se stabilise vers une valeur limite (0,67 mol restant, pour 1 mol initiale). La réaction d'hydrolyse d'un ester est donc lente, limitée et athermique. En superposant les courbes d'estérification et d'hydrolyse réalisées à partir des mêmes quantités, on constate qu'elles tendent vers la même limite : cela montre que les deux réactions se déroulent simultanément et aboutissent à un même état final.$$,
        'highlights', array[$$hydrolyse : ester + eau → acide carboxylique + alcool$$, $$réaction lente, limitée et athermique$$, $$les courbes d'estérification et d'hydrolyse convergent vers la même limite$$]::text[],
        'example', jsonb_build_object('statement', $$Écris l'équation-bilan de l'hydrolyse de l'éthanoate d'éthyle.$$, 'solution', $$CH3-CO-O-CH2-CH3 + H2O → CH3-COOH + CH3-CH2-OH.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux produits obtenus lors de l'hydrolyse d'un ester ?$$, 'solution', $$Un acide carboxylique et un alcool.$$)
      ),
      jsonb_build_object(
        'heading', $$Réactions réversibles et équilibre chimique$$,
        'body', $$Les réactions d'estérification et d'hydrolyse d'un ester se déroulent simultanément dans le milieu réactionnel : pendant que l'acide et l'alcool se transforment en ester et en eau, l'ester et l'eau formés se retransforment en acide et en alcool. On dit que ces réactions sont réversibles. Au bout d'un certain temps, les quantités de matière des réactifs et des produits n'évoluent plus : on dit que l'on a atteint un équilibre chimique, traduit dans l'équation-bilan par une double flèche en sens opposés (⇄) à la place de la flèche simple.$$,
        'highlights', array[$$estérification et hydrolyse se déroulent simultanément$$, $$équilibre chimique : quantités de matière stabilisées$$, $$notation : double flèche ⇄$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on, dans une équation-bilan, qu'une réaction a atteint un équilibre chimique ?$$, 'solution', $$Par la présence d'une double flèche en sens opposés (⇄) à la place de la flèche simple.$$)
      ),
      jsonb_build_object(
        'heading', $$Rendement de l'estérification et de l'hydrolyse$$,
        'body', $$Pour un mélange équimolaire d'acide et d'alcool, le rendement de l'estérification vaut ρ = quantité de matière d'ester formé / quantité de matière d'acide initial = nE / no(A). Pour un mélange équimolaire d'ester et d'eau, le rendement de l'hydrolyse vaut ρ = nombre de moles d'acide formé / nombre de moles d'ester initial = nA / no(E). Ce rendement peut être amélioré en ajoutant un réactif en excès, ou en empêchant la réaction inverse de se produire (par exemple, pour l'estérification, en éliminant l'eau formée ou en distillant l'ester au fur et à mesure de sa formation).$$,
        'highlights', array[$$rendement estérification : ρ = nE / no(A)$$, $$rendement hydrolyse : ρ = nA / no(E)$$, $$amélioration : réactif en excès ou élimination d'un produit formé$$]::text[],
        'example', jsonb_build_object('statement', $$Un mélange équimolaire d'1 mol d'acide éthanoïque et d'1 mol de propan-1-ol donne 0,67 mol d'ester à l'équilibre. Calcule le rendement de cette estérification.$$, 'solution', $$ρ = nE / no(A) = 0,67 / 1 = 0,67, soit 67%.$$),
        'fixation', jsonb_build_object('question', $$Cite une méthode permettant d'améliorer le rendement d'une estérification.$$, 'solution', $$Éliminer l'eau formée au fur et à mesure (ou distiller l'ester au fur et à mesure qu'il se forme), ou utiliser un réactif en excès.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une séance de T.P, ton groupe de travail est désigné pour préparer un ester dont la saveur et l'odeur sont celles de la banane mûre. Cet ester, utilisé pour aromatiser certains sirops, est l'éthanoate de 3-méthylbutyle. La réaction a lieu dans une ampoule scellée contenant 0,15 mol d'acide carboxylique, 0,45 mol d'alcool et un peu d'acide sulfurique. Le rendement de l'estérification est de 67%. On donne les masses molaires atomiques (en g/mol) : M(C) = 12 ; M(H) = 1 ; M(O) = 16 ; la masse molaire de l'ester formé est ME = 130 g/mol.$$,
      'questions', array[
        $$Indique le rôle de l'acide sulfurique dans cette réaction.$$,
        $$Écris les formules semi-développées des deux réactifs, puis celle de l'ester formé, et l'équation-bilan de la réaction.$$,
        $$Détermine les masses d'ester et d'eau formées à la limite de l'estérification.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels réactifs faut-il faire réagir pour préparer l'éthanoate d'éthyle par estérification ?$$,
      'hint', $$Il faut un acide carboxylique et un alcool.$$,
      'expected', $$L'acide éthanoïque et l'éthanol.$$
    ),
    jsonb_build_object(
      'question', $$La réaction d'estérification est-elle rapide ou lente, totale ou limitée, exothermique ou athermique ?$$,
      'hint', $$Trois caractéristiques à donner.$$,
      'expected', $$Elle est lente, limitée et athermique.$$
    ),
    jsonb_build_object(
      'question', $$Que devient la quantité de matière des réactifs et des produits lorsqu'un équilibre chimique est atteint ?$$,
      'hint', $$Cela ne veut pas dire que la réaction s'arrête complètement.$$,
      'expected', $$Elle n'évolue plus : elle reste constante dans le milieu réactionnel, bien que l'estérification et l'hydrolyse continuent à se dérouler simultanément.$$
    ),
    jsonb_build_object(
      'question', $$Comment peut-on améliorer le rendement d'une réaction d'hydrolyse d'un ester ?$$,
      'hint', $$Pense au réactif limitant.$$,
      'expected', $$En augmentant la quantité d'eau utilisée, ce qui rend l'ester réactif limitant et déplace l'équilibre vers l'hydrolyse.$$
    )
  ),
  now()
);
