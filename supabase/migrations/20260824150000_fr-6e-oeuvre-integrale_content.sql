-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Etude d'œuvre intégrale (categoryid=63).
-- Cours combinés : "6e_EOI_1_S2_LM_" (id 2174, lecture méthodique sur "Le
-- secret" de Tidou Christian) et "6e_EOI_2_S2_LS_1" (id 2176, lecture
-- suivie sur "Les triplés de Kodar" de Soro Guéfala). Contenu réécrit à
-- partir des PDF sources ; méthode et exemples reformulés, extraits
-- littéraires cités brièvement à titre d'illustration pédagogique.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le Centre de Documentation et d'Information (CDI) du collège reçoit une dotation d'ouvrages. Les élèves de 6ème empruntent un roman et s'organisent pour l'étudier : ils formulent des hypothèses de lecture, identifient les personnages et les outils de la langue, puis les interprètent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La lecture méthodique : formuler et vérifier une hypothèse$$,
        'body', $$Étudier une œuvre intégrale, c'est d'abord situer le passage (à quelle page, dans quel contexte), puis formuler une hypothèse générale de lecture (par exemple : "récit d'un combat épique"), et enfin la vérifier en dégageant des axes de lecture. Chaque axe se construit avec des entrées (les temps verbaux, les images, le lexique), des repérages (citations précises du texte), une analyse (quel procédé est utilisé) et une interprétation (ce que cela révèle).$$,
        'highlights', array[$$situer le texte → hypothèse générale → axes de lecture → vérification → bilan$$, $$entrées (temps verbaux, images, lexique) + repérages + analyse + interprétation$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les quatre étapes d'un axe de lecture ?$$, 'solution', $$Les entrées, les repérages (citations), l'analyse, et l'interprétation.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple d'analyse : le récit d'un combat épique$$,
        'body', $$Dans un extrait du roman "Le secret" de Tidou Christian, deux frères s'affrontent dans un cimetière. L'analyse relève : des verbes d'action au passé simple et à l'imparfait de l'indicatif (le passé simple traduit la succession d'actions rapides, l'imparfait peint le décor) ; des hyperboles et métaphores ("la virilité du combat entre deux lions rivaux") qui mettent en relief la force des lutteurs ; un champ lexical de la lutte ("combat", "empoignade", "affrontement") qui souligne la violence et l'équilibre du duel.$$,
        'highlights', array[$$passé simple = actions rapides ; imparfait = décor, actions duratives$$, $$hyperbole, métaphore, champ lexical → mettent en relief le sens du texte$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la phrase "Jamais, dans un cimetière, pareille empoignade n'avait eu lieu", quel procédé d'écriture est utilisé pour insister sur l'intensité du combat ?$$, 'solution', $$Une hyperbole (exagération pour souligner l'ampleur du combat).$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le passé simple est-il adapté à la narration d'un combat ?$$, 'solution', $$Parce qu'il traduit la succession rapide des actions.$$)
      ),
      jsonb_build_object(
        'heading', $$La lecture suivie : construire le sens d'un passage$$,
        'body', $$La lecture suivie consiste à découper un passage en unités significatives (des séquences de texte), à leur donner un titre, puis à en dégager le sens (portraits des personnages, sentiments exprimés, événements). Dans "Les triplés de Kodar" de Soro Guéfala, on étudie ainsi la présentation des personnages (Fantama dit "Commandant", jeune ambitieux ; Nalèbley, le vieillard sage), puis la description du fonctionnement du lycée Katana sous un proviseur autoritaire, avant de dégager le bilan du passage.$$,
        'highlights', array[$$lecture suivie = découper en unités significatives + titre + sens$$, $$portrait physique / portrait moral d'un personnage$$]::text[],
        'example', jsonb_build_object('statement', $$Que révèle le portrait moral de Nalèbley ("il parlait peu", "il ne consommait pas l'alcool") ?$$, 'solution', $$Il révèle un vieillard sage et réservé, respecté pour sa sagesse.$$),
        'fixation', jsonb_build_object('question', $$Quels sentiments animent les triplés face à l'autoritarisme du proviseur du lycée Katana ?$$, 'solution', $$La déception, la révolte, et l'ironie face à cette "dictature".$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton professeur te propose un court extrait d'une œuvre intégrale au programme. Tu dois en construire le sens en suivant la méthode apprise.$$,
      'questions', array[
        $$Situe l'extrait (page, contexte de l'histoire).$$,
        $$Formule une hypothèse générale de lecture pour ce passage.$$,
        $$Relève deux ou trois citations et propose une interprétation pour chacune.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la première étape avant de formuler une hypothèse de lecture ?$$,
      'hint', $$Il faut savoir où se trouve le passage dans l'œuvre.$$,
      'expected', $$Situer le texte (page, contexte de l'histoire).$$
    ),
    jsonb_build_object(
      'question', $$Quel temps verbal peint le décor et les actions qui durent, dans un récit au passé ?$$,
      'hint', $$Ce n'est pas le passé simple.$$,
      'expected', $$L'imparfait de l'indicatif.$$
    ),
    jsonb_build_object(
      'question', $$Dans "Les triplés de Kodar", qui est surnommé "Commandant" et pourquoi rêve-t-il de devenir sous-préfet ?$$,
      'hint', $$C'est le personnage jeune et ambitieux.$$,
      'expected', $$Fantama, un jeune ambitieux qui veut poursuivre ses études pour devenir sous-préfet.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il faire à la fin de l'analyse d'un axe de lecture ?$$,
      'hint', $$C'est la dernière étape, celle qui conclut.$$,
      'expected', $$Formuler le bilan, qui vérifie (ou non) l'hypothèse générale de départ.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-oeuvre-integrale';
