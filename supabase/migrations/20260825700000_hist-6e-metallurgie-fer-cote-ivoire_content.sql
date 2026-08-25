-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Histoire.
-- Cours : "Leçon 3 : La métallurgie du fer en Côte d'Ivoire" (Thème 2 :
-- La préhistoire de la Côte d'Ivoire). Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'une lecture, des élèves de 6ème découvrent cette phrase d'un article scientifique : « Maîtriser les techniques de la sidérurgie directe du fer suppose l'avènement d'un nouvel ordre économique et social. » Organisés en groupes par leur professeur, ils cherchent à localiser les sites de la métallurgie du fer en Côte d'Ivoire, à déterminer les étapes du travail du fer, et à apprécier les progrès économiques et sociaux qu'elle a permis.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les sites et les étapes du travail du fer$$,
        'body', $$La métallurgie est la transformation d'un minerai de fer en outil de travail. En Côte d'Ivoire, l'âge du fer se situe entre le XIe siècle avant J.-C. et le VIIe siècle après J.-C. Les sites, peu nombreux, se trouvent au Sud (Lozoua, Attinguié, Agboville), au Centre-Ouest (Oumé, Issia), à l'Ouest (Toulepleu) et au Nord (Odienné, Boundiali, Doropo). Le travail du fer comprend quatre étapes : l'extraction du minerai (creusé dans la terre), la fonte (chauffe dans un haut fourneau après lavage), la solidification (refroidissement en barres et boules de fer), et la transformation en outils (chauffe à rouge, façonnage à l'enclume et au marteau par le forgeron).$$,
        'highlights', array[$$âge du fer ivoirien : XIe siècle av. J.-C. au VIIe siècle apr. J.-C.$$, $$4 étapes : extraction → fonte → solidification → transformation en outils$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la dernière étape du travail du fer ?$$, 'solution', $$La transformation en outils, réalisée par le forgeron à l'aide de l'enclume et du marteau.$$)
      ),
      jsonb_build_object(
        'heading', $$Les progrès économiques$$,
        'body', $$La métallurgie du fer a permis l'apparition de nouveaux métiers (artisans, orfèvres, forgerons, fabricants d'armes), l'augmentation de la production agricole (grâce à de meilleurs outils comme les houes et les faucilles), le développement du commerce, et l'augmentation de la production aurifère (l'extraction de l'or nécessitant des outils en fer).$$,
        'highlights', array[$$progrès économiques : nouveaux métiers, hausse production agricole, commerce, production d'or$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi l'exploitation de l'or a-t-elle progressé grâce à la métallurgie du fer ?$$, 'solution', $$Parce que l'extraction de l'or dans les mines nécessite des outils en fer, plus efficaces que les outils en pierre.$$),
        'fixation', jsonb_build_object('question', $$Cite un nouveau métier apparu grâce à la métallurgie du fer.$$, 'solution', $$Par exemple : forgeron (ou orfèvre, ou fabricant d'armes).$$)
      ),
      jsonb_build_object(
        'heading', $$Les progrès sociaux$$,
        'body', $$Sur le plan social, la métallurgie du fer a entraîné l'amélioration des ustensiles et outils du quotidien, la naissance de nouvelles classes sociales (les artisans et la caste des forgerons), l'augmentation de l'espérance de vie, et une meilleure sécurité des populations (grâce à de meilleures armes de défense).$$,
        'highlights', array[$$progrès sociaux : nouveaux ustensiles, caste des forgerons, espérance de vie, sécurité$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle nouvelle classe sociale apparaît avec la métallurgie du fer ?$$, 'solution', $$La caste des forgerons (et les artisans en général).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une exposition organisée par le club d'Histoire-Géographie de leur établissement, des élèves découvrent des images de mines d'extraction de fer, de hauts fourneaux anciens et de divers outils en fer (pointes, haches, houes, couteaux) fabriqués par les hommes du passé.$$,
      'questions', array[
        $$Dis de quoi il est question dans cette situation.$$,
        $$Relève les éléments qui indiquent des étapes du travail du fer.$$,
        $$Es-tu d'accord avec l'idée que ces outils en fer ont transformé la vie des hommes ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la métallurgie ?$$,
      'hint', $$Elle transforme une matière première en objet utile.$$,
      'expected', $$La transformation d'un minerai de fer en outil de travail.$$
    ),
    jsonb_build_object(
      'question', $$Entre quels siècles se situe l'âge du fer en Côte d'Ivoire ?$$,
      'hint', $$Un siècle avant J.-C. et un siècle après J.-C.$$,
      'expected', $$Entre le XIe siècle avant Jésus-Christ et le VIIe siècle après Jésus-Christ.$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre les étapes du travail du fer : la transformation en outils, la fonte, l'extraction du minerai, la solidification.$$,
      'hint', $$On commence par sortir le minerai de terre.$$,
      'expected', $$1. Extraction du minerai, 2. Fonte, 3. Solidification, 4. Transformation en outils.$$
    ),
    jsonb_build_object(
      'question', $$La métallurgie du fer a-t-elle favorisé le développement du commerce ?$$,
      'hint', $$De meilleurs outils augmentent la production, donc les échanges.$$,
      'expected', $$Oui.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-6e-metallurgie-fer-cote-ivoire';
