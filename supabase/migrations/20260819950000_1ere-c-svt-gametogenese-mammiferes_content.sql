-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- SVT, categoryid=133.
-- Moodle course id 937: "SVT 1ère C_L4_La gamétogénèse chez les
-- mammifères" (https://lyc.ecole-ci.org/course/view.php?id=937), resource
-- id 4893. Contenu réécrit à partir du PDF source (rôle exocrine des
-- gonades, spermatogénèse, ovogénèse, méiose, brassage génétique). Tout
-- le contenu est factuel (biologie de la reproduction) : expériences,
-- schémas légendés et exercices sont repris/adaptés tels quels ;
-- explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-svt-gametogenese-mammiferes',
  '1ere',
  'C',
  'svt',
  $$La gamétogenèse chez les mammifères$$,
  3,
  '1ere-c-svt-echanges-ions-sol',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant la récréation, des élèves de 1ère C engagent un débat animé sur les phénomènes physiologiques qui accompagnent la puberté. Très vite, la discussion se centre sur la production des cellules reproductrices chez le garçon et chez la fille. Désireux de connaître l'origine de ces cellules reproductrices, ils décident de déterminer le rôle des gonades dans la production des cellules sexuelles, de décrire les étapes de la gamétogenèse et de comparer la spermatogénèse et l'ovogénèse.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le rôle des gonades dans la production des gamètes$$,
        'body', $$Une série d'expériences sur des rats montre que la castration, la ligature des spermiductes et la destruction des tubes séminifères (par rayons X) provoquent toutes la stérilité du rat ; de même, l'ovariectomie d'une rate pubère et la ligature de ses oviductes entraînent sa stérilité. Ces résultats montrent que ce sont les testicules qui produisent les spermatozoïdes (dans les tubes séminifères) et les ovaires qui produisent les ovocytes II. La ligature des conduits (spermiductes ou oviductes) empêche seulement la sortie de ces cellules déjà formées. Les gonades mâles et femelles assurent donc la production des cellules sexuelles : c'est leur fonction exocrine.$$,
        'highlights', array[$$castration, destruction des tubes séminifères → stérilité (arrêt de production)$$, $$ligature des spermiductes/oviductes → stérilité (blocage du transport, pas de la production)$$, $$fonction exocrine des gonades : production des cellules sexuelles$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la ligature des spermiductes rend-elle un rat stérile, alors que ses testicules continuent de fonctionner ?$$, 'solution', $$Parce que la ligature empêche la sortie des spermatozoïdes déjà fabriqués par les testicules, même si leur production continue.$$)
      ),
      jsonb_build_object(
        'heading', $$La spermatogénèse$$,
        'body', $$À la puberté, les spermatogonies (cellules souches diploïdes, 2n, situées à la périphérie des tubes séminifères) se multiplient activement par mitoses : c'est la phase de multiplication. Elles s'accroissent ensuite pour devenir des spermatocytes I, toujours diploïdes : phase d'accroissement. Lors de la phase de maturation, le spermatocyte I subit la première division de méiose (réductionnelle) pour donner deux spermatocytes II haploïdes (n), qui subissent chacun la deuxième division de méiose (équationnelle) pour donner deux spermatides (n). Enfin, lors de la phase de différenciation (ou spermiogénèse), chaque spermatide se transforme profondément pour devenir un spermatozoïde. Un spermatocyte I donne donc, au total, 4 spermatozoïdes. Ce processus débute à la puberté et se poursuit ensuite en continu.$$,
        'highlights', array[$$4 phases : multiplication → accroissement → maturation (méiose) → différenciation$$, $$1 spermatocyte I → 4 spermatozoïdes$$, $$débute à la puberté, processus continu$$]::text[],
        'fixation', jsonb_build_object('question', $$Combien de spermatozoïdes obtient-on finalement à partir d'un seul spermatocyte I ?$$, 'solution', $$Quatre spermatozoïdes.$$)
      ),
      jsonb_build_object(
        'heading', $$L'ovogénèse$$,
        'body', $$Avant la naissance, chez le fœtus de la jeune fille, les ovogonies (cellules souches diploïdes) se multiplient par mitoses : phase de multiplication. Chaque ovogonie subit ensuite un important accroissement de volume (accumulation de réserves) et devient un ovocyte I, diploïde, entouré de cellules folliculaires (follicule primordial) : phase d'accroissement. Après la naissance, les ovocytes I entrent dans une longue période de repos. À la puberté débute la phase de maturation : l'ovocyte I subit la première division de méiose (réductionnelle), donnant une grosse cellule haploïde (l'ovocyte II) et une toute petite cellule (le premier globule polaire) ; la deuxième division de méiose (équationnelle), qui reste bloquée en métaphase II jusqu'à la fécondation, aboutira à l'ovotide et à un deuxième globule polaire. Contrairement à la spermatogénèse, il n'existe pas de phase de différenciation : à partir d'un ovocyte I, on n'obtient donc qu'une seule cellule sexuelle exploitable, l'ovocyte II (ou ovotide).$$,
        'highlights', array[$$multiplication (vie embryonnaire) → accroissement → repos → maturation (à la puberté)$$, $$1 ovocyte I → 1 seule cellule sexuelle utile (ovocyte II/ovotide) + globules polaires$$, $$pas de phase de différenciation, contrairement à la spermatogénèse$$]::text[],
        'example', jsonb_build_object('statement', $$À quel moment la 2ème division de méiose de l'ovocyte reprend-elle son cours après avoir été bloquée en métaphase II ?$$, 'solution', $$Elle ne reprend qu'au moment de la fécondation.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que l'ovogénèse est discontinue, contrairement à la spermatogénèse ?$$, 'solution', $$Parce qu'elle débute pendant la vie embryonnaire, connaît une longue période de repos entre la naissance et la puberté, puis se poursuit par cycles jusqu'à la ménopause, alors que la spermatogénèse est continue dès la puberté.$$)
      ),
      jsonb_build_object(
        'heading', $$La méiose et le brassage génétique$$,
        'body', $$La méiose est le processus par lequel une cellule sexuelle diploïde subit deux divisions successives pour donner quatre cellules haploïdes différentes entre elles et différentes de la cellule mère. La première division (réductionnelle) sépare les chromosomes homologues ; la seconde (équationnelle) sépare les chromatides de chaque chromosome. Cette diversité résulte de deux brassages génétiques : le brassage interchromosomique, dû à la disposition aléatoire des chromosomes homologues en métaphase I ; et le brassage intrachromosomique (ou crossing-over), qui correspond à un échange de portions de chromosomes homologues lors de la prophase I. Ces deux brassages sont à l'origine de la biodiversité entre individus issus des mêmes parents. Lorsque la séparation des chromosomes se fait anormalement (méiose atypique), il peut en résulter des gamètes anormaux et des aberrations chromosomiques (par exemple la trisomie 21).$$,
        'highlights', array[$$méiose : 1 cellule diploïde → 4 cellules haploïdes différentes$$, $$brassage interchromosomique : répartition aléatoire des chromosomes en métaphase I$$, $$brassage intrachromosomique (crossing-over) : échange de segments en prophase I$$]::text[],
        'fixation', jsonb_build_object('question', $$À quelle étape de la méiose se produit le crossing-over (brassage intrachromosomique) ?$$, 'solution', $$À la prophase I.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le cadre de la préparation de leur devoir de niveau, un groupe d'élèves de 1ère C découvre, dans un manuel de biologie, deux documents A et B présentant des schémas de divisions cellulaires successives : le document A montre une lignée de cellules aboutissant à quatre petites cellules identiques, le document B montre une lignée aboutissant à une grosse cellule et plusieurs petites cellules de tailles différentes.$$,
      'questions', array[
        $$Nomme le phénomène présenté par chacun des documents A et B.$$,
        $$Décris les étapes (phases) du phénomène présenté par le document A.$$,
        $$Décris les étapes (phases) du phénomène présenté par le document B, et compare-le au document A.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle expérience sur un rat permettrait de montrer que ce sont les testicules qui produisent les spermatozoïdes, et non seulement de les stocker ?$$,
      'hint', $$Il faut supprimer l'organe lui-même, pas seulement le conduit.$$,
      'expected', $$La destruction des tubes séminifères (par rayons X) ou la castration, qui rendent le rat stérile en supprimant directement l'organe producteur.$$
    ),
    jsonb_build_object(
      'question', $$Nomme les quatre phases de la spermatogénèse, dans l'ordre.$$,
      'hint', $$La dernière phase n'existe pas dans l'ovogénèse.$$,
      'expected', $$Multiplication, accroissement, maturation, différenciation (spermiogénèse).$$
    ),
    jsonb_build_object(
      'question', $$Combien de cellules sexuelles utilisables obtient-on à partir d'un ovocyte I, à l'issue de l'ovogénèse ?$$,
      'hint', $$Ce n'est pas le même nombre que pour la spermatogénèse.$$,
      'expected', $$Une seule (l'ovocyte II ou ovotide), les autres produits de la méiose étant des globules polaires non fonctionnels.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les deux types de brassage génétique qui se produisent au cours de la méiose ?$$,
      'hint', $$L'un se produit en métaphase I, l'autre en prophase I.$$,
      'expected', $$Le brassage interchromosomique (répartition aléatoire des chromosomes homologues) et le brassage intrachromosomique ou crossing-over (échange de segments entre chromosomes homologues).$$
    )
  ),
  now()
);
