-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Philosophie, categoryid=161.
-- Moodle course id 3715: "Leçon 9_La période comtemporaine"
-- (https://lyc.ecole-ci.org/course/view.php?id=3715), resource id 81571
-- (Philo_1C_lecon9). Contenu réécrit à partir du PDF source (programme
-- officiel MENET-FP, thème "aperçu de l'histoire de la philosophie" — PDF
-- commun "toutes séries", dernière leçon de la séquence Philosophie de
-- 1ère C — 9/9). Faits historiques et doctrinaux réels (dates, biographies,
-- doctrines de Bachelard et Sartre) et courtes citations de leurs œuvres,
-- du domaine public, utilisées à des fins d'illustration pédagogique ;
-- synthèses reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-philo-periode-contemporaine',
  '1ere',
  'C',
  'philosophie',
  $$La période contemporaine$$,
  9,
  '1ere-c-philo-periode-moderne',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir étudié la période moderne et les débats sur la source de la connaissance, les élèves de 1ère s'intéressent à la période contemporaine. Ils veulent comprendre comment les philosophes de cette époque envisagent l'élaboration de la connaissance scientifique et la place de la liberté dans l'existence humaine.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une époque, deux préoccupations$$,
        'body', $$La période contemporaine part du XIXème siècle et se poursuit jusqu'à nos jours. Les réflexions de cette période portent principalement sur deux questions : les conditions d'élaboration de la connaissance scientifique (l'épistémologie), et la place de la liberté dans l'existence humaine (l'existentialisme).$$,
        'highlights', array[$$période contemporaine : XIXème siècle à nos jours$$, $$2 préoccupations : épistémologie (connaissance scientifique) + existentialisme (liberté humaine)$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quelles deux grandes questions portent les réflexions philosophiques de la période contemporaine ?$$, 'solution', $$Les conditions d'élaboration de la connaissance scientifique, et la place de la liberté dans l'existence humaine.$$)
      ),
      jsonb_build_object(
        'heading', $$L'épistémologie de Bachelard$$,
        'body', $$Gaston Bachelard (1884-1962), philosophe et épistémologue français, occupa la chaire de philosophie des sciences à la Sorbonne. Dans La Formation de l'esprit scientifique (1938), il soutient que la science s'oppose absolument à l'opinion : « l'opinion pense mal, elle ne pense pas ; elle traduit des besoins en connaissances ». L'opinion, selon lui, constitue le premier obstacle à surmonter pour accéder à une connaissance véritable — il faut d'abord la détruire, non la rectifier partiellement. Pour Bachelard, toute connaissance scientifique est une réponse à une question posée : « rien ne va de soi, rien n'est donné, tout est construit ». L'épistémologie bachelardienne conçoit ainsi la vérité scientifique comme une réalité dynamique, jamais achevée ni absolue, qui progresse non par accumulation continue mais par ruptures et remises en cause perpétuelles des habitudes de pensée.$$,
        'highlights', array[$$Bachelard : l'opinion est un obstacle (« obstacle épistémologique ») à détruire, non à corriger$$, $$« toute connaissance est une réponse à une question » ; « tout est construit »$$, $$la science progresse par ruptures, non par accumulation continue$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi Bachelard affirme-t-il qu'« on ne peut rien fonder sur l'opinion » ?$$, 'solution', $$Parce que l'opinion, selon lui, ne pense pas véritablement : elle se contente de traduire des besoins pratiques en apparences de connaissances, sans passer par la démarche rigoureuse de questionnement propre à l'esprit scientifique. Elle est donc un obstacle qu'il faut écarter entièrement, plutôt qu'une base imparfaite qu'on pourrait simplement corriger.$$),
        'fixation', jsonb_build_object('question', $$Selon Bachelard, comment progresse la science : par accumulation continue de savoirs, ou autrement ?$$, 'solution', $$Autrement : la science progresse en opérant des fractures et des ruptures, en luttant contre les préjugés et les habitudes mentales, et en se remettant perpétuellement en cause — non par simple accumulation continue de savoirs.$$)
      ),
      jsonb_build_object(
        'heading', $$L'existentialisme de Sartre$$,
        'body', $$Jean-Paul Sartre (1905-1980), agrégé de philosophie et lauréat (refusé) du prix Nobel de littérature en 1964, développe dans L'existentialisme est un humanisme (1946) l'idée que, pour un objet fabriqué comme un coupe-papier, l'essence (l'ensemble des qualités qui le définissent) précède l'existence : l'artisan a d'abord un concept en tête avant de le produire. Mais pour l'existentialisme athée, il en va autrement de l'homme : « l'existence précède l'essence ». Cela signifie que l'homme existe d'abord, surgit dans le monde, et ne se définit qu'ensuite, par ses choix et ses actes — il n'est rien au départ, il ne sera que ce qu'il se sera fait. L'existentialisme est ainsi le courant de pensée qui considère que l'homme, en raison de sa liberté, est une valeur fondamentale, en opposition à l'essentialisme, pour qui il existerait une essence humaine antérieure et déterminante.$$,
        'highlights', array[$$objet fabriqué : l'essence précède l'existence (le concept vient avant l'objet)$$, $$Sartre (existentialisme athée) : chez l'homme, l'existence précède l'essence$$, $$existentialisme (liberté, priorité à l'existence) vs essentialisme (essence humaine antérieure)$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Domaine', 'Auteur', 'Idée clé']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Épistémologie$$, $$Bachelard$$, $$L'opinion est un obstacle ; la connaissance scientifique se construit par ruptures$$),
            jsonb_build_array($$Existentialisme$$, $$Sartre$$, $$Chez l'homme, l'existence précède l'essence$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Que signifie l'affirmation de Sartre selon laquelle « chez l'homme, l'existence précède l'essence » ?$$, 'solution', $$Que l'homme n'a pas de nature ou de définition fixée à l'avance (contrairement à un objet fabriqué comme un coupe-papier) : il existe d'abord, sans être rien de déterminé, puis se définit progressivement par les choix et les actes qu'il pose au cours de son existence.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des élèves de 1ère n'ont pas compris les rapports entre la théorie et l'expérience en science. Un texte de Claude Bernard leur est proposé : « Le savant complet est celui qui embrasse à la fois la théorie et la pratique expérimentale. Il constate un fait ; à propos de ce fait, une idée naît dans son esprit ; en vue de cette idée, il raisonne, institue une expérience (...) De cette expérience résultent de nouveaux phénomènes qu'il faut observer, et ainsi de suite. »$$,
      'questions', array[
        $$Explique, en tes propres mots, la démarche en quatre étapes décrite par Claude Bernard.$$,
        $$Compare cette conception de la démarche scientifique à celle de Bachelard vue dans le cours (le rôle de la question, le rejet de l'opinion).$$,
        $$Apprécie la thèse de l'auteur : selon toi, un savant peut-il se contenter d'observer sans jamais formuler d'idée préalable ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle période couvre la « période contemporaine » en histoire de la philosophie ?$$,
      'hint', $$Elle se poursuit jusqu'à aujourd'hui.$$,
      'expected', $$Du XIXème siècle à nos jours.$$
    ),
    jsonb_build_object(
      'question', $$Selon Bachelard, l'opinion doit-elle être rectifiée partiellement ou détruite entièrement pour accéder à la connaissance scientifique ?$$,
      'hint', $$C'est un « premier obstacle » selon lui.$$,
      'expected', $$Elle doit être détruite entièrement, car elle constitue le premier obstacle à surmonter (l'obstacle épistémologique).$$
    ),
    jsonb_build_object(
      'question', $$Quelle formule célèbre de Sartre résume la position de l'existentialisme athée sur l'homme ?$$,
      'hint', $$Elle oppose deux notions philosophiques.$$,
      'expected', $$« L'existence précède l'essence. »$$
    ),
    jsonb_build_object(
      'question', $$Comment s'appelle le courant de pensée opposé à l'existentialisme, qui affirme une essence humaine antérieure à l'existence ?$$,
      'hint', $$Le nom dérive du mot « essence ».$$,
      'expected', $$L'essentialisme.$$
    )
  ),
  now()
);
