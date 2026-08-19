-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 930: "LEÇON 2: HYDROCARBURES SATURÉS : LES ALCANES"
-- (https://lyc.ecole-ci.org/course/view.php?id=930), resource id 4809.
-- Contenu réécrit à partir du PDF source (formules, règles de
-- nomenclature, propriétés chimiques des alcanes). Tout le contenu est
-- factuel (chimie organique) : formules, règles IUPAC, équations-bilans
-- et exercices numériques sont repris/adaptés tels quels ; explications
-- reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-hydrocarbures-satures-alcanes',
  '1ere',
  'C',
  'physique-chimie',
  $$Hydrocarbures saturés : les alcanes$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le cadre des activités du club scientifique, les élèves de 1ère C se rendent à la Société Ivoirienne de Raffinage (SIR). Ils apprennent que le pétrole lampant, le gaz de cuisine, l'essence sans plomb, le gas-oil et le kérosène contiennent des alcanes. De retour en classe, ils s'engagent à connaître la structure des alcanes, à nommer quelques alcanes et à expliquer leur intérêt.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Généralités et structure$$,
        'body', $$Une liaison covalente s'établit entre deux atomes par la mise en commun de deux électrons célibataires, formant un doublet de liaison. La valence d'un atome est le nombre de liaisons de covalence qu'il peut former. Les alcanes sont des hydrocarbures saturés dont tous les atomes de carbone ont une structure tétraédrique ; leur formule brute générale est CnH2n+2 (n ≥ 1). Le méthane (CH4) est le plus simple : l'atome de carbone forme 4 liaisons avec 4 atomes d'hydrogène (angle H-C-H = 109°28'). Une chaîne carbonée est linéaire si les atomes de carbone se suivent sans boucle, ramifiée si au moins un carbone est lié à trois ou quatre autres carbones.$$,
        'highlights', array[$$formule générale des alcanes : CnH2n+2$$, $$carbone tétraédrique, angle H-C-H = 109°28'$$, $$chaîne linéaire vs ramifiée$$]::text[],
        'property', jsonb_build_object('label', $$Formule générale$$, 'text', $$CnH2n+2, avec n ≥ 1 (nombre d'atomes de carbone).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la formule brute générale des alcanes ?$$, 'solution', $$CnH2n+2 (n ≥ 1).$$)
      ),
      jsonb_build_object(
        'heading', $$Nomenclature des alcanes$$,
        'body', $$Les quatre premiers alcanes ont un nom d'usage : méthane (n=1), éthane (n=2), propane (n=3), butane (n=4). Au-delà, le nom s'obtient par préfixe + « -ane » (pentane, hexane, heptane, octane, nonane, décane pour n=5 à 10). Un groupe alkyle dérive d'un alcane par perte d'un hydrogène (méthyle, éthyle, propyle...). Pour un alcane ramifié : on repère la chaîne principale (la plus longue), on la numérote pour donner les plus petits indices aux ramifications, puis on nomme les ramifications par ordre alphabétique (préfixées de leur indice) suivies du nom de la chaîne principale.$$,
        'highlights', array[$$4 premiers alcanes : méthane, éthane, propane, butane$$, $$groupe alkyle = alcane − 1 H, suffixe « -yle »$$, $$règle : chaîne principale + numérotation + ramifications alphabétiques$$]::text[],
        'example', jsonb_build_object('statement', $$Nomme l'alcane CH3-CH(CH3)-CH2-CH3.$$, 'solution', $$2-méthylbutane (chaîne principale de 4 carbones = butane, avec un groupe méthyle en position 2).$$),
        'fixation', jsonb_build_object('question', $$Comment nomme-t-on un groupe alkyle à partir d'un alcane ?$$, 'solution', $$En reprenant le préfixe indiquant le nombre de carbones et en ajoutant le suffixe « -yle » (ex. méthane → méthyle).$$)
      ),
      jsonb_build_object(
        'heading', $$Cyclanes et isomérie de chaîne$$,
        'body', $$Les cyclanes (ou cycloalcanes) sont des hydrocarbures dont la chaîne carbonée se referme sur elle-même, avec pour formule générale CnH2n. Leur nom s'obtient en préfixant « cyclo » au nom de l'alcane linéaire correspondant (cyclopropane, cyclopentane...). Deux composés sont des isomères de chaîne s'ils ont la même formule brute mais des formules semi-développées différentes : par exemple, le n-butane et le 2-méthylpropane ont tous deux pour formule brute C4H10.$$,
        'highlights', array[$$cyclanes : formule CnH2n, préfixe « cyclo »$$, $$isomères de chaîne : même formule brute, squelette différent$$]::text[],
        'example', jsonb_build_object('statement', $$Donne les trois isomères de chaîne de formule brute C5H12.$$, 'solution', $$Le pentane (chaîne linéaire), le 2-méthylbutane, et le 2,2-diméthylpropane.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la formule générale des cyclanes ?$$, 'solution', $$CnH2n.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés chimiques des alcanes$$,
        'body', $$La combustion complète d'un alcane, en excès de dioxygène, produit du dioxyde de carbone et de l'eau selon l'équation générale : CnH2n+2 + (3n+1)/2 O2 → n CO2 + (n+1) H2O. En défaut de dioxygène, la combustion est incomplète et produit en plus du carbone et du monoxyde de carbone (CO), un gaz toxique. Les alcanes subissent aussi des réactions de substitution : la chloration du méthane, réaction photochimique (en présence de lumière), remplace progressivement les atomes d'hydrogène par des atomes de chlore, formant CH3Cl, CH2Cl2, CHCl3 (chloroforme) et CCl4, chacun ayant des usages industriels (réfrigération, solvants).$$,
        'highlights', array[$$combustion complète : CnH2n+2 + (3n+1)/2 O2 → n CO2 + (n+1) H2O$$, $$combustion incomplète (défaut de O2) → CO toxique + carbone$$, $$chloration du méthane : réaction photochimique par substitution$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les produits d'une combustion incomplète d'un alcane, en plus de l'eau et du dioxyde de carbone ?$$, 'solution', $$Le carbone (suie) et le monoxyde de carbone (CO), un gaz toxique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$La combustion complète de 1,16 g d'un alcane à chaîne ramifiée produit 3,52 g de dioxyde de carbone et 1,8 g d'eau. On donne : MC = 12 g/mol ; MH = 1 g/mol ; MO = 16 g/mol ; volume molaire Vm = 22,4 L/mol.$$,
      'questions', array[
        $$Écris l'équation-bilan générale de la combustion complète d'un alcane dans le dioxygène.$$,
        $$Détermine la formule brute de cet alcane.$$,
        $$Détermine le volume de dioxygène nécessaire à cette combustion complète.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment nomme-t-on l'alcane de formule CH3-CH2-CH2-CH2-CH2-CH2-CH3 ?$$,
      'hint', $$Il compte 7 atomes de carbone.$$,
      'expected', $$L'heptane.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qui distingue une chaîne carbonée « ramifiée » d'une chaîne « linéaire » ?$$,
      'hint', $$Cela concerne le nombre de carbones voisins d'un atome donné.$$,
      'expected', $$Dans une chaîne ramifiée, au moins un atome de carbone est lié à trois ou quatre autres atomes de carbone ; dans une chaîne linéaire, les carbones se suivent sans embranchement.$$
    ),
    jsonb_build_object(
      'question', $$Écris l'équation-bilan de la combustion complète du propane (C3H8).$$,
      'hint', $$Utilise la formule générale avec n=3.$$,
      'expected', $$C3H8 + 5 O2 → 3 CO2 + 4 H2O.$$
    ),
    jsonb_build_object(
      'question', $$Cite un usage industriel du trichlorométhane (chloroforme, CHCl3).$$,
      'hint', $$Il a longtemps eu un usage médical.$$,
      'expected', $$Autrefois utilisé comme anesthésique général en médecine, il sert aujourd'hui de solvant et d'intermédiaire de synthèse d'autres composés organiques.$$
    )
  ),
  now()
);
