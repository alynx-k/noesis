-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3339: "2nde_GEOGRAPHIE_T2_L1: LE MILIEU SUBEQUATORIAL
-- IVOIRIEN" (https://lyc.ecole-ci.org/course/view.php?id=3339)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33307, redirecting
-- to pluginfile "2nde G4-Le milieu subéquatorial ivoirien proposé.pdf".
-- Rewritten/paraphrased from the source PDF (Thème 2, Leçon 1): the natural
-- assets of the subequatorial zone of Côte d'Ivoire (relief, climate,
-- vegetation, soils, subsoil, hydrography), its human assets (fast-growing,
-- young, urbanized population), state support, and its role as the country's
-- main economic hub (dense infrastructure, dominant primary/secondary/
-- tertiary activity). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-geo-milieu-subequatorial-ivoirien',
  '2nde',
  'A',
  'geographie',
  $$Le milieu subéquatorial ivoirien$$,
  4,
  '2nde-a-hg-geo-techniques-representation-terre',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En observant une carte économique de la Côte d'Ivoire lors d'une exposition scolaire, des élèves de seconde remarquent que presque toutes les grandes villes, usines et plantations du pays se trouvent dans sa moitié sud. Ils décident de rechercher pourquoi ce milieu, appelé milieu subéquatorial, concentre autant d'activités économiques.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Un cadre naturel accueillant$$,
        'body', $$Le milieu subéquatorial occupe la moitié sud de la Côte d'Ivoire, de la façade littorale jusqu'à environ le 8e degré de latitude Nord. Son relief, dominé par des plaines littorales et alluviales et des plateaux peu élevés, reste globalement plat et propice à l'installation humaine ; seul l'extrême ouest, prolongement de la dorsale guinéenne, présente un relief montagneux culminant au mont Nimba (1 753 m). Le climat subéquatorial associe des précipitations abondantes (environ 2 000 mm par an) à quatre saisons alternées (deux saisons des pluies, deux saisons sèches) et à une forte humidité. La forêt domine la végétation, sous plusieurs formes (forêt sempervirente au sud-ouest, forêt semi-décidue de transition vers le nord, mangroves littorales), et protège les sols de l'érosion tout en constituant une ressource économique.$$,
        'highlights', array[$$relief plat$$, $$climat subéquatorial$$, $$forêt$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Composante naturelle$$, $$Caractéristique principale$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Relief$$, $$Plaines et plateaux peu élevés, montagnes seulement à l'ouest$$),
            jsonb_build_array($$Climat$$, $$Chaud et humide, environ 2 000 mm de pluie par an$$),
            jsonb_build_array($$Végétation$$, $$Forêt dense (sempervirente, semi-décidue, mangrove)$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Où se trouve le seul relief montagneux notable du milieu subéquatorial ivoirien ?$$, 'solution', $$À l'ouest, prolongement de la dorsale guinéenne, culminant au mont Nimba.$$)
      ),
      jsonb_build_object(
        'heading', $$Des sols, un sous-sol et un réseau hydrographique propices à la mise en valeur$$,
        'body', $$Le milieu subéquatorial est couvert de sols fertiles : les sols ferralitiques, profonds et riches en fer, dominent, tandis que les sols hydromorphes, présents près des cours d'eau et dans les zones marécageuses, se prêtent bien à des cultures variées. Le sous-sol recèle des ressources minières (or, fer, nickel, manganèse) et énergétiques (pétrole au large de Jacqueville, gaz naturel à Lahou), même si seules certaines d'entre elles sont réellement exploitées. Enfin, un réseau hydrographique dense — quatre grands fleuves (Comoé, Bandama, Sassandra, Cavally), un chapelet de lagunes et l'océan Atlantique — favorise l'agriculture irriguée, la pêche, le transport, l'hydroélectricité et le tourisme balnéaire.$$,
        'highlights', array[$$sols ferralitiques$$, $$réseau hydrographique$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la présence de quatre grands fleuves et de nombreuses lagunes est-elle un atout économique pour ce milieu ?$$, 'solution', $$Parce qu'elle permet l'irrigation agricole, la pêche, le transport fluvial, la construction de barrages hydroélectriques et le développement du tourisme balnéaire.$$),
        'fixation', jsonb_build_object('question', $$Quel est le type de sol le plus répandu dans le milieu subéquatorial ivoirien ?$$, 'solution', $$Le sol ferralitique, profond et riche en fer.$$)
      ),
      jsonb_build_object(
        'heading', $$Une population nombreuse, jeune et urbanisée$$,
        'body', $$Le milieu subéquatorial concentre plus des deux tiers de la population ivoirienne. Cette population croît rapidement, sous l'effet d'une natalité élevée, d'une mortalité en baisse et de migrations internes et externes importantes ; elle est aussi majoritairement jeune (plus de la moitié a moins de 20 ans) et composite, mêlant populations autochtones (Krou, Akan, Mandé du Sud, groupes lagunaires) et allogènes venus d'autres régions ou de l'étranger. Cette diversité constitue une réserve de savoir-faire utile au développement régional. La zone est aussi la plus urbanisée du pays : elle regroupe la majorité des villes de plus de 100 000 habitants, dont Abidjan, qui concentre à elle seule une part importante de la population et l'essentiel des activités industrielles et tertiaires nationales.$$,
        'highlights', array[$$population jeune$$, $$forte urbanisation$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que la population du milieu subéquatorial est « composite » ?$$, 'solution', $$Parce qu'elle regroupe à la fois des populations autochtones (Krou, Akan, Mandé du Sud, groupes lagunaires) et des populations venues d'autres régions du pays ou de l'étranger.$$)
      ),
      jsonb_build_object(
        'heading', $$Un appui de l'État et des infrastructures denses$$,
        'body', $$L'État soutient la mise en valeur du milieu subéquatorial par la création de plantations, l'encadrement technique des producteurs ruraux, l'aide à la commercialisation et un code des investissements favorable à l'industrie ; ces actions sont financées par les impôts prélevés sur la population et les entreprises. Cet appui s'accompagne d'infrastructures sociales et économiques particulièrement denses : universités et grandes écoles, plusieurs centres hospitaliers universitaires, réseau routier et ferroviaire, deux grands ports (Abidjan et San-Pédro) et des opérateurs de télécommunication couvrant l'essentiel du territoire.$$,
        'highlights', array[$$appui de l'État$$, $$infrastructures denses$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment l'État finance-t-il ses actions de développement du milieu subéquatorial ?$$, 'solution', $$Grâce aux impôts et taxes prélevés auprès de la population et des opérateurs économiques.$$)
      ),
      jsonb_build_object(
        'heading', $$Le premier pôle économique de la Côte d'Ivoire$$,
        'body', $$Le milieu subéquatorial concentre la quasi-totalité des activités économiques du pays. Dans le secteur primaire, il abrite les plus grandes plantations (cacao, hévéa, palmier à huile, café, ananas), un élevage diversifié et une pêche importante — la Côte d'Ivoire est le premier port thonier d'Afrique. Le secteur secondaire y regroupe la quasi-totalité des industries ivoiriennes (agroalimentaire, textile, bois, pétrochimie), chargées de transformer sur place les matières premières. Le secteur tertiaire, enfin, y est en plein essor, porté par le commerce, les télécommunications, la finance et un tourisme appuyé sur des sites remarquables comme les plages d'Assinie ou les cascades de Man.$$,
        'highlights', array[$$secteur primaire$$, $$secteur secondaire$$, $$secteur tertiaire$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Secteur$$, $$Exemples d'activités dans le milieu subéquatorial$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Primaire$$, $$Cacao, hévéa, palmier à huile, pêche thonière$$),
            jsonb_build_array($$Secondaire$$, $$Agroalimentaire, textile, bois, pétrochimie$$),
            jsonb_build_array($$Tertiaire$$, $$Commerce, télécommunications, finance, tourisme balnéaire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi la Côte d'Ivoire est-elle particulièrement bien placée pour la pêche thonière ?$$, 'solution', $$Parce qu'Abidjan, dans le milieu subéquatorial, est le premier port thonier d'Afrique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une conférence organisée par le club d'Histoire-Géographie, l'orateur affirme que le milieu subéquatorial regorge d'atouts naturels et humains qui en font le poumon économique de la Côte d'Ivoire. Un élève doit vérifier et justifier cette affirmation.$$,
      'questions', array[
        $$Cite trois atouts naturels du milieu subéquatorial ivoirien.$$,
        $$Cite deux atouts humains du milieu subéquatorial ivoirien.$$,
        $$Donne un exemple d'activité économique pour chacun des trois secteurs (primaire, secondaire, tertiaire) dans ce milieu.$$,
        $$Explique le rôle de l'État dans la mise en valeur de ce milieu.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel type de sol, profond et riche en fer, domine le milieu subéquatorial ivoirien ?$$,
      'hint', $$Il est aussi appelé sol latéritique.$$,
      'expected', $$Le sol ferralitique.$$
    ),
    jsonb_build_object(
      'question', $$Quel sommet culmine à 1 753 m à l'ouest du milieu subéquatorial ivoirien ?$$,
      'hint', $$C'est le point culminant de la Côte d'Ivoire, sur la dorsale guinéenne.$$,
      'expected', $$Le mont Nimba.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les deux grands ports du milieu subéquatorial ivoirien ?$$,
      'hint', $$L'un est la capitale économique, l'autre se trouve plus à l'ouest sur la côte.$$,
      'expected', $$Abidjan et San-Pédro.$$
    ),
    jsonb_build_object(
      'question', $$Quelle proportion de la population ivoirienne vit dans le milieu subéquatorial ?$$,
      'hint', $$C'est plus de la moitié.$$,
      'expected', $$Plus des deux tiers de la population ivoirienne.$$
    )
  ),
  now()
);
