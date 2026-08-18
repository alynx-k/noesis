-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1857: "EE 11: Prdtion-écrite_Rédiger_intro_conclusion"
-- (https://lyc.ecole-ci.org/course/view.php?id=1857), resource id 15734 —
-- "Séance 10 : rédiger l'introduction et la conclusion" (production
-- écrite). Contenu méthodologique réécrit à partir du PDF source (phrase
-- d'accrochage avec identité de l'auteur et source complète de la
-- citation, prise de position et annonce des axes ; conclusion = bilan +
-- ouverture facultative). Sujet et citation d'exemple ENTIÈREMENT
-- INVENTÉS (auteur et source fictifs), en cohérence avec la leçon
-- précédente et la politique « 100% contenu original ».
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-production-ecrite-introduction-conclusion',
  '1ere',
  'A',
  'francais',
  $$La production écrite : rédiger l'introduction et la conclusion$$,
  11,
  '1ere-a-fr-production-ecrite-rediger-paragraphe',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir rédigé les paragraphes argumentatifs de leur production écrite, les élèves de 1ère A doivent maintenant encadrer leur devoir d'une introduction qui présente clairement la citation et la source du sujet, et d'une conclusion qui fait le bilan de leur argumentation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La phrase d'accrochage de l'introduction$$,
        'body', $$L'introduction de la production écrite s'ouvre par une phrase d'accrochage qui présente : l'identité de l'auteur de la citation, la source complète de celle-ci (le titre du texte ou de l'article, l'ouvrage ou la revue dont elle est extraite, sa date de publication), puis la citation elle-même. Contrairement à la dissertation littéraire, la source doit être précisée avec ce niveau de détail (titre, date, support), car le sujet de production écrite provient souvent d'un article ou d'une interview.$$,
        'highlights', array[$$identité de l'auteur$$, $$source complète (titre, date, support)$$, $$citation$$]::text[],
        'property', jsonb_build_object('label', $$Règle$$, 'text', $$La phrase d'accrochage nomme l'auteur, précise la source complète (titre, support, date) avant de citer l'opinion.$$),
        'fixation', jsonb_build_object('question', $$Quelles informations sur la source doit contenir la phrase d'accrochage, en plus du nom de l'auteur ?$$, 'solution', $$Le titre du texte ou de l'article, l'ouvrage ou la revue dont il est extrait, et sa date de publication.$$)
      ),
      jsonb_build_object(
        'heading', $$La prise de position et l'annonce des axes$$,
        'body', $$Une seconde phrase annonce la position qui sera adoptée dans le développement — étayer ou réfuter l'opinion citée, selon la consigne — puis énumère brièvement les domaines ou axes qui seront développés (par exemple, pour un sujet sur la téléphonie mobile : les usages financiers, les infrastructures, l'impact économique).$$,
        'highlights', array[$$étayer ou réfuter$$, $$annoncer les axes/domaines$$]::text[],
        'example', jsonb_build_object('statement', $$Sujet : Un journaliste, dans un article intitulé « L'Afrique connectée » publié dans le magazine Le Digital Africain n°12 du 3 mars 2019, affirme : « Dans le domaine de la téléphonie mobile, l'Afrique n'a plus rien à envier aux autres continents. » Étayez cette assertion. Rédige l'introduction complète.$$, 'solution', $$Un journaliste, dans un article intitulé « L'Afrique connectée », publié dans le magazine Le Digital Africain n°12 du 3 mars 2019, soutient l'idée selon laquelle l'Afrique a comblé son retard en matière de téléphonie mobile par rapport aux autres continents. Dans un développement illustré d'exemples, nous étayerons cette affirmation sur les plans des usages financiers, des infrastructures et de l'impact économique du numérique.$$),
        'fixation', jsonb_build_object('question', $$Que doit annoncer la seconde phrase de l'introduction, en plus de la prise de position ?$$, 'solution', $$Les domaines ou axes qui seront développés dans le devoir.$$)
      ),
      jsonb_build_object(
        'heading', $$Le bilan de la conclusion$$,
        'body', $$La conclusion de la production écrite fait d'abord le bilan de l'argumentation menée dans le développement : elle résume, sans les répéter mot pour mot, ce que les différents paragraphes ont montré, et confirme la position adoptée (étayer ou réfuter) par rapport à l'opinion citée en introduction.$$,
        'highlights', array[$$bilan = résumé de l'argumentation$$, $$confirmer la position adoptée$$]::text[],
        'fixation', jsonb_build_object('question', $$Que doit faire le bilan de la conclusion, en plus de résumer le développement ?$$, 'solution', $$Confirmer clairement la position adoptée (étayer ou réfuter) par rapport à l'opinion citée dans le sujet.$$)
      ),
      jsonb_build_object(
        'heading', $$L'ouverture (facultative)$$,
        'body', $$Après le bilan, une ouverture facultative peut proposer d'autres orientations possibles sur la thématique, ou signaler des limites à la thèse de l'auteur — souvent sous la forme d'une question qui prolonge la réflexion sans y répondre.$$,
        'highlights', array[$$ouverture facultative$$, $$souvent une question qui prolonge$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige une conclusion complète (bilan + ouverture) pour le sujet sur la téléphonie mobile en Afrique.$$, 'solution', $$En définitive, il convient de retenir que le continent africain a su tirer parti du téléphone mobile pour combler certains retards, notamment sur le plan financier et économique. Ne conviendrait-il pas, dès lors, de s'interroger sur les moyens à mettre en œuvre pour que cette avancée numérique profite également aux zones les plus reculées du continent ?$$),
        'fixation', jsonb_build_object('question', $$L'ouverture est-elle obligatoire dans la conclusion d'une production écrite ?$$, 'solution', $$Non, elle est facultative (« si possible ») ; le bilan, en revanche, est obligatoire.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sujet : Une économiste, dans une tribune intitulée « Champs et cités » publiée dans le journal Le Sillon Vert n°8 du 14 janvier 2022, affirme : « L'agriculture n'est plus, en Côte d'Ivoire, une activité réservée aux zones rurales. » Étayez cette assertion.$$,
      'questions', array[
        $$Rédige la phrase d'accrochage de l'introduction (identité de l'auteure, source complète, citation).$$,
        $$Rédige la phrase de prise de position et d'annonce des axes.$$,
        $$Rédige une conclusion complète (bilan + ouverture) pour ce sujet.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles informations la phrase d'accrochage doit-elle donner sur l'auteur et la source, avant de citer l'opinion ?$$,
      'hint', $$Il y a trois éléments de source en plus du nom de l'auteur.$$,
      'expected', $$L'identité de l'auteur, le titre du texte/article, la revue ou l'ouvrage dont il est extrait, et sa date de publication.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les deux éléments de la conclusion d'une production écrite ?$$,
      'hint', $$L'un des deux est facultatif.$$,
      'expected', $$Le bilan de l'argumentation (obligatoire) et l'ouverture (facultative).$$
    ),
    jsonb_build_object(
      'question', $$Que doit préciser la seconde phrase de l'introduction, en plus de la prise de position (étayer ou réfuter) ?$$,
      'hint', $$C'est un aperçu de la structure du développement.$$,
      'expected', $$Les domaines ou axes qui seront développés dans le devoir.$$
    ),
    jsonb_build_object(
      'question', $$Sous quelle forme se présente souvent l'ouverture d'une conclusion ?$$,
      'hint', $$Elle prolonge la réflexion sans y répondre.$$,
      'expected', $$Sous la forme d'une question qui prolonge la réflexion ou signale une limite à la thèse défendue.$$
    )
  ),
  now()
);
