-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the
-- Ivorian 4ème Géographie programme on administrative deconcentration
-- (transfer of powers from the central State to its own representatives at
-- local level: préfet de région, préfet de département, sous-préfet), kept
-- qualitative on the exact current count of régions/départements since
-- these boundaries have been redrawn more than once. 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour renouveler sa carte d'identité, la famille de Sery se rend à la préfecture de son département, où un préfet représente l'État. Sery se demande pourquoi il n'a pas besoin d'aller jusqu'à Abidjan pour cette démarche, alors que l'État est censé être unique et centralisé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la déconcentration administrative ?$$,
        'body', $$La déconcentration administrative est le transfert de certains pouvoirs de décision de l'État central vers ses propres représentants installés dans les régions, départements et sous-préfectures. Ces représentants (préfets, sous-préfets) restent des agents de l'État, nommés par le pouvoir central, et agissent en son nom au niveau local, sans disposer d'une autonomie propre.$$,
        'highlights', array[$$déconcentration$$, $$représentants de l'État$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La déconcentration administrative est le transfert de pouvoirs de décision de l'État central vers ses propres représentants locaux (préfets, sous-préfets), qui demeurent des agents de l'État agissant en son nom, sans autonomie propre.$$),
        'fixation', jsonb_build_object('question', $$Qui nomme les préfets et sous-préfets, et au nom de qui agissent-ils ?$$, 'solution', $$Ils sont nommés par le pouvoir central (l'État) et agissent en son nom au niveau local.$$)
      ),
      jsonb_build_object(
        'heading', $$Les acteurs de la déconcentration en Côte d'Ivoire$$,
        'body', $$En Côte d'Ivoire, l'administration déconcentrée s'appuie principalement sur le préfet de région, représentant de l'État au niveau de la région, le préfet de département, qui coordonne l'action de l'État dans son département, et le sous-préfet, qui représente l'État au niveau de la sous-préfecture, échelon le plus proche des populations.$$,
        'highlights', array[$$préfet de région$$, $$préfet de département$$, $$sous-préfet$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Échelon territorial$$, $$Représentant de l'État$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Région$$, $$Préfet de région$$),
            jsonb_build_array($$Département$$, $$Préfet de département$$),
            jsonb_build_array($$Sous-préfecture$$, $$Sous-préfet$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Quel représentant de l'État intervient au niveau d'un département de Côte d'Ivoire ?$$, 'solution', $$Le préfet de département, qui coordonne l'action de l'État dans son département.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'échelon administratif le plus proche des populations, représenté par un sous-préfet ?$$, 'solution', $$La sous-préfecture.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rôle et les missions des services déconcentrés$$,
        'body', $$Les préfets et sous-préfets veillent au maintien de l'ordre public, appliquent les décisions et politiques nationales au niveau local, coordonnent les services techniques de l'État (santé, éducation, agriculture, etc.) présents dans leur circonscription, et servent d'intermédiaires entre les populations et l'administration centrale.$$,
        'highlights', array[$$ordre public$$, $$services techniques de l'État$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la déconcentration facilite-t-elle les démarches administratives des populations ?$$, 'solution', $$Parce qu'elle rapproche les services de l'État des citoyens, qui n'ont pas besoin de se déplacer jusqu'à la capitale pour effectuer certaines démarches.$$),
        'fixation', jsonb_build_object('question', $$Cite une mission d'un préfet dans sa circonscription.$$, 'solution', $$Maintenir l'ordre public, ou coordonner les services techniques de l'État, ou appliquer les décisions nationales au niveau local.$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages de la déconcentration$$,
        'body', $$La déconcentration permet de rapprocher l'administration des citoyens, d'accélérer le traitement des affaires courantes sans passer systématiquement par la capitale, et d'assurer une meilleure connaissance des réalités locales par les représentants de l'État, tout en gardant l'unité de décision au niveau national.$$,
        'highlights', array[$$proximité$$, $$efficacité administrative$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le principal avantage de la déconcentration pour les citoyens ?$$, 'solution', $$Elle rapproche l'administration des citoyens et accélère le traitement de leurs démarches, sans qu'ils aient à se rendre dans la capitale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un habitant d'une sous-préfecture éloignée d'Abidjan doit résoudre un problème administratif urgent et se demande à quel représentant de l'État s'adresser.$$,
      'questions', array[
        $$Définis la déconcentration administrative.$$,
        $$Cite les trois principaux représentants de l'État déconcentré, du niveau régional au niveau local.$$,
        $$Explique pourquoi cet habitant n'a pas besoin de se rendre à Abidjan pour son problème.$$,
        $$Cite un avantage de la déconcentration administrative.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la déconcentration administrative ?$$,
      'hint', $$Pense au transfert de pouvoirs vers les propres représentants de l'État.$$,
      'expected', $$Le transfert de pouvoirs de décision de l'État central vers ses propres représentants locaux (préfets, sous-préfets), qui agissent en son nom.$$
    ),
    jsonb_build_object(
      'question', $$Quel représentant de l'État agit au niveau d'une région en Côte d'Ivoire ?$$,
      'hint', $$C'est un préfet, mais à un échelon plus large que le département.$$,
      'expected', $$Le préfet de région.$$
    ),
    jsonb_build_object(
      'question', $$Quel représentant de l'État agit au niveau de la sous-préfecture ?$$,
      'hint', $$Son titre reprend le nom de cet échelon.$$,
      'expected', $$Le sous-préfet.$$
    ),
    jsonb_build_object(
      'question', $$Cite un avantage de la déconcentration administrative pour les populations.$$,
      'hint', $$Pense à la proximité des services.$$,
      'expected', $$Elle rapproche l'administration des citoyens et accélère le traitement de leurs démarches.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-4e-deconcentration-administrative';
