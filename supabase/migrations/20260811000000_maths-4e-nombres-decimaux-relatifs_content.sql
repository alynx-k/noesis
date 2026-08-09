-- Rewritten from the REAL ecole-ci.org PDF: "4e maths leçon 1 Nombres
-- décimaux relatifs" (Collège Numérique, Thème "Calculs algébriques",
-- Leçon 1, course id 1995, resource id 16236, downloaded from
-- coll.ecole-ci.org and read directly). The real lesson is actually about
-- puissances de 10 d'exposant relatif and notation scientifique (not simple
-- add/subtract/compare of signed decimals as the earlier fallback assumed).
-- Every sentence, example and exercise below is an original composition in
-- our own wording — no sentence is copied verbatim from the source PDF,
-- per the firm copyright rule. No diagram: purely numerical lesson.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans un magazine scientifique, une collégienne de 4ème repère plusieurs mesures impressionnantes : la distance Terre-Soleil vaut environ 150 000 000 km, alors que l'épaisseur d'un cheveu n'est que de 0,00005 m. Elle voudrait recopier ces nombres sans se tromper dans le compte des zéros, et se demande s'il n'existe pas une écriture plus compacte. Les puissances de 10 et la notation scientifique vont lui fournir cette écriture.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Puissances de 10 d'exposant relatif$$,
        'body', $$Pour un entier n strictement positif, 10 à la puissance n s'écrit 1 suivi de n zéros, tandis que 10 à la puissance moins n s'écrit 0, suivi de (n−1) zéros puis d'un 1. On retient aussi que 10 à la puissance 0 vaut 1, et que 10^(-n) est l'inverse de 10^n.$$,
        'highlights', array[$$puissance de 10$$, $$exposant relatif$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés des puissances de 10$$, 'text', $$Pour m et n entiers relatifs : 10^m × 10^n = 10^(m+n) ; (10^m)^n = 10^(m×n) ; 10^m ÷ 10^n = 10^(m−n).$$),
        'example', jsonb_build_object('statement', $$Calcule 10^5 × 10^2 puis (10^-3)^4.$$, 'solution', $$10^5 × 10^2 = 10^(5+2) = 10^7. (10^-3)^4 = 10^(-3×4) = 10^-12.$$),
        'fixation', jsonb_build_object('question', $$Calcule 10^-6 × 10^6 puis 10^8 ÷ 10^-3.$$, 'solution', $$10^-6 × 10^6 = 10^(-6+6) = 10^0 = 1. 10^8 ÷ 10^-3 = 10^(8−(−3)) = 10^11.$$)
      ),
      jsonb_build_object(
        'heading', $$Écriture a × 10^p et notation scientifique$$,
        'body', $$Tout nombre décimal peut s'écrire sous la forme a×10^p, où a est un décimal et p un entier relatif — et cette écriture n'est pas unique. Parmi toutes ces écritures, la notation scientifique est celle où a n'a qu'un seul chiffre non nul avant la virgule.$$,
        'highlights', array[$$notation scientifique$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$La notation scientifique d'un nombre décimal est son écriture sous la forme a×10^p, où a est un nombre décimal ayant un seul chiffre non nul avant la virgule et p un entier relatif.$$),
        'example', jsonb_build_object('statement', $$Donne la notation scientifique de 47 000 et de 0,0623.$$, 'solution', $$47 000 = 4,7×10^4. 0,0623 = 6,23×10^-2.$$),
        'fixation', jsonb_build_object('question', $$Donne la notation scientifique de 8 300 000 et de 0,00091.$$, 'solution', $$8 300 000 = 8,3×10^6. 0,00091 = 9,1×10^-4.$$)
      ),
      jsonb_build_object(
        'heading', $$Comparer des nombres écrits sous forme a × 10^p$$,
        'body', $$Pour comparer deux nombres positifs écrits avec une puissance de 10, on les met d'abord en notation scientifique. Si les exposants obtenus sont égaux, on compare les facteurs décimaux ; sinon, on compare directement les exposants. Pour deux nombres négatifs, on compare leurs opposés puis on inverse le résultat.$$,
        'highlights', array[$$comparaison$$, $$notation scientifique$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$A = a×10^m et B = b×10^n étant écrits en notation scientifique : si m=n, alors A et B sont rangés dans le même ordre que a et b ; si m≠n, alors A et B sont rangés dans le même ordre que m et n.$$),
        'example', jsonb_build_object('statement', $$Compare A = 52×10^-6 et B = 6,1×10^-5.$$, 'solution', $$A = 5,2×10^-5 en notation scientifique. Les deux exposants valent -5, donc on compare 5,2 et 6,1 : 5,2 < 6,1, donc A < B.$$),
        'fixation', jsonb_build_object('question', $$Compare A = 3,4×10^-8 et B = 27×10^-9.$$, 'solution', $$B = 2,7×10^-9 en notation scientifique. Comme -8 > -9, on a A > B.$$)
      ),
      jsonb_build_object(
        'heading', $$Nombre décimal d'ordre n$$,
        'body', $$Un nombre décimal d'ordre n est un nombre qui peut s'écrire sous la forme d×10^(-n), où d est un entier relatif et n un entier naturel. Concrètement, un nombre écrit avec exactement n chiffres après la virgule est d'ordre n — et il est aussi d'ordre n+1, n+2, et ainsi de suite.$$,
        'highlights', array[$$nombre décimal d'ordre n$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$n étant un entier naturel, un nombre décimal d'ordre n s'écrit d×10^(-n) avec d entier relatif. Un nombre décimal d'ordre n est aussi un nombre décimal d'ordre supérieur à n.$$),
        'example', jsonb_build_object('statement', $$Donne l'ordre du nombre décimal 0,00048.$$, 'solution', $$0,00048 = 48×10^-5, donc 0,00048 est un nombre décimal d'ordre 5.$$),
        'fixation', jsonb_build_object('question', $$Donne l'ordre du nombre décimal 3,207.$$, 'solution', $$3,207 = 3207×10^-3, donc 3,207 est un nombre décimal d'ordre 3.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un laboratoire scolaire d'Abidjan, une enseignante de SVT explique à sa classe que des micro-organismes rectangulaires et identiques, de longueur 20 micromètres et de largeur 5 micromètres, recouvrent entièrement une lame de verre dont l'aire est de 0,00005 m². On rappelle que 1 micromètre = 10^-6 m.$$,
      'questions', array[
        $$Écris en notation scientifique l'aire, en m², de la lame de verre.$$,
        $$Calcule, en notation scientifique, la surface occupée par un seul micro-organisme (exprimée en m²).$$,
        $$Déduis-en, en notation scientifique, le nombre de micro-organismes nécessaires pour recouvrir entièrement la lame.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris chacun des nombres suivants sous forme de puissance de 10 : 100 000 ; 0,0001 ; 1 000 000 000.$$,
      'hint', $$Compte le nombre de zéros pour trouver l'exposant, en te souvenant que les nombres plus petits que 1 ont un exposant négatif.$$,
      'expected', $$100 000 = 10^5 ; 0,0001 = 10^-4 ; 1 000 000 000 = 10^9.$$
    ),
    jsonb_build_object(
      'question', $$Calcule (4×10^5) × (2×10^-8) et donne le résultat sous la forme a×10^p.$$,
      'hint', $$Multiplie les facteurs décimaux entre eux, puis additionne les exposants des puissances de 10.$$,
      'expected', $$(4×10^5)×(2×10^-8) = (4×2)×10^(5+(-8)) = 8×10^-3.$$
    ),
    jsonb_build_object(
      'question', $$Compare A = 6,4×10^12 et B = 640×10^9 après avoir mis B en notation scientifique.$$,
      'hint', $$Mets d'abord B sous la forme a×10^p avec un seul chiffre non nul avant la virgule.$$,
      'expected', $$B = 6,4×10^11. Comme 12 > 11, on a A > B.$$
    ),
    jsonb_build_object(
      'question', $$Donne l'ordre du nombre décimal −0,000072, puis écris sa notation scientifique.$$,
      'hint', $$Compte le nombre de chiffres après la virgule pour trouver l'ordre ; pour la notation scientifique, garde un seul chiffre non nul avant la virgule.$$,
      'expected', $$−0,000072 = −72×10^-6, donc ce nombre est d'ordre 6. Sa notation scientifique est −7,2×10^-5.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-nombres-decimaux-relatifs';
