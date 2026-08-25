-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Géométrie du plan).
-- Cours : "Leçon 10 : Parallélogrammes particuliers". Contenu réécrit à
-- partir du PDF source ; situation d'apprentissage, définitions et
-- exercices reformulés, valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 5ème veulent décorer leur classe avec un logo découpé sur une nappe, constitué de parallélogrammes particuliers. Avant de le reproduire, ils étudient les propriétés de ces parallélogrammes particuliers : rectangle, losange et carré.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Propriétés générales du parallélogramme$$,
        'body', $$Dans un parallélogramme ABCD, les angles opposés ont la même mesure (mes A = mes C, mes B = mes D), et deux angles consécutifs sont supplémentaires (leur somme fait 180°, ex : mes A + mes B = 180°).$$,
        'highlights', array[$$angles opposés égaux ; angles consécutifs supplémentaires (somme = 180°)$$]::text[],
        'example', jsonb_build_object('statement', $$EFGH est un parallélogramme avec mes E = 60°. Trouve mes F, mes G et mes H.$$, 'solution', $$mes F = 180-60 = 120° (consécutif) ; mes G = 60° (opposé à E) ; mes H = 120° (opposé à F).$$),
        'fixation', jsonb_build_object('question', $$Dans un parallélogramme, si un angle mesure 70°, que vaut l'angle consécutif ?$$, 'solution', $$110° (180° - 70°, car deux angles consécutifs sont supplémentaires).$$)
      ),
      jsonb_build_object(
        'heading', $$Le rectangle et le losange$$,
        'body', $$Un rectangle est un quadrilatère à quatre angles droits ; c'est un parallélogramme particulier dont les diagonales ont la même longueur. On reconnaît un rectangle si : un parallélogramme a des diagonales de même longueur, ou un parallélogramme a un angle droit, ou un quadrilatère a trois angles droits. Un losange est un quadrilatère dont les quatre côtés ont la même longueur ; ses diagonales sont perpendiculaires. On reconnaît un losange si : un quadrilatère a ses 4 côtés égaux, ou un parallélogramme a des diagonales perpendiculaires, ou un parallélogramme a deux côtés consécutifs égaux.$$,
        'highlights', array[$$rectangle : 4 angles droits, diagonales égales$$, $$losange : 4 côtés égaux, diagonales perpendiculaires$$, $$reconnaître rectangle : diagonales égales, OU un angle droit, OU 3 angles droits (dans un parallélogramme/quadrilatère)$$, $$reconnaître losange : 4 côtés égaux, OU diagonales perpendiculaires, OU 2 côtés consécutifs égaux (dans un parallélogramme)$$]::text[],
        'example', jsonb_build_object('statement', $$Un parallélogramme SEKA a ses diagonales [SK] et [EA] de même longueur. Que peut-on en conclure ?$$, 'solution', $$SEKA est un rectangle.$$),
        'fixation', jsonb_build_object('question', $$TANO est un parallélogramme dont les diagonales sont perpendiculaires. Quelle est sa nature ?$$, 'solution', $$C'est un losange.$$)
      ),
      jsonb_build_object(
        'heading', $$Le carré, et périmètre/aire du losange$$,
        'body', $$Un carré est un quadrilatère à la fois rectangle et losange : quatre angles droits et quatre côtés égaux ; ses diagonales sont donc égales ET perpendiculaires. Pour un losange de côté c, le périmètre est P = 4×c. Pour un losange dont les diagonales mesurent a et b, l'aire est A = (a×b)/2.$$,
        'highlights', array[$$carré = rectangle ET losange (diagonales égales + perpendiculaires)$$, $$périmètre losange : P = 4×c$$, $$aire losange : A = (a×b)/2 (a, b = diagonales)$$]::text[],
        'example', jsonb_build_object('statement', $$Un losange a des diagonales de 60cm et 80cm. Calcule son aire.$$, 'solution', $$A = (60×80)/2 = 2400 cm².$$),
        'fixation', jsonb_build_object('question', $$Un losange RSTU a pour côté SR=6cm. Calcule son périmètre.$$, 'solution', $$P = 4×6 = 24 cm.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des élèves veulent planter du gazon sur une portion en forme de losange (côtés égaux) de diagonales 8m et 10m, avec en son centre un disque de rayon 1m laissé en blanc (non gazonné). (On prend π = 3.)$$,
      'questions', array[
        $$Justifie que la portion est bien un losange.$$,
        $$Calcule l'aire du disque laissé en blanc.$$,
        $$Calcule l'aire du losange, puis l'aire de la surface réellement gazonnée (hachurée).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$MNPQ est un parallélogramme avec mes P = 60°. Que vaut mes M (l'angle opposé) ?$$,
      'hint', $$Les angles opposés d'un parallélogramme sont égaux.$$,
      'expected', $$60°.$$
    ),
    jsonb_build_object(
      'question', $$Un quadrilatère a ses quatre côtés de même longueur. Quelle est sa nature ?$$,
      'hint', $$C'est la définition d'une figure particulière.$$,
      'expected', $$Un losange.$$
    ),
    jsonb_build_object(
      'question', $$Un rectangle a deux côtés consécutifs de même longueur. Quelle est sa nature précise ?$$,
      'hint', $$Un rectangle qui a aussi cette propriété du losange devient...$$,
      'expected', $$Un carré.$$
    ),
    jsonb_build_object(
      'question', $$Un losange PERS a pour diagonales PR=8cm et ES=6cm. Calcule son aire.$$,
      'hint', $$Aire = (diagonale1 × diagonale2)/2.$$,
      'expected', $$(8×6)/2 = 24 cm².$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-parallelogrammes-particuliers';
