-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2395: "LEÇON 12: COUPLES OXYDANTS/RÉDUCTEURS EN
-- SOLUTION AQUEUSE. DOSAGE." (https://lyc.ecole-ci.org/course/view.php?id=2395),
-- resource id 22098. Contenu réécrit à partir du PDF source (couples
-- Fe3+/Fe2+, MnO4-/Mn2+, Cr2O7 2-/Cr3+, prévision des réactions selon la
-- règle du gamma, principe du dosage colorimétrique, dosage de Fe2+ par
-- MnO4-). Tout le contenu est factuel (chimie des solutions) :
-- demi-équations, potentiels standards réels et exercices numériques sont
-- repris/adaptés tels quels ; explications reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-couples-oxydoreducteurs-solution-dosage',
  '1ere',
  'C',
  'physique-chimie',
  $$Couples oxydants/réducteurs en solution aqueuse. Dosage$$,
  8,
  '1ere-c-pc-chimie-classification-couples-oxydoreducteurs',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 1ère C du Lycée Moderne de Grand-Lahou ont découvert dans une revue scientifique que l'alcootest, qui permet aux forces de l'ordre de vérifier l'état d'ivresse d'un automobiliste, consiste en une réaction d'oxydoréduction entre l'éthanol et l'ion dichromate (Cr2O7²⁻). Afin de vérifier cette information, ils décident, sous la conduite de leur professeur, de prévoir les réactions possibles à partir des potentiels normaux, de réaliser des dosages, puis d'exploiter l'équation-bilan d'une réaction de dosage.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Réaction entre les couples Fe³⁺/Fe²⁺ et MnO4⁻/Mn²⁺$$,
        'body', $$Lorsqu'on verse une solution de permanganate de potassium acidifiée (violette) dans une solution de sulfate de fer II (verte), la couleur verte disparaît : les ions Fe²⁺ se transforment en ions Fe³⁺ (demi-équation Fe²⁺ → Fe³⁺ + e⁻, couple Fe³⁺/Fe²⁺), tandis que les ions permanganate MnO4⁻ se transforment en ions Mn²⁺ incolores en captant des électrons (demi-équation MnO4⁻ + 8H⁺ + 5e⁻ → Mn²⁺ + 4H2O, couple MnO4⁻/Mn²⁺). L'équation-bilan globale est : 5 Fe²⁺ + MnO4⁻ + 8H3O⁺ → 5 Fe³⁺ + Mn²⁺ + 12 H2O. Cette réaction était prévisible car E°(MnO4⁻/Mn²⁺) = 1,52 V est bien supérieur à E°(Fe³⁺/Fe²⁺) = 0,66 V.$$,
        'highlights', array[$$Fe²⁺ → Fe³⁺ + e⁻ (oxydation) ; MnO4⁻ + 8H⁺ + 5e⁻ → Mn²⁺ + 4H2O (réduction)$$, $$équation-bilan : 5 Fe²⁺ + MnO4⁻ + 8H3O⁺ → 5 Fe³⁺ + Mn²⁺ + 12 H2O$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est l'oxydant dans la réaction entre les ions Fe²⁺ et les ions permanganate MnO4⁻ ?$$, 'solution', $$L'ion permanganate MnO4⁻.$$)
      ),
      jsonb_build_object(
        'heading', $$Réaction entre l'éthanol et l'ion dichromate (principe de l'alcootest)$$,
        'body', $$En milieu acide, les ions dichromate Cr2O7²⁻ captent des électrons et se transforment en ions Cr³⁺ (demi-équation Cr2O7²⁻ + 14H⁺ + 6e⁻ → 2Cr³⁺ + 7H2O, couple Cr2O7²⁻/Cr³⁺), tandis que l'éthanol libère des électrons en se transformant en acide éthanoïque (demi-équation CH3CH2OH + H2O → CH3COOH + 4H⁺ + 4e⁻, couple CH3COOH/CH3CH2OH). L'équation-bilan de cette réaction est : 2 Cr2O7²⁻ + 16 H3O⁺ + 3 CH3CH2OH → 4 Cr³⁺ + 27 H2O + 3 CH3COOH. Cette réaction était prévisible car E°(Cr2O7²⁻/Cr³⁺) = 1,33 V est supérieur à E°(CH3COOH/CH3CH2OH) = 0,04 V : c'est exactement la réaction mise en jeu par l'alcootest, où le changement de couleur de la solution de dichromate (orangé vers vert) révèle la présence d'éthanol dans l'air expiré.$$,
        'highlights', array[$$Cr2O7²⁻ + 14H⁺ + 6e⁻ → 2Cr³⁺ + 7H2O (réduction)$$, $$CH3CH2OH + H2O → CH3COOH + 4H⁺ + 4e⁻ (oxydation)$$, $$c'est le principe de l'alcootest chimique$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi se transforme l'éthanol lorsqu'il est oxydé par les ions dichromate ?$$, 'solution', $$En acide éthanoïque (CH3COOH).$$)
      ),
      jsonb_build_object(
        'heading', $$Prévision des réactions à partir des potentiels normaux$$,
        'body', $$Soient deux couples redox Ox1/Red1 et Ox2/Red2, de potentiels normaux respectifs E1° et E2°. Si E1° > E2°, alors Ox1 oxyde le réducteur Red2 : la réaction peut être considérée comme totale lorsque E1° − E2° ≥ 0,3 V. Cette règle (dite règle du gamma) permet de prévoir si une réaction d'oxydoréduction est possible entre deux couples, sans avoir à réaliser l'expérience.$$,
        'highlights', array[$$si E1° > E2°, alors Ox1 oxyde Red2$$, $$réaction totale si E1° − E2° ≥ 0,3 V$$]::text[],
        'example', jsonb_build_object('statement', $$Les couples I2/I⁻ (E° = 0,54 V) et S4O6²⁻/S2O3²⁻ (E° = 0,08 V) peuvent-ils réagir ensemble ? Écris l'équation-bilan si oui.$$, 'solution', $$Oui : E°(I2/I⁻) > E°(S4O6²⁻/S2O3²⁻), donc I2 (oxydant le plus fort) réagit avec S2O3²⁻ (réducteur le plus fort) : I2 + 2 S2O3²⁻ → 2 I⁻ + S4O6²⁻.$$),
        'fixation', jsonb_build_object('question', $$Quelle condition sur la différence des potentiels normaux permet de considérer une réaction d'oxydoréduction comme totale ?$$, 'solution', $$E1° − E2° ≥ 0,3 V.$$)
      ),
      jsonb_build_object(
        'heading', $$Le dosage par oxydoréduction$$,
        'body', $$Doser une espèce chimique en solution consiste à déterminer sa concentration molaire. Dans un dosage colorimétrique, on introduit un volume connu de la solution à doser dans un bécher, puis on y verse goutte à goutte, à l'aide d'une burette, une solution de concentration connue (solution titrante), jusqu'à observer un changement de couleur du milieu réactionnel : ce moment est appelé l'équivalence. Par exemple, pour doser des ions Fe²⁺ par une solution acidifiée de permanganate de potassium (équation-bilan 5Fe²⁺ + MnO4⁻ + 8H⁺ → Mn²⁺ + 4H2O + 5Fe³⁺), l'équivalence est repérée par l'apparition d'une teinte violette persistante ; le bilan molaire n(Fe²⁺) = 5·n(MnO4⁻) donne alors Cr·Vr = 5·C0·V0éq, d'où la concentration cherchée Cr = 5·C0·V0éq / Vr.$$,
        'highlights', array[$$doser = déterminer la concentration molaire d'une espèce en solution$$, $$équivalence : changement de couleur du milieu réactionnel$$, $$dosage de Fe²⁺ par MnO4⁻ : Cr = 5C0.V0éq / Vr$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment repère-t-on l'équivalence lors d'un dosage colorimétrique ?$$, 'solution', $$Par un changement de couleur du milieu réactionnel.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un professeur de physique-chimie demande à un groupe d'élèves de 1ère C de réaliser des travaux pratiques en vue de doser une solution de dichromate de potassium. Expérience 1 : dans un bécher, le groupe introduit V = 20 mL de la solution de dichromate de potassium de concentration C, et y ajoute V1 = 20 mL d'une solution d'iodure de potassium de concentration C1 = 0,4 mol/L (les ions iodure étant en excès, le mélange prend une couleur brun jaune). Expérience 2 : le groupe ajoute ensuite V2 = 10 mL d'une solution de thiosulfate de sodium de concentration C2 = 0,2 mol/L (l'ensemble prend une teinte verte).$$,
      'questions', array[
        $$Donne et nomme les différents couples oxydant-réducteur intervenant dans ces deux expériences, et justifie la couleur brun jaune prise par le contenu du bécher dans la première expérience.$$,
        $$Écris, pour chacune des deux expériences, les demi-équations électroniques et l'équation-bilan de la réaction correspondante.$$,
        $$Déduis de ces expériences la valeur de la concentration C de la solution de dichromate de potassium.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris la demi-équation électronique de réduction des ions permanganate MnO4⁻ en ions Mn²⁺ en milieu acide.$$,
      'hint', $$Elle fait intervenir des ions H⁺ et de l'eau.$$,
      'expected', $$MnO4⁻ + 8H⁺ + 5e⁻ → Mn²⁺ + 4H2O.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'espèce chimique responsable, lors de l'alcootest, de la réaction d'oxydoréduction avec l'éthanol ?$$,
      'hint', $$C'est un ion de couleur orangée.$$,
      'expected', $$L'ion dichromate Cr2O7²⁻.$$
    ),
    jsonb_build_object(
      'question', $$Selon la règle du gamma, entre quels réactifs une réaction d'oxydoréduction spontanée est-elle possible ?$$,
      'hint', $$Il s'agit toujours des espèces les plus fortes de chaque type.$$,
      'expected', $$Entre l'oxydant le plus fort (potentiel le plus élevé) et le réducteur le plus fort (potentiel le plus bas).$$
    ),
    jsonb_build_object(
      'question', $$Que signifie « atteindre l'équivalence » lors d'un dosage colorimétrique ?$$,
      'hint', $$Cela correspond à un changement observable.$$,
      'expected', $$C'est le moment où les réactifs ont été introduits dans les proportions stœchiométriques, repéré par un changement de couleur du milieu réactionnel.$$
    )
  ),
  now()
);
