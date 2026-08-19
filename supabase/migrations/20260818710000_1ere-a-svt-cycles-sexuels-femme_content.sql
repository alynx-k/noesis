-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- SVT, categoryid=125.
-- Moodle course id 898: "SVT 1ère A_L4_Les cycles sexuels chez la femme"
-- (https://lyc.ecole-ci.org/course/view.php?id=898), resource id 4425.
-- Contenu réécrit à partir du PDF source (cycle ovarien/utérin/hormonal,
-- expériences d'ablation/greffe, régulation hormonale, anomalies).
-- Faits scientifiques réels (durées, taux hormonaux, expériences
-- classiques) repris tels quels ; explications reformulées, non copiées
-- verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-svt-cycles-sexuels-femme',
  '1ere',
  'A',
  'svt',
  $$Les cycles sexuels chez la femme$$,
  4,
  '1ere-a-svt-anomalies-chromosomiques',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève constate que chaque mois, un écoulement de sang se produit depuis son vagin pendant au moins trois jours. Avec ses amies vivant la même situation, elle consulte un gynécologue, qui explique qu'il s'agit de la manifestation extérieure du fonctionnement de l'appareil reproducteur féminin. Les élèves décident de décrire les cycles sexuels chez la femme et d'expliquer leur mécanisme de régulation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le cycle ovarien$$,
        'body', $$Le cycle ovarien comprend deux phases séparées par l'ovulation. La phase folliculaire (14 premiers jours d'un cycle de 28 jours) est caractérisée par la croissance des follicules, dont un seul arrive à maturité ; au 14ème jour, la rupture du follicule mûr libère l'ovocyte II : c'est l'ovulation. La phase lutéinique (post-ovulatoire) voit le follicule rompu se transformer en corps jaune, qui grossit puis dégénère en corps blanc en l'absence de fécondation (il persiste s'il y a fécondation).$$,
        'highlights', array[$$phase folliculaire : croissance du follicule → ovulation (14ème jour)$$, $$phase lutéinique : follicule rompu → corps jaune$$]::text[],
        'fixation', jsonb_build_object('question', $$Que devient le follicule rompu après l'ovulation, en l'absence de fécondation ?$$, 'solution', $$Il se transforme en corps jaune, qui grossit puis dégénère en corps blanc vers la fin du cycle.$$)
      ),
      jsonb_build_object(
        'heading', $$Le cycle utérin et le cycle hormonal$$,
        'body', $$Le cycle utérin suit le cycle ovarien : pendant la phase folliculaire, l'endomètre se desquame (menstrues, 3 à 5 jours) puis s'épaissit progressivement ; pendant la phase lutéinique, il atteint son épaisseur maximale et prend l'aspect d'une « dentelle utérine » favorable à la nidation, avant de se desquamer à nouveau en l'absence de fécondation. Côté hormonal, le taux d'œstradiol atteint un premier pic vers le 12ème jour puis un second vers le 21ème jour ; la progestérone culmine vers le 21ème jour. Côté hypophysaire, la FSH augmente progressivement avec un pic juste avant l'ovulation (13ème jour), tandis que la LH connaît un pic brutal et plus élevé au 13ème jour, qui déclenche l'ovulation.$$,
        'highlights', array[$$endomètre : desquamation → épaississement → dentelle utérine$$, $$pic de LH (13ème jour) déclenche l'ovulation$$]::text[],
        'property', jsonb_build_object('label', $$Repères chronologiques (cycle de 28 jours)$$, 'text', $$Pic d'œstradiol : 12ème jour. Pic de LH (et ovulation) : 13-14ème jour. Pic d'œstradiol et de progestérone (phase lutéinique) : 21ème jour.$$),
        'fixation', jsonb_build_object('question', $$Quelle hormone hypophysaire déclenche l'ovulation par son pic ?$$, 'solution', $$La LH (hormone lutéinique), dont le pic au 13ème jour est supérieur à celui de la FSH.$$)
      ),
      jsonb_build_object(
        'heading', $$La régulation hormonale : le mécanisme$$,
        'body', $$Des expériences d'ablation, de greffe et d'injection ont établi le mécanisme de contrôle : l'ablation de l'antéhypophyse arrête le cycle ovarien (reprise après greffe), montrant que l'antéhypophyse contrôle les ovaires via la FSH et la LH (gonadotrophines). La stimulation de l'hypothalamus augmente la sécrétion de FSH/LH, montrant que l'hypothalamus contrôle l'antéhypophyse via la GnRH (hormone de libération des gonadotrophines). L'ablation des ovaires arrête le cycle utérin (repris par injection d'extraits ovariens), montrant que les ovaires contrôlent l'utérus via l'œstradiol et la progestérone. Enfin, l'injection de fortes doses d'œstradiol et de progestérone diminue la sécrétion de FSH/LH (rétrocontrôle négatif), tandis qu'une forte dose d'œstradiol seul l'augmente (rétrocontrôle positif, qui explique le pic de LH avant l'ovulation).$$,
        'highlights', array[$$hypothalamus (GnRH) → antéhypophyse (FSH, LH) → ovaires (œstradiol, progestérone)$$, $$rétrocontrôle négatif et positif des ovaires sur l'antéhypophyse$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi l'ablation de l'antéhypophyse provoque-t-elle l'atrophie des ovaires et l'arrêt du cycle ovarien ?$$, 'solution', $$Parce que l'antéhypophyse sécrète la FSH et la LH, qui stimulent l'activité des ovaires ; sans ces gonadotrophines, les ovaires ne sont plus stimulés et cessent de fonctionner.$$),
        'fixation', jsonb_build_object('question', $$Quelle hormone l'hypothalamus libère-t-il pour contrôler l'antéhypophyse ?$$, 'solution', $$La GnRH (hormone de libération des gonadotrophines).$$)
      ),
      jsonb_build_object(
        'heading', $$Les anomalies de reproduction liées aux cycles sexuels$$,
        'body', $$Chez une femme présentant des difficultés à concevoir, le dosage hormonal peut révéler l'absence de pic de progestérone en phase lutéinique (empêchant la formation de la dentelle utérine favorable à la nidation), un pic d'œstradiol trop faible (empêchant l'épaississement normal de l'endomètre), ou l'absence de pics de FSH et de LH (bloquant la maturation folliculaire et l'ovulation). Ces anomalies, dues à une insuffisance hormonale, exposent à l'avortement spontané et à la stérilité.$$,
        'highlights', array[$$absence de pic de progestérone → pas de dentelle utérine$$, $$absence de pic FSH/LH → pas d'ovulation$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle conséquence a l'absence de pic de LH chez une femme ?$$, 'solution', $$L'ovulation n'a pas lieu, ce qui peut entraîner une stérilité.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une courbe montre l'évolution du taux plasmatique d'une hormone ovarienne chez une femme, sur deux cycles sexuels consécutifs (règles le 7 juin, pic autour du 20 juin, règles le 5 juillet, pic autour du 18 juillet, règles le 2 août).$$,
      'questions', array[
        $$Analyse la courbe (évolution du taux hormonal au cours du cycle).$$,
        $$Explique l'évolution de cette hormone au cours d'un cycle sexuel.$$,
        $$Déduis le rôle de cette hormone dans le cycle sexuel de la femme.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de jours dure en moyenne un cycle sexuel régulier ?$$,
      'hint', $$C'est le chiffre de référence utilisé dans le cours.$$,
      'expected', $$28 jours.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la structure qui se forme après la rupture du follicule mûr lors de l'ovulation ?$$,
      'hint', $$C'est une glande temporaire.$$,
      'expected', $$Le corps jaune.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux hormones ovariennes principales impliquées dans le cycle sexuel ?$$,
      'hint', $$L'une domine la phase folliculaire, l'autre la phase lutéinique.$$,
      'expected', $$L'œstradiol et la progestérone.$$
    ),
    jsonb_build_object(
      'question', $$Quel type de rétrocontrôle une forte dose d'œstradiol seul exerce-t-elle sur la sécrétion de FSH et de LH, d'après les expériences décrites ?$$,
      'hint', $$Elle augmente la sécrétion de FSH/LH.$$,
      'expected', $$Un rétrocontrôle positif.$$
    )
  ),
  now()
);
