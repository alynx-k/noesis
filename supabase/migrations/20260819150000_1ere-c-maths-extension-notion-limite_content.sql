-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Mathématiques, categoryid=131.
-- Moodle course id 2028: "MATHS_1C L7: EXTENSION DE LA NOTION DE LA LIMITE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2028), resource id 17798.
-- Contenu mathématique factuel (définitions, théorèmes, formules,
-- exercices), non soumis au droit d'auteur ; reformulé pour la structure
-- CourseContentV2, résultats mathématiques repris tels quels.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-maths-extension-notion-limite',
  '1ere',
  'C',
  'mathematiques',
  $$Extension de la notion de limite$$,
  7,
  '1ere-c-maths-angles-orientes-trigonometrie',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un professeur présente la trajectoire de deux projectiles décrite par l'équation horaire y(t) = 2/(2−t), t∈[0;+∞[, le premier pour t∈[0;2[ et le second pour t∈]2;+∞[. Les élèves constatent que sur ]2;+∞[, lorsque t tend vers +∞, la trajectoire se rapproche de la droite d'équation y=0. Ils cherchent à traduire ce résultat en termes de limite de fonction.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Limite infinie en un point et asymptote verticale$$,
        'body', $$Pour tout entier naturel non nul n et tout réel a : lim(x→a) 1/(x−a)ⁿ = +∞ si n est pair ; à droite de a, la limite vaut toujours +∞, à gauche elle vaut +∞ si n est pair et −∞ si n est impair. Cas particuliers : lim(x→a,x>a) 1/(x−a) = +∞, lim(x→a,x<a) 1/(x−a) = −∞, lim(x→0,x>0) 1/x = +∞, lim(x→0,x<0) 1/x = −∞. Lorsque la limite de f en a (à gauche, à droite, ou globale) est infinie, la droite d'équation x=a est asymptote verticale à la courbe (Cf).$$,
        'highlights', array[$$lim(x→a) 1/(x−a)ⁿ = +∞ si n pair ; −∞ à gauche si n impair$$, $$limite infinie en a ⟹ x=a est asymptote verticale$$]::text[],
        'example', jsonb_build_object('statement', $$Soit f(x) = 1/(x+1). Justifie que x=−1 est asymptote verticale à (Cf).$$, 'solution', $$lim(x→−1,x>−1) f(x) = +∞, donc la droite d'équation x=−1 est une asymptote verticale à (Cf).$$),
        'fixation', jsonb_build_object('question', $$Calcule lim(x→4,x>4) 1/(x−4).$$, 'solution', $$lim(x→4,x>4) 1/(x−4) = +∞.$$)
      ),
      jsonb_build_object(
        'heading', $$Limite à l'infini et asymptote horizontale$$,
        'body', $$Pour tout réel c : lim(x→±∞) c = c. lim(x→+∞) √x = +∞. Pour tout entier naturel non nul n : lim(x→+∞) xⁿ = +∞ ; lim(x→−∞) xⁿ = +∞ si n pair, −∞ si n impair ; lim(x→±∞) 1/xⁿ = 0. Lorsque lim(x→+∞) f(x) = b (b réel), la droite d'équation y=b est asymptote horizontale à (Cf) en +∞ (de même en −∞).$$,
        'highlights', array[$$lim(x→+∞) xⁿ = +∞ ; lim(x→−∞) xⁿ selon parité de n$$, $$lim(x→+∞) f(x)=b ⟹ y=b asymptote horizontale en +∞$$]::text[],
        'example', jsonb_build_object('statement', $$Soit f(x)=1/x³. Justifie que y=0 est asymptote horizontale à (Cf) en +∞.$$, 'solution', $$lim(x→+∞) f(x) = lim(x→+∞) 1/x³ = 0, donc y=0 est asymptote horizontale à (Cf) en +∞.$$),
        'fixation', jsonb_build_object('question', $$Calcule lim(x→−∞) x⁶.$$, 'solution', $$Comme 6 est pair, lim(x→−∞) x⁶ = +∞.$$)
      ),
      jsonb_build_object(
        'heading', $$Opérations sur les limites : somme, produit, inverse, quotient$$,
        'body', $$Somme : lim(f+g) = lim f + lim g, sauf la forme indéterminée +∞−∞. Produit : lim(fg) = (lim f)(lim g) en suivant la règle des signes à l'infini, sauf la forme indéterminée 0×∞. Inverse (l≠0) : lim(1/f) = 1/l si lim f=l ; lim(1/f)=0 si lim f=±∞ ; lim(1/f)=+∞ si lim f=0 et f>0 ; lim(1/f)=−∞ si lim f=0 et f<0. Quotient : lim(f/g) = lim f × lim(1/g), sauf les formes indéterminées ∞/∞ et 0/0.$$,
        'highlights', array[$$formes indéterminées : +∞−∞, 0×∞, ∞/∞, 0/0$$, $$f/g = f × (1/g) : ramener le quotient à un produit$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule lim(x→+∞) (1/x)(x³).$$, 'solution', $$(1/x)(x³) = x², donc lim(x→+∞) (1/x)(x³) = lim(x→+∞) x² = +∞.$$),
        'fixation', jsonb_build_object('question', $$lim(x→3) f(x)=+∞ et lim(x→3) g(x)=−6. Que vaut lim(x→3) f(x)/g(x) ?$$, 'solution', $$lim(x→3) f(x)/g(x) = −∞.$$)
      ),
      jsonb_build_object(
        'heading', $$Limite en l'infini des fonctions polynômes et rationnelles$$,
        'body', $$La limite en l'infini d'une fonction polynôme est la limite en l'infini de son monôme de plus haut degré : lim(x→±∞)(anxⁿ+...+a0) = lim(x→±∞)(anxⁿ). La limite en l'infini d'une fonction rationnelle p/q est la limite en l'infini du quotient des monômes de plus haut degré du numérateur et du dénominateur.$$,
        'highlights', array[$$limite d'un polynôme à l'infini = limite de son terme de plus haut degré$$, $$limite d'une fraction rationnelle à l'infini = limite du quotient des termes de plus haut degré$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule lim(x→+∞) (3x+8)/(2x²−x+7).$$, 'solution', $$lim(x→+∞) (3x+8)/(2x²−x+7) = lim(x→+∞) 3x/2x² = lim(x→+∞) 3/(2x) = 0.$$),
        'fixation', jsonb_build_object('question', $$Calcule lim(x→+∞) (−4x³+2x²−6x+8).$$, 'solution', $$lim(x→+∞) (−4x³+2x²−6x+8) = lim(x→+∞)(−4x³) = −∞.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés de comparaison$$,
        'body', $$Soit f une fonction et a∈ℝ∪{+∞;−∞}. S'il existe une fonction g telle que g≤f et lim(x→a) g(x)=+∞, alors lim(x→a) f(x)=+∞. S'il existe une fonction g telle que f≤g et lim(x→a) g(x)=−∞, alors lim(x→a) f(x)=−∞. Ce principe permet d'encadrer une fonction contenant un terme borné (comme cos ou sin) pour en déduire sa limite.$$,
        'highlights', array[$$g≤f et lim g=+∞ ⟹ lim f=+∞$$, $$f≤g et lim g=−∞ ⟹ lim f=−∞$$]::text[],
        'example', jsonb_build_object('statement', $$Soit f(x)=2x+cos(x²). Calcule lim(x→+∞) f(x).$$, 'solution', $$Pour tout x, −1≤cos(x²)≤1, donc 2x−1≤f(x)≤2x+1. Comme 2x−1≤f(x) et lim(x→+∞)(2x−1)=+∞, alors lim(x→+∞) f(x)=+∞.$$),
        'fixation', jsonb_build_object('question', $$Si f(x)≥2x−1 pour tout x et lim(x→+∞)(2x−1)=+∞, que peut-on conclure sur lim(x→+∞) f(x) ?$$, 'solution', $$lim(x→+∞) f(x) = +∞.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des élèves découvrent une ville d'Afrique créée en 1960. Sa population évolue selon une fonction croissante f(x) = (60x+40)/(x+10), où x est le nombre d'années écoulées depuis la fin de 1960 et f(x) est exprimée en dizaines de milliers d'habitants. Un élève affirme que la population ne pourra jamais dépasser 600 000 habitants ; d'autres élèves pensent le contraire.$$,
      'questions', array[
        $$Explique pourquoi, la fonction f étant croissante, la limite de f(x) quand x tend vers +∞ donne la population limite de la ville.$$,
        $$Calcule lim(x→+∞) f(x) en utilisant la propriété des limites des fonctions rationnelles à l'infini.$$,
        $$Convertis ce résultat en nombre d'habitants et détermine lequel des élèves a raison.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Que peut-on dire de la droite x=a si lim(x→a) f(x) est infinie ?$$,
      'hint', $$C'est une droite verticale particulière.$$,
      'expected', $$La droite d'équation x=a est asymptote verticale à la courbe de f.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les quatre formes indéterminées à connaître dans les opérations sur les limites ?$$,
      'hint', $$Elles concernent la somme, le produit et le quotient.$$,
      'expected', $$+∞−∞, 0×∞, ∞/∞, 0/0.$$
    ),
    jsonb_build_object(
      'question', $$Calcule lim(x→−∞) (−4x³+2x²−6x⁷+8x−9).$$,
      'hint', $$Ne garder que le terme de plus haut degré.$$,
      'expected', $$lim(x→−∞) (−6x⁷) = +∞.$$
    ),
    jsonb_build_object(
      'question', $$Pour tout x, f(x)≤2x+1 et lim(x→−∞)(2x+1)=−∞. Que peut-on conclure sur lim(x→−∞) f(x) ?$$,
      'hint', $$C'est une propriété de comparaison.$$,
      'expected', $$lim(x→−∞) f(x) = −∞.$$
    )
  ),
  now()
);
