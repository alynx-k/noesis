-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- humanitarian organizations and assistance to populations in distress, in
-- 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après de fortes inondations dans un quartier d'Abidjan, plusieurs familles se retrouvent sans logement ni nourriture. Des bénévoles en gilets marqués « Croix-Rouge » arrivent avec des vivres et des tentes. Les élèves se demandent qui sont ces organisations et comment elles agissent pour les populations en détresse.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'une organisation humanitaire ?$$,
        'body', $$Une organisation humanitaire est une structure, publique ou privée, qui vient en aide aux personnes touchées par une catastrophe, un conflit ou une grande précarité, sans distinction d'origine, de religion ou d'opinion politique.$$,
        'highlights', array[$$organisation humanitaire$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'action humanitaire repose sur des principes de neutralité, d'impartialité et d'humanité : elle aide toute personne en détresse, quels que soient son camp ou sa situation.$$),
        'example', jsonb_build_object('statement', $$Lors d'un conflit, une organisation humanitaire soigne des blessés des deux camps sans faire de différence. Quel principe applique-t-elle ?$$, 'solution', $$Le principe de neutralité et d'impartialité : elle aide toutes les victimes sans prendre parti.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes organisations humanitaires$$,
        'body', $$Certaines organisations agissent à l'échelle mondiale, comme le Comité international de la Croix-Rouge, l'UNICEF ou le Programme alimentaire mondial ; d'autres agissent localement, comme des ONG et associations ivoiriennes qui interviennent au plus près des populations.$$,
        'highlights', array[$$organisations internationales$$, $$ONG locales$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Organisation$$, $$Domaine d'action principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Croix-Rouge / Croissant-Rouge$$, $$Secours d'urgence, premiers soins$$),
            jsonb_build_array($$UNICEF$$, $$Protection et bien-être des enfants$$),
            jsonb_build_array($$Programme alimentaire mondial$$, $$Lutte contre la faim$$),
            jsonb_build_array($$ONG locales ivoiriennes$$, $$Aide de proximité (quartiers, villages)$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite une organisation humanitaire internationale et son domaine d'action.$$, 'solution', $$Par exemple : l'UNICEF, qui agit pour la protection et le bien-être des enfants.$$)
      ),
      jsonb_build_object(
        'heading', $$Les domaines d'intervention face à la détresse$$,
        'body', $$Les organisations humanitaires interviennent dans plusieurs domaines : les secours d'urgence lors de catastrophes, la santé, l'alimentation, l'accès à l'eau potable, l'éducation et la reconstruction après une crise.$$,
        'highlights', array[$$secours d'urgence$$, $$populations en détresse$$]::text[],
        'example', jsonb_build_object('statement', $$Après les inondations d'Abidjan, quels types d'aide les organisations peuvent-elles apporter aux familles sinistrées ?$$, 'solution', $$Des vivres, des abris temporaires, des soins médicaux, de l'eau potable, et un accompagnement pour la reconstruction.$$)
      ),
      jsonb_build_object(
        'heading', $$La contribution de chacun à l'assistance humanitaire$$,
        'body', $$Chaque citoyen peut soutenir l'action humanitaire, par le bénévolat, les dons, ou simplement en relayant des informations utiles. La solidarité de tous renforce l'efficacité de l'aide apportée aux populations en détresse.$$,
        'highlights', array[$$solidarité$$, $$bénévolat$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite une action simple qu'un élève peut faire pour soutenir une organisation humanitaire.$$, 'solution', $$Par exemple : participer à une collecte de vivres ou de vêtements organisée par l'école, ou faire du bénévolat lors d'une action locale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un incendie a détruit plusieurs habitations dans un village. Une organisation humanitaire locale organise une collecte de vivres et de matériel de première nécessité, et appelle les jeunes du village à participer.$$,
      'questions', array[
        $$Explique le rôle de cette organisation humanitaire dans cette situation.$$,
        $$Cite deux principes que doit respecter une organisation humanitaire dans son action.$$,
        $$Propose une façon dont toi, élève, pourrais contribuer à cette collecte.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Définis ce qu'est une organisation humanitaire.$$,
      'hint', $$Pense à qui elle aide et pourquoi.$$,
      'expected', $$Une organisation qui vient en aide aux personnes touchées par une catastrophe, un conflit ou une grande précarité, sans distinction d'origine, de religion ou d'opinion.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux organisations humanitaires et précise leur domaine d'action.$$,
      'hint', $$Pense à la Croix-Rouge, l'UNICEF, le PAM ou une ONG locale.$$,
      'expected', $$Par exemple : la Croix-Rouge (secours d'urgence, premiers soins) et l'UNICEF (protection des enfants), ou toute autre paire cohérente.$$
    ),
    jsonb_build_object(
      'question', $$Quels principes fondamentaux guident l'action humanitaire ?$$,
      'hint', $$Pense à la neutralité et à l'impartialité.$$,
      'expected', $$La neutralité, l'impartialité et l'humanité : aider toute personne en détresse sans distinction de camp, d'origine ou d'opinion.$$
    ),
    jsonb_build_object(
      'question', $$Comment un élève peut-il concrètement contribuer à l'assistance des populations en détresse ?$$,
      'hint', $$Pense au bénévolat, aux dons ou à la sensibilisation.$$,
      'expected', $$En participant à une collecte de vivres ou de vêtements, en faisant du bénévolat, ou en sensibilisant son entourage à une cause humanitaire.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-organisations-humanitaires';
