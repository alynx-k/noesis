-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 1934: "Leçon13: Pavé droit et cylindre droit"
-- (https://coll.ecole-ci.org/course/view.php?id=1934), resource id 15504.
-- Contenu réécrit à partir du PDF source (thème "Configurations de
-- l'espace", programme officiel MENA) ; situation d'apprentissage,
-- définitions, formules et exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La SODECI annonce une coupure d'eau de deux jours au Lycée Moderne de Bondoukou. L'éducatrice demande aux élèves de 6ème de remplir la citerne (en forme de pavé droit) avec des seaux identiques (en forme de cylindre). Pour organiser leur travail, les élèves veulent identifier ces solides et calculer leurs volumes afin de déterminer le nombre de seaux nécessaires.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le pavé droit et le cube$$,
        'body', $$Un pavé droit a 2 bases rectangulaires, 4 faces latérales rectangulaires (les bases et faces latérales forment ses 6 faces), 8 sommets et 12 arêtes (dont 4 hauteurs). Un cube est un pavé droit particulier dont toutes les arêtes ont la même longueur a ; ses 6 faces sont alors des carrés identiques.$$,
        'highlights', array[$$pavé droit : 6 faces, 8 sommets, 12 arêtes (4 hauteurs)$$, $$cube = pavé droit à arêtes toutes égales$$]::text[],
        'fixation', jsonb_build_object('question', $$Combien de sommets et d'arêtes possède un pavé droit ?$$, 'solution', $$8 sommets et 12 arêtes.$$)
      ),
      jsonb_build_object(
        'heading', $$Aires et volume du pavé droit et du cube$$,
        'body', $$Pour un pavé droit de dimensions a, b, c : aire latérale 𝒜L = 2×a×c + 2×b×c ; aire totale 𝒜T = 𝒜L + 2×a×b ; volume V = a×b×c. Pour un cube d'arête a : 𝒜L = 4×a×a ; 𝒜T = 6×a×a ; V = a×a×a.$$,
        'highlights', array[$$pavé droit : V = a × b × c$$, $$cube : V = a × a × a (= a³)$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule le volume d'un pavé droit de dimensions 3,5 cm, 4 cm et 7 cm.$$, 'solution', $$V = 3,5 × 4 × 7 = 98 cm³.$$),
        'fixation', jsonb_build_object('question', $$Calcule le volume d'un cube d'arête 2,5 cm.$$, 'solution', $$V = 2,5 × 2,5 × 2,5 = 15,625 cm³.$$)
      ),
      jsonb_build_object(
        'heading', $$Le cylindre droit : aire et volume$$,
        'body', $$Un cylindre droit a deux bases (disques parallèles et superposables) et une surface latérale ; sa hauteur est la distance entre les centres des deux bases. Pour un rayon r et une hauteur h : aire d'une base 𝒜B = π×r×r ; aire latérale 𝒜L = 2×π×r×h (périmètre de la base × hauteur) ; aire totale 𝒜T = 2×𝒜B + 𝒜L ; volume V = π×r×r×h (aire de la base × hauteur).$$,
        'highlights', array[$$𝒜L cylindre = périmètre de la base × hauteur = 2πrh$$, $$V cylindre = aire de la base × hauteur = πr²h$$]::text[],
        'example', jsonb_build_object('statement', $$Un cylindre a un rayon de 2,1 cm et une hauteur de 4,2 cm (π ≈ 3). Calcule son volume.$$, 'solution', $$V = π × 2,1 × 2,1 × 4,2 ≈ 3 × 2,1 × 2,1 × 4,2 = 55,566 cm³.$$),
        'fixation', jsonb_build_object('question', $$Quelle formule donne l'aire latérale d'un cylindre droit ?$$, 'solution', $$𝒜L = 2 × π × r × h (le périmètre du cercle de base multiplié par la hauteur).$$)
      ),
      jsonb_build_object(
        'heading', $$Patrons des solides$$,
        'body', $$Un patron d'un solide est une figure plane qui permet de fabriquer ce solide par pliage. Le patron d'un cylindre droit est composé d'un rectangle (la surface latérale, de largeur égale au périmètre du cercle de base 2×π×r, et de hauteur h) et de deux disques de rayon r attachés à ses côtés courts. Après pliage, les côtés formant une même arête ont la même longueur.$$,
        'highlights', array[$$patron = figure plane → solide par pliage$$, $$patron du cylindre : un rectangle (largeur = 2πr) + 2 disques de rayon r$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans le patron d'un cylindre, quelle est la largeur du rectangle qui forme la surface latérale ?$$, 'solution', $$Elle est égale au périmètre du disque de base, soit 2 × π × r.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un vendeur a reçu 160 livres identiques en forme de pavé droit (15 cm × 24 cm × 3 cm) et dispose de 7 cartons de 27 dm³ chacun pour les transporter.$$,
      'questions', array[
        $$Calcule le volume d'un livre, puis le volume total des 160 livres (en cm³).$$,
        $$Calcule le volume total des 7 cartons (en dm³), puis convertis le volume des livres en dm³ pour comparer.$$,
        $$Le vendeur a-t-il assez de cartons pour ranger tous les livres ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un immeuble en forme de pavé droit mesure 55 m, 30 m et 12 m de haut. Calcule l'aire de ses 4 faces verticales (aire latérale).$$,
      'hint', $$Utilise 𝒜L = 2×a×c + 2×b×c avec c la hauteur (12 m).$$,
      'expected', $$𝒜L = 2×55×12 + 2×30×12 = 1320 + 720 = 2040 m² (en prenant 55 et 30 comme les deux dimensions de la base).$$
    ),
    jsonb_build_object(
      'question', $$Une boîte cylindrique a un rayon de 4 cm et une hauteur de 12 cm (π ≈ 3). Calcule son volume.$$,
      'hint', $$V = π × r × r × h.$$,
      'expected', $$V = 3 × 4 × 4 × 12 = 576 cm³.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un patron d'un solide ?$$,
      'hint', $$Cela concerne la fabrication du solide.$$,
      'expected', $$Une figure plane qui permet de fabriquer le solide par pliage.$$
    ),
    jsonb_build_object(
      'question', $$Un cube a une arête de 3 cm. Calcule son aire totale.$$,
      'hint', $$𝒜T = 6 × a × a.$$,
      'expected', $$𝒜T = 6 × 3 × 3 = 54 cm².$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-paves-cylindres';
