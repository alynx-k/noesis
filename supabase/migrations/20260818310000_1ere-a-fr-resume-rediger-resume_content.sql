-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1867: "EE 16: Résumé_Texte_Argu_Rédiger_résumé"
-- (https://lyc.ecole-ci.org/course/view.php?id=1867), resource id 15866 —
-- "Séance 5 : rédiger le résumé" (Leçon 3 : le résumé du texte
-- argumentatif). Méthodologie réécrite à partir du PDF source (calcul du
-- volume cible avec la formule mots/4 ± 10%, rédaction en prose continue
-- à partir des idées reformulées et enchaînées). Comme pour les séances
-- précédentes, le texte support est le même texte original sur
-- l'orpaillage clandestin (EE 12 à 15), pour garder la continuité
-- pédagogique tout en restant 100% original ; complète le module
-- "résumé du texte argumentatif" (5/5).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-resume-rediger-resume',
  '1ere',
  'A',
  'francais',
  $$Le résumé du texte argumentatif : rédiger le résumé$$,
  16,
  '1ere-a-fr-resume-reformuler-idees',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 1ère A ont analysé le texte sur l'orpaillage clandestin, sélectionné ses idées essentielles, les ont enchaînées puis reformulées. Il leur reste maintenant l'étape finale : calculer le nombre de mots exact que doit compter le résumé, puis rédiger un texte suivi, en prose continue, qui respecte cette contrainte.

Texte support (rappel, environ 245 mots) : « Depuis plusieurs années, l'orpaillage clandestin gagne du terrain dans certaines régions de la Côte d'Ivoire. Des jeunes désertent les salles de classe pour se ruer vers des sites d'extraction improvisés, creusés à la hâte au cœur des forêts. L'espoir d'un enrichissement rapide agit comme un aimant sur une jeunesse en quête d'avenir, dans des zones où le chômage frappe durement.

Pourtant, derrière la promesse d'un gain facile se cache une réalité bien plus sombre. Les galeries creusées sans aucune norme de sécurité s'effondrent régulièrement, ensevelissant des travailleurs sous des tonnes de terre. Le mercure utilisé pour séparer l'or du minerai empoisonne les cours d'eau environnants, rendant impropres à la consommation des rivières entières dont dépendent des villages voisins pour l'agriculture et la pêche.

Au-delà des dégâts environnementaux, c'est tout un tissu social qui se délite : des villages voient leur jeunesse déserter les champs familiaux, préférant le mirage de l'or à la lente construction d'un avenir par l'école. Les autorités multiplient les campagnes de sensibilisation et les opérations de démantèlement des sites illégaux. Mais tant que la pauvreté persistera dans ces zones rurales, l'orpaillage clandestin renaîtra, tel un mal chronique : aussitôt un site fermé, un autre s'ouvre non loin.

Il devient donc urgent de s'attaquer aux racines du problème plutôt qu'à ses seules manifestations : sans perspectives économiques réelles pour la jeunesse rurale, aucune répression, aussi sévère soit-elle, ne suffira à endiguer durablement ce fléau. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Calculer le volume cible du résumé$$,
        'body', $$On divise le nombre de mots du texte source par 4 (réduction au quart), puis on calcule la marge de tolérance de ±10% autour de ce résultat pour obtenir l'intervalle de mots à respecter. Un résumé trop court ou trop long, même bien rédigé, peut être pénalisé s'il sort de cet intervalle.$$,
        'highlights', array[$$volume ÷ 4$$, $$tolérance ±10%$$]::text[],
        'property', jsonb_build_object('label', $$Formule$$, 'text', $$Volume cible = nombre de mots du texte ÷ 4. Intervalle accepté = [volume cible − 10%, volume cible + 10%].$$),
        'example', jsonb_build_object('statement', $$Le texte support fait environ 245 mots. Calcule le volume cible du résumé et son intervalle de tolérance.$$, 'solution', $$245÷4 = 61,25, soit environ 61 mots. La tolérance de 10% donne (61×10)/100 = 6,1, soit environ 6 mots. Le résumé doit donc compter entre 55 et 67 mots.$$),
        'fixation', jsonb_build_object('question', $$Que risque un résumé qui sort de l'intervalle de tolérance calculé, même s'il est par ailleurs bien rédigé ?$$, 'solution', $$Il peut être pénalisé, car le respect du volume imposé fait partie des exigences de l'exercice, au même titre que la qualité du contenu.$$)
      ),
      jsonb_build_object(
        'heading', $$Rédiger en prose continue$$,
        'body', $$Le résumé final n'est jamais présenté sous forme de liste à puces : c'est un texte suivi, en prose, où les idées reformulées et déjà enchaînées logiquement (voir la séance précédente) sont assemblées en phrases fluides, reliées par des connecteurs logiques. On ne doit reconnaître ni les paragraphes ni la ponctuation du texte original — seulement un texte nouveau, condensé et cohérent.$$,
        'highlights', array[$$texte suivi, pas de liste à puces$$, $$phrases fluides reliées par des connecteurs$$]::text[],
        'fixation', jsonb_build_object('question', $$Sous quelle forme le résumé final doit-il être présenté ?$$, 'solution', $$Sous forme de texte suivi en prose, pas de liste à puces ni de plan schématique.$$)
      ),
      jsonb_build_object(
        'heading', $$Rédiger le résumé du texte support$$,
        'body', $$En reprenant les idées reformulées et enchaînées de la séance précédente, on obtient un résumé rédigé en prose continue, respectant l'intervalle de mots calculé.$$,
        'highlights', array[$$idées reformulées → texte suivi$$],
        'example', jsonb_build_object('statement', $$Rédige le résumé complet du texte support, en respectant l'intervalle de 55 à 67 mots calculé plus haut.$$, 'solution', $$Le chômage pousse une partie de la jeunesse rurale ivoirienne vers l'orpaillage clandestin, malgré des risques réels : effondrements de galeries et pollution des cours d'eau au mercure. Ce phénomène persiste malgré les campagnes de sensibilisation et le démantèlement des sites, tant que la pauvreté perdure. Une solution durable exigerait donc de s'attaquer aux causes économiques plutôt qu'à la seule répression. (61 mots)$$),
        'fixation', jsonb_build_object('question', $$Dans le résumé rédigé ci-dessus, quel connecteur marque la conclusion du raisonnement ?$$, 'solution', $$« Donc », qui introduit la dernière phrase de conclusion du résumé.$$)
      ),
      jsonb_build_object(
        'heading', $$Compter ses mots et ajuster$$,
        'body', $$Une fois le résumé rédigé, on compte précisément le nombre de mots (souvent indiqué entre parenthèses à la fin du texte, comme dans les copies d'examen) et on ajuste si nécessaire : supprimer un connecteur redondant pour réduire, ou préciser une idée trop elliptique pour allonger légèrement, sans jamais sortir de l'intervalle calculé.$$,
        'highlights', array[$$compter et indiquer le nombre de mots$$, $$ajuster sans sortir de l'intervalle$$]::text[],
        'fixation', jsonb_build_object('question', $$Que peut-on faire si le résumé rédigé dépasse légèrement l'intervalle de mots autorisé ?$$, 'solution', $$Supprimer un connecteur ou un mot redondant, ou reformuler une phrase de façon plus condensée, sans perdre d'idée essentielle.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un texte argumentatif de 400 mots doit être résumé au quart de son volume, avec une marge de tolérance de ±10%.$$,
      'questions', array[
        $$Calcule le volume cible du résumé et son intervalle de tolérance en mots.$$,
        $$Rappelle sous quelle forme (liste ou prose continue) ce résumé doit être présenté.$$,
        $$Explique ce qu'il faudrait faire si un résumé rédigé pour ce texte comptait 130 mots.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Un texte fait 500 mots. Quel est le volume cible de son résumé au quart ?$$,
      'hint', $$Divise par 4.$$,
      'expected', $$500÷4 = 125 mots.$$
    ),
    jsonb_build_object(
      'question', $$Pour un volume cible de 125 mots, quelle est la marge de tolérance en mots (±10%) ?$$,
      'hint', $$10% de 125.$$,
      'expected', $$(125×10)/100 = 12,5, soit environ 12 ou 13 mots (intervalle approximatif [113;138]).$$
    ),
    jsonb_build_object(
      'question', $$Le résumé final doit-il être présenté sous forme de liste de points ou de texte suivi ?$$,
      'hint', $$Pense à la forme finale attendue.$$,
      'expected', $$Sous forme de texte suivi, en prose continue.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il indiquer généralement à la fin d'un résumé rédigé, comme dans les copies d'examen ?$$,
      'hint', $$C'est une vérification chiffrée.$$,
      'expected', $$Le nombre de mots du résumé rédigé, entre parenthèses.$$
    )
  ),
  now()
);
