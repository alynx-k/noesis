-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2316: "EE 5: Dissert_littér_Rechercher_ldées"
-- (https://lyc.ecole-ci.org/course/view.php?id=2316), resource id 21210.
-- Content is methodological (démarche de recherche d'idées) illustrated by
-- real published works and authors, cited only by title/author/theme as
-- factual literary references (standard bibliographic/example use), not
-- reproduced in their content.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-dissertation-rechercher-idees',
  '1ere',
  'C',
  'francais',
  $$La dissertation littéraire : rechercher les idées$$,
  5,
  '1ere-c-francais-dissertation-analyser-sujet',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir analysé le sujet « Toute littérature participe d'une civilisation, aucun livre ne sort des battements d'un cœur. Une littérature existe dans une société et en reçoit l'empreinte. » (Roger Caillois), les élèves de 1ère doivent maintenant rechercher les idées et les exemples qui leur permettront d'étayer leur argumentation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Principe de la recherche des idées$$,
        'body', $$Pour traiter un sujet de dissertation littéraire, il faut baser son argumentation sur des idées recherchées dans différents domaines de la littérature (l'auteur, l'œuvre, le lecteur), en fonction du thème général du sujet. Ces idées doivent être précises, pertinentes, et surtout en relation étroite avec le sujet et sa problématique. D'anciens sujets de dissertation peuvent eux-mêmes servir d'idées. Chaque idée doit être illustrée par un exemple précis (œuvre et auteur) pour être plus convaincante.$$,
        'highlights', array[$$idées recherchées dans 3 domaines : l'auteur, l'œuvre, le lecteur$$, $$une idée sans exemple précis n'est pas convaincante$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois domaines dans lesquels on recherche des idées pour une dissertation littéraire ?$$, 'solution', $$L'auteur, l'œuvre, et le lecteur.$$)
      ),
      jsonb_build_object(
        'heading', $$La littérature, reflet de la société$$,
        'body', $$Sur le plan idéologique et politique, la littérature dénonce les régimes dictatoriaux (Les soleils des indépendances, Ahmadou Kourouma ; Les voix dans le vent, Bernard B. Dadié) et les rivalités politiques (On se chamaille pour un siège, Hyacinthe Kacou ; Tribaliques, Henri Lopes). Sur le plan culturel, elle dénonce des coutumes jugées rétrogrades (Rebelle, Fatou Keïta ; Le respect des morts, Amadou Koné), l'acculturation (L'appel des arènes, Aminata Sow Fall ; L'aventure ambiguë, Cheikh Hamidou Kane), et valorise des cultures méconnues (« Prières aux masques » dans Chants d'ombre, Léopold Sédar Senghor ; Le monde s'effondre, Chinua Achebe).$$,
        'highlights', array[$$plan idéologique/politique : dénonciation des dictatures et des rivalités politiques$$, $$plan culturel : dénonciation de coutumes rétrogrades, de l'acculturation ; valorisation de cultures méconnues$$]::text[],
        'example', jsonb_build_object('statement', $$Cite un exemple d'œuvre illustrant la dénonciation de l'acculturation du Noir par la littérature.$$, 'solution', $$L'aventure ambiguë de Cheikh Hamidou Kane, ou L'appel des arènes d'Aminata Sow Fall.$$),
        'fixation', jsonb_build_object('question', $$Donne un exemple d'œuvre littéraire dénonçant un régime dictatorial.$$, 'solution', $$Les soleils des indépendances d'Ahmadou Kourouma (ou Les voix dans le vent de Bernard B. Dadié).$$)
      ),
      jsonb_build_object(
        'heading', $$Les autres aspects de la littérature$$,
        'body', $$Au-delà du reflet social, la littérature est aussi l'expression des sentiments personnels (Les contemplations, Victor Hugo ; Les méditations poétiques, Alphonse de Lamartine ; Climbié, Bernard Dadié) ; elle exprime le beau, l'esthétique (Calligrammes, Guillaume Apollinaire ; Le capitaine Fracasse, Théophile Gautier) ; elle évoque la fiction et favorise l'évasion (La planète des singes, Pierre Boulle ; Vingt mille lieues sous les mers, Jules Verne).$$,
        'highlights', array[$$autres fonctions de la littérature : expression des sentiments, recherche du beau, fiction/évasion$$]::text[],
        'example', jsonb_build_object('statement', $$Cite une œuvre illustrant la littérature comme expression de sentiments personnels.$$, 'solution', $$Les contemplations de Victor Hugo (ou Les méditations poétiques d'Alphonse de Lamartine).$$),
        'fixation', jsonb_build_object('question', $$Quel argument permet de nuancer la thèse selon laquelle la littérature n'est que le reflet de la société ?$$, 'solution', $$La littérature exprime aussi des sentiments personnels, la recherche du beau et de la fiction, ce qui dépasse la simple fonction de reflet social.$$)
      ),
      jsonb_build_object(
        'heading', $$Application : rechercher les idées pour un autre sujet$$,
        'body', $$Pour le sujet sur la lecture (« on se lit à travers les livres »), on peut organiser les idées ainsi : d'abord, la lecture permet la découverte et la formation de soi — le livre est un miroir qui permet une identification aux personnages (Eugène de Rastignac dans Le père Goriot, Honoré de Balzac) ou à leurs sentiments (Fama dans Les soleils des indépendances, Ahmadou Kourouma), et permet aussi de découvrir ses propres travers par une prise de conscience (L'avare, Molière). Ensuite, on peut nuancer : la lecture n'a pas pour seul bénéfice la découverte de soi — elle permet aussi de découvrir d'autres cultures (Le monde s'effondre, Chinua Achebe) et d'autres sentiments (Une si longue lettre, Mariama Bâ), d'acquérir des connaissances (L'enfant noir, Camara Laye), et de se divertir (les romans d'aventure ou policiers).$$,
        'highlights', array[$$identification aux personnages/sentiments = miroir de soi$$, $$autres bénéfices : découverte des autres, connaissances, divertissement$$]::text[],
        'fixation', jsonb_build_object('question', $$Selon quelle démarche organise-t-on les idées lorsqu'un sujet appelle à « expliquer et discuter » une thèse ?$$, 'solution', $$On développe d'abord des idées confirmant la thèse (l'expliquer), puis on recherche des idées qui la nuancent ou l'élargissent (la discuter).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le sujet 1 : « Toute littérature participe d'une civilisation, aucun livre ne sort des battements d'un cœur. Une littérature existe dans une société et en reçoit l'empreinte. » (Roger Caillois). La problématique dégagée était : « Quel rapport y a-t-il entre la production littéraire et la société ? La société est-elle la seule source d'inspiration du livre ? »$$,
      'questions', array[
        $$Propose un argument (avec un exemple d'œuvre) illustrant la première partie : en quoi la littérature reflète-t-elle la société, sur un plan autre que politique ou culturel (par exemple économique ou social) ?$$,
        $$Propose un argument (avec un exemple d'œuvre) illustrant que la littérature dépasse le simple reflet de la société.$$,
        $$Explique pourquoi il est important d'illustrer chaque idée par un exemple précis d'œuvre et d'auteur, plutôt que de rester au niveau des idées générales.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Pourquoi une idée avancée dans une dissertation littéraire doit-elle être illustrée par un exemple précis ?$$,
      'hint', $$Cela concerne la crédibilité de l'argumentation.$$,
      'expected', $$Pour être plus valable et plus convaincante ; une idée non illustrée reste abstraite et peu persuasive.$$
    ),
    jsonb_build_object(
      'question', $$Cite un exemple d'œuvre illustrant la dénonciation de coutumes jugées rétrogrades par la littérature.$$,
      'hint', $$Deux œuvres du corpus étudié illustrent ce point.$$,
      'expected', $$Rebelle de Fatou Keïta (ou Le respect des morts d'Amadou Koné).$$
    ),
    jsonb_build_object(
      'question', $$Quel processus permet au lecteur de s'identifier aux personnages d'une œuvre ?$$,
      'hint', $$C'est une des façons dont le livre agit comme un miroir.$$,
      'expected', $$L'identification aux personnages (à leurs rêves, ambitions) et à leurs sentiments (joies et peines).$$
    ),
    jsonb_build_object(
      'question', $$Selon la démarche vue en cours, une dissertation littéraire doit-elle se limiter à confirmer la thèse de l'information ?$$,
      'hint', $$Cela dépend de la consigne (« expliquer et discuter »).$$,
      'expected', $$Non : lorsque la consigne demande de « discuter », il faut aussi rechercher des idées qui nuancent ou élargissent la thèse initiale.$$
    )
  ),
  now()
);
