-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 2 : Commande d'un circuit électrique" (id 2094). Contenu
-- réécrit à partir du PDF source ; situation d'apprentissage, définitions
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève constate qu'en ouvrant la portière d'une voiture ou d'un réfrigérateur, une lampe s'allume, puis s'éteint en refermant la portière. Avec le professeur, la classe identifie les différents organes de commande et apprend à réaliser et schématiser les circuits qu'ils commandent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'interrupteur simple et le bouton poussoir$$,
        'body', $$L'interrupteur simple ouvre ou ferme un circuit électrique de façon permanente : une fois actionné, il reste dans sa position (allumé ou éteint) jusqu'à la prochaine manipulation. Le bouton poussoir, lui, ouvre ou ferme le circuit de façon temporaire : l'effet ne dure que le temps où l'on appuie. Il existe deux types : le bouton poussoir fermé au repos (utilisé pour la lampe d'un réfrigérateur ou d'une voiture — la lampe est allumée par défaut et s'éteint quand on appuie/ferme la portière) et le bouton poussoir ouvert au repos (utilisé pour une sonnerie ou une sirène — le circuit ne se ferme que le temps de l'appui).$$,
        'highlights', array[$$interrupteur simple = commande permanente$$, $$bouton poussoir = commande temporaire ; fermé au repos (frigo/voiture) vs ouvert au repos (sonnerie/sirène)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel organe de commande allume la lampe d'un réfrigérateur ?$$, 'solution', $$Un bouton poussoir fermé au repos.$$)
      ),
      jsonb_build_object(
        'heading', $$Le commutateur$$,
        'body', $$Le commutateur possède trois bornes : le commun (C), la position repos (R), et la position travail (T). Il permet d'allumer alternativement deux lampes électriques : quand le commutateur relie C à R, une lampe s'allume ; quand il relie C à T, c'est l'autre lampe qui s'allume. Les deux lampes ne peuvent donc jamais être allumées en même temps avec un seul commutateur relié aux deux.$$,
        'highlights', array[$$commutateur = 3 bornes (C, R, T) → allumage alterné de deux lampes$$]::text[],
        'example', jsonb_build_object('statement', $$Un commutateur relie C à T : quelle lampe s'allume, si L1 est branchée sur R et L2 sur T ?$$, 'solution', $$La lampe L2 s'allume (car C est relié à T, la position de L2).$$),
        'fixation', jsonb_build_object('question', $$Combien de bornes possède un commutateur ?$$, 'solution', $$Trois : le commun (C), la position repos (R), et la position travail (T).$$)
      ),
      jsonb_build_object(
        'heading', $$Le montage va-et-vient$$,
        'body', $$Le montage va-et-vient utilise deux commutateurs reliés entre eux. Il permet de commander (allumer ou éteindre) une même lampe électrique à partir de deux endroits différents : la lampe s'allume quand les deux commutateurs sont dans des positions "compatibles" (tous deux en position travail, ou tous deux en position repos), et s'éteint sinon. On l'utilise pour l'éclairage des escaliers d'un immeuble, ou de certaines chambres et salons.$$,
        'highlights', array[$$va-et-vient = 2 commutateurs → commande une lampe depuis 2 endroits différents$$, $$usage typique : éclairage d'escaliers$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi utilise-t-on un montage va-et-vient pour l'éclairage d'un escalier ?$$, 'solution', $$Pour pouvoir allumer la lampe en bas de l'escalier et l'éteindre en haut (ou l'inverse), sans avoir à revenir sur ses pas.$$),
        'fixation', jsonb_build_object('question', $$Combien de commutateurs sont nécessaires pour un montage va-et-vient ?$$, 'solution', $$Deux commutateurs reliés entre eux.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les escaliers de la maison familiale sont éclairés par une lampe commandée en deux points : au pied des escaliers et à l'étage. Ton cousin, venu du village, ne comprend pas ce système d'allumage.$$,
      'questions', array[
        $$Nomme le type de montage réalisé pour cette lampe.$$,
        $$Cite les éléments qui composent ce circuit.$$,
        $$Explique brièvement le fonctionnement de ce montage à ton cousin.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel organe ouvre ou ferme un circuit de façon permanente ?$$,
      'hint', $$C'est le plus simple des trois organes de commande.$$,
      'expected', $$L'interrupteur simple.$$
    ),
    jsonb_build_object(
      'question', $$Quel organe permet d'allumer alternativement deux lampes ?$$,
      'hint', $$Il a trois bornes.$$,
      'expected', $$Le commutateur.$$
    ),
    jsonb_build_object(
      'question', $$Le bouton poussoir ouvert au repos est-il utilisé pour une sirène ou pour la lampe d'un réfrigérateur ?$$,
      'hint', $$Pense à ce qui doit rester silencieux/éteint par défaut.$$,
      'expected', $$Pour une sirène (ou une sonnerie).$$
    ),
    jsonb_build_object(
      'question', $$Combien de points de commande permet un montage va-et-vient ?$$,
      'hint', $$C'est son avantage principal.$$,
      'expected', $$Deux points de commande différents.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-commande-circuit';
