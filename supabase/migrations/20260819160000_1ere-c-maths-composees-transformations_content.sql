-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2029: "MATHS_1C L8: COMPOSEES DE TRANSFORMATIONS"
-- (https://lyc.ecole-ci.org/course/view.php?id=2029), resource id 17810.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-composees-transformations',
  '1ere',
  'C',
  'mathematiques',
  $$Composées de transformations$$,
  8,
  '1ere-c-maths-extension-notion-limite',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur une figure, (D) et (D') sont deux droites sécantes en O. Il existe une homothétie hA de centre A qui transforme O en B, et une homothétie hO de centre O qui transforme F en E, avec les points A, O, B, E, F tels que AB/AO ≠ OF/OE. Des élèves veulent donner un programme de construction du centre de l'homothétie hA∘hO, et décident pour cela d'étudier les composées de transformations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Composée de deux translations$$,
        'body', $$Une application f du plan est une translation si et seulement si, pour tous points M, N d'images M', N', MN⃗ = M'N'⃗ (conservation des vecteurs). La composée t_u⃗ ∘ t_v⃗ des translations de vecteurs u⃗ et v⃗ est la translation de vecteur u⃗+v⃗ : t_u⃗∘t_v⃗ = t_(u⃗+v⃗) = t_v⃗∘t_u⃗ (commutative). Toute translation est une bijection du plan ; la réciproque de t_u⃗ est t_(−u⃗). Expression analytique : pour u⃗(a;b), t_u⃗(M)=M' ⟺ x'=x+a et y'=y+b.$$,
        'highlights', array[$$t_u⃗∘t_v⃗ = t_(u⃗+v⃗) : composée = translation de la somme des vecteurs$$, $$expression analytique : x'=x+a, y'=y+b$$]::text[],
        'example', jsonb_build_object('statement', $$Le plan est muni d'un repère orthonormé. Soit u⃗(−5;2) et v⃗(2;1). Détermine la composée t_u⃗∘t_v⃗.$$, 'solution', $$t_u⃗∘t_v⃗ est la translation de vecteur u⃗+v⃗(−3;3).$$),
        'fixation', jsonb_build_object('question', $$Soit A(−1;4) et u⃗(2;3). Détermine les coordonnées de A', image de A par la translation de vecteur u⃗.$$, 'solution', $$x'=−1+2=1 et y'=4+3=7, donc A'(1;7).$$)
      ),
      jsonb_build_object(
        'heading', $$Composée de deux rotations$$,
        'body', $$Deux rotations r(O,α) et r'(O,θ) de même centre O : leur composée r(O,α)∘r'(O,θ) est la rotation R(O,α+θ), et r∘r'=r'∘r. La réciproque de r(O,α) est r(O,−α). Pour deux rotations r(A,α) et r'(B,θ) de centres distincts : si α̂+θ̂=0̂, la composée est une translation (de vecteur BB'⃗, où B'=r(A,α)(B)) ; si α̂+θ̂≠0̂, la composée est une rotation d'angle α+θ (dont le centre s'obtient par intersection de médiatrices ou de droites, selon la méthode). En général, cette composée n'est pas commutative. Toute rotation d'angle π est une symétrie centrale.$$,
        'highlights', array[$$même centre : r(O,α)∘r'(O,θ) = R(O,α+θ)$$, $$centres distincts, α̂+θ̂=0̂ ⟹ translation ; sinon ⟹ rotation d'angle α+θ$$]::text[],
        'example', jsonb_build_object('statement', $$ABCD est un carré de sens direct. rA=r(A,π/2), rB=r(B,−π/2). Détermine la nature de rB∘rA.$$, 'solution', $$(π/2)̂+(−π/2)̂=0̂ donc rB∘rA est une translation. rA(A)=A et rB(A)=C, donc rB∘rA(A)=C : rB∘rA = t_AC⃗.$$),
        'fixation', jsonb_build_object('question', $$r est la rotation de centre I et d'angle π/2, r' celle de centre I et d'angle −π/4. Détermine r∘r'.$$, 'solution', $$r∘r' est la rotation de centre I et d'angle π/2+(−π/4) = π/4.$$)
      ),
      jsonb_build_object(
        'heading', $$Composée de deux homothéties$$,
        'body', $$Deux homothéties h et h' de même centre O, de rapports k et k' : leur composée h∘h' est l'homothétie de centre O et de rapport kk' (et h∘h'=h'∘h). Pour deux homothéties h(A,k) et h'(B,k') de centres distincts : si kk'=1, la composée est une translation (de vecteur MM'⃗, image d'un point quelconque M) ; si kk'≠1, la composée est une homothétie de rapport kk' (dont le centre O est l'intersection de (AB) et (EE'), E' étant l'image d'un point E hors de (AB)). En général, h(A,k)∘h(B,k') ≠ h(B,k')∘h(A,k).$$,
        'highlights', array[$$même centre : h∘h' = homothétie de centre O, rapport kk'$$, $$centres distincts, kk'=1 ⟹ translation ; kk'≠1 ⟹ homothétie de rapport kk'$$]::text[],
        'example', jsonb_build_object('statement', $$ABC est un triangle. h et h' sont les homothéties de centres B et C, de rapports 2 et 3/5. Détermine la nature de h∘h'.$$, 'solution', $$2×3/5 = 6/5 ≠ 1, donc h∘h' est une homothétie de rapport 6/5.$$),
        'fixation', jsonb_build_object('question', $$I est un point du plan. Détermine la composée h(I,1/2)∘h(I,−2/3).$$, 'solution', $$h(I,1/2)∘h(I,−2/3) est l'homothétie de centre I et de rapport (1/2)×(−2/3) = −1/3.$$)
      ),
      jsonb_build_object(
        'heading', $$Composée de deux symétries orthogonales$$,
        'body', $$Pour (D) et (D') parallèles : la composée S(D')∘S(D) est la translation de vecteur 2OO'⃗, où O∈(D) et O' est le projeté orthogonal de O sur (D'). Pour (D) et (D') sécantes en O, de vecteurs directeurs u⃗ et v⃗ : la composée S(D')∘S(D) est la rotation de centre O et d'angle 2(u⃗,v⃗)̂. Cas particulier : si (D)⊥(D') en O, la composée est la symétrie centrale de centre O, et S(D')∘S(D) = S(D)∘S(D') = S_O.$$,
        'highlights', array[$$axes parallèles ⟹ translation de vecteur 2OO'⃗$$, $$axes sécants en O ⟹ rotation de centre O et d'angle 2(u⃗,v⃗)̂ ; perpendiculaires ⟹ symétrie centrale$$]::text[],
        'example', jsonb_build_object('statement', $$ABCD est un rectangle. Détermine la nature de S(AB)∘S(CD).$$, 'solution', $$(AB) et (CD) sont parallèles, donc S(AB)∘S(CD) est la translation de vecteur 2CB⃗.$$),
        'fixation', jsonb_build_object('question', $$ABC est équilatéral de sens direct. (AA') et (AB) sont sécantes en A. Quelle est la nature de s(AA')∘s(AB) ?$$, 'solution', $$C'est une rotation de centre A, d'angle 2(AB⃗,AA'⃗)̂.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$(D) et (D') sont deux droites sécantes en O. Il existe une homothétie hA de centre A qui transforme O en B, et une homothétie hO de centre O qui transforme F en E, avec AB/AO ≠ OF/OE. On veut construire le centre Ω de la composée h = hA∘hO.$$,
      'questions', array[
        $$Justifie que h(O) = B, puis explique pourquoi le point Ω appartient à la droite (OB).$$,
        $$Sachant que F' = hA∘hO(F) = hA(E), justifie que F' appartient à la droite (AE) et à la droite (Δ) parallèle à (OF) passant par B.$$,
        $$Décris le programme de construction complet du point Ω, à partir des droites (Δ), (AE) et (FF').$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la nature de la composée t_u⃗∘t_v⃗ de deux translations ?$$,
      'hint', $$Elle se calcule avec la somme des deux vecteurs.$$,
      'expected', $$C'est la translation de vecteur u⃗+v⃗.$$
    ),
    jsonb_build_object(
      'question', $$Deux rotations de centres distincts A et B, d'angles α et θ, vérifient α̂+θ̂=0̂. Quelle est la nature de leur composée ?$$,
      'hint', $$C'est le cas particulier où la somme des angles est nulle.$$,
      'expected', $$C'est une translation.$$
    ),
    jsonb_build_object(
      'question', $$h(A,k) et h(B,k') sont deux homothéties de centres distincts telles que kk'≠1. Quelle est la nature de h(A,k)∘h(B,k') ?$$,
      'hint', $$C'est le cas général, différent du cas kk'=1.$$,
      'expected', $$C'est une homothétie de rapport kk'.$$
    ),
    jsonb_build_object(
      'question', $$(D) et (D') sont deux droites perpendiculaires en O. Quelle est la nature de S(D')∘S(D) ?$$,
      'hint', $$C'est un cas particulier des axes sécants.$$,
      'expected', $$C'est la symétrie centrale de centre O.$$
    )
  ),
  now()
);
