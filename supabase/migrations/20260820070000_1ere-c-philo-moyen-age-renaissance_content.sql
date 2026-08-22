-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Philosophie, categoryid=161.
-- Moodle course id 3718: "Leçon 7_Le moyen-âge et la rennaissance"
-- (https://lyc.ecole-ci.org/course/view.php?id=3718), resource id 81599
-- (Philo_1C_lecon7). Contenu réécrit à partir du PDF source (programme
-- officiel MENET-FP, thème "aperçu de l'histoire de la philosophie" — PDF
-- commun "toutes séries"). Faits historiques et doctrinaux réels (dates,
-- biographies, doctrines de Saint Augustin et Machiavel) et courtes
-- citations de leurs œuvres, du domaine public, utilisées à des fins
-- d'illustration pédagogique ; synthèses reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-philo-moyen-age-renaissance',
  '1ere',
  'C',
  'philosophie',
  $$Le Moyen Âge et la Renaissance$$,
  7,
  '1ere-c-philo-periode-antique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une émission télévisée, un intervenant affirme que l'exercice du pouvoir politique est inséparable du « machiavélisme ». Des élèves de 1ère, ayant suivi l'émission, reconnaissent ce mot comme lié au philosophe Machiavel. Pour en savoir plus sur cet auteur et son époque, ils entreprennent des recherches sur les conceptions philosophiques dominantes du Moyen Âge et de la Renaissance.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une période, deux préoccupations$$,
        'body', $$Le Moyen Âge et la Renaissance couvrent la période comprise entre le VIème et le XVème siècle après J.-C. Les préoccupations philosophiques majeures de cette époque sont, d'une part, les rapports entre la philosophie et la religion (au Moyen Âge), et d'autre part les rapports entre la philosophie et la politique (à la Renaissance).$$,
        'highlights', array[$$Moyen Âge et Renaissance : VIème-XVème siècle après J.-C.$$, $$Moyen Âge : philosophie et religion ; Renaissance : philosophie et politique$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux grandes préoccupations philosophiques du Moyen Âge et de la Renaissance ?$$, 'solution', $$Les rapports entre la philosophie et la religion (au Moyen Âge), et les rapports entre la philosophie et la politique (à la Renaissance).$$)
      ),
      jsonb_build_object(
        'heading', $$Saint Augustin : philosophie et religion au Moyen Âge$$,
        'body', $$Saint Augustin (354-430 apr. J.-C.), né en Algérie, converti au christianisme puis évêque, est considéré comme le premier grand penseur chrétien et le plus important des Pères de l'Église. Sa philosophie, influencée à la fois par Platon et par la religion catholique, distingue deux cités dans son ouvrage La Cité de Dieu : la cité terrestre, fondée sur l'amour de soi jusqu'au mépris de Dieu, caractérisée par le désir de domination ; et la cité céleste, fondée sur l'amour de Dieu jusqu'au mépris de soi, caractérisée par la charité (le don de soi). Pour Saint Augustin, la philosophie est amour de la sagesse, or la vraie sagesse est l'amour de Dieu : la philosophie est donc, en définitive, amour de Dieu. Foi et raison sont ainsi complémentaires, non opposées.$$,
        'highlights', array[$$deux cités : cité terrestre (amour de soi) vs cité céleste (amour de Dieu, charité)$$, $$pour Saint Augustin, foi et raison sont complémentaires$$]::text[],
        'example', jsonb_build_object('statement', $$Selon Saint Thomas d'Aquin (autre penseur chrétien du Moyen Âge), pourquoi la philosophie (fondée sur la raison) ne peut-elle pas être en contradiction avec la religion (fondée sur la foi) ?$$, 'solution', $$Parce que, selon lui, la raison et la foi proviennent toutes deux de Dieu ; si elles se contredisaient, l'une des deux serait fausse, ce qui reviendrait à dire que Dieu serait source d'erreur — chose jugée impossible. Une contradiction apparente relèverait donc d'une « perversion de la philosophie », non de la philosophie authentique.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui caractérise la cité céleste, par opposition à la cité terrestre, selon Saint Augustin ?$$, 'solution', $$La cité céleste est caractérisée par l'amour de Dieu et la charité (le don de soi), tandis que la cité terrestre est caractérisée par l'amour de soi et la passion de dominer.$$)
      ),
      jsonb_build_object(
        'heading', $$Machiavel : philosophie et politique à la Renaissance$$,
        'body', $$Nicolas Machiavel (1469-1527), né à Florence dans une Italie déchirée par les guerres entre principautés, fut secrétaire de chancellerie avant d'être emprisonné par les Médicis — période durant laquelle il écrit son œuvre majeure, Le Prince. Machiavel y soutient qu'un prince, surtout nouveau, ne peut pas toujours respecter les règles de la morale ordinaire : pour maintenir son pouvoir, il est souvent contraint d'agir contre sa parole, la charité ou la religion. Il doit néanmoins toujours sembler posséder ces qualités, « car les hommes jugent plutôt avec les yeux qu'avec les mains ». Pour Machiavel, la conservation du pouvoir politique place ainsi le souverain au-dessus des considérations morales ordinaires — c'est le fondement de ce qu'on appellera plus tard le « machiavélisme ». Cette réflexion illustre la complémentarité recherchée entre philosophie et politique : la philosophie doit contribuer à la gestion du pouvoir (son acquisition, son exercice, sa conservation).$$,
        'highlights', array[$$Machiavel, Le Prince : le souverain peut devoir agir contre la morale pour conserver le pouvoir$$, $$« les hommes jugent plutôt avec les yeux qu'avec les mains » : l'apparence de vertu suffit$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi, selon Machiavel, un prince doit-il au moins sembler posséder les qualités morales, même s'il ne peut pas toujours les respecter réellement ?$$, 'solution', $$Parce que les hommes jugent surtout par ce qu'ils voient (les apparences), et rarement par une connaissance directe et intime des actes du prince ; l'apparence de vertu suffit donc à conserver leur adhésion, même quand la réalité de l'exercice du pouvoir exige d'agir autrement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève affirme que « depuis toujours, les philosophes sont tous des athées ». Un texte de Saint Thomas d'Aquin est proposé pour l'aider à nuancer cette affirmation : « La lumière de la foi (...) ne détruit pas la lumière de la raison naturelle mise en nous par Dieu (...) il est impossible que ce qui est manifesté divinement par la foi soit en contradiction avec ce qui est mis en nous par la raison. »$$,
      'questions', array[
        $$Dégage la thèse défendue par Saint Thomas d'Aquin dans ce texte.$$,
        $$Compare cette position à celle de Saint Augustin étudiée dans le cours (foi et raison complémentaires).$$,
        $$En t'appuyant sur ces deux auteurs, explique pourquoi l'affirmation « les philosophes sont tous des athées » est historiquement inexacte pour la période du Moyen Âge.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle période couvre le Moyen Âge et la Renaissance en philosophie ?$$,
      'hint', $$Entre l'antiquité et la période moderne.$$,
      'expected', $$La période comprise entre le VIème et le XVème siècle après J.-C.$$
    ),
    jsonb_build_object(
      'question', $$Comment s'appelle l'œuvre de Saint Augustin qui distingue la cité terrestre et la cité céleste ?$$,
      'hint', $$C'est aussi son ouvrage le plus connu.$$,
      'expected', $$La Cité de Dieu.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'œuvre majeure de Machiavel, et dans quelles circonstances l'a-t-il écrite ?$$,
      'hint', $$Il l'a écrite en captivité.$$,
      'expected', $$Le Prince, écrit alors qu'il était emprisonné par les Médicis.$$
    ),
    jsonb_build_object(
      'question', $$Selon Machiavel, qu'est-ce qui doit primer pour un prince : la morale ordinaire ou la conservation du pouvoir ?$$,
      'hint', $$C'est l'origine du terme « machiavélisme ».$$,
      'expected', $$La conservation du pouvoir politique, qui place le souverain au-dessus des considérations morales ordinaires lorsque cela est nécessaire.$$
    )
  ),
  now()
);
