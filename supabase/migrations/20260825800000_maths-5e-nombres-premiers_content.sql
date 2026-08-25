-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Calculs algébriques).
-- Cours : "Leçon 1 : Nombres premiers". Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices
-- reformulés, valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une révision sur les nombres entiers naturels, un professeur demande à ses élèves de 5ème de citer les chiffres qui permettent d'écrire tous les nombres entiers. Un élève cite 0, 1, 2, ..., 9 ; un autre ajoute que 2, 3, 5 et 7 sont des nombres premiers. Le professeur le félicite et annonce qu'il existe bien d'autres nombres premiers. Toute la classe est curieuse de les découvrir.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Puissances entières et priorités de calcul$$,
        'body', $$Pour un nombre entier naturel a et un entier n > 1, aⁿ (« a exposant n ») désigne le produit de n facteurs égaux à a : aⁿ = a × a × ... × a. Cas particuliers : 0ⁿ = 0 et 1ⁿ = 1 pour n non nul ; a¹ = a ; et par convention a⁰ = 1. Dans une suite d'opérations sans parenthèses, on calcule dans l'ordre : les puissances, puis les multiplications/divisions, puis les additions/soustractions. Propriétés utiles : aⁿ × bⁿ = (a × b)ⁿ et aⁿ × aᵐ = aⁿ⁺ᵐ.$$,
        'highlights', array[$$aⁿ = produit de n facteurs a ; a⁰=1, a¹=a, 0ⁿ=0, 1ⁿ=1$$, $$priorités : parenthèses > puissances > multiplication/division > addition/soustraction$$, $$aⁿ×bⁿ=(a×b)ⁿ et aⁿ×aᵐ=aⁿ⁺ᵐ$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule 2² × 2³ en utilisant la propriété des puissances.$$, 'solution', $$2² × 2³ = 2²⁺³ = 2⁵ = 32.$$),
        'fixation', jsonb_build_object('question', $$Que vaut 4³ ? Écris-le comme un produit puis calcule.$$, 'solution', $$4³ = 4 × 4 × 4 = 64.$$)
      ),
      jsonb_build_object(
        'heading', $$Division euclidienne et encadrement$$,
        'body', $$Pour deux entiers naturels a et b (b non nul), la division euclidienne de a par b s'écrit a = b × q + r avec r < b : a est le dividende, b le diviseur, q le quotient, r le reste. Si le reste est nul, a est un multiple de b. Si a n'est pas un multiple de b, on peut l'encadrer par deux multiples consécutifs de b : b × q < a < b × (q+1).$$,
        'highlights', array[$$division euclidienne : a = b×q + r, avec r < b$$, $$si r=0, a est un multiple de b ; sinon, b×q < a < b×(q+1)$$]::text[],
        'example', jsonb_build_object('statement', $$Effectue la division euclidienne de 57 par 4.$$, 'solution', $$57 = 4 × 14 + 1 : dividende 57, diviseur 4, quotient 14, reste 1.$$),
        'fixation', jsonb_build_object('question', $$Encadre 17 par deux multiples consécutifs de 6.$$, 'solution', $$17 = 6×2 + 5, donc 12 < 17 < 18.$$)
      ),
      jsonb_build_object(
        'heading', $$Nombres premiers et décomposition$$,
        'body', $$Un nombre premier est un entier naturel non nul qui admet exactement deux diviseurs : 1 et lui-même (1 n'est pas premier ; 2 est le seul nombre pair premier). Pour savoir si a est premier, on le divise par les nombres premiers successifs (2, 3, 5, 7...) jusqu'à trouver un reste nul (a n'est pas premier) ou un quotient inférieur ou égal au diviseur (a est premier). Tout nombre non premier plus grand que 1 se décompose en un produit de facteurs premiers.$$,
        'highlights', array[$$nombre premier = exactement 2 diviseurs (1 et lui-même) ; 1 n'est pas premier ; 2 est le seul premier pair$$, $$test : diviser par 2,3,5,7... jusqu'à reste nul (non premier) ou quotient ≤ diviseur (premier)$$]::text[],
        'example', jsonb_build_object('statement', $$Décompose 40 en produit de facteurs premiers.$$, 'solution', $$40 = 2×2×2×5 = 2³×5.$$),
        'fixation', jsonb_build_object('question', $$71 est-il un nombre premier ?$$, 'solution', $$Oui : 71=2×35+1, 71=3×23+2, 71=5×14+1, 71=7×10+1, 71=11×6+5, et 6<11, donc 71 est premier.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une bibliothèque a reçu 170 livres à ranger sur des étagères pouvant contenir 28 livres chacune. Un élève de 5ème veut savoir si toutes les étagères auront le même nombre de livres.$$,
      'questions', array[
        $$Détermine le nombre d'étagères complètes.$$,
        $$Détermine le nombre de livres sur l'étagère incomplète.$$,
        $$Détermine combien de livres il faudrait recevoir en plus pour que la dernière étagère soit aussi complète.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule 2³ et 7².$$,
      'hint', $$Développe chaque puissance en produit de facteurs égaux.$$,
      'expected', $$2³ = 8 et 7² = 49.$$
    ),
    jsonb_build_object(
      'question', $$Cite les nombres premiers compris entre 1 et 15.$$,
      'hint', $$Rappelle-toi que 1 n'est pas premier.$$,
      'expected', $$2, 3, 5, 7, 11 et 13.$$
    ),
    jsonb_build_object(
      'question', $$Décompose 56 en produit de facteurs premiers.$$,
      'hint', $$Divise successivement par les nombres premiers.$$,
      'expected', $$56 = 2³ × 7.$$
    ),
    jsonb_build_object(
      'question', $$Le nombre x a pour quotient 19 et pour reste 11 dans sa division par 13. Quelle est la valeur de x ?$$,
      'hint', $$Utilise l'égalité a = b×q + r.$$,
      'expected', $$x = 13×19 + 11 = 258.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-nombres-premiers';
