-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). No source found (the
-- "Orthographe" category is empty on ecole-ci.org), so this content is
-- original, from the lesson's title/topic and the standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En corrigeant tes dernières copies, ton professeur remarque plusieurs erreurs d'accord. Il propose une séance sur l'orthographe grammaticale pour revoir les règles essentielles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'accord du verbe avec le sujet$$,
        'body', $$Le verbe s'accorde toujours en personne et en nombre avec son sujet, même lorsque celui-ci est éloigné ou caché.$$,
        'highlights', array[$$l'accord du verbe$$, $$le sujet$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le verbe se met à la même personne et au même nombre que son sujet. Attention aux sujets inversés, aux sujets composés (« et » entraîne un pluriel), et aux groupes nominaux longs qui peuvent faire oublier le vrai sujet.$$),
        'example', jsonb_build_object('statement', $$Accorde le verbe : « La liste des invités (être) affichée sur la porte. »$$, 'solution', $$La liste des invités est affichée sur la porte (le sujet est « la liste », singulier, pas « invités »).$$),
        'fixation', jsonb_build_object('question', $$Accorde le verbe : « Mon frère et ma sœur (aimer) la musique. »$$, 'solution', $$Mon frère et ma sœur aiment la musique (deux sujets reliés par « et » = pluriel).$$)
      ),
      jsonb_build_object(
        'heading', $$L'accord de l'adjectif qualificatif$$,
        'body', $$L'adjectif qualificatif s'accorde en genre et en nombre avec le nom qu'il qualifie, même s'il en est séparé par d'autres mots.$$,
        'highlights', array[$$l'accord de l'adjectif$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Cas$$, $$Règle$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Nom féminin singulier$$, $$adjectif au féminin singulier$$, $$une robe verte$$),
            jsonb_build_array($$Noms de genres différents$$, $$adjectif au masculin pluriel$$, $$un chat et une chatte noirs$$),
            jsonb_build_array($$Adjectif de couleur composé$$, $$invariable$$, $$des yeux bleu clair$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'adjectif s'accorde avec le nom qu'il qualifie. Quand un adjectif qualifie plusieurs noms de genres différents, il se met au masculin pluriel. Les adjectifs de couleur composés de deux mots restent invariables.$$),
        'example', jsonb_build_object('statement', $$Accorde l'adjectif : « des chaussures (neuf) »$$, 'solution', $$des chaussures neuves$$),
        'fixation', jsonb_build_object('question', $$Accorde l'adjectif : « une chemise et un pantalon (blanc) »$$, 'solution', $$une chemise et un pantalon blancs (noms de genres différents = masculin pluriel).$$)
      ),
      jsonb_build_object(
        'heading', $$L'accord du participe passé$$,
        'body', $$L'accord du participe passé dépend de l'auxiliaire utilisé : être ou avoir, et parfois de la position du complément d'objet direct.$$,
        'highlights', array[$$auxiliaire être$$, $$auxiliaire avoir$$, $$COD$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Avec l'auxiliaire être, le participe passé s'accorde avec le sujet. Avec l'auxiliaire avoir, le participe passé ne s'accorde pas avec le sujet, mais s'accorde avec le complément d'objet direct (COD) seulement si celui-ci est placé avant le verbe.$$),
        'example', jsonb_build_object('statement', $$Accorde le participe passé : « Elles sont (parti) tôt ce matin. »$$, 'solution', $$Elles sont parties tôt ce matin (auxiliaire être, accord avec le sujet « elles »).$$),
        'fixation', jsonb_build_object('question', $$Accorde le participe passé : « Les lettres qu'il a (écrit) sont sur la table. »$$, 'solution', $$Les lettres qu'il a écrites sont sur la table (COD « que », mis pour « les lettres », placé avant le verbe avoir).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu prépares une dictée d'entraînement contenant plusieurs pièges d'accord (sujet-verbe, adjectif, participe passé).$$,
      'questions', array[
        $$Relève une phrase avec un sujet inversé et vérifie l'accord du verbe.$$,
        $$Accorde correctement un adjectif qualifiant deux noms de genres différents.$$,
        $$Explique la règle d'accord du participe passé avec l'auxiliaire avoir.$$,
        $$Corrige une phrase contenant une erreur d'accord.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Accorde le verbe : « Sur la table (se trouver) plusieurs livres. »$$,
      'hint', $$Cherche le vrai sujet, même s'il est placé après le verbe.$$,
      'expected', $$Sur la table se trouvent plusieurs livres (sujet inversé « plusieurs livres », pluriel).$$
    ),
    jsonb_build_object(
      'question', $$Accorde l'adjectif : « une jupe et un chemisier (assorti) »$$,
      'hint', $$Deux noms de genres différents : quel genre l'emporte ?$$,
      'expected', $$une jupe et un chemisier assortis (genres différents = masculin pluriel).$$
    ),
    jsonb_build_object(
      'question', $$Accorde le participe passé : « La maison qu'ils ont (construire) est magnifique. »$$,
      'hint', $$Repère le COD et sa position par rapport au verbe.$$,
      'expected', $$La maison qu'ils ont construite est magnifique (COD « que » placé avant, accord avec « la maison »).$$
    ),
    jsonb_build_object(
      'question', $$Accorde le participe passé : « Ils ont (manger) toutes les mangues. »$$,
      'hint', $$Le COD est-il placé avant ou après le verbe ?$$,
      'expected', $$Ils ont mangé toutes les mangues (COD « toutes les mangues » placé après le verbe, donc pas d'accord).$$
    )
  ),
  content_generated_at = now()
where id = 'fr-orthographe-grammaticale';
