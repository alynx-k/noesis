-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- SVT, categoryid=125.
-- Moodle course id 897: "SVT 1ère A_L3_Les Anomalies chromosomiques"
-- (https://lyc.ecole-ci.org/course/view.php?id=897), resource id 4413.
-- Contenu réécrit à partir du PDF source (caryotype, autosomes/gonosomes,
-- syndromes de Down/Turner/Klinefelter, origine méiotique des anomalies).
-- Faits scientifiques réels (formules chromosomiques, noms des syndromes,
-- mécanisme de non-disjonction méiotique) repris tels quels ; explications
-- reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-svt-anomalies-chromosomiques',
  '1ere',
  'A',
  'svt',
  $$Les anomalies chromosomiques$$,
  3,
  '1ere-a-svt-effets-drogues-comportement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Soucieuse du manque de réactivité de son fœtus de six mois, la mère d'un élève de 1ère A exprime ses inquiétudes à son gynécologue. Après amniocentèse, le caryotype du fœtus révèle la présence de trois chromosomes de la paire 21, caractéristique du mongolisme. La classe décide d'identifier les maladies liées aux anomalies chromosomiques et de déterminer leur origine au cours de la reproduction.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le caryotype humain normal$$,
        'body', $$Le caryotype est l'ensemble des chromosomes d'un individu, disposés par paire sur une surface plane par ordre décroissant de taille. L'être humain possède 46 chromosomes, soit 23 paires : 22 paires identiques dans les deux sexes, appelées autosomes, et une 23ème paire appelée gonosomes (ou hétérochromosomes), qui détermine le sexe — XY chez l'homme, XX chez la femme. La formule chromosomique normale est donc 44 autosomes + XY (homme) ou 44 autosomes + XX (femme).$$,
        'highlights', array[$$46 chromosomes = 23 paires$$, $$22 paires d'autosomes + 1 paire de gonosomes (XY/XX)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la formule chromosomique normale d'un homme sain ?$$, 'solution', $$44 autosomes + XY (soit 46 chromosomes au total).$$)
      ),
      jsonb_build_object(
        'heading', $$Les principales anomalies chromosomiques$$,
        'body', $$Tout changement dans le nombre ou la structure des chromosomes provoque une maladie génétique. Le syndrome de Down (ou trisomie 21, mongolisme) résulte de la présence de trois chromosomes 21 au lieu de deux (47 chromosomes au total). Le syndrome de Turner résulte de la présence d'un seul chromosome X (formule 44 + XO). Le syndrome de Klinefelter résulte de la présence de trois chromosomes sexuels XXY. La maladie du cri du chat résulte de la délétion (perte) du bras court du chromosome 5.$$,
        'highlights', array[$$Down (trisomie 21) : 47 chromosomes dont 3-21$$, $$Turner : 44 + XO$$, $$Klinefelter : XXY$$]::text[],
        'property', jsonb_build_object('label', $$Récapitulatif$$, 'text', $$Trisomie 21 = 47 chromosomes (3 chromosomes 21). Turner = 44 ; XO (un seul X). Klinefelter = présence de 3 chromosomes sexuels XXY.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la formule chromosomique caractéristique du syndrome de Turner ?$$, 'solution', $$44 autosomes ; XO (un seul chromosome sexuel X, sans second gonosome).$$)
      ),
      jsonb_build_object(
        'heading', $$L'origine méiotique des anomalies chromosomiques$$,
        'body', $$Les anomalies chromosomiques se produisent lors de la méiose, la division cellulaire qui forme les gamètes. Normalement, chaque paire de chromosomes homologues (bivalent) se sépare pour donner des gamètes à nombre haploïde de chromosomes. Mais parfois, un bivalent entier migre vers un seul pôle cellulaire au lieu de se séparer (non-disjonction) : cela produit des gamètes anormaux, l'un avec un chromosome en trop, l'autre avec un chromosome en moins. Lors de la fécondation, si un gamète anormal (mâle ou femelle) s'unit à un gamète normal, l'individu résultant présente une anomalie chromosomique ; certaines anomalies, incompatibles avec la vie, provoquent un avortement spontané.$$,
        'highlights', array[$$non-disjonction : un bivalent migre entièrement vers un pôle$$, $$gamète anormal + gamète normal → individu malade$$]::text[],
        'example', jsonb_build_object('statement', $$Comment se forme un œuf trisomique 21 (47 chromosomes) lors de la fécondation ?$$, 'solution', $$Si la paire de chromosomes 21 ne se sépare pas correctement pendant la méiose (non-disjonction), un gamète anormal se retrouve avec deux chromosomes 21 au lieu d'un seul. Uni à un gamète normal (avec un seul chromosome 21) lors de la fécondation, il forme un œuf à 47 chromosomes, dont 3 chromosomes 21.$$),
        'fixation', jsonb_build_object('question', $$Que se passe-t-il, au niveau de la méiose, lorsqu'un bivalent migre entièrement vers un seul pôle cellulaire au lieu de se séparer ?$$, 'solution', $$Cela produit des gamètes anormaux : l'un avec un chromosome supplémentaire, l'autre avec un chromosome manquant, par rapport au nombre haploïde normal.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$La tante d'une élève de 1ère A accuse sa coépouse d'avoir ensorcelé son fils, incapable de marcher à quatre pattes à deux ans et présentant des traits du mongolisme, sa mère ayant 48 ans. Un tableau montre que le pourcentage de naissances d'enfants atteints de trisomie 21 augmente avec l'âge de la mère (de 0,01% à 18 ans jusqu'à 0,4% à 53 ans).$$,
      'questions', array[
        $$Donne la formule chromosomique d'un sujet atteint de trisomie 21.$$,
        $$Analyse la relation entre l'âge de la mère et le pourcentage de naissances d'enfants trisomiques.$$,
        $$Explique scientifiquement l'apparition de cet enfant, puis conclus sur les accusations portées par la tante.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de chromosomes possède une cellule humaine normale ?$$,
      'hint', $$C'est 23 paires.$$,
      'expected', $$46 chromosomes.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la paire de chromosomes qui détermine le sexe d'un individu ?$$,
      'hint', $$C'est la 23ème paire.$$,
      'expected', $$Les gonosomes (ou hétérochromosomes).$$
    ),
    jsonb_build_object(
      'question', $$Quel syndrome résulte de la présence de trois chromosomes sexuels XXY ?$$,
      'hint', $$Il touche les individus de sexe masculin.$$,
      'expected', $$Le syndrome de Klinefelter.$$
    ),
    jsonb_build_object(
      'question', $$Quel phénomène, survenant lors de la méiose, est à l'origine des anomalies chromosomiques ?$$,
      'hint', $$Un bivalent ne se sépare pas normalement.$$,
      'expected', $$La non-disjonction (un bivalent migre entièrement vers un seul pôle cellulaire au lieu de se séparer).$$
    )
  ),
  now()
);
