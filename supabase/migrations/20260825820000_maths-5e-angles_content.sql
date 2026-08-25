-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Géométrie du plan).
-- Cours : "Leçon 3 : Angles". Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés,
-- valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En entrant en classe un matin, des élèves de 5ème découvrent au tableau une figure où un triangle ABC semble rectangle en B, avec des angles de 38° et 52° marqués à l'extérieur. L'un des élèves affirme que le triangle est rectangle en B. Pour vérifier, ses camarades décident de s'informer sur les angles opposés par le sommet, les angles adjacents, et la somme des angles d'un triangle.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Angles adjacents$$,
        'body', $$Deux angles sont adjacents lorsqu'ils ont le même sommet, un côté commun, et sont situés de part et d'autre de ce côté commun. Si les angles SRO et ORT sont adjacents, alors mes SRO + mes ORT = mes SRT.$$,
        'highlights', array[$$adjacents = même sommet + côté commun + de part et d'autre du côté commun$$, $$si adjacents : la somme des deux angles = l'angle total$$]::text[],
        'example', jsonb_build_object('statement', $$Les angles BAC et CAD sont adjacents, avec mes BAC = 60° et mes CAD = 50°. Trouve mes BAD.$$, 'solution', $$mes BAD = mes BAC + mes CAD = 60° + 50° = 110°.$$),
        'fixation', jsonb_build_object('question', $$Les angles SRO et ORT sont adjacents avec mes SRO=40° et mes SRT=100°. Calcule mes ORT.$$, 'solution', $$mes ORT = mes SRT - mes SRO = 100° - 40° = 60°.$$)
      ),
      jsonb_build_object(
        'heading', $$Angles complémentaires, supplémentaires et opposés par le sommet$$,
        'body', $$Deux angles sont complémentaires si la somme de leurs mesures vaut 90°, et supplémentaires si elle vaut 180°. Deux angles opposés par le sommet ont le même sommet et leurs côtés sont des demi-droites opposées deux à deux : ils ont alors toujours la même mesure.$$,
        'highlights', array[$$complémentaires : somme = 90°$$, $$supplémentaires : somme = 180°$$, $$opposés par le sommet : même mesure$$]::text[],
        'example', jsonb_build_object('statement', $$Deux angles EMN et KPC sont supplémentaires, avec mes EMN = 35°. Calcule mes KPC.$$, 'solution', $$mes KPC = 180° - 35° = 145°.$$),
        'fixation', jsonb_build_object('question', $$Deux angles MNP et EFG ont pour mesures 53° et 37°. Sont-ils complémentaires ?$$, 'solution', $$Oui, car 53° + 37° = 90°.$$)
      ),
      jsonb_build_object(
        'heading', $$Somme des angles d'un triangle$$,
        'body', $$Dans tout triangle, la somme des mesures des trois angles est égale à 180°. Cette propriété, combinée à celle des angles adjacents et opposés par le sommet, permet de déterminer un angle manquant dans une figure complexe.$$,
        'highlights', array[$$dans un triangle : angle 1 + angle 2 + angle 3 = 180°$$]::text[],
        'example', jsonb_build_object('statement', $$Un triangle RST a mes S = 110° et mes R = 60°. Calcule mes T.$$, 'solution', $$mes T = 180° - (110° + 60°) = 180° - 170° = 10°.$$),
        'fixation', jsonb_build_object('question', $$Un triangle a deux angles de 25° et 52°. Quelle est la mesure du troisième ?$$, 'solution', $$180° - (25° + 52°) = 103°.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur une figure au tableau, un triangle ABC a un angle en A de 38° et un angle extérieur en C, formé avec une droite (CD) et un point E, de 52°. Un élève affirme que le triangle ABC est rectangle en B.$$,
      'questions', array[
        $$Justifie que mes ACB = 52° (en utilisant les angles opposés par le sommet).$$,
        $$Calcule mes CBA en utilisant la somme des angles du triangle ABC.$$,
        $$Le triangle ABC est-il bien rectangle en B ? Conclus.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Deux angles opposés par le sommet ont-ils toujours la même mesure ?$$,
      'hint', $$C'est une propriété générale, pas un cas particulier.$$,
      'expected', $$Oui, toujours.$$
    ),
    jsonb_build_object(
      'question', $$Deux angles ont pour mesures 65° et 115°. Sont-ils supplémentaires ?$$,
      'hint', $$Additionne les deux mesures.$$,
      'expected', $$Oui, car 65° + 115° = 180°.$$
    ),
    jsonb_build_object(
      'question', $$Dans un triangle, deux angles mesurent 30° et 90°. Quelle est la mesure du troisième angle ?$$,
      'hint', $$La somme des trois angles vaut 180°.$$,
      'expected', $$60° (180° - 30° - 90°).$$
    ),
    jsonb_build_object(
      'question', $$Deux angles adjacents ont-ils nécessairement le même sommet ?$$,
      'hint', $$C'est une des trois conditions de la définition.$$,
      'expected', $$Oui, c'est une condition nécessaire de leur définition.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-angles';
