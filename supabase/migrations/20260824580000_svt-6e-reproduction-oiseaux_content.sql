-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- SVT (categoryid=52).
-- Cours : "Leçon 4 : La reproduction chez les oiseaux" (id 2059). Contenu
-- réécrit à partir du PDF source ; situation d'apprentissage, définitions
-- et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 6ème placent des coqs et des poules dans un enclos pour produire des poulets. Au bout de quelques semaines, la poule pond des œufs qui donnent, après couvaison, des poussins. Les élèves cherchent à identifier les caractéristiques d'un coq et d'une poule, et à expliquer la formation des poussins.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Caractères sexuels externes et internes$$,
        'body', $$Le coq et la poule se distinguent par des caractères sexuels externes : la crête (développée chez le coq, réduite chez la poule), les ergots (présents chez le coq, absents chez la poule), le barbillon (développé chez le coq), et le plumage de la queue (long et en faucille chez le coq, court chez la poule). En interne, le coq possède deux testicules, deux spermiductes et un cloaque ; la poule possède un ovaire (avec des ovules), un pavillon, un seul oviducte, un utérus et un cloaque. Le cloaque, présent chez les deux, permet l'accouplement.$$,
        'highlights', array[$$externes : crête, ergots, barbillon, plumage — plus développés chez le coq$$, $$internes : coq = 2 testicules + spermiductes ; poule = ovaire + oviducte unique + utérus$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel organe permet l'accouplement entre le coq et la poule ?$$, 'solution', $$Le cloaque, présent chez les deux.$$)
      ),
      jsonb_build_object(
        'heading', $$La fécondation interne$$,
        'body', $$Pendant l'accouplement, le coq dépose les spermatozoïdes au niveau du cloaque de la poule. Ces spermatozoïdes migrent grâce à leur queue vers le pavillon, où ils rencontrent l'ovule. Un seul spermatozoïde pénètre dans l'ovule (sans sa queue) ; les autres meurent. Le noyau du spermatozoïde fusionne avec celui de l'ovule : c'est la fécondation, qui se produit à l'intérieur de l'appareil reproducteur de la poule (fécondation interne).$$,
        'highlights', array[$$étapes : accouplement → migration des spermatozoïdes → un seul pénètre l'ovule → fusion des noyaux (fécondation)$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi un seul spermatozoïde féconde-t-il l'ovule ?$$, 'solution', $$Un seul pénètre dans l'ovule ; les autres meurent sans y entrer.$$),
        'fixation', jsonb_build_object('question', $$Où le coq dépose-t-il les spermatozoïdes pendant l'accouplement ?$$, 'solution', $$Au niveau du cloaque de la poule.$$)
      ),
      jsonb_build_object(
        'heading', $$Le développement externe de l'œuf$$,
        'body', $$Contrairement aux mammifères, le développement de l'œuf chez les oiseaux se fait hors du corps de la mère : c'est un développement externe. Du 1er au 5e jour d'incubation, l'embryon se développe (vaisseaux sanguins, tête). Au 15e jour, toutes les parties du poussin sont formées ; il se nourrit du jaune et du blanc, qui disparaissent progressivement. Après 20 jours, le poussin occupe tout le volume de l'œuf, plumes comprises. Au 21e jour, il brise la coquille avec son bec : c'est l'éclosion. L'œuf a besoin de chaleur (38°C), d'un milieu sec, et d'air pour se développer. Les vertébrés dont l'œuf se développe hors du corps de la mère sont appelés ovipares.$$,
        'highlights', array[$$développement externe = hors du corps de la mère (≠ mammifères)$$, $$conditions : chaleur 38°C + milieu sec + air$$, $$ovipares = œuf se développe hors de l'appareil reproducteur femelle$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi un œuf emballé dans du papier aluminium ne donne-t-il pas de poussin, même à 39°C ?$$, 'solution', $$Parce que l'emballage empêche l'air d'atteindre l'œuf, or l'air est indispensable au développement de l'embryon.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la sortie du poussin de l'œuf ?$$, 'solution', $$L'éclosion.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'élèves réalise des expériences d'incubation d'œufs de poule dans différentes conditions (température, humidité, aération, emballage) et obtient des résultats variés (certains œufs éclosent, d'autres non).$$,
      'questions', array[
        $$Identifie les facteurs intervenant dans l'incubation des œufs.$$,
        $$Relève les conditions qui empêchent le développement de l'œuf.$$,
        $$Explique l'obtention du poussin dans les conditions favorables.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$La poule possède-t-elle deux ovaires ?$$,
      'hint', $$Contrairement au coq qui a deux testicules.$$,
      'expected', $$Non, elle n'en possède qu'un.$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre : couvaison / accouplement / éclosion / fécondation / formation de l'embryon.$$,
      'hint', $$L'accouplement précède toujours la fécondation.$$,
      'expected', $$1. Accouplement, 2. Fécondation, 3. Couvaison, 4. Formation de l'embryon, 5. Éclosion.$$
    ),
    jsonb_build_object(
      'question', $$De quoi le jeune poussin se nourrit-il à l'intérieur de l'œuf ?$$,
      'hint', $$Ce sont deux substances qui disparaissent progressivement.$$,
      'expected', $$Du jaune et du blanc de l'œuf.$$
    ),
    jsonb_build_object(
      'question', $$Quelle température est nécessaire au développement de l'œuf de poule ?$$,
      'hint', $$C'est proche de la température du corps.$$,
      'expected', $$Environ 38°C.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-6e-reproduction-oiseaux';
