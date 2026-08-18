-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1853: "EE 8: Dissert_littér_Rédiger_Intro_Conclusion"
-- (https://lyc.ecole-ci.org/course/view.php?id=1853), resource id 15698 —
-- "Séance 5 : rédiger l'introduction et la conclusion" (Leçon 3 : la
-- dissertation littéraire). Contenu méthodologique réécrit à partir du
-- PDF source (amorce/présentation/annonce du plan pour l'introduction ;
-- bilan/prise de position/ouverture pour la conclusion). Le sujet
-- d'exemple du PDF cite nommément un auteur réel (Roger Caillois) : pour
-- rester sur la politique « 100% contenu original », le sujet d'exemple
-- ci-dessous est une citation ENTIÈREMENT INVENTÉE, non attribuée à une
-- personne réelle, avec la même méthode d'introduction/conclusion.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-dissertation-introduction-conclusion',
  '1ere',
  'A',
  'francais',
  $$La dissertation littéraire : rédiger l'introduction et la conclusion$$,
  8,
  '1ere-a-fr-dissertation-rediger-developpement',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir rédigé le développement de leur dissertation, les élèves de 1ère A doivent maintenant l'encadrer d'une introduction qui présente clairement le sujet, et d'une conclusion qui répond nettement à la problématique posée.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les trois fonctions de l'introduction$$,
        'body', $$Rédigée en un seul paragraphe, l'introduction remplit trois fonctions : l'amorce du sujet, qui indique le thème général à partir d'une réflexion sur le genre, l'histoire littéraire ou un fait marquant ; la présentation du sujet, qui cite intégralement l'opinion de l'auteur si elle est courte (ou la reformule si elle est longue) — on ne doit jamais se contenter d'y faire simplement allusion ; et l'annonce du plan, qui met en évidence la problématique et indique l'orientation des grandes parties, sans anticiper sur les conclusions du développement.$$,
        'highlights', array[$$amorce$$, $$présentation (citer intégralement si courte)$$, $$annonce du plan = problématique$$]::text[],
        'property', jsonb_build_object('label', $$Règle$$, 'text', $$Si l'opinion citée dans le sujet est courte, il faut la citer intégralement dans l'introduction, pas seulement y faire allusion.$$),
        'fixation', jsonb_build_object('question', $$Que faut-il faire si l'opinion citée dans le sujet est longue, plutôt que de la citer intégralement ?$$, 'solution', $$La reformuler, tout en restant fidèle à son sens.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple d'introduction rédigée$$,
        'body', $$Prenons un sujet fictif : « L'écrivain n'invente rien ; il transforme en mots ce que la société lui murmure. » Expliquez et discutez ce point de vue en vous appuyant sur les œuvres que vous avez lues ou étudiées. Voici comment construire l'introduction à partir des trois fonctions vues plus haut.$$,
        'highlights', array[$$amorce → citation intégrale → problématique$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige une introduction pour ce sujet.$$, 'solution', $$Les critiques n'ont jamais cessé de s'interroger sur l'origine de l'inspiration littéraire (amorce). C'est dans ce cadre qu'un critique affirme : « L'écrivain n'invente rien ; il transforme en mots ce que la société lui murmure » (présentation du sujet, citation intégrale). Cette opinion invite à se demander : en quoi la littérature est-elle façonnée par la société qui l'entoure ? Et cette influence épuise-t-elle tout ce qu'un écrivain peut créer ? (annonce du plan/problématique)$$),
        'fixation', jsonb_build_object('question', $$Dans l'exemple ci-dessus, quelle phrase correspond à l'amorce ?$$, 'solution', $$« Les critiques n'ont jamais cessé de s'interroger sur l'origine de l'inspiration littéraire. »$$)
      ),
      jsonb_build_object(
        'heading', $$Les trois fonctions de la conclusion$$,
        'body', $$La conclusion, elle aussi en un seul paragraphe, présente le bilan de la réflexion (un résumé, sans les reprendre à l'identique, des conclusions des grandes parties) et apporte une prise de position claire par rapport à la problématique — il ne faut jamais dire son impuissance à conclure. Une ouverture facultative peut ensuite élargir le débat : une mise en perspective, une nouvelle question, ou une citation qui laisse une impression forte.$$,
        'highlights', array[$$bilan$$, $$prise de position (obligatoire, jamais d'esquive)$$, $$ouverture (facultative)$$]::text[],
        'fixation', jsonb_build_object('question', $$Que faut-il éviter absolument dans la prise de position d'une conclusion de dissertation ?$$, 'solution', $$Dire son impuissance à conclure ou refuser de trancher entre les points de vue examinés.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de conclusion rédigée$$,
        'body', $$En reprenant le même sujet fictif, voici comment construire la conclusion à partir des trois fonctions vues plus haut.$$,
        'highlights', array[$$bilan → prise de position → ouverture$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige une conclusion pour ce sujet.$$, 'solution', $$En somme, la société imprègne bien la littérature à travers les thèmes et les préoccupations qu'elle lui inspire (bilan). Il serait toutefois excessif de réduire l'écriture à un simple reflet passif de la société : l'écrivain y ajoute toujours sa sensibilité propre, ce qui fait de chaque œuvre une création singulière et non une simple copie (prise de position). Cette tension entre héritage collectif et voix personnelle n'est-elle pas, en définitive, ce qui distingue une grande œuvre d'un simple témoignage d'époque ? (ouverture)$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le bilan d'une conclusion ne doit-il pas reprendre les parties du développement « à l'identique » ?$$, 'solution', $$Parce qu'il doit les résumer et les synthétiser, pas les répéter mot pour mot — la conclusion doit apporter une vision d'ensemble, pas un simple copier-coller.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un sujet : « Le théâtre n'est jamais aussi vrai que lorsqu'il fait rire de nos propres travers. » Expliquez et discutez ce point de vue en vous appuyant sur des exemples précis empruntés à vos lectures.$$,
      'questions', array[
        $$Rédige une introduction complète pour ce sujet, en respectant les trois fonctions vues dans ce cours.$$,
        $$Rédige une conclusion complète, avec au moins le bilan et la prise de position.$$,
        $$Propose une ouverture possible pour cette conclusion.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois fonctions de l'introduction d'une dissertation littéraire ?$$,
      'hint', $$On part du général vers le particulier, puis on annonce la suite.$$,
      'expected', $$L'amorce du sujet, la présentation du sujet (avec citation), et l'annonce du plan (la problématique).$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il faire d'une opinion citée dans le sujet si elle est courte ?$$,
      'hint', $$Ne pas se contenter d'y faire allusion.$$,
      'expected', $$La citer intégralement dans l'introduction.$$
    ),
    jsonb_build_object(
      'question', $$Quelle fonction de la conclusion est obligatoire : la prise de position ou l'ouverture ?$$,
      'hint', $$L'une des deux est facultative.$$,
      'expected', $$La prise de position est obligatoire ; l'ouverture est facultative.$$
    ),
    jsonb_build_object(
      'question', $$Par quoi peut-on clore une dissertation dans l'ouverture de la conclusion ?$$,
      'hint', $$Il y a plusieurs possibilités mentionnées dans le cours.$$,
      'expected', $$Par une mise en perspective historique, une nouvelle question découlant de la réponse donnée, ou une citation qui laisse une impression forte.$$
    )
  ),
  now()
);
