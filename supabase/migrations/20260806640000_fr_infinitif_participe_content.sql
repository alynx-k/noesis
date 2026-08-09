-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). Matching ecole-ci.org
-- sources exist (id 2340/2341/2342, categoryid=77) but could not be
-- fetched in this session (the Claude-in-Chrome browser extension
-- disconnected and did not reconnect); this content is written from
-- general knowledge of the standard 3ème programme topic instead.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans une de tes phrases, tu hésites entre écrire « manger » ou « mangé ». Ton professeur propose une séance pour bien distinguer l'infinitif et les participes du verbe.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'infinitif : la forme de base du verbe$$,
        'body', $$L'infinitif est la forme non conjuguée du verbe, celle qu'on trouve dans le dictionnaire. Il peut jouer plusieurs rôles dans la phrase.$$,
        'highlights', array[$$l'infinitif$$, $$noyau d'une proposition$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'infinitif peut être le noyau d'une proposition infinitive, ou occuper la fonction d'un nom : sujet (Nager est agréable), complément d'objet (Il aime lire), ou complément après une préposition (avant de partir).$$),
        'example', jsonb_build_object('statement', $$Quelle est la fonction de l'infinitif dans : « Voyager enrichit l'esprit. » ?$$, 'solution', $$« Voyager » est sujet du verbe « enrichit ».$$),
        'fixation', jsonb_build_object('question', $$Quelle est la fonction de l'infinitif dans : « Elle décide de partir. » ?$$, 'solution', $$« Partir » est complément, introduit par la préposition « de ».$$)
      ),
      jsonb_build_object(
        'heading', $$Le participe passé$$,
        'body', $$Le participe passé sert à former les temps composés (avec être ou avoir) et peut aussi être employé comme un adjectif.$$,
        'highlights', array[$$participe passé$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Emploi$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Temps composé avec avoir$$, $$Il a mangé.$$),
            jsonb_build_array($$Temps composé avec être$$, $$Elle est partie.$$),
            jsonb_build_array($$Employé comme adjectif$$, $$une porte fermée$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le participe passé s'accorde comme un adjectif lorsqu'il est employé seul, et suit des règles d'accord particulières lorsqu'il est utilisé avec être ou avoir dans un temps composé.$$),
        'example', jsonb_build_object('statement', $$Le participe passé « cassé » dans « le vase cassé » est-il utilisé comme un adjectif ou dans un temps composé ?$$, 'solution', $$Il est utilisé comme un adjectif, car il qualifie directement le nom « vase », sans auxiliaire.$$),
        'fixation', jsonb_build_object('question', $$Le participe passé « arrivé » dans « elle est arrivée » forme-t-il un temps composé ?$$, 'solution', $$Oui, avec l'auxiliaire être, il forme le passé composé du verbe arriver.$$)
      ),
      jsonb_build_object(
        'heading', $$Le participe présent$$,
        'body', $$Le participe présent, invariable, se termine toujours en -ant et peut exprimer une action simultanée ou une circonstance.$$,
        'highlights', array[$$participe présent$$, $$gérondif$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le participe présent (toujours en -ant, invariable) exprime souvent une action qui se déroule en même temps qu'une autre. Précédé de « en », il devient un gérondif et indique la manière ou la simultanéité (en chantant).$$),
        'example', jsonb_build_object('statement', $$Distingue le participe présent et le gérondif dans : « Voyant la pluie, il a couru en criant. »$$, 'solution', $$« Voyant » est un participe présent (sans « en »). « en criant » est un gérondif (précédé de « en »).$$),
        'fixation', jsonb_build_object('question', $$Transforme cette phrase en utilisant un gérondif : « Il mange et il regarde la télévision en même temps. »$$, 'solution', $$Il mange en regardant la télévision.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu dois rédiger un court texte utilisant un infinitif, un participe passé et un participe présent.$$,
      'questions', array[
        $$Utilise un infinitif comme sujet d'une phrase.$$,
        $$Utilise un participe passé employé comme adjectif.$$,
        $$Utilise un participe présent pour exprimer une action simultanée.$$,
        $$Transforme une de tes phrases pour y inclure un gérondif.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la fonction de l'infinitif dans : « Il faut réviser avant l'examen. » ?$$,
      'hint', $$Pense au sujet réel d'un verbe impersonnel.$$,
      'expected', $$« Réviser » est sujet réel du verbe impersonnel « faut ».$$
    ),
    jsonb_build_object(
      'question', $$« Fatigué » dans « un enfant fatigué » est-il un participe passé employé comme adjectif ou dans un temps composé ?$$,
      'hint', $$Cherche s'il y a un auxiliaire.$$,
      'expected', $$Il est employé comme un adjectif, car il qualifie directement « enfant » sans auxiliaire.$$
    ),
    jsonb_build_object(
      'question', $$Forme le participe présent du verbe « finir ».$$,
      'hint', $$Base-toi sur la forme « nous finissons ».$$,
      'expected', $$Finissant.$$
    ),
    jsonb_build_object(
      'question', $$Transforme en gérondif : « Il travaille et il écoute de la musique. »$$,
      'hint', $$Utilise « en » + participe présent.$$,
      'expected', $$Il travaille en écoutant de la musique.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-infinitif-participe';
