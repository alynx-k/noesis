-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3703: "SVT 2nd A_L3_La transmission du message nerveux"
-- (https://lyc.ecole-ci.org/course/view.php?id=3703)
-- Resource "Je lis le résumé de la leçon", mod_resource id 37676, redirecting
-- to pluginfile "SVT 2nd A_L3_La transmission du message nerveux.pdf" (14
-- pages; internally "Leçon 1" of the theme "La transmission de l'information
-- au niveau de l'organisme").
-- Rewritten/paraphrased from the source PDF: the reflex-arc experiments on a
-- decerebrated frog (unilateral reflex: receptor/skin, nerve centre/spinal
-- cord, effector/muscle), the sectioning experiments showing the sensory
-- (dorsal root) and motor (ventral root) nerve conductors, the structure of
-- the neuron (cell body, axon, terminal arborisation) and of the synapse,
-- and the step-by-step mechanism of synaptic transmission (Ca2+ influx,
-- acetylcholine release and binding, Na+ channels, acetylcholinesterase
-- hydrolysis). 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-transmission-message-nerveux',
  '2nde',
  'A',
  'svt',
  $$La transmission du message nerveux$$,
  3,
  '2nde-a-svt-habitudes-alimentaires-sante',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant un cours d'EPS, un élève du Lycée Moderne 1 de Bouaflé se blesse profondément à une arcade sourcilière. À l'infirmerie, il sursaute et crie de douleur lors de l'injection de l'anesthésique local. Dix minutes plus tard, alors que l'infirmier suture la plaie, l'élève affirme ne plus rien sentir : l'infirmier explique que le message nerveux n'est plus transmis jusqu'au centre nerveux. Intrigués, les élèves de la classe décident de s'informer sur les organes qui assurent la transmission du message nerveux et d'expliquer le mécanisme de cette transmission.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le message nerveux suit un trajet précis$$,
        'body', $$Sur une grenouille à la fois décérébrée et démédullée, tremper une patte dans l'acide ne provoque aucune réaction : sans moelle épinière, le message ne peut plus être traité. Sur une grenouille seulement décérébrée, la moelle épinière étant intacte, la même stimulation provoque un retrait brusque de la seule patte excitée : c'est le réflexe unilatéral. La peau stimulée constitue le récepteur, la moelle épinière restante joue le rôle de centre nerveux, et le muscle qui se contracte est l'effecteur. Le message nerveux sensitif né au niveau de la peau est conduit jusqu'à la moelle épinière, où il est transformé en message nerveux moteur qui repart vers le muscle.$$,
        'highlights', array[$$réflexe unilatéral$$, $$récepteur$$, $$centre nerveux$$, $$effecteur$$]::text[],
        'property', jsonb_build_object('label', $$Trajet du message nerveux$$, 'text', $$Récepteur → conducteur sensitif → centre nerveux (moelle épinière) → conducteur moteur → effecteur.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi une grenouille décérébrée ET démédullée ne réagit-elle plus à une stimulation acide de la patte ?$$, 'solution', $$Parce que la moelle épinière, seul centre nerveux restant capable de traiter le message chez une grenouille décérébrée, a elle aussi été détruite.$$)
      ),
      jsonb_build_object(
        'heading', $$Des structures particulières assurent la transmission$$,
        'body', $$En sectionnant uniquement le conducteur sensitif au niveau de la racine postérieure du nerf rachidien, tremper la patte dans l'acide ne provoque plus de réaction, alors que stimuler directement le bout central de la section déclenche quand même le réflexe. À l'inverse, en sectionnant le conducteur moteur au niveau de la racine antérieure, seule la stimulation du bout périphérique de la section provoque une réaction. Ces expériences montrent que le message sensitif circule vers le centre nerveux par un nerf sensitif distinct du nerf moteur, qui lui ramène le message vers l'effecteur. Le nerf est un ensemble de fibres nerveuses, chaque fibre appartenant à une cellule appelée neurone.$$,
        'highlights', array[$$racine postérieure$$, $$racine antérieure$$, $$nerf sensitif$$, $$nerf moteur$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Structure sectionnée$$, $$Conséquence observée$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Conducteur sensitif (racine postérieure)$$, $$Pas de réaction à l'acide ; réaction seulement si le bout central est stimulé$$),
            jsonb_build_array($$Conducteur moteur (racine antérieure)$$, $$Pas de réaction à l'acide ; réaction seulement si le bout périphérique est stimulé$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quel nom donne-t-on à l'ensemble de fibres nerveuses qui conduit le message nerveux ?$$, 'solution', $$Un nerf.$$)
      ),
      jsonb_build_object(
        'heading', $$Le neurone et la synapse$$,
        'body', $$Le neurone, unité de base du système nerveux, comprend trois grandes parties : le corps cellulaire, qui renferme le noyau, les dendrites et les inclusions cytoplasmiques ; le cylindraxe ou axone, prolongement de diamètre constant qui conduit le message ; et l'arborisation terminale, qui termine l'axone par de multiples ramifications. Cette organisation impose un sens unique de propagation du message : du corps cellulaire vers l'axone, puis vers l'arborisation terminale. Le neurone sensitif communique avec un neurone d'association, lui-même en contact avec le neurone moteur. La zone de contact entre deux neurones s'appelle la synapse ; elle comprend un bouton présynaptique, une fente synaptique et une membrane postsynaptique.$$,
        'highlights', array[$$neurone$$, $$axone$$, $$synapse$$]::text[],
        'property', jsonb_build_object('label', $$Les trois parties du neurone$$, 'text', $$Corps cellulaire, cylindraxe (axone), arborisation terminale.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la zone de contact entre deux neurones ?$$, 'solution', $$La synapse.$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme de la transmission synaptique$$,
        'body', $$Lorsque le message nerveux atteint l'extrémité présynaptique, il provoque une entrée massive d'ions calcium (Ca2+) dans le bouton présynaptique. Cette entrée de calcium déclenche, par exocytose, la libération d'un neuromédiateur, l'acétylcholine, dans la fente synaptique. L'acétylcholine se fixe alors sur des récepteurs spécifiques de la membrane postsynaptique, ce qui ouvre des canaux à sodium (Na+) : l'entrée massive d'ions Na+ qui s'ensuit permet au message nerveux de se propager dans le neurone postsynaptique. Une fois le message transmis, une enzyme appelée acétylcholinestérase hydrolyse l'acétylcholine, ce qui referme les canaux à Na+ ; les produits de cette hydrolyse sont ensuite recapturés par la terminaison présynaptique. Ce mécanisme chimique explique pourquoi la transmission synaptique se fait toujours dans le même sens, du neurone présynaptique vers le neurone postsynaptique.$$,
        'highlights', array[$$ions Ca2+$$, $$acétylcholine$$, $$acétylcholinestérase$$]::text[],
        'example', jsonb_build_object('statement', $$Que se passerait-il si l'acétylcholinestérase ne pouvait plus détruire l'acétylcholine présente dans la fente synaptique ?$$, 'solution', $$Les canaux à Na+ resteraient ouverts en permanence et la transmission synaptique ne pourrait plus s'arrêter normalement, perturbant le fonctionnement du circuit nerveux.$$),
        'fixation', jsonb_build_object('question', $$Quel ion doit entrer dans le bouton présynaptique pour déclencher la libération de l'acétylcholine ?$$, 'solution', $$L'ion calcium (Ca2+).$$)
      ),
      jsonb_build_object(
        'heading', $$Bilan : trajet, structures et mécanisme$$,
        'body', $$Les expériences menées permettent de confirmer les trois hypothèses de départ : la transmission du message nerveux se fait bien selon un trajet précis (récepteur, centre nerveux, effecteur), grâce à des structures particulières (neurones, nerfs sensitifs et moteurs, synapses), et selon un mécanisme chimique précis au niveau des synapses. C'est cet ensemble qui explique pourquoi l'anesthésie locale, en bloquant la transmission du message nerveux sensitif, supprime temporairement la sensation de douleur.$$,
        'highlights', array[$$trajet$$, $$structures$$, $$mécanisme$$]::text[],
        'fixation', jsonb_build_object('question', $$Selon quels trois aspects se fait la transmission du message nerveux dans l'organisme ?$$, 'solution', $$Selon un trajet, selon des structures particulières (neurones, nerfs, synapses) et selon un mécanisme chimique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit expliquer à un camarade pourquoi une anesthésie locale supprime la douleur pendant quelques dizaines de minutes, en s'appuyant sur le trajet, les structures et le mécanisme de la transmission nerveuse.$$,
      'questions', array[
        $$Décris le trajet suivi par le message nerveux dans un réflexe unilatéral.$$,
        $$Nomme les trois grandes parties d'un neurone.$$,
        $$Explique le rôle des ions Ca2+ et de l'acétylcholine dans la transmission synaptique.$$,
        $$Explique le rôle de l'acétylcholinestérase après le passage du message nerveux.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel organe joue le rôle de centre nerveux dans le réflexe étudié sur la grenouille décérébrée ?$$,
      'hint', $$C'est la structure qui reste intacte lorsque seul le cerveau est détruit.$$,
      'expected', $$La moelle épinière.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on le prolongement du neurone qui conduit le message nerveux, de diamètre constant ?$$,
      'hint', $$On l'appelle aussi cylindraxe.$$,
      'expected', $$L'axone.$$
    ),
    jsonb_build_object(
      'question', $$Quel neuromédiateur est libéré dans la fente synaptique lors de la transmission du message nerveux ?$$,
      'hint', $$C'est une molécule chimique libérée par exocytose.$$,
      'expected', $$L'acétylcholine.$$
    ),
    jsonb_build_object(
      'question', $$Quelle enzyme détruit l'acétylcholine après le passage du message nerveux dans la synapse ?$$,
      'hint', $$Son nom contient « acétylcholine » suivi de « estérase ».$$,
      'expected', $$L'acétylcholinestérase.$$
    )
  ),
  now()
);
