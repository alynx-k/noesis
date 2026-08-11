-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3288: "LEÇON 5: MOLE ET GRANDEURS MOLAIRES"
-- (https://lyc.ecole-ci.org/course/view.php?id=3288)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32695, redirecting
-- to pluginfile "2nd AC - C5 Mole et grandeurs molaires.pdf" (8 pages).
-- Rewritten/paraphrased from the source PDF (Thème 3, Leçon 5): the
-- introductory approach to the mole (counting very large numbers of
-- particles), the definition of the mole and Avogadro's constant NA =
-- 6.02x10^23 mol^-1, molar mass (atomic, molecular, ionic) with worked
-- examples (ethanol C2H6O, CO3^2-, Al(OH)4^-, NaCl), the relation n = m/M,
-- and molar volume (definition, Avogadro-Ampère law, normal conditions Vm =
-- 22.4 L/mol at 0°C and 10^5 Pa, ordinary conditions Vm = 24 L/mol at 20°C,
-- relation n = V/Vm for gases only). 100% original wording; no sentence
-- copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-mole-grandeurs-molaires',
  '2nde',
  'A',
  'physique-chimie',
  $$La mole et les grandeurs molaires$$,
  5,
  '2nde-a-pc-ions-molecules',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pendant la récréation, des élèves de seconde débattent : « Combien de grains de riz peut contenir un sac de 50 kg ? » L'un dit des milliers, l'autre des millions. Un professeur de Physique-Chimie qui passe par là leur explique qu'en chimie, on rencontre exactement ce genre de problème avec les atomes et les molécules -- sauf que les nombres en jeu sont bien plus grands encore -- et que l'on utilise, pour cela, une unité adaptée : la mole.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Pourquoi une nouvelle unité : la mole$$,
        'body', $$Une petite quantité de matière contient déjà un nombre astronomique de particules : 27 mL d'eau liquide renferment environ 9,03×10²³ molécules d'eau, et 135 g d'aluminium contiennent environ 3,01×10²⁴ atomes. Ces nombres sont si grands que l'esprit humain a du mal à les manier directement. Pour plus de commodité, les chimistes ont défini un « paquet » de référence contenant toujours 6,02×10²³ particules, tout comme on compte des œufs par douzaines : ce paquet est la mole.$$,
        'highlights', array[$$quantité de matière$$, $$paquet de particules$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi a-t-on inventé la mole comme unité de quantité de matière ?$$, 'solution', $$Parce que le nombre de particules (atomes, molécules) présentes même dans de petites quantités de matière est extrêmement grand, et qu'il est plus commode de les compter par « paquets » de taille fixe.$$)
      ),
      jsonb_build_object(
        'heading', $$Définition de la mole et constante d'Avogadro$$,
        'body', $$La mole est l'unité internationale de quantité de matière, de symbole mol. Elle est définie comme la quantité de matière d'un système contenant autant d'entités élémentaires qu'il y a d'atomes dans 12 g de carbone 12. Lorsqu'on utilise la mole, il est indispensable de préciser la nature de l'entité élémentaire comptée : atomes, molécules, ions, électrons, etc. Le nombre d'entités élémentaires contenues dans une mole est une constante universelle, appelée nombre ou constante d'Avogadro, notée NA, dont la valeur approchée est NA = 6,02×10²³ mol⁻¹. Pour une quantité de matière n (en mol) d'une espèce chimique donnée, le nombre N d'entités élémentaires correspondant se calcule par la relation N = n × NA.$$,
        'highlights', array[$$mole (mol)$$, $$constante d'Avogadro NA$$, $$N = n × NA$$]::text[],
        'property', jsonb_build_object('label', $$Constante d'Avogadro$$, 'text', $$NA ≈ 6,02×10²³ mol⁻¹ ; pour une quantité de matière n, le nombre d'entités élémentaires est N = n × NA.$$),
        'example', jsonb_build_object('statement', $$Un clou en fer contient N = 10²⁴ atomes. Quelle quantité de matière n cela représente-t-il ?$$, 'solution', $$n = N / NA = 10²⁴ / 6,02×10²³ ≈ 1,66 mol d'atomes de fer.$$),
        'fixation', jsonb_build_object('question', $$Combien d'entités élémentaires contient une mole, quelle que soit l'entité considérée ?$$, 'solution', $$Environ 6,02×10²³ entités élémentaires (c'est la constante d'Avogadro).$$)
      ),
      jsonb_build_object(
        'heading', $$Masse molaire : atomique, moléculaire, ionique$$,
        'body', $$La masse molaire M d'une espèce chimique est la masse d'une mole d'entités de cette espèce ; elle s'exprime en grammes par mole (g/mol ou g.mol⁻¹). La masse molaire atomique est la masse d'une mole d'atomes d'un élément donné ; ces valeurs, comme MC = 12 g/mol, MH = 1 g/mol ou MO = 16 g/mol, figurent dans le tableau de classification périodique. La masse molaire moléculaire, elle, est la masse d'une mole de molécules d'un corps ; elle se calcule en additionnant les masses molaires atomiques de tous les atomes qui composent la molécule (par exemple, pour l'éthanol C2H6O : M = 2×MC + 6×MH + 1×MO = 2×12 + 6×1 + 16 = 46 g/mol). La masse molaire ionique, enfin, est la masse d'une mole d'ions ; elle se calcule de la même façon que pour une molécule, sans tenir compte de la charge électrique car la masse des électrons perdus ou gagnés est négligeable (par exemple M(Cl⁻) = M(Cl) = 35,5 g/mol, ou pour l'ion carbonate M(CO3²⁻) = MC + 3×MO = 12 + 48 = 60 g/mol).$$,
        'highlights', array[$$masse molaire atomique$$, $$masse molaire moléculaire$$, $$masse molaire ionique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Espèce$$, $$Calcul$$, $$Masse molaire$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Éthanol C2H6O$$, $$2×12 + 6×1 + 1×16$$, $$46 g/mol$$),
            jsonb_build_array($$Ion carbonate CO3²⁻$$, $$1×12 + 3×16$$, $$60 g/mol$$),
            jsonb_build_array($$Chlorure de sodium NaCl$$, $$1×23 + 1×35,5$$, $$58,5 g/mol$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi ne tient-on pas compte des charges électriques dans le calcul de la masse molaire d'un ion ?$$, 'solution', $$Parce que la masse des électrons perdus ou gagnés lors de la formation de l'ion est négligeable devant la masse totale de l'espèce.$$)
      ),
      jsonb_build_object(
        'heading', $$Relation entre quantité de matière et masse$$,
        'body', $$La quantité de matière n (en mol) contenue dans une masse m (en grammes) d'une substance de masse molaire M (en g/mol) est donnée par la relation n = m / M. Cette relation permet, à partir d'une pesée, de déterminer directement le nombre de moles d'une substance, sans avoir à compter ses particules une à une.$$,
        'highlights', array[$$n = m / M$$]::text[],
        'example', jsonb_build_object('statement', $$Calcule la quantité de matière de dioxyde de carbone CO2 contenue dans 32 g de ce gaz, sachant que sa masse molaire moléculaire vaut 44 g/mol.$$, 'solution', $$n = m / M = 32 / 44 ≈ 0,73 mol.$$),
        'fixation', jsonb_build_object('question', $$Quelle formule permet de calculer la quantité de matière n à partir d'une masse m et d'une masse molaire M ?$$, 'solution', $$n = m / M.$$)
      ),
      jsonb_build_object(
        'heading', $$Le volume molaire des gaz$$,
        'body', $$Le volume molaire Vm d'un gaz est le volume occupé par une mole de ce gaz ; il s'exprime en litres par mole (L/mol). D'après la loi d'Avogadro-Ampère, dans les mêmes conditions de température et de pression, tous les gaz ont le même volume molaire, quelle que soit leur nature. Ce volume molaire dépend toutefois de la température et de la pression : dans les conditions normales de température et de pression (CNTP : T = 0°C et P = 10⁵ Pa), il est appelé volume molaire normal et vaut Vm = 22,4 L/mol ; dans les conditions ordinaires (T = 20°C, pression atmosphérique normale), il vaut Vm = 24 L/mol. La quantité de matière n contenue dans un volume V de gaz, dans des conditions où le volume molaire vaut Vm, est donnée par n = V / Vm -- une relation qui n'est valable que pour les gaz.$$,
        'highlights', array[$$volume molaire$$, $$loi d'Avogadro-Ampère$$, $$n = V / Vm$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Conditions$$, $$Volume molaire Vm$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$CNTP (0°C, 10⁵ Pa)$$, $$22,4 L/mol$$),
            jsonb_build_array($$Conditions ordinaires (20°C, pression atmosphérique)$$, $$24 L/mol$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Au cours de l'électrolyse de l'eau, on recueille à l'anode un volume V = 44,8 cm³ de dioxygène dans les CNTP. Calcule la quantité de matière de dioxygène recueilli.$$, 'solution', $$n = V / Vm = 0,0448 L / 22,4 L.mol⁻¹ = 2×10⁻³ mol de dioxygène.$$),
        'fixation', jsonb_build_object('question', $$Que dit la loi d'Avogadro-Ampère ?$$, 'solution', $$Dans les mêmes conditions de température et de pression, tous les gaz occupent le même volume molaire.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un technicien de laboratoire dispose de 23 g de sodium (masse molaire 23 g/mol) et souhaite aussi produire un volume de dihydrogène dans les CNTP. Il te demande de l'aider à faire les calculs de quantité de matière nécessaires.$$,
      'questions', array[
        $$Donne la définition de la mole et de la constante d'Avogadro.$$,
        $$Calcule la quantité de matière de sodium contenue dans les 23 g disponibles.$$,
        $$Calcule le nombre d'atomes de sodium correspondant à cette quantité de matière.$$,
        $$Si l'on recueille 4,48 L de dihydrogène dans les CNTP, quelle quantité de matière cela représente-t-il ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la valeur approchée de la constante d'Avogadro ?$$,
      'hint', $$C'est le nombre d'entités élémentaires dans une mole.$$,
      'expected', $$NA ≈ 6,02×10²³ mol⁻¹.$$
    ),
    jsonb_build_object(
      'question', $$Quelle formule relie la quantité de matière n à la masse m et à la masse molaire M ?$$,
      'hint', $$C'est une simple division.$$,
      'expected', $$n = m / M.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le volume molaire d'un gaz dans les conditions normales de température et de pression (CNTP) ?$$,
      'hint', $$C'est une valeur à connaître par cœur : environ 22 litres.$$,
      'expected', $$Vm = 22,4 L/mol.$$
    ),
    jsonb_build_object(
      'question', $$Calcule la masse molaire moléculaire de l'eau H2O (MH = 1 g/mol, MO = 16 g/mol).$$,
      'hint', $$Additionne les masses molaires atomiques de tous les atomes de la molécule.$$,
      'expected', $$M(H2O) = 2×1 + 16 = 18 g/mol.$$
    )
  ),
  now()
);
