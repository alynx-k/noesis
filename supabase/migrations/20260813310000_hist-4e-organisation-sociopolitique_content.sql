-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the standard
-- Ivorian 4ème Histoire programme on the two broad political models
-- (sociétés à pouvoir centralisé / sociétés à pouvoir non centralisé) found
-- among Côte d'Ivoire's precolonial peoples. Kept qualitative on specific
-- kingdoms where precise figures are not reliably known. 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans un exposé, Kader explique que le village de son grand-père, en pays sénoufo, était traditionnellement dirigé par un conseil des anciens et non par un roi. Sa camarade Affoué répond qu'en pays baoulé, au contraire, une reine ou un roi dirigeait autrefois toute une chefferie. Comment expliquer que les peuples de Côte d'Ivoire n'aient pas tous été organisés politiquement de la même façon ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Deux grands modèles d'organisation politique$$,
        'body', $$Les peuples de Côte d'Ivoire du XVIème au XVIIIème siècle se répartissent en deux grands modèles d'organisation sociopolitique : les sociétés à pouvoir centralisé, dirigées par un chef ou un roi unique disposant d'une autorité sur un territoire étendu, et les sociétés à pouvoir non centralisé (ou sociétés segmentaires), où l'autorité est répartie entre plusieurs chefs de lignage ou un conseil des anciens, sans chef suprême unique.$$,
        'highlights', array[$$pouvoir centralisé$$, $$pouvoir non centralisé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$On distingue les sociétés à pouvoir centralisé (autorité concentrée entre les mains d'un chef ou d'un roi unique) et les sociétés à pouvoir non centralisé (autorité partagée entre plusieurs chefs de lignage ou un conseil des anciens, sans chef suprême).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la principale différence entre une société à pouvoir centralisé et une société à pouvoir non centralisé ?$$, 'solution', $$Dans la première, l'autorité est concentrée entre les mains d'un chef ou d'un roi unique ; dans la seconde, elle est partagée entre plusieurs chefs de lignage ou un conseil des anciens.$$)
      ),
      jsonb_build_object(
        'heading', $$Les sociétés à pouvoir centralisé$$,
        'body', $$Chez certains peuples akan, comme dans des chefferies ou royaumes tels que le royaume de Sanwi ou le royaume abron, le pouvoir est détenu par un roi ou un chef suprême, entouré d'une cour de dignitaires, de chefs de province et de conseillers. Le roi rend la justice, dirige les affaires militaires et religieuses, et son autorité s'exerce sur plusieurs villages ou provinces.$$,
        'highlights', array[$$roi$$, $$chefferie$$, $$dignitaires$$]::text[],
        'example', jsonb_build_object('statement', $$Cite un exemple de peuple de Côte d'Ivoire organisé selon un modèle de pouvoir centralisé.$$, 'solution', $$Certains peuples akan, organisés en royaumes ou chefferies dirigés par un roi entouré de dignitaires, comme le royaume de Sanwi.$$),
        'fixation', jsonb_build_object('question', $$Qui entoure le roi dans une société à pouvoir centralisé et quel est son rôle ?$$, 'solution', $$Une cour de dignitaires et de conseillers, qui l'aident à administrer la justice et à diriger les affaires militaires et religieuses.$$)
      ),
      jsonb_build_object(
        'heading', $$Les sociétés à pouvoir non centralisé$$,
        'body', $$Chez d'autres peuples, comme certains peuples voltaïques (sénoufo, lobi) ou krou, il n'existe pas de chef suprême unique : chaque village ou lignage est dirigé par un chef de terre ou un conseil des anciens, respecté pour son âge et sa sagesse. Les décisions importantes sont prises collectivement, souvent lors de réunions villageoises, et les classes d'âge ou les sociétés d'initiation jouent un rôle important dans l'organisation sociale.$$,
        'highlights', array[$$conseil des anciens$$, $$chef de terre$$, $$classes d'âge$$]::text[],
        'example', jsonb_build_object('statement', $$Comment sont prises les décisions importantes dans une société à pouvoir non centralisé ?$$, 'solution', $$Collectivement, par un conseil des anciens ou une assemblée villageoise, plutôt que par un chef suprême unique.$$),
        'fixation', jsonb_build_object('question', $$Cite un exemple de peuple de Côte d'Ivoire organisé selon un modèle de pouvoir non centralisé.$$, 'solution', $$Par exemple les Sénoufo ou les Lobi (peuples voltaïques), organisés en villages dirigés par un conseil des anciens.$$)
      ),
      jsonb_build_object(
        'heading', $$Des éléments communs à toutes les sociétés$$,
        'body', $$Malgré ces différences, tous les peuples de Côte d'Ivoire partagent certains éléments communs : l'importance de la famille et du lignage, la distinction entre le chef de terre (garant du sol et des rites liés à la terre) et le chef politique lorsqu'il existe, ainsi que le respect des anciens comme détenteurs de la sagesse et de la tradition.$$,
        'highlights', array[$$lignage$$, $$chef de terre$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel élément est commun à toutes les organisations sociopolitiques des peuples de Côte d'Ivoire ?$$, 'solution', $$L'importance de la famille, du lignage et le respect des anciens comme détenteurs de la sagesse et de la tradition.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un chercheur étudie deux villages voisins de Côte d'Ivoire : l'un est dirigé par un roi entouré de dignitaires, l'autre par un conseil des anciens sans chef suprême.$$,
      'questions', array[
        $$Nomme les deux grands modèles d'organisation sociopolitique des peuples de Côte d'Ivoire.$$,
        $$Décris comment fonctionne une société à pouvoir centralisé, avec un exemple.$$,
        $$Décris comment fonctionne une société à pouvoir non centralisé, avec un exemple.$$,
        $$Cite un élément commun aux deux types de sociétés.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on une société dirigée par un roi ou un chef unique disposant d'une autorité sur un territoire étendu ?$$,
      'hint', $$Pense au mot qui indique que le pouvoir est concentré.$$,
      'expected', $$Une société à pouvoir centralisé.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on une société où l'autorité est partagée entre plusieurs chefs de lignage ou un conseil des anciens ?$$,
      'hint', $$Pense au contraire de « centralisé ».$$,
      'expected', $$Une société à pouvoir non centralisé (ou société segmentaire).$$
    ),
    jsonb_build_object(
      'question', $$Cite un exemple de peuple de Côte d'Ivoire organisé en royaume ou chefferie centralisée.$$,
      'hint', $$Pense à un peuple akan.$$,
      'expected', $$Par exemple un peuple akan organisé en royaume, comme le royaume de Sanwi.$$
    ),
    jsonb_build_object(
      'question', $$Quel rôle joue le conseil des anciens dans une société à pouvoir non centralisé ?$$,
      'hint', $$Pense à la prise de décision collective.$$,
      'expected', $$Il prend collectivement les décisions importantes du village, en l'absence de chef suprême unique.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-4e-organisation-sociopolitique';
