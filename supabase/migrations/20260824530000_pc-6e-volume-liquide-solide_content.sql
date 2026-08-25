-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 12 : Volume d'un liquide et d'un solide" (id 2084).
-- Contenu réécrit à partir du PDF source ; situation d'apprentissage,
-- définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève de 6ème, en allant acheter de l'huile à la boutique, observe un appareil servant à mesurer des volumes d'huile monté sur un fût. Avec ses camarades, elle sollicite son professeur pour définir le volume d'un corps, la capacité d'un récipient, et apprendre à mesurer des volumes de liquides et de solides.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Volume d'un corps et capacité d'un récipient$$,
        'body', $$Le volume d'un corps est l'espace occupé par ce corps (noté V). Son unité légale est le mètre cube (m³), avec 1 m³ = 1000 dm³. La capacité (ou contenance) d'un récipient est le volume de liquide qu'il peut contenir. Son unité légale est le litre (L), avec 1L = 10 dL et 1 kL = 1000 L. Il existe une correspondance entre volume et capacité : 1 dm³ = 1 L, et 1 cm³ = 1 mL.$$,
        'highlights', array[$$volume = espace occupé par un corps, unité légale : m³$$, $$capacité d'un récipient = volume qu'il peut contenir, unité légale : L$$, $$1 dm³ = 1 L ; 1 cm³ = 1 mL$$]::text[],
        'fixation', jsonb_build_object('question', $$À combien de litres correspond 1 dm³ ?$$, 'solution', $$1 dm³ = 1 L.$$)
      ),
      jsonb_build_object(
        'heading', $$Mesurer le volume d'un liquide et d'un solide de forme quelconque$$,
        'body', $$Pour mesurer le volume d'un liquide, on utilise un récipient gradué (éprouvette, bécher...) : il faut connaître la valeur d'une graduation, placer l'œil au niveau de la surface libre du liquide (à la base du ménisque si la surface est courbe), puis lire le volume. Pour un solide de forme quelconque, on utilise la méthode du déplacement de liquide : on plonge le solide dans un liquide contenu dans un récipient gradué, et son volume est égal à la différence entre le nouveau niveau (V2) et le niveau initial (V1) : V = V2 - V1.$$,
        'highlights', array[$$liquide : lecture sur récipient gradué, œil au niveau de la surface (base du ménisque)$$, $$solide de forme quelconque : V = V2 - V1 (déplacement de liquide)$$]::text[],
        'example', jsonb_build_object('statement', $$Un solide est plongé dans une éprouvette : le niveau passe de 300 cm³ à 450 cm³. Quel est son volume ?$$, 'solution', $$V = 450 - 300 = 150 cm³.$$),
        'fixation', jsonb_build_object('question', $$Où doit-on placer son œil pour bien lire le niveau d'un liquide dont la surface forme une courbe (ménisque) ?$$, 'solution', $$Au niveau de la surface libre du liquide, à la base du ménisque.$$)
      ),
      jsonb_build_object(
        'heading', $$Mesurer le volume d'un solide de forme géométrique simple$$,
        'body', $$Pour un solide de forme géométrique régulière, on mesure ses dimensions (longueur, largeur, hauteur...) et on applique la formule mathématique correspondante : cube V = a×a×a ; pavé droit V = L×l×h ; cylindre V = π×r×r×h ; sphère V = 4/3×π×r×r×r.$$,
        'highlights', array[$$cube : V = a³ ; pavé : V = L×l×h ; cylindre : V = π×r²×h ; sphère : V = 4/3×π×r³$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule le volume d'un pavé droit de dimensions L=10cm, l=5cm, h=3cm.$$, 'solution', $$V = 10 × 5 × 3 = 150 cm³.$$),
        'fixation', jsonb_build_object('question', $$Quelle formule utilise-t-on pour calculer le volume d'un cube d'arête a ?$$, 'solution', $$V = a × a × a (= a³).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le chef d'un village dispose d'une citerne de 15 m³. Il distribue l'eau avec un bidon de dimensions h=60cm, L=25cm, l=20cm, et veut connaître le nombre de bidons que la citerne peut remplir.$$,
      'questions', array[
        $$Donne les unités légales du volume et de la capacité.$$,
        $$Détermine le volume d'eau contenu dans un bidon (en cm³ puis en m³).$$,
        $$Détermine le nombre de bidons qui peuvent être servis avec la citerne.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est l'unité légale de volume ?$$,
      'hint', $$Ce n'est pas le litre.$$,
      'expected', $$Le mètre cube (m³).$$
    ),
    jsonb_build_object(
      'question', $$Une vendeuse utilise 10 fois un récipient pour remplir une bouteille de 20 cL. Quelle est la contenance du récipient ?$$,
      'hint', $$Divise 20 cL par 10.$$,
      'expected', $$2 cL.$$
    ),
    jsonb_build_object(
      'question', $$Comment mesure-t-on le volume d'un solide de forme quelconque, comme une pierre ?$$,
      'hint', $$On ne peut pas utiliser de formule mathématique simple.$$,
      'expected', $$Par la méthode du déplacement de liquide (V = V2 - V1).$$
    ),
    jsonb_build_object(
      'question', $$Calcule le volume d'un cube d'arête 4 cm.$$,
      'hint', $$Utilise la formule V = a³.$$,
      'expected', $$V = 4 × 4 × 4 = 64 cm³.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-volume-liquide-solide';
