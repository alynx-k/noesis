-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2027: "MATHS_1C L6: ANGLES ORIENTES ET TRIGONOMETRIE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2027), resource id 17786.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-angles-orientes-trigonometrie',
  '1ere',
  'C',
  'mathematiques',
  $$Angles orientés et trigonométrie$$,
  6,
  '1ere-c-maths-limites-continuite',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève découvre des équations du type cos x = a, sin x = a, tan x = a, ou a cos x + b sin x + c = 0. Ces équations ne sont pas habituelles et nécessitent d'approfondir les connaissances sur les angles orientés et la trigonométrie pour être résolues.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Mesures d'un angle orienté$$,
        'body', $$Les mesures d'un angle orienté de mesure principale α sont les réels de la forme α + 2kπ (k∈ℤ). La mesure principale α est l'unique réel de ]−π ; π] correspondant à cet angle. Pour la retrouver à partir d'une mesure x connue, on cherche k tel que −π < x + 2kπ ≤ π. Pour deux angles orientés de mesures α et β, leur somme a pour mesure α+β, leur différence α−β.$$,
        'highlights', array[$$mesures de l'angle : α + 2kπ, k∈ℤ$$, $$mesure principale : unique valeur dans ]−π ; π]$$]::text[],
        'example', jsonb_build_object('statement', $$Détermine la mesure principale de l'angle dont une mesure est −119π/4.$$, 'solution', $$On cherche k tel que −π < −119π/4 + 2kπ ≤ π, ce qui donne k=15. On obtient α = −119π/4 + 30π = π/4.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont toutes les mesures d'un angle orienté de mesure principale π/3 ?$$, 'solution', $$Les réels de la forme π/3 + 2kπ, où k∈ℤ.$$)
      ),
      jsonb_build_object(
        'heading', $$Relation de Chasles et propriétés$$,
        'body', $$Pour tous vecteurs non nuls u, v, w : (u,v) + (v,w) = (u,w). Conséquences : (v,u) = −(u,v) ; si k>0, (ku,v) = (u,kv) = (u,v) ; si k<0, (ku,v) = (u,kv) = π̂ + (u,v) ; (ku,kv) = (u,v). Le double de (u,v) est 2(u,v) = (u,v)+(u,v), de mesure 2α. On a : 2α̂=0̂ ⟺ (α̂=0̂ ou α̂=π̂) ; 2α̂=2β̂ ⟺ (α̂=β̂ ou α̂=β̂+π̂).$$,
        'highlights', array[$$Chasles : (u,v)+(v,w) = (u,w)$$, $$k<0 : (ku,v) = π̂ + (u,v)$$, $$2α̂=0̂ ⟺ α̂=0̂ ou α̂=π̂$$]::text[],
        'example', jsonb_build_object('statement', $$A, B, C sont trois points distincts tels que 2(AB,AC) = 0̂. Démontre qu'ils sont alignés.$$, 'solution', $$2(AB,AC)=0̂ ⟺ (AB,AC)=0̂ ou (AB,AC)=π̂ ⟺ AB et AC colinéaires ⟺ A, B, C alignés.$$),
        'fixation', jsonb_build_object('question', $$Que vaut (v,u) en fonction de (u,v) ?$$, 'solution', $$(v,u) = −(u,v).$$)
      ),
      jsonb_build_object(
        'heading', $$Angles inscrits, cercle et points cocycliques$$,
        'body', $$Pour un cercle (𝒞) de centre O, A et B sur le cercle, et M un point du cercle : (MA,MB) = ½(OA,OB) + π̂ ou (MA,MB) = ½(OA,OB) selon la position de M (théorème de l'angle inscrit). Caractérisation d'un cercle : M∈(𝒞) ⟺ 2(MA,MB) = (OA,OB). Quatre points A,B,C,D sont cocycliques ⟺ 2(CA,CB) = 2(DA,DB).$$,
        'highlights', array[$$(MA,MB) = ½(OA,OB) [+π̂] : angle inscrit$$, $$M∈cercle ⟺ 2(MA,MB) = (OA,OB)$$, $$cocycliques ⟺ 2(CA,CB) = 2(DA,DB)$$]::text[],
        'fixation', jsonb_build_object('question', $$ABC est rectangle en C, D symétrique de C par rapport à (AB). Pourquoi A,B,C,D sont-ils cocycliques ?$$, 'solution', $$Les triangles ABC et ABD sont rectangles respectivement en C et D, donc 2(CA,CB)=π̂ et 2(DA,DB)=π̂ : les deux quantités sont égales, donc A,B,C,D sont cocycliques.$$)
      ),
      jsonb_build_object(
        'heading', $$Lignes trigonométriques et angles associés$$,
        'body', $$Le cosinus et le sinus d'un angle de mesure α sont l'abscisse et l'ordonnée du point image M(α) sur le cercle trigonométrique ; tan α = sin α / cos α (non définie si α = π/2 + kπ). Formules des angles associés : cos(−α)=cos α, sin(−α)=−sin α ; cos(π−α)=−cos α, sin(π−α)=sin α ; cos(π+α)=−cos α, sin(π+α)=−sin α ; cos(π/2−α)=sin α, sin(π/2−α)=cos α ; cos(π/2+α)=−sin α, sin(π/2+α)=cos α.$$,
        'highlights', array[$$cos α = abscisse de M(α) ; sin α = ordonnée ; tan α = sin α/cos α$$, $$formules d'angles associés (opposé, supplémentaire, complémentaire)$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule cos(5π/6) et sin(5π/6), sachant que 5π/6 = π − π/6.$$, 'solution', $$cos(5π/6) = cos(π−π/6) = −cos(π/6) = −√3/2. sin(5π/6) = sin(π−π/6) = sin(π/6) = 1/2.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la relation entre cos(π/2+α) et sin α ?$$, 'solution', $$cos(π/2+α) = −sin α.$$)
      ),
      jsonb_build_object(
        'heading', $$Formules d'addition, duplication, équations trigonométriques$$,
        'body', $$Formules d'addition : cos(a+b)=cos a cos b−sin a sin b ; sin(a+b)=sin a cos b+cos a sin b (et formules analogues pour a−b). Duplication : cos 2a = cos²a−sin²a = 2cos²a−1 = 1−2sin²a ; sin 2a = 2 sin a cos a. Équations : cos x = cos a ⟺ x=a+2kπ ou x=−a+2kπ ; sin x = sin a ⟺ x=a+2kπ ou x=π−a+2kπ ; tan x = tan a ⟺ x=a+kπ. Pour a cos x + b sin x + c = 0, on réduit a cos x + b sin x = √(a²+b²) cos(x−α) avec cos α = a/√(a²+b²), sin α = b/√(a²+b²).$$,
        'highlights', array[$$cos x=cos a ⟺ x=±a+2kπ ; sin x=sin a ⟺ x=a+2kπ ou π−a+2kπ$$, $$a cos x+b sin x = √(a²+b²) cos(x−α)$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans ℝ : cos x = 1/2.$$, 'solution', $$cos(π/3)=1/2, donc cos x = cos(π/3) ⟺ x=π/3+2kπ ou x=−π/3+2kπ, k∈ℤ.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la formule de duplication de sin 2a ?$$, 'solution', $$sin 2a = 2 sin a cos a.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un couloir de largeur √3 m tourne à angle droit vers un second tronçon de largeur 1 m. Une droite passant par le coin intérieur O fait un angle α avec un mur (0<α<π/2) et coupe les deux murs opposés en A et B, avec AB=4 m.$$,
      'questions', array[
        $$En utilisant les triangles rectangles formés, exprime OA et OB en fonction de α, sin α et cos α.$$,
        $$Établis l'équation (√3 cos α + sin α)/(sin α cos α) = 4, puis réduis √3 cos α + sin α sous la forme 2 cos(α − π/6).$$,
        $$Résous l'équation obtenue pour déterminer la ou les valeurs possibles de α dans ]0 ; π/2[.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la formule de la relation de Chasles pour les angles orientés ?$$,
      'hint', $$Elle relie trois vecteurs.$$,
      'expected', $$(u,v) + (v,w) = (u,w).$$
    ),
    jsonb_build_object(
      'question', $$Comment caractérise-t-on l'appartenance d'un point M à un cercle de centre O passant par A et B ?$$,
      'hint', $$C'est une égalité entre angles doublés.$$,
      'expected', $$M∈(𝒞) ⟺ 2(MA,MB) = (OA,OB).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule de duplication de cos 2a en fonction de cos²a seul ?$$,
      'hint', $$Une des trois formes équivalentes.$$,
      'expected', $$cos 2a = 2cos²a − 1.$$
    ),
    jsonb_build_object(
      'question', $$Résous dans ℝ : tan x = 1.$$,
      'hint', $$tan(π/4) = 1.$$,
      'expected', $$x = π/4 + kπ, k∈ℤ.$$
    )
  ),
  now()
);
