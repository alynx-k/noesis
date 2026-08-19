-- REAL methodology sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2292: "EE 2: Com_composé_rédiger_un_CI"
-- (https://lyc.ecole-ci.org/course/view.php?id=2292), resource id 20910.
-- The pedagogical method (méthodologie de rédaction d'un centre d'intérêt,
-- structure du paragraphe argumentatif, démarche récapitulative) is
-- reproduced from the source, which is methodological and not subject to
-- copyright concern. As in the prior lesson, the source's illustrative
-- literary text (Sembène Ousmane, "Lettres de France", 1962) and its
-- evaluation poem (Denise Jallais, "Maturité", 1969/1987) were NOT
-- reproduced — both are copyrighted creative works. The redaction example
-- instead builds on the original "Aïssata" text and "Avant" poem composed
-- for the previous migration (1ere-c-francais-commentaire-compose),
-- preserving continuity and the same teaching point.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-rediger-centre-interet',
  '1ere',
  'C',
  'francais',
  $$Rédiger un centre d'intérêt$$,
  2,
  '1ere-c-francais-commentaire-compose',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir analysé le libellé et organisé leurs centres d'intérêt sur le texte d'Aïssata, les élèves de 1ère veulent maintenant franchir l'étape suivante : rédiger entièrement un centre d'intérêt du commentaire composé, en respectant la méthodologie propre à cet exercice.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Méthodologie de rédaction d'un centre d'intérêt$$,
        'body', $$Le développement du commentaire composé est le lieu où se réalisent l'analyse et l'interprétation du texte. Il comporte en moyenne deux parties, correspondant aux deux centres d'intérêt. Chaque partie est séparée de la précédente par une phrase de transition qui résume le centre d'intérêt qui s'achève et annonce le suivant. Chaque centre d'intérêt comporte des sous-centres, chacun abordant un aspect précis. Il faut être synthétique, ne retenir que les éléments essentiels, employer des mots simples pour éviter la paraphrase, et utiliser des tournures traduisant l'effet littéraire : « cela apparaît », « cela se traduit par », « il met en évidence », « il met en exergue », « en clair »...$$,
        'highlights', array[$$développement = 2 parties (une par centre d'intérêt), reliées par une phrase de transition$$, $$tournures d'effet littéraire : « cela se traduit par », « il met en évidence », « il met en exergue »$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi utilise-t-on des tournures comme « cela se traduit par » ou « il met en évidence » dans la rédaction d'un centre d'intérêt ?$$, 'solution', $$Elles permettent de traduire l'effet littéraire produit par un indice textuel, en reliant clairement l'observation (l'indice relevé) à son interprétation.$$)
      ),
      jsonb_build_object(
        'heading', $$Structure du paragraphe argumentatif$$,
        'body', $$Chaque paragraphe (un sous-centre) se construit comme un paragraphe argumentatif, à partir d'un élément d'analyse fondé sur l'étude précise d'un passage du texte, appuyé par des citations. La démarche suit quatre étapes : énoncer l'idée du paragraphe ; citer les indices textuels s'y rapportant ; analyser ces indices (identifier le procédé stylistique ou grammatical) ; interpréter les indices (en dégager le sens et l'effet).$$,
        'highlights', array[$$paragraphe argumentatif : énoncer l'idée → citer les indices → analyser → interpréter$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige un paragraphe argumentatif sur le sous-centre « la prise de conscience du leurre », à partir du texte d'Aïssata (« Mon père m'avait montré la photo d'un homme établi à Abidjan ; il semblait prospère, souriant. J'ai cru au bonheur promis... »).$$, 'solution', $$Une fois mariée, Aïssata prend conscience du leurre dont elle a été victime. Cette idée est perceptible à travers la phrase déclarative « Mon père m'avait montré la photo d'un homme établi à Abidjan ; il semblait prospère, souriant. » Cette description méliorative, fondée sur une simple photographie, met en évidence l'illusion sur laquelle reposait la promesse de mariage. En clair, Aïssata se rend compte qu'elle a cru à une image plutôt qu'à une réalité vérifiée.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les quatre étapes de construction d'un paragraphe argumentatif dans un commentaire composé ?$$, 'solution', $$Énoncer l'idée du paragraphe, citer les indices textuels, analyser ces indices, puis les interpréter.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de rédaction complète d'un centre d'intérêt$$,
        'body', $$Un centre d'intérêt bien rédigé enchaîne plusieurs paragraphes argumentatifs (au moins deux), chacun développant un sous-centre différent, et se referme par une conclusion partielle qui fait la transition vers le centre d'intérêt suivant.$$,
        'highlights', array[$$au moins deux paragraphes par centre d'intérêt$$, $$conclusion partielle = bilan du centre d'intérêt + annonce du suivant$$]::text[],
        'example', jsonb_build_object('statement', $$Voici une rédaction du centre d'intérêt « la désillusion d'Aïssata », à partir du texte étudié précédemment. Identifie ses deux sous-centres et sa phrase de transition finale : « Une fois mariée, Aïssata prend conscience du leurre dont elle a été victime : elle a cru à une photographie flatteuse plutôt qu'à une réalité vérifiée. Par ailleurs, face au quotidien terne qu'elle découvre à Abidjan, loin de la vie animée qu'elle imaginait, Aïssata sombre dans une déception profonde ; l'expression « les journées se ressemblent, vides et grises » traduit cette monotonie qui contraste avec ses attentes. Ainsi, désabusée et meurtrie par cette désillusion, Aïssata se réfugie inévitablement dans le souvenir de son village natal. »$$, 'solution', $$Sous-centre 1 : la prise de conscience du leurre (la photographie flatteuse). Sous-centre 2 : la déception face au quotidien terne d'Abidjan. Phrase de transition finale : « Ainsi, désabusée et meurtrie par cette désillusion, Aïssata se réfugie inévitablement dans le souvenir de son village natal », qui annonce le centre d'intérêt suivant (la nostalgie).$$),
        'fixation', jsonb_build_object('question', $$Quel est le rôle de la phrase de transition à la fin d'un centre d'intérêt ?$$, 'solution', $$Elle résume ou fait le bilan du centre d'intérêt qui s'achève, et annonce le centre d'intérêt suivant, assurant la cohérence du développement.$$)
      ),
      jsonb_build_object(
        'heading', $$Récapitulatif : démarche pour rédiger le développement$$,
        'body', $$Le commentaire est entièrement rédigé (pas de style télégraphique). L'unité de base de la rédaction est le paragraphe. On élabore au moins deux paragraphes par centre d'intérêt. Chaque paragraphe commence obligatoirement par un alinéa ; on ne met ni titre, ni numérotation. Chaque paragraphe suit la structure argumentative (idée → indices → analyse → interprétation). On élabore une phrase de transition entre paragraphes et entre centres d'intérêt. On soigne la présentation typographique (sauts de ligne entre parties et sous-parties). On utilise une langue correcte et soutenue, en évitant les imprécisions et les termes vagues.$$,
        'highlights', array[$$commentaire entièrement rédigé, sans titre ni numérotation, paragraphe = unité de base$$, $$langue correcte et soutenue, sans imprécisions ni termes vagues$$]::text[],
        'fixation', jsonb_build_object('question', $$Doit-on mettre des titres ou des numéros aux différentes parties d'un commentaire composé rédigé ?$$, 'solution', $$Non : le commentaire est entièrement rédigé, sans titre ni numérotation ; la structure doit apparaître à travers la rédaction elle-même (paragraphes, transitions, sauts de ligne).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Reprends le poème original « Avant » étudié en évaluation de la leçon précédente : « Avant, c'était les mangues volées au verger du voisin, / le rire des cousins sous le manguier, / le sable chaud entre les orteils, / les histoires du soir contées par grand-mère. / Maintenant je compte les factures, / je mesure mes pas dans le bruit de la ville, / j'ai perdu le goût des après-midis sans horloge. / Je suis devenu grand, et cela pèse. » Le libellé demandait d'étudier d'abord le bonheur de l'enfance, puis les réalités de l'âge adulte.$$,
      'questions', array[
        $$Rédige un paragraphe argumentatif complet sur un premier sous-centre du bonheur de l'enfance (par exemple les jeux ou la complicité familiale), en suivant les quatre étapes : idée, indices, analyse, interprétation.$$,
        $$Rédige un second paragraphe argumentatif sur un autre sous-centre du bonheur de l'enfance (par exemple l'insouciance liée au temps).$$,
        $$Rédige la phrase de transition qui clôt ce centre d'intérêt et annonce le centre d'intérêt suivant (les réalités de l'âge adulte).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de paragraphes au minimum faut-il élaborer par centre d'intérêt ?$$,
      'hint', $$C'est indiqué explicitement dans la démarche récapitulative.$$,
      'expected', $$Au moins deux paragraphes par centre d'intérêt.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la première étape dans la construction d'un paragraphe argumentatif d'un commentaire composé ?$$,
      'hint', $$C'est avant même de citer le texte.$$,
      'expected', $$Énoncer l'idée du paragraphe.$$
    ),
    jsonb_build_object(
      'question', $$Faut-il mettre un titre à chaque centre d'intérêt dans la rédaction finale du commentaire composé ?$$,
      'hint', $$C'est une règle de présentation typographique.$$,
      'expected', $$Non : on ne met ni titre ni numérotation ; le commentaire est entièrement rédigé en paragraphes reliés par des transitions.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux tournures permettant de traduire un effet littéraire dans la rédaction d'un commentaire composé.$$,
      'hint', $$Elles relient l'observation d'un indice à son sens.$$,
      'expected', $$Par exemple : « cela se traduit par... » et « il met en évidence... » (ou « il met en exergue », « en clair »).$$
    )
  ),
  now()
);
