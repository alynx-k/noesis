-- Physique-Chimie 4ème — Aimant et bobine.
-- Real content sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2014 "Lecon5_Aimant et bobine", resource id
-- 16464 ("Je lis le résumé de la leçon"), PDF
-- "PC 4ème_L5_Aimant et bobine.pdf" (9 pages, thème Courants et tensions
-- alternatifs). Rewritten in original wording — paraphrased, not copied
-- from the source PDF — keeping the same technical content: magnet
-- properties and poles (identified via a compass needle), interaction
-- between two magnets, the coil as a temporary magnet whose faces depend
-- on current direction, and the electromagnet (iron core) with its
-- applications (relay, télérupteur).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une conférence donnée dans un lycée, un agent de la compagnie d'électricité affirme que l'éclairage public est commandé par un dispositif appelé électroaimant. De retour en classe, les élèves veulent comprendre ce que sont un aimant et une bobine, connaître leurs propriétés, puis découvrir comment on fabrique et on utilise un électroaimant.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Propriétés et pôles d'un aimant$$,
        'body', $$Un aimant est un corps capable d'attirer le fer, le nickel, le cobalt et les objets fabriqués à partir de ces métaux. Cette attraction se manifeste surtout à ses deux extrémités, appelées pôles : un pôle Nord et un pôle Sud. Pour identifier ces pôles sur un aimant inconnu, on approche une aiguille aimantée (comme celle d'une boussole) : l'extrémité qui attire le pôle Nord de l'aiguille est le pôle Sud de l'aimant, et celle qui attire son pôle Sud est le pôle Nord de l'aimant.$$,
        'highlights', array[$$aimant$$, $$pôle Nord$$, $$pôle Sud$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un aimant attire le fer, le nickel, le cobalt et leurs alliages, principalement par ses deux pôles, Nord et Sud. Le pôle Nord d'une aiguille aimantée est toujours attiré par le pôle Sud de l'aimant qu'on lui présente.$$),
        'example', jsonb_build_object('statement', $$On approche une aiguille aimantée d'une extrémité d'un aimant inconnu : le pôle Nord de l'aiguille est repoussé, tandis que son pôle Sud est attiré. Quel est le nom de cette extrémité de l'aimant ?$$, 'solution', $$Puisque le pôle Sud de l'aiguille est attiré, cette extrémité de l'aimant est son pôle Nord (un pôle Nord attire toujours un pôle Sud).$$),
        'fixation', jsonb_build_object('question', $$Quels métaux un aimant est-il capable d'attirer ?$$, 'solution', $$Le fer, le nickel, le cobalt et les objets fabriqués à partir de ces métaux.$$)
      ),
      jsonb_build_object(
        'heading', $$Interaction entre deux aimants$$,
        'body', $$Lorsqu'on approche deux aimants l'un de l'autre, le résultat dépend des pôles mis face à face : deux pôles de même nom se repoussent, deux pôles de noms différents s'attirent.$$,
        'highlights', array[$$attraction$$, $$répulsion$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Deux pôles Nord (ou deux pôles Sud) présentés l'un à l'autre se repoussent. Un pôle Nord et un pôle Sud présentés l'un à l'autre s'attirent.$$),
        'example', jsonb_build_object('statement', $$Trois aimants droits AB, CD et EF sont disposés côte à côte : le pôle A attire le pôle C, et F est un pôle Sud. Que peut-on dire du pôle C ?$$, 'solution', $$Si A attire C, ils sont de noms différents. Il faut connaître la nature de A pour conclure sur C, mais dans tous les cas C est le pôle opposé à celui de A.$$),
        'fixation', jsonb_build_object('question', $$Deux aimants sont présentés pôle Sud contre pôle Sud. Vont-ils s'attirer ou se repousser ?$$, 'solution', $$Ils vont se repousser, car ce sont deux pôles de même nom.$$)
      ),
      jsonb_build_object(
        'heading', $$La bobine, un aimant temporaire$$,
        'body', $$Une bobine est un long fil conducteur en cuivre, isolé par une gaine, enroulé sur un support généralement cylindrique. Parcourue par un courant électrique, elle se comporte comme un aimant : elle attire les aiguilles aimantées par ses deux extrémités, appelées faces, l'une Nord et l'autre Sud. La nature de chaque face dépend du sens du courant qui traverse la bobine : inverser les bornes de la pile inverse les faces Nord et Sud.$$,
        'highlights', array[$$bobine$$, $$face Nord$$, $$face Sud$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une bobine parcourue par un courant électrique se comporte comme un aimant, avec une face Nord et une face Sud dont la position dépend du sens du courant. Deux faces de même nom se repoussent, deux faces de noms différents s'attirent, comme pour un aimant.$$),
        'example', jsonb_build_object('statement', $$Une bobine reliée à une pile attire le pôle Nord d'une aiguille aimantée par l'une de ses faces. On inverse ensuite les bornes de la pile. Que devient cette face de la bobine ?$$, 'solution', $$Elle change de nature : si elle attirait le pôle Nord de l'aiguille (c'était donc une face Sud), elle devient une face Nord et repousse désormais ce même pôle Nord.$$),
        'fixation', jsonb_build_object('question', $$Que devient l'effet magnétique d'une bobine si l'on ouvre le circuit qui l'alimente ?$$, 'solution', $$Il disparaît immédiatement : sans courant, la bobine ne se comporte plus comme un aimant.$$)
      ),
      jsonb_build_object(
        'heading', $$L'électroaimant et ses applications$$,
        'body', $$Un électroaimant est une bobine parcourue par un courant électrique, à l'intérieur de laquelle est placée une tige de fer appelée noyau. Ce noyau de fer doux renforce considérablement l'attraction produite par la bobine. Parmi les applications de l'électroaimant figurent le relais et le télérupteur, deux interrupteurs actionnés à distance par un électroaimant, utilisés par exemple pour commander l'éclairage public.$$,
        'highlights', array[$$électroaimant$$, $$noyau de fer$$, $$relais$$, $$télérupteur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un électroaimant associe une bobine parcourue par un courant et un noyau de fer doux, qui amplifie l'effet magnétique. Le relais et le télérupteur sont des interrupteurs commandés par un électroaimant.$$),
        'example', jsonb_build_object('statement', $$Un agent d'électricité explique que l'éclairage public est déclenché par un interrupteur actionné à distance par un électroaimant. Comment appelle-t-on un tel interrupteur ?$$, 'solution', $$C'est un relais (ou un télérupteur), un dispositif qui utilise un électroaimant pour ouvrir ou fermer un circuit à distance.$$),
        'fixation', jsonb_build_object('question', $$Que place-t-on à l'intérieur d'une bobine pour fabriquer un électroaimant, et quel est l'effet de cet ajout ?$$, 'solution', $$On y place une tige de fer doux, appelée noyau, qui renforce l'attraction magnétique de la bobine.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'élèves reçoit trois aimants droits AB, CD et EF : le pôle A attire le pôle C, le pôle D repousse le pôle E, et le pôle F est un pôle Sud. Ils doivent déterminer la nature de chacun des pôles A, B, C, D et E.$$,
      'questions', array[
        $$Sachant que E est un pôle Nord (car il repousse D), quelle doit être la nature du pôle D ?$$,
        $$Sachant que A attire C, si A est un pôle Nord, quelle est la nature de C ?$$,
        $$Y a-t-il attraction ou répulsion entre A et F, sachant que F est un pôle Sud et que A est un pôle Nord ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux métaux, autres que le fer, qu'un aimant est capable d'attirer.$$,
      'hint', $$Pense aux matériaux ferromagnétiques cités dans la leçon.$$,
      'expected', $$Le nickel et le cobalt.$$
    ),
    jsonb_build_object(
      'question', $$Deux aimants sont présentés pôle Sud contre pôle Nord. Vont-ils s'attirer ou se repousser ?$$,
      'hint', $$Compare les noms des deux pôles en présence.$$,
      'expected', $$Ils vont s'attirer, car ce sont deux pôles de noms différents.$$
    ),
    jsonb_build_object(
      'question', $$Une bobine reliée à une pile attire une aiguille aimantée par sa face A. On inverse le sens du courant. Que devient la face A ?$$,
      'hint', $$Le sens du courant détermine la nature des faces d'une bobine.$$,
      'expected', $$La nature de la face A s'inverse : elle devient une face de nom opposé à celui qu'elle avait avant l'inversion du courant.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un électroaimant, et quel élément supplémentaire distingue une bobine simple d'un électroaimant ?$$,
      'hint', $$Pense à ce qu'on ajoute à l'intérieur de la bobine.$$,
      'expected', $$Un électroaimant est une bobine parcourue par un courant, à l'intérieur de laquelle on a placé une tige de fer doux appelée noyau, qui renforce son attraction.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-aimant-bobine';
