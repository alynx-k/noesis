-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Philosophie, categoryid=160.
-- Moodle course id 3727: "Leçon 8_La période moderne"
-- (https://lyc.ecole-ci.org/course/view.php?id=3727), resource id 37923.
-- Contenu réécrit à partir du PDF source (programme officiel MENET-FP,
-- thème "aperçu de l'histoire de la philosophie"). Faits historiques et
-- doctrinaux réels (dates, biographies, doctrines de Descartes, Locke,
-- Kant) et courtes citations de leurs œuvres, du domaine public, utilisées
-- à des fins d'illustration pédagogique ; synthèses reformulées, non
-- copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-philo-periode-moderne',
  '1ere',
  'A',
  'philosophie',
  $$La période moderne$$,
  8,
  '1ere-a-philo-moyen-age-renaissance',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant la récréation, un élève de 1ère A affirme avoir appris que la raison est la source de toutes nos connaissances ; un autre affirme au contraire avoir lu que ce sont les sens. Pour trancher ce désaccord, les élèves décident de faire des recherches sur les fondements de la connaissance selon les penseurs de l'époque moderne.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une époque, une question : quelle est la source de la connaissance ?$$,
        'body', $$La période moderne s'étend du XVIème au XVIIIème siècle. Les réflexions des philosophes de cette époque portent sur la recherche de la source ou du fondement de la connaissance. Trois grandes réponses seront apportées : le rationalisme (Descartes), l'empirisme (Locke), et le criticisme, qui tente de concilier les deux (Kant).$$,
        'highlights', array[$$période moderne : XVIème-XVIIIème siècle$$, $$3 doctrines : rationalisme → empirisme → criticisme (synthèse)$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quelle grande question portent les réflexions philosophiques de la période moderne ?$$, 'solution', $$Sur la recherche de la source, ou du fondement, de la connaissance.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rationalisme : Descartes$$,
        'body', $$René Descartes (1596-1650), philosophe français, mena une vie de méditation en Hollande où il rédigea ses œuvres principales, dont le Discours de la méthode et les Méditations métaphysiques. Descartes distingue trois sortes d'idées : les idées adventices (venues de l'extérieur), les idées factices (fabriquées par nous), et les idées innées (propres à l'esprit, comme l'idée de Dieu, du triangle, ou des essences vraies et immuables). Pour lui, la raison — le bon sens — est la faculté de bien juger et de découvrir la vérité ; par le raisonnement et la déduction, l'esprit se détache des sens et parvient à la vérité. Le rationalisme est ainsi la doctrine selon laquelle seule la raison permet d'accéder à la connaissance.$$,
        'highlights', array[$$3 sortes d'idées chez Descartes : adventices, factices, innées$$, $$rationalisme : seule la raison permet d'accéder à la connaissance$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qu'une idée innée, selon Descartes ?$$, 'solution', $$Une idée propre à l'esprit lui-même, qui n'est ni venue de l'extérieur (adventice) ni fabriquée par nous (factice) — par exemple l'idée de Dieu, du triangle, ou plus généralement toute idée représentant une essence vraie, immuable et éternelle.$$)
      ),
      jsonb_build_object(
        'heading', $$L'empirisme : Locke$$,
        'body', $$John Locke (1632-1704), philosophe écossais, réfugié en Hollande, y achève son Essai philosophique concernant l'entendement humain. Il y suppose qu'au commencement, l'âme est une « table rase », vide de toute idée, et se demande comment elle vient à en recevoir. Sa réponse : de l'expérience, seul fondement de toutes nos connaissances — que celle-ci provienne de l'observation des objets extérieurs (les sens) ou de la réflexion sur les opérations intérieures de notre âme. L'empirisme est ainsi la doctrine selon laquelle toutes les connaissances humaines proviennent de l'expérience.$$,
        'highlights', array[$$Locke : l'âme est une « table rase » à la naissance$$, $$empirisme : toute connaissance vient de l'expérience (sens + réflexion)$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi la position de Locke s'oppose-t-elle directement à celle de Descartes sur l'origine des idées ?$$, 'solution', $$Descartes affirme que certaines idées sont innées, présentes en l'esprit indépendamment de toute expérience sensible ; Locke, au contraire, nie l'existence d'idées innées et soutient que l'esprit est vide à la naissance (une « table rase »), toutes nos idées provenant nécessairement de l'expérience.$$),
        'fixation', jsonb_build_object('question', $$Que désigne l'expérience, selon l'empirisme de Locke ?$$, 'solution', $$L'ensemble des objets et phénomènes extérieurs qui frappent nos sens, ainsi que la réflexion sur les opérations intérieures de notre âme — les deux sources d'où découlent toutes nos idées.$$)
      ),
      jsonb_build_object(
        'heading', $$Le criticisme : Kant$$,
        'body', $$Emmanuel Kant (1724-1804), né et mort à Königsberg, tente de dépasser l'opposition entre rationalisme et empirisme dans sa Critique de la raison pure. Il affirme que toute connaissance commence avec l'expérience — sans objets frappant nos sens, notre faculté de connaître n'aurait rien à exercer. Mais il ajoute que cela ne prouve pas que toute connaissance dérive de l'expérience : notre connaissance pourrait être un composé entre ce que nous recevons des impressions sensibles et ce que notre propre pouvoir de connaître produit de lui-même. Kant distingue ainsi les connaissances a priori (indépendantes de l'expérience) des connaissances a posteriori (tirées de l'expérience). En affirmant que la connaissance naît de l'union entre la raison et l'expérience, Kant réconcilie rationalisme et empirisme : sa philosophie est appelée criticisme.$$,
        'highlights', array[$$Kant : toute connaissance commence avec l'expérience, mais n'en dérive pas toute entière$$, $$a priori (indépendant de l'expérience) vs a posteriori (tiré de l'expérience)$$, $$criticisme = synthèse entre rationalisme et empirisme$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Doctrine', 'Auteur', 'Source de la connaissance']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Rationalisme$$, $$Descartes$$, $$La raison seule$$),
            jsonb_build_array($$Empirisme$$, $$Locke$$, $$L'expérience seule (les sens)$$),
            jsonb_build_array($$Criticisme$$, $$Kant$$, $$L'union de la raison et de l'expérience$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi la philosophie de Kant est-elle qualifiée de « réconciliation » entre rationalisme et empirisme ?$$, 'solution', $$Parce que Kant affirme que la connaissance naît à la fois de l'expérience (les impressions sensibles, comme le soutenait l'empirisme) et de l'activité propre de la raison qui organise ces impressions (comme le soutenait le rationalisme), plutôt que de l'une des deux sources exclusivement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des élèves de 1ère A débattent de l'origine de la connaissance à partir du sujet suivant : « La raison peut-elle connaître indépendamment des sens ? »$$,
      'questions', array[
        $$Reformule ce sujet en tes propres mots.$$,
        $$Formule le problème que pose ce sujet, en t'appuyant sur l'opposition entre rationalisme et empirisme vue dans le cours.$$,
        $$Propose deux aspects du problème (axes d'analyse), l'un s'appuyant sur la position de Descartes, l'autre sur celle de Locke ou de Kant.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle période couvre la « période moderne » en histoire de la philosophie ?$$,
      'hint', $$Entre la Renaissance et la période contemporaine.$$,
      'expected', $$Du XVIème au XVIIIème siècle.$$
    ),
    jsonb_build_object(
      'question', $$Selon Descartes, quelle faculté permet d'accéder à la vérité ?$$,
      'hint', $$C'est le nom de sa doctrine.$$,
      'expected', $$La raison (le rationalisme).$$
    ),
    jsonb_build_object(
      'question', $$Que signifie l'image de la « table rase » utilisée par Locke ?$$,
      'hint', $$Elle décrit l'état de l'âme à la naissance.$$,
      'expected', $$Que l'âme, à la naissance, est vide de toute idée, sans aucun caractère inné — toutes les idées viendront ensuite de l'expérience.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la philosophie de Kant qui réconcilie rationalisme et empirisme ?$$,
      'hint', $$C'est un mot dérivé de « critique ».$$,
      'expected', $$Le criticisme (ou criticisme kantien).$$
    )
  ),
  now()
);
