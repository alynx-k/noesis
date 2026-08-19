-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- SVT, categoryid=133.
-- Moodle course id 826: "SVT 1ère C_L8_La photosynthèse"
-- (https://lyc.ecole-ci.org/course/view.php?id=826), resource id 3561.
-- Contenu réécrit à partir du PDF source (facteurs de la photosynthèse,
-- chloroplaste et chlorophylle, phase lumineuse, phase sombre/cycle de
-- Calvin, importance dans la biosphère). Tout le contenu est factuel
-- (biologie végétale) : courbes expérimentales, mécanismes biochimiques et
-- exercices sont repris/adaptés tels quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-svt-photosynthese',
  '1ere',
  'C',
  'svt',
  $$La photosynthèse$$,
  7,
  '1ere-c-svt-transmission-caractere-hereditaire',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves d'une classe de 1ère C organisent une sortie dans un jardin botanique avec leur professeur de SVT. Ils observent qu'à l'ombre des gros arbres, de jeunes plantes sont chétives, tandis que dans la clairière, des plantes de la même espèce sont robustes, avec de larges feuilles vert sombre et des fruits. Le professeur leur explique que les plantes de la clairière produisent plus de matière organique. Pour mieux comprendre ce phénomène, les élèves décident de déterminer les conditions de la production de matière organique et d'expliquer le mécanisme de la photosynthèse, afin d'en dégager l'importance dans la biosphère.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les facteurs qui influencent la photosynthèse$$,
        'body', $$Lorsqu'on mesure le dégagement d'oxygène d'une plante en fonction de l'éclairement, l'intensité photosynthétique est négative dans l'obscurité (respiration seule), nulle au point de compensation lumineux (où la photosynthèse compense exactement la respiration), puis augmente avec la lumière jusqu'à un maximum, atteint plus tôt chez les plantes d'ombre (sciaphiles, comme la fougère, maximum vers 20% d'éclairement) que chez les plantes de lumière (héliophiles, comme la tomate, maximum vers 70%). Le dioxyde de carbone est un autre facteur limitant : l'intensité photosynthétique augmente avec sa concentration jusqu'à une saturation des structures photosynthétiques. La température influence aussi fortement la photosynthèse : nulle à 0°C (enzymes inhibées), elle croît jusqu'à un optimum vers 30°C, puis chute jusqu'à s'annuler vers 45°C (enzymes dénaturées par la chaleur).$$,
        'highlights', array[$$point de compensation lumineux : photosynthèse = respiration$$, $$plante héliophile (tomate) : optimum à forte lumière ; sciaphile (fougère) : optimum à faible lumière$$, $$température optimale ≈ 30°C ; dénaturation des enzymes ≈ 45°C$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on le « point de compensation lumineux » ?$$, 'solution', $$Le point où la quantité de dioxygène produite par la photosynthèse est exactement égale à la quantité consommée par la respiration, rendant l'intensité photosynthétique apparente nulle.$$)
      ),
      jsonb_build_object(
        'heading', $$Le chloroplaste et la chlorophylle$$,
        'body', $$Une expérience sur une feuille panachée (partiellement verte, partiellement blanche), éclairée puis décolorée à l'alcool bouillant et testée à l'eau iodée, montre que seule la partie verte se colore en bleu violacé (présence d'amidon), la partie non verte restant incolore. Cela prouve que la chlorophylle est nécessaire à la production de matière organique. La chlorophylle est logée dans les chloroplastes, plus précisément dans leurs membranes internes appelées thylakoïdes. La chromatographie permet de séparer les pigments de la chlorophylle brute : la chlorophylle a et la chlorophylle b (vertes), les xanthophylles (jaunes) et le carotène (jaune orangé).$$,
        'highlights', array[$$feuille panachée : seule la partie verte (contenant chlorophylle) produit de l'amidon$$, $$chlorophylle logée dans les thylakoïdes du chloroplaste$$, $$chromatographie : chlorophylle a, chlorophylle b, xanthophylles, carotène$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la partie blanche d'une feuille panachée ne se colore-t-elle pas en bleu violacé au test à l'eau iodée ?$$, 'solution', $$Parce qu'elle ne contient pas de chlorophylle et ne peut donc pas réaliser la photosynthèse ni produire d'amidon.$$)
      ),
      jsonb_build_object(
        'heading', $$La phase lumineuse de la photosynthèse$$,
        'body', $$La phase lumineuse se déroule dans les membranes des thylakoïdes. Sous l'effet de l'énergie lumineuse, la chlorophylle est excitée et libère des électrons (devenant chlorophylle oxydée) ; ces électrons sont pris en charge par la chaîne photosynthétique. La chlorophylle oxydée récupère des électrons issus de la photolyse (décomposition) de l'eau, qui libère aussi du dioxygène : H2O → 2H⁺ + ½O2 + 2e⁻. Le transport des électrons le long de la chaîne photosynthétique permet la transformation de l'ADP en ATP (énergie chimique disponible), et finalement la réduction d'un transporteur final.$$,
        'highlights', array[$$phase lumineuse : dans les thylakoïdes$$, $$photolyse de l'eau : H2O → 2H⁺ + ½O2 + 2e⁻ (libération d'O2)$$, $$production d'ATP (énergie chimique) via la chaîne photosynthétique$$]::text[],
        'fixation', jsonb_build_object('question', $$D'où provient le dioxygène libéré lors de la photosynthèse ?$$, 'solution', $$De la photolyse (décomposition) de l'eau, qui a lieu pendant la phase lumineuse.$$)
      ),
      jsonb_build_object(
        'heading', $$La phase sombre (cycle de Calvin) et l'importance de la photosynthèse$$,
        'body', $$La phase sombre (ou phase d'assimilation) ne nécessite pas de lumière, mais requiert du CO2 et l'énergie chimique (ATP) produite par la phase lumineuse. Le CO2 se fixe sur un sucre en C5 (le ribulose diphosphate), formant un composé instable en C6 qui se scinde en deux molécules de trioses (acide phosphoglycérique, APG). Ces trioses régénèrent le ribulose diphosphate et servent à fabriquer glucides, lipides et protides : c'est le cycle de Calvin. L'équation-bilan globale de la photosynthèse est : 6CO2 + 6H2O →(énergie lumineuse, chlorophylle) C6H12O6 + 6O2. La photosynthèse est essentielle à la biosphère : la matière organique produite nourrit les êtres vivants, l'oxygène dégagé permet la respiration, et l'absorption du CO2 par les plantes purifie l'air.$$,
        'highlights', array[$$phase sombre : CO2 + Rudip (C5) → cycle de Calvin → glucides, lipides, protides$$, $$équation-bilan : 6CO2 + 6H2O → C6H12O6 + 6O2$$, $$importance : nourriture, oxygène, purification de l'air (absorption du CO2)$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la phase sombre peut-elle se dérouler même la nuit, contrairement à la phase lumineuse ?$$, 'solution', $$Parce qu'elle n'utilise pas directement la lumière, mais l'énergie chimique (ATP) déjà produite par la phase lumineuse, ainsi que du CO2, indépendamment de la présence de lumière.$$),
        'fixation', jsonb_build_object('question', $$Quel est le nom du cycle de réactions qui se déroule pendant la phase sombre de la photosynthèse ?$$, 'solution', $$Le cycle de Calvin.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève réalise une expérience relative à l'influence de la lumière sur la production de matière organique : il utilise une feuille de haricot exposée à la lumière pendant plusieurs heures, puis plongée dans l'eau bouillante, dans l'alcool bouillant, rincée à l'eau pure, et enfin mise en contact avec de l'eau iodée. La feuille se colore en bleu violacé.$$,
      'questions', array[
        $$Nomme le phénomène de production de la matière organique par la plante mis en évidence par cette expérience.$$,
        $$Interprète la coloration bleu violacé de la feuille.$$,
        $$Déduis trois importances de la photosynthèse dans la biosphère.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Une plante héliophile et une plante sciaphile atteignent-elles leur maximum photosynthétique au même niveau d'éclairement ?$$,
      'hint', $$L'une préfère l'ombre, l'autre le plein soleil.$$,
      'expected', $$Non : la plante sciaphile (d'ombre) atteint son maximum à un éclairement plus faible que la plante héliophile (de lumière).$$
    ),
    jsonb_build_object(
      'question', $$Dans quelle structure cellulaire la chlorophylle est-elle localisée ?$$,
      'hint', $$C'est un organite spécifique aux cellules végétales chlorophylliennes.$$,
      'expected', $$Le chloroplaste (plus précisément dans les membranes des thylakoïdes).$$
    ),
    jsonb_build_object(
      'question', $$Quelle réaction se produit lors de la photolyse de l'eau, et quel gaz est libéré ?$$,
      'hint', $$C'est la source du dioxygène atmosphérique produit par les plantes.$$,
      'expected', $$L'eau est décomposée (H2O → 2H⁺ + ½O2 + 2e⁻), ce qui libère du dioxygène (O2).$$
    ),
    jsonb_build_object(
      'question', $$Écris l'équation-bilan globale de la photosynthèse.$$,
      'hint', $$Elle relie CO2, eau, glucose et dioxygène.$$,
      'expected', $$6CO2 + 6H2O → C6H12O6 + 6O2 (en présence d'énergie lumineuse et de chlorophylle).$$
    )
  ),
  now()
);
