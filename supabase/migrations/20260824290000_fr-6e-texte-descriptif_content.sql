-- FALLBACK CONTENT : la catégorie Lecture de coll.ecole-ci.org (Collège
-- Numérique, 6ème Français) ne comporte aucun cours distinct sur
-- l'analyse d'un texte descriptif (elle ne couvre que la lettre
-- personnelle et le récit, déjà utilisés dans fr-6e-texte-narratif).
-- Écrit à partir de la connaissance générale du programme officiel MENA
-- de 6ème, en s'appuyant sur la méthode de lecture méthodique déjà
-- enseignée (hypothèse générale, axes de lecture, bilan) et sur les
-- outils de la description déjà étudiés en expression écrite
-- (fr-6e-description : vocabulaire mélioratif/dépréciatif, expansions du
-- nom, indicateurs de lieu).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au Centre de Documentation et d'Information du collège, des élèves de 6ème découvrent un extrait de roman décrivant un village au bord d'un fleuve. Ils s'organisent pour analyser comment l'auteur construit cette description et quel effet elle produit sur le lecteur.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Repérer ce qui est décrit et le point de vue$$,
        'body', $$Lire un texte descriptif, c'est d'abord identifier l'objet de la description (un lieu, une personne, un objet, un animal) et le point de vue adopté : de l'extérieur vers l'intérieur, du général au particulier, ou selon les déplacements du regard d'un personnage ("De la fenêtre, on apercevait d'abord..., puis..."). Le texte descriptif utilise surtout le présent ou l'imparfait de l'indicatif, car il fige une scène dans le temps.$$,
        'highlights', array[$$identifier : quoi ? (objet décrit) et comment ? (ordre du regard : général→particulier, extérieur→intérieur)$$, $$temps dominants : présent ou imparfait (description figée dans le temps)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les deux temps verbaux les plus utilisés dans un texte descriptif ?$$, 'solution', $$Le présent et l'imparfait de l'indicatif.$$)
      ),
      jsonb_build_object(
        'heading', $$Analyser le vocabulaire et les expansions du nom$$,
        'body', $$Dans un texte descriptif, chaque nom est souvent enrichi d'expansions (adjectifs qualificatifs, compléments du nom, propositions relatives) qui précisent l'image donnée au lecteur. Le vocabulaire est mélioratif (valorisant : "magnifique", "paisible") pour une description positive, ou dépréciatif (dévalorisant : "sale", "délabré") pour une description négative. Les figures de style (comparaison, métaphore) rendent l'image plus vivante : "le fleuve serpentait comme un long ruban argenté."$$,
        'highlights', array[$$expansions du nom = adjectif + complément du nom + relative → précisent l'image$$, $$vocabulaire mélioratif (positif) / dépréciatif (négatif) + figures de style$$]::text[],
        'example', jsonb_build_object('statement', $$Dans "un village paisible et accueillant", quel est l'effet produit par ce vocabulaire ?$$, 'solution', $$C'est un vocabulaire mélioratif qui donne une image positive et rassurante du village.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qu'une comparaison, dans une description ?$$, 'solution', $$Une figure de style qui rapproche deux éléments à l'aide d'un mot comme "comme", pour rendre l'image plus vivante.$$)
      ),
      jsonb_build_object(
        'heading', $$Construire le sens : hypothèse, axes de lecture, bilan$$,
        'body', $$Comme pour tout texte, on formule d'abord une hypothèse générale de lecture (par exemple : "description valorisante d'un village accueillant"), qu'on vérifie ensuite à travers des axes de lecture : le lexique employé (mélioratif ou dépréciatif), les expansions du nom, les figures de style, et les indicateurs de lieu ("au loin", "au premier plan", "à l'horizon"). Le bilan final confirme ou nuance l'hypothèse de départ, et permet de dégager l'impression générale que l'auteur veut donner au lecteur.$$,
        'highlights', array[$$hypothèse générale → axes de lecture (lexique, expansions, figures de style, indicateurs de lieu) → bilan$$]::text[],
        'example', jsonb_build_object('statement', $$Un texte décrit "des maisons délabrées, des rues sales et désertes." Quelle hypothèse générale peut-on formuler ?$$, 'solution', $$Une description dépréciative, qui donne une impression de pauvreté ou d'abandon du lieu.$$),
        'fixation', jsonb_build_object('question', $$À quoi sert le bilan à la fin de l'analyse d'un texte descriptif ?$$, 'solution', $$Il confirme (ou nuance) l'hypothèse générale et dégage l'impression finale voulue par l'auteur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$On te soumet un court extrait décrivant un marché africain animé. Tu dois en construire le sens en suivant la méthode de lecture d'un texte descriptif.$$,
      'questions', array[
        $$Identifie ce qui est décrit et l'ordre dans lequel le regard se déplace.$$,
        $$Relève deux mots ou expressions relevant du vocabulaire mélioratif ou dépréciatif.$$,
        $$Formule l'impression générale que le texte cherche à donner au lecteur, et justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans "la vieille case menaçait de s'effondrer", le vocabulaire est-il mélioratif ou dépréciatif ?$$,
      'hint', $$"Menaçait de s'effondrer" n'est pas valorisant.$$,
      'expected', $$Dépréciatif (il donne une image négative et délabrée de la case).$$
    ),
    jsonb_build_object(
      'question', $$Quel temps verbal domine dans une description figée dans le temps ?$$,
      'hint', $$Ce n'est pas le passé simple.$$,
      'expected', $$Le présent ou l'imparfait de l'indicatif.$$
    ),
    jsonb_build_object(
      'question', $$"Le ciel était rouge comme une braise" — quelle figure de style est utilisée ?$$,
      'hint', $$Le mot "comme" en est l'indice.$$,
      'expected', $$Une comparaison.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la première étape avant d'analyser un texte descriptif ?$$,
      'hint', $$Il faut savoir ce que le texte décrit.$$,
      'expected', $$Identifier l'objet de la description (ce qui est décrit) et formuler une hypothèse générale de lecture.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-texte-descriptif';
