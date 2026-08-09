-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 14: Pyramides et cônes"
-- programme document, but every sentence, example and exercise is an
-- original rewrite. Diagrams: a generic square-based pyramid (pseudo-3D,
-- dashed hidden edges) and a generic cone (using the circle field added for
-- angles-inscrits), both with own coordinates, not the source's SABCD/SOA
-- figures.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un chef cuisinier veut fabriquer deux moules à gâteau de fête, l'un en forme de pyramide à base carrée, l'autre en forme de cône, tous deux recouverts de chocolat. Il connaît la hauteur et la longueur des arêtes de chacun, mais il doit calculer la quantité de chocolat nécessaire pour recouvrir chaque moule, sachant que 100 g de chocolat couvre chaque décimètre carré de surface. Son neveu, en classe de troisième, lui propose de l'aider grâce à ses cours de géométrie de l'espace.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Pyramide : vocabulaire et hauteur$$,
        'body', $$Une pyramide est un solide formé d'un sommet unique, relié par des arêtes à chaque sommet d'un polygone qui forme sa base, et dont les faces latérales sont des triangles partageant tous ce même sommet. Sa hauteur est le segment perpendiculaire au plan de la base, issu du sommet.$$,
        'highlights', array[$$sommet$$, $$base$$, $$hauteur$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une pyramide a un sommet principal, une base polygonale, des faces latérales triangulaires de même sommet, et des arêtes reliant le sommet aux sommets de la base. Sa hauteur est la droite passant par le sommet et perpendiculaire au plan de la base.$$),
        'example', jsonb_build_object('statement', $$Dans une pyramide SABCDE, combien y a-t-il de faces latérales ?$$, 'solution', $$La base ABCDE a 5 côtés, donc la pyramide a 5 faces latérales : SAB, SBC, SCD, SDE, SEA.$$),
        'fixation', jsonb_build_object('question', $$Dans une pyramide à base hexagonale, combien y a-t-il de faces latérales et d'arêtes latérales ?$$, 'solution', $$La base a 6 côtés, donc il y a 6 faces latérales et 6 arêtes latérales (une par sommet de la base).$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 180),
          'points', jsonb_build_array(
            jsonb_build_object('x', 105, 'y', 30, 'label', $$S$$),
            jsonb_build_object('x', 40, 'y', 160, 'label', $$A$$),
            jsonb_build_object('x', 140, 'y', 160, 'label', $$B$$),
            jsonb_build_object('x', 170, 'y', 130, 'label', $$C$$),
            jsonb_build_object('x', 70, 'y', 130, 'label', $$D$$),
            jsonb_build_object('x', 105, 'y', 145, 'label', $$O$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2), jsonb_build_array(0,3), jsonb_build_array(0,4), jsonb_build_array(1,2), jsonb_build_array(2,3)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(4,1), jsonb_build_array(4,3), jsonb_build_array(0,5))
        )
      ),
      jsonb_build_object(
        'heading', $$Pyramide régulière et apothème$$,
        'body', $$Une pyramide régulière a une base qui est un polygone régulier, et des faces latérales toutes identiques, isocèles. Son apothème est la hauteur d'une face latérale, mesurée depuis le sommet.$$,
        'highlights', array[$$pyramide régulière$$, $$apothème$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Une pyramide est régulière si sa base est un polygone régulier et ses faces latérales sont des triangles isocèles superposables. Dans ce cas, sa hauteur passe par le sommet et le centre du cercle circonscrit à la base. L'apothème est la hauteur d'une face latérale issue du sommet.$$),
        'example', jsonb_build_object('statement', $$SABCD est une pyramide régulière de base carrée ABCD. Que représente le segment reliant S au centre du carré ?$$, 'solution', $$C'est la hauteur de la pyramide, car elle relie le sommet au centre du cercle circonscrit à la base.$$),
        'fixation', jsonb_build_object('question', $$SABC est une pyramide régulière de base le triangle équilatéral ABC. Le segment [SI], où I est le milieu de [BC], est-il un apothème ou la hauteur de la pyramide ?$$, 'solution', $$[SI] est la hauteur de la face SBC issue de S, donc c'est un apothème de la pyramide.$$)
      ),
      jsonb_build_object(
        'heading', $$Aire latérale et volume d'une pyramide régulière$$,
        'body', $$Pour recouvrir une pyramide régulière ou en calculer la contenance, deux formules suffisent : l'une utilise le périmètre de la base et l'apothème, l'autre l'aire de la base et la hauteur.$$,
        'highlights', array[$$aire latérale$$, $$volume$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Aire latérale : A = (P×a)/2, où P est le périmètre de la base et a l'apothème. Volume : V = (B×h)/3, où B est l'aire de la base et h la hauteur.$$),
        'example', jsonb_build_object('statement', $$SABCD est une pyramide régulière de base carrée de côté 5 cm, d'apothème 8 cm et de hauteur 6 cm. Calcule son aire latérale et son volume.$$, 'solution', $$P = 4×5 = 20 cm, donc A = (20×8)/2 = 80 cm². B = 5×5 = 25 cm², donc V = (25×6)/3 = 50 cm³.$$),
        'fixation', jsonb_build_object('question', $$SABC est une pyramide régulière de base un triangle équilatéral de périmètre 18 cm et d'aire 15,6 cm², d'apothème 7 cm et de hauteur 9 cm. Calcule son aire latérale et son volume.$$, 'solution', $$A = (18×7)/2 = 63 cm². V = (15,6×9)/3 = 46,8 cm³.$$)
      ),
      jsonb_build_object(
        'heading', $$Cône de révolution$$,
        'body', $$Un cône de révolution s'obtient en faisant tourner un triangle rectangle autour de l'un de ses côtés de l'angle droit. Le côté fixe devient la hauteur, l'autre côté devient le rayon de la base, et l'hypoténuse balayée devient la génératrice du cône.$$,
        'highlights', array[$$cône de révolution$$, $$génératrice$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un cône de révolution a un sommet S, une base circulaire de centre O, une hauteur [SO] perpendiculaire au plan de la base, et des génératrices reliant S à chaque point du cercle de base.$$),
        'example', jsonb_build_object('statement', $$Un cône a pour hauteur SO=8 cm et pour rayon de base OA=6 cm. Calcule sa génératrice SA.$$, 'solution', $$Le triangle SOA est rectangle en O, donc SA² = SO²+OA² = 64+36 = 100, donc SA = 10 cm.$$),
        'fixation', jsonb_build_object('question', $$Un cône a pour hauteur SO=5 cm et pour génératrice SA=13 cm. Calcule le rayon OA de sa base.$$, 'solution', $$OA² = SA²−SO² = 169−25 = 144, donc OA = 12 cm.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 180),
          'circle', jsonb_build_object('cx', 100, 'cy', 140, 'r', 60),
          'points', jsonb_build_array(
            jsonb_build_object('x', 100, 'y', 30, 'label', $$S$$),
            jsonb_build_object('x', 100, 'y', 140, 'label', $$O$$),
            jsonb_build_object('x', 160, 'y', 140, 'label', $$A$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,2)),
          'dashedSegments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2)),
          'rightAngleAt', jsonb_build_array(1)
        )
      ),
      jsonb_build_object(
        'heading', $$Aire latérale et volume d'un cône de révolution$$,
        'body', $$Les formules d'aire latérale et de volume d'un cône ressemblent beaucoup à celles d'une pyramide régulière : le rôle du périmètre et de l'apothème est repris par le périmètre du cercle et la génératrice.$$,
        'highlights', array[$$aire latérale$$, $$volume$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Aire latérale : A = (P×a)/2, où P=2πr est le périmètre du cercle de base et a la génératrice. Volume : V = (B×h)/3, où B=πr² est l'aire du disque de base et h la hauteur.$$),
        'example', jsonb_build_object('statement', $$Un cône a un rayon de base 4 cm et une génératrice 9 cm. Calcule son aire latérale (en fonction de π).$$, 'solution', $$P = 2π×4 = 8π. A = (8π×9)/2 = 36π cm².$$),
        'fixation', jsonb_build_object('question', $$Un cône a un rayon de base 3 cm et une hauteur 7 cm. Calcule son volume (en fonction de π).$$, 'solution', $$B = π×3² = 9π. V = (9π×7)/3 = 21π cm³.$$)
      ),
      jsonb_build_object(
        'heading', $$Réduction par une section parallèle à la base$$,
        'body', $$Quand on coupe une pyramide ou un cône par un plan parallèle à sa base, la partie qui contient le sommet est une réduction du solide de départ : ses longueurs, aires et volumes se transforment tous selon le même coefficient k, mais pas de la même façon.$$,
        'highlights', array[$$réduction$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si k est le rapport de réduction : les longueurs sont multipliées par k, les aires par k², et les volumes par k³.$$),
        'example', jsonb_build_object('statement', $$Une pyramide a un volume de 250 cm³. On la coupe par un plan parallèle à la base tel que le rapport de réduction soit k=2/5. Calcule le volume de la petite pyramide obtenue.$$, 'solution', $$V' = k³×V = (2/5)³×250 = (8/125)×250 = 16 cm³.$$),
        'fixation', jsonb_build_object('question', $$Un cône a un volume de 108 cm³. On le réduit avec un rapport k=1/3. Calcule le volume du petit cône obtenu.$$, 'solution', $$V' = k³×V = (1/3)³×108 = (1/27)×108 = 4 cm³.$$)
      ),
      jsonb_build_object(
        'heading', $$Tronc de pyramide ou de cône$$,
        'body', $$La partie qui reste après avoir retiré la petite pyramide (ou le petit cône) du sommet s'appelle un tronc. Son aire latérale et son volume s'obtiennent simplement en soustrayant ceux de la partie réduite à ceux du solide complet.$$,
        'highlights', array[$$tronc$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si AG et VG désignent l'aire latérale et le volume du grand solide, et AP et VP ceux du solide réduit, alors le tronc a pour aire latérale AT=AG−AP et pour volume VT=VG−VP.$$),
        'example', jsonb_build_object('statement', $$Une pyramide a une aire latérale de 90 cm² et un volume de 120 cm³. Après réduction, la petite pyramide a une aire latérale de 40 cm² et un volume de 15 cm³. Calcule l'aire latérale et le volume du tronc.$$, 'solution', $$AT = 90−40 = 50 cm². VT = 120−15 = 105 cm³.$$),
        'fixation', jsonb_build_object('question', $$Un cône a un volume de 96π cm³. Le petit cône obtenu par réduction a un volume de 12π cm³. Calcule le volume du tronc de cône.$$, 'solution', $$VT = 96π−12π = 84π cm³.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour la kermesse de son quartier, un artisan veut fabriquer un chapiteau conique de 4 m de diamètre et 3,9 m de hauteur, entièrement recouvert d'une bâche. Une boutique lui propose un rouleau de bâche de 35 m². Le cahier des charges impose que la bâche recouvre à la fois la surface latérale du chapiteau et son sol circulaire.$$,
      'questions', array[
        $$Calcule la génératrice du cône formé par le chapiteau (arrondis au dixième).$$,
        $$Calcule l'aire latérale, puis l'aire totale du chapiteau (on prendra π≈3,14, arrondis au dixième).$$,
        $$Le rouleau de bâche proposé est-il suffisant pour recouvrir tout le chapiteau ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une pyramide régulière a une base carrée de côté 8 cm. Combien a-t-elle d'arêtes en tout ?$$,
      'hint', $$Compte les arêtes de la base et les arêtes latérales séparément.$$,
      'expected', $$La base carrée a 4 arêtes, et il y a 4 arêtes latérales (une par sommet), soit 8 arêtes en tout.$$
    ),
    jsonb_build_object(
      'question', $$SABCD est une pyramide régulière de base carrée de côté 6 cm, d'apothème 10 cm et de hauteur 8 cm. Calcule son aire latérale et son volume.$$,
      'hint', $$Utilise A=(P×a)/2 et V=(B×h)/3.$$,
      'expected', $$P=4×6=24 cm, donc A=(24×10)/2=120 cm². B=6×6=36 cm², donc V=(36×8)/3=96 cm³.$$
    ),
    jsonb_build_object(
      'question', $$Un cône a un rayon de base 5 cm et une génératrice 13 cm. Calcule sa hauteur, puis son volume en fonction de π.$$,
      'hint', $$Utilise le théorème de Pythagore pour la hauteur, puis V=(B×h)/3.$$,
      'expected', $$h²=13²−5²=169−25=144, donc h=12 cm. B=π×5²=25π. V=(25π×12)/3=100π cm³.$$
    ),
    jsonb_build_object(
      'question', $$Un cône a un volume de 250 cm³. On le coupe par un plan parallèle à la base avec un rapport de réduction k=3/5. Calcule le volume du petit cône, puis celui du tronc de cône.$$,
      'hint', $$Utilise Vréduit=k³×V, puis Vtronc=Vgrand−Vréduit.$$,
      'expected', $$Petit cône : (3/5)³×250 = (27/125)×250 = 54 cm³. Tronc : 250−54 = 196 cm³.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-pyramides-cones';
