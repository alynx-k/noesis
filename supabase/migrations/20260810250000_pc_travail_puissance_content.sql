-- Physique-Chimie 3ème — Travail et puissance mécaniques.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème mechanics competency (W=F×d,
-- travail moteur/résistant, P=W/t, P=F×v). Original wording throughout,
-- not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un artisan utilise un treuil pour hisser un sac de ciment jusqu'au deuxième étage d'un immeuble en construction. Il se demande combien de temps il devrait mettre pour ne pas fatiguer inutilement son moteur, et comment comparer l'effort fourni par son treuil à celui d'un autre, plus puissant. Que mesurent exactement le travail et la puissance d'une force ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Travail d'une force constante$$,
        'body', $$Quand le point d'application d'une force constante se déplace dans la direction de cette force, la force effectue un travail. Le travail d'une force constante colinéaire au déplacement est le produit de sa valeur par la distance parcourue par son point d'application : W=F×d. Il s'exprime en joules (J) quand F est en newtons et d en mètres.$$,
        'highlights', array[$$travail$$, $$joules$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$W=F×d, où W est le travail en joules (J), F la valeur de la force en newtons (N), colinéaire au déplacement, et d la distance parcourue par le point d'application, en mètres (m).$$),
        'example', jsonb_build_object('statement', $$Un ouvrier tire une caisse sur 8 m avec une force horizontale constante de 50 N, dans la direction du déplacement. Calcule le travail de cette force.$$, 'solution', $$W=F×d=50×8=400 J.$$),
        'fixation', jsonb_build_object('question', $$Une grue soulève une charge de 20 m de hauteur en exerçant une force de 300 N. Calcule le travail effectué.$$, 'solution', $$W=F×d=300×20=6000 J.$$)
      ),
      jsonb_build_object(
        'heading', $$Travail moteur et travail résistant$$,
        'body', $$Le travail d'une force peut être moteur ou résistant, selon que la force facilite ou s'oppose au déplacement. Si la force et le déplacement ont le même sens, le travail est moteur et compté positivement. Si la force s'oppose au déplacement, le travail est résistant et compté négativement. Si la force est perpendiculaire au déplacement, son travail est nul.$$,
        'highlights', array[$$travail moteur$$, $$travail résistant$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le travail d'une force est moteur (positif) si la force a le même sens que le déplacement, résistant (négatif) si elle a un sens opposé, et nul si elle est perpendiculaire au déplacement.$$),
        'example', jsonb_build_object('statement', $$Un cycliste roule sur une route horizontale ; le frottement de l'air s'oppose à son avancée. Ce travail du frottement est-il moteur ou résistant ?$$, 'solution', $$Le frottement s'oppose au déplacement : son travail est résistant (négatif).$$),
        'fixation', jsonb_build_object('question', $$Un objet posé sur un chariot se déplace horizontalement ; son poids est vertical. Quel est le travail du poids pendant ce déplacement ?$$, 'solution', $$Le poids est perpendiculaire au déplacement horizontal, donc son travail est nul.$$)
      ),
      jsonb_build_object(
        'heading', $$Puissance mécanique$$,
        'body', $$La puissance mesure la rapidité avec laquelle un travail est effectué. Elle est égale au travail divisé par la durée nécessaire pour l'effectuer, et s'exprime en watts (W).$$,
        'highlights', array[$$puissance$$, $$watts$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$P=W/t, où P est la puissance en watts (W), W le travail en joules (J), et t la durée en secondes (s). 1 W=1 J/s.$$),
        'example', jsonb_build_object('statement', $$Un moteur effectue un travail de 3000 J en 15 s. Calcule sa puissance.$$, 'solution', $$P=W/t=3000/15=200 W.$$),
        'fixation', jsonb_build_object('question', $$Un ouvrier effectue un travail de 900 J en 30 s. Calcule sa puissance.$$, 'solution', $$P=900/30=30 W.$$)
      ),
      jsonb_build_object(
        'heading', $$Relation entre puissance et vitesse$$,
        'body', $$Lorsqu'une force constante agit dans la direction du déplacement, sa puissance peut aussi se calculer directement à partir de la vitesse du point d'application, sans passer par la durée.$$,
        'highlights', array[$$relation puissance-vitesse$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$P=F×v, où F est la valeur de la force en newtons (N) et v la vitesse du point d'application en mètres par seconde (m/s), la force et le déplacement étant colinéaires.$$),
        'example', jsonb_build_object('statement', $$Un moteur exerce une force de 400 N sur un mobile qui se déplace à la vitesse constante de 5 m/s. Calcule la puissance développée.$$, 'solution', $$P=F×v=400×5=2000 W.$$),
        'fixation', jsonb_build_object('question', $$Une force de 150 N fait avancer un chariot à 2 m/s. Calcule la puissance développée.$$, 'solution', $$P=150×2=300 W.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un artisan utilise un treuil pour hisser un sac de ciment de 25 kg, de poids environ 245 N, jusqu'au deuxième étage d'un immeuble, sur une hauteur de 6 m, en 10 secondes.$$,
      'questions', array[
        $$Calcule le travail effectué par le treuil pour soulever le sac.$$,
        $$Calcule la puissance développée par le treuil pendant cette opération.$$,
        $$Si le treuil hissait le même sac deux fois plus vite (même hauteur, en 5 s), la puissance développée serait-elle plus grande, plus petite ou identique ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un déménageur pousse une armoire sur 4 m avec une force horizontale constante de 120 N dans le sens du déplacement. Calcule le travail de cette force.$$,
      'hint', $$Utilise W=F×d.$$,
      'expected', $$W=120×4=480 J.$$
    ),
    jsonb_build_object(
      'question', $$Un moteur électrique effectue un travail de 5400 J en 60 s. Calcule sa puissance en watts.$$,
      'hint', $$Utilise P=W/t.$$,
      'expected', $$P=5400/60=90 W.$$
    ),
    jsonb_build_object(
      'question', $$Une poulie exerce une force de 80 N sur une charge qui monte à la vitesse constante de 0,5 m/s. Calcule la puissance développée.$$,
      'hint', $$Utilise P=F×v.$$,
      'expected', $$P=80×0,5=40 W.$$
    ),
    jsonb_build_object(
      'question', $$Un vélo roule sur une route horizontale ; le poids du cycliste reste vertical pendant tout le trajet. Le travail du poids est-il moteur, résistant ou nul ? Justifie.$$,
      'hint', $$Compare la direction du poids à celle du déplacement.$$,
      'expected', $$Le poids est perpendiculaire au déplacement horizontal, donc son travail est nul.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-travail-puissance';
