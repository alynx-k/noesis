-- REAL methodology sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2294: "EE 3: Com_composé_rédiger_intro_et_conclusion"
-- (https://lyc.ecole-ci.org/course/view.php?id=2294), resource id 20934.
-- The pedagogical method (composantes de l'introduction et de la
-- conclusion, démarches récapitulatives) is reproduced from the source,
-- which is methodological and not subject to copyright concern. As in the
-- two prior lessons, the source's illustrative literary texts (Sembène
-- Ousmane, "Lettres de France", 1962; Denise Jallais, "Maturité",
-- 1969/1987) were NOT reproduced — both are copyrighted creative works.
-- The redaction examples instead build on the original "Aïssata" text and
-- "Avant" poem composed for the two previous migrations
-- (1ere-c-francais-commentaire-compose, 1ere-c-francais-rediger-centre-interet),
-- preserving continuity and the same teaching point. The comparison works
-- cited in the "ouverture" examples (Mathurin Goli Bi Irié, "Sous le voile
-- de la mariée" ; Léopold Sédar Senghor, "Nuit de Sine") are real published
-- works, cited only by title/author/theme as factual literary references,
-- not reproduced.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-introduction-conclusion',
  '1ere',
  'C',
  'francais',
  $$Rédiger l'introduction et la conclusion du commentaire composé$$,
  3,
  '1ere-c-francais-rediger-centre-interet',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir organisé leurs centres d'intérêt et rédigé un centre d'intérêt sur le texte d'Aïssata, les élèves de 1ère veulent achever leur commentaire composé en rédigeant une introduction et une conclusion conformes à la méthodologie de l'exercice.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Méthodologie de l'introduction$$,
        'body', $$L'introduction du commentaire composé comporte trois étapes : la contextualisation (ou perspective générale), qui situe le texte en partant du thème, du genre littéraire ou de la vie de l'auteur ; la présentation du texte, qui indique le titre du texte, le nom de l'auteur, le titre et la date de publication de l'œuvre, et dégage l'idée générale ; enfin l'annonce du plan, qui énumère brièvement les centres d'intérêt correspondant aux parties du développement.$$,
        'highlights', array[$$introduction = contextualisation + présentation du texte (auteur, œuvre, idée générale) + annonce du plan$$, $$annonce du plan = énumération brève des centres d'intérêt$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles informations doit contenir la « présentation du texte » dans une introduction de commentaire composé ?$$, 'solution', $$Le titre du texte, le nom de l'auteur, le titre et la date de publication de l'œuvre, ainsi que l'idée générale du texte.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de rédaction d'une introduction$$,
        'body', $$Chaque composante de l'introduction s'enchaîne dans un seul paragraphe fluide, sans rupture visible entre les étapes.$$,
        'highlights', array[$$introduction = un seul paragraphe, un seul alinéa$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige l'introduction d'un commentaire composé sur le texte d'Aïssata (récit épistolaire original où une jeune femme, désillusionnée par son mariage à Abidjan, regrette la vie de son village), dont le libellé demande d'étudier d'abord sa désillusion, puis sa nostalgie du village natal.$$, 'solution', $$La recherche d'un ailleurs meilleur conduit parfois à des choix qui se soldent par un profond désenchantement (généralité). C'est dans cette perspective que s'inscrit ce récit épistolaire dans lequel Aïssata, jeune mariée, écrit à sa sœur restée au village (présentation du texte). Ce texte relate les regrets d'Aïssata après son installation à Abidjan (idée générale). Dans ce commentaire composé, nous montrerons que la désillusion d'Aïssata après son mariage suscite en elle une profonde nostalgie du village natal (annonce du plan).$$),
        'fixation', jsonb_build_object('question', $$Sur combien de paragraphes doit s'étendre l'introduction d'un commentaire composé ?$$, 'solution', $$Un seul paragraphe, en un seul alinéa.$$)
      ),
      jsonb_build_object(
        'heading', $$Méthodologie de la conclusion$$,
        'body', $$La conclusion comporte trois composantes : le bilan, qui résume l'analyse menée ; le jugement personnel (ou prise de position), qui exprime un point de vue argumenté sur le texte ; et l'ouverture (facultative), qui élargit la réflexion vers d'autres perspectives — intérêt historique ou littéraire du texte, liens avec d'autres œuvres du même auteur ou d'un autre auteur traitant un thème proche.$$,
        'highlights', array[$$conclusion = bilan + prise de position + ouverture (facultative)$$, $$ouverture : rapprochement avec une autre œuvre traitant un thème proche$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige la conclusion du commentaire composé sur le texte d'Aïssata.$$, 'solution', $$En somme, Aïssata, désillusionnée après son mariage, a vécu une expérience douloureuse qui l'a plongée dans la nostalgie de son village natal (bilan). Quelle que soit la difficulté de sa situation, elle devra sans doute apprendre à s'accommoder de cette nouvelle vie (prise de position). Ce thème de la désillusion après le mariage rappelle celui de « Sous le voile de la mariée » de Mathurin Goli Bi Irié, où le personnage principal découvre à son tour, après son union, une réalité bien différente de ses attentes (ouverture).$$),
        'fixation', jsonb_build_object('question', $$Que peut apporter l'étape d'« ouverture » dans une conclusion de commentaire composé ?$$, 'solution', $$Elle élargit la réflexion en établissant un lien avec une autre œuvre traitant un thème proche, ou en signalant l'intérêt historique ou littéraire du texte étudié.$$)
      ),
      jsonb_build_object(
        'heading', $$Récapitulatif : démarches pour l'introduction et la conclusion$$,
        'body', $$Introduction : en un seul paragraphe et un seul alinéa ; énoncer une perspective générale ; situer le texte dans son contexte (auteur, époque, œuvre) ; présenter le texte (idée générale, type, forme, intérêt majeur) ; annoncer clairement le plan, dans un style élégant (questions, verbes au futur). Conclusion : en un seul paragraphe et un seul alinéa ; faire le bilan de la réflexion sur le sens et l'intérêt du texte ; répondre aux questions soulevées dans l'introduction ; ouvrir facultativement sur des perspectives plus larges.$$,
        'highlights', array[$$introduction et conclusion : chacune en un seul paragraphe, un seul alinéa$$, $$la conclusion répond aux questions soulevées par l'introduction$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel style est recommandé pour annoncer le plan à la fin de l'introduction ?$$, 'solution', $$Un style clair, net et élégant, pas trop lourd — par exemple en utilisant des questions ou des verbes au futur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le poème original « Avant » (étudié dans les évaluations précédentes), dont le libellé demande d'étudier d'abord le bonheur de l'enfance, puis les réalités de l'âge adulte : « Avant, c'était les mangues volées au verger du voisin, / le rire des cousins sous le manguier, / le sable chaud entre les orteils, / les histoires du soir contées par grand-mère. / Maintenant je compte les factures, / je mesure mes pas dans le bruit de la ville, / j'ai perdu le goût des après-midis sans horloge. / Je suis devenu grand, et cela pèse. »$$,
      'questions', array[
        $$Rédige l'introduction complète de ce commentaire composé, en respectant les trois étapes : généralité, présentation du texte (tu peux inventer un cadre de présentation cohérent), idée générale et annonce du plan.$$,
        $$Rédige le bilan et la prise de position de la conclusion de ce commentaire composé.$$,
        $$Propose une ouverture pertinente pour cette conclusion, en établissant un lien avec un autre texte ou une autre œuvre traitant un thème proche (le passage de l'enfance à l'âge adulte, ou la nostalgie).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois étapes composant l'introduction d'un commentaire composé ?$$,
      'hint', $$Elles vont du général au particulier, jusqu'au plan.$$,
      'expected', $$La contextualisation (perspective générale), la présentation du texte, et l'annonce du plan.$$
    ),
    jsonb_build_object(
      'question', $$Quelles informations la « contextualisation » de l'introduction peut-elle mobiliser ?$$,
      'hint', $$Trois angles possibles sont mentionnés dans la méthodologie.$$,
      'expected', $$Le thème du texte, le genre littéraire, ou la vie de l'auteur.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les trois composantes possibles d'une conclusion de commentaire composé ?$$,
      'hint', $$La dernière est facultative.$$,
      'expected', $$Le bilan, le jugement personnel (prise de position), et l'ouverture (facultative).$$
    ),
    jsonb_build_object(
      'question', $$La conclusion doit-elle répondre à quelque chose de précisément posé plus tôt dans le commentaire ?$$,
      'hint', $$Cela concerne la cohérence entre le début et la fin du commentaire.$$,
      'expected', $$Oui, elle doit répondre aux questions ou perspectives soulevées dans l'introduction.$$
    )
  ),
  now()
);
