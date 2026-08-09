-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (la dégradation des sols : causes naturelles et humaines, conséquences),
-- 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans une région où les paysans pratiquent depuis des années les feux de brousse et la culture répétée des mêmes parcelles, les rendements agricoles diminuent d'année en année et le sol devient de plus en plus pauvre.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les causes naturelles de la dégradation$$,
        'body', $$La dégradation naturelle des sols résulte principalement de l'érosion : l'érosion hydrique, provoquée par le ruissellement des eaux de pluie, et l'érosion éolienne, provoquée par le vent sur des sols dénudés.$$,
        'highlights', array[$$érosion hydrique$$, $$érosion éolienne$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La dégradation naturelle des sols résulte principalement de l'érosion hydrique, due au ruissellement, et de l'érosion éolienne, due au vent sur des sols dénudés.$$),
        'example', jsonb_build_object('statement', $$Pourquoi un sol nu, en pente, est-il particulièrement exposé à l'érosion hydrique ?$$, 'solution', $$Parce que la pluie ruisselle librement à sa surface, sans être freinée par la végétation, et entraîne les particules du sol vers le bas de la pente.$$),
        'fixation', jsonb_build_object('question', $$Dans quelle région, humide ou sèche, l'érosion éolienne est-elle la plus fréquente ?$$, 'solution', $$Dans les régions sèches, où la végétation est rare et le sol souvent dénudé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les causes liées aux activités humaines$$,
        'body', $$De nombreuses activités humaines aggravent la dégradation des sols : la déforestation, les feux de brousse répétés, la monoculture prolongée, le surpâturage et l'usage excessif de produits chimiques.$$,
        'highlights', array[$$déforestation$$, $$surpâturage$$, $$monoculture$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Pratique humaine$$, $$Effet sur le sol$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Déforestation$$, $$expose le sol au ruissellement et à l'érosion$$),
            jsonb_build_array($$Feux de brousse répétés$$, $$détruisent la matière organique et la végétation protectrice$$),
            jsonb_build_array($$Monoculture prolongée$$, $$épuise les mêmes éléments minéraux du sol$$),
            jsonb_build_array($$Surpâturage$$, $$détruit le couvert végétal et tasse le sol$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La déforestation, les feux de brousse répétés, la monoculture prolongée, le surpâturage et l'usage excessif de produits chimiques aggravent la dégradation des sols.$$),
        'example', jsonb_build_object('statement', $$Comment la monoculture prolongée d'une même plante appauvrit-elle le sol ?$$, 'solution', $$Parce que cette plante prélève toujours les mêmes éléments minéraux dans le sol, qui finissent par s'épuiser faute de reconstitution.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi les feux de brousse répétés appauvrissent-ils le sol ?$$, 'solution', $$Parce qu'ils détruisent la végétation et la matière organique de surface, réduisant la fertilité du sol et l'exposant davantage à l'érosion.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de la dégradation des sols$$,
        'body', $$La dégradation des sols entraîne une perte de fertilité et de matière organique, une baisse des rendements agricoles, et peut conduire, dans les cas les plus graves, à la désertification.$$,
        'highlights', array[$$désertification$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La dégradation des sols entraîne une perte de fertilité, une baisse des rendements agricoles, et peut conduire à la désertification.$$),
        'example', jsonb_build_object('statement', $$Quelle conséquence économique et sociale peut avoir la baisse continue des rendements agricoles d'une région ?$$, 'solution', $$Elle peut entraîner une insécurité alimentaire et un appauvrissement des populations qui dépendent de l'agriculture.$$),
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on la désertification ?$$, 'solution', $$C'est la transformation progressive d'un sol fertile en un sol pauvre, proche du désert, à la suite d'une dégradation avancée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les paysans de la région constatent que leurs récoltes de maïs sont de moins en moins abondantes, et que le sol de certaines parcelles est devenu rougeâtre, dur et presque nu.$$,
      'questions', array[
        $$Cite deux causes naturelles possibles de cette dégradation.$$,
        $$Cite deux pratiques agricoles des paysans qui peuvent avoir aggravé la situation.$$,
        $$Explique le lien entre la disparition de la végétation et l'accélération de l'érosion.$$,
        $$Quelle conséquence à long terme cette dégradation peut-elle avoir sur la vie des habitants de la région ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les deux formes principales d'érosion du sol ?$$,
      'hint', $$Pense à l'eau et au vent.$$,
      'expected', $$L'érosion hydrique, due au ruissellement de l'eau, et l'érosion éolienne, due à l'action du vent.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux activités humaines qui favorisent la dégradation des sols.$$,
      'hint', $$Pense aux pratiques agricoles.$$,
      'expected', $$Par exemple la déforestation et les feux de brousse répétés, ou la monoculture prolongée et le surpâturage.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la monoculture appauvrit-elle le sol au fil des années ?$$,
      'hint', $$Pense aux besoins nutritifs répétés de la même plante.$$,
      'expected', $$Parce que la même plante prélève sans cesse les mêmes éléments minéraux du sol, qui finissent par s'épuiser sans être reconstitués.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la désertification ?$$,
      'hint', $$Pense au stade final de la dégradation.$$,
      'expected', $$C'est la transformation d'un sol fertile en un sol pauvre et aride, proche du désert, résultant d'une dégradation avancée du sol.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-degradation-sols';
