-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3293: "LEÇON 8: TESTS D'IDENTIFICATION DE QUELQUES IONS"
-- (https://lyc.ecole-ci.org/course/view.php?id=3293)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32743, redirecting
-- to pluginfile "2nd A - C9 bisTests didentification de quelques ions.pdf"
-- (this document is specific to série A, header "2nde A", 8 pages, Thème 4:
-- Les ions en solution -- unlike the previous lessons of this course, which
-- were shared "2nde A-C" documents).
-- Rewritten/paraphrased from the source PDF: the fact that solution colour
-- alone does not prove which ion is present (hydrated ions give colour,
-- e.g. Cu2+ blue, Fe2+ pale green, but a precipitation test is required),
-- the principle of a precipitation test, identification of three cations
-- (Cu2+ with soda -> blue precipitate Cu(OH)2, Fe2+ with soda -> pale green
-- precipitate Fe(OH)2, Ag+ with chloride ion -> white AgCl precipitate that
-- darkens in light) and three anions (Cl- with Ag+ -> white AgCl
-- precipitate, SO4^2- with Ba2+ -> white BaSO4 precipitate, CO3^2- with H+
-- -> CO2 gas that clouds limewater), plus the notion of spectator ions.
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-tests-identification-ions',
  '2nde',
  'A',
  'physique-chimie',
  $$Tests d'identification de quelques ions$$,
  8,
  '2nde-a-pc-solutions-aqueuses-ioniques',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une journée porte ouverte organisée pour sensibiliser la population à la consommation d'eau potable, des élèves de seconde A remarquent que certaines étiquettes de bouteilles d'eau minérale mentionnent des formules d'ions, d'autres des noms d'ions. Curieux d'en savoir davantage, ils décident, avec leur professeur de Physique-Chimie, d'apprendre à identifier concrètement quelques ions grâce à des réactions chimiques caractéristiques.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La couleur d'une solution ne suffit pas à identifier un ion$$,
        'body', $$Certaines solutions aqueuses ioniques doivent leur couleur à des ions hydratés : l'ion cuivre (II) Cu²⁺ donne une teinte bleue, l'ion fer (II) Fe²⁺ une teinte vert pâle. Il serait toutefois imprudent de conclure trop vite : une solution d'une couleur donnée ne contient pas forcément les ions habituellement associés à cette coloration (une solution bleue, par exemple, ne contient pas nécessairement des ions cuivre (II)). Pour identifier un ion avec certitude, il faut donc réaliser un test chimique spécifique, et non se fier uniquement à l'aspect visuel de la solution.$$,
        'highlights', array[$$couleur des ions hydratés$$, $$test d'identification nécessaire$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi ne peut-on pas se contenter d'observer la couleur d'une solution pour identifier avec certitude l'ion qu'elle contient ?$$, 'solution', $$Parce qu'une solution de couleur donnée ne contient pas forcément les ions habituellement associés à cette couleur ; seul un test chimique spécifique permet une identification certaine.$$)
      ),
      jsonb_build_object(
        'heading', $$Le principe du test de précipitation$$,
        'body', $$Pour identifier un ion présent dans une solution aqueuse, on utilise généralement un test de précipitation. Ce test nécessite deux éléments : la solution contenant l'ion à tester, et un réactif contenant un ion capable de réagir directement et de façon spécifique avec l'ion recherché. Lorsqu'on verse quelques gouttes de ce réactif dans la solution à tester, l'apparition d'un précipité (un solide qui se forme dans le liquide), de couleur et d'aspect caractéristiques, révèle la présence de l'ion recherché.$$,
        'highlights', array[$$test de précipitation$$, $$réactif spécifique$$, $$précipité$$]::text[],
        'fixation', jsonb_build_object('question', $$De quels deux éléments a-t-on besoin pour réaliser un test d'identification d'un ion par précipitation ?$$, 'solution', $$D'une solution contenant l'ion à tester, et d'un réactif contenant un ion capable de réagir spécifiquement avec lui pour former un précipité.$$)
      ),
      jsonb_build_object(
        'heading', $$Identification de quelques cations$$,
        'body', $$Trois cations peuvent être identifiés par des tests caractéristiques. L'ion cuivre (II) Cu²⁺ est mis en évidence en versant une solution d'hydroxyde de sodium (soude) dans la solution à tester : il se forme un précipité bleu d'hydroxyde de cuivre, selon Cu²⁺ + 2 OH⁻ → Cu(OH)2. L'ion fer (II) Fe²⁺ réagit de la même façon avec la soude, mais donne cette fois un précipité vert pâle d'hydroxyde de fer (II), selon Fe²⁺ + 2 OH⁻ → Fe(OH)2. L'ion argent Ag⁺, quant à lui, est mis en évidence à l'aide d'une solution contenant des ions chlorure : il se forme un précipité blanc de chlorure d'argent, qui noircit à la lumière, selon Ag⁺ + Cl⁻ → AgCl.$$,
        'highlights', array[$$Cu²⁺ → précipité bleu$$, $$Fe²⁺ → précipité vert pâle$$, $$Ag⁺ → précipité blanc (noircit à la lumière)$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Ion testé$$, $$Réactif$$, $$Observation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Cu²⁺$$, $$Soude (ions OH⁻)$$, $$Précipité bleu (aussi : flamme verte à la combustion)$$),
            jsonb_build_array($$Fe²⁺$$, $$Soude (ions OH⁻)$$, $$Précipité vert pâle$$),
            jsonb_build_array($$Ag⁺$$, $$Ion chlorure Cl⁻$$, $$Précipité blanc qui noircit à la lumière$$)
          )
        ),
        'example', jsonb_build_object('statement', $$On verse de la soude dans une solution à tester et l'on observe un précipité verdâtre. Quel ion est ainsi mis en évidence ?$$, 'solution', $$L'ion fer (II) Fe²⁺, dont la réaction avec la soude donne un précipité vert pâle d'hydroxyde de fer (II).$$),
        'fixation', jsonb_build_object('question', $$Quel réactif permet d'identifier l'ion cuivre (II) et quelle est l'observation caractéristique ?$$, 'solution', $$La soude (ions hydroxyde OH⁻) ; on observe un précipité bleu d'hydroxyde de cuivre.$$)
      ),
      jsonb_build_object(
        'heading', $$Identification de quelques anions et ions spectateurs$$,
        'body', $$Trois anions peuvent également être identifiés. L'ion chlorure Cl⁻ est mis en évidence par une solution de nitrate d'argent : il se forme un précipité blanc de chlorure d'argent, qui noircit à la lumière, selon Ag⁺ + Cl⁻ → AgCl. L'ion sulfate SO4²⁻ est mis en évidence par une solution contenant des ions baryum : il se forme un précipité blanc de sulfate de baryum, selon Ba²⁺ + SO4²⁻ → BaSO4. L'ion carbonate CO3²⁻, enfin, est mis en évidence par ajout d'un acide (source d'ions H3O⁺) : il se produit un dégagement de dioxyde de carbone qui trouble l'eau de chaux, selon CO3²⁻ + 2 H3O⁺ → CO2 + 3 H2O. Dans une équation-bilan de ce type, les ions qui n'apparaissent pas -- comme Na⁺ ou Cl⁻ lorsqu'on fait réagir du carbonate de sodium avec de l'acide chlorhydrique -- sont appelés ions spectateurs : ils sont présents dans le milieu réactionnel mais ne participent pas à la réaction.$$,
        'highlights', array[$$Cl⁻ → AgCl$$, $$SO4²⁻ → BaSO4$$, $$CO3²⁻ → CO2$$, $$ions spectateurs$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Ion testé$$, $$Réactif$$, $$Observation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Cl⁻$$, $$Ag⁺$$, $$Précipité blanc qui noircit à la lumière$$),
            jsonb_build_array($$SO4²⁻$$, $$Ba²⁺$$, $$Précipité blanc$$),
            jsonb_build_array($$CO3²⁻$$, $$H⁺ (acide)$$, $$Dégagement de CO2 qui trouble l'eau de chaux$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Une solution testée donne un précipité verdâtre avec la soude et un précipité blanc avec une solution de nitrate d'argent. Quels ions sont présents ?$$, 'solution', $$L'ion fer (II) Fe²⁺ (précipité vert pâle avec la soude) et l'ion chlorure Cl⁻ (précipité blanc avec le nitrate d'argent) : la solution est probablement du chlorure de fer (II).$$),
        'fixation', jsonb_build_object('question', $$Qu'appelle-t-on un ion spectateur dans une équation-bilan de réaction ?$$, 'solution', $$Un ion présent dans le milieu réactionnel mais qui n'apparaît pas dans l'équation-bilan car il ne participe pas à la réaction.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un technicien de laboratoire reçoit un flacon d'étiquette effacée contenant une solution ionique inconnue. Il réalise deux tests : avec la soude, il obtient un précipité bleu ; avec le chlorure de baryum, il obtient un précipité blanc.$$,
      'questions', array[
        $$Identifie le cation présent dans la solution, en justifiant à l'aide de l'observation obtenue avec la soude.$$,
        $$Identifie l'anion présent dans la solution, en justifiant à l'aide de l'observation obtenue avec le chlorure de baryum.$$,
        $$Écris les deux équations-bilans des réactions de précipitation observées.$$,
        $$Propose un nom probable pour ce composé ionique.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel précipité se forme lorsqu'on ajoute de la soude à une solution contenant des ions cuivre (II) ?$$,
      'hint', $$C'est un précipité coloré, comme la solution de sulfate de cuivre.$$,
      'expected', $$Un précipité bleu d'hydroxyde de cuivre, Cu(OH)2.$$
    ),
    jsonb_build_object(
      'question', $$Quel réactif permet d'identifier l'ion sulfate SO4²⁻ ?$$,
      'hint', $$C'est un ion métallique divalent.$$,
      'expected', $$L'ion baryum Ba²⁺ (une solution de chlorure de baryum, par exemple), qui donne un précipité blanc de sulfate de baryum.$$
    ),
    jsonb_build_object(
      'question', $$Comment reconnaît-on le gaz dégagé lorsqu'on ajoute un acide à une solution contenant des ions carbonate ?$$,
      'hint', $$Pense au test caractéristique de ce gaz.$$,
      'expected', $$Ce gaz est le dioxyde de carbone CO2 ; il trouble l'eau de chaux.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le précipité de chlorure d'argent AgCl est-il facile à reconnaître dans le temps ?$$,
      'hint', $$Sa couleur change s'il reste exposé.$$,
      'expected', $$Parce qu'il noircit progressivement à la lumière.$$
    )
  ),
  now()
);
