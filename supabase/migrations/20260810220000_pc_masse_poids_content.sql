-- Physique-Chimie 3ème — Masse et poids d'un corps.
-- Grounded in the real ecole-ci.org PDF for this lesson (Collège Numérique,
-- Physique-Chimie 3ème, cours id=1014, resource "PC 3ème_L1_Masse et
-- poids.pdf", fetched 2026-08-08 via the site's own course navigation).
-- The PDF covers: masse (grandeur invariable, balance), masse volumique
-- a=m/V, densité d=a/a_eau, poids (dynamomètre/peson, newton), la relation
-- P=mg avec un tableau de g selon le lieu (Abidjan/Paris/Lune/Mars), et une
-- situation d'évaluation où l'on identifie un métal par sa masse volumique.
-- Every sentence below is original wording; no text was copied from the PDF.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au marché de Bonon, un acheteur pèse la récolte de cacao d'un planteur avec une balance romaine puis inscrit sur le reçu : « poids : 80 kg ». Un des enfants du planteur trouve cette écriture correcte, sa sœur n'est pas d'accord. Qui a raison, et comment distingue-t-on vraiment la masse et le poids d'un corps ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La masse d'un corps$$,
        'body', $$La masse d'un corps est la grandeur physique qui indique la quantité de matière qu'il contient. Elle se mesure avec une balance et s'exprime en kilogramme (kg), l'unité internationale. On utilise aussi des multiples comme la tonne (t) et le quintal (q), ou des sous-multiples comme l'hectogramme (hg), le gramme (g) et le milligramme (mg). La masse d'un corps ne change pas d'un lieu à un autre.$$,
        'highlights', array[$$masse$$, $$balance$$, $$kilogramme$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La masse d'un corps est une grandeur invariable : elle se mesure à l'aide d'une balance et s'exprime en kilogramme (kg), quel que soit le lieu où on l'évalue.$$),
        'example', jsonb_build_object('statement', $$Un sac de riz est pesé à Abidjan avec une balance de cuisine : elle indique 25 kg. Ce même sac serait-il pesé différemment sur la Lune ?$$, 'solution', $$Non : la masse ne dépend pas du lieu, le sac aurait toujours une masse de 25 kg sur la Lune.$$),
        'fixation', jsonb_build_object('question', $$Quel instrument sert à mesurer la masse d'un corps, et dans quelle unité s'exprime-t-elle ?$$, 'solution', $$On utilise une balance, et la masse s'exprime en kilogramme (kg).$$)
      ),
      jsonb_build_object(
        'heading', $$Masse volumique et densité$$,
        'body', $$La masse volumique d'une substance, notée a (ou ρ), est la masse d'une unité de volume de cette substance : a = m/V, où m est la masse et V le volume. Elle s'exprime en kilogramme par mètre cube (kg/m³) dans le système international, ou en g/cm³ et kg/dm³ dans la pratique courante. La densité d'un corps solide ou liquide, notée d, est le rapport entre sa masse volumique et celle de l'eau ; elle n'a pas d'unité.$$,
        'highlights', array[$$masse volumique$$, $$densité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$a = m/V (masse volumique) ; d = a_substance / a_eau (densité, sans unité). Les unités g/cm³, kg/dm³ et t/m³ sont toutes équivalentes.$$),
        'example', jsonb_build_object('statement', $$Un objet en bois a une masse de 600 g pour un volume de 1000 cm³. Calcule sa masse volumique puis sa densité.$$, 'solution', $$a = 600/1000 = 0,6 g/cm³ ; d = 0,6/1 = 0,6.$$),
        'fixation', jsonb_build_object('question', $$Un morceau de métal a une masse de 540 g pour un volume de 200 cm³. Calcule sa masse volumique.$$, 'solution', $$a = 540/200 = 2,7 g/cm³.$$)
      ),
      jsonb_build_object(
        'heading', $$Le poids d'un corps$$,
        'body', $$Le poids d'un corps, noté P, est l'attraction que la Terre exerce sur ce corps. Il se mesure avec un dynamomètre ou un peson, et s'exprime en newton (N), contrairement à la masse qui se mesure avec une balance et s'exprime en kilogramme.$$,
        'highlights', array[$$poids$$, $$dynamomètre$$, $$newton$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le poids P est l'attraction exercée par la Terre sur un corps. Il se mesure avec un dynamomètre ou un peson et s'exprime en newton (N).$$),
        'example', jsonb_build_object('statement', $$Un solide accroché à un dynamomètre fait dévier l'aiguille jusqu'à 4 N. Que représente cette valeur ?$$, 'solution', $$Elle représente le poids P du solide, soit 4 N.$$),
        'fixation', jsonb_build_object('question', $$Quel appareil permet de mesurer le poids d'un objet, et dans quelle unité s'exprime-t-il ?$$, 'solution', $$Un dynamomètre (ou un peson), et le poids s'exprime en newton (N).$$)
      ),
      jsonb_build_object(
        'heading', $$Relation entre poids et masse$$,
        'body', $$En mesurant le poids de plusieurs masses marquées avec un dynamomètre, on constate que le quotient P/m reste constant : le poids et la masse sont proportionnels. Ce coefficient de proportionnalité est appelé intensité de la pesanteur, notée g. Sa valeur dépend du lieu : elle est légèrement différente à Abidjan et à Paris, et bien plus faible sur la Lune ou sur Mars.$$,
        'highlights', array[$$intensité de la pesanteur$$, $$P = m × g$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Lieu$$, $$Intensité de pesanteur g (N/kg)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Abidjan$$, $$9,78$$),
            jsonb_build_array($$Paris$$, $$9,81$$),
            jsonb_build_array($$Lune$$, $$1,6$$),
            jsonb_build_array($$Mars$$, $$3,6$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$P = m × g, avec P le poids en newton (N), m la masse en kilogramme (kg) et g l'intensité de la pesanteur en newton par kilogramme (N/kg). Le poids d'un corps varie donc selon le lieu, alors que sa masse reste constante.$$),
        'example', jsonb_build_object('statement', $$Calcule le poids d'un paquet de ciment de masse 50 kg à Abidjan, où g=10 N/kg (valeur arrondie).$$, 'solution', $$P = m×g = 50×10 = 500 N.$$),
        'fixation', jsonb_build_object('question', $$Calcule le poids de ce même paquet de ciment de 50 kg sur la Lune (g=1,6 N/kg).$$, 'solution', $$P = m×g = 50×1,6 = 80 N.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En allant à l'école, une élève ramasse une pièce métallique et pense qu'elle est en argent. En suspendant la pièce à un dynamomètre, elle lit un poids de 1,35 N (g=10 N/kg). En l'immergeant dans une éprouvette, le niveau de l'eau passe de 110 cm³ à 160 cm³.$$,
      'questions', array[
        $$Calcule la masse de la pièce à partir de son poids.$$,
        $$Calcule le volume de la pièce à partir des deux relevés d'éprouvette, puis sa masse volumique.$$,
        $$Sachant que l'aluminium a une masse volumique de 2,7 g/cm³ et l'argent 10,5 g/cm³, la pièce est-elle en argent ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Calcule le poids d'un élève de masse 50 kg à Abidjan (g=9,78 N/kg, arrondi à l'unité).$$,
      'hint', $$Utilise la relation P=m×g.$$,
      'expected', $$P=50×9,78=489 N (≈489 N).$$
    ),
    jsonb_build_object(
      'question', $$Un objet a un poids de 245 N à Paris (g=9,81 N/kg). Calcule sa masse.$$,
      'hint', $$Utilise m=P/g.$$,
      'expected', $$m=245/9,81≈25 kg.$$
    ),
    jsonb_build_object(
      'question', $$Un morceau de métal a une masse de 890 g pour un volume de 100 cm³. Calcule sa masse volumique en g/cm³.$$,
      'hint', $$Utilise a=m/V.$$,
      'expected', $$a=890/100=8,9 g/cm³.$$
    ),
    jsonb_build_object(
      'question', $$Explique la différence entre masse et poids en citant l'instrument de mesure et l'unité de chacun.$$,
      'hint', $$Pense à balance/dynamomètre et à kg/N.$$,
      'expected', $$La masse est la quantité de matière, invariable, mesurée en kg avec une balance ; le poids est l'attraction exercée par la Terre, variable selon le lieu, mesurée en N avec un dynamomètre.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-masse-poids';
