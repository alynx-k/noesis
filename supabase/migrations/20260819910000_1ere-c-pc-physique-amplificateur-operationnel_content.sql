-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2399: "LEÇON 10: L'AMPLIFICATEUR OPÉRATIONNEL"
-- (https://lyc.ecole-ci.org/course/view.php?id=2399), resource id 22146.
-- Contenu réécrit à partir du PDF source (généralités et bornes de l'AO,
-- régimes linéaire/saturé, montages suiveur/inverseur/non-inverseur/
-- sommateur/comparateur). Tout le contenu est factuel (électronique) :
-- définitions, lois des mailles et exercices numériques sont
-- repris/adaptés tels quels ; explications reformulées.
-- NB : la leçon 9 « LE CONDENSATEUR » (Moodle course id=2404) a été
-- vérifiée et confirmée comme une coquille de cours vide (page de cours
-- chargée correctement, mais 0 lien resource/mod détecté) : cette leçon
-- n'a donc pas été migrée.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-physique-amplificateur-operationnel',
  '1ere',
  'C',
  'physique-chimie',
  $$L'amplificateur opérationnel$$,
  15,
  '1ere-c-pc-physique-puissance-energie-electrique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève en 1ère C au Lycée Moderne Tingrela lit dans une revue scientifique que l'amplificateur opérationnel (AO) est un circuit intégré qui permet de réaliser des opérations mathématiques : addition, soustraction, intégration, dérivation... Le lendemain, il informe ses camarades de classe. Afin de comprendre le fonctionnement de l'AO, les élèves décident, sous la supervision de leur professeur, de s'informer sur ses propriétés, d'analyser son comportement et d'établir la relation entre la tension d'entrée et la tension de sortie de quelques montages.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Généralités sur l'amplificateur opérationnel$$,
        'body', $$L'amplificateur opérationnel (AO) fait partie des circuits intégrés linéaires ; il se présente sous la forme d'un boîtier possédant huit bornes de branchement. Parmi elles : la borne 2 est l'entrée inverseuse (E-), la borne 3 l'entrée non inverseuse (E+), les bornes 4 et 7 sont les bornes d'alimentation (négative et positive), la borne 6 est la sortie (S), les bornes 1 et 5 servent au réglage d'offset, et la borne 8 n'est pas connectée. Son symbole représente les deux entrées E- et E+ et une sortie S.$$,
        'highlights', array[$$AO : circuit intégré linéaire, boîtier à 8 bornes$$, $$E- (entrée inverseuse), E+ (entrée non inverseuse), S (sortie)$$]::text[],
        'fixation', jsonb_build_object('question', $$Combien de bornes de branchement possède un amplificateur opérationnel ?$$, 'solution', $$Huit bornes.$$)
      ),
      jsonb_build_object(
        'heading', $$Régime linéaire et régime saturé$$,
        'body', $$La caractéristique Us = f(Ud) d'un AO (où Ud = V+ − V- est la tension différentielle) présente deux régimes. En régime linéaire (partie centrale de la courbe), la tension de sortie est proportionnelle à la tension différentielle : Us = G × Ud, où G, le gain différentiel, est très grand (infini pour un AO idéal). En régime saturé, la tension de sortie ne peut prendre que deux valeurs : Us = +Vsat ou Us = −Vsat, avec toujours |Vsat| < |Vcc| (les tensions d'alimentation). Un AO idéal fonctionnant en régime linéaire présente une résistance d'entrée infinie (courants d'entrée négligeables, i- = i+ = 0) et ses deux entrées sont au même potentiel (Ud = 0) ; sa tension de sortie reste toujours inférieure à sa tension de saturation.$$,
        'highlights', array[$$régime linéaire : Us = G × Ud (G très grand)$$, $$régime saturé : Us = +Vsat ou −Vsat$$, $$AO idéal en régime linéaire : i- = i+ = 0 et Ud = 0$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux conditions caractéristiques d'un AO idéal fonctionnant en régime linéaire ?$$, 'solution', $$Les courants d'entrée sont nuls (i- = i+ = 0), et la tension différentielle est nulle (Ud = U+ − U- = 0).$$)
      ),
      jsonb_build_object(
        'heading', $$Montages amplificateurs en régime linéaire$$,
        'body', $$Dans le montage suiveur, la tension d'entrée est appliquée directement à l'entrée non inverseuse : la tension de sortie suit exactement la tension d'entrée (Us = Ue), utilisé par exemple dans un voltmètre électronique. Dans le montage amplificateur inverseur (entrée sur une résistance R1 reliée à l'entrée inverseuse, contre-réaction par R2), on obtient Us = −(R2/R1)×Ue ; le gain en tension est G = |Us/Ue| = R2/R1. Dans le montage amplificateur non inverseur, on obtient Us = ((R1+R2)/R1)×Ue, avec un gain G = 1 + R2/R1.$$,
        'highlights', array[$$montage suiveur : Us = Ue$$, $$montage inverseur : Us = −(R2/R1)×Ue, gain G = R2/R1$$, $$montage non inverseur : Us = ((R1+R2)/R1)×Ue, gain G = 1 + R2/R1$$]::text[],
        'example', jsonb_build_object('statement', $$Pour un montage amplificateur inverseur avec Ue = 2 V et R2 = 2×R1, calcule Us.$$, 'solution', $$Us = −(R2/R1)×Ue = −2×2 = −4 V.$$),
        'fixation', jsonb_build_object('question', $$Dans quel montage la tension de sortie a-t-elle toujours le même signe que la tension d'entrée, avec un gain forcément supérieur à 1 ?$$, 'solution', $$Le montage amplificateur non inverseur (G = 1 + R2/R1 > 1).$$)
      ),
      jsonb_build_object(
        'heading', $$Montage sommateur inverseur et régime saturé (comparateur)$$,
        'body', $$Le montage sommateur inverseur combine deux tensions d'entrée U1 et U2, chacune reliée par sa propre résistance (R1 et R2) à l'entrée inverseuse, avec une résistance de contre-réaction R3 : on obtient Us = −R3×(U1/R1 + U2/R2). En régime saturé, la tension différentielle Ud n'est jamais nulle (U+ ≠ U-), et la sortie ne peut prendre que deux valeurs (+Vsat ou −Vsat) : c'est le principe du montage comparateur, où l'on compare une tension à comparer U2 à une tension de référence U1 — si U1 > U2, Us = −Vsat ; si U1 < U2, Us = +Vsat.$$,
        'highlights', array[$$sommateur inverseur : Us = −R3×(U1/R1 + U2/R2)$$, $$comparateur (régime saturé) : Us = −Vsat si U1 > U2 ; Us = +Vsat si U1 < U2$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans un montage comparateur, que se passe-t-il pour la tension de sortie si la tension de référence U1 est supérieure à la tension à comparer U2 ?$$, 'solution', $$La sortie bascule à Us = −Vsat.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le professeur met à disposition le matériel nécessaire pour réaliser un montage amplificateur non-inverseur, en proposant deux schémas possibles (montage N°1 et montage N°2). Un élève affirme que c'est le montage N°1 qu'il faut réaliser, un autre affirme que c'est le montage N°2. L'AO est supposé idéal et fonctionne en régime linéaire.$$,
      'questions', array[
        $$Nomme le composant fondamental des deux circuits, et rappelle ses propriétés en régime linéaire.$$,
        $$Établis, pour chacun des deux montages, l'expression de la tension de sortie Us en fonction de Ue, R1 et R2, ainsi que l'expression du gain en tension G.$$,
        $$En comparant les deux expressions obtenues à celle d'un montage non-inverseur (Us = ((R1+R2)/R1)×Ue), justifie quel montage il fallait réaliser.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle borne d'un AO est l'entrée non inverseuse, selon la numérotation standard ?$$,
      'hint', $$Elle porte le symbole E+.$$,
      'expected', $$La borne 3.$$
    ),
    jsonb_build_object(
      'question', $$Dans un montage suiveur, quelle est la relation entre Ue et Us ?$$,
      'hint', $$C'est la relation la plus simple possible.$$,
      'expected', $$Ue = Us (la tension de sortie suit la tension d'entrée).$$
    ),
    jsonb_build_object(
      'question', $$Pour un montage amplificateur inverseur avec R1 = 1 kΩ et R2 = 5 kΩ, quel est le gain en tension G ?$$,
      'hint', $$G = R2/R1.$$,
      'expected', $$G = R2/R1 = 5 kΩ / 1 kΩ = 5.$$
    ),
    jsonb_build_object(
      'question', $$Dans un montage comparateur (régime saturé), combien de valeurs la tension de sortie Us peut-elle prendre ?$$,
      'hint', $$Ce n'est jamais une valeur intermédiaire.$$,
      'expected', $$Deux valeurs seulement : +Vsat ou -Vsat.$$
    )
  ),
  now()
);
