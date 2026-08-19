-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- SVT, categoryid=125.
-- Moodle course id 903: "SVT 1ère A_L5_La régulation des naissances"
-- (https://lyc.ecole-ci.org/course/view.php?id=903), resource id 4485.
-- Contenu réécrit à partir du PDF source (méthodes naturelles, mécaniques
-- et chimiques de contraception, mode d'action de la pilule combinée,
-- avantages du planning familial). Faits scientifiques réels (méthode
-- Ogino-Knaus, mode d'action hormonal de la pilule) repris tels quels ;
-- explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-svt-regulation-naissances',
  '1ere',
  'A',
  'svt',
  $$La régulation des naissances$$,
  5,
  '1ere-a-svt-cycles-sexuels-femme',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève de 1ère A retrouve, lors de ses congés, une voisine déscolarisée qui vit en concubinage et a déjà trois enfants rapprochés, dont la santé et celle de la mère se dégradent. Une sage-femme lui conseille la planification familiale. De retour en classe, les élèves décident d'identifier les méthodes contraceptives, d'expliquer le mode d'action de la pilule, et de dégager les avantages de la planification des naissances.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les méthodes naturelles$$,
        'body', $$Le coït interrompu consiste à retirer le pénis du vagin avant l'éjaculation (taux d'échec de 16 à 20%, par manque de maîtrise). La méthode Ogino-Knaus repose sur le principe que l'ovulation survient toujours 14 jours avant la fin du cycle : pour un cycle de 28 jours, l'ovulation a lieu au 14ème jour, avec une période de fécondité entre le 11ème et le 17ème jour. La méthode de Billings (glaire cervicale) observe que la glaire devient abondante et fluide juste avant l'ovulation, épaisse et imperméable en dehors de cette période. L'abstinence sexuelle (taux d'échec de 0%) et la méthode de la température rectale (qui baisse légèrement le jour de l'ovulation puis augmente brutalement) complètent ces méthodes naturelles.$$,
        'highlights', array[$$Ogino-Knaus : ovulation = durée du cycle − 14 jours$$, $$Billings : glaire cervicale fluide près de l'ovulation$$, $$abstinence : taux d'échec 0%$$]::text[],
        'property', jsonb_build_object('label', $$Formule Ogino-Knaus$$, 'text', $$Jour d'ovulation = durée du cycle − 14. Période de fécondité = jour d'ovulation ± 3 jours.$$),
        'fixation', jsonb_build_object('question', $$Pour un cycle de 32 jours, à quel jour se situe l'ovulation selon la méthode Ogino-Knaus ?$$, 'solution', $$Au 18ème jour (32 − 14 = 18).$$)
      ),
      jsonb_build_object(
        'heading', $$Les méthodes mécaniques$$,
        'body', $$Le stérilet, petit objet en plastique ou en cuivre placé dans l'utérus pour 1 à 10 ans, empêche la nidation du zygote. Le préservatif masculin, étui en caoutchouc fin, recouvre le pénis et recueille le sperme. Le diaphragme, coupe de caoutchouc recouverte de spermicide, recouvre le col de l'utérus. Le préservatif féminin, gaine souple et lubrifiée positionnée dans le vagin, empêche la rencontre des gamètes.$$,
        'highlights', array[$$stérilet : empêche la nidation$$, $$préservatifs (masculin/féminin) : barrière physique$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment le stérilet empêche-t-il une grossesse ?$$, 'solution', $$En empêchant la nidation du zygote dans l'utérus.$$)
      ),
      jsonb_build_object(
        'heading', $$La méthode chimique : le mode d'action de la pilule combinée$$,
        'body', $$La pilule combinée contient des œstrogènes et de la progestérone de synthèse. Prise quotidiennement, elle agit à trois niveaux : au niveau du complexe hypothalamo-hypophysaire, le taux élevé d'hormones ovariennes de synthèse exerce un rétrocontrôle négatif, supprimant les pics de FSH et de LH ; au niveau des ovaires, l'absence de pic de FSH empêche la maturation des follicules et l'absence de pic de LH empêche l'ovulation, donc la formation du corps jaune ; au niveau de l'utérus, la muqueuse (dentelle utérine) s'atrophie et devient impropre à la nidation, tandis que la glaire cervicale s'épaissit et bloque le passage des spermatozoïdes.$$,
        'highlights', array[$$rétrocontrôle négatif → pas de pic FSH/LH → pas d'ovulation$$, $$muqueuse utérine atrophiée + glaire épaissie$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi l'absence de pic de FSH pendant la prise de pilule empêche-t-elle une grossesse ?$$, 'solution', $$Parce que la FSH est nécessaire à la croissance et à la maturation des follicules ovariens ; sans son pic, aucun follicule ne peut arriver à maturité, ce qui bloque tout le processus de reproduction en amont de l'ovulation.$$),
        'fixation', jsonb_build_object('question', $$Par quel mécanisme la pilule combinée supprime-t-elle les pics de FSH et de LH ?$$, 'solution', $$Le taux élevé d'œstrogènes et de progestérone de synthèse qu'elle apporte exerce un rétrocontrôle négatif sur le complexe hypothalamo-hypophysaire.$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages de la planification des naissances$$,
        'body', $$La planification familiale permet de choisir le moment propice pour avoir un enfant, d'espacer les naissances et de limiter leur nombre, de préserver la santé de la mère et de l'enfant, de favoriser l'équilibre familial, une gestion rationnelle des ressources et une meilleure éducation des enfants. Une méthode contraceptive doit être temporaire, réversible et inoffensive pour le couple et les futurs enfants.$$,
        'highlights', array[$$espacement des naissances$$, $$santé mère/enfant, équilibre familial$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux avantages de la planification familiale pour la famille.$$, 'solution', $$Par exemple la préservation de la santé de la mère et de l'enfant, et une meilleure gestion des ressources familiales (également valables : l'équilibre familial, une meilleure éducation des enfants).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une élève de 1ère A utilise une méthode contraceptive basée sur la connaissance de la durée du cycle et de la période de fécondité. Elle a eu un rapport sexuel le 25 janvier et s'inquiète. Son cycle est de 29 jours, et le premier jour de ses dernières menstrues était le 10 janvier.$$,
      'questions', array[
        $$Nomme la méthode contraceptive utilisée par cette élève.$$,
        $$Détermine la date probable de l'ovulation.$$,
        $$Déduis, en expliquant ton raisonnement, si cette élève risque une grossesse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel est le taux d'échec de l'abstinence sexuelle comme méthode contraceptive ?$$,
      'hint', $$C'est la méthode la plus fiable citée.$$,
      'expected', $$0%.$$
    ),
    jsonb_build_object(
      'question', $$Que contient une pilule contraceptive combinée ?$$,
      'hint', $$Deux types d'hormones de synthèse.$$,
      'expected', $$Des œstrogènes et de la progestérone de synthèse.$$
    ),
    jsonb_build_object(
      'question', $$Quel effet la prise de pilule a-t-elle sur la glaire cervicale ?$$,
      'hint', $$Cela bloque le passage des spermatozoïdes.$$,
      'expected', $$Elle devient épaisse, ce qui empêche le passage des spermatozoïdes au niveau du col de l'utérus.$$
    ),
    jsonb_build_object(
      'question', $$Cite un critère qu'une bonne méthode contraceptive doit respecter, selon la conclusion du cours.$$,
      'hint', $$Trois critères sont cités.$$,
      'expected', $$Elle doit être temporaire, réversible et inoffensive pour le couple et les futurs enfants (un seul critère suffit).$$
    )
  ),
  now()
);
