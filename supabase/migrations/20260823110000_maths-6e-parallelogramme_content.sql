-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 1936: "Leçon11: Parallelogramme"
-- (https://coll.ecole-ci.org/course/view.php?id=1936), resource id 15528.
-- Contenu réécrit à partir du PDF source (thème "Configurations du plan",
-- programme officiel MENA) ; situation d'apprentissage, définitions,
-- propriétés, formules et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$De passage chez un tisserand, un élève de 6ème observe les motifs des pagnes Kita que celui-ci confectionne et en ramène un morceau en classe. Émerveillés par l'harmonie des motifs, les élèves décident d'identifier la nature et les caractéristiques des quadrilatères qui s'y trouvent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Quadrilatère et parallélogramme : définitions$$,
        'body', $$Un quadrilatère est une figure formée de 4 segments (ses côtés) reliés en une ligne brisée fermée non croisée. Deux côtés ayant un point commun sont consécutifs ; deux côtés sans point commun sont opposés. Un parallélogramme est un quadrilatère dont les côtés opposés ont des supports parallèles.$$,
        'highlights', array[$$quadrilatère ABCD : côtés opposés [AB]/[DC], côtés consécutifs [AB]/[AD]$$, $$parallélogramme = quadrilatère à côtés opposés parallèles$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans un quadrilatère ABCD, quels sont les côtés opposés à [AB] ?$$, 'solution', $$Le côté [DC] (ou [CD]), car il n'a aucun point commun avec [AB].$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés : côtés et diagonales$$,
        'body', $$Si un quadrilatère est un parallélogramme, alors ses côtés opposés ont la même longueur ET ses diagonales se coupent en leur milieu. Réciproquement, si un quadrilatère a ses côtés opposés de même longueur, ou si ses diagonales se coupent en leur milieu, alors c'est un parallélogramme.$$,
        'highlights', array[$$parallélogramme ⟹ côtés opposés égaux + diagonales de même milieu$$, $$réciproques vraies : chacune des deux conditions suffit à elle seule pour prouver un parallélogramme$$]::text[],
        'example', jsonb_build_object('statement', $$ABCD est un parallélogramme avec AB=6 et AD=3. Quelle est la longueur DC ?$$, 'solution', $$DC = AB = 6, car dans un parallélogramme les côtés opposés ont la même longueur.$$),
        'fixation', jsonb_build_object('question', $$Dans un quadrilatère IJKL, les diagonales [IK] et [JL] ont le même milieu O. Que peut-on en conclure ?$$, 'solution', $$IJKL est un parallélogramme (réciproque : diagonales de même milieu ⟹ parallélogramme).$$)
      ),
      jsonb_build_object(
        'heading', $$Périmètre et aire d'un parallélogramme$$,
        'body', $$Pour un parallélogramme de côtés de longueurs a et b, le périmètre est 𝒫 = (a + b) × 2. Son aire, avec h la hauteur relative au côté de longueur b, est 𝒜 = b × h.$$,
        'highlights', array[$$𝒫 = (a + b) × 2$$, $$𝒜 = base × hauteur$$]::text[],
        'example', jsonb_build_object('statement', $$Un parallélogramme ABCD a AB=7 cm et une hauteur de 3 cm relative à [AB]. Calcule son aire.$$, 'solution', $$𝒜 = 7 × 3 = 21 cm².$$),
        'fixation', jsonb_build_object('question', $$Calcule le périmètre d'un parallélogramme dont les côtés mesurent 5 cm et 3 cm.$$, 'solution', $$𝒫 = (5 + 3) × 2 = 16 cm.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un club environnement veut planter du gazon sur une parcelle EBFC (un parallélogramme) avec BD=30 m (hauteur relative à [CF]), EB=CF=6 m et CE=BF=50 m. L'administration a donné 180 000 F ; le gazon coûte 1075 F/m².$$,
      'questions', array[
        $$Justifie que le quadrilatère EBFC est un parallélogramme (indice : compare EB à CF, et CE à BF).$$,
        $$Calcule l'aire du parallélogramme EBFC en utilisant BD comme hauteur relative à CF.$$,
        $$Calcule le coût total du gazon, et détermine si les 180 000 F suffisent.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un parallélogramme a une aire de 120 m² et un côté [ER] de 12 m. Calcule la hauteur relative à ce côté.$$,
      'hint', $$Utilise 𝒜 = base × hauteur, donc hauteur = aire ÷ base.$$,
      'expected', $$h = 120 ÷ 12 = 10 m.$$
    ),
    jsonb_build_object(
      'question', $$Le périmètre d'un parallélogramme est 316 m, et l'un de ses côtés mesure 90 m. Trouve l'autre côté.$$,
      'hint', $$𝒫 = 2(a+b), donc a+b = 𝒫/2.$$,
      'expected', $$316 = 2(a+90) ⟹ a+90 = 158 ⟹ a = 68 m.$$
    ),
    jsonb_build_object(
      'question', $$EFGH est un quadrilatère avec EF=GH et FG=EH. Est-ce un parallélogramme ?$$,
      'hint', $$Pense à la propriété réciproque sur les longueurs des côtés opposés.$$,
      'expected', $$Oui : un quadrilatère dont les côtés opposés sont de même longueur est un parallélogramme.$$
    ),
    jsonb_build_object(
      'question', $$Dans un parallélogramme MONT, le côté [MT] mesure 4,7 cm. Que vaut le côté opposé [ON] ?$$,
      'hint', $$Les côtés opposés d'un parallélogramme ont la même longueur.$$,
      'expected', $$[ON] mesure aussi 4,7 cm.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-parallelogramme';
