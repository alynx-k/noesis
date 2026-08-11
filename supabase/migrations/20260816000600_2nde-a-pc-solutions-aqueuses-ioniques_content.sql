-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3291: "LEÇON 7: SOLUTIONS AQUEUSES IONIQUES"
-- (https://lyc.ecole-ci.org/course/view.php?id=3291)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32731, redirecting
-- to pluginfile "2nd AC - C8 Solutions aqueuses ioniques.pdf" (internal
-- numbering "C8" in the PDF filename, but this is genuinely lesson 7 of the
-- course listing / category page; shared A/C document, "2nde A-C" header,
-- 10 pages, Thème 4: Les ions en solution).
-- Rewritten/paraphrased from the source PDF: the definition of an aqueous
-- ionic solution and why it conducts electricity, the two-step dissolution
-- model (dislocation then hydration/solvation) with the endothermic /
-- athermic / exothermic classification depending on Ed vs Eh (examples
-- NH4Cl, NaCl/CuSO4, NaOH), molar and mass concentration (C=n/Vs, C=m/Vs,
-- relation C=M×C), electroneutrality of an ionic solution, saturation and
-- solubility of a solute, and the electrolysis of an aqueous sodium
-- chloride solution (half-equations at the anode and cathode, overall
-- equation). 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-solutions-aqueuses-ioniques',
  '2nde',
  'A',
  'physique-chimie',
  $$Les solutions aqueuses ioniques$$,
  7,
  '2nde-a-pc-equation-bilan-reaction',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deux élèves de seconde discutent des solutions aqueuses ioniques. Ils sont d'accord sur un point : ces solutions s'obtiennent en dissolvant un composé ionique dans l'eau. Mais ils se disputent sur un second point -- l'un affirme qu'elles conduisent le courant électrique, l'autre soutient le contraire. Pour trancher, ils demandent l'aide de leur professeur de Physique-Chimie, qui propose d'étudier ensemble le phénomène de dissolution, la solubilité, les concentrations, et même l'électrolyse d'une telle solution.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Solution aqueuse ionique et conduction du courant$$,
        'body', $$Une solution s'obtient en dissolvant un soluté dans un solvant ; lorsque le solvant est l'eau, la solution est dite aqueuse. Une solution aqueuse ionique s'obtient précisément en dissolvant un composé ionique dans l'eau -- ce composé dissous est le soluté, et l'opération de disparition du soluté dans l'eau est la dissolution. Contrairement à ce que pourrait penser un élève non averti, une solution aqueuse ionique conduit bel et bien le courant électrique, car elle contient des ions mobiles capables de transporter les charges électriques dans le liquide.$$,
        'highlights', array[$$solution aqueuse ionique$$, $$conduction du courant$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi une solution aqueuse ionique conduit-elle le courant électrique ?$$, 'solution', $$Parce qu'elle contient des ions, chargés électriquement et mobiles dans le liquide, qui assurent le transport du courant.$$)
      ),
      jsonb_build_object(
        'heading', $$Le mécanisme de dissolution et son effet thermique$$,
        'body', $$La dissolution d'un composé ionique dans l'eau se déroule en deux étapes fictives. D'abord, la dislocation du cristal : les liaisons électrostatiques qui maintenaient les ions ensemble se rompent, et les ions se dispersent dans le liquide -- ce phénomène nécessite un apport d'énergie, notée Ed, absorbée par le système. Ensuite, l'hydratation (ou solvatation) des ions : chaque ion dispersé s'entoure d'une couronne de molécules d'eau ; cette étape s'accompagne au contraire d'un dégagement de chaleur, une énergie notée Eh. Le bilan thermique global de la dissolution dépend de la comparaison entre ces deux énergies : si Ed > Eh, la dissolution est endothermique et la température du milieu diminue (cas de NH4Cl) ; si Ed = Eh, elle est athermique et la température reste constante (cas de NaCl ou de CuSO4) ; si Ed < Eh, elle est exothermique et la température du milieu augmente (cas de NaOH).$$,
        'highlights', array[$$dislocation$$, $$hydratation (solvatation)$$, $$endothermique / athermique / exothermique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Comparaison des énergies$$, $$Type de dissolution$$, $$Effet sur la température$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ed > Eh$$, $$Endothermique$$, $$Diminution$$, $$NH4Cl$$),
            jsonb_build_array($$Ed = Eh$$, $$Athermique$$, $$Constante$$, $$NaCl, CuSO4$$),
            jsonb_build_array($$Ed < Eh$$, $$Exothermique$$, $$Augmentation$$, $$NaOH$$)
          )
        ),
        'example', jsonb_build_object('statement', $$En dissolvant du chlorure d'ammonium NH4Cl dans l'eau, on observe une baisse de la température du milieu. Que peut-on en déduire sur l'énergie de dislocation Ed comparée à l'énergie d'hydratation Eh ?$$, 'solution', $$La dissolution est endothermique (baisse de température), donc Ed > Eh : l'énergie absorbée lors de la dislocation du cristal est supérieure à celle libérée lors de l'hydratation des ions.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux étapes du mécanisme de dissolution d'un composé ionique dans l'eau ?$$, 'solution', $$La dislocation du cristal (rupture des liaisons électrostatiques, absorption d'énergie) suivie de l'hydratation ou solvatation des ions (dégagement de chaleur).$$)
      ),
      jsonb_build_object(
        'heading', $$Concentrations d'une solution aqueuse ionique$$,
        'body', $$Deux grandeurs permettent de caractériser la quantité de soluté dissous dans une solution. La concentration molaire volumique C d'une solution est la quantité de matière n (en mol) de soluté dissous par litre de solution, C = n / Vs (en mol/L), Vs étant le volume de la solution en litres. La concentration massique 𝒞 est la masse m (en g) de soluté dissous par litre de solution, 𝒞 = m / Vs (en g/L). Ces deux grandeurs sont liées par la masse molaire M du soluté, puisque m = n×M : on obtient ainsi la relation 𝒞 = M × C. Par ailleurs, toute solution ionique reste électriquement neutre : la somme des charges positives portées par les cations y est toujours égale, en valeur absolue, à la somme des charges négatives portées par les anions -- c'est l'électroneutralité de la solution.$$,
        'highlights', array[$$concentration molaire C = n/Vs$$, $$concentration massique 𝒞 = m/Vs$$, $$électroneutralité$$]::text[],
        'example', jsonb_build_object('statement', $$On dissout 0,51 mol de chlorure de sodium (M = 58,5 g/mol) dans 1,5 L d'eau. Détermine la concentration molaire C, puis la concentration massique 𝒞 de la solution obtenue.$$, 'solution', $$C = n / Vs = 0,51 / 1,5 = 0,34 mol.L⁻¹. Puis 𝒞 = M × C = 58,5 × 0,34 ≈ 19,89 g.L⁻¹.$$),
        'fixation', jsonb_build_object('question', $$Quelle relation relie la concentration massique 𝒞 et la concentration molaire C d'une solution ?$$, 'solution', $$𝒞 = M × C, où M est la masse molaire du soluté.$$)
      ),
      jsonb_build_object(
        'heading', $$Saturation et solubilité d'un soluté$$,
        'body', $$Lorsqu'on ajoute progressivement un soluté à un solvant, il existe une limite au-delà de laquelle le soluté supplémentaire ne se dissout plus et se dépose au fond du récipient : c'est la saturation, et on dit alors que la solution est saturée. La solubilité d'un soluté est précisément la quantité maximale de ce soluté que l'on peut dissoudre par litre de solvant, c'est-à-dire la concentration (molaire ou massique) d'une solution saturée. Elle dépend de la nature du soluté et, en général, augmente avec la température : par exemple, la solubilité du chlorure de sodium est d'environ 360 g/L à 20°C, contre environ 390 g/L à 100°C.$$,
        'highlights', array[$$saturation$$, $$solubilité$$]::text[],
        'example', jsonb_build_object('statement', $$On dissout 20 g de sulfate de sodium dans l'eau à 20°C pour obtenir un volume de 100 cm³ de solution ; la solubilité du sulfate de sodium à cette température est de 195 g/L. Cette solution est-elle saturée ?$$, 'solution', $$La concentration massique de la solution préparée est 𝒞 = m/V = 20 / 0,1 = 200 g/L. Comme 200 g/L > 195 g/L (la solubilité), la solution est saturée : une partie du soluté n'a pas pu se dissoudre.$$),
        'fixation', jsonb_build_object('question', $$Comment évolue généralement la solubilité d'un soluté lorsque la température augmente ?$$, 'solution', $$Elle augmente généralement avec la température.$$)
      ),
      jsonb_build_object(
        'heading', $$Électrolyse d'une solution aqueuse de chlorure de sodium$$,
        'body', $$Lorsqu'on fait passer un courant électrique continu dans une solution aqueuse de chlorure de sodium à l'aide de deux électrodes, on observe un dégagement de bulles de gaz aux deux électrodes. À l'anode (électrode positive), le gaz recueilli décolore une solution d'indigo : c'est du dichlore, produit par la demi-équation 2 Cl⁻ → Cl2 + 2 e⁻. À la cathode (électrode négative), le gaz recueilli détone légèrement à l'approche d'une flamme : c'est du dihydrogène, tandis que l'apparition d'ions hydroxyde OH⁻ (mise en évidence par le bleu de bromothymol qui devient bleu) provient de la demi-équation 2 H2O + 2 e⁻ → 2 OH⁻ + H2. Ces ions hydroxyde apparaissent car les ions sodium Na⁺, trop stables, ne sont pas transformés : ce sont des molécules d'eau qui réagissent à leur place à la cathode. L'équation-bilan globale de cette électrolyse s'écrit : 2 H2O + 2 Cl⁻ → 2 OH⁻ + H2 + Cl2, ce qui correspond à la production de dichlore, de dihydrogène et d'hydroxyde de sodium (soude), la quantité d'ions Na⁺ restant inchangée au cours de la réaction.$$,
        'highlights', array[$$électrolyse$$, $$anode : dichlore$$, $$cathode : dihydrogène et ions OH⁻$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel gaz est produit à l'anode lors de l'électrolyse d'une solution aqueuse de chlorure de sodium, et comment le met-on en évidence ?$$, 'solution', $$Le dichlore Cl2 ; on le met en évidence car il décolore une solution d'indigo.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le club scientifique d'un lycée veut fabriquer du savon par électrolyse d'une solution de chlorure de sodium, afin de récolter des fonds pour la fête de fin d'année. Ils préparent une solution en dissolvant 50 kg de chlorure de sodium (M(Na)=23 g/mol, M(Cl)=35,5 g/mol) dans un fût de 250 L d'eau, puis réalisent l'électrolyse de cette solution.$$,
      'questions', array[
        $$Calcule la masse molaire du chlorure de sodium, puis la quantité de matière de NaCl dissoute dans les 50 kg.$$,
        $$Calcule la concentration molaire C de la solution obtenue (volume total assimilé à 250 L).$$,
        $$Écris les demi-équations électroniques se produisant à l'anode et à la cathode lors de l'électrolyse de cette solution.$$,
        $$Nomme les trois produits obtenus à l'issue de cette électrolyse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Pourquoi une solution aqueuse ionique conduit-elle le courant électrique ?$$,
      'hint', $$Pense à ce qu'elle contient en dissolution.$$,
      'expected', $$Parce qu'elle contient des ions mobiles, capables de transporter le courant électrique.$$
    ),
    jsonb_build_object(
      'question', $$Quelle formule donne la concentration molaire volumique C d'une solution ?$$,
      'hint', $$C'est une quantité de matière divisée par un volume.$$,
      'expected', $$C = n / Vs.$$
    ),
    jsonb_build_object(
      'question', $$Que se passe-t-il lorsqu'on continue d'ajouter du soluté à une solution déjà saturée ?$$,
      'hint', $$Le soluté supplémentaire ne peut plus se dissoudre.$$,
      'expected', $$Le soluté supplémentaire ne se dissout plus : il se dépose au fond du récipient.$$
    ),
    jsonb_build_object(
      'question', $$Quel gaz est produit à la cathode lors de l'électrolyse d'une solution aqueuse de chlorure de sodium ?$$,
      'hint', $$Ce gaz détone légèrement à l'approche d'une flamme.$$,
      'expected', $$Le dihydrogène H2.$$
    )
  ),
  now()
);
