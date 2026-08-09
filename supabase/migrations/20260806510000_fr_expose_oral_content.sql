-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). No ecole-ci.org source; the
-- "Expression orale" category is empty on the platform, so this content is
-- original, from the lesson's title/topic and the standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ton professeur te demande de préparer un exposé oral sur un sujet de ton choix pour la prochaine séance de français. Avant de te lancer, la classe révise les techniques pour construire et présenter un exposé clair et captivant.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Préparer le plan de son exposé$$,
        'body', $$Un exposé oral réussi commence toujours par une préparation écrite claire : une introduction qui capte l'attention, un développement organisé, et une conclusion qui résume l'essentiel.$$,
        'highlights', array[$$introduction$$, $$développement$$, $$conclusion$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un exposé s'organise en trois grandes parties : l'introduction présente le sujet et annonce le plan, le développement traite les idées principales une à une, et la conclusion résume les points essentiels et peut ouvrir sur une question.$$),
        'example', jsonb_build_object('statement', $$Propose une phrase d'introduction pour un exposé sur le réchauffement climatique.$$, 'solution', $$« Aujourd'hui, je vais vous parler d'un phénomène qui touche toute la planète : le réchauffement climatique. »$$),
        'fixation', jsonb_build_object('question', $$Propose une phrase de conclusion pour cet exposé sur le réchauffement climatique.$$, 'solution', $$« En conclusion, le réchauffement climatique est un défi mondial qui nous concerne tous, et chacun peut agir à son échelle. »$$)
      ),
      jsonb_build_object(
        'heading', $$Les connecteurs pour organiser son discours$$,
        'body', $$Pour que l'auditoire suive facilement le fil de l'exposé, on utilise des mots ou expressions qui marquent les étapes du raisonnement.$$,
        'highlights', array[$$connecteurs logiques$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Connecteur$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Tout d'abord, / Premièrement,$$, $$annoncer la première idée$$),
            jsonb_build_array($$Ensuite, / De plus,$$, $$ajouter une idée$$),
            jsonb_build_array($$Cependant, / Toutefois,$$, $$apporter une nuance ou une opposition$$),
            jsonb_build_array($$Enfin, / Pour conclure,$$, $$annoncer la dernière idée ou la conclusion$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les connecteurs logiques structurent l'exposé et aident l'auditoire à repérer les grandes étapes du raisonnement, de l'introduction à la conclusion.$$),
        'example', jsonb_build_object('statement', $$Utilise un connecteur pour introduire une deuxième idée après avoir déjà parlé des causes de la déforestation.$$, 'solution', $$« De plus, la déforestation a aussi des conséquences sur la biodiversité. »$$),
        'fixation', jsonb_build_object('question', $$Utilise un connecteur d'opposition pour nuancer cette idée : « Beaucoup pensent que la technologie résout tous les problèmes. [...] elle en crée aussi de nouveaux. »$$, 'solution', $$« Beaucoup pensent que la technologie résout tous les problèmes. Cependant, elle en crée aussi de nouveaux. »$$)
      ),
      jsonb_build_object(
        'heading', $$La posture et la voix à l'oral$$,
        'body', $$Un bon exposé ne se limite pas au contenu : la façon de le présenter compte tout autant pour capter et garder l'attention du public.$$,
        'highlights', array[$$débit$$, $$articulation$$, $$contact visuel$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour un exposé réussi à l'oral, il faut parler avec un débit ni trop rapide ni trop lent, articuler clairement, varier son intonation, garder un contact visuel avec le public, et éviter de lire son texte mot à mot.$$),
        'example', jsonb_build_object('statement', $$Explique pourquoi il vaut mieux s'appuyer sur des notes plutôt que lire un texte entier.$$, 'solution', $$S'appuyer sur des notes permet de garder le contact visuel avec le public et de paraître plus naturel, alors que lire un texte entier rend l'exposé monotone et moins captivant.$$),
        'fixation', jsonb_build_object('question', $$Donne un conseil pour éviter de parler trop vite pendant un exposé.$$, 'solution', $$Il faut faire des pauses régulières entre les idées, ce qui ralentit naturellement le débit et laisse le temps au public de comprendre.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu dois présenter un exposé oral de trois minutes sur un sujet qui te passionne devant la classe.$$,
      'questions', array[
        $$Choisis un sujet et rédige une phrase d'introduction qui capte l'attention.$$,
        $$Organise deux idées principales à l'aide de connecteurs logiques.$$,
        $$Rédige une phrase de conclusion qui résume ton propos.$$,
        $$Donne deux conseils que tu suivras pour bien t'exprimer à l'oral (voix, posture, contact visuel).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complète avec un connecteur logique : « ... , les énergies renouvelables sont plus propres. ..., elles restent parfois coûteuses à installer. »$$,
      'hint', $$Pense à un connecteur d'ajout et un connecteur d'opposition.$$,
      'expected', $$Tout d'abord, les énergies renouvelables sont plus propres. Cependant, elles restent parfois coûteuses à installer.$$
    ),
    jsonb_build_object(
      'question', $$Identifie la partie de l'exposé concernée : « Pour conclure, je dirais que la lecture reste indispensable aujourd'hui. »$$,
      'hint', $$Repère le connecteur utilisé au début.$$,
      'expected', $$C'est la conclusion, reconnaissable au connecteur « Pour conclure ».$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de phrase d'introduction pour un exposé sur les réseaux sociaux.$$,
      'hint', $$Présente le sujet en une phrase accrocheuse.$$,
      'expected', $$« Aujourd'hui, je vais vous présenter un phénomène qui touche presque tous les jeunes : les réseaux sociaux. »$$
    ),
    jsonb_build_object(
      'question', $$Explique en une phrase pourquoi le contact visuel est important pendant un exposé.$$,
      'hint', $$Pense à l'attention et à l'impression donnée au public.$$,
      'expected', $$Le contact visuel permet de garder l'attention du public et de donner l'impression de s'adresser réellement à lui.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-expose-oral';
