-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- SVT (categoryid=52).
-- Cours : "Leçon 7 : Les actions néfastes de l'Homme et leurs
-- conséquences sur l'environnement". Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Koffi, élève de 6ème au collège moderne de Bondoukou, se rend au village pendant les congés. Il constate que le gibier est chassé en grand nombre pour être vendu aux restaurants des villes voisines : des jeunes incendient une partie de la brousse pour faire sortir les animaux, et le feu ravage champs et plantations. De retour en classe, il informe ses camarades, et ensemble ils décident d'identifier les dégâts causés par l'Homme et leurs conséquences sur l'environnement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La destruction des ressources naturelles$$,
        'body', $$Les actions de destruction des ressources naturelles sont le déboisement, le défrichement, les cultures extensives, les cultures itinérantes et les feux de brousse. Elles entraînent l'érosion des sols, l'appauvrissement des sols, la désorganisation de la structure du sol, la diminution de la production agricole, et finalement la famine.$$,
        'highlights', array[$$destruction : déboisement, défrichement, cultures extensives/itinérantes, feux de brousse$$, $$conséquences : érosion et appauvrissement des sols → baisse de production → famine$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux conséquences du déboisement sur le sol.$$, 'solution', $$L'érosion des sols et l'appauvrissement des sols (ou la désorganisation de sa structure).$$)
      ),
      jsonb_build_object(
        'heading', $$La surexploitation des ressources naturelles$$,
        'body', $$Les actions de surexploitation des ressources naturelles sont le surpâturage, la pêche intensive et le braconnage. Elles entraînent la raréfaction, voire la disparition, des ressources animales, végétales et halieutiques.$$,
        'highlights', array[$$surexploitation : surpâturage, pêche intensive, braconnage$$, $$conséquence : raréfaction/disparition des ressources animales, végétales, halieutiques$$]::text[],
        'example', jsonb_build_object('statement', $$Un village au bord d'un fleuve constate une forte baisse des poissons pêchés depuis deux ans. Quelle action néfaste peut en être la cause ?$$, 'solution', $$La pêche intensive (une surexploitation de la ressource halieutique).$$),
        'fixation', jsonb_build_object('question', $$Le braconnage est-il une action de destruction ou de surexploitation des ressources naturelles ?$$, 'solution', $$De surexploitation.$$)
      ),
      jsonb_build_object(
        'heading', $$La pollution de l'environnement$$,
        'body', $$Les actions de pollution sont le rejet des déchets industriels, le rejet des ordures ménagères, l'émission de gaz par les engins motorisés et l'utilisation irrationnelle des pesticides et engrais. Elles provoquent la pollution de l'eau, de l'air et du sol, ainsi que des maladies respiratoires ou pulmonaires et des intoxications alimentaires chez l'Homme.$$,
        'highlights', array[$$pollution : déchets industriels, ordures ménagères, gaz des engins motorisés, pesticides/engrais mal utilisés$$, $$conséquences sur l'Homme : maladies respiratoires, intoxications alimentaires$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux conséquences de la pollution sur la santé de l'Homme.$$, 'solution', $$Les maladies respiratoires (ou pulmonaires) et les intoxications alimentaires.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux élèves de 6ème retournent au village en vacances. Ils découvrent que la forêt classée de leur village est devenue le site d'exploitants forestiers clandestins : des cultures extensives et d'autres activités industrielles y sont menées, ce qui pollue la rivière du village.$$,
      'questions', array[
        $$Identifie les différentes actions néfastes menées par ces exploitants clandestins.$$,
        $$Dégage trois conséquences de la déforestation sur l'environnement.$$,
        $$Propose une conclusion sur les dangers de ces pratiques pour le village.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Le déboisement est-il une action de destruction, de surexploitation, ou de pollution de l'environnement ?$$,
      'hint', $$Il détruit directement une ressource naturelle (la forêt).$$,
      'expected', $$Une action de destruction des ressources naturelles.$$
    ),
    jsonb_build_object(
      'question', $$La pêche intensive et le surpâturage appartiennent-ils à la même catégorie d'actions néfastes ?$$,
      'hint', $$Les deux consistent à prélever une ressource au-delà du raisonnable.$$,
      'expected', $$Oui, ce sont toutes les deux des actions de surexploitation des ressources naturelles.$$
    ),
    jsonb_build_object(
      'question', $$L'émission de gaz par les engins motorisés est-elle une action de pollution ?$$,
      'hint', $$Elle dégrade la qualité de l'air.$$,
      'expected', $$Oui.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois grandes catégories d'actions néfastes de l'Homme sur l'environnement étudiées dans cette leçon.$$,
      'hint', $$Ce sont les trois parties de la leçon.$$,
      'expected', $$La destruction des ressources naturelles, la surexploitation des ressources naturelles, et la pollution.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-6e-actions-nefastes-environnement';
