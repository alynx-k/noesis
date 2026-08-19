-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- SVT, categoryid=133.
-- Moodle course id 935: "SVT 1ère C_L6_La synthèse des protéines"
-- (https://lyc.ecole-ci.org/course/view.php?id=935), resource id 4869.
-- Contenu réécrit à partir du PDF source (acteurs de la synthèse
-- protéique, code génétique, transcription, traduction). Tout le contenu
-- est factuel (biologie moléculaire) : structures, code génétique et
-- exercices sont repris/adaptés tels quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-svt-synthese-proteines',
  '1ere',
  'C',
  'svt',
  $$La synthèse des protéines$$,
  5,
  '1ere-c-svt-fecondation-mammiferes',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant le cours sur la synthèse des protéines, le professeur de SVT projette une séquence vidéo montrant la synthèse des protéines dans une cellule. Les élèves découvrent que les protéines ne se forment pas de façon aléatoire. Impressionnés par ce phénomène, ils veulent bien le comprendre : ils cherchent alors à identifier les acteurs de la synthèse des protéines et à expliquer le mécanisme de la biosynthèse des protéines.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les acteurs de la synthèse des protéines$$,
        'body', $$La synthèse des protéines fait intervenir l'ADN, l'ARN et les ribosomes. L'ADN est le support de l'information génétique : il sert de matrice pour la copie de l'information. L'ARN messager (ARNm) est une copie de l'information portée par l'ADN, permettant son passage du noyau au cytoplasme ; contrairement à l'ADN, il est monocaténaire (une seule chaîne), son sucre est le ribose, et l'uracile y remplace la thymine. L'ARN de transfert (ARNt) transporte chaque acide aminé jusqu'à l'endroit qui lui convient. Les ribosomes sont de petits granules cytoplasmiques qui se déplacent le long de l'ARNm et jouent le rôle d'« ateliers » de fabrication des protéines.$$,
        'highlights', array[$$ADN : support de l'information génétique (matrice)$$, $$ARNm : copie monocaténaire de l'ADN (ribose, uracile), transporte l'information du noyau au cytoplasme$$, $$ARNt : transporte les acides aminés ; ribosome : « atelier » de fabrication$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle différence chimique distingue l'ARN de l'ADN au niveau des bases azotées ?$$, 'solution', $$Dans l'ARN, l'uracile remplace la thymine que l'on trouve dans l'ADN.$$)
      ),
      jsonb_build_object(
        'heading', $$Le code génétique$$,
        'body', $$Le code génétique est le système de correspondance entre la séquence de nucléotides de l'ARNm et la séquence des acides aminés (une vingtaine) nécessaires à la synthèse protéique. Une combinaison de trois bases azotées, appelée codon, désigne un acide aminé (64 codons possibles, à partir de 4 bases). Toute synthèse protéique débute par le même codon, AUG (codon initiateur), qui désigne la méthionine. La majorité des acides aminés est désignée par plusieurs codons différents : on dit que le code génétique est redondant. Trois codons (UAA, UAG, UGA) ne correspondent à aucun acide aminé : ce sont les codons stop (ou non-sens), qui marquent la fin du message génétique.$$,
        'highlights', array[$$codon = triplet de bases de l'ARNm correspondant à un acide aminé$$, $$AUG = codon initiateur (méthionine) ; UAA/UAG/UGA = codons stop$$, $$code redondant : plusieurs codons peuvent désigner le même acide aminé$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie l'expression « le code génétique est redondant » ?$$, 'solution', $$Que la plupart des acides aminés sont désignés par plusieurs codons différents (codons synonymes).$$)
      ),
      jsonb_build_object(
        'heading', $$La transcription$$,
        'body', $$La transcription est la première étape de la biosynthèse des protéines : elle se déroule dans le noyau et aboutit à la formation de l'ARNm à partir de l'ADN. Sous l'action de l'ARN polymérase, la molécule d'ADN s'ouvre localement, et l'enzyme se déplace le long du brin d'ADN servant de matrice (le brin codant ou transcrit), en incorporant les nucléotides libres complémentaires. On dit que l'ADN est transcrit en ARNm. L'ARNm ainsi formé sort ensuite du noyau vers le cytoplasme.$$,
        'highlights', array[$$transcription : dans le noyau, ADN → ARNm, catalysée par l'ARN polymérase$$, $$brin codant (transcrit) sert de matrice ; complémentarité des bases$$]::text[],
        'example', jsonb_build_object('statement', $$Le brin transcrit de l'ADN porte la séquence AGCTACGGATAAGCTTGA. Quelle sera la séquence de l'ARNm correspondant (rappel : U remplace T) ?$$, 'solution', $$UCGAUGCCUAUUCGAACU (chaque base de l'ADN est remplacée par sa complémentaire dans l'ARNm, avec U à la place de T).$$),
        'fixation', jsonb_build_object('question', $$Dans quel compartiment de la cellule se déroule la transcription ?$$, 'solution', $$Dans le noyau.$$)
      ),
      jsonb_build_object(
        'heading', $$La traduction$$,
        'body', $$La traduction a lieu dans le cytoplasme et se déroule en trois étapes. À l'initiation, la petite sous-unité du ribosome et un ARNt portant la méthionine (dont l'anticodon est complémentaire au codon initiateur AUG) se positionnent sur l'ARNm. À l'élongation, un nouvel ARNt se place au site A du ribosome, en face du codon suivant ; une liaison peptidique s'établit entre les deux acides aminés, puis le ribosome se déplace d'un codon, et le processus se répète. À la terminaison, lorsque le ribosome rencontre un codon stop, le complexe se dissocie et la chaîne polypeptidique (protéine) achevée est libérée.$$,
        'highlights', array[$$traduction : dans le cytoplasme, 3 étapes (initiation, élongation, terminaison)$$, $$élongation : ARNt successifs, liaisons peptidiques, déplacement du ribosome$$, $$codon stop → dissociation du complexe → libération de la protéine$$]::text[],
        'fixation', jsonb_build_object('question', $$Que se passe-t-il lorsque le ribosome rencontre un codon stop lors de la traduction ?$$, 'solution', $$Le complexe ARNm-ribosome-ARNt se dissocie, et la chaîne polypeptidique (protéine) achevée est libérée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'élèves cherche à reconstituer les chaînes polypeptidiques de deux hormones humaines très proches : l'ocytocine et la vasopressine. Ils disposent des portions de brin non codant de l'ADN pour chacune : ocytocine (TGC TAC ATC CAG AAC TGC CCC CTG GGC), vasopressine (TGC TAC TTC CAG AAC TGC CCA AGA GGA), ainsi que du tableau du code génétique.$$,
      'questions', array[
        $$Élabore le brin codant de chaque portion d'ADN (ocytocine et vasopressine).$$,
        $$Détermine les deux séquences d'ARNm correspondantes, puis les deux chaînes polypeptidiques (séquences d'acides aminés) obtenues.$$,
        $$Explique en quoi les deux chaînes polypeptidiques obtenues diffèrent l'une de l'autre.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les trois principaux acteurs (molécules/organites) de la synthèse des protéines ?$$,
      'hint', $$Il y a une molécule support, une molécule messagère/transporteuse, et un organite.$$,
      'expected', $$L'ADN, l'ARN (messager et de transfert), et le ribosome.$$
    ),
    jsonb_build_object(
      'question', $$Quel acide aminé est toujours codé par le codon initiateur AUG ?$$,
      'hint', $$C'est le premier acide aminé de toute chaîne en cours de synthèse.$$,
      'expected', $$La méthionine.$$
    ),
    jsonb_build_object(
      'question', $$Quelle enzyme catalyse la transcription de l'ADN en ARNm ?$$,
      'hint', $$Son nom indique qu'elle « polymérise » l'ARN.$$,
      'expected', $$L'ARN polymérase.$$
    ),
    jsonb_build_object(
      'question', $$À quel site du ribosome le premier ARNt (porteur de la méthionine) se positionne-t-il lors de l'initiation ?$$,
      'hint', $$Il y a deux sites, P et A.$$,
      'expected', $$Au site P.$$
    )
  ),
  now()
);
