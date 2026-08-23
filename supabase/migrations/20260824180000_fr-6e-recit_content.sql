-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Expression Écrite (categoryid=58).
-- Cours combinés : "6e_EE_L3_S1_récit_simple_complet" (id 2173) et
-- "6e_EE_L3_S2_récit_complexe_complet" (id 2175). Contenu réécrit à
-- partir des PDF sources ; situation d'apprentissage, méthode et exemples
-- reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant les congés de Pâques, un(e) élève de 6ème a participé à une fête familiale qui l'a beaucoup marqué(e). À la reprise, il/elle décide de raconter par écrit cet événement à ses camarades de classe.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le récit simple et complet : le schéma narratif$$,
        'body', $$Le récit est une histoire (réelle ou imaginaire) qu'on raconte. Il obéit à un schéma narratif en trois étapes : la situation initiale (début calme : lieu, époque, personnages), les péripéties (événements déclenchés par un élément perturbateur : "tout à coup", "soudain"), et la situation finale ou dénouement (fin de l'histoire, souvent avec une leçon ou des sentiments exprimés). On utilise surtout le passé simple, mais aussi le passé composé, le présent de narration et l'imparfait.$$,
        'highlights', array[$$situation initiale (calme) → péripéties (élément perturbateur) → situation finale (dénouement)$$, $$passé simple = temps du récit par excellence$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel mot introduit souvent l'élément perturbateur d'un récit ?$$, 'solution', $$"Tout à coup", "soudain", ou "brusquement".$$)
      ),
      jsonb_build_object(
        'heading', $$Rechercher et organiser les idées$$,
        'body', $$Avant de rédiger, on répond aux questions : Où ? Quand ? Qui ? (situation initiale) ; Quel est l'élément perturbateur ? Que se passe-t-il ensuite ? (péripéties) ; Comment cela se termine-t-il ? (situation finale). Exemple : situation initiale — une soirée dansante chez les grands-parents à Dimbokro pendant les congés ; élément perturbateur — une coupure d'électricité avec des étincelles ; dénouement — le feu est maîtrisé et la fête reprend.$$,
        'highlights', array[$$Où ? Quand ? Qui ? → situation initiale$$, $$élément perturbateur → déroulement → dénouement$$]::text[],
        'example', jsonb_build_object('statement', $$Complète la situation initiale d'un récit sur une bagarre à l'école : Où ? Quand ? Qui ?$$, 'solution', $$Où : dans la cour de l'école. Quand : pendant la récréation. Qui : deux élèves de la classe.$$),
        'fixation', jsonb_build_object('question', $$Que peut exprimer la situation finale d'un récit ?$$, 'solution', $$Une leçon de morale ou les sentiments des personnages.$$)
      ),
      jsonb_build_object(
        'heading', $$Le récit complexe : intégrer un dialogue$$,
        'body', $$Un récit complexe fait intervenir des personnages qui échangent directement (dialogue), et peut comporter un portrait ou une description. Il garde le même schéma narratif que le récit simple, mais utilise en plus : les tirets (pour changer de personnage qui parle), les guillemets (pour rapporter les paroles), les deux points (pour introduire une parole citée), le discours direct avec des verbes introducteurs (crier, répondre, affirmer, demander), et l'imparfait pour décrire les faits ou personnages.$$,
        'highlights', array[$$récit complexe = récit simple + dialogue (tirets, guillemets, deux points)$$, $$verbes introducteurs du discours direct : crier, répondre, affirmer, déclarer, demander$$]::text[],
        'example', jsonb_build_object('statement', $$Réécris au discours direct : le chef de classe dit à son adjoint d'arrêter.$$, 'solution', $$Le chef de classe lui dit : « Arrête ! »$$),
        'fixation', jsonb_build_object('question', $$Quel signe de ponctuation introduit une parole citée après un verbe comme "dire" ou "répondre" ?$$, 'solution', $$Les deux points, suivis de guillemets.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur le chemin de la maison, tu es témoin d'un accident de circulation. Les agents de police recensent les témoins et te donnent 48 heures pour rendre par écrit ton témoignage détaillé.$$,
      'questions', array[
        $$Indique le type d'écrit à produire (récit simple ou complexe) et justifie ton choix.$$,
        $$Identifie le thème et rédige la situation initiale (Où ? Quand ? Qui ?).$$,
        $$Rédige une partie du développement en intégrant, si possible, un dialogue avec la ponctuation appropriée.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois étapes du schéma narratif ?$$,
      'hint', $$Début, milieu, fin.$$,
      'expected', $$La situation initiale, les péripéties, et la situation finale (dénouement).$$
    ),
    jsonb_build_object(
      'question', $$Quel temps verbal est le "temps par excellence" du récit ?$$,
      'hint', $$C'est celui qui raconte les actions rapides et achevées.$$,
      'expected', $$Le passé simple.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qui distingue un récit complexe d'un récit simple ?$$,
      'hint', $$Pense aux personnages qui parlent.$$,
      'expected', $$Le récit complexe intègre un dialogue (échange direct entre personnages), et parfois un portrait ou une description.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux verbes introducteurs utilisés pour rapporter des paroles au discours direct.$$,
      'hint', $$Pense à "dire" et ses synonymes.$$,
      'expected', $$Par exemple : crier, répondre, affirmer, déclarer, demander (deux au choix).$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-recit';
