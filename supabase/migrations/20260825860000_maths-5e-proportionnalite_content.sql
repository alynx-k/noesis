-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Organisation et traitement de données).
-- Cours : "Leçon 9 : Proportionnalité". Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices
-- reformulés, valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour son anniversaire, un élève de 5ème vivant à Cocody se rend à la plage de Grand-Bassam avec ses parents. La distance est de 45 km, parcourue en 30 minutes ; la voiture consomme 8 litres aux 100 km, à 600 FCFA le litre. De retour en classe, il veut calculer la vitesse moyenne de son père et le coût du carburant utilisé pour ce trajet.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vitesse, débit et masse volumique moyens$$,
        'body', $$Trois grandeurs quotients courantes : la vitesse moyenne = distance parcourue ÷ durée du parcours (en km/h, m/s...) ; le débit moyen = volume de liquide écoulé ÷ durée de l'écoulement (en L/s, L/h...) ; la masse volumique = masse d'un objet ÷ volume de cet objet.$$,
        'highlights', array[$$vitesse moyenne = distance ÷ durée$$, $$débit moyen = volume ÷ durée$$, $$masse volumique = masse ÷ volume$$]::text[],
        'example', jsonb_build_object('statement', $$Une pompe remplit une cuve de 15 000 litres en 5 minutes. Calcule son débit moyen.$$, 'solution', $$D = 15 000 ÷ 5 = 3 000 L/min.$$),
        'fixation', jsonb_build_object('question', $$Ali habite à 600m de son collège et met 12 min à pied pour s'y rendre. Calcule sa vitesse moyenne.$$, 'solution', $$V = 600 ÷ 12 = 50 m/min.$$)
      ),
      jsonb_build_object(
        'heading', $$Repérage dans le plan$$,
        'body', $$Un repère du plan (O, I, J) est formé de deux droites sécantes en O : (OI), l'axe des abscisses, et (OJ), l'axe des ordonnées. Un point est repéré par son couple de coordonnées (abscisse ; ordonnée). Par exemple, un point A repéré par +2 sur l'axe des abscisses et +3 sur l'axe des ordonnées a pour coordonnées (+2 ; +3).$$,
        'highlights', array[$$(OI) = axe des abscisses ; (OJ) = axe des ordonnées$$, $$un point a pour coordonnées (abscisse ; ordonnée)$$]::text[],
        'fixation', jsonb_build_object('question', $$Un point B est repéré par -1 sur l'axe des abscisses et 4 sur l'axe des ordonnées. Quelles sont ses coordonnées ?$$, 'solution', $$(-1 ; 4).$$)
      ),
      jsonb_build_object(
        'heading', $$Représentation graphique d'un tableau de proportionnalité$$,
        'body', $$Dans un repère, les points dont les coordonnées correspondent aux colonnes d'un tableau de proportionnalité sont tous alignés sur une droite passant par l'origine du repère. Cette propriété permet de vérifier graphiquement si une situation est proportionnelle, ou de lire des valeurs manquantes.$$,
        'highlights', array[$$tableau de proportionnalité → points alignés sur une droite passant par l'origine$$]::text[],
        'example', jsonb_build_object('statement', $$Un tableau durée(h)/distance(km) donne (3,120), (5,200), (6,240), (10,400). Ces points sont-ils alignés avec l'origine ?$$, 'solution', $$Oui, car le tableau est de proportionnalité (120/3 = 200/5 = 240/6 = 400/10 = 40) : tous les points sont sur une même droite passant par O.$$),
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on graphiquement un tableau de proportionnalité ?$$, 'solution', $$Ses points représentés dans un repère sont alignés sur une droite passant par l'origine.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$La famille YAPO (6 personnes) prend chacune deux douches de 5 minutes par jour, avec un robinet de débit 15 L/min. On leur propose de changer pour un robinet à débit 6 L/min. Un trimestre compte en moyenne 91 jours.$$,
      'questions', array[
        $$Calcule la quantité d'eau consommée par trimestre avec le robinet classique (15 L/min).$$,
        $$Calcule la quantité d'eau qui serait consommée par trimestre avec le nouveau robinet (6 L/min).$$,
        $$Détermine l'économie d'eau réalisée par trimestre en changeant de robinet.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un coureur parcourt 42 km en 3h. Calcule sa vitesse moyenne en km/h.$$,
      'hint', $$Vitesse = distance ÷ temps.$$,
      'expected', $$14 km/h.$$
    ),
    jsonb_build_object(
      'question', $$Un robinet remplit une barrique de 200 litres en 15 minutes. Calcule son débit moyen.$$,
      'hint', $$Débit = volume ÷ durée.$$,
      'expected', $$Environ 13,33 L/min.$$
    ),
    jsonb_build_object(
      'question', $$Une planche a une masse volumique de 0,85 g/cm³ et un volume de 4250 cm³. Calcule sa masse.$$,
      'hint', $$masse = masse volumique × volume.$$,
      'expected', $$3612,5 g.$$
    ),
    jsonb_build_object(
      'question', $$Un avion parcourt 1200 km à 800 km/h. Calcule la durée du vol.$$,
      'hint', $$Temps = distance ÷ vitesse.$$,
      'expected', $$1,5 h.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-proportionnalite';
