-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Géographie.
-- Cours : "Leçon 2 : Le relief" (Thème 1 : Les bases de l'étude de la
-- géographie). Contenu réécrit à partir du PDF source ; situation
-- d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur le chemin du retour, des élèves de 6ème se plaignent des montées et des descentes qu'ils doivent effectuer chaque jour entre leur domicile et l'école. Ils se demandent pourquoi le sol n'est pas plat partout. Pour répondre à cette question, ils décident, avec leur professeur, de mener des recherches afin d'identifier les formes et les éléments du relief et de comprendre son processus de formation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les éléments du relief$$,
        'body', $$Le relief est l'ensemble des inégalités ou accidents à la surface de la terre, formé par les mouvements internes de la terre. Trois éléments le caractérisent : l'altitude (hauteur d'un point par rapport au niveau de la mer), la dénivellation (différence d'altitude entre deux points) et la pente (degré d'inclinaison d'un terrain, exprimé en degrés).$$,
        'highlights', array[$$altitude = hauteur par rapport au niveau de la mer ; dénivellation = différence d'altitude entre 2 points ; pente = degré d'inclinaison$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce que l'altitude ?$$, 'solution', $$La distance (hauteur) d'un point par rapport au niveau zéro de la mer.$$)
      ),
      jsonb_build_object(
        'heading', $$Les formes du relief$$,
        'body', $$Les formes élémentaires du relief sont la colline (petite élévation à sommet arrondi), la butte (petite élévation à sommet plat), la vallée (dépression allongée créée par le ruissellement, dont le fond est le talweg), le talus, la falaise, l'interfluve et la cuvette. Les formes complexes sont la plaine (0 à 300m d'altitude, cours d'eau à fleur de sol ; en Côte d'Ivoire : plaines côtières et plaines intérieures), le plateau (300 à 900m, surface avec creux et bosses ; bas-plateaux au centre, hauts-plateaux au nord) et la montagne (900m et plus, pentes raides ; à l'ouest et au nord-ouest, point culminant le mont Nimba à 1753m).$$,
        'highlights', array[$$formes élémentaires : colline, butte, vallée, talus, falaise, interfluve, cuvette$$, $$formes complexes : plaine (0-300m), plateau (300-900m), montagne (900m+)$$, $$Côte d'Ivoire : mont Nimba = point culminant (1753m)$$]::text[],
        'example', jsonb_build_object('statement', $$Un terrain a une altitude de 500m avec une surface présentant des creux et des bosses. De quelle forme de relief s'agit-il ?$$, 'solution', $$D'un plateau (300 à 900m d'altitude, avec des creux et des bosses).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre une colline et une butte ?$$, 'solution', $$La colline a un sommet arrondi, la butte a un sommet plat.$$)
      ),
      jsonb_build_object(
        'heading', $$Le processus de formation du relief$$,
        'body', $$La formation du relief résulte de facteurs internes et externes. Les facteurs internes sont les mouvements internes de la terre : les affaissements et cassures forment les plateaux, tandis que les soulèvements ou plissements forment les montagnes. Le facteur externe principal est l'érosion (dégradation et transformation de la surface par l'eau, le vent, la neige, le gel ou l'action de l'homme) associée à la sédimentation, qui forment les plaines.$$,
        'highlights', array[$$facteurs internes (affaissements/cassures → plateaux ; soulèvements/plissements → montagnes)$$, $$facteur externe : érosion + sédimentation → plaines$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel facteur externe façonne les plaines ?$$, 'solution', $$L'érosion associée à la sédimentation.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un voyage d'étude, un professeur commente le paysage qui défile : « Ici, nous avons une chaîne de collines intégrée dans une vaste zone de plateaux. Nous apercevrons bientôt la limite de cette zone, constituée d'une vallée aux pentes douces. La formation des plateaux et des vallées résulte de facteurs internes et externes à la terre. »$$,
      'questions', array[
        $$Dis de quoi parle cette situation.$$,
        $$Relève les éléments et formes de relief évoqués.$$,
        $$Explique le passage : « La formation des plateaux et des vallées résulte de facteurs internes et externes à la terre. »$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une plaine et une montagne, laquelle a l'altitude la plus élevée ?$$,
      'hint', $$L'une varie de 0 à 300m, l'autre dépasse 900m.$$,
      'expected', $$La montagne (900m et plus).$$
    ),
    jsonb_build_object(
      'question', $$Le fond d'une vallée porte-t-il un nom particulier ?$$,
      'hint', $$C'est un terme technique de géographie.$$,
      'expected', $$Oui, on l'appelle le talweg.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le point culminant de la Côte d'Ivoire ?$$,
      'hint', $$Il se situe à l'ouest du pays.$$,
      'expected', $$Le mont Nimba, avec 1753 m d'altitude.$$
    ),
    jsonb_build_object(
      'question', $$Les soulèvements de la terre entraînent-ils la formation de plateaux ou de montagnes ?$$,
      'hint', $$Les affaissements forment plutôt les plateaux.$$,
      'expected', $$Des montagnes.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-6e-relief';
