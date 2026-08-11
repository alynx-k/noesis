-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3707: "SVT 2nd A_L7_Le changement climatique"
-- (https://lyc.ecole-ci.org/course/view.php?id=3707)
-- Resource "Je lis le résumé de la leçon", pluginfile "SVT 2nd A_L7_Le
-- changement climatique.pdf" (7 pages; internally "Leçon 5"). The source
-- itself quotes short excerpts from a published textbook (Éric Perilleux,
-- éd. Nathan) and a Greenpeace web page; none of that quoted material is
-- reproduced here.
-- Rewritten/paraphrased from the source PDF: the human causes of climate
-- change (fossil-fuel burning, CFCs, tropical deforestation, rice-paddy
-- methane), the 1860-2000 CO2/temperature data showing the greenhouse-effect
-- mechanism and its amplification and consequences (droughts, cyclones,
-- glacier melt, coastal flooding, ozone thinning), and mitigation levers
-- (renewable energy, reduced fossil-fuel dependence, forest protection,
-- awareness campaigns). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-changement-climatique',
  '2nde',
  'A',
  'svt',
  $$Le changement climatique$$,
  7,
  '2nde-a-svt-production-matiere-organique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club environnement de l'établissement organise une conférence sur la baisse de la pluviométrie observée dans la région. Le conférencier, professeur de climatologie, affirme que cette baisse de la pluviométrie, la hausse des températures et la multiplication des ouragans, des cyclones, des inondations et des feux de forêt constatés depuis quelques décennies sont provoqués par un changement climatique lié à certaines activités humaines. Pour mieux comprendre ce phénomène, les élèves de seconde présents décident d'en identifier les causes, d'en expliquer le mécanisme et de proposer des stratégies de lutte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le changement climatique est lié à des activités humaines$$,
        'body', $$Depuis le début de l'ère industrielle, les activités humaines modifient la composition de l'atmosphère : pluies acides, brouillard urbain et amincissement de la couche d'ozone stratosphérique en sont des manifestations visibles. L'extraction et la combustion du pétrole et du gaz pour produire de l'énergie libèrent d'importantes quantités de dioxyde de soufre, d'oxydes d'azote, de dioxyde de carbone et de méthane. Les chlorofluorocarbures (CFC), longtemps utilisés comme gaz propulseurs dans les bombes aérosols, les réfrigérateurs et les mousses, sont progressivement remplacés depuis 1989 par des composés non toxiques pour l'ozone, mais leur usage massif dans les appareils électroménagers des années 1970 avait déjà provoqué une forte hausse de leur concentration atmosphérique dès 1980. Dans les régions tropicales, la destruction des forêts par le feu pour créer des pâturages et des terres cultivables libère également du dioxyde de carbone et du méthane, tout comme la culture du riz. Face à ces constats, plusieurs accords internationaux ont vu le jour : le protocole de Montréal (1987), la convention de la Haye (1989) et le sommet de Rio (1998).$$,
        'highlights', array[$$chlorofluorocarbures (CFC)$$, $$déforestation$$, $$combustibles fossiles$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux activités humaines responsables du rejet de gaz à effet de serre dans l'atmosphère.$$, 'solution', $$La combustion de combustibles fossiles (pétrole, gaz) et la destruction des forêts tropicales par le feu (on peut aussi citer la culture du riz ou l'usage des CFC).$$)
      ),
      jsonb_build_object(
        'heading', $$Le réchauffement suit un processus lié à l'effet de serre$$,
        'body', $$La mesure de la température moyenne de l'atmosphère et de sa teneur en dioxyde de carbone entre 1860 et 2000 montre une évolution parallèle des deux grandeurs : le CO2 passe de 290 à 320 parties par million entre 1860 et 1960, puis de 320 à 350 ppm en seulement 25 ans, entre 1960 et 1985, tandis que la température moyenne passe de -0,4°C à +0,2°C par rapport à la moyenne de référence. La deuxième révolution industrielle, amorcée en 1870, a conduit à une consommation croissante de combustibles fossiles et donc à des rejets de CO2 de plus en plus importants. Ce surplus de CO2 piège une partie du rayonnement infrarouge émis par la Terre, un peu comme les vitres d'une serre, et renvoie cette énergie vers le sol : c'est l'effet de serre, un mécanisme naturel qui maintient la température moyenne terrestre à 15°C (sans lui, elle serait de -20°C et la vie n'y serait pas possible). Mais les activités humaines ont introduit d'autres gaz à effet de serre (méthane, oxyde nitreux, CFC) qui amplifient ce phénomène naturel ; les CFC détruisent en plus les molécules d'ozone, rendant la couche d'ozone perméable aux rayons ultraviolets dangereux. L'intensification de l'effet de serre entraîne des sécheresses, des feux de brousse, des ouragans, la fonte progressive des glaciers et l'inondation de villes côtières.$$,
        'highlights', array[$$effet de serre$$, $$gaz à effet de serre$$, $$couche d'ozone$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Période$$, $$Évolution du CO2 atmosphérique$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$1860 - 1960$$, $$290 à 320 ppm (+30 ppm en 100 ans)$$),
            jsonb_build_array($$1960 - 1985$$, $$320 à 350 ppm (+30 ppm en 25 ans, soit une hausse plus rapide)$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi l'effet de serre est-il un phénomène naturel indispensable à la vie, mais aussi un problème lorsqu'il est amplifié ?$$, 'solution', $$Parce qu'il maintient naturellement la température terrestre à 15°C, rendant la vie possible, mais que son amplification par les gaz à effet de serre d'origine humaine provoque un réchauffement excessif aux conséquences dangereuses.$$)
      ),
      jsonb_build_object(
        'heading', $$Le changement climatique peut être freiné$$,
        'body', $$Plusieurs leviers permettent de limiter le changement climatique : réduire le plus rapidement possible les émissions mondiales de gaz à effet de serre ; diminuer la dépendance aux combustibles fossiles et à l'énergie nucléaire au profit d'une véritable révolution énergétique fondée sur les énergies renouvelables (éolien, solaire, hydraulique) ; mettre fin à la déforestation des forêts tropicales encore intactes ; fixer des objectifs ambitieux d'efficacité énergétique pour les véhicules et les équipements ; et sensibiliser les populations à l'abandon des feux de brousse incontrôlés. Certaines régions, grâce à un fort potentiel éolien et solaire, pourraient réduire de moitié leurs émissions de carbone d'ici 2050 tout en développant une énergie plus abordable et de nouveaux emplois.$$,
        'highlights', array[$$énergies renouvelables$$, $$révolution énergétique$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi remplacer les combustibles fossiles par des énergies renouvelables permet-il de lutter contre le changement climatique ?$$, 'solution', $$Parce que la production d'énergie renouvelable (éolienne, solaire, hydraulique) ne rejette pas de dioxyde de carbone, contrairement à la combustion du pétrole, du gaz ou du charbon, ce qui limite l'amplification de l'effet de serre.$$),
        'fixation', jsonb_build_object('question', $$Cite deux mesures permettant de freiner le changement climatique.$$, 'solution', $$Développer les énergies renouvelables et réduire la déforestation (on peut aussi citer la réduction des émissions de gaz à effet de serre ou la sensibilisation des populations).$$)
      ),
      jsonb_build_object(
        'heading', $$Bilan : un phénomène d'origine humaine qu'il est possible de freiner$$,
        'body', $$De nombreuses activités humaines impactent négativement et durablement le climat, à travers l'augmentation de l'effet de serre et l'amincissement de la couche d'ozone. Ce changement climatique explique la baisse de la pluviométrie, la hausse des températures et la multiplication des événements extrêmes évoqués lors de la conférence. Pour le freiner, l'humanité doit adopter de nouvelles technologies de développement, notamment les énergies renouvelables, et avoir une attitude responsable vis-à-vis des ressources naturelles.$$,
        'highlights', array[$$attitude responsable$$, $$technologies de développement$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle attitude l'humanité doit-elle adopter pour freiner le changement climatique, selon la conclusion de la leçon ?$$, 'solution', $$Adopter de nouvelles technologies de développement (énergies renouvelables) et une attitude responsable envers les ressources naturelles.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un village agricole, les habitants constatent depuis plusieurs années une baisse des récoltes qu'ils attribuent à des pluies de plus en plus irrégulières et à des températures de plus en plus élevées. Un agent du ministère de l'agriculture leur explique que ces changements sont liés au changement climatique et les invite à en comprendre les causes avant de proposer des solutions adaptées à leur village.$$,
      'questions', array[
        $$Cite deux activités humaines qui peuvent expliquer le changement climatique observé dans ce village.$$,
        $$Explique, à l'aide de la notion d'effet de serre, comment ces activités entraînent une hausse des températures.$$,
        $$Quelles conséquences du changement climatique peuvent expliquer la baisse des récoltes dans ce village ?$$,
        $$Propose deux solutions que les habitants ou les autorités locales pourraient mettre en place pour limiter ce changement climatique.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel phénomène naturel permet de maintenir la température moyenne de la Terre à 15°C ?$$,
      'hint', $$Il est amplifié par les gaz à effet de serre d'origine humaine.$$,
      'expected', $$L'effet de serre.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux gaz, autres que le dioxyde de carbone, dont l'augmentation dans l'atmosphère est liée aux activités humaines.$$,
      'hint', $$L'un est produit par la culture du riz, l'autre était utilisé dans les réfrigérateurs et les bombes aérosols.$$,
      'expected', $$Le méthane et les chlorofluorocarbures (CFC), ou l'oxyde nitreux.$$
    ),
    jsonb_build_object(
      'question', $$Quel accord international, signé en 1987, visait à réduire les gaz détruisant la couche d'ozone ?$$,
      'hint', $$Il porte le nom d'une ville canadienne.$$,
      'expected', $$Le protocole de Montréal.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux solutions permettant de freiner le changement climatique.$$,
      'hint', $$L'une concerne la production d'énergie, l'autre la protection des forêts.$$,
      'expected', $$Développer les énergies renouvelables et réduire la déforestation (par exemple).$$
    )
  ),
  now()
);
