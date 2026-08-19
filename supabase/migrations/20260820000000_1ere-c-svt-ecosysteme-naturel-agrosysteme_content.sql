-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- SVT, categoryid=133.
-- Moodle course id 2419: "SVT 1ère C_L9_Écosystème naturel et
-- agrosystème" (https://lyc.ecole-ci.org/course/view.php?id=2419),
-- resource id 22386. Contenu réécrit à partir du PDF source (caractéristiques
-- comparées d'une forêt et d'un champ cultivé, biomasse et énergie de la
-- biomasse, productivité primaire brute/nette, rendements énergétiques
-- théorique et réel). Tout le contenu est factuel (écologie) : tableaux de
-- données réelles, formules et exercices numériques sont repris/adaptés
-- tels quels ; explications reformulées. Cette leçon termine le programme
-- de SVT disponible pour 1ère C sur la plateforme source (leçons L1, L3 à
-- L9 ; L2 absente de la liste de cours de cette catégorie).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-svt-ecosysteme-naturel-agrosysteme',
  '1ere',
  'C',
  'svt',
  $$L'écosystème naturel et l'écosystème agro-industriel$$,
  8,
  '1ere-c-svt-photosynthese',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'une sortie d'étude effectuée par le club environnement du lycée Moderne de San Pedro sur deux sites, l'un dans un champ de manioc et l'autre dans une forêt galerie au bord d'un cours d'eau, les élèves recensent et récoltent des animaux et des végétaux. Ils constatent que ces êtres vivants diffèrent d'un écosystème à l'autre. Pour comprendre cette diversité, les élèves cherchent à distinguer les écosystèmes visités, à déterminer leurs caractéristiques et à comparer leur biomasse et leur productivité.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les caractéristiques d'un écosystème naturel et d'un agrosystème$$,
        'body', $$Une forêt naturelle non exploitée présente une importante biodiversité, plusieurs strates (arbres, arbustes, herbes), tous les niveaux trophiques (producteurs, consommateurs I, II, III, décomposeurs), et un cycle de la matière fermé, la matière et l'énergie se transférant naturellement d'un niveau à l'autre. Un champ de maïs, milieu exploité, est au contraire une monoculture à une seule strate, avec des producteurs prédominants et des consommateurs rares (souvent éliminés) : son cycle de matière est ouvert, car une partie de la matière est exportée (récolte), tandis que des apports extérieurs (engrais, eau) sont nécessaires. Un tel milieu constitue un agrosystème (ou écosystème agro-industriel).$$,
        'highlights', array[$$forêt naturelle : biodiversité, plusieurs strates, cycle de matière fermé$$, $$champ cultivé (agrosystème) : monoculture, une seule strate, cycle de matière ouvert$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que le cycle de la matière est « ouvert » dans un agrosystème ?$$, 'solution', $$Parce qu'une partie de la matière produite est exportée (récolte) et que des apports extérieurs (engrais, eau) sont nécessaires pour compenser, contrairement à un écosystème naturel où le cycle reste fermé.$$)
      ),
      jsonb_build_object(
        'heading', $$Biomasse et énergie de la biomasse$$,
        'body', $$En mesurant, sur 1 m², la masse totale de matière organique sèche produite par an dans un écosystème naturel et dans un agrosystème, on constate que la biomasse totale et l'énergie de cette biomasse sont plus élevées dans l'écosystème naturel. Dans les deux cas, l'énergie diminue à mesure qu'on s'élève dans les niveaux trophiques (des producteurs vers les consommateurs), mais cette diminution est plus marquée dans l'écosystème naturel, où la chaîne alimentaire est longue, que dans l'agrosystème, où la chaîne est courte.$$,
        'highlights', array[$$biomasse et énergie de la biomasse : plus élevées dans l'écosystème naturel$$, $$perte d'énergie entre niveaux trophiques : plus marquée sur une chaîne longue (écosystème naturel)$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un écosystème naturel, les producteurs emmagasinent 57 800 kJ/m²/an et les consommateurs I seulement 2 350 kJ/m²/an. Que peut-on en déduire sur le transfert d'énergie entre ces deux niveaux trophiques ?$$, 'solution', $$Une grande partie de l'énergie disponible chez les producteurs (environ 96%) est perdue lors du passage au niveau trophique suivant (respiration, chaleur, matière non consommée), seule une faible fraction étant transmise aux consommateurs I.$$),
        'fixation', jsonb_build_object('question', $$Comment évolue l'énergie disponible en passant d'un niveau trophique inférieur à un niveau trophique supérieur ?$$, 'solution', $$Elle diminue systématiquement.$$)
      ),
      jsonb_build_object(
        'heading', $$Productivité primaire et rendements énergétiques$$,
        'body', $$La productivité primaire brute est la quantité de matière organique produite par les végétaux chlorophylliens à l'issue de la photosynthèse ; la productivité primaire nette est la quantité de matière restant à la disposition des consommateurs de premier ordre (herbivores), une fois déduite la part utilisée par les végétaux pour leur propre respiration. Sur une même superficie, la productivité primaire brute de l'écosystème naturel est supérieure à celle de l'agrosystème, mais sa productivité nette peut être inférieure. Le rendement énergétique théorique (énergie produite / énergie solaire reçue × 100) et le rendement réel (énergie produite / énergie ingérée × 100) diffèrent aussi : le rendement réel de l'agrosystème est généralement inférieur à celui de l'écosystème naturel, notamment à cause des apports d'engrais, d'eau et de pesticides qu'il nécessite pour fonctionner.$$,
        'highlights', array[$$productivité brute : matière produite par la photosynthèse$$, $$productivité nette : matière restante disponible pour les consommateurs$$, $$rendement théorique = énergie produite/énergie solaire × 100 ; rendement réel = énergie produite/énergie ingérée × 100$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre la productivité primaire brute et la productivité primaire nette ?$$, 'solution', $$La productivité brute est toute la matière organique produite par la photosynthèse ; la productivité nette est ce qu'il en reste après soustraction de la part utilisée par les végétaux pour leur propre respiration — c'est cette part nette qui est disponible pour les consommateurs.$$)
      ),
      jsonb_build_object(
        'heading', $$Synthèse comparative$$,
        'body', $$L'écosystème naturel et l'agrosystème se distinguent donc sur plusieurs plans complémentaires : leurs caractéristiques structurelles (biodiversité et strates contre monoculture), leur biomasse et l'énergie de cette biomasse (plus élevées dans le milieu naturel), ainsi que leur productivité et leurs rendements énergétiques (l'agrosystème, bien qu'artificiellement optimisé par des apports extérieurs, présente un rendement réel généralement inférieur à celui de l'écosystème naturel).$$,
        'highlights', array[$$comparaison globale : structure, biomasse, productivité, rendement$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur combien de plans complémentaires un écosystème naturel et un agrosystème peuvent-ils être comparés, selon cette leçon ?$$, 'solution', $$Trois plans : leurs caractéristiques structurelles, leur biomasse (et l'énergie de cette biomasse), et leur productivité (avec les rendements énergétiques).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe d'élèves découvre un tableau relatif aux apports extérieurs et à la productivité d'un agrosystème et d'un écosystème naturel. Pour l'agrosystème : machinisme 4 991, carburant 3 992, semences 20 365, engrais 598, irrigation 8 987, insecticides 259, herbicides 259, séchage 16 172, divers 7 988 (toutes ces valeurs en unités d'énergie/an) ; productivité (biomasse produite) 116 237 ; récolte (biomasse exportée) 9 t.ha⁻¹.an⁻¹. Pour l'écosystème naturel : tous les apports extérieurs valent 0 ; productivité 93 000 ; récolte (biomasse exportée) 0.$$,
      'questions', array[
        $$Analyse le tableau : que peux-tu dire de la productivité de chaque écosystème par rapport aux apports extérieurs qu'il reçoit ?$$,
        $$Explique pourquoi la récolte (biomasse exportée) de l'écosystème naturel vaut 0.$$,
        $$Déduis-en l'intérêt d'un agrosystème.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux caractéristiques structurelles qui distinguent une forêt naturelle d'un champ de maïs cultivé.$$,
      'hint', $$Pense à la diversité des espèces et au nombre de strates végétales.$$,
      'expected', $$Deux parmi : la forêt présente une biodiversité importante et plusieurs strates (arbres, arbustes, herbes), alors que le champ de maïs est une monoculture à une seule strate.$$
    ),
    jsonb_build_object(
      'question', $$Dans un agrosystème, pourquoi le cycle de la matière est-il qualifié d'« ouvert » ?$$,
      'hint', $$Il y a un flux de matière qui sort du système et un autre qui y entre.$$,
      'expected', $$Parce qu'une partie de la matière produite est exportée par la récolte, et que des apports extérieurs (engrais, eau) sont nécessaires pour compenser.$$
    ),
    jsonb_build_object(
      'question', $$Écris la formule du rendement énergétique réel d'un écosystème.$$,
      'hint', $$Il se calcule par rapport à l'énergie effectivement ingérée, pas à l'énergie solaire totale.$$,
      'expected', $$Rendement réel = (énergie produite / énergie ingérée) × 100.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le rendement réel d'un champ cultivé est-il généralement inférieur à celui d'une forêt naturelle ?$$,
      'hint', $$Le champ nécessite des intrants supplémentaires pour fonctionner.$$,
      'expected', $$À cause des apports d'engrais, d'eau et de pesticides nécessaires à son fonctionnement, qui réduisent son efficacité énergétique relative.$$
    )
  ),
  now()
);
