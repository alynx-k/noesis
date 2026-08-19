-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2403: "LEÇON 8: PUISSANCE ET ÉNERGIE ÉLECTRIQUE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2403), resource id 22194.
-- Contenu réécrit à partir du PDF source (conducteur ohmique, générateur,
-- électrolyseur/récepteur, loi de Pouillet, rendement électrique). Tout le
-- contenu est factuel (électricité) : lois, formules et exercices
-- numériques sont repris/adaptés tels quels ; explications reformulées.
-- NB : la leçon non numérotée « ÉNERGIE POTENTIELLE ÉLECTROSTATIQUE »
-- (Moodle course id=2402) a été vérifiée et confirmée comme une coquille
-- de cours vide (page de cours chargée correctement, mais 0 lien
-- resource/mod détecté) : cette leçon n'a donc pas été migrée.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-physique-puissance-energie-electrique',
  '1ere',
  'C',
  'physique-chimie',
  $$Puissance et énergie électrique$$,
  14,
  '1ere-c-pc-physique-lentilles-minces',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Koffi et Koné, élèves en 1ère au lycée Akpa Gnagne de Dabou, discutent pendant la récréation. Koffi demande : « De quoi dépend l'énergie consommée par un appareil ? ». Koné répond : « De sa puissance et de la durée de fonctionnement. » Un ami leur apprend que cette énergie ne s'exprime pas de la même manière pour tous les appareils. Sous la direction de leur professeur, ils entreprennent d'appliquer la loi d'Ohm pour un conducteur ohmique et pour un générateur, d'appliquer la loi de Pouillet, et de connaître les expressions des différentes puissances et énergies électriques mises en jeu.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le conducteur ohmique (résistor)$$,
        'body', $$La loi d'Ohm pour un conducteur ohmique s'écrit U = R × I (U en volts, R en ohms, I en ampères). L'énergie électrique reçue par le résistor pendant une durée t est Ereçue = UAB × I × t = R × I² × t, et la puissance reçue est Preçue = UAB × I. Cette énergie électrique est intégralement transformée en chaleur : c'est l'effet Joule. Le résistor est donc un dipôle purement thermique, et la puissance thermique évacuée sous forme de chaleur est appelée puissance Joule (notée PJ).$$,
        'highlights', array[$$loi d'Ohm : U = R × I$$, $$Ereçue = R × I² × t ; Preçue = UAB × I$$, $$effet Joule : toute l'énergie électrique reçue par un résistor devient chaleur$$]::text[],
        'example', jsonb_build_object('statement', $$Un conducteur ohmique de résistance R = 20 Ω consomme une énergie E = 540 J pendant t = 5 min (300 s). Calcule l'intensité du courant.$$, 'solution', $$E = R×I²×t ⟹ I = √(E/(R×t)) = √(540/(20×300)) = 0,3 A.$$),
        'fixation', jsonb_build_object('question', $$Sous quelle forme l'énergie électrique reçue par un résistor est-elle intégralement transformée ?$$, 'solution', $$Sous forme de chaleur (effet Joule).$$)
      ),
      jsonb_build_object(
        'heading', $$Le générateur$$,
        'body', $$Pour un générateur de f.é.m. e et de résistance interne r, la loi d'Ohm s'écrit U = e − r × I. La puissance disponible à la sortie du générateur est Pd = UPN × I ; elle se décompose selon Pd = e×I − r×I². Le produit e×I est appelé la puissance engendrée par le générateur (Pe = e×I), résultant des transformations chimiques internes ; le terme r×I² est la puissance Joule dissipée dans la résistance interne du générateur.$$,
        'highlights', array[$$loi d'Ohm du générateur : U = e − r × I$$, $$puissance engendrée : Pe = e × I$$, $$puissance disponible : Pd = UPN × I = e×I − r×I²$$]::text[],
        'fixation', jsonb_build_object('question', $$Que représente le terme r×I² dans le bilan énergétique d'un générateur ?$$, 'solution', $$La puissance Joule dissipée en chaleur dans la résistance interne du générateur.$$)
      ),
      jsonb_build_object(
        'heading', $$L'électrolyseur (récepteur) et le moteur$$,
        'body', $$La tension aux bornes d'un électrolyseur (ou d'un moteur) est proportionnelle à l'intensité du courant qui le traverse dès que I ≠ 0. La loi d'Ohm pour ce type de récepteur s'écrit U = E' + r'×I, où E' est sa force contre-électromotrice (f.c.é.m.) et r' sa résistance interne. L'énergie électrique reçue se décompose en énergie utile et énergie thermique dissipée : Er = (E'×I + r'×I²)×t = Eu + Eth, avec Eu = E'×I×t (énergie utile) et Eth = r'×I²×t (énergie thermique perdue par effet Joule).$$,
        'highlights', array[$$loi d'Ohm du récepteur : U = E' + r' × I$$, $$Er = Eu + Eth, avec Eu = E'×I×t et Eth = r'×I²×t$$]::text[],
        'example', jsonb_build_object('statement', $$Un récepteur de f.c.é.m. E' = 6 V et de résistance interne r' = 2 Ω est parcouru par un courant I = 0,5 A. Calcule son rendement.$$, 'solution', $$η = E' / (E' + r'×I) = 6 / (6 + 2×0,5) = 6/7 ≈ 0,86, soit 86%.$$),
        'fixation', jsonb_build_object('question', $$Quelle grandeur, dans la loi d'Ohm d'un électrolyseur, joue un rôle analogue à celui de la f.é.m. d'un générateur ?$$, 'solution', $$La force contre-électromotrice (f.c.é.m.) E'.$$)
      ),
      jsonb_build_object(
        'heading', $$Loi de Pouillet et rendement électrique$$,
        'body', $$Pour un circuit série comportant plusieurs générateurs (f.é.m. E), récepteurs (f.c.é.m. E') et résistances, la loi de Pouillet donne l'intensité du courant : I = (ΣE − ΣE') / ΣR. Le rendement électrique d'un générateur est η = Pf/Pe = (E − rI)/E = 1 − rI/E (toujours inférieur à 1, car une partie de la puissance engendrée est dissipée par effet Joule dans sa résistance interne). Le rendement d'un récepteur (électrolyseur ou moteur) est η = Pu/Pr = E'/(E' + r'I), également toujours inférieur à 1.$$,
        'highlights', array[$$loi de Pouillet : I = (ΣE − ΣE') / ΣR$$, $$rendement du générateur : η = 1 − rI/E$$, $$rendement du récepteur : η = E' / (E' + r'I)$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi le rendement d'un générateur est-il toujours inférieur à 1 ?$$, 'solution', $$Parce qu'une partie de la puissance qu'il engendre est dissipée par effet Joule dans sa résistance interne (rI²), et n'est donc pas disponible à la sortie.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un récepteur de force contre-électromotrice E' = 6 V et de résistance interne r' = 2 Ω est parcouru par un courant électrique d'intensité I = 0,5 A pendant une durée t = 30 s.$$,
      'questions', array[
        $$Rappelle la loi d'Ohm et l'expression du rendement d'un tel récepteur.$$,
        $$Détermine le rendement du récepteur.$$,
        $$Calcule l'énergie électrique reçue par le récepteur pendant les 30 secondes.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris la loi d'Ohm pour un conducteur ohmique de résistance R.$$,
      'hint', $$C'est une relation simple entre U, R et I.$$,
      'expected', $$U = R × I.$$
    ),
    jsonb_build_object(
      'question', $$Pour un générateur de f.é.m. e et de résistance interne r, comment s'appelle le produit e × I ?$$,
      'hint', $$Elle résulte des transformations chimiques internes.$$,
      'expected', $$La puissance engendrée par le générateur (Pe = e × I).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la loi d'Ohm d'un récepteur de type électrolyseur ou moteur, de f.c.é.m. E' et de résistance interne r' ?$$,
      'hint', $$Elle ressemble à celle du générateur, mais avec un signe différent.$$,
      'expected', $$U = E' + r' × I.$$
    ),
    jsonb_build_object(
      'question', $$Écris la loi de Pouillet pour un circuit série comportant des générateurs, des récepteurs et des résistances.$$,
      'hint', $$C'est un rapport entre une différence de f.é.m./f.c.é.m. et une somme de résistances.$$,
      'expected', $$I = (ΣE − ΣE') / ΣR.$$
    )
  ),
  now()
);
