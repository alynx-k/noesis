-- FALLBACK CONTENT: see 20260813000000_svt-4e-transformations-corps-humain_content.sql
-- header for the ecole-ci.org access attempt this session (site-wide
-- login wall). Written from general knowledge of the standard Ivorian
-- 4ème SVT programme (Compétence 4 : les maladies liées à l'eau —
-- maladies de l'eau contaminée ingérée, comme le choléra et la fièvre
-- typhoïde, et maladies liées au contact avec l'eau, comme la
-- bilharziose). Sensitive public-health topic: kept clinical, factual
-- and non-alarmist, no invented statistics; transmission routes are
-- standard, well-established medical facts. 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans un village où le puits est proche d'une zone où les habitants se soulagent en plein air, plusieurs enfants souffrent de diarrhées sévères après avoir bu l'eau du puits. D'autres, qui se baignent régulièrement dans la mare voisine, présentent des douleurs et du sang dans les urines. L'infirmier du village explique que ces maladies sont toutes liées à l'eau, mais pas de la même façon.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les maladies transmises par l'ingestion d'eau contaminée$$,
        'body', $$De nombreuses maladies se transmettent lorsqu'une personne boit de l'eau contaminée par des microorganismes pathogènes provenant des selles de personnes infectées. Cette contamination survient surtout lorsque les points d'eau (puits, rivières) ne sont pas protégés des matières fécales, en l'absence de latrines ou d'assainissement adéquat.$$,
        'highlights', array[$$eau contaminée$$, $$maladies diarrhéiques$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'ingestion d'eau contaminée par des matières fécales contenant des microorganismes pathogènes est à l'origine de nombreuses maladies, notamment diarrhéiques.$$),
        'example', jsonb_build_object('statement', $$Pourquoi un puits situé près d'une zone de défécation en plein air présente-t-il un risque sanitaire ?$$, 'solution', $$Parce que les matières fécales peuvent contaminer la nappe d'eau ou ruisseler jusqu'au puits, y introduisant des microorganismes pathogènes qui rendent l'eau dangereuse à boire.$$),
        'fixation', jsonb_build_object('question', $$Par quelle voie principale les microorganismes responsables des maladies diarrhéiques atteignent-ils l'eau de boisson ?$$, 'solution', $$Par contamination de l'eau avec des matières fécales de personnes infectées.$$)
      ),
      jsonb_build_object(
        'heading', $$Le choléra et la fièvre typhoïde$$,
        'body', $$Le choléra est une maladie causée par une bactérie qui provoque une diarrhée aqueuse abondante et une déshydratation pouvant être grave si elle n'est pas traitée rapidement. La fièvre typhoïde est causée par une autre bactérie et provoque une fièvre prolongée. Ces deux maladies se transmettent par de l'eau ou des aliments souillés par des matières fécales contaminées.$$,
        'highlights', array[$$choléra$$, $$fièvre typhoïde$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le choléra provoque une diarrhée aqueuse abondante et une déshydratation ; la fièvre typhoïde provoque une fièvre prolongée. Toutes deux se transmettent par l'eau ou les aliments souillés.$$),
        'example', jsonb_build_object('statement', $$Pourquoi le choléra peut-il devenir dangereux en peu de temps ?$$, 'solution', $$Parce que la diarrhée qu'il provoque entraîne une perte rapide et importante d'eau et de sels minéraux, pouvant conduire à une déshydratation sévère si elle n'est pas compensée à temps.$$),
        'fixation', jsonb_build_object('question', $$Quel symptôme principal caractérise le choléra ?$$, 'solution', $$Une diarrhée aqueuse abondante, entraînant un risque de déshydratation.$$)
      ),
      jsonb_build_object(
        'heading', $$La bilharziose, une maladie liée au contact avec l'eau$$,
        'body', $$La bilharziose est causée par un ver parasite dont les larves, appelées cercaires, se développent dans certains mollusques d'eau douce présents dans les mares et cours d'eau stagnants. Ces larves traversent la peau lors d'un contact avec l'eau, comme la baignade, la lessive ou la pêche, sans qu'il soit nécessaire de boire l'eau.$$,
        'highlights', array[$$bilharziose$$, $$cercaires$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La bilharziose se transmet par pénétration cutanée de larves (cercaires) libérées par des mollusques d'eau douce, lors d'un contact avec une eau stagnante contaminée, sans ingestion nécessaire.$$),
        'example', jsonb_build_object('statement', $$Pourquoi les enfants qui se baignent régulièrement dans la mare risquent-ils la bilharziose sans avoir bu son eau ?$$, 'solution', $$Parce que les larves du parasite (cercaires) pénètrent directement à travers la peau lors du contact avec l'eau contaminée, sans qu'il soit nécessaire d'avaler cette eau.$$),
        'fixation', jsonb_build_object('question', $$Par quelle voie les larves responsables de la bilharziose pénètrent-elles dans l'organisme ?$$, 'solution', $$Par pénétration à travers la peau, lors d'un contact avec de l'eau contaminée.$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi ces maladies sont-elles fréquentes dans certaines régions$$,
        'body', $$Ces maladies liées à l'eau sont plus fréquentes là où l'accès à l'eau potable et à l'assainissement (latrines, gestion des déchets) reste limité, et où les points d'eau utilisés pour boire ou pour les activités quotidiennes sont exposés à une contamination fécale ou hébergent les mollusques hôtes des parasites.$$,
        'highlights', array[$$accès à l'eau potable$$, $$assainissement$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les maladies liées à l'eau sont favorisées par un accès insuffisant à l'eau potable et à l'assainissement, ainsi que par la présence de points d'eau contaminés ou stagnants.$$),
        'example', jsonb_build_object('statement', $$Quel point commun explique la présence à la fois du choléra et de la bilharziose dans un même village ?$$, 'solution', $$Un accès insuffisant à l'eau potable et à l'assainissement, qui favorise à la fois la contamination fécale des points d'eau de boisson et la persistance d'eaux stagnantes hébergeant les mollusques hôtes des parasites.$$),
        'fixation', jsonb_build_object('question', $$Cite un facteur qui favorise la présence de maladies liées à l'eau dans une communauté.$$, 'solution', $$Un accès insuffisant à l'eau potable, ou l'absence de latrines et d'assainissement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le village, l'infirmier constate à la fois des cas de diarrhées sévères liés au puits et des cas de bilharziose liés à la baignade dans la mare.$$,
      'questions', array[
        $$Explique comment l'eau du puits a pu être contaminée.$$,
        $$Décris les symptômes principaux du choléra et de la fièvre typhoïde.$$,
        $$Explique pourquoi la bilharziose ne nécessite pas de boire l'eau contaminée pour être transmise.$$,
        $$Cite un facteur commun qui favorise la présence de ces différentes maladies dans le village.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment l'eau de boisson peut-elle devenir dangereuse pour la santé ?$$,
      'hint', $$Pense à la contamination par les matières fécales.$$,
      'expected', $$Elle peut être contaminée par des microorganismes pathogènes provenant de matières fécales, en l'absence d'assainissement adéquat des points d'eau.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux maladies transmises par ingestion d'eau contaminée.$$,
      'hint', $$Pense aux bactéries responsables de diarrhées ou de fièvre.$$,
      'expected', $$Le choléra et la fièvre typhoïde.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la bilharziose et comment se transmet-elle ?$$,
      'hint', $$Pense au contact avec l'eau stagnante, pas à l'ingestion.$$,
      'expected', $$C'est une maladie parasitaire dont les larves (cercaires), libérées par des mollusques d'eau douce, pénètrent à travers la peau lors d'un contact avec une eau stagnante contaminée.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi l'accès à l'eau potable et à l'assainissement réduit-il la fréquence de ces maladies ?$$,
      'hint', $$Pense à la source de contamination.$$,
      'expected', $$Parce qu'il limite la contamination des points d'eau par les matières fécales et réduit le contact avec des eaux stagnantes hébergeant des parasites, réduisant ainsi les risques de transmission.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-maladies-liees-eau';
