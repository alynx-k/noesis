-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3323: "2nde_HISTOIRE_T2_L5: LES TRAITES DES NOIRS"
-- (https://lyc.ecole-ci.org/course/view.php?id=3323)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33115, redirecting
-- to pluginfile "2nde H8-Les traites des Noirs.pdf".
-- Rewritten/paraphrased from the source PDF (Thème 2, Leçon 5): the two
-- slave trades affecting Africa (trans-Saharan, VIIth-XXth century; Atlantic,
-- XVth-XIXth century), their respective causes, the organization of each
-- (including the Atlantic triangular trade), and their consequences for
-- Africa/America/Europe plus the abolition process. 100% original wording;
-- no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-hist-traites-des-noirs',
  '2nde',
  'A',
  'histoire',
  $$Les traites des Noirs$$,
  8,
  '2nde-a-hg-hist-civilisation-soudan-occidental',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un film documentaire projeté par le club d'Histoire-Géographie révèle que la présence de populations noires sur le continent américain s'explique par la déportation massive d'Africains réduits en esclavage. Choqués, des élèves de seconde décident de mener des recherches pour comprendre l'origine de cette traite, son organisation concrète et ses conséquences durables.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Deux traites distinctes, aux causes différentes$$,
        'body', $$L'Afrique a connu deux grandes traites de population noire. La traite transsaharienne, pratiquée par les marchands arabes à travers le Sahara entre le VIIe et le XXe siècle, répondait à des besoins précis : main-d'œuvre pour les plantations de canne à sucre ou les mines de sel d'Afrique du Nord, transport de l'or, ou encore emploi de femmes comme domestiques. La traite atlantique, elle, s'étend du XVe au XIXe siècle et trouve sa cause principale dans la découverte de l'Amérique par Christophe Colomb en 1492 : la mise en valeur de ce « nouveau monde » exigeait une main-d'œuvre nombreuse, que l'on est allé chercher en Afrique.$$,
        'highlights', array[$$traite transsaharienne$$, $$traite atlantique$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La traite atlantique est le commerce de personnes réduites en esclavage entre l'Afrique et l'Amérique, à travers l'océan Atlantique, du XVe au XIXe siècle.$$),
        'fixation', jsonb_build_object('question', $$Quel événement de 1492 est considéré comme la cause principale de la traite atlantique ?$$, 'solution', $$La découverte de l'Amérique par Christophe Colomb.$$)
      ),
      jsonb_build_object(
        'heading', $$L'organisation de la traite transsaharienne$$,
        'body', $$La traite transsaharienne suivait un circuit en trois temps : l'approvisionnement en esclaves capturés en Afrique noire, leur transport à travers le désert du Sahara dans des conditions extrêmement difficiles, puis leur vente en Afrique du Nord et dans les régions méditerranéennes d'Europe. Cette traite s'est étalée sur près de treize siècles, ce qui en fait, en durée, l'une des plus longues formes de traite de l'histoire.$$,
        'highlights', array[$$approvisionnement$$, $$transport transsaharien$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles étaient les trois grandes étapes du circuit de la traite transsaharienne ?$$, 'solution', $$L'approvisionnement en esclaves en Afrique noire, leur transport à travers le Sahara, puis leur vente en Afrique du Nord et en Europe méditerranéenne.$$)
      ),
      jsonb_build_object(
        'heading', $$Le commerce triangulaire, moteur de la traite atlantique$$,
        'body', $$La traite atlantique s'organisait selon un circuit à trois branches, appelé commerce triangulaire. Des navires partaient d'Europe chargés de marchandises de peu de valeur (« pacotilles » : bijoux, miroirs, alcool, poudre à canon) destinées à être échangées en Afrique contre des captifs. Ces derniers étaient ensuite transportés à travers l'océan Atlantique jusqu'en Amérique, où ils étaient vendus comme main-d'œuvre servile. Les navires repartaient enfin vers l'Europe chargés de produits tropicaux (sucre, coton, indigo) issus du travail de ces mêmes esclaves.$$,
        'highlights', array[$$commerce triangulaire$$, $$pacotilles$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi appelle-t-on ce commerce « triangulaire » ?$$, 'solution', $$Parce qu'il reliait trois continents dans un circuit en boucle : l'Europe (départ des pacotilles), l'Afrique (échange contre des esclaves) et l'Amérique (vente des esclaves, achat de produits tropicaux renvoyés vers l'Europe).$$),
        'fixation', jsonb_build_object('question', $$Que transportaient les navires au retour d'Amérique vers l'Europe, dans le commerce triangulaire ?$$, 'solution', $$Des produits tropicaux comme le sucre, le coton ou l'indigo.$$)
      ),
      jsonb_build_object(
        'heading', $$Des conséquences considérables sur trois continents$$,
        'body', $$Pour l'Afrique, les traites ont provoqué un dépeuplement important, la perte d'une main-d'œuvre jeune et vigoureuse, et le délaissement de nombreuses activités économiques traditionnelles au profit de la capture d'esclaves. Pour l'Amérique, elles ont au contraire contribué au peuplement du continent, à sa prospérité économique et à l'apport durable de nombreuses valeurs culturelles africaines (musique, spiritualité). Pour l'Europe, enfin, elles ont permis un enrichissement considérable par l'accumulation de capitaux et le développement des activités portuaires.$$,
        'highlights', array[$$dépeuplement de l'Afrique$$, $$enrichissement de l'Europe$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Continent$$, $$Conséquence principale$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Afrique$$, $$Dépeuplement, perte de main-d'œuvre$$),
            jsonb_build_array($$Amérique$$, $$Peuplement, apport de valeurs culturelles africaines$$),
            jsonb_build_array($$Europe$$, $$Accumulation de capitaux, essor portuaire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite une conséquence culturelle durable de la traite atlantique pour l'Amérique.$$, 'solution', $$L'apport de nombreuses valeurs culturelles africaines, par exemple dans la musique (negro-spiritual, jazz).$$)
      ),
      jsonb_build_object(
        'heading', $$Un long combat pour l'abolition$$,
        'body', $$L'abolition de la traite résulte de la mobilisation de plusieurs acteurs : des intellectuels (écrivains, philosophes, économistes) qui en dénoncent les principes, et des organisations philanthropiques comme la société antiesclavagiste créée en Angleterre en 1787 ou la Société des amis des Noirs, fondée en France en 1788. Ces mobilisations aboutissent à des abolitions officielles, mais à des dates très différentes selon les puissances : 1807 dans les colonies britanniques, 1848 dans les colonies françaises, 1860 aux États-Unis et 1888 au Brésil, l'un des tout derniers pays à y mettre fin.$$,
        'highlights', array[$$société antiesclavagiste$$, $$Société des amis des Noirs$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle organisation philanthropique, créée en France en 1788, a milité pour l'abolition de la traite ?$$, 'solution', $$La Société des amis des Noirs.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conférencier affirme que les traites des Noirs concernent d'une part la traite transsaharienne et d'autre part la traite atlantique, aux origines différentes, et qu'elles ont entraîné de nombreuses conséquences surtout pour l'Afrique. Un élève de seconde doit expliquer et discuter cette affirmation.$$,
      'questions', array[
        $$Distingue la traite transsaharienne de la traite atlantique par leur période et leur zone géographique.$$,
        $$Décris les trois étapes du commerce triangulaire.$$,
        $$Cite une conséquence de la traite pour chacun des trois continents concernés (Afrique, Amérique, Europe).$$,
        $$Cite deux acteurs ou organisations ayant œuvré pour l'abolition de la traite.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel événement de 1492 est considéré comme la cause principale de la traite atlantique ?$$,
      'hint', $$C'est un événement lié à un navigateur célèbre.$$,
      'expected', $$La découverte de l'Amérique par Christophe Colomb.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on le commerce reliant l'Europe, l'Afrique et l'Amérique pendant la traite atlantique ?$$,
      'hint', $$Le nom évoque une figure géométrique à trois côtés.$$,
      'expected', $$Le commerce triangulaire.$$
    ),
    jsonb_build_object(
      'question', $$Quelle organisation antiesclavagiste a été créée en Angleterre en 1787 ?$$,
      'hint', $$Son nom indique clairement son objectif contre l'esclavage.$$,
      'expected', $$La société antiesclavagiste pour l'abolition de la traite des Noirs.$$
    ),
    jsonb_build_object(
      'question', $$En quelle année la traite a-t-elle été abolie dans les colonies britanniques ?$$,
      'hint', $$C'est au début du XIXe siècle.$$,
      'expected', $$En 1807.$$
    )
  ),
  now()
);
