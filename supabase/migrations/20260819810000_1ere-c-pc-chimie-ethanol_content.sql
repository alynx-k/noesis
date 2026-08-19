-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2392: "LEÇON 7: L'ÉTHANOL"
-- (https://lyc.ecole-ci.org/course/view.php?id=2392), resource id 22062.
-- Contenu réécrit à partir du PDF source (obtention de l'éthanol,
-- combustion, oxydation ménagée par le cuivre incandescent — expérience de
-- la « lampe sans flamme », dangers de la consommation d'alcool). Tout le
-- contenu est factuel (chimie organique, données médicales générales) :
-- équations-bilans, expérience et exercices numériques repris/adaptés tels
-- quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-ethanol',
  '1ere',
  'C',
  'physique-chimie',
  $$L'éthanol$$,
  5,
  '1ere-c-pc-chimie-composes-oxygenes',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le cadre des activités du club scientifique, les élèves de 1ère C du lycée Scientifique de Yamoussoukro se rendent sur un chantier de fabrication de boisson traditionnelle appelée communément « koutoukou ». Ils apprennent que cette boisson contient une dose importante d'éthanol. Émerveillés par cette visite, ils décident en classe d'expliquer les procédés d'obtention de l'éthanol, d'identifier les produits de son oxydation et d'exploiter les équations-bilans de son oxydation et de sa combustion.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Obtention de l'éthanol$$,
        'body', $$L'éthanol peut être obtenu par fermentation des jus sucrés (vin de palme, jus de fruits) : sous l'action d'enzymes, le glucose contenu dans ces jus se transforme en éthanol selon l'équation-bilan C6H12O6 → 2 C2H5OH + 2 CO2. Il peut aussi être obtenu par hydratation de l'éthylène, en présence d'acide sulfurique (H2SO4) comme catalyseur : H2C=CH2 + H2O → CH3-CH2-OH.$$,
        'highlights', array[$$fermentation : C6H12O6 → 2 C2H5OH + 2 CO2$$, $$hydratation de l'éthylène (catalyseur H2SO4) → éthanol$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel gaz est libéré lors de la fermentation du glucose en éthanol ?$$, 'solution', $$Le dioxyde de carbone (CO2).$$)
      ),
      jsonb_build_object(
        'heading', $$Combustion de l'éthanol$$,
        'body', $$La combustion complète de l'éthanol dans le dioxygène de l'air donne du dioxyde de carbone et de l'eau, selon l'équation-bilan : CH3-CH2-OH + 3 O2 → 2 CO2 + 3 H2O.$$,
        'highlights', array[$$combustion : C2H6O + 3 O2 → 2 CO2 + 3 H2O$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle quantité de dioxyde de carbone (en mol) produit la combustion complète d'une mole d'éthanol ?$$, 'solution', $$2 mol de CO2, d'après le coefficient stœchiométrique de l'équation-bilan.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux produits de la combustion complète de l'éthanol ?$$, 'solution', $$Le dioxyde de carbone (CO2) et l'eau (H2O).$$)
      ),
      jsonb_build_object(
        'heading', $$Oxydation ménagée de l'éthanol : la « lampe sans flamme »$$,
        'body', $$Lorsqu'un fil de cuivre incandescent est plongé dans des vapeurs d'éthanol tiédi, il reste incandescent (la réaction est très exothermique), le papier imbibé de réactif de Schiff devient rose (signe de la formation d'un aldéhyde, l'éthanal), et un papier pH placé à proximité devient rouge (signe de la formation d'un composé acide, l'acide éthanoïque). En présence de cuivre (catalyseur), l'éthanol gazeux réagit donc avec le dioxygène de l'air pour donner d'abord l'éthanal, puis l'acide éthanoïque : CH3-CH2-OH + ½O2 →(Cu) CH3-CHO + H2O, puis CH3-CHO + ½O2 →(Cu) CH3-COOH. Cette oxydation ménagée conserve la chaîne carbonée de la molécule.$$,
        'highlights', array[$$éthanol →(Cu) éthanal →(Cu) acide éthanoïque$$, $$réactif de Schiff rose = aldéhyde ; papier pH rouge = acide$$, $$oxydation ménagée : la chaîne carbonée est conservée$$]::text[],
        'fixation', jsonb_build_object('question', $$Que révèle le test au réactif de Schiff dans cette expérience ?$$, 'solution', $$Il révèle la formation d'un aldéhyde (l'éthanal) : le réactif de Schiff devient rose en présence d'un aldéhyde.$$)
      ),
      jsonb_build_object(
        'heading', $$Dangers liés à la consommation d'alcool$$,
        'body', $$L'éthanol contenu dans les boissons alcoolisées est dangereux à forte dose : sa consommation excessive peut entraîner des troubles de mémoire et des maladies telles que le diabète ou la cirrhose du foie. Après ingestion, une grande partie de l'éthanol est absorbée par l'organisme (70 à 80% au niveau du duodénum et du jéjunum) puis éliminée essentiellement par le foie (95%), le reste par les reins, la peau, les poumons et la salive. C'est pourquoi les agents de surveillance routière réalisent des tests d'alcootest pour déceler l'excès d'éthanol chez les conducteurs.$$,
        'highlights', array[$$consommation excessive : troubles de mémoire, diabète, cirrhose du foie$$, $$élimination : 95% par le foie$$, $$alcootest : contrôle routier de l'alcoolémie$$]::text[],
        'fixation', jsonb_build_object('question', $$Par quel organe l'éthanol est-il principalement éliminé de l'organisme ?$$, 'solution', $$Le foie (environ 95% de l'élimination).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour préparer ses élèves à un concours, leur professeur de physique-chimie leur demande de déterminer les produits d'oxydation d'un alcool A dont la masse molaire est MA = 46 g/mol. Il les informe que l'oxydation de A dans le dioxygène de l'air, en présence de cuivre porté à incandescence, donne un composé B qui rosit le réactif de Schiff et qui s'oxyde ensuite en un composé C qui colore en rouge un papier indicateur de pH. On donne : M(C) = 12 g/mol ; M(H) = 1 g/mol ; M(O) = 16 g/mol.$$,
      'questions', array[
        $$Donne la formule brute générale d'un alcool en fonction du nombre n d'atomes de carbone.$$,
        $$Détermine la formule brute, la formule semi-développée et le nom de A.$$,
        $$Cite deux méthodes permettant de préparer A, puis déduis-en les formules semi-développées et les noms des composés B et C, et écris les équations-bilans des réactions conduisant à leur formation.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les deux méthodes d'obtention de l'éthanol présentées dans la leçon ?$$,
      'hint', $$L'une part d'un jus sucré, l'autre d'un alcène.$$,
      'expected', $$La fermentation des jus sucrés (glucose → éthanol + CO2) et l'hydratation de l'éthylène en présence d'acide sulfurique.$$
    ),
    jsonb_build_object(
      'question', $$Écris l'équation-bilan de la combustion complète de l'éthanol.$$,
      'hint', $$Les produits sont le CO2 et l'eau.$$,
      'expected', $$CH3-CH2-OH + 3 O2 → 2 CO2 + 3 H2O.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont, dans l'ordre, les deux produits successifs de l'oxydation ménagée de l'éthanol en présence de cuivre incandescent ?$$,
      'hint', $$D'abord un aldéhyde, puis un acide.$$,
      'expected', $$D'abord l'éthanal (CH3-CHO), puis l'acide éthanoïque (CH3-COOH).$$
    ),
    jsonb_build_object(
      'question', $$Cite une maladie que peut favoriser une consommation excessive et prolongée d'alcool.$$,
      'hint', $$Elle touche le foie.$$,
      'expected', $$La cirrhose du foie (ou le diabète).$$
    )
  ),
  now()
);
