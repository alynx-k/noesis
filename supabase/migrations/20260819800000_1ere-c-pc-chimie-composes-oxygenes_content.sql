-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 932: "LEÇON 6: QUELQUES COMPOSES OXYGÈNES"
-- (https://lyc.ecole-ci.org/course/view.php?id=932), resource id 4833.
-- Contenu réécrit à partir du PDF source (fonctions organiques oxygénées :
-- alcools, éthers-oxydes, aldéhydes, cétones, acides carboxyliques, esters ;
-- oxydation ménagée des alcools). Tout le contenu est factuel (chimie
-- organique) : formules générales, règles de nomenclature IUPAC, tableau
-- d'oxydation ménagée et exercices numériques sont repris/adaptés tels
-- quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-composes-oxygenes',
  '1ere',
  'C',
  'physique-chimie',
  $$Quelques composés oxygénés$$,
  4,
  '1ere-c-pc-chimie-petrole-gaz-naturels',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève en classe de 1ère C au Lycée Moderne Tiapani de Dabou échange avec son frère aîné, étudiant en chimie, qui lui apprend l'existence de composés organiques dits oxygénés jouant un rôle très important en chimie. Voulant en savoir davantage, les élèves de la classe décident de connaître les formules générales de quelques composés organiques oxygénés, d'en nommer quelques-uns et d'écrire leurs formules semi-développées.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les alcools$$,
        'body', $$Un alcool est un composé organique dans lequel un groupe hydroxyle -OH est fixé sur un atome de carbone tétragonal, dit carbone fonctionnel. La formule brute générale d'un alcool à chaîne saturée à n atomes de carbone est CnH2n+2O. La nomenclature reprend le nom de l'alcane analogue, dont le « e » final est remplacé par « ol », précédé de l'indice de position du carbone fonctionnel si nécessaire (numéroté au plus bas possible). On distingue trois classes d'alcools selon le nombre de groupes alkyles fixés au carbone fonctionnel : primaire (ex. éthanol), secondaire (ex. propan-2-ol) et tertiaire (ex. 2-méthylpropan-2-ol).$$,
        'highlights', array[$$alcool : groupe -OH, formule CnH2n+2O$$, $$nomenclature : « e » de l'alcane → « ol »$$, $$3 classes : primaire, secondaire, tertiaire$$]::text[],
        'property', jsonb_build_object('label', $$Formule générale$$, 'text', $$Alcools : CnH2n+2O.$$),
        'example', jsonb_build_object('statement', $$Nomme l'alcool CH3-CH2-CH(OH)-CH3.$$, 'solution', $$Butan-2-ol (chaîne de 4 carbones, groupe -OH sur le carbone 2).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la formule brute générale d'un alcool saturé à n atomes de carbone ?$$, 'solution', $$CnH2n+2O.$$)
      ),
      jsonb_build_object(
        'heading', $$Les éthers-oxydes$$,
        'body', $$Les éthers-oxydes sont des composés organiques dans lesquels un atome d'oxygène est directement lié à deux atomes de carbone tétragonaux (formule générale R1-O-R2). Leur formule brute est aussi CnH2n+2O. Leur nom se forme soit en faisant suivre le mot « oxyde » des noms des deux groupes alkyles liés à l'oxygène, cités par ordre alphabétique (ex. oxyde de diéthyle), soit en remplaçant la terminaison « yle » du plus petit groupe alkyle par « oxy », suivi du nom de l'alcane correspondant à l'autre groupe (ex. éthoxyéthane).$$,
        'highlights', array[$$éther-oxyde : R1-O-R2, formule CnH2n+2O$$, $$nom : « oxyde de X et de Y » ou « Xoxy-alcane »$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment nomme-t-on CH3-O-CH2-CH3 selon la seconde méthode de nomenclature ?$$, 'solution', $$Méthoxyéthane.$$)
      ),
      jsonb_build_object(
        'heading', $$Aldéhydes et cétones (composés carbonylés)$$,
        'body', $$Les aldéhydes possèdent le groupe fonctionnel -CHO, porté par un carbone fonctionnel situé en bout de chaîne ; leur formule brute est CnH2nO. Leur nom dérive de l'alcane correspondant en remplaçant le « e » final par « al », la chaîne étant numérotée à partir du carbone fonctionnel. Les cétones possèdent un atome d'oxygène lié par une double liaison à un carbone situé en milieu de chaîne ; leur formule brute est aussi CnH2nO. Leur nom se forme en remplaçant le « e » final de l'alcane analogue par « one », précédé de l'indice de position le plus petit possible du carbone fonctionnel. Aldéhydes et cétones partagent un groupe caractéristique commun, le groupe carbonyle C=O : on les appelle composés carbonylés.$$,
        'highlights', array[$$aldéhyde : -CHO en bout de chaîne, formule CnH2nO, suffixe « al »$$, $$cétone : C=O en milieu de chaîne, formule CnH2nO, suffixe « one »$$, $$groupe carbonyle C=O commun aux deux familles$$]::text[],
        'example', jsonb_build_object('statement', $$Nomme le composé CH3-CH2-CH2-CHO.$$, 'solution', $$Butanal (chaîne de 4 carbones, groupe -CHO en bout de chaîne).$$),
        'fixation', jsonb_build_object('question', $$Quelle différence de position distingue le carbone fonctionnel d'un aldéhyde de celui d'une cétone ?$$, 'solution', $$Dans un aldéhyde, le carbone fonctionnel est en bout de chaîne ; dans une cétone, il est en milieu de chaîne.$$)
      ),
      jsonb_build_object(
        'heading', $$Acides carboxyliques et esters$$,
        'body', $$Les acides carboxyliques comportent le groupe carboxyle -COOH (formule générale R-COOH) ; leur formule brute saturée est CnH2nO2. Leur nom s'obtient en remplaçant le « e » final de l'alcane correspondant par « oïque », précédé du mot « acide » (numérotation à partir du carbone du groupe carboxyle). Les esters comportent le groupe fonctionnel -CO-O-C- (formule brute CnH2nO2) : leur nom comporte un premier terme en « oate », dérivant de l'acide carboxylique, et un second terme nommant le groupe alkyle lié au deuxième atome d'oxygène (ex. éthanoate de méthyle).$$,
        'highlights', array[$$acide carboxylique : -COOH, formule CnH2nO2, suffixe « oïque »$$, $$ester : -CO-O-C-, formule CnH2nO2, nom en deux termes « ...oate de ... »$$]::text[],
        'example', jsonb_build_object('statement', $$Nomme l'ester CH3-CH2-CO-O-CH3.$$, 'solution', $$Propanoate de méthyle.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la formule brute générale des acides carboxyliques et des esters à chaîne saturée ?$$, 'solution', $$CnH2nO2, pour les deux familles.$$)
      ),
      jsonb_build_object(
        'heading', $$Oxydation ménagée des alcools et intérêt des composés oxygénés$$,
        'body', $$L'oxydation ménagée d'un alcool conserve le squelette carboné de la molécule (contrairement à une combustion). Elle dépend de la classe de l'alcool : un alcool primaire s'oxyde en aldéhyde, qui peut lui-même s'oxyder en acide carboxylique ; un alcool secondaire s'oxyde en cétone (qui ne s'oxyde pas davantage) ; un alcool tertiaire ne subit pas d'oxydation ménagée. Ces composés oxygénés ont de nombreux usages : alcools et éthers-oxydes comme solvants et désinfectants (l'éthanol sert aussi de biocarburant) ; aldéhydes et cétones comme solvants en parfumerie (le formol sert à la conservation des corps) ; acides carboxyliques dans l'alimentation (acide citrique du citron, acide éthanoïque du vinaigre) ; esters en parfumerie et savonnerie.$$,
        'highlights', array[$$alcool primaire → aldéhyde → acide carboxylique$$, $$alcool secondaire → cétone (pas d'oxydation ultérieure)$$, $$alcool tertiaire : pas d'oxydation ménagée$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel type de composé obtient-on par oxydation ménagée d'un alcool secondaire ?$$, 'solution', $$Une cétone, qui ne peut pas être oxydée davantage.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le professeur donne à ton groupe les informations suivantes sur un composé organique présent au laboratoire de chimie : sa formule brute est de la forme CxH2xO2 ; il contient en masse 36,36% d'oxygène ; il a un atome de carbone fonctionnel fixé à un seul atome d'hydrogène ; sa chaîne carbonée est ramifiée. On donne les masses molaires atomiques (en g/mol) : M(C) = 12 ; M(H) = 1 ; M(O) = 16.$$,
      'questions', array[
        $$Rappelle la formule générale brute des acides carboxyliques ou des esters.$$,
        $$Écris la masse molaire M du composé en fonction de x.$$,
        $$Détermine la valeur de x, écris la formule brute du composé, puis déduis-en sa formule semi-développée et son nom.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel groupe fonctionnel caractérise les alcools ?$$,
      'hint', $$C'est un groupe composé d'un oxygène et d'un hydrogène.$$,
      'expected', $$Le groupe hydroxyle -OH.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule brute générale des aldéhydes et des cétones ?$$,
      'hint', $$Ces deux familles partagent la même formule brute.$$,
      'expected', $$CnH2nO pour les deux familles.$$
    ),
    jsonb_build_object(
      'question', $$Un composé de formule brute C3H8O peut appartenir à deux familles chimiques différentes. Lesquelles, et donne un exemple de chacune ?$$,
      'hint', $$Pense aux alcools et aux éthers-oxydes.$$,
      'expected', $$Un alcool (ex. propan-1-ol, CH3-CH2-CH2-OH) ou un éther-oxyde (ex. méthoxyéthane, CH3-O-CH2-CH3).$$
    ),
    jsonb_build_object(
      'question', $$Que produit l'oxydation ménagée d'un alcool primaire ?$$,
      'hint', $$Il existe deux étapes successives possibles.$$,
      'expected', $$D'abord un aldéhyde, qui peut ensuite être oxydé à son tour en acide carboxylique.$$
    )
  ),
  now()
);
