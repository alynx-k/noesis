-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3287: "LEÇON 4: IONS ET MOLÉCULES"
-- (https://lyc.ecole-ci.org/course/view.php?id=3287)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32683, redirecting
-- to pluginfile "2nd AC - C4 Ions et molécules.pdf" (shared A/C document,
-- "2nde A-C" header, 12 pages).
-- Rewritten/paraphrased from the source PDF (Thème 3, Leçon 4): the octet
-- (and duet) rule, the formation of monoatomic cations and anions with
-- worked examples (Na, Ca, Cl, O), polyatomic ions (NH4+, SO4^2-, OH-,
-- H3O+...), ionic compounds and their statistical formula (electroneutrality,
-- CuSO4/FeCl2/KNO3/(NH4)2SO4/Fe2O3 examples), and the formation of molecules
-- by covalent bonding (valence of H, O, N, C; Lewis representation of HCl
-- with bonding and lone doublets). 100% original wording; no sentence
-- copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-ions-molecules',
  '2nde',
  'A',
  'physique-chimie',
  $$Ions et molécules$$,
  4,
  '2nde-a-pc-classification-periodique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le grand frère d'un élève de seconde, déjà en classe de quatrième, lui pose deux questions qui le laissent perplexe : « Comment les atomes deviennent-ils des ions ? » et « Comment se forment les molécules ? ». Pour y répondre sérieusement, la classe décide, avec le professeur, d'étudier comment les atomes évoluent vers des ions stables et comment ils s'associent pour former des molécules.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La règle de l'octet (et du duet)$$,
        'body', $$Les gaz rares sont très peu réactifs : cette stabilité chimique remarquable vient du fait que leur couche électronique externe est saturée, avec huit électrons (deux seulement pour l'hélium). Au cours d'une réaction chimique, les autres atomes ont tendance à évoluer vers cette même stabilité, en acquérant la structure électronique du gaz rare le plus proche d'eux dans la classification périodique, soit huit électrons sur leur couche externe : c'est la règle de l'octet. Pour les atomes très légers, proches de l'hélium dans le tableau (hydrogène, lithium, béryllium, bore), la structure stable visée ne compte que deux électrons externes : on parle alors de règle du duet. C'est en formant des ions ou des molécules que les atomes atteignent cette structure stable.$$,
        'highlights', array[$$règle de l'octet$$, $$règle du duet$$, $$structure stable du gaz rare le plus proche$$]::text[],
        'property', jsonb_build_object('label', $$Règle de l'octet$$, 'text', $$Au cours d'une transformation chimique, un atome tend à acquérir 8 électrons sur sa couche externe (2 pour les atomes voisins de l'hélium) en formant des ions ou des molécules, afin d'obtenir la structure électronique stable du gaz rare le plus proche.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que l'hydrogène et le lithium obéissent à une règle du duet plutôt qu'à la règle de l'octet ?$$, 'solution', $$Parce que le gaz rare le plus proche d'eux dans la classification est l'hélium, dont la structure stable ne compte que 2 électrons (K²) et non 8.$$)
      ),
      jsonb_build_object(
        'heading', $$Formation des ions monoatomiques : cations et anions$$,
        'body', $$Un ion est un édifice chargé électriquement, obtenu à partir d'un ou plusieurs atomes. On distingue les ions positifs, ou cations, et les ions négatifs, ou anions. Un cation monoatomique se forme lorsqu'un atome cède un ou plusieurs électrons pour atteindre la structure du gaz rare le plus proche : X → Xⁿ⁺ + n e⁻. C'est le cas des éléments de la première colonne, qui perdent un électron (le sodium Na, Z=11, K²L⁸M¹, donne l'ion Na⁺ de structure K²L⁸, identique à celle du néon), ou des éléments de la deuxième colonne, qui en perdent deux (le calcium Ca, Z=20, K²L⁸M⁸N², donne l'ion Ca²⁺ de structure K²L⁸M⁸, identique à celle de l'argon). D'autres cations de charge +2e se forment également à partir d'éléments d'autres colonnes, comme le cuivre (Cu²⁺), le zinc (Zn²⁺), le fer (Fe²⁺) ou le manganèse (Mn²⁺). À l'inverse, un anion monoatomique se forme lorsqu'un atome capte un ou plusieurs électrons : X + n e⁻ → Xⁿ⁻. C'est le cas des halogènes, qui captent un électron (le chlore Cl, Z=17, K²L⁸M⁷, donne l'ion chlorure Cl⁻ de structure K²L⁸M⁸, identique à celle de l'argon), ou des éléments de la colonne de l'oxygène, qui en captent deux (l'oxygène O, Z=8, K²L⁶, donne l'ion oxyde O²⁻ de structure K²L⁸, identique à celle du néon).$$,
        'highlights', array[$$cation$$, $$anion$$, $$Na⁺, Ca²⁺, Cl⁻, O²⁻$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Atome$$, $$Formule électronique$$, $$Ion formé$$, $$Formule électronique de l'ion$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Lithium Li (Z=3)$$, $$K²L¹$$, $$Li⁺$$, $$K²$$),
            jsonb_build_array($$Sodium Na (Z=11)$$, $$K²L⁸M¹$$, $$Na⁺$$, $$K²L⁸$$),
            jsonb_build_array($$Magnésium Mg (Z=12)$$, $$K²L⁸M²$$, $$Mg²⁺$$, $$K²L⁸$$),
            jsonb_build_array($$Chlore Cl (Z=17)$$, $$K²L⁸M⁷$$, $$Cl⁻$$, $$K²L⁸M⁸$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Écris l'équation de formation de l'ion oxyde à partir de l'atome d'oxygène (Z=8, K²L⁶).$$, 'solution', $$L'atome d'oxygène capte deux électrons pour atteindre la structure K²L⁸ du néon : O + 2 e⁻ → O²⁻.$$),
        'fixation', jsonb_build_object('question', $$Quel ion forme un atome de la première colonne de la classification, et avec quelle charge ?$$, 'solution', $$Il forme un cation de charge +e (il perd un seul électron), comme Na⁺ ou Li⁺.$$)
      ),
      jsonb_build_object(
        'heading', $$Ions polyatomiques et composés ioniques$$,
        'body', $$Certains ions ne proviennent pas d'un seul atome mais d'un assemblage de plusieurs atomes présentant globalement un déficit ou un excédent d'électrons : ce sont les ions polyatomiques. On en rencontre couramment plusieurs en chimie : l'ion ammonium NH4⁺, l'ion sulfate SO4²⁻, l'ion nitrate NO3⁻, l'ion carbonate CO3²⁻, l'ion permanganate MnO4⁻, l'ion hydronium H3O⁺ et l'ion hydroxyde OH⁻. Un composé ionique, quant à lui, est formé d'un seul type de cation et d'un seul type d'anion, combinés de sorte que l'ensemble soit électriquement neutre : il porte autant de charges positives que de charges négatives. On lui attribue un nom construit à partir de ses ions, et une formule statistique qui traduit cette électroneutralité en indiquant le plus petit nombre entier de chaque ion nécessaire pour équilibrer les charges.$$,
        'highlights', array[$$ion polyatomique$$, $$composé ionique$$, $$formule statistique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Ions constituants$$, $$Formule statistique$$, $$Nom du composé$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Cu²⁺ ; SO4²⁻$$, $$CuSO4$$, $$Sulfate de cuivre$$),
            jsonb_build_array($$Fe²⁺ ; Cl⁻$$, $$FeCl2$$, $$Chlorure de fer$$),
            jsonb_build_array($$K⁺ ; NO3⁻$$, $$KNO3$$, $$Nitrate de potassium$$),
            jsonb_build_array($$NH4⁺ ; SO4²⁻$$, $$(NH4)2SO4$$, $$Sulfate d'ammonium$$),
            jsonb_build_array($$Fe³⁺ ; O²⁻$$, $$Fe2O3$$, $$Trioxyde de fer (oxyde de fer III)$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Détermine la formule statistique du composé ionique formé par les ions Fe²⁺ et Cl⁻.$$, 'solution', $$Pour équilibrer une charge +2 avec des charges -1, il faut deux ions Cl⁻ pour un ion Fe²⁺ : la formule statistique est FeCl2.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le sulfate d'ammonium a-t-il pour formule (NH4)2SO4 et non NH4SO4 ?$$, 'solution', $$Parce que l'ion sulfate porte deux charges négatives (SO4²⁻) alors que l'ion ammonium n'en porte qu'une positive (NH4⁺) : il faut donc deux ions ammonium pour équilibrer un seul ion sulfate.$$)
      ),
      jsonb_build_object(
        'heading', $$Formation des molécules par liaison covalente$$,
        'body', $$Une molécule est une entité chimique électriquement neutre, formée d'un nombre limité d'atomes liés entre eux par des liaisons de covalence. Une liaison covalente résulte de la mise en commun, par deux atomes, d'une paire d'électrons célibataires appelée doublet de liaison ; chaque atome apporte un électron à ce doublet partagé, ce qui lui permet lui aussi de compléter sa couche externe conformément à la règle de l'octet ou du duet. Le nombre de doublets qu'un atome peut partager avec ses voisins est appelé sa valence : l'hydrogène est monovalent (valence 1), l'oxygène est divalent (valence 2), l'azote est trivalent (valence 3) et le carbone est tétravalent (valence 4). Une liaison est dite simple, double ou triple selon que les deux atomes mettent en commun un, deux ou trois doublets. Les doublets d'électrons qui n'interviennent pas dans une liaison restent sur l'atome : on les appelle doublets non liants (ou libres). La formule d'une molécule s'écrit en juxtaposant les symboles de ses éléments, avec en indice le nombre d'atomes de chacun : par exemple H2O pour l'eau, NH3 pour l'ammoniac, CH4 pour le méthane ou CO2 pour le dioxyde de carbone.$$,
        'highlights', array[$$liaison covalente$$, $$doublet de liaison$$, $$valence$$, $$doublet non liant$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la molécule de chlorure d'hydrogène HCl, l'hydrogène (valence 1) et le chlore (valence 1, couche externe M⁷) forment une liaison. Combien de doublets non liants porte l'atome de chlore dans cette molécule ?$$, 'solution', $$Le chlore a 7 électrons externes ; un seul électron célibataire participe à la liaison avec l'hydrogène, les 6 électrons restants forment 3 doublets non liants (libres) autour du chlore.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la valence de l'atome de carbone, et que signifie-t-elle ?$$, 'solution', $$Le carbone est tétravalent (valence 4) : il peut partager 4 doublets de liaison avec ses atomes voisins.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un exercice de synthèse propose les espèces suivantes : Fe³⁺, O²⁻, NH4⁺, SO4²⁻ et la molécule d'ammoniac NH3. Un élève doit mobiliser tout ce qui a été vu sur les ions et les molécules pour les analyser.$$,
      'questions', array[
        $$Rappelle la règle de l'octet et explique pourquoi les atomes tendent à former des ions ou des molécules.$$,
        $$Détermine la formule statistique du composé ionique formé par Fe³⁺ et O²⁻.$$,
        $$Détermine la formule statistique du composé ionique formé par NH4⁺ et SO4²⁻.$$,
        $$Sachant que l'azote est trivalent et l'hydrogène monovalent, explique comment se forme la molécule d'ammoniac NH3 par liaisons covalentes.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'appelle-t-on un cation ?$$,
      'hint', $$C'est un ion chargé positivement.$$,
      'expected', $$Un ion positif, formé lorsqu'un atome (ou un groupe d'atomes) perd un ou plusieurs électrons.$$
    ),
    jsonb_build_object(
      'question', $$L'atome de sodium (Z=11, K²L⁸M¹) forme quel ion, et pourquoi ?$$,
      'hint', $$Il perd un électron pour atteindre la structure du néon.$$,
      'expected', $$Il forme l'ion Na⁺ (perte d'un électron), de structure K²L⁸, identique à celle du néon.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la formule statistique du composé ionique formé par les ions K⁺ et NO3⁻ ?$$,
      'hint', $$Une charge +1 et une charge -1 s'équilibrent avec un ion de chaque.$$,
      'expected', $$KNO3 (nitrate de potassium).$$
    ),
    jsonb_build_object(
      'question', $$Combien de doublets de liaison l'atome d'oxygène (divalent) peut-il partager avec ses voisins ?$$,
      'hint', $$Sa valence donne directement la réponse.$$,
      'expected', $$Deux doublets de liaison, puisque l'oxygène a une valence égale à 2.$$
    )
  ),
  now()
);
