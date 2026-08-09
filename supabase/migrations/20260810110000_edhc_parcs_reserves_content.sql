-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on the
-- protection of national parks and forest reserves, in 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Près du village de Diarra, des exploitants clandestins abattent des arbres dans une réserve forestière protégée pour vendre le bois. Les habitants remarquent que le cours d'eau du village baisse et que certains animaux ont disparu de la forêt. La classe cherche à comprendre pourquoi protéger les parcs et réserves est essentiel.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un parc national ou une réserve forestière ?$$,
        'body', $$Un parc national ou une réserve forestière est un espace naturel protégé par la loi, où la faune et la flore sont préservées, et où les activités humaines comme la chasse, l'exploitation du bois ou l'agriculture sont interdites ou strictement encadrées. La Côte d'Ivoire compte plusieurs parcs importants, comme le parc national de Taï ou celui de la Comoé.$$,
        'highlights', array[$$parc national$$, $$réserve forestière$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un parc national de Côte d'Ivoire.$$, 'solution', $$Par exemple : le parc national de Taï ou le parc national de la Comoé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les menaces qui pèsent sur ces espaces$$,
        'body', $$La déforestation illégale, le braconnage, l'orpaillage clandestin et l'agriculture non autorisée détruisent progressivement ces espaces protégés, menaçant la survie des espèces animales et végétales qui y vivent.$$,
        'highlights', array[$$déforestation$$, $$braconnage$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Menace$$, $$Conséquence$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Déforestation illégale$$, $$Disparition d'habitats et d'espèces$$),
            jsonb_build_array($$Braconnage$$, $$Diminution voire extinction locale d'animaux$$),
            jsonb_build_array($$Orpaillage clandestin$$, $$Pollution des sols et des cours d'eau$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un écosystème protégé forme un tout : la disparition d'une espèce ou la destruction d'une partie de la forêt déséquilibre l'ensemble du milieu, y compris les ressources utiles aux populations voisines.$$),
        'example', jsonb_build_object('statement', $$Après l'abattage illégal d'arbres près de la réserve de Diarra, le cours d'eau du village a baissé. Comment expliquer ce lien ?$$, 'solution', $$Les arbres retiennent l'eau et régulent le climat local ; leur disparition perturbe le cycle de l'eau, ce qui peut réduire le débit du cours d'eau.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance de ces espaces protégés$$,
        'body', $$Les parcs et réserves préservent la biodiversité, régulent le climat local, protègent les sols et les cours d'eau, et offrent des ressources futures (recherche scientifique, écotourisme) importantes pour le pays.$$,
        'highlights', array[$$biodiversité$$]::text[],
        'example', jsonb_build_object('statement', $$Cite un bénéfice, pour tout le pays, de la préservation d'un parc national.$$, 'solution', $$Par exemple : la préservation de la biodiversité, la régulation du climat, ou le développement de l'écotourisme qui crée des emplois.$$)
      ),
      jsonb_build_object(
        'heading', $$Adopter un comportement responsable envers l'environnement$$,
        'body', $$Protéger un parc ou une réserve, c'est respecter l'interdiction d'y exploiter des ressources sans autorisation, signaler les activités illégales aux autorités compétentes, et sensibiliser son entourage à l'importance de préserver ces espaces.$$,
        'highlights', array[$$comportement responsable$$]::text[],
        'fixation', jsonb_build_object('question', $$Que peuvent faire les habitants du village de Diarra face à l'exploitation clandestine de la réserve ?$$, 'solution', $$Ils peuvent signaler ces activités illégales aux autorités forestières ou aux agents de protection de l'environnement compétents.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des chasseurs clandestins s'installent régulièrement dans une réserve forestière protégée pour capturer des animaux sauvages et les revendre.$$,
      'questions', array[
        $$Explique en quoi ce comportement menace la réserve forestière.$$,
        $$Cite deux conséquences possibles de cette activité pour l'environnement et pour les habitants voisins.$$,
        $$Propose une action responsable que la population pourrait mener face à cette situation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un parc national ou une réserve forestière ?$$,
      'hint', $$Pense à un espace protégé par la loi.$$,
      'expected', $$Un espace naturel protégé par la loi où la faune et la flore sont préservées et où les activités humaines destructrices sont interdites ou strictement encadrées.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux menaces qui pèsent sur les parcs nationaux et les réserves forestières.$$,
      'hint', $$Pense à la déforestation, au braconnage, à l'orpaillage clandestin.$$,
      'expected', $$Par exemple : la déforestation illégale et le braconnage (ou l'orpaillage clandestin, l'agriculture illégale).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la protection des parcs et réserves est-elle importante pour toute la population, et pas seulement pour les animaux ?$$,
      'hint', $$Pense au climat, à l'eau et aux ressources futures.$$,
      'expected', $$Parce qu'ils régulent le climat local, protègent les sols et les cours d'eau, préservent la biodiversité, et offrent des ressources futures comme l'écotourisme.$$
    ),
    jsonb_build_object(
      'question', $$Que peux-tu faire, en tant que citoyen, pour contribuer à la protection d'un parc ou d'une réserve ?$$,
      'hint', $$Pense au signalement des activités illégales et à la sensibilisation.$$,
      'expected', $$Signaler les activités illégales aux autorités compétentes, respecter les interdictions, et sensibiliser son entourage à l'importance de préserver ces espaces.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-parcs-reserves';
