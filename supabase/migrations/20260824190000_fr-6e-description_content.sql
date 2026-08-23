-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Expression Écrite (categoryid=58).
-- Cours combinés : "6e_EE_L2_S1_descript_objet_familier" (id 2170) et
-- "6e_EE_L2_S2_descript_lieu_non_animé" (id 2171). Contenu réécrit à
-- partir des PDF sources ; situation d'apprentissage, méthode et exemples
-- reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant les congés de Noël, des élèves de 6ème ont participé à une excursion sur un site touristique. Ils ont remarqué la propreté du site et la beauté du sac à dos de leur guide. De retour de congés, ils décident de présenter par écrit ces deux découvertes à leurs camarades qui n'ont pas pris part à l'excursion.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Décrire un objet familier$$,
        'body', $$Décrire un objet, c'est en faire la présentation détaillée : la forme, la couleur, l'aspect, la matière. On utilise le présent ou l'imparfait de l'indicatif, des adjectifs de couleur, des expansions du GN (adjectifs qualificatifs, compléments du nom, propositions relatives) pour préciser l'objet. Le vocabulaire évaluatif est mélioratif pour une description positive (jolie, agréable, confortable) ou dépréciatif pour une description négative (laid, sale, désagréable). Les figures de style (comparaisons, métaphores) rendent la description plus vivante.$$,
        'highlights', array[$$description positive → mots mélioratifs (jolie, agréable) ; négative → mots dépréciatifs (laid, sale)$$, $$expansions du GN = adjectifs + compléments du nom + relatives$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel type de vocabulaire utilise-t-on pour une description positive ?$$, 'solution', $$Un vocabulaire mélioratif (jolie, agréable, confortable...).$$)
      ),
      jsonb_build_object(
        'heading', $$Organiser la description d'un objet$$,
        'body', $$La description suit trois parties : l'introduction (présentation générale de l'objet : de quoi s'agit-il, à qui appartient-il) ; le développement (les caractéristiques, en progressant de l'allure générale aux détails, ou de l'extérieur vers l'intérieur) ; la conclusion (les sentiments ou impressions sur l'objet décrit). Exemple : le sac du guide — introduction : "il s'agit d'un sac, il appartient au guide" ; développement : "il est en cuir, de couleur rose, avec des dessins" ; conclusion : "j'aime ce sac, il donne du charme."$$,
        'highlights', array[$$introduction (présentation) → développement (caractéristiques, extérieur→intérieur) → conclusion (impressions)$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige une phrase d'introduction pour décrire une montre aperçue en vitrine.$$, 'solution', $$"Il s'agit d'une montre que j'ai aperçue dans la vitrine d'un magasin."$$),
        'fixation', jsonb_build_object('question', $$Dans quel ordre décrit-on généralement un objet, selon la méthode ?$$, 'solution', $$De l'allure générale aux détails, ou de l'extérieur vers l'intérieur.$$)
      ),
      jsonb_build_object(
        'heading', $$Décrire un lieu non animé$$,
        'body', $$Décrire un lieu, c'est présenter dans les moindres détails cet endroit : emplacement géographique, orientations, composantes. On utilise en plus des adverbes de lieu (là-bas, ici, derrière, près de) et des indicateurs spatiaux (à gauche, à droite, plus loin), ainsi que le lexique des sentiments (admiration ou rejet pour le lieu). Exemple : le village artisanal de Grand-Bassam — introduction : situation du lieu ; développement : les ateliers, les objets exposés, les fleurs ; conclusion : "ce lieu reste bien tenu malgré l'affluence."$$,
        'highlights', array[$$adverbes de lieu : là-bas, ici, derrière, près de$$, $$indicateurs spatiaux : à gauche, à droite, plus loin$$]::text[],
        'example', jsonb_build_object('statement', $$Utilise un indicateur spatial pour situer le terrain de sport par rapport à l'école.$$, 'solution', $$"À droite des bâtiments se trouve le terrain de sports."$$),
        'fixation', jsonb_build_object('question', $$Cite deux adverbes ou indicateurs de lieu utiles pour décrire un lieu.$$, 'solution', $$Par exemple : là-bas, ici, à gauche, à droite, près de (deux au choix).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les parents d'une adolescente viennent d'emménager dans ton quartier. Elle doit acheter du pain mais ne connaît pas le chemin vers la boulangerie. Tu décides de lui laisser par écrit toutes les informations qui lui permettront de retrouver ce lieu.$$,
      'questions', array[
        $$Indique le type de texte à réaliser et justifie ton choix.$$,
        $$Identifie deux outils de la langue que tu utiliseras (adverbes de lieu, adjectifs...).$$,
        $$Rédige l'introduction, puis une partie du développement en décrivant l'extérieur et l'intérieur du lieu.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les trois parties d'une description ?$$,
      'hint', $$Comme pour un récit, mais adapté à la description.$$,
      'expected', $$L'introduction, le développement, la conclusion.$$
    ),
    jsonb_build_object(
      'question', $$"Ce sac est magnifique et attirant" : ce vocabulaire est-il mélioratif ou dépréciatif ?$$,
      'hint', $$"Magnifique" exprime l'appréciation.$$,
      'expected', $$Mélioratif (description positive).$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple d'indicateur spatial utilisé pour décrire un lieu.$$,
      'hint', $$Pense à "à gauche", "à droite", "plus loin".$$,
      'expected', $$Par exemple : "à droite", "à gauche", "plus loin", "près de".$$
    ),
    jsonb_build_object(
      'question', $$Quelle figure de style permet de rendre une description plus vivante en comparant deux éléments ?$$,
      'hint', $$Elle utilise souvent le mot "comme".$$,
      'expected', $$La comparaison (ou la métaphore).$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-description';
