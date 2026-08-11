-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde C,
-- Histoire-Géographie, categoryid=114. Moodle course id 3623: "2nde G1-La
-- géographie Objet ,Intérêt et démarche"
-- (https://lyc.ecole-ci.org/course/view.php?id=3623). Resource "Je lis le
-- résumé de la leçon", mod_resource id 36691, redirecting to pluginfile "2nde
-- G1-La géographie Objet ,Intérêt et démarche.pdf". Cross-checked against the
-- already-sourced Seconde A lesson for this exact same title/filename
-- (categoryid=102): identical PDF filename and, on page-1 inspection of the
-- situation d'apprentissage, identical wording, confirming this
-- Histoire-Géographie lesson is common-trunk content shared by Seconde A and
-- Seconde C on this platform. Rewritten/paraphrased from the source PDF
-- (Thème 1, Leçon 1). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-c-hg-geo-objet-interet-demarche',
  '2nde',
  'C',
  'geographie',
  $$La géographie : objet, intérêt et démarche$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant un match de football diffusé à la radio, le commentateur explique que la sélection ivoirienne doit s'adapter au climat et au relief du pays qui accueille la compétition internationale. En classe de seconde, deux élèves se disputent : l'un pense que la géographie se limite à dessiner des cartes, l'autre affirme qu'il s'agit d'une véritable science. Le professeur d'histoire-géographie propose de mener l'enquête pour trancher.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définir la géographie et son objet d'étude$$,
        'body', $$Le mot « géographie » vient du grec ancien et signifie littéralement « description de la Terre » (gê, la Terre, et graphein, décrire ou dessiner). Mais la discipline a beaucoup évolué depuis l'Antiquité : elle ne se contente plus de décrire, elle explique aussi les phénomènes naturels et humains observés à la surface du globe. On la définit aujourd'hui comme la science de l'espace, dont l'objet d'étude central est l'Homme dans son milieu de vie, c'est-à-dire dans l'espace qu'il occupe et qu'il transforme.$$,
        'highlights', array[$$science de l'espace$$, $$objet d'étude$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La géographie est la science qui décrit et explique les phénomènes naturels et humains à la surface de la Terre ; son objet d'étude est l'Homme dans son espace de vie.$$),
        'fixation', jsonb_build_object('question', $$Que signifie étymologiquement le mot « géographie » ?$$, 'solution', $$« Description » ou « dessin de la Terre », d'après ses racines grecques gê (la Terre) et graphein (décrire).$$)
      ),
      jsonb_build_object(
        'heading', $$Les trois grands domaines de la géographie$$,
        'body', $$La géographie se subdivise en trois grands domaines complémentaires. La géographie physique étudie le milieu naturel : le relief (géomorphologie), le climat (climatologie), les eaux (hydrographie et océanographie) et les êtres vivants (biogéographie). La géographie humaine étudie la population et son cadre de vie : sa répartition, sa structure, sa mobilité, ainsi que les espaces ruraux et urbains qu'elle occupe. La géographie économique, enfin, étudie les activités de production et d'échange des hommes : agriculture, industrie, commerce, transports.$$,
        'highlights', array[$$géographie physique$$, $$géographie humaine$$, $$géographie économique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Domaine$$, $$Ce qu'il étudie$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Géographie physique$$, $$Relief, climat, eaux, végétation (via géomorphologie, climatologie, hydrographie, biogéographie)$$),
            jsonb_build_array($$Géographie humaine$$, $$Population, habitat, espaces ruraux et urbains (démographie, géographie rurale, géographie urbaine)$$),
            jsonb_build_array($$Géographie économique$$, $$Activités de production et réseaux d'échange (agriculture, industrie, commerce, transports)$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dans lequel des trois domaines classerais-tu l'étude d'un port de commerce et de son trafic de marchandises ?$$, 'solution', $$Dans la géographie économique, puisqu'il s'agit d'une activité d'échange (transport, commerce).$$),
        'fixation', jsonb_build_object('question', $$Quel domaine de la géographie étudie la répartition et la mobilité de la population ?$$, 'solution', $$La géographie humaine.$$)
      ),
      jsonb_build_object(
        'heading', $$Une science interdisciplinaire aux outils modernes$$,
        'body', $$La géographie ne travaille jamais isolément. Elle emprunte aux sciences exactes des outils de calcul (statistiques démographiques, calcul de pente ou de dénivellation, pourcentages des secteurs d'activité), et elle est étroitement liée aux autres sciences humaines, en particulier à l'histoire, avec laquelle elle forme le couple histoire-géographie enseigné dans les établissements. Elle dispose aussi de moyens techniques de plus en plus sophistiqués : le Système d'Information Géographique (SIG), qui permet de recueillir, stocker et analyser des données spatiales, ainsi que la photographie aérienne et satellitaire, qui donnent une vision d'ensemble d'un territoire sans avoir à s'y déplacer physiquement.$$,
        'highlights', array[$$interdisciplinarité$$, $$Système d'Information Géographique (SIG)$$]::text[],
        'fixation', jsonb_build_object('question', $$À quoi sert un Système d'Information Géographique (SIG) ?$$, 'solution', $$À recueillir, stocker, traiter et présenter des données spatiales et géographiques.$$)
      ),
      jsonb_build_object(
        'heading', $$La démarche géographique : cinq étapes, deux phases$$,
        'body', $$Pour étudier un phénomène géographique de façon rigoureuse, le géographe suit une démarche en cinq étapes. Il observe d'abord le phénomène, directement sur le terrain ou indirectement à partir de photos et de cartes. Il le localise ensuite à l'aide de repères et de coordonnées géographiques, puis le décrit tel qu'il se présente. Vient ensuite l'explication, qui recherche les causes et l'origine du phénomène, et enfin la comparaison, qui met en relation plusieurs phénomènes pour en tirer une conclusion. Depuis le XIXe siècle, on regroupe ces cinq étapes en deux grandes phases.$$,
        'highlights', array[$$phase descriptive$$, $$phase analytique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Phase$$, $$Étapes regroupées$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Phase descriptive$$, $$Observation, localisation, description$$),
            jsonb_build_array($$Phase analytique$$, $$Explication, comparaison$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux grandes phases dans lesquelles on regroupe les cinq étapes de la démarche géographique ?$$, 'solution', $$La phase descriptive (observation, localisation, description) et la phase analytique (explication, comparaison).$$)
      ),
      jsonb_build_object(
        'heading', $$Les intérêts de la géographie$$,
        'body', $$La géographie présente un triple intérêt. Sur le plan pratique, elle permet de s'orienter dans l'espace, de connaître son milieu pour éviter les zones à risque, et fournit des outils utiles à l'aménagement du territoire et même, plus rarement, à la conduite d'opérations militaires. Sur le plan éducatif, elle forme l'esprit, ouvre au monde extérieur, développe le sens de la solidarité entre les peuples et fait comprendre comment les hommes occupent l'espace. Sur le plan socio-économique enfin, elle débouche sur des métiers : aménagement du territoire, gestion de l'environnement, enseignement et recherche.$$,
        'highlights', array[$$intérêt pratique$$, $$intérêt éducatif$$, $$intérêt socio-économique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type d'intérêt$$, $$Exemple concret$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Pratique$$, $$S'orienter, connaître son milieu, aménager le territoire$$),
            jsonb_build_array($$Éducatif$$, $$Ouverture sur le monde, formation intellectuelle, solidarité entre les peuples$$),
            jsonb_build_array($$Socio-économique$$, $$Métiers de l'aménagement, de l'environnement, de l'enseignement et de la recherche$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite un débouché professionnel offert par la géographie.$$, 'solution', $$Par exemple les métiers de l'aménagement du territoire, de la gestion de l'environnement, ou l'enseignement et la recherche.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit expliquer à un camarade pourquoi la géographie est considérée comme une science à part entière, et non comme une simple description de cartes, en s'appuyant sur ses domaines, sa démarche et ses intérêts.$$,
      'questions', array[
        $$Donne la définition de la géographie et précise son objet d'étude.$$,
        $$Présente les trois grands domaines de la géographie et donne un exemple pour chacun.$$,
        $$Décris les cinq étapes de la démarche géographique et les deux phases qui les regroupent.$$,
        $$Explique en quoi la géographie a un intérêt éducatif pour un élève de seconde.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel domaine de la géographie étudie le relief, le climat et les eaux ?$$,
      'hint', $$C'est le domaine qui s'intéresse au milieu naturel.$$,
      'expected', $$La géographie physique.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on l'outil informatique qui permet de recueillir, stocker et analyser des données spatiales ?$$,
      'hint', $$Trois lettres, l'initiale de « Système ».$$,
      'expected', $$Le Système d'Information Géographique (SIG).$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les trois premières étapes de la démarche géographique, regroupées dans la phase descriptive ?$$,
      'hint', $$On observe, on situe, puis on décrit.$$,
      'expected', $$L'observation, la localisation et la description.$$
    ),
    jsonb_build_object(
      'question', $$Cite un métier auquel prépare l'étude de la géographie.$$,
      'hint', $$Pense à l'aménagement du territoire ou à l'enseignement.$$,
      'expected', $$Par exemple : aménagement du territoire, gestion de l'environnement, enseignement, ou recherche.$$
    )
  ),
  now()
);
