-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Calculs algébriques).
-- Cours : "Leçon 4 : Nombres décimaux relatifs". Contenu réécrit à
-- partir du PDF source ; situation d'apprentissage, définitions et
-- exercices reformulés, valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En regardant la météo à la télévision, un élève de 5ème note les températures de six villes (Abidjan, Bamako, Paris, Lisbonne, Pékin, Moscou) pour aujourd'hui et demain, certaines étant négatives. Il ne sait pas dans quelle ville la variation a été la plus grande. En classe, ses camarades décident de calculer l'écart de température de chaque ville pour les comparer.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Présentation et comparaison des nombres décimaux relatifs$$,
        'body', $$Un nombre décimal relatif s'écrit avec un nombre fini de chiffres après la virgule, précédé d'un signe : (+7,5) ou (-152,047) par exemple. L'ensemble des nombres décimaux relatifs se note 𝔻, les positifs 𝔻⁺, les négatifs 𝔻⁻ ; zéro est le seul nombre à la fois positif et négatif. Pour comparer deux nombres décimaux relatifs : si les signes sont contraires, le négatif est le plus petit ; si les deux sont positifs, le plus petit a la plus petite distance à zéro ; si les deux sont négatifs, le plus petit a la plus grande distance à zéro.$$,
        'highlights', array[$$𝔻 = décimaux relatifs, 𝔻⁺ positifs, 𝔻⁻ négatifs ; 0 est à la fois positif et négatif$$, $$comparaison : signes contraires → le négatif est plus petit ; même signe → comparer les distances à zéro (inversé si négatifs)$$]::text[],
        'example', jsonb_build_object('statement', $$Compare -110 et -2,5.$$, 'solution', $$La distance à zéro de -110 (110) est plus grande que celle de -2,5 (2,5), donc -110 < -2,5.$$),
        'fixation', jsonb_build_object('question', $$Compare -3 et 1,5.$$, 'solution', $$-3 est négatif et 1,5 est positif, donc -3 < 1,5.$$)
      ),
      jsonb_build_object(
        'heading', $$Somme algébrique et produit de nombres décimaux relatifs$$,
        'body', $$La différence a - b équivaut à a + opp(b) (l'opposé de b). Une somme algébrique se calcule en la transformant en somme, puis en regroupant les nombres de même signe avant de calculer. Pour un produit : si les deux nombres ont le même signe, le produit est positif ; sinon il est négatif ; on multiplie ensuite les distances à zéro. Pour plusieurs facteurs, le produit est positif si le nombre de facteurs négatifs est pair, négatif s'il est impair (et nul si un facteur est zéro).$$,
        'highlights', array[$$a - b = a + opp(b)$$, $$produit : signes identiques → positif ; signes contraires → négatif$$, $$produit de plusieurs facteurs : nombre pair de négatifs → positif ; impair → négatif$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule P = (-2)×(+5)×(-4)×(-2).$$, 'solution', $$P contient 3 facteurs négatifs (nombre impair) donc P est négatif : P = -(2×5×4×2) = -80.$$),
        'fixation', jsonb_build_object('question', $$Calcule (-3) - (-5).$$, 'solution', $$(-3) - (-5) = (-3) + (+5) = 2.$$)
      ),
      jsonb_build_object(
        'heading', $$L'équation du type x + a = b$$,
        'body', $$Dans l'équation x + a = b (a et b connus), x est l'inconnue. Cette équation admet pour solution unique le nombre b - a. Résoudre l'équation, c'est trouver cette valeur de x, que l'on peut vérifier en la remplaçant dans l'équation de départ.$$,
        'highlights', array[$$x + a = b ⟹ x = b - a$$]::text[],
        'example', jsonb_build_object('statement', $$Résous l'équation x + (-5) = (-2).$$, 'solution', $$x = (-2) - (-5) = (-2) + (+5) = +3. Vérification : (+3) + (-5) = -2. ✓$$),
        'fixation', jsonb_build_object('question', $$Résous x + (+2) = -3.$$, 'solution', $$x = -3 - (+2) = -3 + (-2) = -5.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une mère souhaite passer ses congés de Noël en France pour une convalescence, et hésite entre plusieurs villes selon leurs températures : Besançon -15°C, Calais -12°C, Dieppe -8°C, Évian -17°C, Grenoble -20°C, Strasbourg -7°C, Paris -2°C. Elle veut choisir la ville où il fait le moins froid.$$,
      'questions', array[
        $$Range ces températures par ordre croissant.$$,
        $$Indique quelle ville elle doit choisir.$$,
        $$Explique pourquoi cette ville est la plus adaptée.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Range dans l'ordre croissant : 16 ; 1 ; -24 ; -24,5 ; +5 ; 3 ; 0.$$,
      'hint', $$Les nombres négatifs les plus "grands en valeur absolue" sont les plus petits.$$,
      'expected', $$-24,5 < -24 < 0 < 1 < 3 < +5 < 16.$$
    ),
    jsonb_build_object(
      'question', $$Calcule (+9,5) - (-16,2).$$,
      'hint', $$Transforme la soustraction en addition de l'opposé.$$,
      'expected', $$(+9,5) + (+16,2) = 25,7.$$
    ),
    jsonb_build_object(
      'question', $$Calcule (-5) × (+3,4).$$,
      'hint', $$Signes contraires → produit négatif.$$,
      'expected', $$-17.$$
    ),
    jsonb_build_object(
      'question', $$Résous l'équation x - 5 = -4.$$,
      'hint', $$Réécris x - 5 comme x + (-5).$$,
      'expected', $$x = -4 + 5 = +1.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-nombres-decimaux-relatifs';
