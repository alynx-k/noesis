-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 12 : L'ENTRETIEN DES LATRINES ET DES TOILETTES ET LA
-- PRÉSERVATION DU CADRE DE VIE" (id 1644). Contenu réécrit à partir du
-- PDF source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Depuis le début de l'année scolaire, les élèves de ta classe ont constaté que les toilettes et les latrines sont impraticables en raison du manque d'entretien. Ils décident de s'informer sur les mesures d'entretien de ces équipements et d'y remédier.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les pratiques qui rendent latrines et toilettes insalubres$$,
        'body', $$Ces pratiques sont : faire ses besoins (déféquer ou uriner) hors du trou de la latrine ou de la cuvette du WC prévue à cet effet ; utiliser du papier non convenable après les selles ; et le manque d'entretien en général. À l'inverse, "tirer la chasse d'eau après ses besoins" et "désinfecter régulièrement les latrines et toilettes" sont des bonnes pratiques d'entretien.$$,
        'highlights', array[$$insalubres : besoins hors du trou/cuvette, papier non convenable, manque d'entretien$$]::text[],
        'fixation', jsonb_build_object('question', $$Citer une pratique qui rend les latrines insalubres.$$, 'solution', $$Par exemple : faire ses besoins hors du trou prévu, ou utiliser du papier non convenable après les selles.$$)
      ),
      jsonb_build_object(
        'heading', $$Les mesures d'entretien des latrines et toilettes$$,
        'body', $$Les mesures d'entretien sont : laver les latrines et toilettes avec des produits d'entretien ; les désinfecter régulièrement ; et utiliser correctement ces infrastructures. D'autres bonnes pratiques : vidanger régulièrement les fosses septiques, nettoyer la cuvette du WC.$$,
        'highlights', array[$$laver + désinfecter + utiliser correctement$$, $$autres bonnes pratiques : vidanger les fosses septiques, nettoyer la cuvette$$]::text[],
        'example', jsonb_build_object('statement', $$"Uriner à côté des latrines" est-il une mesure d'entretien correcte ?$$, 'solution', $$Non, c'est au contraire une pratique qui rend les latrines insalubres.$$),
        'fixation', jsonb_build_object('question', $$Cite une mesure d'entretien des latrines et toilettes.$$, 'solution', $$Par exemple : les laver avec des produits d'entretien, les désinfecter, ou les utiliser correctement.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance de l'entretien des latrines et toilettes$$,
        'body', $$L'entretien des toilettes et latrines permet d'éviter la dégradation de l'environnement, la propagation des maladies, et la détérioration de la santé. Il permet aussi de préserver le cadre de vie, de bénéficier de l'intimité au moment de faire ses besoins, de réaliser des économies, et d'assurer la santé des populations. Les latrines et toilettes font partie intégrante de notre cadre de vie ; leur entretien contribue à assainir l'environnement et à freiner la propagation des maladies.$$,
        'highlights', array[$$évite : dégradation de l'environnement, propagation des maladies, détérioration de la santé$$, $$apporte : cadre de vie préservé, intimité, économies, santé des populations$$]::text[],
        'example', jsonb_build_object('statement', $$L'entretien des toilettes permet-il d'"éviter le gaspillage d'eau" ?$$, 'solution', $$Ce n'est pas l'un des bienfaits cités — les bienfaits concernent plutôt la santé, le cadre de vie et les économies liées aux maladies évitées.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les trois risques que l'entretien des latrines permet d'éviter ?$$, 'solution', $$La dégradation de l'environnement, la propagation des maladies, et la détérioration de la santé.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le club de santé de ton établissement a obtenu du matériel pour organiser une journée d'entretien des toilettes. Tous les élèves sont invités à participer. Mais sous prétexte que les toilettes sont trop sales et dégagent de mauvaises odeurs, certains de tes camarades refusent d'y participer et te demandent d'en faire autant.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Cite trois pratiques d'entretien des toilettes et des latrines.$$,
        $$Justifie ton refus de suivre tes camarades.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$"Vidanger les fosses septiques régulièrement" est-elle une mesure d'entretien correcte ?$$,
      'hint', $$Cela fait partie des bonnes pratiques citées.$$,
      'expected', $$Oui.$$
    ),
    jsonb_build_object(
      'question', $$Quelle conséquence évite-t-on en entretenant régulièrement les latrines ?$$,
      'hint', $$Pense à la santé publique.$$,
      'expected', $$La propagation des maladies (et la dégradation de l'environnement, la détérioration de la santé).$$
    ),
    jsonb_build_object(
      'question', $$"Négliger l'entretien des toilettes" rend-il les lieux salubres ou insalubres ?$$,
      'hint', $$C'est l'absence d'entretien.$$,
      'expected', $$Insalubres.$$
    ),
    jsonb_build_object(
      'question', $$Cite un bienfait de l'entretien des toilettes pour la famille.$$,
      'hint', $$Pense aux dépenses évitées.$$,
      'expected', $$Réaliser des économies (en évitant les dépenses liées aux maladies).$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-entretien-latrines-toilettes';
