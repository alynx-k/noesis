-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- SVT, categoryid=125.
-- Moodle course id 896: "SVT 1ère A_L2_Les effets des drogues sur le
-- comportement" (https://lyc.ecole-ci.org/course/view.php?id=896),
-- resource id 4401. Contenu réécrit à partir du PDF source (types de
-- drogues, organes cibles dans l'encéphale, mécanisme synaptique). Faits
-- scientifiques réels (classification des drogues, structures cérébrales,
-- mécanisme synaptique) repris tels quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-svt-effets-drogues-comportement',
  '1ere',
  'A',
  'svt',
  $$Les effets des drogues sur le comportement$$,
  2,
  '1ere-a-svt-reflexe-conditionnel',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une fête de fin d'année, un élève de 1ère A, d'habitude très calme, devient agité, se dispute avec des invités et se bagarre. Il s'avère qu'il a consommé de la drogue. Ses amis décident de s'informer sur les effets des drogues sur le comportement et les organes, et d'expliquer leur mode d'action.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les trois grandes familles de drogues$$,
        'body', $$Les drogues à effets excitateurs (ou psychostimulants), comme la cocaïne, le crack, la caféine ou les amphétamines, provoquent le recul de la fatigue, une sensation de bien-être, une hyperactivité motrice et intellectuelle, et créent une forte dépendance physique. Les drogues à effets inhibiteurs (ou psycho-dépresseurs), comme l'opium, la morphine, l'héroïne ou la benzodiazépine, sont des calmants qui entraînent torpeur, baisse d'activité et une forte dépendance psychique. Les drogues à effets mixtes (ou perturbateurs), comme le cannabis ou la mescaline LSD, combinent effets calmants et excitants, provoquant euphorie, confusion mentale et parfois hallucinations.$$,
        'highlights', array[$$excitateurs : cocaïne, crack, amphétamines$$, $$inhibiteurs : opium, morphine, héroïne$$, $$mixtes : cannabis, LSD$$]::text[],
        'fixation', jsonb_build_object('question', $$À quelle famille de drogues appartient la cocaïne, et quel est son effet principal ?$$, 'solution', $$Elle appartient aux drogues à effets excitateurs (psychostimulants) ; elle provoque une hyperactivité motrice et intellectuelle et une forte dépendance physique.$$)
      ),
      jsonb_build_object(
        'heading', $$Les organes cibles dans l'encéphale$$,
        'body', $$Les drogues agissent sur des zones précises de l'encéphale : le système limbique (siège du plaisir et des émotions) est la cible des tranquillisants comme les opiacées ; le cortex cérébral (siège de la réflexion, de la mémoire, du langage) est affecté par les sédatifs ; le mésencéphale est la cible des antidépresseurs ; le thalamus est sensible aux stimulants, sédatifs, tranquillisants et antidépresseurs ; le cervelet, siège de l'équilibre et de la coordination motrice, est sensible au cannabis et à l'alcool, ce qui explique la démarche titubante des consommateurs.$$,
        'highlights', array[$$système limbique : tranquillisants$$, $$cortex cérébral : réflexion, mémoire, langage$$, $$cervelet : équilibre → démarche titubante$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi une personne sous l'effet du cannabis ou de l'alcool peut-elle avoir une démarche titubante ?$$, 'solution', $$Parce que ces drogues affectent le cervelet, qui est le siège de l'équilibre et de la coordination des mouvements, provoquant une rupture de la coordination motrice.$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme synaptique des drogues excitatrices$$,
        'body', $$Les drogues agissent au niveau des synapses, zones de contact entre deux neurones. Les drogues excitatrices agissent de deux façons : elles provoquent la libération massive de neuromédiateurs (comme la dopamine, avec l'amphétamine) dans la fente synaptique, intensifiant la transmission nerveuse ; ou elles bloquent la recapture du neuromédiateur au niveau du neurone présynaptique (comme la cocaïne), ce qui maintient une forte concentration dans la fente synaptique et une excitation continue de la membrane post-synaptique.$$,
        'highlights', array[$$synapse = zone de contact entre neurones$$, $$amphétamine : libération massive de dopamine$$, $$cocaïne : blocage de la recapture$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la différence entre le mode d'action de l'amphétamine et celui de la cocaïne, bien que toutes deux soient excitatrices ?$$, 'solution', $$L'amphétamine accélère la libération de dopamine dans la fente synaptique, tandis que la cocaïne se fixe sur la membrane présynaptique et empêche la recapture du neuromédiateur, provoquant ainsi une accumulation et une excitation continue.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la zone de contact entre deux neurones où agissent les drogues ?$$, 'solution', $$La synapse.$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme des drogues inhibitrices$$,
        'body', $$Les drogues inhibitrices ralentissent l'activité nerveuse de deux façons : soit en bloquant, au niveau de la membrane présynaptique, la libération du neuromédiateur (les opiacées bloquent ainsi la libération de la substance P, d'où leur effet analgésique) ; soit en se fixant sur les récepteurs de la membrane post-synaptique pour empêcher la fixation du neurotransmetteur, ce qui bloque la transmission de l'influx nerveux et peut provoquer, à terme, une dégénérescence des neurones, une perte de mémoire ou un amaigrissement.$$,
        'highlights', array[$$opiacées : bloquent la libération de la substance P$$, $$blocage des récepteurs post-synaptiques → non-transmission$$]::text[],
        'fixation', jsonb_build_object('question', $$Par quel mécanisme les opiacées produisent-elles leur effet analgésique (anti-douleur) ?$$, 'solution', $$Elles se fixent sur la membrane présynaptique et bloquent la libération de la substance P, un neuromédiateur impliqué dans la transmission de la douleur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une fête de fin d'année, un élève de 1ère A, d'habitude très calme, devient agité, se dispute avec des invités et se bagarre avec certains élèves. Il s'avère qu'il a consommé de la drogue.$$,
      'questions', array[
        $$Relève dans la situation les effets de la drogue consommée par cet élève.$$,
        $$Explique le mode d'action probable de cette drogue au niveau de la synapse.$$,
        $$Déduis le type de drogue (excitatrice, inhibitrice ou mixte) auquel appartient cette drogue.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux exemples de drogues à effets excitateurs (psychostimulants).$$,
      'hint', $$Elles provoquent une hyperactivité.$$,
      'expected', $$Par exemple la cocaïne et le crack (également valables : la caféine, les amphétamines).$$
    ),
    jsonb_build_object(
      'question', $$Quelle partie de l'encéphale est le siège du comportement affectif et des fonctions de plaisir, ciblée par les tranquillisants ?$$,
      'hint', $$Elle intervient dans les réactions émotionnelles.$$,
      'expected', $$Le système limbique.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie le terme "toxicomanie" ?$$,
      'hint', $$C'est défini dans la conclusion générale du cours.$$,
      'expected', $$Une intoxication chronique de l'organisme par des drogues ou médicaments, entraînant un état de dépendance ou d'accoutumance physique et psychique.$$
    ),
    jsonb_build_object(
      'question', $$Comment les drogues inhibitrices peuvent-elles empêcher la transmission de l'influx nerveux ?$$,
      'hint', $$Deux mécanismes sont possibles.$$,
      'expected', $$En bloquant la libération du neuromédiateur au niveau présynaptique, ou en se fixant sur les récepteurs post-synaptiques pour empêcher la fixation du neurotransmetteur.$$
    )
  ),
  now()
);
