-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2101: "Leçon5: Cercles et disques"
-- (https://coll.ecole-ci.org/course/view.php?id=2101), resource id 17497.
-- Contenu réécrit à partir du PDF source (thème "Géométrie du plan",
-- programme officiel MENA) ; situation d'apprentissage, définitions,
-- formules et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour la fête de Tabaski, M. Abou attache son mouton dans sa cour avec une corde de 4 m fixée à un piquet. Son fils Issa, en 6ème, a planté une fleur à 5 m du piquet et s'inquiète que le mouton la broute. Ses camarades l'aident à dessiner la surface d'herbe accessible au mouton, en prenant 1 cm pour 1 m et en représentant le piquet par un point O.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Cercle : définition, notation et vocabulaire$$,
        'body', $$Un cercle est l'ensemble des points situés à une même distance d'un point donné, appelé centre ; cette distance est le rayon. Le cercle de centre O et de rayon r se note C(O ; r). Le segment [OM] (M sur le cercle) est un rayon ; [AB], qui passe par le centre, est un diamètre (sa longueur est le diamètre) ; une corde comme [EF] relie deux points du cercle sans nécessairement passer par le centre.$$,
        'highlights', array[$$C(O ; r) : cercle de centre O, de rayon r$$, $$rayon relie le centre à un point du cercle ; diamètre passe par le centre ; corde relie deux points quelconques$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle différence entre un diamètre et une corde d'un cercle ?$$, 'solution', $$Le diamètre est une corde particulière qui passe par le centre du cercle ; une corde quelconque ne passe pas nécessairement par le centre.$$)
      ),
      jsonb_build_object(
        'heading', $$Disque et appartenance au cercle$$,
        'body', $$Le disque de centre O et de rayon r, noté D(O ; r), est la surface délimitée par le cercle C(O ; r), y compris le point O. Propriété d'appartenance : si M ∈ C(O ; r) alors OM = r ; réciproquement, si OM = r alors M ∈ C(O ; r).$$,
        'highlights', array[$$disque = surface délimitée par le cercle (le cercle est son contour)$$, $$M ∈ C(O ; r) ⟺ OM = r$$]::text[],
        'example', jsonb_build_object('statement', $$Si OP = 5, que peut-on dire du point P ?$$, 'solution', $$P ∈ C(O ; 5), car OP est égal au rayon 5.$$),
        'fixation', jsonb_build_object('question', $$F ∈ C(O ; 3). Que vaut OF ?$$, 'solution', $$OF = 3 (le rayon du cercle).$$)
      ),
      jsonb_build_object(
        'heading', $$Périmètre d'un cercle et aire d'un disque$$,
        'body', $$Le périmètre d'un cercle de rayon r (ou de diamètre d) est P = 2 × π × r, ou P = π × d. L'aire d'un disque de rayon r est A = r × r × π.$$,
        'highlights', array[$$P = 2 × π × r = π × d$$, $$A = r × r × π$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Grandeur', 'Formule']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Périmètre (rayon r)$$, $$P = 2 × π × r$$),
            jsonb_build_array($$Périmètre (diamètre d)$$, $$P = π × d$$),
            jsonb_build_array($$Aire du disque$$, $$A = r × r × π$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Calcule le périmètre puis l'aire d'un cercle/disque de rayon 5 cm (π ≈ 3,14).$$, 'solution', $$Périmètre : P = 2 × 3,14 × 5 = 31,4 cm. Aire : A = 5 × 5 × 3,14 = 78,5 cm².$$),
        'fixation', jsonb_build_object('question', $$Un cercle a un diamètre de 1 m. Quel est son périmètre (π ≈ 3,14) ?$$, 'solution', $$P = π × d = 3,14 × 1 = 3,14 m.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une association dispose d'une ferme circulaire de rayon 5 mètres, qu'elle veut clôturer avec un grillage de 30 mètres. Une entrée de 1,5 mètre de largeur est prévue (π ≈ 3,1).$$,
      'questions', array[
        $$Détermine le périmètre P de la ferme.$$,
        $$Calcule la longueur l de clôture réellement nécessaire (périmètre moins la largeur de l'entrée).$$,
        $$L'association a-t-elle raison de s'inquiéter avec ses 30 mètres de grillage ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Que représente le point O dans la notation C(O ; r) ?$$,
      'hint', $$C'est le point à partir duquel on mesure le rayon.$$,
      'expected', $$Le centre du cercle.$$
    ),
    jsonb_build_object(
      'question', $$IM = 5. Traduis cette égalité par une appartenance à un cercle.$$,
      'hint', $$Utilise la propriété d'appartenance vue dans le cours.$$,
      'expected', $$M ∈ C(I, 5).$$
    ),
    jsonb_build_object(
      'question', $$Calcule l'aire d'un disque de rayon 4 cm en fonction de π, puis sa valeur approchée pour π ≈ 3,14.$$,
      'hint', $$Utilise la formule A = r × r × π.$$,
      'expected', $$A = 4×4×π = 16π cm² ; soit environ 16 × 3,14 = 50,24 cm².$$
    ),
    jsonb_build_object(
      'question', $$La grande aiguille d'une horloge mesure 15 cm. Quel est le périmètre du cercle qu'elle balaie (π ≈ 3,14) ?$$,
      'hint', $$La longueur de l'aiguille est le rayon du cercle balayé.$$,
      'expected', $$P = 2 × 3,14 × 15 = 94,2 cm.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-cercles-disques';
