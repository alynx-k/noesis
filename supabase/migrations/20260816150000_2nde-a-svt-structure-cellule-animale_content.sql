-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3708: "SVT 2nd A_L8_La structure d'une cellule animale"
-- (https://lyc.ecole-ci.org/course/view.php?id=3708)
-- Resource "Je lis le résumé de la leçon", pluginfile "SVT 2nd A_L8_La
-- structure d'une cellule animale.pdf" (8 pages; internally "Leçon 6" of
-- the new theme "La reproduction cellulaire").
-- Rewritten/paraphrased from the source PDF: the organites making up an
-- animal cell (plasma membrane, hyaloplasm/cytosol, nucleus, ribosomes,
-- smooth/rough endoplasmic reticulum, Golgi apparatus, mitochondria,
-- lysosomes, peroxisomes, centrioles, vacuole), and the karyotype analysis
-- showing diploid somatic cells (46 chromosomes, 23 homologous pairs, 22
-- autosome pairs + 1 sex-chromosome pair XX/XY) versus haploid sex cells
-- (23 chromosomes). 100% original wording; no sentence copied from the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-structure-cellule-animale',
  '2nde',
  'A',
  'svt',
  $$La structure d'une cellule animale$$,
  8,
  '2nde-a-svt-changement-climatique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En préparant un devoir de niveau, des élèves de seconde A découvrent dans un manuel de biologie un document montrant l'ultrastructure d'une cellule ainsi que son équipement chromosomique. Pour approfondir leurs connaissances, ils décident de décrire les constituants de cette cellule et d'analyser son équipement chromosomique.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La cellule animale est constituée de nombreux organites$$,
        'body', $$L'observation d'un schéma d'ultrastructure d'une cellule animale, obtenu au microscope électronique, révèle une organisation riche en organites. Une membrane plasmique délimite le cytoplasme, dont la fraction liquide est appelée hyaloplasme (ou cytosol) et dans laquelle baignent les autres constituants. Le noyau, entouré d'une enveloppe nucléaire, contient un nucléole et les chromosomes sous forme de chromatine. On y trouve aussi des ribosomes, un réticulum endoplasmique lisse (sans ribosomes) et un réticulum endoplasmique granuleux (associé aux ribosomes), un ensemble de dictyosomes qui forme l'appareil de Golgi, des mitochondries, des lysosomes, des peroxysomes, des centrioles et une vacuole. L'ensemble de ces organites confirme que la structure de la cellule animale est effectivement constituée d'organites, chacun assurant une fonction particulière dans le fonctionnement cellulaire.$$,
        'highlights', array[$$hyaloplasme$$, $$organites$$, $$appareil de Golgi$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Organite$$, $$Particularité$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Réticulum endoplasmique granuleux$$, $$Associé à des ribosomes$$),
            jsonb_build_array($$Réticulum endoplasmique lisse$$, $$Sans ribosomes$$),
            jsonb_build_array($$Appareil de Golgi$$, $$Formé par l'ensemble des dictyosomes$$),
            jsonb_build_array($$Noyau$$, $$Contient le nucléole et les chromosomes (chromatine)$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la fraction liquide du cytoplasme dans laquelle baignent les organites ?$$, 'solution', $$L'hyaloplasme, aussi appelé cytosol.$$)
      ),
      jsonb_build_object(
        'heading', $$Le caryotype révèle l'équipement chromosomique de la cellule$$,
        'body', $$L'observation de documents relatifs au caryotype humain permet de compléter cette description. Les caryotypes d'une cellule somatique comportent chacun 46 chromosomes disposés en 23 paires ; une cellule qui possède ainsi 23 paires de chromosomes est dite diploïde, et les deux chromosomes de chaque paire sont dits homologues. Les 22 premières paires, identiques dans les deux caryotypes observés, sont appelées autosomes. La 23e paire diffère selon les individus : elle est constituée de deux chromosomes X chez la femme, et d'un chromosome X associé à un chromosome Y chez l'homme. Les caryotypes des cellules sexuelles, eux, ne comptent que 23 chromosomes, soit la moitié du nombre observé dans les cellules diploïdes : ces cellules sont dites haploïdes. Le caryotype correspond ainsi à la représentation microphotographique des chromosomes du noyau d'une cellule, après leur disposition par paires selon leur taille ; l'ensemble des chromosomes présents dans le noyau d'une cellule eucaryote constitue sa garniture chromosomique.$$,
        'highlights', array[$$caryotype$$, $$diploïde$$, $$haploïde$$, $$autosomes$$]::text[],
        'property', jsonb_build_object('label', $$Cellules diploïdes et haploïdes$$, 'text', $$Une cellule diploïde possède 2n chromosomes regroupés en paires homologues (23 paires chez l'Homme, soit 46 chromosomes) ; une cellule haploïde n'en possède que n (23 chromosomes chez l'Homme), comme c'est le cas des cellules sexuelles.$$),
        'fixation', jsonb_build_object('question', $$Quelle paire de chromosomes permet de distinguer le caryotype d'une femme de celui d'un homme ?$$, 'solution', $$La 23e paire : XX chez la femme, XY chez l'homme.$$)
      ),
      jsonb_build_object(
        'heading', $$Bilan : une cellule délimitée, organisée et porteuse d'information génétique$$,
        'body', $$La cellule animale est délimitée par une membrane plasmique qui renferme un cytosol dans lequel baignent les organites et leurs produits de synthèse. À l'intérieur de son noyau se trouvent les chromosomes, qui représentent le matériel génétique de la cellule. Cette double caractéristique, structurale (les organites) et génétique (les chromosomes), permet de décrire complètement l'organisation d'une cellule animale telle qu'observée dans un document d'ultrastructure.$$,
        'highlights', array[$$matériel génétique$$, $$membrane plasmique$$]::text[],
        'fixation', jsonb_build_object('question', $$Que renferme le noyau d'une cellule animale et que représente ce contenu ?$$, 'solution', $$Le noyau renferme les chromosomes, qui représentent le matériel génétique de la cellule.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$À la fin d'une séance de travaux pratiques sur l'organisation de la cellule, un groupe d'élèves reçoit deux documents : un schéma d'ultrastructure d'une cellule animale non annoté, et un caryotype comportant 23 paires de chromosomes dont une paire XY. Éprouvant des difficultés à exploiter ces documents, le groupe te sollicite pour l'aider.$$,
      'questions', array[
        $$Cite au moins quatre organites que l'on peut identifier sur un schéma d'ultrastructure d'une cellule animale.$$,
        $$Analyse le caryotype décrit : combien de paires d'autosomes comporte-t-il et que représente sa 23e paire ?$$,
        $$À partir de ce caryotype, donne la garniture chromosomique de la cellule (nombre de chromosomes et caractère diploïde ou haploïde).$$,
        $$Ce caryotype peut-il correspondre à celui d'une cellule sexuelle ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on l'ensemble des dictyosomes d'une cellule animale ?$$,
      'hint', $$C'est l'organite impliqué dans la maturation et le tri des protéines.$$,
      'expected', $$L'appareil de Golgi.$$
    ),
    jsonb_build_object(
      'question', $$Combien de chromosomes possède une cellule somatique humaine diploïde ?$$,
      'hint', $$C'est le double du nombre de chromosomes d'une cellule sexuelle humaine.$$,
      'expected', $$46 chromosomes, soit 23 paires.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on les 22 premières paires de chromosomes, identiques chez l'homme et chez la femme ?$$,
      'hint', $$On les distingue de la 23e paire, dite paire de chromosomes sexuels.$$,
      'expected', $$Les autosomes.$$
    ),
    jsonb_build_object(
      'question', $$Quel type de cellule possède un nombre de chromosomes égal à la moitié de celui d'une cellule diploïde ?$$,
      'hint', $$C'est le cas des spermatozoïdes et des ovules.$$,
      'expected', $$Une cellule haploïde (les cellules sexuelles).$$
    )
  ),
  now()
);
