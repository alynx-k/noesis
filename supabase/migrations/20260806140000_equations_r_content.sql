-- Same CourseContentV2 shape as calcul-litteral (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- Structure follows the official DPFC/MENA "Leçon 8: Equations et
-- inéquations dans ℝ" programme document, but every sentence, example and
-- exercise is an original rewrite. No diagram: purely algebraic content.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deux vendeurs de rue proposent chacun une façon de calculer le prix d'un sac de charbon selon la quantité achetée. Un client se demande à partir de quelle quantité un vendeur devient plus avantageux que l'autre. Pour répondre, il doit poser une inégalité entre deux expressions et la résoudre — exactement ce que permettent les équations et inéquations dans ℝ.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Équations du type x + a = b et ax = b$$,
        'body', $$Les équations les plus simples se résolvent en isolant x d'un seul côté, soit en soustrayant un nombre, soit en divisant par le coefficient de x.$$,
        'highlights', array[$$isolant x$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$x + a = b équivaut à x = b − a. Et pour a ≠ 0, ax = b équivaut à x = b/a.$$),
        'example', jsonb_build_object('statement', $$Résous x + 7 = 12.$$, 'solution', $$x + 7 = 12 équivaut à x = 12 − 7 = 5.$$),
        'fixation', jsonb_build_object('question', $$Résous 4x = 20.$$, 'solution', $$4x = 20 équivaut à x = 20/4 = 5.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations du type ax + b = cx + d$$,
        'body', $$Quand x apparaît des deux côtés de l'égalité, on regroupe tous les termes en x d'un côté et les nombres de l'autre, pour se ramener à une équation du type précédent.$$,
        'highlights', array[$$regroupe$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Toute équation ax + b = cx + d se ramène à une équation du type ex = f, qui a pour unique solution f/e lorsque e ≠ 0.$$),
        'example', jsonb_build_object('statement', $$Résous 5x − 2 = 2x + 7.$$, 'solution', $$5x − 2x = 7 + 2, donc 3x = 9, donc x = 3.$$),
        'fixation', jsonb_build_object('question', $$Résous 8x + 1 = 3x + 11.$$, 'solution', $$8x − 3x = 11 − 1, donc 5x = 10, donc x = 2.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations produit et équations x² = a$$,
        'body', $$Un produit de deux facteurs est nul dès que l'un des deux facteurs est nul — cette idée permet de résoudre des équations qu'on ne pourrait pas isoler directement.$$,
        'highlights', array[$$produit$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$(ax+b)(cx+d) = 0 équivaut à ax+b = 0 ou cx+d = 0. Et pour a>0, l'équation x² = a a deux solutions : √a et −√a.$$),
        'example', jsonb_build_object('statement', $$Résous (2x−6)(x+1) = 0.$$, 'solution', $$2x−6=0 ou x+1=0, donc x=3 ou x=−1.$$),
        'fixation', jsonb_build_object('question', $$Résous x² = 49.$$, 'solution', $$x² = 49 équivaut à x = 7 ou x = −7.$$)
      ),
      jsonb_build_object(
        'heading', $$Inéquations du premier degré$$,
        'body', $$Résoudre une inéquation ressemble à résoudre une équation, sauf qu'il faut faire attention : multiplier ou diviser par un nombre négatif inverse le sens de l'inégalité.$$,
        'highlights', array[$$inéquation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Toute inéquation ax+b>0 (avec a≠0) se ramène à x>u ou x<v selon le signe de a. L'ensemble des solutions s'écrit sous forme d'intervalle.$$),
        'example', jsonb_build_object('statement', $$Résous 3x − 9 > 0.$$, 'solution', $$3x > 9, donc x > 3. L'ensemble des solutions est ]3;→[.$$),
        'fixation', jsonb_build_object('question', $$Résous −2x + 6 ≥ 0.$$, 'solution', $$−2x ≥ −6, donc x ≤ 3 (le sens s'inverse car on divise par −2). L'ensemble des solutions est ]←;3].$$)
      ),
      jsonb_build_object(
        'heading', $$Systèmes d'inéquations$$,
        'body', $$Résoudre un système de deux inéquations, c'est trouver tous les nombres qui vérifient les deux à la fois : on résout chaque inéquation séparément, puis on prend l'intersection des deux ensembles de solutions.$$,
        'highlights', array[$$intersection$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour un système {ax+b≥0 ; cx+d<0}, on résout chaque ligne séparément, puis S = S1 ∩ S2.$$),
        'example', jsonb_build_object('statement', $$Résous {2x−4<0 ; 3x+9≥0}.$$, 'solution', $$2x−4<0 donne x<2, S1=]←;2[. 3x+9≥0 donne x≥−3, S2=[−3;→[. Donc S = [−3;2[.$$),
        'fixation', jsonb_build_object('question', $$Résous {x−1>0 ; 2x−10≤0}.$$, 'solution', $$x−1>0 donne x>1. 2x−10≤0 donne x≤5. Donc S = ]1;5].$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes conduisant à une équation ou une inéquation$$,
        'body', $$Pour résoudre un problème concret, on nomme d'abord l'inconnue par une lettre, on traduit l'énoncé en équation ou en inéquation, on la résout, puis on interprète le résultat dans le contexte du problème.$$,
        'highlights', array[$$inconnue$$]::text[],
        'property', jsonb_build_object('label', $$Méthode$$, 'text', $$On nomme l'inconnue, on traduit l'énoncé en équation ou inéquation, on la résout, puis on interprète le résultat en revenant au contexte du problème.$$),
        'example', jsonb_build_object('statement', $$Un taxi facture 300 F de prise en charge puis 150 F par kilomètre. À partir de combien de kilomètres la course dépasse-t-elle 2000 F ?$$, 'solution', $$Notons x le nombre de kilomètres. On résout 300+150x>2000, soit 150x>1700, soit x>11,33. Donc à partir de 12 km, la course dépasse 2000 F.$$),
        'fixation', jsonb_build_object('question', $$Un club propose un abonnement de 2000 F puis 100 F par séance, contre 250 F par séance sans abonnement ailleurs. À partir de combien de séances l'abonnement devient-il plus avantageux ?$$, 'solution', $$Notons x le nombre de séances. On résout 2000+100x<250x, soit 2000<150x, soit x>13,33. Donc à partir de 14 séances, l'abonnement est plus avantageux.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour un tournoi sportif inter-quartiers, l'organisateur affirme que si 180 équipes s'inscrivent et que le sponsor verse 40 000 F, la cagnotte totale dépassera 100 000 F. Le trésorier affirme que si 150 équipes s'inscrivent et qu'on retire 8 000 F pour les arbitres, la somme restante ne dépassera pas 67 000 F.$$,
      'questions', array[
        $$Note x le montant de l'inscription par équipe, et traduis chaque affirmation par une inéquation.$$,
        $$Résous le système d'inéquations obtenu.$$,
        $$Donne le montant d'inscription qui satisfait à la fois l'organisateur et le trésorier.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Résous l'équation 5x − 3 = 2x + 9.$$,
      'hint', $$Relis la méthode : regroupe les termes en x d'un côté, les nombres de l'autre.$$,
      'expected', $$5x−2x = 9+3, donc 3x=12, donc x=4.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation (3x+6)(x−5)=0.$$,
      'hint', $$Relis la propriété du produit nul.$$,
      'expected', $$3x+6=0 ou x−5=0, donc x=−2 ou x=5.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'inéquation −4x + 8 < 0, en expliquant ce qui se passe pour le sens de l'inégalité.$$,
      'hint', $$Relis les inéquations du premier degré : diviser par un nombre négatif inverse le sens.$$,
      'expected', $$−4x < −8, donc x > 2 (le sens s'inverse car on divise par −4, un nombre négatif). L'ensemble des solutions est ]2;→[.$$
    ),
    jsonb_build_object(
      'question', $$Un vendeur de rue propose un forfait de 500 F plus 50 F par sac de charbon, contre 90 F par sac chez un autre vendeur sans forfait. À partir de combien de sacs le forfait devient-il plus avantageux ? Pose l'inéquation puis résous-la.$$,
      'hint', $$Relis la méthode pour un problème conduisant à une inéquation : nomme l'inconnue, traduis, résous, interprète.$$,
      'expected', $$Notons x le nombre de sacs. On résout 500+50x<90x, soit 500<40x, soit x>12,5. Donc à partir de 13 sacs, le forfait est plus avantageux.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-equations-r';
