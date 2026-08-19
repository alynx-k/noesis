-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- SVT, categoryid=125.
-- Moodle course id 902: "SVT 1ère A_L9_LA MISE EN RESERVE DES NUTRIMENTS"
-- (https://lyc.ecole-ci.org/course/view.php?id=902), resource id 4473.
-- Contenu réécrit à partir du PDF source (organes de stockage des
-- nutriments, expériences de pancréatectomie/greffe/injection, régulation
-- hormonale de la glycémie par insuline/glucagon). Faits scientifiques
-- réels (organes de stockage, mécanisme hormonal, seuils de glycémie)
-- repris tels quels ; explications reformulées, non copiées verbatim.
-- Dernière leçon de la séquence SVT de 1ère A (9 leçons prévues, 1 leçon
-- absente sur la plateforme : id=900, "hétérochromosomes XY").
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-svt-mise-en-reserve-nutriments',
  '1ere',
  'A',
  'svt',
  $$La mise en réserve des nutriments dans l'organisme$$,
  8,
  '1ere-a-svt-production-energie-cellule',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève de 1ère A, privée de déjeuner par ses parents, réalise pourtant de bonnes performances à la séance de sport de l'après-midi. Étonnés, ses camarades s'adressent à leur professeur de SVT, qui leur explique que cette performance provient des nutriments mis en réserve par son organisme. Ils décident alors de s'informer sur les organes de stockage des nutriments et d'expliquer le mécanisme de leur mise en réserve.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les organes de stockage des nutriments$$,
        'body', $$Lors de la digestion, les aliments sont transformés en nutriments qui sont absorbés dans l'intestin et déversés dans le sang, lequel les transporte vers les organes de stockage. Le foie stocke le glucose (issu des glucides) et les acides aminés (issus des protides) sous forme de glycogène. Les muscles stockent également le glucose et les acides aminés sous forme de glycogène. Les tissus adipeux stockent les acides gras et le glycérol (issus des lipides), ainsi qu'une partie du glucose, sous forme de triglycérides (graisses).$$,
        'highlights', array[$$foie et muscles : glycogène$$, $$tissus adipeux : triglycérides$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Organe de stockage', 'Nutriment stocké', 'Forme de réserve']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Foie$$, $$Glucose, acides aminés$$, $$Glycogène$$),
            jsonb_build_array($$Muscles$$, $$Glucose, acides aminés$$, $$Glycogène$$),
            jsonb_build_array($$Tissus adipeux$$, $$Acides gras, glycérol, glucose$$, $$Triglycérides$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Sous quelle forme le glucose est-il stocké dans le foie et les muscles ?$$, 'solution', $$Sous forme de glycogène.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rôle du pancréas : les expériences de pancréatectomie$$,
        'body', $$Pour déterminer le rôle du pancréas dans la mise en réserve des nutriments, on pratique chez un chien l'ablation totale du pancréas (pancréatectomie), puis une greffe d'un fragment de son propre pancréas, ou une injection d'extraits pancréatiques. Résultats : la pancréatectomie entraîne une augmentation de la glycémie ; la greffe et l'injection d'extraits pancréatiques ramènent la glycémie à la normale. Ceci montre que le pancréas intervient dans la régulation de la glycémie, grâce à des substances qu'il déverse dans le sang : des hormones. Une hormone est une substance chimique produite par une glande, véhiculée par le sang, qui agit sur des cellules ou organes cibles dont elle modifie le fonctionnement.$$,
        'highlights', array[$$ablation du pancréas → glycémie augmente$$, $$greffe/injection d'extraits pancréatiques → glycémie redevient normale$$]::text[],
        'fixation', jsonb_build_object('question', $$Que prouve le fait que la greffe d'un fragment de pancréas corrige la glycémie d'un chien pancréatectomisé ?$$, 'solution', $$Que le pancréas régule la glycémie grâce à des substances (hormones) qu'il libère dans le sang, et non par une action nerveuse directe, puisqu'un greffon placé n'importe où sous la peau suffit à rétablir la régulation.$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme hormonal de régulation de la glycémie$$,
        'body', $$Le pancréas régule la glycémie (normale autour de 1 g/l chez l'Homme) grâce à deux hormones produites par les îlots de Langerhans. Lorsque la glycémie est inférieure à 1 g/l (hypoglycémie), les cellules α produisent le glucagon, qui stimule la libération du glucose stocké par le foie, les muscles et les tissus adipeux : le glucagon est une hormone hyperglycémiante. Lorsque la glycémie est supérieure à 1 g/l (hyperglycémie), les cellules β produisent l'insuline, qui stimule le stockage du glucose dans ces mêmes organes : l'insuline est une hormone hypoglycémiante. En l'absence d'insuline, le glucose ne peut plus être stocké, ce qui entraîne une hyperglycémie durable : c'est le diabète.$$,
        'highlights', array[$$hypoglycémie → cellules α → glucagon (hyperglycémiant)$$, $$hyperglycémie → cellules β → insuline (hypoglycémiant)$$, $$absence d'insuline → diabète$$]::text[],
        'property', jsonb_build_object('label', $$Glycémie normale$$, 'text', $$Environ 1 g/l chez l'Homme. Le pancréas la maintient stable par un double mécanisme hormonal opposé (glucagon / insuline), formant deux boucles de rétrocontrôle négatif.$$),
        'example', jsonb_build_object('statement', $$Pourquoi l'absence d'insuline provoque-t-elle un diabète ?$$, 'solution', $$Parce que sans insuline, le glucose présent dans le sang ne peut plus être stocké par le foie, les muscles et les tissus adipeux ; il s'accumule alors dans le sang, provoquant une hyperglycémie durable caractéristique du diabète.$$),
        'fixation', jsonb_build_object('question', $$Quelle hormone est libérée en cas d'hyperglycémie, et quel est son effet ?$$, 'solution', $$L'insuline, produite par les cellules β du pancréas, est libérée en cas d'hyperglycémie ; elle stimule le stockage du glucose dans le foie, les muscles et les tissus adipeux, ce qui fait baisser la glycémie.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un homme en bonne santé, à jeun, absorbe 50 grammes de glucose puis subit une prise de sang toutes les 30 minutes. Résultats de la glycémie (g/l) : 0,95 (0mn) ; 1,55 (30mn) ; 1,35 (60mn) ; 0,95 (90mn) ; 0,80 (120mn) ; 0,85 (150mn) ; 0,90 (180mn) ; 0,90 (210mn).$$,
      'questions', array[
        $$Cite les lieux de stockage des nutriments dans l'organisme.$$,
        $$Analyse l'évolution de la glycémie au cours des 210 minutes de l'expérience.$$,
        $$Déduis le comportement du pancréas vis-à-vis de la glycémie au cours de cette expérience (quelle hormone agit à quel moment).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Sous quelle forme les tissus adipeux stockent-ils les acides gras et le glycérol ?$$,
      'hint', $$C'est le nom des graisses de réserve.$$,
      'expected', $$Sous forme de triglycérides.$$
    ),
    jsonb_build_object(
      'question', $$Quelle hormone est produite par les cellules α des îlots de Langerhans, et quel est son effet sur la glycémie ?$$,
      'hint', $$Elle agit en cas d'hypoglycémie.$$,
      'expected', $$Le glucagon, qui augmente la glycémie (hormone hyperglycémiante) en stimulant la libération du glucose stocké.$$
    ),
    jsonb_build_object(
      'question', $$Qu'observe-t-on sur la glycémie d'un chien après l'ablation totale de son pancréas ?$$,
      'hint', $$C'est l'inverse de l'effet de l'insuline.$$,
      'expected', $$Une augmentation de la glycémie (hyperglycémie).$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la maladie caractérisée par une hyperglycémie durable due à l'absence d'insuline ?$$,
      'hint', $$C'est une maladie chronique très répandue.$$,
      'expected', $$Le diabète.$$
    )
  ),
  now()
);
