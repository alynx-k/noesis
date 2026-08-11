-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3343: "2nde_GEOGRAPHIE_T2_L3: L'ESPACE IVOIRIEN: Un
-- environnement menacé" (https://lyc.ecole-ci.org/course/view.php?id=3343)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33343, redirecting
-- to pluginfile "2nde G6-LEspace ivoirien un environnement menacé -.pdf" (the
-- PDF carries an "ecole-ci.online" footer watermark but is served directly
-- from the official lyc.ecole-ci.org Moodle platform).
-- Rewritten/paraphrased from the source PDF (Thème 2, Leçon 3): the human
-- factors degrading the Ivorian environment (destructive agriculture,
-- clandestine gold panning, poaching, industrial and urban pollution,
-- uncontrolled urbanization), the resulting threats (deforestation figures,
-- soil depletion, biodiversity loss, coastal erosion, urban pollution), and
-- the state and citizen actions taken to preserve the environment (SODEFOR,
-- CIAPOL, ANDE, protected areas, the polluter-pays principle). 100% original
-- wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-geo-espace-ivoirien-environnement-menace',
  '2nde',
  'A',
  'geographie',
  $$L'espace ivoirien : un environnement menacé$$,
  6,
  '2nde-a-hg-geo-milieu-tropical-ivoirien',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un agent de la SODEFOR, invité à une conférence dans un établissement scolaire, explique que la destruction continue de la forêt ivoirienne menace gravement l'environnement et le bien-être de la population. Des élèves de seconde décident alors d'enquêter sur les causes de cette dégradation, ses conséquences concrètes et les solutions mises en œuvre pour protéger le milieu naturel.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une exploitation abusive du territoire$$,
        'body', $$Plusieurs pratiques économiques dégradent fortement l'espace ivoirien. Dans l'agriculture, ce sont la culture sur brûlis, les feux de brousse incontrôlés, les cultures extensives et l'usage abusif d'engrais et de pesticides, auxquels s'ajoutent la surexploitation forestière et les installations clandestines dans les forêts classées. L'orpaillage clandestin s'attaque quant à lui directement au couvert végétal, au sol (qu'il décape et perce de trous) et à l'eau, polluée par le mercure et d'autres produits chimiques utilisés pour extraire l'or. Le braconnage intensif, enfin, menace directement les populations animales en dehors de tout cadre légal.$$,
        'highlights', array[$$agriculture sur brûlis$$, $$orpaillage clandestin$$, $$braconnage$$]::text[],
        'fixation', jsonb_build_object('question', $$Par quels moyens l'orpaillage clandestin pollue-t-il les cours d'eau ?$$, 'solution', $$Par l'utilisation de mercure et d'autres produits chimiques pour extraire l'or.$$)
      ),
      jsonb_build_object(
        'heading', $$Des activités urbaines et une urbanisation qui aggravent la dégradation$$,
        'body', $$Au-delà de l'agriculture, les activités secondaires (usines rejetant eaux usées, fumées et bruits près des habitations) et tertiaires (déchets commerciaux, transports polluants, secteur informel encombrant les rues) contribuent aussi à la dégradation de l'environnement, en particulier en ville. À cela s'ajoutent des facteurs naturels comme l'érosion côtière, les inondations et les glissements de terrain, ainsi qu'une urbanisation largement incontrôlée : extension anarchique des villes, occupation de sites impropres à l'habitation, drainage et assainissement insuffisants, collecte des déchets défaillante.$$,
        'highlights', array[$$pollution urbaine$$, $$urbanisation incontrôlée$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi une urbanisation rapide et mal planifiée aggrave-t-elle les problèmes environnementaux d'une ville ?$$, 'solution', $$Parce qu'elle s'accompagne souvent d'une extension anarchique de l'habitat, d'un drainage et d'un assainissement insuffisants, et d'une collecte des déchets qui ne suit pas la croissance de la population.$$),
        'fixation', jsonb_build_object('question', $$Cite deux facteurs naturels de dégradation de l'environnement ivoirien.$$, 'solution', $$L'érosion côtière et les inondations (pouvant entraîner des glissements de terrain).$$)
      ),
      jsonb_build_object(
        'heading', $$Un milieu naturel fortement dégradé$$,
        'body', $$Les conséquences sur le milieu naturel sont considérables. Le couvert forestier ivoirien a chuté de 12 millions d'hectares en 1956 à moins de 3 millions d'hectares aujourd'hui, soit une perte moyenne d'environ 400 000 hectares par an. Cette déforestation entraîne un appauvrissement des sols par érosion et une perte de biodiversité, avec des dizaines d'espèces animales et végétales aujourd'hui menacées de disparition à cause du braconnage et des feux de brousse. Le littoral n'est pas épargné : l'érosion côtière, liée à la montée du niveau de la mer, a par exemple provoqué la quasi-disparition du village de Lahou-Kpanda. Enfin, la déforestation et les émissions de gaz contribuent à un dérèglement climatique qui perturbe le calendrier agricole traditionnel.$$,
        'highlights', array[$$déforestation$$, $$perte de biodiversité$$, $$érosion côtière$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Année$$, $$Superficie forestière ivoirienne$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$1956$$, $$12 millions d'hectares$$),
            jsonb_build_array($$1991$$, $$3 millions d'hectares$$),
            jsonb_build_array($$Aujourd'hui$$, $$Moins de 3 millions d'hectares$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quel village du littoral ivoirien a presque disparu à cause de l'érosion côtière ?$$, 'solution', $$Lahou-Kpanda.$$)
      ),
      jsonb_build_object(
        'heading', $$Un espace urbain de plus en plus pollué$$,
        'body', $$En ville, les industries rejettent bruits, eaux usées et fumées toxiques qui polluent l'eau, l'air et le cadre de vie. La prolifération des bidonvilles et l'insalubrité grandissante — amoncellement d'ordures ménagères, dépôts sauvages, sachets plastiques, collecte des déchets insuffisante — s'ajoutent aux embouteillages et à la pollution de l'air par les véhicules et certains lieux de restauration bruyants. Ces problèmes touchent directement plus de la moitié de la population ivoirienne, qui vit aujourd'hui en zone urbaine.$$,
        'highlights', array[$$insalubrité$$, $$pollution de l'air$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle proportion de la population ivoirienne est concernée par les problèmes de dégradation de l'environnement urbain ?$$, 'solution', $$Plus de la moitié de la population.$$)
      ),
      jsonb_build_object(
        'heading', $$Les actions engagées pour préserver l'environnement$$,
        'body', $$Face à ces menaces, l'État a engagé plusieurs actions : sensibilisation de la population, élaboration d'un code de l'environnement, réglementation des licences d'exploitation forestière et minière, et renforcement de structures spécialisées comme la SODEFOR (reboisement), le CIAPOL (lutte contre les pollutions) et l'ANDE (Agence Nationale de l'Environnement). D'autres mesures concrètes s'y ajoutent : création de parcs nationaux et de réserves, interdictions périodiques de pêche et de chasse, obligation pour les usines de recycler leurs eaux usées, ou encore renforcement du contrôle technique des véhicules. Mais l'État ne peut agir seul : la population est aussi appelée à changer de comportement (ne pas jeter les déchets dans la rue, ne pas détruire la forêt) et à financer cette lutte via l'impôt, notamment les taxes de voirie et d'assainissement.$$,
        'highlights', array[$$SODEFOR$$, $$CIAPOL$$, $$ANDE$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel principe économique veut que celui qui pollue contribue financièrement à la réparation des dommages causés ?$$, 'solution', $$Le principe « pollueur-payeur ».$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une « semaine de l'environnement » organisée dans son village, un sous-préfet déclare que « nous sommes tous responsables en partie des menaces qui pèsent sur notre environnement ». Un élève de seconde doit expliquer et discuter cette affirmation.$$,
      'questions', array[
        $$Cite trois facteurs humains à l'origine de la dégradation de l'environnement ivoirien.$$,
        $$Donne l'évolution de la superficie forestière ivoirienne entre 1956 et aujourd'hui.$$,
        $$Cite deux structures créées par l'État pour protéger l'environnement, et leur rôle.$$,
        $$Explique en quoi la population elle-même est responsable de la dégradation de l'environnement, et ce qu'elle peut faire pour la limiter.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle structure ivoirienne est chargée du reboisement et de la gestion des forêts ?$$,
      'hint', $$Son sigle est SODEFOR.$$,
      'expected', $$La SODEFOR (Société de développement des forêts).$$
    ),
    jsonb_build_object(
      'question', $$Quelle structure lutte contre les différentes formes de pollution en Côte d'Ivoire ?$$,
      'hint', $$Son sigle est CIAPOL.$$,
      'expected', $$Le CIAPOL (Centre Ivoirien Anti-Pollution).$$
    ),
    jsonb_build_object(
      'question', $$Quel village du littoral a presque disparu à cause de l'érosion côtière ?$$,
      'hint', $$C'est un village mentionné dans la leçon, situé sur la côte.$$,
      'expected', $$Lahou-Kpanda.$$
    ),
    jsonb_build_object(
      'question', $$Cite une pratique agricole qui dégrade fortement l'environnement ivoirien.$$,
      'hint', $$Elle consiste à brûler la végétation pour préparer un champ.$$,
      'expected', $$L'agriculture sur brûlis (ou les feux de brousse incontrôlés).$$
    )
  ),
  now()
);
