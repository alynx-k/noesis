-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie, categoryid=124.
-- Moodle course id 1996: "1ère_GEOGRAPHIE_T2_L2: L'URBANISATION DANS LES
-- PAYS DEVELOPPES: exemple de la France"
-- (https://lyc.ecole-ci.org/course/view.php?id=1996), resource id 41345.
-- Contenu réécrit à partir du PDF source (phases de l'urbanisation
-- française, macrocéphalie parisienne, dissymétrie Est/Ouest, aires
-- urbaines, problèmes et politiques de la ville). Chiffres et faits réels
-- repris tels quels ; explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-geo-urbanisation-pays-developpes-france',
  '1ere',
  'A',
  'histoire-geographie',
  $$L'urbanisation dans les pays développés : l'exemple de la France$$,
  4,
  '1ere-a-hg-geo-urbanisation-pays-developpement-ci',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des urbanistes ivoiriens, de retour d'une conférence à Paris, décrivent à leur classe la Tour Eiffel, les larges avenues et les rues bitumées des villes françaises visitées. Impressionnés, les élèves de 1ère A décident de mener des recherches pour décrire les caractéristiques de l'urbanisation en France, expliquer son processus, analyser ses problèmes et apprécier les stratégies adoptées pour les résoudre.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le processus d'urbanisation en France$$,
        'body', $$L'urbanisation française s'est faite en trois grandes phases. De l'Antiquité au XIXe siècle, des villes commerçantes (Marseille, Lyon, Paris) puis portuaires (Le Havre, Toulon) se développent progressivement. C'est la révolution industrielle (à partir de 1850) qui accélère véritablement le phénomène : 50% de la population française était urbaine dès 1930, contre 79% en 1999. La période 1945-1975 (les Trente Glorieuses) voit une explosion urbaine portée par le baby-boom et l'immigration. Depuis 1975, la France est entrée dans une phase de transition urbaine : l'exode rural ralentit, et l'on assiste au développement du périurbain — des communes rurales en périphérie des grandes villes où s'installent des habitants qui continuent de travailler en ville.$$,
        'highlights', array[$$révolution industrielle : accélération dès 1850$$, $$Trente Glorieuses : baby-boom + immigration$$, $$depuis 1975 : essor du périurbain$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui caractérise l'espace périurbain ?$$, 'solution', $$Ce sont des communes rurales situées en périphérie des grandes agglomérations, où s'installent des habitants qui continuent de travailler en ville, souvent desservies par le train ou une autoroute.$$)
      ),
      jsonb_build_object(
        'heading', $$La macrocéphalie parisienne$$,
        'body', $$La caractéristique majeure du réseau urbain français est la taille exceptionnelle de Paris par rapport aux autres villes : son aire urbaine atteint plus de 12 millions d'habitants (2014), soit environ un sixième de la population française, loin devant Lyon (1,8 million) et Marseille (1,6 million). Cette suprématie, appelée macrocéphalie urbaine, fait qu'aucune ville ne peut rivaliser avec la capitale, repoussant les autres grandes villes (Lille, Bordeaux, Toulouse, Rennes) au rang de pôles régionaux secondaires.$$,
        'highlights', array[$$Paris : ~12 millions d'habitants (aire urbaine)$$, $$macrocéphalie urbaine : aucune ville ne rivalise$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie l'expression « macrocéphalie urbaine » appliquée à Paris ?$$, 'solution', $$Le fait que la capitale soit disproportionnellement plus grande et plus influente que toutes les autres villes du pays, sans aucune rivale à sa mesure.$$)
      ),
      jsonb_build_object(
        'heading', $$La dissymétrie Est/Ouest et les aires urbaines$$,
        'body', $$Le réseau urbain français présente aussi un déséquilibre Est/Ouest : la majorité des grandes métropoles se trouvent à l'est du pays, où 95% des communes sont urbaines contre moins de 60% à l'ouest (à l'exception de Bordeaux et Toulouse). Ce déséquilibre, absent avant le XVIIIe siècle, s'explique par l'industrialisation de l'Est au XIXe siècle. On distingue par ailleurs trois types d'espaces à dominante urbaine : les aires métropolitaines (au moins 500 000 habitants), les autres aires urbaines, et les communes multipolarisées (dont une partie importante de la population active travaille dans plusieurs aires urbaines voisines).$$,
        'highlights', array[$$Est : 95% de communes urbaines vs Ouest <60%$$, $$dû à l'industrialisation du XIXe siècle$$, $$aires métropolitaines ≥500 000 habitants$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la dissymétrie urbaine Est/Ouest s'est-elle développée au XIXe siècle plutôt qu'avant ?$$, 'solution', $$Parce que c'est l'industrialisation de la partie Est du territoire qui a stimulé la croissance urbaine de cette région, alors que l'Ouest, moins industrialisé, est resté davantage rural.$$)
      ),
      jsonb_build_object(
        'heading', $$Problèmes urbains et politiques de la ville$$,
        'body', $$L'urbanisation française génère des problèmes multiples : pénurie de logements, chômage, insuffisance des services sociaux, congestion routière, criminalité, et pollution (à Paris, les pics de pollution ont causé 7% de la mortalité cardiaque liée à l'air entre 2007 et 2010). Depuis les années 1970, l'État a développé des « politiques de la ville » pour y répondre : classement de quartiers en Zones Urbaines Sensibles (ZUS), création de zones franches avec aides à l'emploi, et création de l'Agence Nationale pour la Rénovation Urbaine (ANRU) pour améliorer équipements et logements.$$,
        'highlights', array[$$ZUS : zones urbaines sensibles$$, $$ANRU : rénovation urbaine$$, $$axes : emploi + accès au logement/santé/éducation/culture$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le rôle de l'ANRU (Agence Nationale pour la Rénovation Urbaine) ?$$, 'solution', $$Améliorer les équipements et construire des logements dans les quartiers classés en zones urbaines sensibles (ZUS).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un urbaniste français affirme : « L'exode rural a provoqué une concentration de plus en plus grande de la population dans des grands centres urbains, entraînant la transformation progressive des cités en mégalopoles. [...] La ville concentre encore culture, divertissement, pouvoir, et représente un pôle d'attraction, mais c'est aussi un environnement où les conditions de vie deviennent de plus en plus difficiles. »$$,
      'questions', array[
        $$Explique le passage : « la ville concentre encore culture, divertissement, pouvoir [...] mais c'est aussi un environnement où les conditions de vie deviennent de plus en plus difficiles ».$$,
        $$Cite deux problèmes urbains en France et une mesure prise pour y répondre.$$,
        $$Que penses-tu de l'affirmation selon laquelle « l'exode rural a provoqué une concentration de plus en plus grande de la population dans des grands centres urbains » ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$À partir de quelle période l'urbanisation française s'accélère-t-elle véritablement ?$$,
      'hint', $$C'est lié à un grand bouleversement économique du XIXe siècle.$$,
      'expected', $$À partir de la révolution industrielle (deuxième moitié du XIXe siècle, dès 1850).$$
    ),
    jsonb_build_object(
      'question', $$Quelle ville illustre la « macrocéphalie urbaine » en France ?$$,
      'hint', $$C'est la capitale.$$,
      'expected', $$Paris.$$
    ),
    jsonb_build_object(
      'question', $$La partie Est ou la partie Ouest de la France est-elle la plus urbanisée ?$$,
      'hint', $$C'est lié à l'industrialisation du XIXe siècle.$$,
      'expected', $$La partie Est.$$
    ),
    jsonb_build_object(
      'question', $$Que désigne l'acronyme ZUS dans les politiques de la ville françaises ?$$,
      'hint', $$C'est un classement de certains quartiers en difficulté.$$,
      'expected', $$Zone Urbaine Sensible.$$
    )
  ),
  now()
);
