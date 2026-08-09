-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (la protection et l'amélioration des sols : techniques de protection,
-- techniques d'amélioration de la fertilité, rôle de chacun), 100%
-- original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Face à la baisse de fertilité de leurs terres, les paysans de la région décident de changer leurs pratiques agricoles pour protéger et redonner vie à leurs sols.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les techniques de protection du sol$$,
        'body', $$La protection du sol consiste à limiter l'érosion et à préserver le couvert végétal, par des techniques comme le reboisement, les cultures en terrasses sur les pentes, et la mise en place de brise-vents.$$,
        'highlights', array[$$reboisement$$, $$cultures en terrasses$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Technique$$, $$Effet recherché$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Reboisement$$, $$reconstituer le couvert végétal et retenir le sol$$),
            jsonb_build_array($$Cultures en terrasses$$, $$freiner le ruissellement sur les pentes$$),
            jsonb_build_array($$Haies et brise-vents$$, $$limiter l'érosion éolienne$$),
            jsonb_build_array($$Lutte contre les feux de brousse$$, $$préserver la végétation et la matière organique$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La protection du sol repose sur des techniques comme le reboisement, les cultures en terrasses et les brise-vents, qui limitent l'érosion et préservent le couvert végétal.$$),
        'example', jsonb_build_object('statement', $$Pourquoi les cultures en terrasses sont-elles utiles sur un terrain en pente ?$$, 'solution', $$Parce qu'elles freinent le ruissellement de l'eau de pluie en créant des paliers horizontaux, ce qui limite l'entraînement des particules du sol vers le bas de la pente.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'intérêt de planter des haies en bordure de champ dans une région venteuse ?$$, 'solution', $$Elles agissent comme des brise-vents, ce qui réduit l'érosion éolienne du sol.$$)
      ),
      jsonb_build_object(
        'heading', $$Les techniques d'amélioration de la fertilité$$,
        'body', $$L'amélioration de la fertilité du sol repose sur l'apport de matière organique, comme la fumure ou le compost, la rotation des cultures qui évite d'épuiser toujours les mêmes éléments minéraux, et la jachère qui laisse le sol se régénérer.$$,
        'highlights', array[$$fumure organique$$, $$rotation des cultures$$, $$jachère$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'amélioration de la fertilité du sol repose sur l'apport de matière organique, la rotation des cultures et la jachère.$$),
        'example', jsonb_build_object('statement', $$Pourquoi alterner différentes cultures sur une même parcelle, d'une année à l'autre, aide-t-il à préserver la fertilité du sol ?$$, 'solution', $$Parce que chaque plante prélève des éléments minéraux différents ; alterner les cultures évite d'épuiser toujours les mêmes ressources du sol.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce que la jachère et à quoi sert-elle ?$$, 'solution', $$C'est une période durant laquelle une parcelle est laissée sans culture, ce qui permet au sol de se reposer et de reconstituer sa fertilité.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rôle de chacun dans la protection des sols$$,
        'body', $$La protection des sols est une responsabilité partagée : les agriculteurs adoptent de bonnes pratiques, les autorités sensibilisent et encadrent les activités agricoles, et chaque citoyen peut contribuer en évitant les comportements qui dégradent l'environnement, comme les feux de brousse incontrôlés.$$,
        'highlights', array[$$protection des sols$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La protection des sols implique les agriculteurs, les autorités et l'ensemble de la population, chacun ayant un rôle à jouer.$$),
        'example', jsonb_build_object('statement', $$Cite un exemple d'action que peut mener l'État pour protéger les sols à grande échelle.$$, 'solution', $$Par exemple mener des campagnes de reboisement, ou réglementer les pratiques agricoles et la gestion des feux de brousse.$$),
        'fixation', jsonb_build_object('question', $$Cite une action simple qu'un élève peut mener pour contribuer à la protection des sols de sa région.$$, 'solution', $$Par exemple participer à une action de reboisement, éviter de provoquer des feux de brousse, ou sensibiliser son entourage.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les paysans de la région mettent en place un projet combinant reboisement, cultures en terrasses et rotation des cultures pour restaurer la fertilité de leurs terres.$$,
      'questions', array[
        $$Explique comment le reboisement contribue à protéger le sol.$$,
        $$Explique l'intérêt des cultures en terrasses sur les zones en pente.$$,
        $$Explique comment la rotation des cultures et la jachère améliorent la fertilité du sol.$$,
        $$Quel rôle chacun, paysans, État, population, peut-il jouer dans la protection des sols ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux techniques permettant de protéger un sol contre l'érosion.$$,
      'hint', $$Pense au couvert végétal et à l'aménagement du terrain.$$,
      'expected', $$Par exemple le reboisement et les cultures en terrasses, ou les haies/brise-vents et la lutte contre les feux de brousse.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la rotation des cultures et pourquoi est-elle utile ?$$,
      'hint', $$Pense à l'alternance des plantes.$$,
      'expected', $$C'est le fait d'alterner différentes cultures sur une même parcelle d'une saison à l'autre ; elle évite d'épuiser toujours les mêmes éléments minéraux du sol et aide à préserver sa fertilité.$$
    ),
    jsonb_build_object(
      'question', $$Qu'apporte la fumure organique au sol ?$$,
      'hint', $$Pense au compost et au fumier.$$,
      'expected', $$Elle apporte de la matière organique qui enrichit le sol en éléments nutritifs et améliore sa structure et sa fertilité.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi peut-on dire que la protection des sols est une responsabilité partagée ?$$,
      'hint', $$Pense aux différents acteurs concernés.$$,
      'expected', $$Parce qu'elle implique à la fois les agriculteurs, qui adoptent de bonnes pratiques, les autorités, qui sensibilisent et réglementent, et la population, qui doit éviter les comportements dégradants comme les feux de brousse incontrôlés.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-protection-sols';
