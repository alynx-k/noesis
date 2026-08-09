-- FALLBACK CONTENT: ecole-ci.org attempted for SVT 4ème sourcing this
-- session but immediately redirected to the same site-wide login wall
-- (phone/matricule) documented across the earlier SVT 3ème content
-- migrations (see e.g. 20260810400000_svt_aliments_homme_content.sql).
-- Written from general knowledge of the standard Ivorian 4ème SVT
-- programme (Compétence 1 : les transformations du corps de l'enfance à
-- l'adolescence). Sensitive but ordinary developmental-biology topic:
-- kept factual, respectful and non-alarmist, no invented statistics.
-- 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Awa, en classe de 4ème, retrouve une photo d'elle prise à 10 ans. Elle remarque que sa voix, sa taille et son corps ont beaucoup changé depuis. Son camarade Yao observe la même chose : sa voix est devenue plus grave et il a beaucoup grandi en un an. Pourquoi le corps se transforme-t-il ainsi à cet âge ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La puberté, une période de transformations$$,
        'body', $$La puberté est la période de la vie qui marque le passage de l'enfance à l'adolescence. Elle débute généralement entre 10 et 14 ans, à un âge qui varie d'un individu à l'autre, et se caractérise par une accélération de la croissance appelée pic de croissance, ainsi que par l'apparition de caractères sexuels secondaires chez les filles comme chez les garçons.$$,
        'highlights', array[$$puberté$$, $$pic de croissance$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La puberté est la période de transition entre l'enfance et l'adolescence, marquée par un pic de croissance et l'apparition des caractères sexuels secondaires.$$),
        'example', jsonb_build_object('statement', $$Pourquoi la puberté ne débute-t-elle pas exactement au même âge chez tous les adolescents ?$$, 'solution', $$Parce que l'âge de début de la puberté dépend de facteurs individuels (génétiques, nutritionnels, de santé) propres à chaque personne ; il existe donc une variation normale d'un individu à l'autre.$$),
        'fixation', jsonb_build_object('question', $$Cite deux caractéristiques générales de la puberté, communes aux filles et aux garçons.$$, 'solution', $$Une accélération de la croissance (pic de croissance staturale) et l'apparition des caractères sexuels secondaires.$$)
      ),
      jsonb_build_object(
        'heading', $$Les transformations chez la fille$$,
        'body', $$Chez la fille, la puberté se manifeste par le développement de la poitrine, l'élargissement du bassin, l'apparition de poils au niveau du pubis et des aisselles, et par le début des règles, qui indique que les ovaires deviennent fonctionnels.$$,
        'highlights', array[$$caractères sexuels secondaires féminins$$, $$premières règles$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Chez la fille, la puberté se manifeste par le développement de la poitrine, l'élargissement du bassin, la pilosité pubienne et axillaire, et le début des règles.$$),
        'example', jsonb_build_object('statement', $$Que signifie l'apparition des premières règles chez une fille ?$$, 'solution', $$Elle indique que les ovaires sont devenus fonctionnels et libèrent désormais régulièrement une cellule reproductrice, selon un cycle qui se répète environ chaque mois.$$),
        'fixation', jsonb_build_object('question', $$Cite deux transformations physiques observées chez la fille pendant la puberté.$$, 'solution', $$Le développement de la poitrine et l'élargissement du bassin, ou encore l'apparition de la pilosité pubienne.$$)
      ),
      jsonb_build_object(
        'heading', $$Les transformations chez le garçon$$,
        'body', $$Chez le garçon, la puberté se traduit par le développement des testicules et de la verge, la mue de la voix qui devient plus grave, l'apparition de la pilosité du visage et du corps, le développement de la musculature, et le début de la production de spermatozoïdes.$$,
        'highlights', array[$$caractères sexuels secondaires masculins$$, $$mue de la voix$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Chez le garçon, la puberté se traduit par le développement des organes génitaux, la mue de la voix, la pilosité du visage et du corps, et le développement musculaire.$$),
        'example', jsonb_build_object('statement', $$Pourquoi la voix du garçon devient-elle plus grave pendant la puberté ?$$, 'solution', $$Parce que le larynx grandit et les cordes vocales s'allongent et s'épaississent sous l'effet des hormones sexuelles, ce qui abaisse la fréquence des sons produits.$$),
        'fixation', jsonb_build_object('question', $$Cite deux transformations physiques observées chez le garçon pendant la puberté.$$, 'solution', $$La mue de la voix et le développement de la pilosité du visage, ou encore le développement de la musculature.$$)
      ),
      jsonb_build_object(
        'heading', $$Le contrôle hormonal des transformations$$,
        'body', $$Les transformations de la puberté sont déclenchées par des hormones sexuelles, la testostérone produite par les testicules chez le garçon et les œstrogènes produits par les ovaires chez la fille. La production de ces hormones est elle-même commandée par le cerveau, ce qui explique pourquoi les transformations touchent tout le corps de façon coordonnée.$$,
        'highlights', array[$$hormones sexuelles$$, $$testostérone$$, $$œstrogènes$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les transformations de la puberté sont provoquées par les hormones sexuelles (testostérone chez le garçon, œstrogènes chez la fille), produites par les gonades sous le contrôle du cerveau.$$),
        'example', jsonb_build_object('statement', $$Quel organe produit la testostérone et quel effet a-t-elle sur le corps du garçon ?$$, 'solution', $$Les testicules produisent la testostérone, qui déclenche les transformations pubertaires masculines : mue de la voix, pilosité, développement musculaire et production de spermatozoïdes.$$),
        'fixation', jsonb_build_object('question', $$Quelle hormone est responsable des transformations pubertaires chez la fille ?$$, 'solution', $$Les œstrogènes, produits par les ovaires.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Awa et Yao comparent leurs souvenirs d'enfance à leur apparence actuelle et se demandent pourquoi leurs corps ont tant changé en quelques années, chacun de façon différente.$$,
      'questions', array[
        $$Définis la puberté et donne l'âge approximatif de son début.$$,
        $$Cite deux transformations propres à la fille et deux propres au garçon.$$,
        $$Quelles hormones commandent ces transformations, et où sont-elles produites ?$$,
        $$Explique pourquoi l'âge de début de la puberté peut varier d'un adolescent à l'autre.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la puberté ?$$,
      'hint', $$Pense au passage entre deux âges de la vie.$$,
      'expected', $$C'est la période de transition entre l'enfance et l'adolescence, marquée par un pic de croissance et l'apparition des caractères sexuels secondaires.$$
    ),
    jsonb_build_object(
      'question', $$Cite trois transformations observées chez la fille pendant la puberté.$$,
      'hint', $$Poitrine, bassin, règles.$$,
      'expected', $$Le développement de la poitrine, l'élargissement du bassin et le début des règles.$$
    ),
    jsonb_build_object(
      'question', $$Cite trois transformations observées chez le garçon pendant la puberté.$$,
      'hint', $$Voix, pilosité, muscles.$$,
      'expected', $$La mue de la voix, l'apparition de la pilosité du visage et du corps, et le développement de la musculature.$$
    ),
    jsonb_build_object(
      'question', $$Quel rôle jouent les hormones sexuelles dans la puberté ?$$,
      'hint', $$Pense à la testostérone et aux œstrogènes.$$,
      'expected', $$Elles déclenchent et commandent l'ensemble des transformations physiques de la puberté : la testostérone chez le garçon, les œstrogènes chez la fille.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-transformations-corps-humain';
