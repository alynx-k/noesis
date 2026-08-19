-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie (matière Histoire), categoryid=136.
-- Moodle course id 822: "1ère H2 - Les révolutions industrielles"
-- (https://lyc.ecole-ci.org/course/view.php?id=822), resource id 3513.
-- Contenu réécrit à partir du PDF source (facteurs, caractères et
-- conséquences des deux révolutions industrielles). La citation de
-- J. Nasmyth (1808-1890, ingénieur britannique, texte historique du
-- domaine public) est reproduite telle quelle, comme dans le PDF
-- source ; dates, noms d'inventeurs et chiffres réels repris tels quels
-- (données factuelles).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-h-revolutions-industrielles',
  '1ere',
  'C',
  'histoire-geographie',
  $$Les révolutions industrielles$$,
  10,
  '1ere-c-hg-h-essor-capitalisme-consequences',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Assistant à une conférence organisée par le club Histoire-Géographie, les élèves de 1ère apprennent que les découvertes scientifiques et techniques qui ont bouleversé le monde ont été réalisées principalement en Europe et en Amérique du Nord. Curieux, ils décident d'entreprendre des recherches pour connaître les pays et les facteurs à l'origine des révolutions industrielles, analyser les performances scientifiques et techniques de la seconde révolution industrielle, et apprécier ses conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les facteurs à l'origine des révolutions industrielles$$,
        'body', $$L'Europe a accumulé d'énormes capitaux tirés du grand commerce atlantique, placés dans les banques pour financer la recherche et l'industrialisation. Des progrès techniques déterminants s'y ajoutent : l'invention de la machine à vapeur par James Watt (1769) et du métier à tisser mécanique par Richard Arkwright ; la découverte du coke, qui remplace le charbon de bois en métallurgie ; la découverte du courant électrique par André-Marie Ampère (1820) ; l'utilisation du pétrole comme source d'énergie industrielle dès 1850 ; les découvertes de Louis Pasteur (pasteurisation 1867, vaccin contre la rage 1885) ; et la découverte de la radioactivité par Henri Becquerel (1896). L'abondance de ressources naturelles (charbon, fer, coton importé) complète ces facteurs.$$,
        'highlights', array[$$3 facteurs : capitaux accumulés, progrès techniques (machine à vapeur 1769, électricité 1820...), ressources naturelles (charbon, fer, coton)$$]::text[],
        'fixation', jsonb_build_object('question', $$Qui a inventé la machine à vapeur, et en quelle année ?$$, 'solution', $$James Watt, en 1769.$$)
      ),
      jsonb_build_object(
        'heading', $$La première révolution industrielle (1780-1810)$$,
        'body', $$Née en Angleterre dans le dernier tiers du XVIIIe siècle, elle repose sur le charbon et la machine à vapeur, dominée par le textile et la métallurgie (fonte). Le travail artisanal est remplacé par les machines (machine à filer d'Arkwright, machine à tisser de Cartwright). La population active se déplace du secteur primaire vers le secteur secondaire ; l'organisation du travail reste individuelle et familiale, avec un essor progressif des sociétés anonymes. Sur le plan social : exode rural, urbanisation accélérée, croissance de la classe ouvrière et de la bourgeoisie d'affaires.$$,
        'highlights', array[$$1ère RI : 1780-1810, Royaume-Uni, charbon/vapeur, textile/métallurgie$$, $$exode rural + urbanisation accélérée + classe ouvrière/bourgeoisie$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle énergie et quelle machine caractérisent la première révolution industrielle ?$$, 'solution', $$Le charbon (houille) comme énergie, et la machine à vapeur.$$)
      ),
      jsonb_build_object(
        'heading', $$La deuxième révolution industrielle (1880-1900)$$,
        'body', $$Elle débute aux États-Unis et en Allemagne dans la seconde moitié du XIXe siècle, avant de s'étendre à l'Europe et au Japon. Marquée par de nouvelles sources d'énergie (pétrole, électricité) et le moteur à explosion, c'est une révolution technique : sidérurgie (acier), automobile, constructions navales, industries chimiques et agro-industries. La structure économique se caractérise par une forte capitalisation, une concentration financière et industrielle, et le début du travail mécanisé et rationalisé. Socialement, la population urbaine prédomine, les classes moyennes se développent et le niveau de vie augmente.$$,
        'highlights', array[$$2e RI : USA/Allemagne, pétrole/électricité, sidérurgie/automobile/chimie$$, $$forte capitalisation + concentration + essor des classes moyennes$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la principale différence entre les sources d'énergie de la 1ère et de la 2e révolution industrielle ?$$, 'solution', $$La première repose sur le charbon et la machine à vapeur ; la seconde introduit le pétrole et l'électricité comme nouvelles sources d'énergie, avec le moteur à explosion.$$),
        'fixation', jsonb_build_object('question', $$Dans quels pays débute la deuxième révolution industrielle ?$$, 'solution', $$Aux États-Unis et en Allemagne.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences des révolutions industrielles$$,
        'body', $$De nouveaux modes de production apparaissent : la taylorisation (Frederick Taylor, années 1880), organisation scientifique du travail spécialisant chaque tâche, et la standardisation, production d'objets identiques en grande série. L'organisation économique se transforme via les concentrations verticale, horizontale et géographique des entreprises. Les révolutions industrielles entraînent aussi une révolution agricole (mécanisation, engrais), une explosion démographique (baisse de la mortalité infantile, hausse de l'espérance de vie), une explosion urbaine liée à l'exode rural, une révolution des transports (trains, bateaux à vapeur), l'émergence de la bourgeoisie et du prolétariat, et un recul de l'analphabétisme grâce à l'école et aux loisirs (théâtre, cinéma, phonographe).$$,
        'highlights', array[$$taylorisation (Taylor, 1880s) + standardisation → nouveaux modes de production$$, $$conséquences : révolution agricole, explosion démographique/urbaine, révolution des transports, 2 classes sociales$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la différence entre la taylorisation et la standardisation ?$$, 'solution', $$La taylorisation spécialise et divise le travail en tâches complémentaires pour un rendement maximal ; la standardisation vise à produire des objets identiques en grand nombre à partir d'un même modèle.$$),
        'fixation', jsonb_build_object('question', $$Cite deux conséquences sociales des révolutions industrielles.$$, 'solution', $$Deux parmi : l'exode rural, l'explosion urbaine, l'émergence de la bourgeoisie et du prolétariat, le recul de l'analphabétisme.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une conférence, l'intervenant s'appuie sur un extrait d'un ouvrage de J. Nasmyth (1808-1890) : « L'irrégularité et le manque de soin des travailleurs […] ont donné une incitation croissante à la demande de machines automatiques, grâce auxquelles il est possible de se passer du travail manuel dans lequel on ne peut avoir confiance. Les machines ne sont jamais ivres, les excès ne font pas trembler les mains, elles ne sont jamais absentes, elles ne font pas de grève pour demander une hausse des salaires. »$$,
      'questions', array[
        $$Dégage l'idée générale de ce texte.$$,
        $$Explique la phrase soulignée : « L'irrégularité et le manque de soin des travailleurs […] ont donné une incitation croissante à la demande de machines automatiques. »$$,
        $$Partages-tu l'avis de l'auteur selon lequel les machines ne font pas de grève pour demander une hausse de salaire ? Justifie ta réponse à partir des conséquences sociales des révolutions industrielles étudiées.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux facteurs à l'origine des révolutions industrielles.$$,
      'hint', $$Ils concernent l'argent, la technique ou les ressources.$$,
      'expected', $$Deux parmi : l'accumulation de capitaux (commerce atlantique), les progrès techniques (machine à vapeur, électricité, pétrole), l'abondance de ressources naturelles (charbon, fer, coton).$$
    ),
    jsonb_build_object(
      'question', $$Dans quel pays est née la première révolution industrielle, et à quelle période ?$$,
      'hint', $$C'est un pays européen, à la fin du 18e siècle.$$,
      'expected', $$En Angleterre (Royaume-Uni), entre 1780 et 1810.$$
    ),
    jsonb_build_object(
      'question', $$Qui a inventé la taylorisation, et dans quel but ?$$,
      'hint', $$C'est un ingénieur américain des années 1880.$$,
      'expected', $$L'ingénieur américain Frederick Taylor, pour obtenir un rendement maximum en spécialisant les tâches de production.$$
    ),
    jsonb_build_object(
      'question', $$Quel lien existe-t-il entre les révolutions industrielles et l'explosion démographique ?$$,
      'hint', $$Il concerne la santé et la longévité.$$,
      'expected', $$Les progrès scientifiques et médicaux liés aux révolutions industrielles ont fait baisser la mortalité infantile et augmenter l'espérance de vie, provoquant une explosion démographique.$$
    )
  ),
  now()
);
