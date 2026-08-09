-- Physique-Chimie 3ème — Le conducteur ohmique.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème electricity competency (loi
-- d'Ohm U=RI, caractéristique linéaire par l'origine, association en
-- série). Original wording throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans un circuit électrique série, un élève branche successivement deux composants inconnus et mesure, pour chacun, la tension à ses bornes et l'intensité du courant qui le traverse. Pour l'un des deux, le rapport tension sur intensité reste toujours le même, quelle que soit la valeur testée. Qu'est-ce que cela révèle sur ce composant ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le conducteur ohmique$$,
        'body', $$Un conducteur ohmique, aussi appelé résistor, est un composant électrique qui s'oppose au passage du courant. Cette opposition, appelée résistance, est une grandeur caractéristique du composant, qui ne dépend ni de la tension ni de l'intensité qui le traversent.$$,
        'highlights', array[$$conducteur ohmique$$, $$résistance$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un conducteur ohmique est un dipôle dont la tension à ses bornes est proportionnelle à l'intensité du courant qui le traverse. Sa résistance R, exprimée en ohms (Ω), caractérise son opposition au passage du courant.$$),
        'example', jsonb_build_object('statement', $$On teste plusieurs valeurs de tension aux bornes d'un même conducteur ohmique, et on mesure l'intensité correspondante à chaque fois. On observe que le rapport U/I reste constant. Que peut-on en conclure ?$$, 'solution', $$Comme U/I reste constant, la tension est proportionnelle à l'intensité : ce composant est bien un conducteur ohmique.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la grandeur, exprimée en ohms, qui caractérise l'opposition d'un conducteur ohmique au passage du courant ?$$, 'solution', $$C'est la résistance.$$)
      ),
      jsonb_build_object(
        'heading', $$Caractéristique intensité-tension$$,
        'body', $$La caractéristique d'un conducteur ohmique est la courbe représentant la tension U à ses bornes en fonction de l'intensité I qui le traverse. Pour un conducteur ohmique, cette caractéristique est une droite qui passe par l'origine du repère.$$,
        'highlights', array[$$caractéristique$$, $$proportionnalité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La caractéristique U=f(I) d'un conducteur ohmique est une droite passant par l'origine : la tension à ses bornes est proportionnelle à l'intensité du courant qui le traverse.$$),
        'example', jsonb_build_object('statement', $$Pour un conducteur ohmique, on mesure U=3 V pour I=0,5 A. Quelle tension mesurera-t-on pour I=1 A ?$$, 'solution', $$U et I sont proportionnels (rapport constant U/I=3/0,5=6), donc pour I=1 A, U=6×1=6 V.$$),
        'fixation', jsonb_build_object('question', $$La caractéristique d'un dipôle est une courbe qui ne passe pas par l'origine. Ce dipôle est-il un conducteur ohmique ?$$, 'solution', $$Non, car la caractéristique d'un conducteur ohmique doit être une droite passant par l'origine.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(160, 160),
          'points', jsonb_build_array(
            jsonb_build_object('x', 20, 'y', 140, 'label', $$O$$),
            jsonb_build_object('x', 150, 'y', 140, 'label', $$I$$),
            jsonb_build_object('x', 20, 'y', 10, 'label', $$U$$),
            jsonb_build_object('x', 130, 'y', 30)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(0,2), jsonb_build_array(0,3))
        )
      ),
      jsonb_build_object(
        'heading', $$Loi d'Ohm$$,
        'body', $$La loi d'Ohm relie directement la tension aux bornes d'un conducteur ohmique, sa résistance et l'intensité du courant qui le traverse.$$,
        'highlights', array[$$loi d'Ohm$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$U=R×I, où U est la tension en volts (V), R la résistance en ohms (Ω), et I l'intensité en ampères (A).$$),
        'example', jsonb_build_object('statement', $$Un conducteur ohmique de résistance 20 Ω est traversé par un courant de 0,4 A. Calcule la tension à ses bornes.$$, 'solution', $$U=R×I=20×0,4=8 V.$$),
        'fixation', jsonb_build_object('question', $$Un conducteur ohmique de résistance 50 Ω est soumis à une tension de 10 V. Calcule l'intensité du courant qui le traverse.$$, 'solution', $$I=U/R=10/50=0,2 A.$$)
      ),
      jsonb_build_object(
        'heading', $$Association de conducteurs ohmiques en série$$,
        'body', $$Quand plusieurs conducteurs ohmiques sont branchés en série dans un circuit, ils sont traversés par la même intensité, et leurs résistances s'ajoutent pour donner une résistance équivalente unique.$$,
        'highlights', array[$$association en série$$, $$résistance équivalente$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour des conducteurs ohmiques en série, la résistance équivalente est la somme des résistances : Réq=R1+R2+... L'intensité du courant est la même en tout point du circuit série.$$),
        'example', jsonb_build_object('statement', $$Deux conducteurs ohmiques de résistances 15 Ω et 25 Ω sont associés en série. Calcule leur résistance équivalente.$$, 'solution', $$Réq=R1+R2=15+25=40 Ω.$$),
        'fixation', jsonb_build_object('question', $$Trois conducteurs ohmiques de 10 Ω, 20 Ω et 30 Ω sont associés en série et traversés par un courant de 0,5 A. Calcule la tension totale aux bornes de l'association.$$, 'solution', $$Réq=10+20+30=60 Ω. U=Réq×I=60×0,5=30 V.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un circuit électrique série alimenté par un générateur, un élève place deux conducteurs ohmiques de résistances 40 Ω et 60 Ω, et mesure une intensité de 0,3 A.$$,
      'questions', array[
        $$Calcule la résistance équivalente de l'association.$$,
        $$Calcule la tension aux bornes de chaque conducteur ohmique.$$,
        $$Calcule la tension totale délivrée par le générateur.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un conducteur ohmique de résistance 25 Ω est traversé par un courant de 0,8 A. Calcule la tension à ses bornes.$$,
      'hint', $$Utilise U=R×I.$$,
      'expected', $$U=25×0,8=20 V.$$
    ),
    jsonb_build_object(
      'question', $$Un conducteur ohmique est soumis à une tension de 12 V et traversé par un courant de 0,3 A. Calcule sa résistance.$$,
      'hint', $$Utilise R=U/I.$$,
      'expected', $$R=12/0,3=40 Ω.$$
    ),
    jsonb_build_object(
      'question', $$Deux conducteurs ohmiques de résistances 30 Ω et 70 Ω sont associés en série. Calcule leur résistance équivalente.$$,
      'hint', $$Additionne les deux résistances.$$,
      'expected', $$Réq=30+70=100 Ω.$$
    ),
    jsonb_build_object(
      'question', $$La caractéristique d'un dipôle est une droite qui passe par l'origine. Que peut-on en conclure sur ce dipôle ?$$,
      'hint', $$Pense à la définition d'un conducteur ohmique.$$,
      'expected', $$C'est un conducteur ohmique, car sa tension est proportionnelle à l'intensité qui le traverse (caractéristique linéaire passant par l'origine).$$
    )
  ),
  content_generated_at = now()
where id = 'pc-conducteur-ohmique';
