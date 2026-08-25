-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Histoire.
-- Cours : "Leçon 5 : Les grandes périodes de l'histoire" (Thème 1 : Les
-- bases de l'étude de l'histoire). Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour la journée d'excellence de leur établissement, un groupe d'élèves de 6ème prépare un concours de « Génies en herbe » sur le thème du découpage de l'histoire de l'humanité et des peuples. Ils décident de mener des recherches afin d'identifier les grandes périodes de l'histoire de l'humanité et de caractériser les grandes phases de l'histoire de l'Afrique et de la Côte d'Ivoire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les quatre grandes périodes de l'histoire de l'humanité$$,
        'body', $$Une période est un intervalle de temps marqué par des ruptures (événements ou dates marquant la fin d'une période et le début d'une autre). L'histoire de l'humanité compte quatre grandes périodes : l'Antiquité (de -3000, invention de l'écriture, à 476, chute de l'Empire romain d'Occident), le Moyen Âge (de 476 à 1492, découverte de l'Amérique par Christophe Colomb), les Temps modernes (de 1492 à 1789, Révolution française), et l'Époque contemporaine (de 1789 à nos jours).$$,
        'highlights', array[$$Antiquité (-3000 à 476), Moyen Âge (476 à 1492), Temps modernes (1492 à 1789), Époque contemporaine (1789 à nos jours)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel événement marque la fin du Moyen Âge et le début des Temps modernes ?$$, 'solution', $$La découverte de l'Amérique par Christophe Colomb, en 1492.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes périodes de l'histoire de l'Afrique$$,
        'body', $$L'histoire de l'Afrique compte cinq grandes périodes : la période obscure (-3000 à 476), le Moyen Âge africain ou période des grands empires (476 à 1492), la traite atlantique (1492 à 1848, abolition de la traite négrière dans les colonies françaises), la colonisation (1848 à 1960), et les indépendances (depuis 1960).$$,
        'highlights', array[$$5 périodes : obscure, Moyen Âge (grands empires), traite atlantique, colonisation, indépendances$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle période correspond à celle des grands empires africains ?$$, 'solution', $$Le Moyen Âge africain (476 à 1492).$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes périodes de l'histoire de la Côte d'Ivoire$$,
        'body', $$L'histoire de la Côte d'Ivoire compte quatre grandes périodes : la période obscure (de -1500, fin du néolithique ivoirien, à 1470, découverte des côtes ivoiriennes par les Portugais), la période précoloniale (1470 à 1893, création de la colonie de Côte d'Ivoire), la période coloniale (1893 à 1960), et la période de l'indépendance (depuis 1960). Chaque peuple peut ainsi découper son histoire selon les événements qui l'ont marqué.$$,
        'highlights', array[$$4 périodes ivoiriennes : obscure (-1500 à 1470), précoloniale (1470-1893), coloniale (1893-1960), indépendance (depuis 1960)$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi le découpage de l'histoire de la Côte d'Ivoire est-il différent de celui de l'histoire de l'humanité ?$$, 'solution', $$Parce que chaque peuple découpe son histoire selon ses propres événements marquants (par exemple la découverte des côtes par les Portugais en 1470, plutôt que la découverte de l'Amérique).$$),
        'fixation', jsonb_build_object('question', $$Quel événement marque le début de la période coloniale en Côte d'Ivoire ?$$, 'solution', $$La création de la colonie de Côte d'Ivoire en 1893.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conférencier affirme lors d'une conférence scolaire : « Il n'y a pas d'unanimité dans le découpage de l'Histoire. Les grandes périodes de l'Histoire de la France ne sont pas à confondre avec celles de la Côte d'Ivoire ou de l'Afrique. Toutefois, le découpage de l'Histoire de l'Afrique présente des similitudes avec celui de la Côte d'Ivoire. »$$,
      'questions', array[
        $$Dis de quoi il s'agit dans cette situation.$$,
        $$Explique le passage : « Il n'y a pas d'unanimité dans le découpage de l'Histoire. »$$,
        $$Es-tu d'accord avec l'idée que le découpage de l'histoire de l'Afrique ressemble à celui de la Côte d'Ivoire ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la première et la plus longue période de l'histoire de l'humanité ?$$,
      'hint', $$Elle commence avec l'invention de l'écriture.$$,
      'expected', $$L'Antiquité (de -3000 à 476).$$
    ),
    jsonb_build_object(
      'question', $$Quel événement marque le début de l'époque contemporaine ?$$,
      'hint', $$C'est un événement français de 1789.$$,
      'expected', $$La Révolution française.$$
    ),
    jsonb_build_object(
      'question', $$Combien de grandes périodes compte l'histoire de la Côte d'Ivoire ?$$,
      'hint', $$Une de moins que l'histoire de l'Afrique.$$,
      'expected', $$Quatre : période obscure, précoloniale, coloniale, indépendance.$$
    ),
    jsonb_build_object(
      'question', $$Quel événement marque le début de la période des indépendances en Afrique ?$$,
      'hint', $$C'est l'année de l'indépendance de nombreux pays africains, dont la Côte d'Ivoire.$$,
      'expected', $$L'année 1960.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-6e-grandes-periodes-histoire';
