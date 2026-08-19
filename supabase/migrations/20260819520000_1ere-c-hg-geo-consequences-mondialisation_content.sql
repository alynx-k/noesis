-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie, categoryid=136.
-- Moodle course id 943: "1ère G8-Les conséquences de la mondialisation"
-- (https://lyc.ecole-ci.org/course/view.php?id=943), resource id 4953.
-- Contenu réécrit à partir du PDF source (manifestations, avantages et
-- inconvénients de la mondialisation, structure centre/périphérie).
-- Statistiques réelles (parts du commerce mondial de la triade, flux
-- migratoires et touristiques) repris telles quelles (données
-- factuelles) ; explications reformulées. Dernière leçon de Géographie
-- pour la 1ère C — la subject Histoire commence à la leçon suivante
-- (order_index 9).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-geo-consequences-mondialisation',
  '1ere',
  'C',
  'histoire-geographie',
  $$Les conséquences de la mondialisation$$,
  8,
  '1ere-c-hg-geo-facteurs-mondialisation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors de la cérémonie d'inauguration d'un nouveau stade olympique à Abidjan, le président de la République de Côte d'Ivoire affirme, en présence de l'ambassadeur de Chine : « C'est grâce à la coopération sino-ivoirienne que nous avons bâti ce beau stade ultra-moderne. » Koffi, élève de 1ère présent au stade, est étonné d'entendre de tels propos. De retour en classe, il partage sa préoccupation avec ses camarades. Ensemble, ils décident de mener des recherches pour identifier les grands domaines d'échanges, déterminer l'interdépendance des économies nationales et apprécier les avantages et les inconvénients de la mondialisation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les manifestations de la mondialisation$$,
        'body', $$La mondialisation se manifeste d'abord par l'essor des échanges internationaux : en 2006, le volume des importations de marchandises a augmenté de près de 10% quand le PIB mondial n'augmentait que de 3%. 70% du commerce international est réalisé par les trois grands pôles développés (États-Unis, Japon, Union européenne), les flux étant essentiellement intra-Nord, tandis que les pays émergents (Chine, Inde) exportent des produits manufacturés à valeur ajoutée croissante. Elle se manifeste aussi par la mobilité croissante des hommes : plus de 200 millions de personnes vivent aujourd'hui hors de leur pays d'origine (3,3% de la population mondiale), et le tourisme génère 500 milliards de dollars de recettes annuelles pour 800 millions d'arrivées de touristes (2005). Enfin, les flux de capitaux et d'informations circulent en continu, mais restent concentrés sur les États riches (moins de 25% des investissements directs à l'étranger vont vers les pays pauvres).$$,
        'highlights', array[$$70% du commerce mondial réalisé par la triade (USA, Japon, UE)$$, $$>200 millions de migrants internationaux ; 800 millions de touristes (2005)$$, $$<25% des investissements directs à l'étranger vont vers les pays pauvres$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois pôles qui réalisent l'essentiel du commerce international ?$$, 'solution', $$Les États-Unis, le Japon et l'Union européenne (la « triade »).$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages de la mondialisation$$,
        'body', $$La mondialisation favorise le commerce grâce à la concurrence et à la division du travail, permet aux États dynamiques de conquérir des parts de marché, facilite le transfert de technologies de pointe vers les pays pauvres et la délocalisation d'entreprises vers les pays en développement. Depuis 1960, les échanges de marchandises ont triplé ; depuis 1990, le commerce mondial croît de 6% par an (contre moins de 4% dans les années 1980). Le FMI souligne qu'elle contribue à l'augmentation de la prospérité mondiale et permet un rattrapage accéléré de nombreux pays en développement : les pays d'Asie de l'Est, parmi les plus pauvres il y a 40 ans, sont devenus dynamiques et prospères grâce à des politiques tournées vers l'extérieur.$$,
        'highlights', array[$$avantages : concurrence, transfert de technologies, délocalisation, expansion des échanges (x3 depuis 1960)$$, $$exemple : essor des pays d'Asie de l'Est via l'ouverture économique$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi la mondialisation a-t-elle été un facteur de développement pour les pays d'Asie de l'Est ?$$, 'solution', $$En s'intégrant à l'économie mondiale par des politiques tournées vers l'extérieur, ces pays, autrefois parmi les plus pauvres, ont pu profiter de l'expansion des échanges et du transfert de technologies pour devenir dynamiques et prospères.$$),
        'fixation', jsonb_build_object('question', $$De combien les échanges de marchandises ont-ils augmenté depuis 1960 ?$$, 'solution', $$Ils ont triplé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les inconvénients : un espace mondialisé mais déséquilibré$$,
        'body', $$L'espace économique mondialisé est dominé par la triade, qui concentre 85% de la capitalisation boursière, 83% des investissements et 70% des exportations mondiales. Les échanges entre pays développés représentent à eux seuls la moitié des échanges mondiaux. Les pays en développement, bien qu'ils concentrent les trois quarts de la population mondiale, ne réalisent qu'un quart des échanges mondiaux, et dépendent souvent d'un ou deux produits primaires (agricoles ou miniers), restant dans la dépendance du Nord pour le débouché de leurs matières premières et l'approvisionnement en biens manufacturés. On distingue des « périphéries intégrées » (régions littorales, pays émergents recevant des investissements de la triade) et des « périphéries enclavées » (pays d'Afrique, d'Asie centrale et d'Amérique latine, aux relations plus limitées avec la triade).$$,
        'highlights', array[$$triade : 85% capitalisation boursière, 83% investissements, 70% exportations mondiales$$, $$PED : 3/4 de la population mondiale mais seulement 1/4 des échanges mondiaux$$, $$périphéries intégrées vs périphéries enclavées$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la différence entre une « périphérie intégrée » et une « périphérie enclavée » dans l'espace mondialisé ?$$, 'solution', $$Une périphérie intégrée (régions littorales, pays émergents d'Asie ou d'Amérique latine) reçoit des investissements de la triade et exporte des produits manufacturés. Une périphérie enclavée (souvent en Afrique, Asie centrale, Amérique latine) entretient des relations plus limitées avec la triade, exportant surtout des produits primaires.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que les pays en développement restent dans la « dépendance du Nord » ?$$, 'solution', $$Parce qu'ils dépendent souvent d'un ou deux produits primaires pour leurs exportations et du Nord pour l'approvisionnement en biens manufacturés, ce qui les rend vulnérables aux fluctuations des grands marchés et des cours mondiaux.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux camarades de classe, Eli et Yacou, se rendent dans une agence de téléphonie pour l'achat d'un téléphone portable. Ils remarquent que tous les portables sont marqués « made in China ». Eli affirme : « Si le marché ivoirien est inondé de produits chinois, c'est parce qu'ils sont moins coûteux, et il existe une coopération entre la Côte d'Ivoire et la Chine. Ce sont les effets de la mondialisation et c'est un avantage pour l'économie ivoirienne. » Yacou ne partage pas cet avis : pour lui, la mondialisation tue l'esprit de créativité des Ivoiriens, qui deviennent des éternels consommateurs au lieu de fabriquer eux-mêmes.$$,
      'questions', array[
        $$Identifie le problème soulevé dans ce document.$$,
        $$Explique les propos d'Eli : « Si le marché ivoirien est inondé de produits chinois... un avantage pour l'économie ivoirienne. »$$,
        $$Discute l'opinion de Yacou selon laquelle « la mondialisation tue l'esprit de créativité des Ivoiriens car ils deviennent des éternels consommateurs au lieu de fabriquer eux-mêmes ».$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle part du commerce international est réalisée par la triade (États-Unis, Japon, Union européenne) ?$$,
      'hint', $$C'est un chiffre proche des trois quarts.$$,
      'expected', $$Environ 70%.$$
    ),
    jsonb_build_object(
      'question', $$Combien de personnes vivaient, selon les estimations récentes, hors de leur pays d'origine dans le monde ?$$,
      'hint', $$C'est un chiffre en centaines de millions.$$,
      'expected', $$Plus de 200 millions de personnes, soit 3,3% de la population mondiale.$$
    ),
    jsonb_build_object(
      'question', $$Cite un avantage de la mondialisation pour les pays en développement.$$,
      'hint', $$Il concerne le transfert de savoir-faire.$$,
      'expected', $$Le transfert et l'usage de technologies de pointe, qui peuvent impulser le développement (ou la délocalisation d'entreprises vers ces pays).$$
    ),
    jsonb_build_object(
      'question', $$Quelle proportion des échanges mondiaux les pays en développement réalisent-ils, malgré leur poids démographique ?$$,
      'hint', $$Comparer à leur part de la population mondiale (3/4).$$,
      'expected', $$Seulement environ un quart (1/4) des échanges mondiaux, bien qu'ils concentrent les trois quarts (3/4) de la population mondiale.$$
    )
  ),
  now()
);
