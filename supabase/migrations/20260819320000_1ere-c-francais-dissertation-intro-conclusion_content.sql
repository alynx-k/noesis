-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2324: "EE 8: Dissert_littér_Rédiger_Intro_Conclusion"
-- (https://lyc.ecole-ci.org/course/view.php?id=2324), resource id 21294.
-- Content is methodological, illustrated with real short attributed
-- citations (Roger Caillois, Romain Rolland, Aimé Césaire), used here for
-- pedagogical/critical commentary — brief quotation for analysis, not
-- reproduction of a creative narrative work.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-dissertation-intro-conclusion',
  '1ere',
  'C',
  'francais',
  $$La dissertation littéraire : rédiger l'introduction et la conclusion$$,
  8,
  '1ere-c-francais-dissertation-rediger-developpement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir rédigé le développement du sujet « Toute littérature participe d'une civilisation... » (Roger Caillois), les élèves de 1ère doivent maintenant rédiger l'introduction et la conclusion de leur dissertation littéraire, pour achever leur devoir.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les trois fonctions de l'introduction$$,
        'body', $$L'introduction présente en un seul paragraphe le sujet et l'organisation du devoir. Elle remplit trois fonctions : l'amorce du sujet (indiquer le thème général, en partant d'une réflexion sur le genre, l'histoire littéraire, le contexte, ou un fait paradoxal) ; la présentation du sujet (citer intégralement l'opinion de l'auteur si elle est courte, ou la reformuler si elle est longue — jamais y faire simplement allusion) ; l'annonce du plan (indiquer les orientations des grandes parties, sans anticiper sur l'aboutissement de l'argumentation), qui met aussi en évidence la problématique.$$,
        'highlights', array[$$introduction = amorce + présentation du sujet (citation intégrale ou reformulée) + annonce du plan$$, $$ne jamais supposer le sujet déjà connu du lecteur : il faut le citer ou le reformuler$$]::text[],
        'example', jsonb_build_object('statement', $$Voici l'introduction rédigée pour le sujet sur Roger Caillois : « Les critiques ne cessent de réfléchir sur le rôle de l'œuvre littéraire. C'est dans ce cadre que Roger Caillois soutient : "toute littérature participe d'une civilisation, aucun livre ne sort des battements d'un cœur. Une littérature existe dans une société et en reçoit l'empreinte." En d'autres termes, la littérature est le reflet de la société. Cette opinion suscite des réflexions sur les questions suivantes : En quoi l'œuvre littéraire est-elle le reflet de la société ? Quels en sont les autres aspects ? » Identifie les trois fonctions dans ce texte.$$, 'solution', $$Amorce : « Les critiques ne cessent de réfléchir sur le rôle de l'œuvre littéraire. » Présentation du sujet : la citation intégrale de Roger Caillois, suivie de sa reformulation (« la littérature est le reflet de la société »). Annonce du plan (avec la problématique) : « En quoi l'œuvre littéraire est-elle le reflet de la société ? Quels en sont les autres aspects ? »$$),
        'fixation', jsonb_build_object('question', $$Que doit-on faire si l'opinion citée dans le sujet est longue ?$$, 'solution', $$La reformuler avec ses propres mots, plutôt que la citer intégralement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les fonctions de la conclusion$$,
        'body', $$La conclusion présente, en un seul paragraphe, le bilan de la réflexion et apporte une réponse claire aux questions posées par la problématique. Elle remplit trois fonctions : le bilan des analyses (résumé de la démonstration, qui rappelle sans les reprendre à l'identique les conclusions partielles des grandes parties) ; la prise de position (choisir et indiquer clairement le point de vue retenu, sans dire son impuissance à conclure) ; l'ouverture (facultative — élargir le champ argumentatif par une mise en perspective, une question qui découle de la réponse donnée, ou une citation qui laisse une impression forte).$$,
        'highlights', array[$$conclusion = bilan des analyses + prise de position (obligatoire, claire) + ouverture (facultative)$$, $$il ne faut jamais dire son impuissance à conclure$$]::text[],
        'example', jsonb_build_object('statement', $$Voici la conclusion rédigée pour le sujet sur Roger Caillois : « En somme, la littérature reflète effectivement la société. Mais elle présente aussi d'autres aspects, notamment l'expression des sentiments personnels, de l'esthétique et de la fiction. Ce caractère multidimensionnel constitue l'essence de l'œuvre littéraire. Il ne serait donc pas juste de la réduire à un seul aspect qui la dénaturerait. Mais pour mieux saisir le rôle de la littérature, ne serait-il pas judicieux de s'interroger sur l'attente du lecteur ? » Identifie les trois fonctions.$$, 'solution', $$Bilan : « la littérature reflète effectivement la société. Mais elle présente aussi d'autres aspects... » Prise de position : « Il ne serait donc pas juste de la réduire à un seul aspect qui la dénaturerait. » Ouverture : « ne serait-il pas judicieux de s'interroger sur l'attente du lecteur ? »$$),
        'fixation', jsonb_build_object('question', $$La prise de position est-elle une étape facultative de la conclusion ?$$, 'solution', $$Non, elle est obligatoire (contrairement à l'ouverture, qui est facultative) : il faut clairement choisir et indiquer un point de vue.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sujet d'évaluation : parlant du théâtre, Aimé Césaire déclarait, au cours d'une interview accordée à la revue Recherche Pédagogique et Culture n°64 de novembre 1981, que le théâtre est le meilleur moyen de faire prendre conscience aux gens. Consigne : « Expliquez et discutez cette opinion en vous appuyant sur des exemples précis empruntés à vos lectures ou à votre expérience de lecteur. »$$,
      'questions', array[
        $$Rédige l'amorce et la présentation du sujet pour l'introduction de cette dissertation (tu peux reformuler l'opinion de Césaire, puisqu'elle est donnée « en substance »).$$,
        $$Formule la problématique de ce sujet et rédige l'annonce du plan qui clôt l'introduction.$$,
        $$Rédige une conclusion complète pour ce sujet (bilan, prise de position, et une ouverture facultative), en supposant un plan dialectique qui aurait d'abord montré comment le théâtre fait prendre conscience, puis nuancé cette thèse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois fonctions de l'introduction d'une dissertation littéraire ?$$,
      'hint', $$Elles vont du général au particulier, jusqu'au plan.$$,
      'expected', $$L'amorce du sujet, la présentation du sujet (citation ou reformulation), et l'annonce du plan.$$
    ),
    jsonb_build_object(
      'question', $$Que ne faut-il jamais faire lors de la présentation du sujet dans l'introduction ?$$,
      'hint', $$Cela concerne le traitement de la citation ou de l'opinion donnée.$$,
      'expected', $$Se contenter de faire simplement allusion au sujet en le supposant déjà connu du lecteur ou du correcteur.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les trois fonctions possibles de la conclusion, et laquelle est facultative ?$$,
      'hint', $$Deux sont obligatoires, une est optionnelle.$$,
      'expected', $$Le bilan des analyses, la prise de position (toutes deux obligatoires), et l'ouverture (facultative).$$
    ),
    jsonb_build_object(
      'question', $$Que doit-on absolument éviter dans la prise de position de la conclusion ?$$,
      'hint', $$C'est l'inverse même du but d'une argumentation.$$,
      'expected', $$Dire son impuissance à conclure : il faut clairement choisir et indiquer le point de vue retenu.$$
    )
  ),
  now()
);
