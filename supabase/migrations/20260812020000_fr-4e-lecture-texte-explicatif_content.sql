-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806540000_fr_lecture_texte_argumentatif_content.sql).
-- ecole-ci.org is reachable now (see 20260812000000_fr-4e-debat_content.sql)
-- — opened Français 4ème > Lecture (texte autonome), which lists 14
-- "Lecture méthodique d'un texte explicatif" séance courses (S1-S14);
-- checked two (course id 797 = S1, id 802 = S6): both read "Activités : 0",
-- no résumé/exercise uploaded. Falling back to original content, from the
-- lesson title/topic and the standard Ivorian 4ème Français programme
-- (compétence lecture — texte explicatif).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ton magazine scolaire prépare un dossier sur le paludisme. Le journaliste te transmet un article qui explique comment se transmet cette maladie. Pour bien le résumer, il faut d'abord savoir reconnaître un texte explicatif.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Reconnaître un texte explicatif$$,
        'body', $$Un texte explicatif a pour but de faire comprendre un phénomène, un fonctionnement ou un fait au lecteur, sans chercher à le convaincre ni à raconter une histoire.$$,
        'highlights', array[$$expliquer$$, $$un fait objectif$$, $$le présent de vérité générale$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le texte explicatif informe de façon neutre et objective : il répond à des questions comme « pourquoi ? » ou « comment ? », utilise le présent de vérité générale et un vocabulaire précis, sans exprimer d'opinion personnelle.$$),
        'example', jsonb_build_object('statement', $$Ce texte est-il explicatif : « La pluie se forme lorsque la vapeur d'eau se condense dans les nuages en refroidissant. » ?$$, 'solution', $$Oui, il explique objectivement un phénomène naturel, au présent de vérité générale, sans opinion personnelle.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi ce texte n'est-il pas explicatif : « Je trouve que la pluie est le plus beau des phénomènes. » ?$$, 'solution', $$Parce qu'il exprime une opinion personnelle (« je trouve ») au lieu d'informer objectivement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les connecteurs logiques de l'explication$$,
        'body', $$Pour organiser les causes et les conséquences d'un phénomène, le texte explicatif utilise des connecteurs logiques précis.$$,
        'highlights', array[$$la cause$$, $$la conséquence$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Connecteur$$, $$Valeur logique$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$parce que, car, puisque$$, $$introduit la cause$$),
            jsonb_build_array($$donc, ainsi, c'est pourquoi$$, $$introduit la conséquence$$),
            jsonb_build_array($$en effet$$, $$confirme une explication$$),
            jsonb_build_array($$d'abord, ensuite, enfin$$, $$organise les étapes d'une explication$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les connecteurs logiques relient les idées d'un texte explicatif : les uns introduisent une cause (parce que, car), les autres une conséquence (donc, c'est pourquoi), ou organisent les étapes de l'explication (d'abord, ensuite, enfin).$$),
        'example', jsonb_build_object('statement', $$Complète avec un connecteur de conséquence : « Le sol est imperméable ... l'eau ruisselle en surface. »$$, 'solution', $$Le sol est imperméable, donc l'eau ruisselle en surface.$$),
        'fixation', jsonb_build_object('question', $$Complète avec un connecteur de cause : « Les poissons meurent ... l'eau du lac est polluée. »$$, 'solution', $$Les poissons meurent parce que l'eau du lac est polluée.$$)
      ),
      jsonb_build_object(
        'heading', $$Le vocabulaire technique et la reformulation$$,
        'body', $$Un texte explicatif emploie souvent un vocabulaire spécialisé, aussitôt reformulé ou défini pour rester accessible au lecteur.$$,
        'highlights', array[$$un terme technique$$, $$une reformulation$$, $$c'est-à-dire$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Quand un texte explicatif emploie un terme technique, il le reformule souvent aussitôt avec des expressions comme « c'est-à-dire », « autrement dit » ou entre parenthèses, pour que le lecteur non spécialiste comprenne.$$),
        'example', jsonb_build_object('statement', $$Repère la reformulation dans : « Le moustique est un vecteur, c'est-à-dire un organisme qui transmet une maladie. »$$, 'solution', $$La reformulation est « c'est-à-dire un organisme qui transmet une maladie », qui explique le terme technique « vecteur ».$$),
        'fixation', jsonb_build_object('question', $$Reformule ce terme technique pour un jeune lecteur : « La photosynthèse permet aux plantes de produire de l'énergie. »$$, 'solution', $$La photosynthèse, c'est-à-dire le processus par lequel les plantes fabriquent leur nourriture grâce à la lumière du soleil.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le magazine scolaire publie un article expliquant pourquoi les moustiques transmettent le paludisme, et tu dois vérifier qu'il respecte les règles du texte explicatif.$$,
      'questions', array[
        $$Relève une phrase de l'article qui explique une cause et une phrase qui explique une conséquence.$$,
        $$Identifie deux connecteurs logiques utilisés dans le texte et précise leur valeur.$$,
        $$Repère un terme technique et sa reformulation dans le texte.$$,
        $$Explique pourquoi ce texte peut être qualifié d'explicatif et non d'argumentatif.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ce texte est-il explicatif : « L'eau bout à 100 °C au niveau de la mer, car la pression atmosphérique agit sur sa température d'ébullition. » ? Justifie.$$,
      'hint', $$Cherche s'il exprime une opinion ou un fait objectif.$$,
      'expected', $$Oui, c'est un texte explicatif : il présente un fait objectif et vérifiable, sans opinion personnelle, avec une cause introduite par « car ».$$
    ),
    jsonb_build_object(
      'question', $$Complète avec un connecteur de conséquence : « La déforestation détruit l'habitat des animaux ... plusieurs espèces disparaissent. »$$,
      'hint', $$Utilise « donc » ou « c'est pourquoi ».$$,
      'expected', $$La déforestation détruit l'habitat des animaux, donc plusieurs espèces disparaissent.$$
    ),
    jsonb_build_object(
      'question', $$Reformule ce terme technique pour un lecteur non spécialiste : « L'érosion fragilise les sols agricoles. »$$,
      'hint', $$Utilise « c'est-à-dire » pour expliquer « érosion ».$$,
      'expected', $$L'érosion, c'est-à-dire l'usure progressive du sol par le vent et l'eau, fragilise les sols agricoles.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence principale entre un texte explicatif et un texte argumentatif ?$$,
      'hint', $$Pense au but de chaque type de texte : informer ou convaincre.$$,
      'expected', $$Le texte explicatif informe objectivement sur un fait, tandis que le texte argumentatif cherche à convaincre le lecteur d'adopter une opinion.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-lecture-texte-explicatif';
