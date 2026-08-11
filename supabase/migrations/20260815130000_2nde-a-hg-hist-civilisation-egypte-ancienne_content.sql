-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3352: "2nde_HISTOIRE_T2_L2: LA CIVILISATION DE L'EGYPTE
-- ANCIENNE" (https://lyc.ecole-ci.org/course/view.php?id=3352)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33463, redirecting
-- to pluginfile "2nde H5-La Civilisation de lEgypte ancienne_.pdf".
-- Rewritten/paraphrased from the source PDF (Thème 2, Leçon 2): Egypt as a
-- "gift of the Nile" (geography, floods), its theocratic monarchy and
-- deconcentrated administration (pharaoh, vizier, governors, scribes), its
-- hierarchical society and agriculture-based economy, its polytheistic
-- religion and cultural achievements (hieroglyphs), and its rise through the
-- Old/Middle/New Kingdoms followed by its decline under foreign invasions.
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-hist-civilisation-egypte-ancienne',
  '2nde',
  'A',
  'histoire',
  $$La civilisation de l'Égypte ancienne$$,
  5,
  '2nde-a-hg-hist-prehistoire-afrique-monde',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un documentaire consacré aux pharaons d'Égypte et aux grandes pyramides fascine des élèves de seconde. Le pharaon Ramsès II et la pyramide de Gizeh y sont longuement commentés, et l'historien Cheikh Anta Diop y est cité pour avoir défendu que cette civilisation était l'œuvre de peuples noirs. Intrigués, les élèves décident d'approfondir leurs connaissances sur les grands traits de la civilisation égyptienne antique et sur son évolution.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'Égypte ancienne, un « don du Nil »$$,
        'body', $$Située au nord-est de l'Afrique, entre la mer Méditerranée, le désert d'Arabie et celui de Libye, l'Égypte ancienne est un territoire globalement hostile, dominé par la chaleur et l'aridité du désert. Mais le Nil, long de 6 700 km, y change tout : sa crue annuelle, entre juin et juillet, dépose un limon fertile qui a permis le développement de l'agriculture, du commerce et du transport. Cette générosité du fleuve, qui a permis aux populations de se sédentariser et de bâtir l'une des plus brillantes civilisations de l'Antiquité, explique la formule de l'historien grec Hérodote : « l'Égypte est un don du Nil ». Le fleuve divisait aussi le pays en deux, la Basse-Égypte au nord (capitale Memphis) et la Haute-Égypte au sud (capitale Thèbes).$$,
        'highlights', array[$$le Nil$$, $$crue annuelle$$, $$« don du Nil »$$]::text[],
        'property', jsonb_build_object('label', $$Citation$$, 'text', $$Selon l'historien grec Hérodote, « l'Égypte est un don du Nil », le fleuve étant à l'origine de toute la richesse agricole et économique du pays.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi la crue annuelle du Nil était-elle si précieuse pour les Égyptiens ?$$, 'solution', $$Parce qu'elle déposait un limon fertile qui rendait les terres cultivables, ce qui a permis le développement de l'agriculture dans un territoire par ailleurs dominé par le désert.$$)
      ),
      jsonb_build_object(
        'heading', $$Une monarchie théocratique et une administration organisée$$,
        'body', $$L'Égypte est dirigée par un pharaon considéré comme un dieu vivant, fils du dieu-soleil Amon-Rê, dont le pouvoir est absolu : il est à la fois chef religieux, chef militaire et garant de l'unité entre Haute et Basse-Égypte, symbolisée par sa double couronne. Pour administrer un aussi vaste territoire, il s'appuie sur un vizir (premier ministre), des gouverneurs qui dirigent les provinces (appelées nomes), et des scribes, seuls fonctionnaires capables de lire et d'écrire les hiéroglyphes, chargés de rendre compte par écrit au pharaon.$$,
        'highlights', array[$$pharaon$$, $$vizir$$, $$scribes$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel titre porte le premier ministre du pharaon, chef des gouverneurs de provinces ?$$, 'solution', $$Le vizir.$$)
      ),
      jsonb_build_object(
        'heading', $$Une société hiérarchisée, une économie agricole$$,
        'body', $$La société égyptienne se présente comme une pyramide stricte : le pharaon au sommet, puis les privilégiés (nobles, prêtres, hauts fonctionnaires, scribes), et enfin le peuple (armée, artisans, paysans, esclaves). L'économie repose essentiellement sur l'agriculture, rendue possible par l'irrigation des terres inondées par le Nil (blé, orge, dattes) ; les besoins de mesurer les crues et d'organiser le calendrier agricole ont d'ailleurs donné naissance aux mathématiques, à l'astronomie et à l'agronomie égyptiennes. L'artisanat (orfèvrerie, tissage) et le commerce fluvial (exportation de papyrus, importation de bois) complètent cette économie.$$,
        'highlights', array[$$société pyramidale$$, $$agriculture irriguée$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Niveau social$$, $$Groupes concernés$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Sommet$$, $$Le pharaon$$),
            jsonb_build_array($$Privilégiés$$, $$Nobles, prêtres, hauts fonctionnaires, scribes$$),
            jsonb_build_array($$Peuple$$, $$Armée, artisans, paysans, esclaves$$)
          )
        ),
        'example', jsonb_build_object('statement', $$En quoi les besoins pratiques liés au Nil ont-ils favorisé le développement des mathématiques et de l'astronomie en Égypte ancienne ?$$, 'solution', $$Il fallait mesurer précisément le niveau des crues et établir un calendrier agricole fiable, ce qui a nécessité le développement de techniques de calcul et d'observation astronomique.$$),
        'fixation', jsonb_build_object('question', $$Quels groupes sociaux composent la catégorie des « privilégiés » dans l'Égypte ancienne ?$$, 'solution', $$Les nobles, les prêtres, les hauts fonctionnaires et les scribes.$$)
      ),
      jsonb_build_object(
        'heading', $$Une vie religieuse et culturelle foisonnante$$,
        'body', $$Les Égyptiens sont polythéistes : parmi leurs divinités principales figurent Amon-Rê (le dieu soleil), Horus (le dieu faucon), Isis (déesse de la maternité) et Osiris (dieu des morts). La croyance en une vie après la mort explique l'importance des rites funéraires, des tombeaux et des nécropoles. Sur le plan culturel, les Égyptiens ont inventé l'écriture hiéroglyphique, composée d'environ 5 000 signes, et ont réalisé d'importantes avancées en géométrie, en médecine, en architecture (les pyramides) et en philosophie.$$,
        'highlights', array[$$polythéisme$$, $$hiéroglyphes$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel dieu égyptien est associé au soleil et considéré comme le père du pharaon ?$$, 'solution', $$Amon-Rê.$$)
      ),
      jsonb_build_object(
        'heading', $$Grandeur et décadence de l'Égypte ancienne$$,
        'body', $$L'histoire égyptienne se déploie sur environ trente dynasties, regroupées en trois grandes périodes de rayonnement séparées par des « périodes intermédiaires » de troubles. L'Ancien Empire (vers -2600 à -2200) voit la construction des grandes pyramides de Gizeh (Khéops, Khephren, Mykérinos). Le Moyen Empire (vers -2050 à -1800) est marqué par une politique d'expansion, avant l'invasion des Hyksos. Le Nouvel Empire (vers -1600 à -1100), avec des pharaons comme Ramsès II, voit l'Égypte reconquérir son indépendance et rayonner militairement et culturellement dans toute la Méditerranée. À partir du VIIe siècle avant J.-C., cependant, l'affaiblissement progressif du pouvoir des pharaons et une succession d'invasions étrangères (Assyriens, Perses, Grecs, puis Romains) précipitent le déclin de cette brillante civilisation.$$,
        'highlights', array[$$Ancien Empire$$, $$Nouvel Empire$$, $$invasions étrangères$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Période$$, $$Fait marquant$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ancien Empire (-2600 à -2200)$$, $$Construction des grandes pyramides de Gizeh$$),
            jsonb_build_array($$Moyen Empire (-2050 à -1800)$$, $$Expansion territoriale, puis invasion des Hyksos$$),
            jsonb_build_array($$Nouvel Empire (-1600 à -1100)$$, $$Rayonnement militaire et culturel sous Ramsès II$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite deux puissances étrangères qui ont envahi l'Égypte lors de son déclin.$$, 'solution', $$Par exemple les Assyriens et les Perses (ou les Grecs et les Romains).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un documentaire affirme que l'Égypte a connu « la plus belle et la plus longue civilisation de l'histoire de l'humanité » et que c'est en Égypte qu'est née l'écriture. Un élève de seconde doit expliquer cette affirmation et apprécier le rôle du Nil dans cette civilisation.$$,
      'questions', array[
        $$Explique la formule d'Hérodote : « l'Égypte est un don du Nil ».$$,
        $$Décris l'organisation administrative de l'Égypte ancienne (pharaon, vizir, gouverneurs, scribes).$$,
        $$Présente les trois grandes périodes de rayonnement de l'Égypte ancienne.$$,
        $$Explique les causes du déclin de l'Égypte ancienne à partir du VIIe siècle avant J.-C.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel fleuve a permis le développement de la civilisation égyptienne ancienne dans un environnement désertique ?$$,
      'hint', $$C'est l'un des plus longs fleuves du monde.$$,
      'expected', $$Le Nil.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on les fonctionnaires égyptiens seuls habilités à écrire et à lire les hiéroglyphes ?$$,
      'hint', $$Leur nom est resté dans le vocabulaire français pour désigner un copiste.$$,
      'expected', $$Les scribes.$$
    ),
    jsonb_build_object(
      'question', $$Sous quel Empire les grandes pyramides de Gizeh ont-elles été construites ?$$,
      'hint', $$C'est la première des trois grandes périodes de l'Égypte ancienne.$$,
      'expected', $$L'Ancien Empire.$$
    ),
    jsonb_build_object(
      'question', $$Quel dieu égyptien est représenté sous la forme d'un faucon ?$$,
      'hint', $$Il fait partie des grandes divinités citées dans la leçon, aux côtés d'Amon-Rê, Isis et Osiris.$$,
      'expected', $$Horus.$$
    )
  ),
  now()
);
