-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Organisation et traitement de données).
-- Cours : "Leçon 11 : Statistique". Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices
-- reformulés, valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour son anniversaire, Ali (élève de 5ème) invite ses camarades à un cocktail dans un restaurant proposant quatre menus : attiéké-poisson, frites-poulet, alloco-poulet et riz gras-poisson. Une enquête est menée auprès des invités pour établir le budget. Les élèves utilisent les résultats de cette enquête pour construire des diagrammes et guider le père d'Ali dans ses commandes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulaire statistique$$,
        'body', $$L'ensemble des personnes interrogées forme la population ; l'objet de l'étude est le caractère ; les différentes réponses obtenues sont les modalités. Un caractère est qualitatif si ses modalités ne sont pas mesurables (ex : groupe sanguin), quantitatif sinon. L'effectif d'une modalité est le nombre de fois qu'elle est donnée ; l'effectif total est la somme de tous les effectifs. La fréquence d'une modalité = effectif de la modalité ÷ effectif total.$$,
        'highlights', array[$$population = ensemble étudié ; caractère = objet de l'étude ; modalités = réponses possibles$$, $$qualitatif (non mesurable) vs quantitatif (mesurable)$$, $$fréquence = effectif de la modalité ÷ effectif total$$]::text[],
        'example', jsonb_build_object('statement', $$Un tableau donne les appels téléphoniques par préfixe : 01→50, 05→70, 07→80, 60→55, 66→45. Calcule la fréquence de la modalité 66.$$, 'solution', $$Effectif total = 50+70+80+55+45 = 300. Fréquence de 66 = 45/300 = 0,15 soit 15%.$$),
        'fixation', jsonb_build_object('question', $$Le groupe sanguin d'un élève est-il un caractère qualitatif ou quantitatif ?$$, 'solution', $$Qualitatif, car les modalités (O, A, AB, B) ne sont pas mesurables.$$)
      ),
      jsonb_build_object(
        'heading', $$Représentations graphiques : diagramme en bâtons et en bandes$$,
        'body', $$Un diagramme en bâtons représente chaque modalité par un bâton dont la hauteur est l'effectif (ou la fréquence). Un diagramme en bandes représente chaque modalité par un rectangle de même largeur, dont la longueur est l'effectif de la modalité.$$,
        'highlights', array[$$diagramme en bâtons : hauteur = effectif de la modalité$$, $$diagramme en bandes : rectangles de même largeur, longueur = effectif$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans un diagramme en bâtons, que représente la hauteur d'un bâton ?$$, 'solution', $$L'effectif (ou la fréquence) de la modalité correspondante.$$)
      ),
      jsonb_build_object(
        'heading', $$Passer des fréquences aux effectifs$$,
        'body', $$Quand une enquête donne des fréquences en pourcentage, on retrouve l'effectif d'une modalité en multipliant sa fréquence par l'effectif total de la population, puis en divisant par 100 : effectif = (fréquence % × effectif total) ÷ 100.$$,
        'highlights', array[$$effectif d'une modalité = (fréquence% × effectif total) ÷ 100$$]::text[],
        'example', jsonb_build_object('statement', $$Sur 60 élèves interrogés sur leurs loisirs, 40% ont choisi "musique". Combien d'élèves cela représente-t-il ?$$, 'solution', $$(40 × 60) ÷ 100 = 24 élèves.$$),
        'fixation', jsonb_build_object('question', $$Sur 60 élèves, 25% préfèrent la lecture. Combien d'élèves cela fait-il ?$$, 'solution', $$(25 × 60) ÷ 100 = 15 élèves.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un éducateur mène une enquête auprès de 60 élèves de 5ème sur leurs loisirs (un seul loisir par élève) : lecture 25%, musique 40%, cinéma 15%, sport 20%. Il doit présenter ces résultats au proviseur sous forme de diagramme et connaître les effectifs de chaque loisir.$$,
      'questions', array[
        $$Construis (ou décris) le diagramme à bandes de ces fréquences.$$,
        $$Calcule l'effectif de chaque modalité (lecture, musique, cinéma, sport).$$,
        $$Vérifie que la somme des effectifs calculés est bien égale à 60.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans une enquête sur 25 conseillers municipaux (F=favorable, D=défavorable, A=abstention), le caractère étudié est-il qualitatif ou quantitatif ?$$,
      'hint', $$Les modalités F, D, A ne sont pas des nombres.$$,
      'expected', $$Qualitatif.$$
    ),
    jsonb_build_object(
      'question', $$14 coureurs ont parcouru un nombre de tours parmi : 5, 7, 8, 12, 14, 16. Quel est l'effectif total de cette série ?$$,
      'hint', $$L'effectif total est le nombre de coureurs interrogés.$$,
      'expected', $$14.$$
    ),
    jsonb_build_object(
      'question', $$Sur 35 élèves récompensés (12 ordinateurs, 13 lots de livres, 10 calculatrices), quelle est la fréquence de "lot de livres" ?$$,
      'hint', $$Fréquence = effectif de la modalité ÷ effectif total × 100.$$,
      'expected', $$13/35 × 100 ≈ 37,14%.$$
    ),
    jsonb_build_object(
      'question', $$Sur un diagramme en bâtons de notes, la modalité "9" a un effectif de 16 et la modalité "13" a un effectif de 12. Si ce sont les deux seules modalités de la série, quel est l'effectif total ?$$,
      'hint', $$Additionne les effectifs des deux modalités.$$,
      'expected', $$16 + 12 = 28 (ou davantage si d'autres modalités existent : dans l'exemple du cours, l'effectif total de la série complète est 52).$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-statistique';
