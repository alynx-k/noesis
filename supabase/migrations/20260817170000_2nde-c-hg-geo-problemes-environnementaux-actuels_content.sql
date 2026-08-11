-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Histoire-Géographie, categoryid=114. Moodle course id 3636: "2nde G8 - Les
-- problèmes environnementaux actuels"
-- (https://lyc.ecole-ci.org/course/view.php?id=3636). Resource "Je lis le
-- résumé de la leçon", mod_resource id 36859, redirecting to pluginfile "2nde
-- G8 - Les problèmes environnementaux actuels.pdf". Cross-checked against the
-- already-sourced Seconde A lesson for this exact same title/filename
-- (categoryid=102): identical PDF filename and, on page-1 inspection of the
-- situation d'apprentissage, identical wording, confirming this
-- Histoire-Géographie lesson is common-trunk content shared by Seconde A and
-- Seconde C on this platform. Rewritten/paraphrased from the source PDF
-- (Thème 3, Leçon 2). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-hg-geo-problemes-environnementaux-actuels',
  '2nde',
  'C',
  'geographie',
  $$Les problèmes environnementaux actuels$$,
  8,
  '2nde-c-hg-geo-grands-milieux-biogeographiques-monde',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de seconde suit un reportage télévisé sur les difficultés de production d'électricité en Côte d'Ivoire, attribuées à l'assèchement des barrages hydroélectriques provoqué par le réchauffement climatique. Intrigué, il décide de mener des recherches sur les causes de la dégradation de l'environnement, ses conséquences sur la vie sur Terre et les solutions mises en œuvre pour y remédier.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Un environnement sous pression : des problèmes multiples$$,
        'body', $$L'environnement regroupe l'ensemble des éléments biotiques (liés aux êtres vivants) et abiotiques (eau, air, sols) qui entourent une espèce. Les besoins croissants de l'humanité exercent aujourd'hui une pression telle que de nombreux déséquilibres apparaissent : pollution de l'air et de l'eau, réchauffement climatique, dégradation de la couche d'ozone, épuisement des ressources non renouvelables, urbanisation galopante, dégradation des sols agricoles, sécheresse, rareté de l'eau potable ou encore destruction des écosystèmes par la déforestation. Ces problèmes se combinent souvent entre eux et s'aggravent mutuellement.$$,
        'highlights', array[$$pollution$$, $$réchauffement climatique$$, $$épuisement des ressources$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le réchauffement climatique est un phénomène global de transformation du climat, caractérisé par une augmentation générale des températures moyennes, qui modifie durablement les équilibres météorologiques et les écosystèmes.$$),
        'fixation', jsonb_build_object('question', $$Que désigne-t-on par « éléments abiotiques » de l'environnement ?$$, 'solution', $$Les éléments non vivants comme l'eau, l'air et les sols.$$)
      ),
      jsonb_build_object(
        'heading', $$Les activités humaines, principale cause de la dégradation$$,
        'body', $$L'agriculture, en recourant massivement aux engrais et pesticides, pollue l'eau, l'air et les sols, et contribue à l'assèchement de grandes étendues d'eau comme le lac Tchad ou la mer d'Aral. L'exploitation forestière et minière, ainsi que l'urbanisation, dégradent la végétation et exposent les sols à l'érosion. Les activités industrielles rejettent des déchets et des gaz à effet de serre, tandis que le transport routier et maritime ajoute gaz d'échappement et pollution des océans, et que le commerce génère d'immenses quantités de déchets plastiques — au point qu'une véritable « plaque de déchets » de 1,6 million de km² s'est formée dans l'océan Pacifique. À ces causes humaines s'ajoutent des phénomènes naturels comme les séismes, les cyclones, la montée du niveau des océans ou la désertification, qui aggravent encore la situation.$$,
        'highlights', array[$$agriculture$$, $$activités industrielles$$, $$déchets plastiques$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi l'assèchement du lac Tchad et de la mer d'Aral est-il présenté comme une conséquence de l'agriculture ?$$, 'solution', $$Parce que l'agriculture surexploite les étendues d'eau pour l'irrigation, ce qui a contribué à réduire drastiquement leur superficie.$$),
        'fixation', jsonb_build_object('question', $$Cite un phénomène naturel (non lié à l'homme) qui dégrade l'environnement.$$, 'solution', $$Par exemple un séisme, un cyclone ou la montée du niveau des océans.$$)
      ),
      jsonb_build_object(
        'heading', $$Des impacts sur la santé et sur la biodiversité$$,
        'body', $$La pollution de l'air et de l'eau augmente les risques de maladies pulmonaires, de cancers et d'atteintes au patrimoine génétique, notamment par l'absorption de polluants présents dans l'alimentation. Le réchauffement climatique dérègle le climat et bouleverse le calendrier agricole traditionnel. La diminution de la biodiversité, quant à elle, menace l'équilibre des chaînes alimentaires : la disparition d'une seule espèce peut fragiliser tout un écosystème, réduire les ressources alimentaires disponibles (comme la surpêche de la morue qui menace l'espèce elle-même) et faire perdre des molécules potentiellement précieuses pour la médecine.$$,
        'highlights', array[$$maladies liées à la pollution$$, $$perte de biodiversité$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la disparition d'une seule espèce peut-elle fragiliser tout un écosystème ?$$, 'solution', $$Parce que les chaînes alimentaires et les écosystèmes sont des systèmes en équilibre : si un maillon disparaît, c'est l'ensemble du réseau qui est menacé.$$)
      ),
      jsonb_build_object(
        'heading', $$La mobilisation internationale contre la pollution de l'eau et de l'air$$,
        'body', $$Face à ces problèmes, la communauté internationale s'est organisée : dès 1977, une conférence des Nations Unies affirmait le droit de chacun à l'eau potable. Le premier Sommet de la Terre, tenu à Rio de Janeiro en 1992, a marqué une étape majeure en visant à stabiliser les émissions de gaz à effet de serre, ouvrant la voie aux conférences climatiques (COP) qui se sont succédé depuis. Ces engagements se traduisent par des actions concrètes : développement des énergies renouvelables, sobriété énergétique, développement des transports en commun et du covoiturage, ou encore limitation de l'usage des produits phytosanitaires en agriculture.$$,
        'highlights', array[$$Sommet de la Terre de Rio (1992)$$, $$COP$$]::text[],
        'fixation', jsonb_build_object('question', $$En quelle année et dans quelle ville s'est tenu le premier Sommet de la Terre ?$$, 'solution', $$En 1992, à Rio de Janeiro.$$)
      ),
      jsonb_build_object(
        'heading', $$La protection des sols et de la biodiversité$$,
        'body', $$Pour limiter l'érosion des sols, on recourt à des techniques comme la culture selon les lignes de niveau, les terrasses ou la culture en bandes alternant zones cultivées et jachères. Pour protéger la biodiversité, les pays réunis à Rio en 1992 ont adopté la Convention sur la diversité biologique, marquant une prise de conscience internationale. Concrètement, cela se traduit par la création de parcs nationaux et de réserves naturelles, la réglementation ou l'interdiction de certaines pratiques (comme la chasse à la baleine, interdite depuis 1986), et parfois l'élevage en captivité d'espèces menacées avant leur réintroduction dans leur milieu naturel.$$,
        'highlights', array[$$Convention sur la diversité biologique$$, $$parcs nationaux$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Problème$$, $$Exemple de solution$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Pollution des eaux$$, $$Limiter l'utilisation des produits phytosanitaires$$),
            jsonb_build_array($$Pollution de l'air$$, $$Pratiquer le covoiturage, développer les transports en commun$$),
            jsonb_build_array($$Dégradation des sols$$, $$Développer l'agroécologie et l'agroforesterie$$),
            jsonb_build_array($$Diminution de la biodiversité$$, $$Créer des parcs nationaux et des réserves$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Depuis quelle année la chasse à la baleine est-elle interdite par la Commission baleinière internationale ?$$, 'solution', $$Depuis 1986.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un voyage, deux passagers discutent d'une vague de chaleur inhabituelle touchant à la fois l'Europe et l'Amérique, provoquant de grands incendies. L'un affirme que « c'est un phénomène naturel normal ». Un élève de seconde doit évaluer cette affirmation à l'aide de ce qu'il sait du réchauffement climatique.$$,
      'questions', array[
        $$Cite quatre problèmes environnementaux actuels évoqués dans la leçon.$$,
        $$Explique en quoi l'agriculture contribue à la dégradation de l'environnement.$$,
        $$Donne un exemple d'impact du réchauffement climatique sur la vie humaine.$$,
        $$Cite un événement international majeur et une action concrète pour protéger la biodiversité.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on l'augmentation générale des températures moyennes qui modifie durablement le climat et les écosystèmes ?$$,
      'hint', $$C'est l'expression la plus utilisée pour ce phénomène.$$,
      'expected', $$Le réchauffement climatique.$$
    ),
    jsonb_build_object(
      'question', $$En quelle année et dans quelle ville s'est tenu le premier Sommet de la Terre, qui a notamment donné naissance à la Convention sur la diversité biologique ?$$,
      'hint', $$C'est une ville brésilienne, en 1992.$$,
      'expected', $$En 1992, à Rio de Janeiro.$$
    ),
    jsonb_build_object(
      'question', $$Quel lac africain et quelle mer d'Asie centrale se sont fortement asséchés à cause de la surexploitation agricole de l'eau ?$$,
      'hint', $$L'un se trouve entre le Tchad, le Niger, le Nigeria et le Cameroun ; l'autre entre le Kazakhstan et l'Ouzbékistan.$$,
      'expected', $$Le lac Tchad et la mer d'Aral.$$
    ),
    jsonb_build_object(
      'question', $$Depuis quelle année la chasse à la baleine est-elle interdite par la Commission baleinière internationale ?$$,
      'hint', $$C'est dans les années 1980.$$,
      'expected', $$Depuis 1986.$$
    )
  ),
  now()
);
