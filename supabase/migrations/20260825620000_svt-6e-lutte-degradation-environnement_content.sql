-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- SVT (categoryid=52).
-- Cours : "Leçon 8 : La lutte contre la dégradation de l'environnement".
-- Contenu réécrit à partir du PDF source ; situation d'apprentissage,
-- définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 6ème remarquent une propagation de maladies de la peau, de maladies respiratoires et de maladies du péril fécal dans leur localité. Le médecin de l'hôpital leur explique que ces maladies sont causées par la pollution de l'air et de l'eau due aux rejets d'une usine installée dans la localité. Pour éviter ces maladies, les élèves décident d'identifier les moyens de lutte contre la dégradation de l'environnement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les moyens de lutte contre la dégradation$$,
        'body', $$Les moyens de lutte contre la dégradation de l'environnement sont : le traitement des eaux usées, le traitement des ordures ménagères, la réglementation de l'exploitation des ressources naturelles, le reboisement, la lutte chimique, la lutte intégrée, et l'utilisation rationnelle d'engrais et de pesticides. Le traitement des eaux usées et des ordures ménagères rend l'environnement sain et évite les maladies ; les luttes chimique et intégrée empêchent la destruction des cultures et la pollution du sol ; la réglementation de l'exploitation et le reboisement évitent la disparition des espèces végétales et animales.$$,
        'highlights', array[$$moyens de lutte : traitement des eaux usées/ordures, réglementation, reboisement, lutte chimique/intégrée, usage rationnel d'engrais et pesticides$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel moyen de lutte permet d'éviter la disparition des espèces végétales et animales ?$$, 'solution', $$La réglementation de l'exploitation des ressources naturelles et le reboisement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les moyens de préservation de l'environnement$$,
        'body', $$Les moyens de préservation de l'environnement sont la création de parcs nationaux et de réserves forestières, ainsi que les messages de sensibilisation pour la protection de l'environnement. Les moyens de sensibilisation incluent les panneaux, les dépliants, les affiches, le mégaphone, la radio, la télévision et internet ; les techniques de sensibilisation incluent le jeu de rôle, la publicité, les conférences et les réunions.$$,
        'highlights', array[$$préservation : parcs nationaux, réserves forestières + sensibilisation$$, $$moyens de sensibilisation (panneaux, affiches...) ≠ techniques de sensibilisation (jeu de rôle, conférences...)$$]::text[],
        'example', jsonb_build_object('statement', $$Un club environnement organise une réunion pour expliquer aux habitants les dangers des feux de brousse. S'agit-il d'un moyen ou d'une technique de sensibilisation ?$$, 'solution', $$D'une technique de sensibilisation (la réunion), au service d'un message de préservation.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi crée-t-on des parcs nationaux et des réserves forestières ?$$, 'solution', $$Pour empêcher la disparition de la faune et de la flore, et ainsi préserver l'environnement.$$)
      ),
      jsonb_build_object(
        'heading', $$Combiner lutte et préservation$$,
        'body', $$On peut lutter contre la dégradation de l'environnement à la fois par des moyens de lutte (agir contre une dégradation déjà installée : ramassage des ordures, lutte biologique) et par des moyens de préservation (empêcher une dégradation future : interdiction des feux de brousse, réglementation de l'exploitation du bois). Les deux approches sont complémentaires pour protéger durablement l'environnement.$$,
        'highlights', array[$$lutte = agir sur une dégradation déjà présente ; préservation = empêcher une dégradation future$$]::text[],
        'fixation', jsonb_build_object('question', $$Le ramassage des ordures est-il un moyen de lutte contre une dégradation déjà installée, ou de préservation contre une dégradation future ?$$, 'solution', $$Un moyen de lutte contre une dégradation déjà installée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un guérisseur du village envoie son fils couper des feuilles médicinales, mais découvre que la forêt a été ravagée par les feux de brousse. Craignant que cela se reproduise, il te demande de l'aider à organiser une campagne de sensibilisation pour la protection de l'environnement, à l'aide d'une banderole portant le message "Stop aux feux de brousse".$$,
      'questions', array[
        $$Nomme le moyen de lutte utilisé dans ce texte.$$,
        $$Cite deux autres moyens qu'il aurait pu utiliser.$$,
        $$Propose deux messages de sensibilisation pour préserver l'environnement.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Le traitement des eaux usées est-il un moyen de lutte ou de préservation de l'environnement ?$$,
      'hint', $$Il agit sur une pollution déjà produite.$$,
      'expected', $$Un moyen de lutte contre la dégradation déjà installée.$$
    ),
    jsonb_build_object(
      'question', $$La création d'une réserve forestière vise-t-elle à lutter contre une dégradation existante ou à préserver l'environnement pour l'avenir ?$$,
      'hint', $$Elle protège la faune et la flore avant toute dégradation.$$,
      'expected', $$Elle vise à préserver l'environnement.$$
    ),
    jsonb_build_object(
      'question', $$Cite un moyen de sensibilisation et une technique de sensibilisation.$$,
      'hint', $$L'un est un support (objet/media), l'autre une méthode de communication.$$,
      'expected', $$Par exemple : un panneau (moyen) et une conférence (technique).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux grandes catégories de moyens permettant de lutter contre la dégradation de l'environnement.$$,
      'hint', $$Ce sont les deux parties principales de la leçon.$$,
      'expected', $$Les moyens de lutte et les moyens de préservation de l'environnement.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-6e-lutte-degradation-environnement';
