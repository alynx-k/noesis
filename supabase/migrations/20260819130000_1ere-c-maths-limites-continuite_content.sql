-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2026: "MATHS_1C L5: LIMITES ET CONTINUITÉ"
-- (https://lyc.ecole-ci.org/course/view.php?id=2026), resource id 17774.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-limites-continuite',
  '1ere',
  'C',
  'mathematiques',
  $$Limites et continuité$$,
  5,
  '1ere-c-maths-denombrement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves tracent à l'ordinateur la courbe de f(x)=x² sur ]−∞,1] et f(x)=x+2 sur ]1,+∞[. Ils observent une figure morcelée en deux parties au point d'abscisse 1, et cherchent à comprendre ce phénomène à travers la notion de continuité.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Limite et continuité en un point$$,
        'body', $$Quand f(x) se rapproche d'un nombre l lorsque x se rapproche de a, on dit que f admet la limite l en a, noté lim(x→a) f(x) = l. Une fonction f est continue en a lorsqu'elle admet une limite en a égale à f(a) : lim(x→a) f(x) = f(a). Cette limite, quand elle existe, est unique. Pour qu'une fonction soit continue en a, il faut qu'elle y soit définie.$$,
        'highlights', array[$$f continue en a ⟺ lim(x→a) f(x) = f(a)$$, $$condition nécessaire : f doit être définie en a$$]::text[],
        'example', jsonb_build_object('statement', $$f(x)=2x+1/x est-elle continue en 2 ? En 0 ?$$, 'solution', $$Continue en 2 : f est définie en 2 et lim(x→2) f(x) = f(2) = 5/2. Pas continue en 0 : f n'est pas définie en 0.$$),
        'fixation', jsonb_build_object('question', $$Que faut-il vérifier pour affirmer qu'une fonction f est continue en a ?$$, 'solution', $$Que f est définie en a et que lim(x→a) f(x) = f(a).$$)
      ),
      jsonb_build_object(
        'heading', $$Continuité des fonctions élémentaires et opérations$$,
        'body', $$Les fonctions x↦c, x↦xⁿ, x↦1/x, x↦√x, x↦|x|, x↦cos x, x↦sin x sont continues en tout point de leur ensemble de définition. Si f et g sont continues en a : f+g, fg, kf, |f| sont continues en a ; si g(a)≠0, 1/g et f/g sont continues en a ; si f≥0, √f est continue en a. Toute fonction obtenue par somme, produit ou quotient de fonctions élémentaires est continue en tout point de son ensemble de définition.$$,
        'highlights', array[$$fonctions élémentaires (c, xⁿ, 1/x, √x, |x|, cos, sin) continues sur leur domaine$$, $$somme, produit, quotient (dénominateur ≠0) de fonctions continues → continue$$]::text[],
        'example', jsonb_build_object('statement', $$f et g sont continues en 5. Justifie que f² et f−g sont continues en 5.$$, 'solution', $$f×f = f² est continue en 5 (produit de fonctions continues). −g est continue en 5, donc f+(−g) = f−g est continue en 5 (somme de fonctions continues).$$),
        'fixation', jsonb_build_object('question', $$Calcule lim(x→49) √x.$$, 'solution', $$La fonction racine étant continue en 49, lim(x→49) √x = √49 = 7.$$)
      ),
      jsonb_build_object(
        'heading', $$Limite à gauche, limite à droite$$,
        'body', $$La limite à gauche de f en a (notée lim(x→a⁻) f(x)) est la valeur approchée par f(x) quand x tend vers a par valeurs inférieures ; la limite à droite (lim(x→a⁺) f(x)) par valeurs supérieures. Si f n'est pas définie en a : f admet une limite l en a ⟺ les limites à gauche et à droite en a existent et sont égales à l. Si f est définie en a : f admet une limite en a ⟺ les limites à gauche et à droite valent f(a). Conséquence : f est continue en a ⟺ lim(x→a⁻) f(x) = lim(x→a⁺) f(x) = f(a).$$,
        'highlights', array[$$f continue en a ⟺ limite à gauche = limite à droite = f(a)$$, $$si les limites à gauche/droite diffèrent, f n'a pas de limite en a$$]::text[],
        'example', jsonb_build_object('statement', $$f(x)=3x−1 si x<1, f(x)=(x−1)/(x+1) si x≥1. Calcule les limites à gauche et à droite en 1. f a-t-elle une limite en 1 ?$$, 'solution', $$Limite à gauche : lim(x→1⁻)(3x−1) = 2. Limite à droite : lim(x→1⁺)(x−1)/(x+1) = 0/2 = 0. Comme 2≠0, f n'admet pas de limite en 1.$$),
        'fixation', jsonb_build_object('question', $$Que peut-on conclure si la limite à gauche et la limite à droite d'une fonction en a sont différentes ?$$, 'solution', $$La fonction n'admet pas de limite en a.$$)
      ),
      jsonb_build_object(
        'heading', $$Calcul de limites : opérations$$,
        'body', $$Si lim(x→a) f(x)=l et lim(x→a) g(x)=l' : lim(x→a)(f+g)(x) = l+l' ; lim(x→a)(fg)(x) = ll' ; si l'≠0, lim(x→a)(f/g)(x) = l/l'. Pour les fractions rationnelles présentant une forme indéterminée en a, on factorise numérateur et dénominateur pour simplifier avant de calculer la limite.$$,
        'highlights', array[$$lim(f+g) = l+l' ; lim(fg) = ll' ; lim(f/g) = l/l' (si l'≠0)$$, $$forme indéterminée → factoriser pour simplifier$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule lim(x→4) (x−4)/(√x−2).$$, 'solution', $$En multipliant par la quantité conjuguée : (x−4)(√x+2) / [(√x−2)(√x+2)] = (x−4)(√x+2)/(x−4) = √x+2. Donc la limite vaut √4+2 = 4.$$),
        'fixation', jsonb_build_object('question', $$lim(x→3) f(x) = −5 et lim(x→3) g(x) = 2. Calcule lim(x→3)(f×g)(x).$$, 'solution', $$lim(x→3)(f×g)(x) = −5×2 = −10.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un gérant de cabine téléphonique propose : 150 F/min de 0 à 5 min ; 750 F forfaitaire de 5 à 10 min ; 100 F/min de 10 à 30 min ; au-delà de 30 min, 3000 F forfait + 50 F/min supplémentaire. L'aîné pense que la fonction coût est continue en 5 mais discontinue en 30 ; le cadet pense qu'elle est continue aux deux points.$$,
      'questions', array[
        $$Exprime la fonction f(x) donnant le coût en fonction de la durée x, sur chacun des quatre intervalles.$$,
        $$Étudie la continuité de f en 5 (calcule f(5), la limite à gauche et la limite à droite en 5).$$,
        $$Étudie la continuité de f en 30 de la même manière, puis détermine lequel des deux frères a raison.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle condition doit vérifier lim(x→a) f(x) pour que f soit continue en a ?$$,
      'hint', $$Elle doit égaler une valeur précise de f.$$,
      'expected', $$lim(x→a) f(x) doit être égale à f(a).$$
    ),
    jsonb_build_object(
      'question', $$Les fonctions élémentaires comme x↦xⁿ ou x↦cos x sont-elles continues sur leur ensemble de définition ?$$,
      'hint', $$C'est une propriété générale.$$,
      'expected', $$Oui, elles sont continues en tout point de leur ensemble de définition.$$
    ),
    jsonb_build_object(
      'question', $$Si lim(x→a⁻) f(x) ≠ lim(x→a⁺) f(x), que peut-on dire de la limite de f en a ?$$,
      'hint', $$C'est une condition d'existence.$$,
      'expected', $$f n'admet pas de limite en a.$$
    ),
    jsonb_build_object(
      'question', $$Si lim(x→3) f(x) = −5 et lim(x→3) g(x) = 2, calcule lim(x→3)(f+g)(x).$$,
      'hint', $$C'est la somme des deux limites.$$,
      'expected', $$−5 + 2 = −3.$$
    )
  ),
  now()
);
