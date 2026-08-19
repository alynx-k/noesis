-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 933: "LECON 5: PETROLE ET GAZ NATURELS"
-- (https://lyc.ecole-ci.org/course/view.php?id=933), resource id 4845.
-- Contenu réécrit à partir du PDF source (origine, raffinage, produits
-- dérivés, impact environnemental). Contenu factuel de chimie/géologie
-- et exercices numériques (craquage du butane) repris/adaptés tels quels.
-- NB : la leçon 4 "LE BENZÈNE" (Moodle course id=1299) a été vérifiée et
-- ne contient aucune ressource déposée (page de cours entièrement vide,
-- aucun lien de fichier) ; elle a donc été sautée, conformément à la
-- politique déjà appliquée face aux lacunes structurelles confirmées de
-- la plateforme source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-petrole-gaz-naturels',
  '1ere',
  'C',
  'physique-chimie',
  $$Pétrole et gaz naturels$$,
  3,
  '1ere-c-pc-chimie-hydrocarbures-insatures-alcenes-alcynes',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le professeur de physique-chimie demande à ses élèves de 1ère C de faire un exposé sur le thème « pétrole et gaz naturels ». Chaque groupe entreprend des recherches sur le fractionnement, le craquage et le reformage du pétrole brut, afin de montrer l'importance de quelques produits dérivés et leur impact sur l'environnement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Origine et composition$$,
        'body', $$Le pétrole et les gaz naturels se forment par décomposition de matières organiques animales ou végétales déposées au fond des océans, mers et lacs. Ces sédiments s'enfouissent progressivement, et à l'abri de l'oxygène, sous l'action de bactéries, se décomposent très lentement en hydrocarbures : à l'état gazeux (gaz naturels) ou liquide (pétrole). Le pétrole est un mélange essentiellement composé d'alcanes, souvent d'hydrocarbures aromatiques, mais rarement d'hydrocarbures insaturés. Les gaz naturels sont constitués à 90% de méthane.$$,
        'highlights', array[$$formation : décomposition lente de matières organiques, à l'abri de l'oxygène$$, $$pétrole ≈ alcanes + aromatiques ; gaz naturel ≈ 90% méthane$$]::text[],
        'fixation', jsonb_build_object('question', $$De quel composé le gaz naturel est-il constitué à 90% ?$$, 'solution', $$Le méthane.$$)
      ),
      jsonb_build_object(
        'heading', $$Le raffinage : fractionnement, craquage et reformage$$,
        'body', $$Le pétrole brut est un mélange inutilisable tel quel ; l'ensemble des opérations qui le transforment s'appelle le raffinage. Le fractionnement (ou distillation fractionnée) sépare les constituants du pétrole selon leur température d'ébullition, dans une « colonne à plateaux ». Le craquage transforme des hydrocarbures lourds en hydrocarbures légers. Le reformage modifie la structure d'un hydrocarbure sans changer son nombre d'atomes de carbone, pratiqué sur les alcanes des essences légères pour améliorer leur indice d'octane (résistance à l'autoallumage sans intervention de la bougie).$$,
        'highlights', array[$$raffinage = fractionnement + craquage + reformage$$, $$fractionnement : séparation par température d'ébullition (colonne à plateaux)$$, $$reformage : améliore l'indice d'octane$$]::text[],
        'example', jsonb_build_object('statement', $$Que mesure l'indice d'octane d'un carburant ?$$, 'solution', $$La résistance du carburant à l'autoallumage, c'est-à-dire sa capacité à ne pas s'enflammer sans l'intervention de la bougie.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre le craquage et le reformage ?$$, 'solution', $$Le craquage transforme des hydrocarbures lourds en hydrocarbures légers (en réduisant le nombre de carbones), tandis que le reformage modifie la structure d'un hydrocarbure sans changer son nombre d'atomes de carbone.$$)
      ),
      jsonb_build_object(
        'heading', $$Utilité des produits dérivés et impact environnemental$$,
        'body', $$Les produits dérivés du pétrole (carburants, solvants, bitumes, huiles de graissage) servent au fonctionnement des moteurs, à la fabrication de médicaments, de produits agrochimiques, de matières plastiques, de détergents et de fibres synthétiques. Cependant, le mauvais transport des produits pétroliers entraîne souvent des pollutions écologiques, telles que des marées noires.$$,
        'highlights', array[$$produits dérivés : carburants, plastiques, détergents, médicaments...$$, $$impact environnemental : marées noires (mauvais transport)$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un exemple de pollution écologique liée au transport des produits pétroliers.$$, 'solution', $$Une marée noire.$$)
      ),
      jsonb_build_object(
        'heading', $$Application : le craquage du butane$$,
        'body', $$Le craquage du butane (C4H10) peut donner lieu à deux réactions : C4H10 → C4H8 (méthylpropène) + H2, ou C4H10 → C3H6 (propène) + CH4 (méthane). Pour déterminer le pourcentage en masse de chaque produit obtenu, on combine les proportions de chaque réaction (par exemple 60% pour la première, 40% pour la seconde) avec les masses molaires des produits formés.$$,
        'highlights', array[$$C4H10 → C4H8 + H2 (une voie)$$, $$C4H10 → C3H6 + CH4 (une autre voie)$$]::text[],
        'example', jsonb_build_object('statement', $$Si la réaction C4H10 → C4H8 + H2 représente 60% du craquage, quelle masse molaire faut-il utiliser pour calculer le pourcentage en masse du méthylpropène (C4H8, M=56 g/mol) obtenu, sur un total de masse molaire 58 g/mol ?$$, 'solution', $$Pourcentage en masse = (56 × 60) / 58 ≈ 57,93%.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux produits formés lors du craquage du butane selon la seconde réaction ?$$, 'solution', $$Le propène (C3H6) et le méthane (CH4).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un documentaire scientifique explique que « les pétroles sont des huiles naturelles composées d'hydrocarbures et souvent de composés soufrés, oxygénés et azotés. Ils sont donc généralement inutilisables tels qu'ils se présentent à la sortie des puits. Pour ce faire, les pétroles bruts sont raffinés avant d'être mis à la disposition des utilisateurs. »$$,
      'questions', array[
        $$Indique trois opérations effectuées au cours du raffinage du pétrole brut.$$,
        $$Cite trois produits dérivés du pétrole.$$,
        $$Montre l'importance de ces produits pour les consommateurs.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que le raffinage du pétrole ?$$,
      'hint', $$C'est un ensemble d'opérations, pas une seule.$$,
      'expected', $$L'ensemble des opérations (fractionnement, craquage, reformage) qui transforment le pétrole brut, inutilisable tel quel, en produits recherchés.$$
    ),
    jsonb_build_object(
      'question', $$Dans quelle tour s'effectue le fractionnement du pétrole ?$$,
      'hint', $$Elle sépare les constituants selon leur température d'ébullition.$$,
      'expected', $$Une « colonne à plateaux ».$$
    ),
    jsonb_build_object(
      'question', $$Sur quel type de composés le reformage est-il pratiqué, et dans quel but ?$$,
      'hint', $$Cela concerne les essences légères.$$,
      'expected', $$Sur les alcanes des essences légères, afin d'améliorer leur indice d'octane.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux domaines d'utilisation des produits dérivés du pétrole.$$,
      'hint', $$Pense aux transports, à la santé ou à l'industrie.$$,
      'expected', $$Deux parmi : le fonctionnement des moteurs (carburants), la fabrication de médicaments, de matières plastiques, de détergents, de fibres synthétiques.$$
    )
  ),
  now()
);
