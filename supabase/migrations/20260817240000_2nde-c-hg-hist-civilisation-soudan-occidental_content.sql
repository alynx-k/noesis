-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Histoire-Géographie, categoryid=114. Moodle course id 3654: "2nde H7-La
-- civilisation du Soudan Occidental au Moyen-Age"
-- (https://lyc.ecole-ci.org/course/view.php?id=3654). Resource "Je lis le
-- résumé de la leçon", mod_resource id 37051, redirecting to pluginfile "2nde
-- H7-La civilisation du Soudan Occidental au Moyen-Age.pdf". Cross-checked
-- against the already-sourced Seconde A lesson for this exact same
-- title/filename (categoryid=102): identical PDF filename and, on page-1
-- inspection of the situation d'apprentissage, identical wording, confirming
-- this Histoire-Géographie lesson is common-trunk content shared by Seconde A
-- and Seconde C on this platform. Rewritten/paraphrased from the source PDF
-- (Thème 2, Leçon 4). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-hg-hist-civilisation-soudan-occidental',
  '2nde',
  'C',
  'histoire',
  $$La civilisation du Soudan occidental au Moyen Âge$$,
  7,
  '2nde-c-hg-hist-democratie-athenienne',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une conférence sur l'islamisation de l'Afrique occidentale, des élèves de seconde sont surpris d'apprendre que l'arrivée de l'islam a profondément transformé les sociétés traditionnelles du Soudan occidental. Ils décident de mener des recherches pour comprendre cette civilisation avant l'islamisation, les différentes voies par lesquelles l'islam s'y est répandu, et l'influence durable qu'il y a laissée.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une civilisation pré-islamique déjà bien structurée$$,
        'body', $$Avant le VIIe siècle, le Soudan occidental — vaste région d'Afrique de l'Ouest limitée par le Sahara, la zone forestière, l'océan Atlantique et le lac Tchad — abritait déjà des royaumes puissants et centralisés, comme le Ghana et le Mali, dirigés par des souverains au pouvoir absolu, appuyés sur une armée qui assurait conquêtes et sécurité. L'économie reposait sur l'agriculture de subsistance (mil, riz, igname), mais surtout sur un commerce transsaharien actif reliant des villes comme Tombouctou, Djenné ou Koumbi-Saleh au Maghreb : le Sud exportait esclaves, or et cola, tandis que le Nord fournissait sel, étoffes et dattes, les échanges se faisant par troc ou à l'aide de monnaies comme les cauris.$$,
        'highlights', array[$$royaumes centralisés$$, $$commerce transsaharien$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux grands empires qui existaient au Soudan occidental avant l'islamisation.$$, 'solution', $$Par exemple le royaume du Ghana et le royaume du Mali.$$)
      ),
      jsonb_build_object(
        'heading', $$Une société hiérarchisée et animiste$$,
        'body', $$La société soudanaise pré-islamique, peuplée notamment de Mandé, de Peuls, de Haoussa et de Bambara, se présentait comme une pyramide : l'aristocratie (souverain et sa cour) au sommet, les hommes libres stratifiés en classes sociales (dont, chez les Mandé, des hommes de castes comme les forgerons ou les griots) au milieu, et les esclaves et captifs à la base. Sur le plan religieux, ces peuples étaient animistes : ils croyaient en un Dieu suprême mais s'adressaient à lui par l'intermédiaire de divinités secondaires (eau, végétation, animaux), rendaient un culte aux ancêtres, et pratiquaient sacrifices et offrandes sous la conduite de féticheurs.$$,
        'highlights', array[$$société pyramidale$$, $$animisme$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce que l'animisme, tel que pratiqué au Soudan occidental avant l'islamisation ?$$, 'solution', $$Une religion où l'on croit en un Dieu suprême, mais où l'on s'adresse à lui par l'intermédiaire de divinités secondaires (éléments naturels, ancêtres), avec un culte fondé sur les sacrifices et les offrandes.$$)
      ),
      jsonb_build_object(
        'heading', $$Les voies pacifiques de l'islamisation$$,
        'body', $$La diffusion de l'islam à partir du VIIe siècle emprunte d'abord des voies pacifiques. Le commerce transsaharien met en contact marchands arabes et populations noires, qui se convertissent parfois par imitation pour prospérer comme leurs partenaires d'affaires. Certains souverains, comme les successeurs de Soundiata Keïta, se convertissent pour asseoir leur autorité ; l'empereur Kankou Moussa fait ainsi construire mosquées et écoles au XIVe siècle. Les hommes de religion (imams, marabouts), respectés pour leur savoir et leur exemplarité, diffusent aussi l'islam par l'enseignement. Enfin, de nombreux esclaves se convertissent au contact de leurs maîtres devenus musulmans.$$,
        'highlights', array[$$conversion par le commerce$$, $$Kankou Moussa$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi certains souverains africains ont-ils choisi de se convertir volontairement à l'islam ?$$, 'solution', $$Parce qu'ils considéraient l'islam comme une force politique utile pour asseoir et renforcer leur autorité sur leurs sujets.$$),
        'fixation', jsonb_build_object('question', $$Quel empereur du Mali a marqué l'islamisation de l'Afrique occidentale par la construction de mosquées et d'écoles ?$$, 'solution', $$Kankou Moussa (1312-1335).$$)
      ),
      jsonb_build_object(
        'heading', $$L'islamisation par le djihad$$,
        'body', $$L'islam s'est aussi répandu par la force, à travers des conquêtes militaires initiées en 1042 par les Almoravides, qui détruisent et convertissent de force l'empire du Ghana en 1076-1077, accélérant ainsi l'islamisation de toute la région. Ces méthodes combinaient guerre sainte, razzias et application de la loi islamique aux populations soumises. Plus tard, d'autres figures poursuivront cette islamisation militaire, comme El Hadj Samory Touré (empire du Wassoulou) ou Ousman Dan Fodio (califat de Sokoto).$$,
        'highlights', array[$$Almoravides$$, $$djihad$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel empire soudanais est détruit et reconverti de force par les Almoravides en 1076-1077 ?$$, 'solution', $$L'empire du Ghana.$$)
      ),
      jsonb_build_object(
        'heading', $$L'impact durable de l'islam sur le Soudan occidental$$,
        'body', $$L'islamisation transforme profondément la région : apparition de califats (comme celui de Sokoto) où la loi musulmane s'applique et où des lettrés marabouts intègrent l'administration ; essor de villes devenues centres culturels et intellectuels, donnant naissance à une civilisation arabo-soudanienne originale, parfois qualifiée d'« islam noir » du fait de son adaptation aux réalités africaines (confréries comme la Tidjaniya, noms arabes africanisés) ; et enfin dynamisme économique renforcé, avec l'essor de grandes villes marchandes comme Tombouctou, Djenné ou Kano. Cette civilisation islamisée résistera d'ailleurs plus tard à la conquête coloniale européenne.$$,
        'highlights', array[$$califats$$, $$« islam noir »$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi certains historiens parlent-ils d'un « islam noir » au sujet du Soudan occidental islamisé ?$$, 'solution', $$Parce que la civilisation négro-africaine a influencé en retour la pratique de l'islam, donnant naissance à un islam modéré adapté aux réalités locales (confréries, noms arabes africanisés).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un manuel d'histoire affirme que « le Soudan occidental a connu une civilisation attrayante et bien structurée avant l'islamisation » et que cette région fut un centre important de la traite. Un élève de seconde doit expliquer cette civilisation pré-islamique et discuter son évolution après l'arrivée de l'islam.$$,
      'questions', array[
        $$Décris l'organisation politique et sociale du Soudan occidental avant l'islamisation.$$,
        $$Cite deux voies pacifiques par lesquelles l'islam s'est répandu au Soudan occidental.$$,
        $$Explique le rôle des Almoravides dans l'islamisation par le djihad.$$,
        $$Cite deux conséquences de l'islamisation sur la civilisation du Soudan occidental.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel grand commerce reliait le Soudan occidental au Maghreb à travers le désert du Sahara ?$$,
      'hint', $$Son nom évoque la traversée du plus grand désert du monde.$$,
      'expected', $$Le commerce transsaharien.$$
    ),
    jsonb_build_object(
      'question', $$Quelle religion pratiquaient les peuples du Soudan occidental avant l'islamisation ?$$,
      'hint', $$Cette religion vénère un Dieu suprême à travers des intermédiaires naturels.$$,
      'expected', $$L'animisme.$$
    ),
    jsonb_build_object(
      'question', $$Quel peuple berbère a islamisé de force l'empire du Ghana en 1076-1077 ?$$,
      'hint', $$Leur conquête a commencé en 1042.$$,
      'expected', $$Les Almoravides.$$
    ),
    jsonb_build_object(
      'question', $$Quel empereur malien a marqué l'islamisation par la construction de mosquées et d'écoles au XIVe siècle ?$$,
      'hint', $$Son nom est associé à un célèbre pèlerinage à La Mecque.$$,
      'expected', $$Kankou Moussa.$$
    )
  ),
  now()
);
