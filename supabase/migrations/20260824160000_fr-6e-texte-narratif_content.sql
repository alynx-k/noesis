-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Lecture (categoryid=60).
-- Cours combinés : "6e_LECT_L1_S1_explot_texte_lettre_perso" (id 2177,
-- contenu réel : lecture méthodique de "La conquête du feu", récit
-- simple, J.-H. Rosny Aîné) et "6e_LECT_L3_S4_LM_récit_complexe" (id 2180,
-- contenu réel : lecture méthodique de "La jarre passoire", récit
-- complexe, Paul Hazoumé). Contenu réécrit à partir des PDF sources ;
-- méthode et extraits cités brièvement à titre d'illustration pédagogique.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour apprendre à construire le sens d'un texte narratif, les élèves de 6ème étudient méthodiquement deux récits : "La conquête du feu" (récit simple) et "La jarre passoire" (récit complexe, avec dialogue).$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le récit simple : le schéma narratif$$,
        'body', $$Dans "La conquête du feu" (J.-H. Rosny Aîné), Naoh, un homme préhistorique, découvre puis maîtrise le secret du feu chez la tribu des Wah. L'analyse du schéma narratif distingue trois moments : la situation initiale (la découverte du secret du feu), le déroulement (la maîtrise de la technique), et la situation finale (la satisfaction totale de Naoh). Les verbes d'action ("frappait", "soufflant", "fit grandir") montrent les étapes de sa conquête, et le champ lexical de la bravoure ("passion violente", "coups terribles") souligne son héroïsme.$$,
        'highlights', array[$$schéma narratif = situation initiale → déroulement → situation finale$$, $$verbes d'action = étapes de l'histoire ; champ lexical = ton du récit$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les trois parties du schéma narratif d'un récit simple ?$$, 'solution', $$La situation initiale, le déroulement, et la situation finale.$$)
      ),
      jsonb_build_object(
        'heading', $$Le récit complexe : dialogue et valeurs$$,
        'body', $$Dans "La jarre passoire" (Paul Hazoumé), le roi Guézo enseigne à son fils l'importance de l'union en utilisant l'image d'une jarre percée de trous : un seul homme ne peut pas boucher tous les trous, mais tous les conseillers ensemble, oui. Ce récit est dit "complexe" car il intègre un dialogue (questions et réponses entre le roi et le prince) au sein de la narration. Les figures de style (comparaison, métaphore, hyperbole) et les phrases interrogatives/déclaratives traduisent la volonté du roi de transmettre une leçon de vie par une parabole.$$,
        'highlights', array[$$récit complexe = récit qui intègre un dialogue$$, $$comparaison, métaphore, hyperbole = images qui renforcent le message$$]::text[],
        'example', jsonb_build_object('statement', $$Que symbolise la jarre percée de trous dans le récit ?$$, 'solution', $$Elle symbolise le royaume : un seul homme (un doigt) ne peut pas le protéger seul, mais l'union de tous (tous les doigts) le peut.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui rend un récit "complexe" plutôt que "simple" ?$$, 'solution', $$L'intégration de passages dialogués (questions/réponses entre personnages) au sein du récit.$$)
      ),
      jsonb_build_object(
        'heading', $$La méthode : hypothèse, axes de lecture, bilan$$,
        'body', $$Pour analyser un texte narratif, on formule d'abord une hypothèse générale de lecture (par exemple : "récit de la conquête héroïque du feu" ou "récit imagé de la construction de l'unité"), puis on la vérifie à travers des axes de lecture (le schéma narratif, le lexique, les types de phrases, les figures de style), avant de conclure par un bilan qui confirme ou nuance l'hypothèse de départ.$$,
        'highlights', array[$$hypothèse générale → axes de lecture (entrée + repérage + analyse + interprétation) → bilan$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi utilise-t-on des verbes au passé simple dans un récit d'action ?$$, 'solution', $$Le passé simple traduit la succession rapide des actions, tandis que l'imparfait sert à décrire le décor ou les actions qui durent.$$),
        'fixation', jsonb_build_object('question', $$Que doit confirmer le bilan à la fin de l'analyse ?$$, 'solution', $$Il confirme (ou nuance) l'hypothèse générale formulée au début.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton professeur te soumet un court récit et te demande d'en construire le sens en suivant la méthode de lecture apprise.$$,
      'questions', array[
        $$Formule une hypothèse générale de lecture pour ce récit.$$,
        $$Identifie la situation initiale, le déroulement et la situation finale.$$,
        $$Relève une figure de style (comparaison, métaphore ou hyperbole) et explique ce qu'elle apporte au récit.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans "La conquête du feu", que découvre Naoh à la situation initiale ?$$,
      'hint', $$C'est le secret des Wah.$$,
      'expected', $$Il découvre que le feu se trouve naturellement dans les pierres (les cailloux), et non dans une magie des Wah.$$
    ),
    jsonb_build_object(
      'question', $$Quelle figure de style compare deux éléments à l'aide d'un mot comme "comme" ?$$,
      'hint', $$C'est la plus simple des images.$$,
      'expected', $$La comparaison.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le roi Guézo demande-t-il à son fils de boucher les trous de la jarre avec l'aide des conseillers ?$$,
      'hint', $$C'est pour illustrer une valeur sociale.$$,
      'expected', $$Pour montrer qu'un seul homme ne peut pas tout faire seul, mais que l'union de tous permet de réussir — la leçon de l'unité nationale.$$
    ),
    jsonb_build_object(
      'question', $$Quel temps verbal domine dans le récit de "La conquête du feu" pour raconter les actions rapides ?$$,
      'hint', $$Il s'oppose à l'imparfait.$$,
      'expected', $$Le passé simple.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-texte-narratif';
