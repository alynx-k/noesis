-- Rewritten from the REAL ecole-ci.org PDF: "4e_Maths leçon 7
-- Equations_Inequations" (Collège Numérique, Thème "Calculs algébriques",
-- Leçon 7, course id 1989, resource id 16164, downloaded from
-- coll.ecole-ci.org and read directly). The real lesson structures the
-- topic as: vocabulary of equations, properties of equalities under
-- addition/multiplication, resolution of a+x=b and ax=b, then the mirror
-- structure for inéquations (vocabulary, properties of inequalities
-- including the sign flip on negative multiplication, and resolution).
-- Every sentence, example and exercise below is an original composition
-- in our own wording — no sentence is copied verbatim from the source
-- PDF. No diagram: the graduated-line representation is described in
-- words, since CourseDiagram has no dedicated number-line primitive.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant une soirée culturelle organisée par le club théâtre d'un collège, 90 spectateurs ont assisté au spectacle : ceux qui étaient assis ont payé 400 F le billet, ceux qui sont restés debout ont payé 100 F. La recette totale s'élève à 27 000 F. Pour vérifier les comptes du trésorier, les élèves de 4ème du club doivent poser puis résoudre une équation afin de retrouver le nombre exact de spectateurs assis.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Équation : vocabulaire et solutions$$,
        'body', $$Une égalité du type ax+b=c, où x désigne un nombre rationnel inconnu, est appelée équation d'inconnue x. Le morceau à gauche du signe = est le premier membre, celui de droite le second membre. Une solution de l'équation est un nombre qui, mis à la place de x, rend l'égalité vraie.$$,
        'highlights', array[$$équation$$, $$premier membre$$, $$solution$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulaire$$, 'text', $$Dans l'équation ax+b=c : ax+b est le premier membre, c est le second membre. Tout nombre rationnel qui rend l'égalité vraie est une solution de l'équation ; résoudre l'équation, c'est trouver toutes ses solutions.$$),
        'example', jsonb_build_object('statement', $$Vérifie que 5 est solution de l'équation 3x − 4 = 11.$$, 'solution', $$Pour x = 5 : 3×5 − 4 = 15 − 4 = 11, qui est bien le second membre. Donc 5 est solution.$$),
        'fixation', jsonb_build_object('question', $$Vérifie que −2 n'est pas solution de l'équation 4x + 9 = 3.$$, 'solution', $$Pour x = −2 : 4×(−2) + 9 = −8+9 = 1, ce qui n'est pas égal à 3. Donc −2 n'est pas solution.$$)
      ),
      jsonb_build_object(
        'heading', $$Égalités et opérations$$,
        'body', $$Pour transformer une équation sans changer ses solutions, on peut ajouter (ou soustraire) le même nombre aux deux membres, ou multiplier (ou diviser) les deux membres par un même nombre non nul. Ces deux propriétés sont la base de toute résolution d'équation.$$,
        'highlights', array[$$ajouter aux deux membres$$, $$multiplier les deux membres$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$Si a=b, alors a+c=b+c pour tout rationnel c. Si a=b, alors ka=kb pour tout rationnel k non nul.$$),
        'example', jsonb_build_object('statement', $$Sachant que 3x+2=8, déduis l'égalité obtenue en soustrayant 2 aux deux membres.$$, 'solution', $$3x+2−2 = 8−2, c'est-à-dire 3x = 6.$$),
        'fixation', jsonb_build_object('question', $$Sachant que 5x=20, déduis l'égalité obtenue en multipliant les deux membres par 1/5.$$, 'solution', $$(1/5)×5x = (1/5)×20, c'est-à-dire x = 4.$$)
      ),
      jsonb_build_object(
        'heading', $$Résoudre une équation du type a+x=b ou ax=b$$,
        'body', $$Une équation a+x=b a pour unique solution la différence b−a. Une équation ax=b (avec a non nul) a pour unique solution le quotient b/a. Ces deux formules couvrent tous les cas d'équations du premier degré ramenées à leur forme la plus simple.$$,
        'highlights', array[$$b−a$$, $$b/a$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$L'équation a+x=b a pour unique solution x = b−a. L'équation ax=b, avec a non nul, a pour unique solution x = b/a.$$),
        'example', jsonb_build_object('statement', $$Résous −9+x=4, puis résous −6x=15.$$, 'solution', $$−9+x=4, donc x = 4−(−9) = 13. −6x=15, donc x = 15/(−6) = −5/2.$$),
        'fixation', jsonb_build_object('question', $$Résous x+17=5, puis résous 8x=−28.$$, 'solution', $$x+17=5, donc x = 5−17 = −12. 8x=−28, donc x = −28/8 = −7/2.$$)
      ),
      jsonb_build_object(
        'heading', $$Inéquations et résolution$$,
        'body', $$Une inéquation du type ax+b>c (ou <c) se résout comme une équation en ajoutant ou soustrayant un même nombre aux deux membres. Mais dès qu'on multiplie ou divise les deux membres par un nombre négatif, le sens de l'inégalité doit être inversé ; il reste inchangé si le nombre est positif.$$,
        'highlights', array[$$inéquation$$, $$sens de l'inégalité$$]::text[],
        'property', jsonb_build_object('label', $$Règles$$, 'text', $$Ajouter (ou soustraire) un même nombre aux deux membres conserve le sens de l'inégalité. Multiplier (ou diviser) par un nombre positif conserve le sens ; multiplier (ou diviser) par un nombre négatif inverse le sens.$$),
        'example', jsonb_build_object('statement', $$Résous −5x+2>17.$$, 'solution', $$−5x+2>17, donc −5x>15. On divise par −5 (négatif), le sens s'inverse : x<−3.$$),
        'fixation', jsonb_build_object('question', $$Résous 4x−9≤3.$$, 'solution', $$4x≤12. On divise par 4 (positif), le sens ne change pas : x≤3.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux frères, Yao et Séka, cultivent ensemble 5 tonnes de cacao qu'ils livrent à leur coopérative de Divo. Yao a produit plus de 3 tonnes. Après avoir payé Yao, le gérant annonce qu'il ne reste que 980 000 F dans la caisse, alors que le cacao se vend 700 F le kilogramme.$$,
      'questions', array[
        $$En notant x le poids, en kg, de la production de Yao, écris une inéquation traduisant que sa production dépasse 3 tonnes.$$,
        $$Déduis-en un encadrement du poids de la production de Séka, sachant que le total des deux productions est 5 tonnes.$$,
        $$Détermine si le gérant peut payer intégralement la production de Séka avec les 980 000 F restants, en justifiant ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Vérifie si 7 est solution de l'équation 2x + 5 = 19.$$,
      'hint', $$Remplace x par 7 dans le premier membre et compare avec le second membre.$$,
      'expected', $$2×7+5 = 14+5 = 19, qui est bien le second membre. Donc 7 est solution.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation −7 + x = −2.$$,
      'hint', $$Utilise la propriété : l'équation a+x=b a pour solution x = b−a.$$,
      'expected', $$x = −2 − (−7) = 5.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation 9x = −6.$$,
      'hint', $$Utilise la propriété : l'équation ax=b a pour solution x = b/a.$$,
      'expected', $$x = −6/9 = −2/3.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'inéquation −3x − 4 > 8.$$,
      'hint', $$Isole d'abord le terme en x, puis fais attention au sens de l'inégalité en divisant par un nombre négatif.$$,
      'expected', $$−3x > 12. On divise par −3 (négatif), le sens s'inverse : x < −4.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-equations-inequations-q';
