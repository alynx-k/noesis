-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie (volet Histoire), categoryid=124.
-- Moodle course id 877: "1ère_HISTOIRE_T1_L1: L'ESSOR DU CAPITALISME ET SES
-- CONSEQUENCES" (https://lyc.ecole-ci.org/course/view.php?id=877), resource
-- id 4173. Contenu réécrit à partir du PDF source (fondements, moyens
-- d'action, fonctionnement et conséquences du capitalisme). La citation du
-- Manifeste du Parti communiste (Karl Marx, 1848 — domaine public, Marx
-- étant mort en 1883) est reprise fidèlement. Faits, dates et chiffres réels
-- (banques, dates de création, crises de 1815/1873/1929) repris tels quels ;
-- explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-h-essor-capitalisme-consequences',
  '1ere',
  'A',
  'histoire-geographie',
  $$L'essor du capitalisme et ses conséquences$$,
  9,
  '1ere-a-hg-geo-consequences-mondialisation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'un débat télévisé sur la crise économique mondiale, un invité affirme : « Les crises sont inhérentes à l'économie capitaliste. Elles sont un mal nécessaire parce qu'elles permettent l'innovation technologique. Comme toutes les autres crises depuis le XIXe siècle, celle-ci passera. » Un élève de 1ère A, qui ne comprend rien à cette affirmation, décide avec ses camarades de mener des recherches pour identifier les fondements du capitalisme, expliquer son fonctionnement et apprécier ses conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les fondements du capitalisme$$,
        'body', $$Apparu à la fin du Moyen Âge en Europe, le capitalisme est une doctrine économique et sociale fondée sur quatre piliers : la liberté d'entreprise (créer et gérer librement une entreprise), la libre concurrence (confrontation légale entre entreprises, régie par la loi de l'offre et de la demande), la recherche du profit (différence entre la valeur de la production vendue et son coût de fabrication) et la propriété privée des moyens de production. Le capitalisme mercantile se développe d'abord aux temps modernes (1492-1792) autour du commerce de produits tropicaux et d'esclaves, avant que l'avènement du machinisme, au XVIIIe siècle, ne fasse émerger le capitalisme industriel puis financier.$$,
        'highlights', array[$$4 fondements : liberté, concurrence, profit, propriété privée$$, $$capitalisme mercantile (1492-1792) → industriel (XVIIIe s.) → financier$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les quatre fondements du système capitaliste ?$$, 'solution', $$La liberté d'entreprise, la libre concurrence, la recherche du profit et la propriété privée des moyens de production.$$)
      ),
      jsonb_build_object(
        'heading', $$Les moyens d'action du capitalisme$$,
        'body', $$Le système capitaliste repose sur la monnaie (métallique, fiduciaire, scripturale), sur l'essor des banques (banques d'émission comme la Banque d'Angleterre de 1708, banques d'affaires comme Rothschild, banques de dépôt comme le Crédit Lyonnais de 1863) et sur les sociétés anonymes, dont le capital est divisé en actions détenues par des actionnaires qui perçoivent un dividende. Pour accroître leur capital, les sociétés peuvent aussi émettre des obligations, achetées par des obligataires qui reçoivent un bénéfice fixe. Ces titres s'échangent à la bourse des valeurs (Londres, Tokyo, New York), où les prix suivent la loi de l'offre et de la demande.$$,
        'highlights', array[$$3 types de monnaie ; banques d'émission/affaires/dépôt$$, $$action → dividende ; obligation → bénéfice fixe$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulaire$$, 'text', $$Actionnaire : détenteur d'actions, reçoit un dividende proportionnel à ses actions. Obligataire : détenteur d'une obligation, reçoit un bénéfice fixe quelle que soit la situation de l'entreprise.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre un actionnaire et un obligataire ?$$, 'solution', $$L'actionnaire détient une part du capital de l'entreprise et reçoit un dividende proportionnel à ses actions (variable selon les bénéfices) ; l'obligataire a simplement prêté de l'argent à l'entreprise et reçoit un bénéfice fixe, quelle que soit la situation de l'entreprise.$$)
      ),
      jsonb_build_object(
        'heading', $$Le fonctionnement du système : concentration et productivité$$,
        'body', $$Face à la concurrence, les entreprises se concentrent : concentration horizontale (cartels, entente entre entreprises d'un même secteur), concentration verticale (trusts, fusion d'entreprises aux activités complémentaires, comme la Standard Oil de Rockefeller qui contrôlait tout le marché du pétrole) et concentration géographique (regroupement près des sources d'énergie). Parallèlement, la productivité s'améliore grâce à la rationalisation du travail : en 1903, l'ingénieur américain Taylor invente la division du travail en tâches complémentaires (taylorisation, travail à la chaîne), suivie plus tard par la standardisation et la robotisation.$$,
        'highlights', array[$$cartel (horizontale) vs trust (verticale)$$, $$Taylor (1903) : taylorisation, travail à la chaîne$$]::text[],
        'example', jsonb_build_object('statement', $$La Standard Oil de Rockefeller, qui contrôlait tout le marché du pétrole en fusionnant des entreprises aux activités complémentaires (extraction, raffinage, distribution), illustre quel type de concentration ?$$, 'solution', $$Une concentration verticale (un trust), qui vise à s'assurer un monopole de la production jusqu'à la commercialisation.$$),
        'fixation', jsonb_build_object('question', $$Qu'a inventé l'ingénieur Taylor en 1903 ?$$, 'solution', $$La division du travail en plusieurs tâches complémentaires (la taylorisation, ou travail à la chaîne).$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences sociales et politiques$$,
        'body', $$Le capitalisme divise la société en deux classes opposées : la bourgeoisie (riches propriétaires et patrons, minoritaires) et le prolétariat (ouvriers, majoritaires, soumis à de longues heures de travail, des salaires faibles et des logements insalubres). Face à ces inégalités naît le socialisme, porté par Robert Owen, Proudhon, Saint-Simon puis Karl Marx, qui prône la disparition de la propriété privée des moyens de production. À l'appel de Marx (« Prolétaires de tous les pays, unissez-vous ! »), les ouvriers s'organisent en syndicats et obtiennent progressivement la réduction du temps de travail à 8h par jour, l'augmentation des salaires, le droit de grève, les congés payés, la fin du travail des enfants et la fête du 1er Mai.$$,
        'highlights', array[$$bourgeoisie (minoritaire) vs prolétariat (majoritaire)$$, $$socialisme : Owen, Proudhon, Saint-Simon, Marx$$, $$acquis sociaux : 8h/jour, grève, congés payés$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux acquis sociaux obtenus par les luttes syndicales des ouvriers au XIXe siècle.$$, 'solution', $$Par exemple la réduction du temps de travail à 8h par jour et les congés payés (également valables : le droit de grève, la fin du travail des enfants, le 1er Mai).$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences économiques$$,
        'body', $$La vie économique capitaliste connaît un rythme irrégulier, alternant périodes de prospérité (prix abordables, forte consommation, bénéfices élevés) et périodes de crise (surproduction, stagnation, chômage), comme en 1815, 1873 et 1929. Malgré ces crises, le capitalisme a considérablement enrichi les États européens au XIXe siècle et a poussé l'Europe à rechercher de nouveaux débouchés à travers le monde, ouvrant la voie à l'expansion coloniale.$$,
        'highlights', array[$$alternance prospérité / crise$$, $$crises historiques : 1815, 1873, 1929$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite trois grandes crises économiques mentionnées dans le cours.$$, 'solution', $$1815, 1873 et 1929.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une conférence sur le capitalisme, un professeur de sciences économiques lit un extrait du Manifeste du Parti communiste (1848) de Karl Marx : « La société se divise de plus en plus en deux camps ennemis, en deux classes diamétralement opposées : la bourgeoisie et le prolétariat. La société bourgeoise moderne, qui a fait surgir de si puissants moyens de production et d'échanges, ressemble aux magiciens qui ne savent plus maîtriser les puissances infernales qu'ils ont provoquées. [...] Le développement de l'industrie ne fait pas qu'accroître le monde des prolétaires, il les concentre en masses les plus importantes, leur force augmente et ils en prennent davantage conscience. »$$,
      'questions', array[
        $$De quoi parle le conférencier dans son exposé ?$$,
        $$Explique le passage : « La société bourgeoise moderne [...] ressemble aux magiciens qui ne savent plus maîtriser les puissances infernales qu'ils ont provoquées. »$$,
        $$Karl Marx affirme que le développement de l'industrie augmente la force des prolétaires et leur prise de conscience. Quelle sera la portée de ces propos dans la lutte de la classe ouvrière au XIXe siècle ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les quatre fondements du capitalisme ?$$,
      'hint', $$Ils sont énumérés en début de cours.$$,
      'expected', $$La liberté d'entreprise, la libre concurrence, la recherche du profit et la propriété privée.$$
    ),
    jsonb_build_object(
      'question', $$Quelle entreprise est citée comme exemple célèbre de trust (concentration verticale) ayant contrôlé tout le marché du pétrole ?$$,
      'hint', $$Elle appartenait à Rockefeller.$$,
      'expected', $$La Standard Oil.$$
    ),
    jsonb_build_object(
      'question', $$Quel penseur est à l'origine de l'appel « Prolétaires de tous les pays, unissez-vous » ?$$,
      'hint', $$C'est l'auteur du Manifeste du Parti communiste.$$,
      'expected', $$Karl Marx.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on l'organisation du travail en tâches complémentaires, inventée par l'ingénieur Taylor en 1903 ?$$,
      'hint', $$C'est aussi appelé « travail à la chaîne ».$$,
      'expected', $$La taylorisation.$$
    )
  ),
  now()
);
