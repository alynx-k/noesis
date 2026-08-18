-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1865: "EE 15: Résumé_Texte_Argu_Reformuler_IE"
-- (https://lyc.ecole-ci.org/course/view.php?id=1865), resource id 15842 —
-- "Séance 4 : reformuler les idées essentielles" (Leçon 3 : le résumé du
-- texte argumentatif). Méthodologie réécrite à partir du PDF source
-- (reformuler chaque idée essentielle avec ses propres mots, condensée et
-- fidèle au sens, plutôt que de citer ou paraphraser mot à mot le texte
-- source). Comme pour les séances précédentes, le texte support est le
-- même texte original sur l'orpaillage clandestin (EE 12/13/14), pour
-- garder la continuité pédagogique tout en restant 100% original.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-resume-reformuler-idees',
  '1ere',
  'A',
  'francais',
  $$Le résumé du texte argumentatif : reformuler les idées essentielles$$,
  15,
  '1ere-a-fr-resume-selection-enchainement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir sélectionné les idées essentielles du texte sur l'orpaillage clandestin et les avoir reliées logiquement, les élèves de 1ère A doivent maintenant les reformuler avec leurs propres mots, de façon condensée, plutôt que de recopier des phrases du texte original.

Texte support (rappel) : « Depuis plusieurs années, l'orpaillage clandestin gagne du terrain dans certaines régions de la Côte d'Ivoire. Des jeunes désertent les salles de classe pour se ruer vers des sites d'extraction improvisés, creusés à la hâte au cœur des forêts. L'espoir d'un enrichissement rapide agit comme un aimant sur une jeunesse en quête d'avenir, dans des zones où le chômage frappe durement.

Pourtant, derrière la promesse d'un gain facile se cache une réalité bien plus sombre. Les galeries creusées sans aucune norme de sécurité s'effondrent régulièrement, ensevelissant des travailleurs sous des tonnes de terre. Le mercure utilisé pour séparer l'or du minerai empoisonne les cours d'eau environnants, rendant impropres à la consommation des rivières entières dont dépendent des villages voisins pour l'agriculture et la pêche.

Au-delà des dégâts environnementaux, c'est tout un tissu social qui se délite : des villages voient leur jeunesse déserter les champs familiaux, préférant le mirage de l'or à la lente construction d'un avenir par l'école. Les autorités multiplient les campagnes de sensibilisation et les opérations de démantèlement des sites illégaux. Mais tant que la pauvreté persistera dans ces zones rurales, l'orpaillage clandestin renaîtra, tel un mal chronique : aussitôt un site fermé, un autre s'ouvre non loin.

Il devient donc urgent de s'attaquer aux racines du problème plutôt qu'à ses seules manifestations : sans perspectives économiques réelles pour la jeunesse rurale, aucune répression, aussi sévère soit-elle, ne suffira à endiguer durablement ce fléau. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Pourquoi reformuler plutôt que citer ?$$,
        'body', $$Un résumé n'est pas une suite d'extraits copiés-collés du texte source : il doit être rédigé avec les mots du candidat, en respectant le sens de chaque idée essentielle mais en la condensant. Recopier des phrases entières du texte, même en les raccourcissant, n'est pas résumer — c'est reformuler qui prouve que l'idée a été comprise, et non simplement repérée.$$,
        'highlights', array[$$résumé = mots du candidat$$, $$reformuler ≠ recopier raccourci$$]::text[],
        'property', jsonb_build_object('label', $$Règle$$, 'text', $$Une idée essentielle correctement reformulée ne contient presque aucun mot identique aux phrases originales du texte, tout en gardant exactement le même sens.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi recopier une phrase du texte source, même raccourcie, ne constitue-t-il pas une reformulation valable ?$$, 'solution', $$Parce que cela ne prouve pas que l'idée a été comprise et retraitée par le candidat, seulement qu'elle a été repérée dans le texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Les techniques de reformulation$$,
        'body', $$Pour reformuler une idée, on peut : remplacer les mots du texte par des synonymes ou des expressions équivalentes ; condenser plusieurs informations en une phrase plus courte ; transformer une longue proposition en un groupe nominal (nominalisation), par exemple « les galeries s'effondrent » devient « les effondrements de galeries ». L'objectif est toujours de dire la même chose en moins de mots et avec un vocabulaire différent.$$,
        'highlights', array[$$synonymes$$, $$condensation$$, $$nominalisation$$]::text[],
        'example', jsonb_build_object('statement', $$Reformule l'idée essentielle du premier paragraphe : « des jeunes désertent l'école pour l'orpaillage clandestin, attirés par l'espoir d'un gain rapide dans des zones touchées par le chômage ».$$, 'solution', $$Le chômage pousse une partie de la jeunesse rurale à quitter l'école pour tenter sa chance dans l'extraction d'or illégale.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce que la nominalisation, utilisée comme technique de reformulation ?$$, 'solution', $$Transformer une proposition (verbe + sujet) en un groupe nominal condensé, par exemple « les galeries s'effondrent » devient « les effondrements de galeries ».$$)
      ),
      jsonb_build_object(
        'heading', $$Reformuler l'ensemble des idées du texte support$$,
        'body', $$En appliquant ces techniques aux quatre idées essentielles déjà sélectionnées et enchaînées, on obtient une version reformulée, plus courte, qui garde le sens et l'enchaînement logique du texte original sans en reprendre le vocabulaire.$$,
        'highlights', array[$$version reformulée = même sens, autre vocabulaire$$],
        'example', jsonb_build_object('statement', $$Reformule les quatre idées essentielles du texte support en une version condensée.$$, 'solution', $$Le chômage pousse une partie de la jeunesse rurale vers l'extraction d'or illégale. Or cette activité expose les travailleurs à des risques réels : effondrements de galeries et pollution des cours d'eau au mercure. De plus, les mesures de répression restent inefficaces tant que la précarité économique perdure. Une véritable solution exigerait donc de traiter les causes économiques du phénomène, pas seulement ses conséquences.$$),
        'fixation', jsonb_build_object('question', $$Sur quoi doit s'appuyer la reformulation finale, en plus des idées essentielles elles-mêmes ?$$, 'solution', $$Sur l'enchaînement logique déjà établi entre ces idées (connecteurs de cause, conséquence, opposition...), pour ne pas perdre le raisonnement du texte original.$$)
      ),
      jsonb_build_object(
        'heading', $$Vérifier la fidélité de la reformulation$$,
        'body', $$Une bonne reformulation ne trahit jamais la pensée de l'auteur : elle n'ajoute rien qui n'était pas dans le texte, n'atténue ni n'exagère les propos, et respecte les nuances (par exemple, ne pas transformer une hypothèse en certitude). Avant de valider une reformulation, il est utile de se demander : « Ai-je gardé exactement le même sens, sans en dire ni plus ni moins que l'auteur ? »$$,
        'highlights', array[$$ne rien ajouter, ne rien atténuer/exagérer$$, $$respecter les nuances$$]::text[],
        'fixation', jsonb_build_object('question', $$Que risque-t-on si une reformulation transforme une hypothèse de l'auteur en certitude ?$$, 'solution', $$On trahit sa pensée en dénaturant la nuance qu'il avait volontairement exprimée ; ce n'est plus une reformulation fidèle mais une déformation du texte.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le texte support sur l'orpaillage clandestin donné en début de cours.$$,
      'questions', array[
        $$Reformule, avec tes propres mots, l'idée essentielle du deuxième paragraphe (les dangers réels de l'orpaillage clandestin).$$,
        $$Utilise la nominalisation pour reformuler l'idée « le mercure empoisonne les cours d'eau ».$$,
        $$Explique pourquoi la reformulation suivante serait infidèle au texte : « L'orpaillage clandestin est totalement sans danger pour les travailleurs. »$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qui distingue une reformulation valable d'une simple phrase recopiée et raccourcie ?$$,
      'hint', $$Pense au vocabulaire utilisé.$$,
      'expected', $$La reformulation utilise un vocabulaire différent (synonymes, condensation) tout en gardant le même sens, alors que la phrase raccourcie reprend les mots du texte.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de nominalisation à partir de la phrase « les galeries s'effondrent régulièrement ».$$,
      'hint', $$Transforme le verbe en nom.$$,
      'expected', $$« Les effondrements réguliers de galeries. »$$
    ),
    jsonb_build_object(
      'question', $$Que ne doit jamais faire une reformulation par rapport aux nuances du texte original ?$$,
      'hint', $$Pense à une hypothèse transformée en certitude, par exemple.$$,
      'expected', $$Elle ne doit ni ajouter, ni atténuer, ni exagérer ce que dit l'auteur — elle doit respecter fidèlement ses nuances.$$
    ),
    jsonb_build_object(
      'question', $$Quelle question peut-on se poser pour vérifier la fidélité d'une reformulation ?$$,
      'hint', $$C'est une question de contrôle.$$,
      'expected', $$« Ai-je gardé exactement le même sens, sans en dire ni plus ni moins que l'auteur ? »$$
    )
  ),
  now()
);
