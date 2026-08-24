-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Grammaire (categoryid=61).
-- Cours combinés : "6e_Gr_L3-S1_discours_direct" (id 2200) et
-- "6e_Gr_L3-S2_discours_indirect" (id 2202). Contenu réécrit à partir des
-- PDF sources ; définitions et exemples reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Admis en 6ème, un élève rencontre un éducateur pour connaître les conditions d'inscription des nouveaux élèves. À partir de ce dialogue, les élèves s'organisent pour définir le discours direct et le discours indirect, et connaître leurs marques respectives.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le discours direct$$,
        'body', $$Le discours est une manière de rapporter les paroles ou pensées de quelqu'un. Au discours direct, les paroles sont rapportées sans modification, telles qu'elles ont été prononcées. Marques à l'écrit : guillemets (« … »), deux points (:), tirets (-) pour un dialogue, points d'interrogation/exclamation, emploi de la première personne, et un verbe introducteur (dire, déclarer, annoncer, affirmer, demander...). Exemple : Léonce dit : « Je suis riche. »$$,
        'highlights', array[$$discours direct = paroles rapportées sans modification, entre guillemets$$, $$verbes introducteurs : dire, déclarer, annoncer, affirmer, demander...$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels signes de ponctuation marquent le discours direct à l'écrit ?$$, 'solution', $$Les guillemets, les deux points, et les tirets pour un dialogue.$$)
      ),
      jsonb_build_object(
        'heading', $$Le discours indirect : pronoms et adjectifs$$,
        'body', $$Le discours indirect rapporte les paroles dans une proposition subordonnée rattachée à un verbe introducteur, sans guillemets. Au passage du direct à l'indirect : "je/tu/il/elle" deviennent "il/elle" ; "nous/vous/ils/elles" deviennent "ils/elles" ; "mon/ton/son" deviennent "son" ; "ma/ta/sa" deviennent "sa". Exemple : Ma mère affirma : « Je prendrai ces chaussures pour ma fille. » (direct) → Ma mère affirma qu'elle prendrait ces chaussures pour sa fille. (indirect)$$,
        'highlights', array[$$discours indirect = proposition subordonnée + verbe introducteur, sans guillemets$$, $$je/tu → il/elle ; mon/ton/son → son ; ma/ta/sa → sa$$]::text[],
        'example', jsonb_build_object('statement', $$Mets au discours indirect : Léonce déclare : « Je suis riche. »$$, 'solution', $$"Léonce déclare qu'il est riche."$$),
        'fixation', jsonb_build_object('question', $$Que devient "mon" au discours indirect ?$$, 'solution', $$"Son".$$)
      ),
      jsonb_build_object(
        'heading', $$Le discours indirect : temps, adverbes et compléments$$,
        'body', $$Si le verbe introducteur est au présent ou au futur, les temps ne changent pas. S'il est au passé, on applique la concordance : présent/imparfait → imparfait ; passé composé/passé simple → plus-que-parfait ; futur simple → conditionnel présent ; impératif → infinitif. Les indicateurs de temps/lieu changent aussi : hier → la veille ; ici → là ; aujourd'hui → ce jour-là ; demain → le lendemain ; avant-hier → l'avant-veille.$$,
        'highlights', array[$$verbe introducteur au passé → futur simple devient conditionnel présent ; impératif devient infinitif$$, $$hier→la veille ; demain→le lendemain ; ici→là ; aujourd'hui→ce jour-là$$]::text[],
        'example', jsonb_build_object('statement', $$Mets au discours indirect : Papa a dit : « Je serai à la maison ce soir. »$$, 'solution', $$"Papa a dit qu'il serait à la maison ce soir." (futur simple → conditionnel présent)$$),
        'fixation', jsonb_build_object('question', $$Que devient "demain" au discours indirect ?$$, 'solution', $$"Le lendemain."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une recherche en bibliothèque, tu découvres plusieurs phrases mêlant discours direct et indirect. Ton professeur te demande de les analyser et de les transformer.$$,
      'questions', array[
        $$Identifie si chaque phrase donnée est au discours direct ou indirect, et justifie.$$,
        $$Transforme une phrase au discours direct en discours indirect (attention aux pronoms et aux temps).$$,
        $$Transforme une phrase au discours indirect en discours direct (rétablis les guillemets).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Mets au discours indirect : "Elles affirmaient : « Nous ne resterons pas ici une minute de plus »."$$,
      'hint', $$"Nous" devient "elles", "ici" devient "là", "resterons" (futur) devient conditionnel.$$,
      'expected', $$"Elles affirmaient qu'elles ne resteraient pas là une minute de plus."$$
    ),
    jsonb_build_object(
      'question', $$Quel verbe introducteur, autre que "dire", peut introduire un discours direct ?$$,
      'hint', $$Pense à "déclarer" ou "affirmer".$$,
      'expected', $$Par exemple : déclarer, affirmer, annoncer, signifier, confirmer, demander (un au choix).$$
    ),
    jsonb_build_object(
      'question', $$Mets au discours direct : "Il m'a dit qu'il travaillait là."$$,
      'hint', $$"Il" redevient "je", "là" redevient "ici".$$,
      'expected', $$"Il m'a dit : « Je travaille ici »."$$
    ),
    jsonb_build_object(
      'question', $$Un verbe introducteur au passé composé impose quelle transformation au futur simple du discours direct ?$$,
      'hint', $$C'est un mode conditionnel.$$,
      'expected', $$Le futur simple devient le conditionnel présent.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-discours-direct-indirect';
