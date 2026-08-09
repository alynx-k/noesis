-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). The ecole-ci.org page found
-- for this title (id 2343, "Expression Écrite" category) loads with no
-- content at all (no resource link, no iframe, only navigation skip-links),
-- so this content is original, from the lesson's title/topic and the
-- standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club de débat de ton collège organise un concours d'écriture sur un sujet de société. Tu dois rédiger un texte argumentatif convaincant pour défendre ton point de vue.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Choisir et formuler sa thèse$$,
        'body', $$Avant de rédiger, il faut définir clairement l'opinion que l'on va défendre ou combattre tout au long du texte.$$,
        'highlights', array[$$étayer$$, $$réfuter$$, $$une thèse$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Étayer un point de vue, c'est le soutenir avec des arguments qui le renforcent. Réfuter un point de vue, c'est le combattre en montrant ses faiblesses à l'aide de contre-arguments. Dans les deux cas, la thèse doit être énoncée clairement dès l'introduction.$$),
        'example', jsonb_build_object('statement', $$Formule une thèse claire pour un texte qui défend l'idée que la lecture est essentielle.$$, 'solution', $$« La lecture est une activité essentielle pour tout adolescent, car elle enrichit à la fois l'esprit et le vocabulaire. »$$),
        'fixation', jsonb_build_object('question', $$Formule une thèse claire pour un texte qui réfute l'idée que les réseaux sociaux sont inutiles.$$, 'solution', $$« Contrairement à une idée reçue, les réseaux sociaux ne sont pas inutiles : ils permettent de s'informer et de rester en lien avec les autres. »$$)
      ),
      jsonb_build_object(
        'heading', $$Organiser ses arguments dans un paragraphe$$,
        'body', $$Chaque paragraphe argumentatif doit développer une seule idée, structurée selon un schéma simple et efficace.$$,
        'highlights', array[$$argument$$, $$explication$$, $$exemple$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape du paragraphe$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Argument$$, $$annoncer l'idée défendue dans le paragraphe$$),
            jsonb_build_array($$Explication$$, $$développer pourquoi cet argument est valable$$),
            jsonb_build_array($$Exemple$$, $$illustrer l'argument par un cas concret$$),
            jsonb_build_array($$Transition$$, $$relier ce paragraphe au suivant$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un paragraphe argumentatif efficace présente un argument, l'explique, l'illustre avec un exemple précis, puis prépare la transition vers l'idée suivante à l'aide d'un connecteur logique.$$),
        'example', jsonb_build_object('statement', $$Rédige un paragraphe argumentatif complet sur le thème : le sport est bénéfique pour la concentration.$$, 'solution', $$Le sport améliore la concentration des élèves. En effet, l'activité physique régule le stress et favorise la clarté d'esprit. Par exemple, de nombreux élèves rapportent mieux réussir leurs contrôles les jours où ils ont fait du sport le matin.$$),
        'fixation', jsonb_build_object('question', $$Ajoute une transition à la fin de ce paragraphe pour introduire un nouvel argument : « ...Le sport améliore donc la santé physique des élèves. »$$, 'solution', $$En outre, il contribue également à leur bien-être mental.$$)
      ),
      jsonb_build_object(
        'heading', $$Rédiger une conclusion convaincante$$,
        'body', $$La conclusion d'un texte argumentatif rappelle la thèse défendue et peut ouvrir sur une réflexion plus large ou un appel à agir.$$,
        'highlights', array[$$rappel de la thèse$$, $$ouverture$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une bonne conclusion résume brièvement les arguments principaux, réaffirme la thèse, et se termine souvent par une ouverture : une question, une perspective, ou un appel à l'action.$$),
        'example', jsonb_build_object('statement', $$Rédige une conclusion pour un texte qui défend la protection de l'environnement.$$, 'solution', $$« En définitive, protéger l'environnement est l'affaire de tous. Chacun peut, à son échelle, agir dès aujourd'hui pour préserver la planète de demain. »$$),
        'fixation', jsonb_build_object('question', $$Ajoute une ouverture à cette conclusion : « Ainsi, la lecture reste une activité essentielle pour se cultiver. »$$, 'solution', $$Ainsi, la lecture reste une activité essentielle pour se cultiver. Ne devrait-on pas alors lui consacrer un peu plus de temps chaque jour ?$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le club de débat de ton collège organise un concours d'écriture sur le thème : « Les écrans sont-ils bénéfiques aux adolescents ? »$$,
      'questions', array[
        $$Formule une thèse claire, que tu vas étayer ou réfuter.$$,
        $$Rédige un paragraphe argumentatif complet (argument, explication, exemple).$$,
        $$Utilise au moins deux connecteurs logiques différents.$$,
        $$Rédige une conclusion qui rappelle ta thèse et propose une ouverture.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Formule une thèse à propos du port de l'uniforme scolaire.$$,
      'hint', $$Énonce clairement une opinion défendable.$$,
      'expected', $$« Le port de l'uniforme scolaire devrait être généralisé, car il réduit les inégalités entre élèves. »$$
    ),
    jsonb_build_object(
      'question', $$Complète ce paragraphe avec une explication : « Le vélo est un bon moyen de transport. [...] »$$,
      'hint', $$Développe pourquoi cet argument est valable.$$,
      'expected', $$En effet, il ne pollue pas et permet de faire de l'exercice tout en se déplaçant.$$
    ),
    jsonb_build_object(
      'question', $$Ajoute un exemple à cet argument : « Voyager permet de s'ouvrir à d'autres cultures. »$$,
      'hint', $$Illustre l'argument par un cas concret.$$,
      'expected', $$Par exemple, un séjour à l'étranger permet souvent de découvrir une langue, une cuisine et des traditions différentes.$$
    ),
    jsonb_build_object(
      'question', $$Rédige une phrase de conclusion pour un texte qui défend l'importance du sport à l'école.$$,
      'hint', $$Rappelle la thèse et propose une ouverture.$$,
      'expected', $$« En définitive, le sport à l'école ne se limite pas à l'effort physique : il forme aussi des élèves plus équilibrés et attentifs. »$$
    )
  ),
  content_generated_at = now()
where id = 'fr-ecriture-texte-argumentatif';
