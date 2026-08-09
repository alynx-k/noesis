-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). No ecole-ci.org source; the
-- "Expression orale" category is empty on the platform, so this content is
-- original, from the lesson's title/topic and the standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ta classe organise un débat sur un sujet de société pour clôturer le trimestre. Avant de débattre, il faut apprendre à défendre une opinion et à répondre à un argument adverse dans le respect des règles du débat.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les règles du débat$$,
        'body', $$Un débat organisé suit des règles précises qui garantissent que chacun puisse s'exprimer et que l'échange reste respectueux.$$,
        'highlights', array[$$un modérateur$$, $$un tour de parole$$, $$un argument$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un débat comprend un modérateur qui distribue la parole et fait respecter le temps imparti, des participants qui défendent chacun un point de vue, et des tours de parole pendant lesquels chacun présente un argument à la fois.$$),
        'example', jsonb_build_object('statement', $$Explique le rôle du modérateur dans un débat.$$, 'solution', $$Le modérateur distribue la parole équitablement, veille au respect du temps de parole, et rappelle le sujet si la discussion s'en éloigne.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi un débat a-t-il besoin d'un temps de parole limité pour chaque participant ?$$, 'solution', $$Pour que chacun ait une chance égale de s'exprimer et que le débat ne soit pas monopolisé par une seule personne.$$)
      ),
      jsonb_build_object(
        'heading', $$Construire un argument$$,
        'body', $$Un bon argument ne se limite pas à une opinion : il s'appuie sur une justification claire et, si possible, un exemple concret.$$,
        'highlights', array[$$une opinion$$, $$une justification$$, $$un exemple$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Affirmer une opinion$$, $$« Je pense que le port de l'uniforme scolaire est une bonne chose. »$$),
            jsonb_build_array($$Justifier cette opinion$$, $$« ...car il réduit les inégalités entre élèves. »$$),
            jsonb_build_array($$Illustrer par un exemple$$, $$« Par exemple, dans les écoles qui l'ont adopté, les moqueries sur les vêtements ont diminué. »$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un argument complet suit trois étapes : affirmer une opinion, la justifier avec une raison, puis l'illustrer avec un exemple concret pour la rendre plus convaincante.$$),
        'example', jsonb_build_object('statement', $$Construis un argument complet en faveur de la lecture, en suivant les trois étapes.$$, 'solution', $$Je pense que la lecture est essentielle, car elle enrichit le vocabulaire. Par exemple, les élèves qui lisent régulièrement réussissent souvent mieux en rédaction.$$),
        'fixation', jsonb_build_object('question', $$Ajoute une justification et un exemple à cette opinion : « Le sport devrait être obligatoire à l'école. »$$, 'solution', $$Le sport devrait être obligatoire à l'école, car il améliore la santé des élèves. Par exemple, les enfants qui font du sport régulièrement sont souvent moins stressés.$$)
      ),
      jsonb_build_object(
        'heading', $$Répondre à un argument adverse$$,
        'body', $$Dans un débat, il faut aussi savoir réagir à l'opinion de l'autre sans l'agresser, en reconnaissant parfois une part de vérité avant de nuancer.$$,
        'highlights', array[$$concéder$$, $$nuancer$$, $$réfuter$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour répondre à un argument adverse avec respect, on peut concéder un point valable (« Je comprends votre point de vue, mais... »), puis nuancer ou réfuter avec un contre-argument justifié.$$),
        'example', jsonb_build_object('statement', $$Réponds à cet argument avec respect : « Les téléphones portables sont interdits à l'école, et c'est très bien ainsi. »$$, 'solution', $$Je comprends que les téléphones peuvent distraire, mais ils peuvent aussi être utiles pour des recherches rapides en classe.$$),
        'fixation', jsonb_build_object('question', $$Réponds avec une concession puis une nuance à : « Il ne faut jamais donner de devoirs le week-end. »$$, 'solution', $$Je suis d'accord qu'il faut du repos, mais un peu de travail régulier aide aussi à ne pas tout oublier pendant les vacances.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ta classe organise un débat sur le thème : « Faut-il interdire les téléphones portables au collège ? »$$,
      'questions', array[
        $$Choisis un camp (pour ou contre) et rédige un argument complet (opinion, justification, exemple).$$,
        $$Prépare une réponse respectueuse à un argument du camp opposé.$$,
        $$Utilise au moins un connecteur logique pour organiser ton propos.$$,
        $$Explique en une phrase le rôle du modérateur pendant ce débat.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Construis un argument complet (opinion + justification) en faveur des devoirs à la maison.$$,
      'hint', $$Affirme une opinion puis justifie-la avec « car ».$$,
      'expected', $$Je pense que les devoirs sont utiles, car ils permettent de réviser ce qui a été appris en classe.$$
    ),
    jsonb_build_object(
      'question', $$Ajoute un exemple à cet argument : « Manger des fruits est bon pour la santé, car ils apportent des vitamines. »$$,
      'hint', $$Utilise « Par exemple » pour illustrer.$$,
      'expected', $$Manger des fruits est bon pour la santé, car ils apportent des vitamines. Par exemple, une orange couvre une grande partie des besoins quotidiens en vitamine C.$$
    ),
    jsonb_build_object(
      'question', $$Réponds avec une concession à cet argument : « Les réseaux sociaux sont dangereux pour les jeunes. »$$,
      'hint', $$Commence par « Je comprends que... mais... ».$$,
      'expected', $$Je comprends qu'ils comportent des risques, mais ils permettent aussi de rester en contact avec ses amis.$$
    ),
    jsonb_build_object(
      'question', $$Explique pourquoi il est important d'écouter l'autre camp pendant un débat.$$,
      'hint', $$Pense à la qualité des réponses qu'on peut donner ensuite.$$,
      'expected', $$Écouter l'autre camp permet de mieux comprendre son point de vue et de répondre avec des arguments plus pertinents.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-debat';
