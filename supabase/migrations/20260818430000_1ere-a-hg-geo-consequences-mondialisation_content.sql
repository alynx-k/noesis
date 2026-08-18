-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie, categoryid=124.
-- Moodle course id 1994: "1ère_GEOGRAPHIE_T4_L2: LES CONSEQUENCES DE LA
-- MONDIALISATION" (https://lyc.ecole-ci.org/course/view.php?id=1994),
-- resource id 17390. Contenu réécrit à partir du PDF source (manifestations,
-- avantages et inconvénients de la mondialisation ; triade, périphéries
-- intégrées/enclavées). Statistiques et faits réels (parts du commerce
-- mondial, chiffres du tourisme et des migrations) repris tels quels ;
-- explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-geo-consequences-mondialisation',
  '1ere',
  'A',
  'histoire-geographie',
  $$Les conséquences de la mondialisation$$,
  8,
  '1ere-a-hg-geo-facteurs-mondialisation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors de l'inauguration d'un grand stade construit grâce à la coopération sino-ivoirienne, un élève de 1ère A, étonné d'entendre parler d'une telle coopération internationale, décide avec ses camarades de mener des recherches pour identifier les grands domaines d'échanges de la mondialisation, comprendre l'interdépendance des économies nationales, et apprécier les avantages et inconvénients de ce phénomène.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'essor des échanges internationaux$$,
        'body', $$Le volume des échanges mondiaux augmente plus vite que la production : en 2006, les importations mondiales de marchandises ont crû de près de 10% contre seulement 3% pour le PIB mondial. Ces flux concernent toute la planète, mais restent très concentrés : 70% du commerce international est réalisé par les trois grands pôles développés (États-Unis, Japon, Union européenne), qui échangent surtout entre eux (flux intra-Nord). Les nouveaux pays industrialisés (Brésil, Mexique, Taïwan) et les pays émergents (Chine, Inde) exportent des produits manufacturés à valeur ajoutée croissante.$$,
        'highlights', array[$$importations 2006 : +10% contre PIB mondial +3%$$, $$70% du commerce mondial : États-Unis, Japon, UE$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois pôles qui réalisent 70% du commerce international ?$$, 'solution', $$Les États-Unis, le Japon et l'Union européenne.$$)
      ),
      jsonb_build_object(
        'heading', $$La mobilité croissante des hommes, capitaux et informations$$,
        'body', $$On dénombre aujourd'hui plus de 200 millions de migrants internationaux dans le monde (3,3% de la population mondiale). Le tourisme s'est également développé grâce à la hausse des niveaux de vie et au progrès des transports : 800 millions d'arrivées touristiques en 2005, générant 500 milliards de dollars de recettes annuelles, la France étant la première destination mondiale. Les flux de capitaux, eux, restent concentrés sur les pays riches (moins de 25% des investissements directs à l'étranger vont vers les pays pauvres, jugés trop risqués), tandis que l'information circule en continu grâce aux grandes chaînes internationales (CNN, BBC, France 24) et à Internet, même si certains espaces (Afrique, Asie centrale) restent moins bien couverts.$$,
        'highlights', array[$$+200 millions de migrants internationaux$$, $$800 millions de touristes (2005)$$, $$<25% des capitaux vers les pays pauvres$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi les investisseurs hésitent-ils à placer leurs capitaux dans les pays pauvres ou politiquement instables ?$$, 'solution', $$Parce qu'ils jugent ces placements trop risqués.$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages de la mondialisation$$,
        'body', $$La mondialisation favorise le commerce par la concurrence et la division du travail, permet aux États dynamiques de conquérir des parts de marché, facilite le transfert de technologies et l'internationalisation des entreprises (firmes multinationales). Depuis 1990, le commerce mondial croît de 6% par an (contre moins de 4% dans les années 1980), et les échanges de marchandises ont triplé depuis 1960. Pour le FMI et de nombreux économistes, la mondialisation contribue à la prospérité mondiale et permet un rattrapage accéléré : les pays d'Asie de l'Est, parmi les plus pauvres il y a 40 ans, sont aujourd'hui dynamiques et prospères grâce à des politiques tournées vers l'extérieur.$$,
        'highlights', array[$$commerce mondial : +6%/an depuis 1990$$, $$échanges triplés depuis 1960$$, $$exemple : essor des pays d'Asie de l'Est$$]::text[],
        'example', jsonb_build_object('statement', $$Quel exemple le cours donne-t-il pour illustrer que la mondialisation peut être un facteur de développement ?$$, 'solution', $$Les pays d'Asie de l'Est, qui figuraient parmi les plus pauvres de la planète il y a plus de 40 ans, sont aujourd'hui pour la plupart devenus dynamiques et prospères grâce à des politiques économiques tournées vers l'extérieur.$$),
        'fixation', jsonb_build_object('question', $$De combien les échanges de marchandises mondiaux ont-ils augmenté depuis 1960 ?$$, 'solution', $$Ils ont triplé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les inconvénients : une mondialisation déséquilibrée$$,
        'body', $$L'espace mondialisé est dominé par la triade (États-Unis, Union européenne, Japon), dont les places financières (New York, Londres, Tokyo) concentrent 85% de la capitalisation boursière mondiale, 83% des investissements et 70% des exportations. On distingue deux types de périphéries : les périphéries intégrées (régions littorales, pays émergents d'Asie ou d'Amérique latine) qui reçoivent des investissements et exportent des produits manufacturés ; et les périphéries enclavées (pays d'Afrique, d'Asie centrale, d'Amérique latine), qui exportent surtout des produits primaires et importent des produits manufacturés. Les pays en développement, bien qu'ils concentrent les ¾ de la population mondiale, ne réalisent que le ¼ des échanges mondiaux, restant dépendants d'un ou deux produits primaires et donc vulnérables aux fluctuations des cours mondiaux.$$,
        'highlights', array[$$triade : 85% capitalisation boursière$$, $$PED : ¾ de la population, ¼ des échanges$$, $$périphéries intégrées vs enclavées$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type de région$$, $$Caractéristique$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array('Triade (USA, UE, Japon)', $$Centres d'impulsion, concentration des capitaux et des échanges$$),
            jsonb_build_array('Périphéries intégrées', $$Reçoivent investissements, exportent produits manufacturés$$),
            jsonb_build_array('Périphéries enclavées', $$Exportent produits primaires, importent produits manufacturés$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre une périphérie intégrée et une périphérie enclavée ?$$, 'solution', $$La périphérie intégrée (régions littorales, pays émergents) reçoit des investissements de la triade et exporte des produits manufacturés ; la périphérie enclavée (souvent des pays sans accès direct à la mer) exporte surtout des produits primaires et importe des produits manufacturés, restant plus marginalisée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux camarades de classe, Eli et Yacou, se rendent dans une agence de téléphonie et remarquent que tous les téléphones portables sont marqués « made in China ». Eli affirme : « Si le marché ivoirien est inondé de produits chinois, c'est parce qu'ils sont moins coûteux, et il existe une coopération entre la Côte d'Ivoire et la Chine. Ce sont les effets de la mondialisation, et c'est un avantage pour l'économie ivoirienne. » Yacou ne partage pas cet avis : pour lui, la mondialisation tue l'esprit de créativité des Ivoiriens, qui deviennent d'éternels consommateurs au lieu de fabriquer eux-mêmes.$$,
      'questions', array[
        $$Identifie le problème soulevé dans ce document.$$,
        $$Explique les propos d'Eli : « Si le marché ivoirien est inondé de produits chinois [...] c'est un avantage pour l'économie ivoirienne. »$$,
        $$Discute l'opinion de Yacou selon laquelle « la mondialisation tue l'esprit de créativité des Ivoiriens car ils deviennent des éternels consommateurs au lieu de fabriquer eux-mêmes ».$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de personnes vivaient dans un pays autre que le leur, selon les estimations citées dans le cours ?$$,
      'hint', $$C'est un chiffre en centaines de millions.$$,
      'expected', $$Plus de 200 millions de personnes (3,3% de la population mondiale).$$
    ),
    jsonb_build_object(
      'question', $$Quel pays est présenté comme la première destination touristique au monde ?$$,
      'hint', $$C'est un pays européen.$$,
      'expected', $$La France.$$
    ),
    jsonb_build_object(
      'question', $$Quel pourcentage de la capitalisation boursière mondiale est concentré par les grandes places financières de la triade ?$$,
      'hint', $$C'est un chiffre très élevé, proche de 85%.$$,
      'expected', $$Environ 85%.$$
    ),
    jsonb_build_object(
      'question', $$Les pays en développement concentrent les ¾ de la population mondiale : quelle part des échanges mondiaux réalisent-ils ?$$,
      'hint', $$C'est une fraction bien plus faible.$$,
      'expected', $$Seulement le ¼ des échanges mondiaux.$$
    )
  ),
  now()
);
