-- Physique-Chimie 4ème — Tension alternative sinusoïdale.
-- Real content sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2012 "Lecon7_Tension alternative
-- sinusoïdale", resource id 16440 ("Je lis le résumé de la leçon"), PDF
-- "PC 4ème_L7_Tension alternative sinusoïdale.pdf" (5 pages, thème
-- Courants et tensions alternatifs). Rewritten in original wording —
-- paraphrased, not copied from the source PDF — keeping the same
-- technical content: the sinusoidal shape seen on an oscilloscope, period
-- T and frequency N = 1/T, reading Umax and T from a graph using the
-- division scale, the relation Umax = 1,41 × Ueff, and the Ivorian secteur
-- (220 V, 50 Hz, Umax ≈ 310 V).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un lycée reçoit en don un générateur de tension alternative dont la fiche technique a été perdue. Pour la reconstituer, des élèves de 4ème décident de brancher ce générateur à un oscilloscope, d'observer la courbe obtenue, puis de déterminer toutes les grandeurs qui caractérisent une tension alternative sinusoïdale : sa période, sa fréquence, sa tension maximale et sa tension efficace.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Visualisation à l'oscilloscope$$,
        'body', $$En reliant un générateur à un oscilloscope, on observe parfois une courbe régulière et ondulée qui s'annule et change de sens de façon répétée : sa valeur est tantôt positive, tantôt négative. Une tension qui donne cette forme caractéristique de vagues régulières est appelée tension alternative sinusoïdale.$$,
        'highlights', array[$$oscilloscope$$, $$tension alternative sinusoïdale$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une tension alternative sinusoïdale est une tension tantôt positive, tantôt négative, dont la courbe à l'oscilloscope a la forme régulière d'une sinusoïde.$$),
        'example', jsonb_build_object('statement', $$Sur l'écran d'un oscilloscope relié à un générateur, la courbe observée est une droite horizontale qui ne varie jamais. S'agit-il d'une tension alternative sinusoïdale ?$$, 'solution', $$Non : une droite horizontale constante indique une tension continue, pas une tension alternative sinusoïdale, qui doit onduler et changer de signe.$$),
        'fixation', jsonb_build_object('question', $$Quelle forme caractéristique prend, à l'oscilloscope, une tension alternative sinusoïdale ?$$, 'solution', $$La forme régulière et ondulée d'une sinusoïde, oscillant entre des valeurs positives et négatives.$$)
      ),
      jsonb_build_object(
        'heading', $$Période et fréquence$$,
        'body', $$La période, notée T et exprimée en secondes, est la durée minimale nécessaire pour qu'une alternance positive suivie d'une alternance négative se reproduise à l'identique. La fréquence, notée N et exprimée en hertz (Hz), indique le nombre de fois que ce motif se répète en une seconde : elle est l'inverse de la période.$$,
        'highlights', array[$$période$$, $$fréquence$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$N = 1/T, où T est la période en secondes (s) et N la fréquence en hertz (Hz).$$),
        'example', jsonb_build_object('statement', $$Sur un graphique, chaque carreau horizontal représente 5 ms, et la période s'étend sur 4 carreaux. Calcule la période, puis la fréquence.$$, 'solution', $$T = 5 ms × 4 = 20 ms = 0,02 s. N = 1/T = 1/0,02 = 50 Hz.$$),
        'fixation', jsonb_build_object('question', $$Une tension alternative a une fréquence N = 100 Hz. Calcule sa période.$$, 'solution', $$T = 1/N = 1/100 = 0,01 s.$$)
      ),
      jsonb_build_object(
        'heading', $$Lecture de la tension maximale sur un graphique$$,
        'body', $$La tension maximale, notée Umax et exprimée en volts, est la plus grande valeur atteinte par la courbe. Sur l'écran d'un oscilloscope ou un graphique quadrillé, on la détermine en comptant le nombre de carreaux verticaux entre l'axe des temps et le sommet de la courbe, puis en multipliant ce nombre par la valeur d'un carreau (l'échelle verticale).$$,
        'highlights', array[$$tension maximale$$, $$échelle$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Umax se lit en comptant le nombre de divisions verticales entre l'axe des temps et le sommet de la courbe, multiplié par la valeur d'une division (en V par carreau).$$),
        'example', jsonb_build_object('statement', $$Sur un graphique où chaque carreau vertical vaut 5 V, le sommet de la sinusoïde se situe à 3 carreaux au-dessus de l'axe des temps. Quelle est la tension maximale ?$$, 'solution', $$Umax = 5 V × 3 = 15 V.$$),
        'fixation', jsonb_build_object('question', $$Sur un graphique où chaque carreau vertical vaut 78 V, le sommet de la courbe se situe à 2 carreaux au-dessus de l'axe des temps. Quelle est la tension maximale ?$$, 'solution', $$Umax = 78 V × 2 = 156 V.$$)
      ),
      jsonb_build_object(
        'heading', $$Tension efficace et tension du secteur$$,
        'body', $$La tension efficace, notée Ueff et exprimée en volts, est la valeur mesurée directement par un voltmètre branché aux bornes du générateur. Elle est liée à la tension maximale par une relation constante : Umax vaut environ 1,41 fois Ueff. C'est cette valeur efficace qui figure sur les appareils électroménagers ; en Côte d'Ivoire, le secteur distribué par la CIE a pour valeur efficace 220 V et pour fréquence 50 Hz.$$,
        'highlights', array[$$tension efficace$$, $$secteur ivoirien$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Umax = 1,41 × Ueff (ou Ueff = Umax / 1,41). Secteur ivoirien : Ueff = 220 V, N = 50 Hz, T = 0,02 s.$$),
        'example', jsonb_build_object('statement', $$Calcule la tension maximale du secteur ivoirien, sachant que sa valeur efficace est 220 V.$$, 'solution', $$Umax = 220 × 1,41 = 310,2 V, soit environ 310 V.$$),
        'fixation', jsonb_build_object('question', $$Une tension alternative sinusoïdale a une tension maximale Umax = 20 V. Calcule sa tension efficace.$$, 'solution', $$Ueff = Umax / 1,41 = 20 / 1,41 ≈ 14,2 V.$$),
        'table', jsonb_build_object(
          'headers', array[$$Grandeur$$, $$Symbole$$, $$Unité$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Période$$, $$T$$, $$seconde (s)$$),
            jsonb_build_array($$Fréquence$$, $$N$$, $$hertz (Hz)$$),
            jsonb_build_array($$Tension maximale$$, $$Umax$$, $$volt (V)$$),
            jsonb_build_array($$Tension efficace$$, $$Ueff$$, $$volt (V)$$)
          )
        )
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une séance de travaux pratiques, un élève relève l'inscription N = 100 Hz sur un appareil, puis mesure au voltmètre une tension efficace de 200 V.$$,
      'questions', array[
        $$Quelle est la nature de cette tension, sachant qu'elle est produite par un générateur d'alternateur ?$$,
        $$Calcule la période T correspondant à cette fréquence.$$,
        $$Calcule la tension maximale de cet appareil.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite les quatre grandeurs qui caractérisent une tension alternative sinusoïdale.$$,
      'hint', $$Pense au temps (deux grandeurs) et à la tension (deux grandeurs).$$,
      'expected', $$La période, la fréquence, la tension maximale et la tension efficace.$$
    ),
    jsonb_build_object(
      'question', $$Une tension alternative sinusoïdale a une période T = 0,04 s. Calcule sa fréquence.$$,
      'hint', $$Utilise N = 1/T.$$,
      'expected', $$N = 1/0,04 = 25 Hz.$$
    ),
    jsonb_build_object(
      'question', $$Sur un graphique où chaque carreau horizontal vaut 5 ms, la période occupe 4 carreaux. Calcule cette période, puis la fréquence correspondante.$$,
      'hint', $$Multiplie le nombre de carreaux par la valeur d'un carreau, puis utilise N = 1/T.$$,
      'expected', $$T = 5 ms × 4 = 20 ms = 0,02 s. N = 1/0,02 = 50 Hz.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont la valeur efficace et la fréquence usuelles de la tension du secteur en Côte d'Ivoire, et quelle est sa tension maximale approximative ?$$,
      'hint', $$Utilise la relation Umax = 1,41 × Ueff.$$,
      'expected', $$Ueff = 220 V, N = 50 Hz, et Umax = 220 × 1,41 ≈ 310 V.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-tension-alternative-sinusoidale';
