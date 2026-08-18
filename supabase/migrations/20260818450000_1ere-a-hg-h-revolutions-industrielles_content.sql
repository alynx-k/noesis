-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie (volet Histoire), categoryid=124.
-- Moodle course id 878: "1ère_HISTOIRE_T1_L2: LES REVOLUTIONS
-- INDUSTRIELLES" (https://lyc.ecole-ci.org/course/view.php?id=878),
-- resource id 4185. Contenu réécrit à partir du PDF source (facteurs,
-- caractères des deux révolutions industrielles, conséquences économiques
-- et sociales). Faits, dates et noms d'inventeurs réels (Watt, Arkwright,
-- Pasteur, Ampère, Becquerel, Taylor) repris tels quels ; explications
-- reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-h-revolutions-industrielles',
  '1ere',
  'A',
  'histoire-geographie',
  $$Les révolutions industrielles$$,
  10,
  '1ere-a-hg-h-essor-capitalisme-consequences',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une conférence organisée par le Club d'Histoire-Géographie, des élèves de 1ère A apprennent que les grandes découvertes scientifiques et techniques qui ont bouleversé le monde ont été réalisées principalement en Europe et en Amérique du Nord. Curieux, ils décident de mener des recherches pour connaître les pays et facteurs à l'origine des révolutions industrielles, analyser les performances de la seconde révolution industrielle, et apprécier ses conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les facteurs des révolutions industrielles$$,
        'body', $$La révolution industrielle, qui désigne le passage de la production artisanale à la production mécanisée, s'appuie sur trois facteurs. D'abord l'accumulation de capitaux issus du grand commerce atlantique, placés dans les banques pour financer la recherche et l'industrialisation. Ensuite des progrès techniques décisifs : la machine à vapeur de James Watt (1769), le métier à tisser mécanique de Richard Arkwright, la découverte du coke en métallurgie, l'électricité découverte par André-Marie Ampère (1820), le pétrole utilisé comme source d'énergie dès 1850, et les découvertes de Louis Pasteur (pasteurisation 1867, vaccin contre la rage 1885). Enfin l'abondance de ressources naturelles : le charbon, le fer (production croissante grâce à la fonte au coke) et le coton, matière première importée mais très prisée.$$,
        'highlights', array[$$machine à vapeur (Watt, 1769)$$, $$électricité (Ampère, 1820)$$, $$charbon, fer, coton$$]::text[],
        'fixation', jsonb_build_object('question', $$Qui a inventé la machine à vapeur, et en quelle année ?$$, 'solution', $$James Watt, en 1769.$$)
      ),
      jsonb_build_object(
        'heading', $$La première révolution industrielle$$,
        'body', $$Née en Angleterre dans le dernier tiers du XVIIIe siècle (période 1780-1810), la première révolution industrielle repose sur le charbon et la machine à vapeur. Le travail artisanal est remplacé par les machines, en particulier dans le textile (machine à filer d'Arkwright, machine à tisser de Cartwright) et la métallurgie. Sur le plan économique, les entreprises restent individuelles ou familiales avec une faible capitalisation, tandis que se développe le chemin de fer. Sur le plan social, elle provoque l'exode rural, une urbanisation accélérée et la croissance de la classe ouvrière comme de la bourgeoisie d'affaires.$$,
        'highlights', array[$$1780-1810, Royaume-Uni$$, $$charbon, machine à vapeur, textile$$, $$exode rural, urbanisation$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans quel pays et à quelle période a débuté la première révolution industrielle ?$$, 'solution', $$En Angleterre (Royaume-Uni), entre 1780 et 1810.$$)
      ),
      jsonb_build_object(
        'heading', $$La seconde révolution industrielle$$,
        'body', $$Débutant dans la seconde moitié du XIXe siècle aux États-Unis et en Allemagne, avant de s'étendre à l'Europe et au Japon, la seconde révolution industrielle est une révolution énergétique et technique, marquée par le pétrole, l'électricité et le moteur à explosion. Elle se caractérise par de nombreuses innovations (sidérurgie, automobile, industries chimiques), une forte capitalisation, une concentration financière et industrielle, ainsi que le début de la rationalisation du travail (taylorisme). Sur le plan social, elle entraîne la prédominance de la population urbaine, l'essor des classes moyennes et une hausse générale du niveau de vie.$$,
        'highlights', array[$$USA/Allemagne, fin XIXe siècle$$, $$pétrole, électricité, moteur à explosion$$, $$essor des classes moyennes$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$$$, $$1ère révolution industrielle$$, $$2ème révolution industrielle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array('Pays initiateur', 'Angleterre', 'États-Unis, Allemagne'),
            jsonb_build_array('Énergie dominante', 'Charbon, machine à vapeur', 'Pétrole, électricité'),
            jsonb_build_array('Secteur moteur', 'Textile, fonte', 'Acier, automobile, chimie')
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux nouvelles sources d'énergie qui caractérisent la seconde révolution industrielle ?$$, 'solution', $$Le pétrole et l'électricité (également valable : le moteur à explosion comme innovation technique majeure).$$)
      ),
      jsonb_build_object(
        'heading', $$De nouveaux modes de production et d'organisation$$,
        'body', $$Face à la forte demande liée à la croissance démographique, de nouvelles méthodes apparaissent : la taylorisation (ou travail à la chaîne), organisation scientifique du travail inventée par l'ingénieur américain Frederick Taylor dans les années 1880 pour spécialiser chaque tâche et maximiser le rendement, et la standardisation, qui permet de produire des objets identiques en grand nombre à partir d'un même modèle. Les entreprises se réorganisent aussi par la concentration verticale (entreprises complémentaires), la concentration horizontale (entreprises produisant le même bien) et la concentration géographique (proximité des matières premières et de l'énergie).$$,
        'highlights', array[$$taylorisation (Taylor, années 1880)$$, $$standardisation$$, $$concentration verticale/horizontale/géographique$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel ingénieur américain a inventé la taylorisation, et dans quel but ?$$, 'solution', $$Frederick Taylor, dans les années 1880, dans le but de spécialiser toutes les tâches de production pour obtenir un rendement maximum.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences économiques et sociales$$,
        'body', $$Les révolutions industrielles transforment profondément la société : révolution agricole (mécanisation, engrais), explosion démographique (baisse de la mortalité infantile, hausse de l'espérance de vie, favorisant l'émigration vers le Nouveau Monde), explosion urbaine liée à l'exode rural, révolution des transports (trains, bateaux à vapeur), émergence de deux classes sociales opposées (bourgeoisie et prolétariat), et recul de l'analphabétisme grâce à la création d'écoles et de nouveaux loisirs (théâtre, cinéma, phonographe).$$,
        'highlights', array[$$explosion démographique et urbaine$$, $$bourgeoisie vs prolétariat$$, $$recul de l'analphabétisme$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux conséquences sociales des révolutions industrielles.$$, 'solution', $$Par exemple l'explosion urbaine (liée à l'exode rural) et l'émergence de deux classes sociales opposées, la bourgeoisie et le prolétariat — également valable : le recul de l'analphabétisme.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une conférence, l'orateur cite un large extrait d'un ouvrage de J. Nasmyth (1808-1890) : « L'irrégularité et le manque de soin des travailleurs [...] ont donné une incitation croissante à la demande de machines automatiques, grâce auxquelles il est possible de se passer du travail manuel dans lequel on ne peut avoir confiance. Les machines ne sont jamais ivres, les excès ne font pas trembler les mains, elles ne sont jamais absentes, elles ne font pas de grève pour demander une hausse des salaires. »$$,
      'questions', array[
        $$Dégage l'idée générale de ce texte.$$,
        $$Explique le passage : « L'irrégularité et le manque de soin des travailleurs [...] ont donné une incitation croissante à la demande de machines automatiques. »$$,
        $$Partages-tu l'avis de l'auteur selon lequel les machines ne font pas de grève pour demander une hausse de salaire ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans quel pays est née la première révolution industrielle ?$$,
      'hint', $$C'est le pays qui a inventé la machine à vapeur.$$,
      'expected', $$En Angleterre (Royaume-Uni).$$
    ),
    jsonb_build_object(
      'question', $$Qui a découvert le courant électrique en 1820 ?$$,
      'hint', $$Son nom est associé à l'unité de mesure du courant électrique.$$,
      'expected', $$André-Marie Ampère.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux sources d'énergie dominantes de la seconde révolution industrielle ?$$,
      'hint', $$Elles remplacent progressivement le charbon.$$,
      'expected', $$Le pétrole et l'électricité.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la production d'objets identiques en grand nombre à partir d'un même modèle ?$$,
      'hint', $$C'est un mot proche de « standard ».$$,
      'expected', $$La standardisation.$$
    )
  ),
  now()
);
