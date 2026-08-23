-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 1935: "Leçon12: Statistiques"
-- (https://coll.ecole-ci.org/course/view.php?id=1935), resource id 15516.
-- Contenu réécrit à partir du PDF source (programme officiel MENA) ;
-- situation d'apprentissage, définitions et exercices reformulés, non
-- copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour le baptême de Kodjo, élève en 6ème, son père lui demande d'inviter ses amis de classe et de connaître leurs plats préférés parmi Riz, Attiéké et Igname. L'enquête donne une longue liste de réponses. Pour mieux planifier la restauration, les élèves décident d'organiser ces données dans un tableau et de calculer la fréquence d'apparition de chaque plat.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Effectif et effectif total$$,
        'body', $$L'effectif d'une donnée est le nombre de fois qu'elle apparaît. L'effectif total est la somme des effectifs de toutes les données. Exemple : dans une série de 50 notes, si la note 10 apparaît 7 fois, son effectif est 7 ; l'effectif total de la série est 50.$$,
        'highlights', array[$$effectif = nombre d'apparitions d'une donnée$$, $$effectif total = somme de tous les effectifs$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans une série de 20 lancers de dé, le chiffre 6 apparaît 5 fois. Quel est son effectif ?$$, 'solution', $$5.$$)
      ),
      jsonb_build_object(
        'heading', $$Organisation en tableau des effectifs$$,
        'body', $$On rassemble les données et leurs effectifs dans un tableau à deux lignes : les valeurs possibles sur la première ligne, leurs effectifs sur la seconde, avec une colonne « total » égale à l'effectif total. On appelle cela un tableau des effectifs.$$,
        'highlights', array[$$tableau des effectifs : valeurs en 1ère ligne, effectifs en 2ème ligne$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit vérifier la somme de tous les effectifs d'un tableau ?$$, 'solution', $$Elle doit être égale à l'effectif total (le nombre total de données recueillies).$$)
      ),
      jsonb_build_object(
        'heading', $$Fréquence et fréquence en pourcentage$$,
        'body', $$La fréquence d'une donnée est le quotient de son effectif par l'effectif total : fréquence = effectif / effectif total. La fréquence en pourcentage s'obtient en multipliant la fréquence par 100 : fréquence(%) = (effectif / effectif total) × 100. Effectifs, fréquences et fréquences en pourcentage sont trois grandeurs proportionnelles.$$,
        'highlights', array[$$fréquence = effectif ÷ effectif total$$, $$fréquence en % = fréquence × 100$$, $$la somme des fréquences vaut toujours 1 (ou 100%)$$]::text[],
        'example', jsonb_build_object('statement', $$Sur 50 notes, la note 8 a un effectif de 8. Calcule sa fréquence et sa fréquence en pourcentage.$$, 'solution', $$Fréquence = 8/50 = 0,16. Fréquence en % = 0,16 × 100 = 16%.$$),
        'fixation', jsonb_build_object('question', $$Que vaut la somme de toutes les fréquences d'un tableau de fréquences ?$$, 'solution', $$1 (soit 100% en fréquence-pourcentage).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pendant l'arrêt des cours dû au Covid-19, une enquête sur les canaux de formation à distance utilisés par les élèves de 6ème d'un établissement de Bondoukou donne : Internet 50 élèves, SMS 260, Radio locale 224, Télévision 90, Courrier 26. Le directeur régional veut encourager les canaux accessibles à au moins 13% des élèves identifiés.$$,
      'questions', array[
        $$Calcule l'effectif total de cette enquête (somme des 5 canaux).$$,
        $$Dresse le tableau des fréquences en pourcentage pour chaque canal.$$,
        $$Identifie les canaux de formation à distance accessibles à au moins 13% des élèves.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Seri a obtenu les notes suivantes : 12, 8, 13, 11, 9, 8, 12, 12, 6, 10, 14, 12, 9. Quel est l'effectif total ?$$,
      'hint', $$Compte le nombre total de notes dans la liste.$$,
      'expected', $$13 (il y a 13 notes dans la liste).$$
    ),
    jsonb_build_object(
      'question', $$Dans la même liste de notes de Seri, quel est l'effectif de la note 12 ?$$,
      'hint', $$Compte combien de fois 12 apparaît dans la liste.$$,
      'expected', $$4 (la note 12 apparaît 4 fois).$$
    ),
    jsonb_build_object(
      'question', $$Un tableau donne les effectifs des groupes sanguins d'une classe : A=20, O=10, B=8, AB=2. Quel est l'effectif total, et quelle est la fréquence du groupe A ?$$,
      'hint', $$Additionne d'abord tous les effectifs.$$,
      'expected', $$Effectif total = 20+10+8+2 = 40. Fréquence du groupe A = 20/40 = 0,5.$$
    ),
    jsonb_build_object(
      'question', $$Un tableau de fréquences en pourcentage donne 30% pour une taille de 120 cm, avec un effectif total de 60. Quel est l'effectif correspondant ?$$,
      'hint', $$effectif = (fréquence % ÷ 100) × effectif total.$$,
      'expected', $$(30/100) × 60 = 18.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-statistiques';
