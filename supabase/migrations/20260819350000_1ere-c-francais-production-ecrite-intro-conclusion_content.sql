-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2332: "EE 11: Prdtion-écrite_Rédiger_intro_conclusion"
-- (https://lyc.ecole-ci.org/course/view.php?id=2332), resource id 21390.
-- Content is methodological, illustrated with the real Alphonse Boolamou
-- de Ligouri and Michel Tournier prompts, cited only as short attributed
-- opinions for pedagogical analysis — not reproduction of a creative
-- narrative work.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-production-ecrite-intro-conclusion',
  '1ere',
  'C',
  'francais',
  $$La production écrite : rédiger l'introduction et la conclusion$$,
  11,
  '1ere-c-francais-production-ecrite-paragraphe-argumentatif',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ayant rédigé le développement de leur production écrite sur l'assertion « S'il y a un domaine dans lequel l'Afrique a vite réduit l'écart de son retard par rapport aux autres continents, notamment l'Europe, c'est bien dans celui du football » (Alphonse Boolamou de Ligouri), les élèves de 1ère doivent maintenant rédiger l'introduction et la conclusion de leur devoir.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'introduction : phrase d'accrochage$$,
        'body', $$L'introduction est la porte d'entrée du devoir. Elle comporte une phrase d'accrochage, qui présente : l'identité de l'auteur ; la source de la citation (intitulé du texte ou de l'article, titre de l'ouvrage ou de la revue, sa date de publication, la maison d'édition) ; et la citation elle-même (intégrale si elle est courte).$$,
        'highlights', array[$$phrase d'accrochage = identité de l'auteur + source précise + citation$$]::text[],
        'example', jsonb_build_object('statement', $$Voici la phrase d'accrochage rédigée pour le sujet sur le football africain : « Alphonse Boolamou de Ligouri, dans son texte extrait de Stades d'Afrique n°31 du mercredi 05 avril 2006, soutient l'idée selon laquelle l'Afrique avoisine le développement de l'Occident en matière footballistique. » Identifie les trois éléments qui la composent.$$, 'solution', $$Identité de l'auteur : « Alphonse Boolamou de Ligouri ». Source : « son texte extrait de Stades d'Afrique n°31 du mercredi 05 avril 2006 ». Reformulation de la citation : « soutient l'idée selon laquelle l'Afrique avoisine le développement de l'Occident en matière footballistique. »$$),
        'fixation', jsonb_build_object('question', $$Quels éléments de source doit-on indiquer dans la phrase d'accrochage, en plus du nom de l'auteur ?$$, 'solution', $$L'intitulé du texte ou de l'article, le titre de l'ouvrage ou de la revue, sa date de publication, et éventuellement la maison d'édition.$$)
      ),
      jsonb_build_object(
        'heading', $$L'introduction : prise de position et annonce du plan$$,
        'body', $$Une seconde phrase annonce la prise de position (la position adoptée dans le développement, selon que la consigne demande d'étayer ou de réfuter) et le plan (les domaines ou axes qui seront développés).$$,
        'highlights', array[$$prise de position : dépend de la consigne (étayer / réfuter / discuter)$$, $$annonce du plan : les axes ou domaines développés dans le devoir$$]::text[],
        'example', jsonb_build_object('statement', $$Voici la suite de l'introduction du sujet 1 : « Dans un développement illustré d'exemples, nous étayerons cette affirmation sur les plans de la valeur marchande et de compétitivité du joueur, des infrastructures, et des vedettes catalyseurs du rayonnement de leur pays. » Que représente cette phrase ?$$, 'solution', $$C'est la prise de position (« nous étayerons cette affirmation ») accompagnée de l'annonce du plan (les axes développés : valeur marchande, compétitivité, infrastructures, rayonnement par les vedettes).$$),
        'fixation', jsonb_build_object('question', $$Que doit préciser la phrase de prise de position, en plus de la position elle-même ?$$, 'solution', $$Les domaines ou axes qui seront développés dans le devoir (l'annonce du plan).$$)
      ),
      jsonb_build_object(
        'heading', $$La conclusion : bilan et ouverture$$,
        'body', $$La conclusion comporte deux étapes : le bilan de l'argumentation, qui résume la démarche menée dans le développement ; et l'ouverture (si possible), qui envisage d'autres orientations possibles de la thématique, ou des limites à la thèse de l'auteur.$$,
        'highlights', array[$$conclusion = bilan de l'argumentation + ouverture (si possible)$$]::text[],
        'example', jsonb_build_object('statement', $$Voici la conclusion rédigée pour le sujet 1 : « En définitive, il convient de retenir que le football africain a contribué à sortir le continent de sa léthargie par le biais du talent de ses joueurs. Il serait convenable de doter ce sport de moyens et d'infrastructures conséquents afin de redorer le blason du continent africain en matière de sport et de représentativité dans le concert des nations. » Identifie le bilan et l'ouverture.$$, 'solution', $$Bilan : « le football africain a contribué à sortir le continent de sa léthargie par le biais du talent de ses joueurs. » Ouverture : « Il serait convenable de doter ce sport de moyens et d'infrastructures conséquents afin de redorer le blason du continent africain... »$$),
        'fixation', jsonb_build_object('question', $$L'ouverture est-elle une étape obligatoire de la conclusion d'une production écrite ?$$, 'solution', $$Non, elle est facultative (« si possible ») ; seul le bilan de l'argumentation est systématiquement attendu.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sujet 2 : « Réfutez la pensée de Michel Tournier selon laquelle pour certains écrivains le lecteur n'apparaît nullement comme le destinataire obligé de leur écrit. » (Michel Tournier, Le vol du vampire, 1981). Le développement de ce devoir étaye cette réfutation à travers trois axes : les productions scientifiques, les productions de jeunesse, et les productions populaires, chacune destinée à un public cible précis.$$,
      'questions', array[
        $$Rédige la phrase d'accrochage de l'introduction, en présentant l'identité de l'auteur, la source de la citation, et une reformulation de son opinion.$$,
        $$Rédige la phrase de prise de position et d'annonce du plan qui complète cette introduction.$$,
        $$Rédige une conclusion complète pour ce sujet, avec un bilan de l'argumentation et une ouverture sur une question ou une perspective plus large.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les deux éléments composant l'introduction d'une production écrite ?$$,
      'hint', $$L'un présente le texte-support, l'autre annonce la démarche.$$,
      'expected', $$La phrase d'accrochage (auteur, source, citation) et la phrase de prise de position et d'annonce du plan.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les deux éléments composant la conclusion d'une production écrite ?$$,
      'hint', $$L'un est systématique, l'autre facultatif.$$,
      'expected', $$Le bilan de l'argumentation (obligatoire) et l'ouverture (facultative, « si possible »).$$
    ),
    jsonb_build_object(
      'question', $$Sur quoi peut porter l'ouverture d'une conclusion de production écrite ?$$,
      'hint', $$Deux pistes sont mentionnées dans la méthodologie.$$,
      'expected', $$D'autres orientations possibles de la thématique, ou des limites à la thèse de l'auteur.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il indiquer, en plus du nom de l'auteur, pour bien sourcer une citation dans la phrase d'accrochage ?$$,
      'hint', $$C'est ce qui permet de retrouver précisément le texte d'origine.$$,
      'expected', $$L'intitulé du texte ou de l'article, le titre de l'ouvrage ou de la revue, et sa date de publication.$$
    )
  ),
  now()
);
