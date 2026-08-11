-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3281: "LEÇON 2: STRUCTURE DE L'ATOME"
-- (https://lyc.ecole-ci.org/course/view.php?id=3281)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32623, redirecting
-- to pluginfile "2nd AC - C2 Structure de latome.pdf" (shared A/C document,
-- "2nde" header, 10 pages).
-- Rewritten/paraphrased from the source PDF (Thème 3, Leçon 2): the
-- constituents of the atom (electron, proton, neutron) with their symbol,
-- charge and mass, atomic number Z / mass number A / neutron count N,
-- nuclides and isotopes, the chemical element defined by Z, electric
-- neutrality of the atom, the approximate mass of an atom, the electronic
-- shells K/L/M/N and the 2n² filling rule with its filling order and the
-- calcium exception, and the Lewis representation of atoms. 100% original
-- wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-structure-atome',
  '2nde',
  'A',
  'physique-chimie',
  $$La structure de l'atome$$,
  2,
  '2nde-a-pc-element-chimique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de seconde entend son grand frère, en classe de terminale, affirmer que « tout atome possède une structure bien précise ». Intrigué, il en parle à ses camarades : de quoi un atome est-il vraiment fait ? Comment savoir combien il contient de particules, et comment représenter simplement la façon dont ses électrons se répartissent autour du noyau ? La classe décide de mener l'enquête avec l'aide du professeur de Physique-Chimie.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les particules qui constituent l'atome$$,
        'body', $$Un atome est formé d'un noyau central autour duquel gravitent une ou plusieurs particules très légères et chargées négativement, les électrons, de symbole e-. Chaque électron porte une charge négative égale à l'opposé de la charge élémentaire, notée -e, avec e = 1,6×10⁻¹⁹ C, pour une masse d'environ 9,1×10⁻³¹ kg. Le noyau, lui, regroupe des particules appelées nucléons, de deux sortes : les protons, chargés positivement (+e), et les neutrons, électriquement neutres. Protons et neutrons ont une masse quasiment identique, environ 1,67×10⁻²⁷ kg, très largement supérieure à celle de l'électron.$$,
        'highlights', array[$$électron$$, $$proton$$, $$neutron$$, $$charge élémentaire$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Particule$$, $$Symbole$$, $$Charge$$, $$Masse (kg)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Électron$$, $$e-$$, $$-e ≈ -1,6×10⁻¹⁹ C$$, $$≈ 9,1×10⁻³¹$$),
            jsonb_build_array($$Proton$$, $$p$$, $$+e ≈ +1,6×10⁻¹⁹ C$$, $$≈ 1,67×10⁻²⁷$$),
            jsonb_build_array($$Neutron$$, $$n$$, $$0$$, $$≈ 1,67×10⁻²⁷$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux sortes de nucléons présentes dans le noyau d'un atome ?$$, 'solution', $$Les protons (chargés +e) et les neutrons (électriquement neutres).$$)
      ),
      jsonb_build_object(
        'heading', $$Numéro atomique, nombre de masse et isotopes$$,
        'body', $$Le numéro atomique Z d'un atome correspond au nombre de protons de son noyau. Le nombre total de nucléons (protons + neutrons) est appelé nombre de masse et se note A ; le nombre de neutrons N se déduit alors par la relation A = Z + N, soit N = A - Z. L'ensemble des atomes dont le noyau possède le même couple (Z, A) constitue un nucléide, représenté par le symbole A/Z X, X étant le symbole de l'élément chimique. Deux nucléides sont dits isotopes lorsqu'ils partagent le même numéro atomique Z mais possèdent des nombres de masse A différents : c'est le cas de l'oxygène 16 et de l'oxygène 18, ou encore du carbone 12, du carbone 13 et du carbone 14, qui ne diffèrent que par leur nombre de neutrons.$$,
        'highlights', array[$$numéro atomique Z$$, $$nombre de masse A$$, $$isotopes$$]::text[],
        'example', jsonb_build_object('statement', $$L'uranium 235 et l'uranium 238 ont tous deux 92 protons, mais respectivement 143 et 146 neutrons. Que peut-on en conclure ?$$, 'solution', $$Ce sont deux isotopes de l'élément uranium : même numéro atomique Z = 92, mais des nombres de masse différents (A = 235 et A = 238) car ils n'ont pas le même nombre de neutrons.$$),
        'fixation', jsonb_build_object('question', $$Un noyau contient 17 protons et 18 neutrons. Donne son numéro atomique Z et son nombre de masse A.$$, 'solution', $$Z = 17 (nombre de protons) et A = Z + N = 17 + 18 = 35.$$)
      ),
      jsonb_build_object(
        'heading', $$L'élément chimique et la neutralité électrique de l'atome$$,
        'body', $$L'ensemble des nucléides qui partagent le même numéro atomique Z forme un même élément chimique : l'élément chimique est donc entièrement caractérisé par la valeur de Z (par exemple Z = 1 pour l'hydrogène, Z = 7 pour l'azote, Z = 17 pour le chlore, Z = 29 pour le cuivre). Par ailleurs, un atome est toujours électriquement neutre dans son état normal : il compte exactement autant de charges positives dans son noyau (les Z protons) que de charges négatives portées par ses électrons. Un atome dont le noyau contient Z protons possède donc également Z électrons. Enfin, comme la masse des nucléons est environ 1836 fois plus grande que celle d'un électron, la masse d'un atome est presque entièrement concentrée dans son noyau, et sa valeur approchée est donnée par m(atome) ≈ A × m(proton).$$,
        'highlights', array[$$électroneutralité$$, $$Z électrons$$]::text[],
        'property', jsonb_build_object('label', $$Neutralité électrique$$, 'text', $$Un atome possède autant d'électrons (charge -e chacun) que de protons (charge +e chacun) dans son noyau : il est donc électriquement neutre, et sa masse est approximativement égale à A fois la masse d'un proton.$$),
        'fixation', jsonb_build_object('question', $$Un atome de calcium a pour numéro atomique Z = 20. Combien possède-t-il d'électrons ?$$, 'solution', $$20 électrons, puisque l'atome est électriquement neutre et compte autant d'électrons que de protons.$$)
      ),
      jsonb_build_object(
        'heading', $$Répartition des électrons sur les couches K, L, M, N$$,
        'body', $$Les électrons d'un atome ne gravitent pas n'importe comment : ils se répartissent sur des couches électroniques successives, désignées par des lettres majuscules en partant de la plus proche du noyau : K (n=1), L (n=2), M (n=3), N (n=4). Une première règle fixe le nombre maximal d'électrons que peut contenir une couche d'ordre n : il vaut 2n², soit 2 pour K, 8 pour L, 18 pour M et 32 pour N. Une couche qui atteint ce maximum est dite saturée. Une seconde règle fixe l'ordre de remplissage : les couches se remplissent successivement dans l'ordre K, puis L, puis M, puis N, chaque couche devant se remplir avant que la suivante ne commence -- sauf exception à partir de Z ≥ 19, non étudiée au niveau secondaire (par exemple le potassium Z=19 et le calcium Z=20, dont la couche M s'arrête à 8 électrons alors que la couche N commence déjà). La dernière couche occupée par des électrons, appelée couche externe ou couche de valence, joue un rôle essentiel car ce sont ses électrons qui interviennent dans les liaisons chimiques.$$,
        'highlights', array[$$couches K, L, M, N$$, $$règle du 2n²$$, $$couche externe (valence)$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Couche$$, $$Ordre n$$, $$Nombre maximal d'électrons (2n²)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$K$$, $$1$$, $$2$$),
            jsonb_build_array($$L$$, $$2$$, $$8$$),
            jsonb_build_array($$M$$, $$3$$, $$18$$),
            jsonb_build_array($$N$$, $$4$$, $$32$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Détermine la formule électronique de l'atome de magnésium (Z = 12).$$, 'solution', $$On remplit dans l'ordre K puis L puis M : K²L⁸M², car 2 + 8 + 2 = 12 électrons au total, conformément à Z = 12.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la formule électronique de l'atome d'hélium (Z = 2) ?$$, 'solution', $$K², puisque ses 2 électrons occupent entièrement, mais seulement, la couche K.$$)
      ),
      jsonb_build_object(
        'heading', $$La représentation de Lewis des atomes$$,
        'body', $$La représentation de Lewis d'un atome a pour but de schématiser la répartition des électrons de la couche externe (couche de valence), les seuls impliqués dans les futures liaisons chimiques. On la construit en plaçant autour du symbole de l'élément soit des points, un par électron célibataire (non apparié), soit des tirets, un par doublet de deux électrons associés. Pour l'aluminium (Z=13, formule K²L⁸M³), la couche externe M comporte trois électrons célibataires : on place donc trois points autour du symbole Al. Pour l'oxygène (Z=8, formule K²L⁶), la couche externe L comporte six électrons, soit deux électrons célibataires et deux doublets : on représente alors deux points isolés et deux tirets (ou quatre points groupés deux par deux) autour du symbole O.$$,
        'highlights', array[$$représentation de Lewis$$, $$électrons célibataires$$, $$doublets$$]::text[],
        'fixation', jsonb_build_object('question', $$Que représente un tiret dans un schéma de Lewis, à la différence d'un point ?$$, 'solution', $$Un tiret représente un doublet, c'est-à-dire deux électrons associés, alors qu'un point représente un seul électron célibataire (non apparié).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$On donne les atomes suivants : carbone 12 (Z=6), chlore 35 (Z=17), hélium 4 (Z=2) et calcium 40 (Z=20). Un élève doit déterminer leur structure complète pour un exposé en classe.$$,
      'questions', array[
        $$Pour chacun de ces atomes, indique le nombre de protons, de neutrons et d'électrons.$$,
        $$Donne la formule électronique (répartition K, L, M, N) de chacun de ces atomes.$$,
        $$Explique pourquoi le calcium (Z=20) constitue une exception par rapport à la règle habituelle de remplissage des couches.$$,
        $$Réalise la représentation de Lewis de l'atome de chlore (Z=17, couche externe M⁷).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la charge électrique d'un proton ?$$,
      'hint', $$C'est l'opposé de la charge de l'électron.$$,
      'expected', $$+e, soit environ +1,6×10⁻¹⁹ C.$$
    ),
    jsonb_build_object(
      'question', $$Un atome a pour numéro atomique Z=11 et pour nombre de masse A=23. Combien possède-t-il de neutrons ?$$,
      'hint', $$Utilise la relation N = A - Z.$$,
      'expected', $$N = 23 - 11 = 12 neutrons.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le nombre maximal d'électrons que peut contenir la couche M ?$$,
      'hint', $$Applique la règle du 2n² avec n=3.$$,
      'expected', $$2×3² = 18 électrons.$$
    ),
    jsonb_build_object(
      'question', $$Donne la formule électronique de l'atome de carbone (Z=6).$$,
      'hint', $$Remplis d'abord la couche K, puis la couche L.$$,
      'expected', $$K²L⁴.$$
    )
  ),
  now()
);
