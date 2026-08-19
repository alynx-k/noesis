-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Philosophie, categoryid=160.
-- Moodle course id 3725: "Leçon 6_Présentation de l'histoire de la
-- philosophie" (https://lyc.ecole-ci.org/course/view.php?id=3725),
-- resource id 37899. Contenu réécrit à partir du PDF source (programme
-- officiel MENET-FP, thème "aperçu de l'histoire de la philosophie",
-- leçon sur la période antique). Faits historiques et doctrinaux réels
-- (dates, biographies, doctrines des philosophes antiques) et courtes
-- citations de philosophes antiques du domaine public (Héraclite,
-- Parménide, Platon, Épictète) utilisées à des fins d'illustration
-- pédagogique ; synthèses reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-philo-periode-antique',
  '1ere',
  'A',
  'philosophie',
  $$La période antique$$,
  6,
  '1ere-a-philo-introduction-dissertation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le chef de la classe de 1ère A, surnommé « Platon », affirme que Platon est un philosophe moderne. Ses camarades le contredisent, affirmant qu'il appartient à la période antique. Pour trancher, la classe entreprend des recherches sur les principaux auteurs de la période antique et leurs conceptions philosophiques.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les quatre grandes périodes de l'histoire de la philosophie$$,
        'body', $$L'histoire de la philosophie renvoie à celle des grandes doctrines, idées et théories formulées par les philosophes à travers les époques ; elle n'est pas indépendante de l'histoire de l'humanité en général. Elle se subdivise en quatre grandes périodes : la période antique (VIème siècle av. J.-C. au Vème siècle apr. J.-C.), le Moyen Âge et la Renaissance, la période moderne, et la période contemporaine. L'antiquité elle-même se subdivise en trois sous-périodes (présocratique, socratique, post-socratique) et est marquée par trois préoccupations majeures : la question ontologique, la question de la vérité, et la question du bonheur.$$,
        'highlights', array[$$4 grandes périodes : antiquité → Moyen Âge/Renaissance → période moderne → période contemporaine$$, $$antiquité : 3 sous-périodes (présocratique, socratique, post-socratique), 3 questions (Être, vérité, bonheur)$$]::text[],
        'fixation', jsonb_build_object('question', $$À quelle période de l'histoire de la philosophie appartient Platon ?$$, 'solution', $$À la période antique, plus précisément à la période socratique (Platon fut l'élève de Socrate).$$)
      ),
      jsonb_build_object(
        'heading', $$La question ontologique : Héraclite et Parménide$$,
        'body', $$La période présocratique (avant Socrate, 470-399 av. J.-C.) est dominée par la question ontologique — l'ontologie étant la science qui s'interroge sur la signification de l'Être. Héraclite d'Éphèse (né vers 540 av. J.-C.), surnommé « l'obscur », soutient que l'Être est changeant et mobile : « On ne peut pas descendre deux fois dans le même fleuve », car la matière naît et meurt sans cesse dans un devenir perpétuel. À l'inverse, Parménide (né vers 544 av. J.-C.), père de l'ontologie éléatique, soutient que l'Être est incréé, impérissable, immobile et éternel : « l'Être est, qu'il n'est pas possible qu'il ne soit pas ». En conclusion, l'Être peut être vu à la fois comme l'Un et le Multiple, la permanence et le devenir.$$,
        'highlights', array[$$Héraclite : l'Être est mouvement, devenir, changement perpétuel$$, $$Parménide : l'Être est immobile, incréé, éternel$$]::text[],
        'example', jsonb_build_object('statement', $$Que signifie la formule d'Héraclite « On ne peut pas descendre deux fois dans le même fleuve » ?$$, 'solution', $$Elle traduit l'idée que tout est en perpétuel changement : le fleuve où l'on redescend n'est déjà plus le même, car son eau s'est écoulée et renouvelée — l'Être, pour Héraclite, est fondamentalement instable et mouvant.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence fondamentale entre la conception de l'Être chez Héraclite et chez Parménide ?$$, 'solution', $$Pour Héraclite, l'Être se caractérise par l'instabilité et le mouvement (le devenir) ; pour Parménide, l'Être ne change pas, il est immobile, incréé et éternel.$$)
      ),
      jsonb_build_object(
        'heading', $$La question de la vérité : sophistes, Platon et Aristote$$,
        'body', $$La période socratique regroupe les penseurs contemporains de Socrate : les sophistes, Socrate, Platon et Aristote, préoccupés par le problème de la vérité. Les sophistes, maîtres de rhétorique, enseignaient la dialectique (l'art de soutenir une thèse et son contraire) et faisaient de l'homme l'unique source des valeurs : pour eux, la vérité est relative à chaque individu (position illustrée par le personnage de Calliclès dans le Gorgias de Platon, pour qui « le plus fort » doit légitimement l'emporter). Platon (427-347 av. J.-C.), élève de Socrate pendant huit ans puis fondateur de l'Académie, s'oppose à ce relativisme : dans l'allégorie de la caverne (La République), il montre que les hommes prisonniers de leurs sens ne perçoivent que des ombres, et que la véritable connaissance (le monde intelligible) s'atteint par la raison. Aristote (384-322 av. J.-C.), élève de Platon puis fondateur du Lycée, rejette la théorie des Idées de son maître pour une approche plus réaliste : selon lui, il n'y a de science que de l'universel, atteint par l'induction à partir des cas particuliers perçus par les sens. Malgré leurs divergences, Platon, Aristote et Socrate s'accordent : la vérité n'est pas multiple, elle est universelle et absolue — contrairement à la position relativiste des sophistes.$$,
        'highlights', array[$$sophistes : la vérité est relative à chaque individu$$, $$Platon : la vérité est intelligible, atteinte par la raison (allégorie de la caverne)$$, $$Aristote : la science porte sur l'universel, atteint par l'induction$$, $$Platon/Aristote/Socrate s'opposent aux sophistes : la vérité est universelle et absolue$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Auteur', 'Dates', 'Position sur la vérité']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Les sophistes (ex. Calliclès)$$, $$contemporains de Socrate$$, $$La vérité est relative à chaque individu$$),
            jsonb_build_array($$Platon$$, $$427-347 av. J.-C.$$, $$La vérité est intelligible, atteinte par la raison$$),
            jsonb_build_array($$Aristote$$, $$384-322 av. J.-C.$$, $$Il n'y a de science que de l'universel, atteint par l'induction$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Que montre l'allégorie de la caverne de Platon ?$$, 'solution', $$Que les hommes, comme des prisonniers enchaînés face au fond d'une caverne, ne perçoivent souvent que des ombres (les apparences sensibles) et prennent celles-ci pour la réalité ; la véritable connaissance exige de se détourner des sens pour accéder, par la raison, au monde intelligible.$$)
      ),
      jsonb_build_object(
        'heading', $$La question du bonheur : scepticisme, épicurisme, stoïcisme$$,
        'body', $$Les philosophies post-socratiques s'interrogent sur la manière d'atteindre le bonheur, conçu comme une paix intérieure. Pyrrhon d'Élis (365-275 av. J.-C.), fondateur du scepticisme, prône la suspension du jugement (épochè) sur toute question, car l'esprit humain est incapable d'atteindre une vérité certaine ; cette suspension procure la quiétude (ataraxie), synonyme de bonheur. Épicure (341-270 av. J.-C.), fondateur de l'épicurisme, enseigne que la mort n'est rien pour nous (« tant que nous existons, la mort n'est pas ; et quand la mort est là, nous ne sommes plus ») et que le bonheur consiste à satisfaire uniquement les désirs naturels et nécessaires, dans la mesure et la simplicité. Enfin, le stoïcisme, fondé par Zénon de Cittium et transmis notamment par Épictète (50-130 apr. J.-C., esclave affranchi), distingue ce qui dépend de nous (nos jugements, nos désirs) de ce qui n'en dépend pas (le corps, la fortune) : l'homme libre et heureux est celui qui se détache des biens extérieurs et concentre son effort sur ce qui dépend réellement de lui.$$,
        'highlights', array[$$Pyrrhon (scepticisme) : suspension du jugement → ataraxie$$, $$Épicure (épicurisme) : désirs naturels et nécessaires, ne pas craindre la mort$$, $$Épictète (stoïcisme) : distinguer ce qui dépend de nous de ce qui n'en dépend pas$$]::text[],
        'example', jsonb_build_object('statement', $$Selon Épictète, pourquoi la fortune ou les charges publiques ne devraient-elles pas nous troubler ?$$, 'solution', $$Parce qu'elles ne dépendent pas de nous (contrairement à nos jugements, désirs et aversions, qui eux dépendent entièrement de nous) ; s'attacher à ce qui ne dépend pas de nous, selon Épictète, c'est s'exposer à être contrarié et troublé, tandis que se concentrer sur ce qui dépend de nous garantit la liberté intérieure.$$),
        'fixation', jsonb_build_object('question', $$Quelle formule d'Épicure résume sa position sur la mort ?$$, 'solution', $$« La mort n'est rien pour nous » : tant que nous existons, la mort n'est pas là ; et quand elle est là, nous n'existons plus — elle n'a donc aucun rapport véritable ni avec les vivants ni avec les morts.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le professeur de philosophie annonce que le prochain devoir portera sur Parménide. Un texte de synthèse rappelle : « Il faut distinguer la vérité de l'opinion trompeuse sur les apparences. La vérité c'est que l'Être est, le non-Être n'est pas. L'Être éternel et indestructible est immuable. »$$,
      'questions', array[
        $$Donne les caractéristiques de l'Être chez Parménide, telles que vues dans le cours.$$,
        $$Identifie l'auteur présocratique dont la position s'oppose à celle de Parménide sur l'Être, et rappelle sa thèse.$$,
        $$Explique en quoi la thèse de Parménide annonce, selon le cours, la position de Platon sur la vérité intelligible.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de grandes périodes comporte l'histoire de la philosophie ?$$,
      'hint', $$De l'antiquité à la période contemporaine.$$,
      'expected', $$Quatre : la période antique, le Moyen Âge et la Renaissance, la période moderne, et la période contemporaine.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les trois préoccupations majeures de la période antique ?$$,
      'hint', $$Être, vrai, heureux.$$,
      'expected', $$La question ontologique (l'Être), la question de la vérité, et la question du bonheur.$$
    ),
    jsonb_build_object(
      'question', $$Pour les sophistes, la vérité est-elle universelle ou relative à chaque individu ?$$,
      'hint', $$C'est ce que leur reprochent Socrate, Platon et Aristote.$$,
      'expected', $$Relative à chaque individu.$$
    ),
    jsonb_build_object(
      'question', $$Selon le stoïcisme d'Épictète, quelles choses dépendent véritablement de nous ?$$,
      'hint', $$Ce sont des opérations de l'âme, pas du corps ou de la fortune.$$,
      'expected', $$Nos jugements, nos tendances, nos désirs et nos aversions — en somme, tout ce qui relève de notre âme.$$
    )
  ),
  now()
);
