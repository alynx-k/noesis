-- Espagnol 4ème, leçon 7/7 : L'expression de l'ordre.
-- ecole-ci.org est accessible. Le Collège Numérique héberge cette compétence
-- ("TRAITER UNE SITUATION RELATIVE A L'EXPRESSION DE L'ORDRE") sous 4 pages
-- de cours distinctes de la catégorie Espagnol 4ème : L24 Donner un ordre
-- (Leçon 7 Fiche 1), L25 conseiller (Fiche 2), L26 Interdire (Fiche 3) et
-- L27 Déconseiller (Fiche 4).
-- Les fiches réelles ont pu être récupérées et lues pour L25, L26 et L27 :
--   - Fiche 2 "Conseiller" : support "Paga tus impuestos" (¡Ya estamos!
--     Espagnol 4e, p.68) -- grammaire "deber + infinitivo" / "aconsejar +
--     infinitivo" pour conseiller.
--   - Fiche 3 "Interdire à quelqu'un de faire quelque chose" : support "Aquí
--     está prohibido fumar" (p.70) -- grammaire NO + subjonctif présent pour
--     interdire.
--   - Fiche 4 "Déconseiller" : support "Alcohol y velocidad" (p.72) --
--     grammaire "no aconsejar/no deber + infinitivo" et "lo mejor es que no
--     + subjuntivo" pour déconseiller.
-- Les sections 2, 3 et 4 ci-dessous ont été réécrites à partir de ces trois
-- fiches réelles (paraphrase originale, aucune phrase copiée des fiches
-- sources) et re-contextualisées dans une campagne de sensibilisation au
-- collège (civisme/santé) qui reprend les thèmes authentiques (impôts,
-- tabac/drogue, alcool) sans reproduire les exemples des fiches.
-- Pour L24 "Donner un ordre" (Fiche 1, l'impératif) en revanche, le lien
-- "Je lis le résumé de la leçon" du cours (mod/resource/view.php?id=10796)
-- est cassé côté site : il ne sert pas la fiche d'espagnol mais redirige
-- vers un PDF EDHC sans rapport ("3e_EDHC_C5_L12_protection_parcs_
-- nationaux.pdf"). Plusieurs pistes ont été tentées sans succès : lien
-- direct, ids de ressource/pluginfile voisins de ceux (valides) de L25/L26/
-- L27, page d'index des fichiers du cours, et l'activité H5P d'exercices
-- intégrée au cours -- aucune ne restitue le contenu réel de la fiche sur
-- l'impératif. La section 1 conserve donc le contenu de repli précédent
-- (règle grammaticale standard et correcte sur l'impératif espagnol,
-- formulations 100% originales), simplement re-thématisé pour rester
-- cohérent avec la nouvelle situation de campagne de sensibilisation ; ce
-- contenu n'est PAS adossé à une fiche réelle vérifiée du site. Contenu
-- pédagogique en espagnol (immersion linguistique), seule la structure de
-- l'app reste en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Eres delegado de tu clase de 4ème y organizas, con tus compañeros, una campaña de sensibilización en el colegio: darás instrucciones durante los preparativos, aconsejarás a tus compañeros sobre sus deberes cívicos y su salud, prohibirás ciertos comportamientos peligrosos dentro del colegio, y desaconsejarás el consumo de alcohol antes de los exámenes.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Dar una orden: el imperativo$$,
        'body', $$Para organizar los preparativos de la campaña, das instrucciones directas a tus compañeros. En español, esto se hace con el imperativo, cuya forma cambia según a quién te diriges: tú, usted, vosotros o ustedes.$$,
        'highlights', array[$$¡prepara!$$, $$¡prepare usted!$$, $$¡preparad!$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Persona$$, $$PREPARAR (imperativo)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$tú$$, $$¡prepara!$$),
            jsonb_build_array($$usted$$, $$¡prepare!$$),
            jsonb_build_array($$vosotros$$, $$¡preparad!$$),
            jsonb_build_array($$ustedes$$, $$¡preparen!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Con "vosotros", el imperativo se forma cambiando la -r final del infinitivo por una -d: preparar → preparad, colgar → colgad. Con "usted" y "ustedes", se usa la forma del subjuntivo presente: prepare, preparen. Con "tú", varios verbos son irregulares: poner → pon, hacer → haz, decir → di.$$),
        'example', jsonb_build_object('statement', $$Da la orden a todo el grupo (vosotros) de colgar los carteles de la campaña ahora mismo.$$, 'solution', $$¡Colgad los carteles de la campaña ahora mismo!$$),
        'fixation', jsonb_build_object('question', $$Da la orden con "usted" al director: (venir) a la reunión del club de español.$$, 'solution', $$¡Venga usted a la reunión del club de español!$$)
      ),
      jsonb_build_object(
        'heading', $$Aconsejar: DEBER + infinitivo / ACONSEJAR + infinitivo$$,
        'body', $$Durante la campaña, también aconsejas a tus compañeros sobre sus deberes cívicos y su salud, en vez de solo dar órdenes. Para eso, el español usa sobre todo "deber" o "aconsejar", ambos seguidos de un infinitivo.$$,
        'highlights', array[$$debéis$$, $$te aconsejo$$, $$tenéis que$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$deber + infinitivo$$, $$Debéis declarar vuestros ingresos si trabajáis los fines de semana.$$),
            jsonb_build_array($$aconsejar + infinitivo$$, $$Te aconsejo ahorrar una parte de tu dinero de bolsillo.$$),
            jsonb_build_array($$tener que + infinitivo$$, $$Tenéis que respetar las normas del colegio.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"Deber" es un verbo regular en -er (debo, debes, debe, debemos, debéis, deben) seguido siempre de infinitivo. "Aconsejar" necesita un pronombre de complemento indirecto antes del verbo: te aconsejo, os aconsejamos, le aconsejo. "Tener que + infinitivo" expresa una obligación cercana al consejo.$$),
        'example', jsonb_build_object('statement', $$Aconseja a un compañero cuidar su salud antes de los exámenes.$$, 'solution', $$Te aconsejo cuidar tu salud antes de los exámenes.$$),
        'fixation', jsonb_build_object('question', $$Completa: Vosotros ___ (deber, informarse) sobre vuestros derechos como ciudadanos.$$, 'solution', $$Vosotros debéis informaros sobre vuestros derechos como ciudadanos.$$)
      ),
      jsonb_build_object(
        'heading', $$Prohibir: NO + subjuntivo presente$$,
        'body', $$Para prohibir un comportamiento peligroso en el colegio, como fumar, el español no usa el imperativo negativo directamente, sino "no" seguido del verbo en subjuntivo presente.$$,
        'highlights', array[$$no fumes$$, $$no fuméis$$, $$no fumen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Persona$$, $$FUMAR (prohibición)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$tú$$, $$¡no fumes!$$),
            jsonb_build_array($$vosotros$$, $$¡no fuméis!$$),
            jsonb_build_array($$ustedes$$, $$¡no fumen!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$La regla es: NO + verbo en subjuntivo presente, en todas las personas y no solo con "usted/ustedes": "no fumes" (tú), "no fuméis" (vosotros), "no fumen" (ustedes). Esta forma es distinta de la del imperativo afirmativo, que no usa el subjuntivo.$$),
        'example', jsonb_build_object('statement', $$Prohíbe a todo el grupo (vosotros) fumar dentro del colegio.$$, 'solution', $$¡No fuméis dentro del colegio!$$),
        'fixation', jsonb_build_object('question', $$Prohíbe a un compañero (tú) traer sustancias prohibidas al colegio.$$, 'solution', $$¡No traigas sustancias prohibidas al colegio!$$)
      ),
      jsonb_build_object(
        'heading', $$Desaconsejar: NO ACONSEJAR / NO DEBER + infinitivo$$,
        'body', $$Antes de los exámenes, también quieres desaconsejar hábitos peligrosos como el consumo de alcohol, sin llegar a una prohibición tan firme.$$,
        'highlights', array[$$no debéis$$, $$no te aconsejo$$, $$lo mejor es que no$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Estructura$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$no deber + infinitivo$$, $$No debéis beber alcohol la noche antes del examen.$$),
            jsonb_build_array($$no aconsejar + infinitivo$$, $$No te aconsejo salir de fiesta esta semana.$$),
            jsonb_build_array($$lo mejor es que no + subjuntivo$$, $$Lo mejor es que no conduzcáis después de beber.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$"No deber" y "no aconsejar" van seguidos de infinitivo, igual que sus formas afirmativas. "Lo mejor es que" exige el subjuntivo cuando va seguido de "no": lo mejor es que no + subjuntivo, una manera más suave de desaconsejar que una prohibición directa.$$),
        'example', jsonb_build_object('statement', $$Desaconseja a un compañero conducir después de haber bebido alcohol.$$, 'solution', $$No te aconsejo conducir después de haber bebido alcohol.$$),
        'fixation', jsonb_build_object('question', $$Completa: Lo mejor es que ___ (no, salir, vosotros) de noche antes de los exámenes.$$, 'solution', $$Lo mejor es que no salgáis de noche antes de los exámenes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Durante la campaña de sensibilización en tu colegio, debes dar una orden con el imperativo, aconsejar a un compañero sobre sus deberes cívicos, prohibir un comportamiento peligroso con subjuntivo, y desaconsejar el consumo de alcohol antes de los exámenes.$$,
      'questions', array[
        $$Da una orden con el imperativo, a "tú" o a "vosotros".$$,
        $$Aconseja algo usando "deber" o "aconsejar" + infinitivo.$$,
        $$Prohíbe un comportamiento con "no" + subjuntivo presente.$$,
        $$Desaconseja un hábito con "no deber" o "lo mejor es que no".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Da la orden con "tú": (poner) los carteles de la campaña en la pared.$$,
      'hint', $$"Poner" es irregular en imperativo con "tú": pon.$$,
      'expected', $$¡Pon los carteles de la campaña en la pared!$$
    ),
    jsonb_build_object(
      'question', $$Completa con "deber": Nosotros ___ (deber, respetar) las normas del colegio durante la campaña.$$,
      'hint', $$"Deber" es regular en -er, seguido de infinitivo.$$,
      'expected', $$Nosotros debemos respetar las normas del colegio durante la campaña.$$
    ),
    jsonb_build_object(
      'question', $$Prohíbe con "ustedes": (fumar) dentro del colegio.$$,
      'hint', $$Usa NO + subjuntivo presente con "ustedes".$$,
      'expected', $$¡No fumen dentro del colegio!$$
    ),
    jsonb_build_object(
      'question', $$Completa con una expresión de desaconsejar: ___ beber alcohol antes de los exámenes.$$,
      'hint', $$Usa "no debes" o "no te aconsejo".$$,
      'expected', $$No debes beber alcohol antes de los exámenes.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-expression-ordre';
