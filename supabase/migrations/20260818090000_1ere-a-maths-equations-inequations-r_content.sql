-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Mathématiques, categoryid=122.
-- Moodle course id 865: "MATHS_1A L1: ÉQUATIONS ET INEQUATIONS DANS R"
-- (https://lyc.ecole-ci.org/course/view.php?id=865), resource id 4029.
-- Contenu rédigé/reformulé à partir du PDF source (polynômes du second
-- degré, discriminant, résolution/factorisation, signe d'un polynôme du
-- second degré, équations et inéquations rationnelles ax+b/(cx+d)). Les
-- formules et propriétés mathématiques sont reprises telles quelles (ce
-- sont des faits, pas des formulations à reformuler) ; les explications et
-- la situation d'apprentissage/complexe sont réécrites avec d'autres
-- valeurs numériques que la source. Aucune phrase copiée verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-maths-equations-inequations-r',
  '1ere',
  'A',
  'mathematiques',
  $$Équations et inéquations dans ℝ$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un maraîcher exploite un terrain rectangulaire de 6 m de large sur 9 m de long. Il souhaite l'agrandir en ajoutant une même longueur x à chacun des deux côtés, pour obtenir un terrain d'aire 112 m². Ses enfants, élèves en 1ère A, veulent l'aider à déterminer cette longueur x à ajouter.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Polynôme du second degré et discriminant$$,
        'body', $$Une expression de la forme ax²+bx+c, où a, b et c sont des nombres réels avec a≠0, est appelée polynôme du second degré (a est le coefficient du terme de degré 2, b celui du terme de degré 1, c le terme constant). Pour une équation du second degré ax²+bx+c=0, on définit le discriminant par la formule Δ=b²−4ac ; c'est ce nombre qui va renseigner sur l'existence et le nombre de solutions.$$,
        'highlights', array[$$polynôme du second degré$$, $$discriminant$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Pour ax²+bx+c=0 (a≠0), le discriminant est Δ=b²−4ac.$$),
        'example', jsonb_build_object('statement', $$Calcule les coefficients et le discriminant du polynôme 2x²+3x−2.$$, 'solution', $$a=2, b=3, c=−2. Δ=3²−4×2×(−2)=9+16=25.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les coefficients a, b et c du polynôme −5x²+2x+7 ?$$, 'solution', $$a=−5, b=2, c=7.$$)
      ),
      jsonb_build_object(
        'heading', $$Résoudre une équation du second degré$$,
        'body', $$Pour résoudre ax²+bx+c=0 (a≠0) dans ℝ, on calcule Δ=b²−4ac : si Δ<0, l'équation n'a pas de solution réelle ; si Δ=0, elle admet une unique solution x0=−b/(2a) ; si Δ>0, elle admet deux solutions distinctes x1=(−b−√Δ)/(2a) et x2=(−b+√Δ)/(2a). Ces solutions sont aussi appelées les zéros ou racines du polynôme.$$,
        'highlights', array[$$Δ<0 : aucune solution$$, $$Δ=0 : une solution$$, $$Δ>0 : deux solutions$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Signe de Δ$$, $$Nombre de solutions$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Δ < 0$$, $$Aucune solution réelle$$),
            jsonb_build_array($$Δ = 0$$, $$Une solution : x0 = −b/(2a)$$),
            jsonb_build_array($$Δ > 0$$, $$Deux solutions : x1, x2 = (−b∓√Δ)/(2a)$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Résous dans ℝ l'équation x²−5x+6=0.$$, 'solution', $$Δ=(−5)²−4×1×6=25−24=1>0. x1=(5−1)/2=2 et x2=(5+1)/2=3. S={2;3}.$$),
        'fixation', jsonb_build_object('question', $$Combien de solutions admet l'équation x²+2x+5=0 ?$$, 'solution', $$Δ=2²−4×1×5=4−20=−16<0, donc aucune solution réelle.$$)
      ),
      jsonb_build_object(
        'heading', $$Signe d'un polynôme et inéquations du second degré$$,
        'body', $$Le signe d'un polynôme P(x)=ax²+bx+c dépend de Δ : si Δ<0, P(x) garde toujours le signe de a ; si Δ=0, P(x) a le signe de a sauf en x0 où il s'annule ; si Δ>0 (avec x1<x2), P(x) est du signe de a à l'extérieur de [x1;x2] et du signe contraire de a entre x1 et x2. Une inéquation du second degré (du type P(x)>0, ≥0, <0 ou ≤0) se résout en étudiant ce signe puis en lisant l'intervalle solution dans le tableau de signe.$$,
        'highlights', array[$$signe à l'extérieur des racines$$, $$signe contraire entre les racines$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans ℝ l'inéquation −x²+2x+3≥0.$$, 'solution', $$Δ=2²−4×(−1)×3=4+12=16>0 ; racines x1=−1, x2=3. Comme a=−1<0, P(x) est négatif à l'extérieur de [−1;3] et positif entre les racines. S=[−1;3].$$),
        'fixation', jsonb_build_object('question', $$Le polynôme P(x)=2x²−4x+2 a un discriminant nul. Quel est son signe pour x≠1 ?$$, 'solution', $$Il garde le signe de a (a=2>0), donc P(x)>0 pour tout x≠1, et P(1)=0.$$)
      ),
      jsonb_build_object(
        'heading', $$Équations et inéquations rationnelles (ax+b)/(cx+d)$$,
        'body', $$Pour résoudre (ax+b)/(cx+d)=0, on détermine d'abord la contrainte cx+d≠0, puis on résout ax+b=0 : la solution n'est retenue que si elle respecte la contrainte. Pour une inéquation comme (ax+b)/(cx+d)≥0, on étudie séparément le signe du numérateur et du dénominateur dans un même tableau de signes, on en déduit le signe du quotient, puis on lit l'intervalle solution (en excluant toujours la valeur qui annule le dénominateur).$$,
        'highlights', array[$$contrainte sur l'inconnue$$, $$tableau de signes du quotient$$]::text[],
        'example', jsonb_build_object('statement', $$Résous dans ℝ l'équation (2x−4)/(x+1)=0.$$, 'solution', $$Contrainte : x≠−1. 2x−4=0 ⟺ x=2. Comme 2≠−1, S={2}.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi doit-on toujours écarter la valeur qui annule le dénominateur, même si elle vérifie le numérateur ?$$, 'solution', $$Parce que le quotient n'est pas défini quand le dénominateur s'annule ; cette valeur ne peut donc jamais être solution.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le maraîcher veut agrandir son terrain rectangulaire de 6 m sur 9 m en ajoutant une même longueur x à chaque côté, pour atteindre une aire de 112 m². Ses enfants doivent déterminer la valeur de x à l'aide d'une équation du second degré.$$,
      'questions', array[
        $$Exprime l'aire du nouveau terrain en fonction de x, puis montre que l'équation à résoudre est x²+15x−58=0.$$,
        $$Résous cette équation dans ℝ en calculant son discriminant.$$,
        $$Parmi les solutions trouvées, laquelle correspond réellement à une longueur à ajouter ? Justifie.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule le discriminant du polynôme x²−4x+4.$$,
      'hint', $$Δ = b² − 4ac.$$,
      'expected', $$Δ = (−4)² − 4×1×4 = 16−16 = 0.$$
    ),
    jsonb_build_object(
      'question', $$Résous dans ℝ l'équation x²−9=0.$$,
      'hint', $$C'est une différence de carrés : a=1, b=0, c=−9.$$,
      'expected', $$Δ=0²−4×1×(−9)=36>0. x1=−3 et x2=3. S={−3;3}.$$
    ),
    jsonb_build_object(
      'question', $$Le polynôme P(x)=x²+x+1 a un discriminant négatif. Que peut-on en conclure sur son signe ?$$,
      'hint', $$Quand Δ<0, le polynôme garde un seul signe partout.$$,
      'expected', $$P(x) garde toujours le signe de a (ici a=1>0), donc P(x)>0 pour tout réel x.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la contrainte sur x pour que (x+2)/(3x−6) soit défini ?$$,
      'hint', $$Le dénominateur ne doit pas être nul.$$,
      'expected', $$3x−6≠0, donc x≠2.$$
    )
  ),
  now()
);
