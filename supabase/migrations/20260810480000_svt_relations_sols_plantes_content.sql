-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (les relations sols-plantes : le sol support et réservoir, absorption
-- racinaire, action des plantes sur le sol), 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un cultivateur remarque que ses plants de maïs poussent plus vigoureusement dans une parcelle que dans une autre. Il se demande quel rôle joue exactement le sol dans la croissance de ses plantes, et si les plantes, en retour, agissent aussi sur le sol.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le sol, support et réservoir pour la plante$$,
        'body', $$Le sol joue un double rôle pour la plante : il assure son ancrage grâce aux racines et constitue un réservoir d'eau, de sels minéraux et d'air indispensables à sa croissance.$$,
        'highlights', array[$$support$$, $$réservoir nutritif$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le sol assure l'ancrage de la plante grâce aux racines et constitue un réservoir d'eau, de sels minéraux et d'air indispensables à sa croissance.$$),
        'example', jsonb_build_object('statement', $$Que se passerait-il si le sol autour d'une plante était trop compact et manquait d'air ?$$, 'solution', $$Les racines respireraient mal, ce qui gênerait l'absorption de l'eau et des sels minéraux et ralentirait la croissance de la plante.$$),
        'fixation', jsonb_build_object('question', $$Cite deux éléments que le sol fournit à la plante pour sa croissance.$$, 'solution', $$L'eau et les sels minéraux ; on peut aussi citer l'air et un support d'ancrage.$$)
      ),
      jsonb_build_object(
        'heading', $$L'absorption racinaire$$,
        'body', $$Les racines, grâce à leurs poils absorbants qui augmentent la surface d'échange avec le sol, absorbent l'eau et les sels minéraux dissous, formant la sève brute qui circule ensuite vers les feuilles.$$,
        'highlights', array[$$absorption racinaire$$, $$poils absorbants$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les racines absorbent l'eau et les sels minéraux dissous grâce à leurs poils absorbants, formant la sève brute qui circule vers les feuilles.$$),
        'example', jsonb_build_object('statement', $$Quel est le rôle des poils absorbants situés à l'extrémité des jeunes racines ?$$, 'solution', $$Ils augmentent la surface de contact entre la racine et le sol, ce qui facilite l'absorption de l'eau et des sels minéraux.$$),
        'fixation', jsonb_build_object('question', $$Comment se nomme le mélange d'eau et de sels minéraux absorbé par les racines ?$$, 'solution', $$La sève brute.$$)
      ),
      jsonb_build_object(
        'heading', $$L'action des plantes sur le sol$$,
        'body', $$En retour, les plantes contribuent à la formation et à la protection du sol : leurs racines le retiennent et limitent l'érosion, tandis que leurs débris, en se décomposant, enrichissent le sol en matière organique appelée humus.$$,
        'highlights', array[$$érosion$$, $$humus$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les racines des plantes retiennent le sol et limitent l'érosion, tandis que leurs débris, en se décomposant, enrichissent le sol en matière organique.$$),
        'example', jsonb_build_object('statement', $$Pourquoi un sol nu, sans végétation, est-il plus exposé à l'érosion qu'un sol couvert de plantes ?$$, 'solution', $$Parce que les racines des plantes retiennent les particules du sol et le couvert végétal amortit l'impact de la pluie et du vent, ce qui limite leur entraînement.$$),
        'fixation', jsonb_build_object('question', $$Comment les débris végétaux contribuent-ils à la fertilité du sol ?$$, 'solution', $$En se décomposant, ils enrichissent le sol en matière organique, l'humus, qui améliore sa fertilité.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le cultivateur décide de comparer deux parcelles : l'une couverte de végétation naturelle, l'autre laissée nue après un défrichement.$$,
      'questions', array[
        $$Explique ce que le sol apporte aux plantes de la parcelle végétalisée.$$,
        $$Décris comment l'eau et les sels minéraux sont absorbés par les racines.$$,
        $$Explique pourquoi la parcelle nue risque davantage l'érosion que la parcelle végétalisée.$$,
        $$Explique comment la végétation contribue à enrichir le sol au fil du temps.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les deux rôles principaux du sol pour une plante ?$$,
      'hint', $$Pense à l'ancrage et à la nutrition.$$,
      'expected', $$Le sol sert de support pour l'ancrage des racines et de réservoir d'eau, de sels minéraux et d'air pour la plante.$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on la sève brute ?$$,
      'hint', $$Pense à ce qu'absorbent les racines.$$,
      'expected', $$C'est le mélange d'eau et de sels minéraux absorbé par les racines et qui circule vers les feuilles.$$
    ),
    jsonb_build_object(
      'question', $$Comment les racines des plantes protègent-elles le sol contre l'érosion ?$$,
      'hint', $$Pense à leur action mécanique dans le sol.$$,
      'expected', $$Les racines retiennent les particules du sol et limitent leur entraînement par l'eau de ruissellement ou le vent.$$
    ),
    jsonb_build_object(
      'question', $$Comment la décomposition des débris végétaux influence-t-elle la fertilité du sol ?$$,
      'hint', $$Pense à l'humus.$$,
      'expected', $$Elle enrichit le sol en matière organique, l'humus, ce qui améliore sa fertilité et sa capacité à nourrir les plantes.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-relations-sols-plantes';
