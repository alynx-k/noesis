-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- SVT (categoryid=52).
-- Cours : "Leçon 2 : La germination d'une graine" (id 2061). Contenu
-- réécrit à partir du PDF source ; situation d'apprentissage, définitions
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 6ème enfouissent dans le sol des graines d'arachide sans les trier et les arrosent régulièrement. Au bout de quelques jours, ils remarquent que les graines ont germé, mais pas toutes. Leur professeur leur explique que la germination dépend de facteurs internes et externes, qu'ils décident d'étudier.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les facteurs internes : état et âge de la graine$$,
        'body', $$Une expérience sème des graines saines et matures (boîte A), abîmées et matures (boîte B), et immatures (boîte C), toutes arrosées. Une semaine plus tard, seules les graines de la boîte A germent. Les graines saines et matures germent car leur germe est bien développé et apte à germer ; les graines abîmées ne germent pas car leur germe est détruit ; les graines immatures ne germent pas car leur germe n'est pas développé.$$,
        'highlights', array[$$germination possible seulement si la graine est saine ET mature$$, $$graine abîmée = germe détruit ; graine immature = germe non développé$$]::text[],
        'fixation', jsonb_build_object('question', $$Une graine mature mais abîmée peut-elle germer ?$$, 'solution', $$Non, car son germe est détruit.$$)
      ),
      jsonb_build_object(
        'heading', $$Les facteurs externes : eau, air, température$$,
        'body', $$Trois expériences testent chaque facteur : (1) l'eau — sol sec, sol régulièrement arrosé, sol inondé : seul le sol régulièrement arrosé permet la germination (ni sécheresse ni excès d'eau) ; (2) l'air — sol aéré vs sol tassé : seul le sol aéré permet la germination (le sol tassé asphyxie la graine) ; (3) la température — 100°C (étuve), 25-30°C (ambiante), 0°C (congélateur) : seule la température ambiante permet la germination (le froid l'empêche, la forte chaleur détruit la graine).$$,
        'highlights', array[$$eau : ni sec ni inondé, quantité suffisante et convenable$$, $$air : sol aéré nécessaire (sol tassé = asphyxie)$$, $$température : ambiante (25-30°C) favorable ; froid l'empêche, forte chaleur détruit$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les graines semées dans un sol tassé ne germent-elles pas ?$$, 'solution', $$Parce que le sol tassé manque d'air ; les graines sont alors asphyxiées.$$),
        'fixation', jsonb_build_object('question', $$Cite les trois facteurs externes nécessaires à la germination.$$, 'solution', $$Une quantité suffisante d'eau, un sol aéré, et une température convenable.$$)
      ),
      jsonb_build_object(
        'heading', $$Les étapes de la germination$$,
        'body', $$Sur une graine saine, mature et placée dans de bonnes conditions, la germination se déroule par étapes : la graine absorbe de l'eau et se gonfle ; les enveloppes se déchirent et une petite racine (la radicule) apparaît ; la tigelle apparaît, courbée au-dessus du sol, et les racines se développent ; la tigelle se redresse et les cotylédons sortent ; enfin, les premières feuilles apparaissent.$$,
        'highlights', array[$$ordre : gonflement → radicule → tigelle (courbée) → tigelle redressée + cotylédons → premières feuilles$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la toute première étape visible de la germination ?$$, 'solution', $$Le gonflement de la graine (absorption d'eau).$$),
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on la "radicule" ?$$, 'solution', $$La petite racine qui apparaît quand les enveloppes de la graine se déchirent.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des élèves de 6ème veulent réaliser un champ d'arachide. Leur professeur de SVT leur demande d'attendre le début de la saison des pluies, de vérifier l'âge et l'état des graines, et de s'assurer que le sol est aéré.$$,
      'questions', array[
        $$Relève, parmi les conseils du professeur, les facteurs internes et externes de germination.$$,
        $$Explique l'influence de l'air sur la germination.$$,
        $$Explique pourquoi le professeur recommande d'attendre le début de la saison des pluies.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une graine mature et saine germe-t-elle ?$$,
      'hint', $$Ce sont les deux conditions internes requises.$$,
      'expected', $$Oui.$$
    ),
    jsonb_build_object(
      'question', $$Complète : "La germination dépend d'une quantité suffisante d'______, d'un sol ______, et d'une ______ convenable."$$,
      'hint', $$Les trois facteurs externes.$$,
      'expected', $$"...d'eau, d'un sol aéré, et d'une température convenable."$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre : les deux premières feuilles apparaissent / les cotylédons s'ouvrent / la radicule pousse / la tigelle s'allonge / la graine gonfle.$$,
      'hint', $$Le gonflement vient toujours en premier.$$,
      'expected', $$1. La graine gonfle, 2. La radicule pousse, 3. La tigelle s'allonge, 4. Les cotylédons s'ouvrent, 5. Les deux premières feuilles apparaissent.$$
    ),
    jsonb_build_object(
      'question', $$Une graine placée dans un congélateur (0°C) germera-t-elle ?$$,
      'hint', $$Le froid empêche la germination.$$,
      'expected', $$Non, le froid empêche la germination.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-6e-germination-graine';
