-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 6 : LES PRINCIPES DÉMOCRATIQUES ET LA JUSTICE SOCIALE"
-- (id 1720). Contenu réécrit à partir du PDF source ; situation
-- d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$L'élection du délégué de classe oppose deux candidats : l'un évoque ses origines princières, l'autre son appartenance religieuse. Pour opérer leur choix, les élèves de la classe décident de s'informer sur les principes démocratiques.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition de la démocratie$$,
        'body', $$La démocratie est un système politique dans lequel le pouvoir appartient au peuple, qui l'exerce à travers ses représentants librement choisis. Le peuple y est souverain : ce n'est ni un roi, ni le plus fort, qui détient le pouvoir, mais l'ensemble des citoyens.$$,
        'highlights', array[$$démocratie = système politique où le pouvoir appartient au peuple$$, $$le peuple exerce ce pouvoir à travers des représentants librement choisis$$]::text[],
        'fixation', jsonb_build_object('question', $$À qui appartient le pouvoir dans une démocratie ?$$, 'solution', $$Au peuple, qui l'exerce à travers ses représentants.$$)
      ),
      jsonb_build_object(
        'heading', $$Les principes de la démocratie$$,
        'body', $$Les principes démocratiques comprennent : la souveraineté du peuple, l'égalité des citoyens, la séparation des pouvoirs, la transparence dans la gestion des affaires publiques, et des élections libres. À l'inverse, le caractère sacré d'un roi, l'exercice du pouvoir à vie, ou la succession héréditaire ne sont pas des principes démocratiques.$$,
        'highlights', array[$$principes démocratiques : souveraineté du peuple, égalité, séparation des pouvoirs, transparence, élections libres$$, $$non démocratiques : pouvoir héréditaire, à vie, ou sacré$$]::text[],
        'example', jsonb_build_object('statement', $$"L'exercice du pouvoir à vie" est-il un principe démocratique ?$$, 'solution', $$Non, ce n'est pas un principe démocratique — la démocratie repose sur des élections libres et périodiques.$$),
        'fixation', jsonb_build_object('question', $$Cite deux principes démocratiques.$$, 'solution', $$Par exemple : l'égalité des citoyens et des élections libres (deux parmi les cinq principes).$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance du respect des principes démocratiques$$,
        'body', $$La démocratie favorise l'apprentissage de valeurs collectives et individuelles : la tolérance, la coopération, le respect, le compromis social, et l'acceptation de la différence. C'est le système politique le plus répandu au monde. Fondée sur l'égalité des citoyens en droits et en devoirs, elle garantit la paix et la justice sociale lorsqu'elle est respectée.$$,
        'highlights', array[$$valeurs favorisées : tolérance, coopération, respect, compromis social, acceptation de la différence$$, $$respect des principes démocratiques → paix + justice sociale$$]::text[],
        'example', jsonb_build_object('statement', $$Le respect des principes démocratiques "crée l'harmonie" — vrai ou faux ?$$, 'solution', $$Vrai.$$),
        'fixation', jsonb_build_object('question', $$Quelles valeurs individuelles et collectives la démocratie permet-elle d'apprendre ?$$, 'solution', $$La tolérance, la coopération, le respect, le compromis social, et l'acceptation de la différence.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors de la campagne pour l'élection du chef de classe, l'un des candidats évoque ses origines royales, l'autre son appartenance religieuse. Cette attitude trouble les électeurs, dont tu fais partie. Avec quelques camarades, vous décidez d'interpeller les candidats pour préserver l'esprit démocratique et la paix dans l'établissement.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Cite deux principes démocratiques.$$,
        $$Justifie ta décision en faveur du respect des principes démocratiques.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$"La succession héréditaire" est-elle un principe démocratique (V ou F) ?$$,
      'hint', $$La démocratie repose sur des élections, pas l'hérédité.$$,
      'expected', $$Faux.$$
    ),
    jsonb_build_object(
      'question', $$"L'égalité des citoyens" est-elle un principe démocratique (V ou F) ?$$,
      'hint', $$C'est l'un des cinq principes cités.$$,
      'expected', $$Vrai.$$
    ),
    jsonb_build_object(
      'question', $$Complète : "La démocratie est ______ dans lequel tous les citoyens ont ______ aux décisions qui les touchent, à travers ______." (système politique / le droit de participer / les élections)$$,
      'hint', $$Reconstitue la définition dans l'ordre logique.$$,
      'expected', $$"La démocratie est un système politique dans lequel tous les citoyens ont le droit de participer aux décisions qui les touchent, à travers les élections."$$
    ),
    jsonb_build_object(
      'question', $$Le respect des principes démocratiques "empêche-t-il le citoyen de s'épanouir" ?$$,
      'hint', $$C'est le contraire qui est vrai.$$,
      'expected', $$Non, au contraire, il favorise l'épanouissement du citoyen.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-principes-democratiques';
