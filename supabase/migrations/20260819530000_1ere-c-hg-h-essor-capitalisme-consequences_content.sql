-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie (matière Histoire), categoryid=136.
-- Moodle course id 942: "1ère H1 - L'essor du capitalisme et ses
-- conséquences" (https://lyc.ecole-ci.org/course/view.php?id=942),
-- resource id 4941. Contenu réécrit à partir du PDF source (fondements,
-- moyens d'action, fonctionnement et conséquences du capitalisme). La
-- citation de Karl Marx (Manifeste du Parti communiste, 1848 — Marx
-- décédé en 1883, texte dans le domaine public) est reproduite telle
-- quelle, comme dans le PDF source ; noms de banques, dates et chiffres
-- réels repris tels quels (données factuelles).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-h-essor-capitalisme-consequences',
  '1ere',
  'C',
  'histoire-geographie',
  $$L'essor du capitalisme et ses conséquences$$,
  9,
  '1ere-c-hg-geo-consequences-mondialisation',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'un débat télévisé relatif à la crise économique mondiale, un des invités affirme : « Les crises sont inhérentes à l'économie capitaliste. Elles sont un mal nécessaire parce qu'elles permettent l'innovation technologique. Comme toutes les autres crises depuis le XIXe siècle, celle-ci passera. » Un élève de la classe, qui a suivi avec intérêt l'émission, ne comprend rien à cette affirmation. Il l'expose à ses camarades et, ensemble, ils mènent des recherches pour identifier les fondements du capitalisme, expliquer son fonctionnement et apprécier ses conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les fondements du capitalisme$$,
        'body', $$Le capitalisme, apparu en Europe à la fin du Moyen Âge, est une doctrine économique et sociale reposant sur quatre bases : la liberté d'entreprise (liberté pour chacun de créer et gérer une entreprise dans le respect de la loi) ; la libre concurrence (confrontation stimulante d'entreprises d'un même domaine, régie par la loi de l'offre et de la demande) ; la recherche du profit (le bénéfice, différence entre la valeur de la production vendue et son coût de création) ; et la propriété privée des moyens de production (appartenant à une ou plusieurs personnes physiques ou morales).$$,
        'highlights', array[$$4 fondements : liberté d'entreprise, libre concurrence, recherche du profit, propriété privée$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce que le « profit », au sens économique du terme ?$$, 'solution', $$La différence entre la valeur de la production vendue (ou échangée) et le coût nécessaire à sa création ; c'est le bénéfice recherché par le capitaliste.$$)
      ),
      jsonb_build_object(
        'heading', $$Du capitalisme mercantile au capitalisme financier$$,
        'body', $$Le capitalisme mercantile (ou marchand) se développe en Europe aux temps modernes (1492-1792), porté par le cabotage puis les grandes découvertes, autour des produits tropicaux, de l'or et des esclaves ; ses grandes places étaient Gênes, Venise, Liverpool, Nantes, Bordeaux. Avec l'avènement du machinisme, le capitalisme industriel se développe à partir du XVIIIe siècle. La naissance de l'industrie exigeant de gros capitaux, les capitalistes ont recours aux banques et aux bourses, donnant naissance au capitalisme financier.$$,
        'highlights', array[$$capitalisme mercantile (1492-1792) → capitalisme industriel (18e s.) → capitalisme financier$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi le développement de l'industrie a-t-il fait naître le capitalisme financier ?$$, 'solution', $$Parce que la création d'industries nécessitait de gros capitaux que les entrepreneurs ne pouvaient réunir seuls : ils ont dû recourir aux banques et aux bourses, ce qui a donné naissance à une nouvelle forme de capitalisme, fondée sur la finance.$$),
        'fixation', jsonb_build_object('question', $$Quels produits étaient recherchés à l'époque du capitalisme mercantile ?$$, 'solution', $$Les produits tropicaux, l'or et les esclaves.$$)
      ),
      jsonb_build_object(
        'heading', $$Les moyens d'action et le fonctionnement du capitalisme$$,
        'body', $$Le capitalisme s'appuie sur la monnaie (métallique, fiduciaire, scripturale), les banques (d'émission, d'affaires, de dépôt) et les sociétés anonymes, dont le capital est divisé en actions détenues par des actionnaires percevant un dividende. La bourse des valeurs y fixe les prix selon l'offre et la demande. Face à la concurrence, les entreprises se concentrent : concentration horizontale (cartels, entente entre entreprises d'un même secteur), concentration verticale (trusts, fusion d'activités complémentaires, comme la Standard Oil de Rockefeller) et concentration géographique (regroupement près des sources d'énergie). En 1903, l'ingénieur américain Taylor invente la taylorisation (division du travail en tâches complémentaires), bientôt suivie de la standardisation puis de la robotisation.$$,
        'highlights', array[$$moyens : monnaie, banques, sociétés anonymes (actions/dividendes), bourse des valeurs$$, $$concentrations : horizontale (cartels), verticale (trusts), géographique$$, $$taylorisation (1903) → standardisation → robotisation$$]::text[],
        'example', jsonb_build_object('statement', $$Quelle est la différence entre un actionnaire et un obligataire ?$$, 'solution', $$L'actionnaire détient une part du capital de l'entreprise (une action) et reçoit un dividende proportionnel à la valeur de ses actions ; l'obligataire a prêté de l'argent à l'entreprise (obligation) et reçoit un bénéfice fixe, quelle que soit la situation de l'entreprise.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce que la taylorisation, inventée en 1903 ?$$, 'solution', $$Une nouvelle organisation du travail consistant à diviser le travail en plusieurs tâches complémentaires, pour accroître la productivité (« travail à la chaîne »).$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences du capitalisme$$,
        'body', $$Le capitalisme divise la société en deux classes opposées : la bourgeoisie (minoritaire, propriétaire des capitaux) et le prolétariat (majoritaire, ouvriers exploités, aux conditions de vie et de travail extrêmement difficiles au XIXe siècle). Ces inégalités suscitent la naissance du socialisme (Robert Owen, Proudhon, Saint-Simon, puis Karl Marx), qui prône la disparition de la propriété privée des moyens de production. Les luttes syndicales des prolétaires obtiennent progressivement la réduction du temps de travail, l'augmentation des salaires, le droit de grève, les congés payés et la fin du travail des enfants. Sur le plan économique, le capitalisme alterne périodes de prospérité et crises de surproduction (1815, 1873, 1929).$$,
        'highlights', array[$$conséquences sociales : bourgeoisie vs prolétariat$$, $$conséquences politiques : naissance du socialisme, luttes syndicales$$, $$conséquences économiques : alternance prospérité / crises (1815, 1873, 1929)$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux acquis obtenus par les luttes syndicales du prolétariat au XIXe siècle.$$, 'solution', $$Deux parmi : la réduction des heures de travail (8h/jour), l'augmentation des salaires, la reconnaissance du droit d'association et de grève, les congés payés, la suppression du travail des enfants, l'obtention de la fête du travail (1er Mai).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une conférence sur le capitalisme, un professeur d'économie lit ce passage du Manifeste du Parti communiste (1848) de Karl Marx : « La société se divise de plus en plus en deux camps ennemis, en deux classes diamétralement opposées : la bourgeoisie et le prolétariat. La société bourgeoise moderne, qui a fait surgir de si puissants moyens de productions et d'échanges, ressemble aux magiciens qui ne savent plus maîtriser les puissances infernales qu'ils ont provoquées. […] Le développement de l'industrie ne fait pas qu'accroître le monde des prolétaires, il les concentre en masses les plus importantes, leur force augmente et ils en prennent davantage conscience. »$$,
      'questions', array[
        $$De quoi parle le conférencier dans cet extrait ?$$,
        $$Explique le passage : « La société bourgeoise moderne […] provoquées. »$$,
        $$Selon Marx, le développement de l'industrie concentre les prolétaires et augmente leur force et leur conscience de classe. Quelle sera la portée de ces propos dans la lutte de la classe ouvrière au XIXe siècle ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les quatre fondements du capitalisme ?$$,
      'hint', $$Ils touchent l'entreprise, le marché, le gain et la propriété.$$,
      'expected', $$La liberté d'entreprise, la libre concurrence, la recherche du profit et la propriété privée des moyens de production.$$
    ),
    jsonb_build_object(
      'question', $$Quelle forme de capitalisme s'est développée en Europe aux temps modernes (1492-1792), et quels produits recherchait-elle ?$$,
      'hint', $$Elle est liée aux grandes découvertes.$$,
      'expected', $$Le capitalisme mercantile (marchand), qui recherchait les produits tropicaux, l'or et les esclaves.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un « trust », dans le vocabulaire de la concentration des entreprises ?$$,
      'hint', $$Il s'agit d'une concentration verticale.$$,
      'expected', $$Une fusion d'entreprises aux activités complémentaires, visant à éliminer la concurrence et à s'assurer un monopole de la production jusqu'à la commercialisation (exemple : la Standard Oil de Rockefeller).$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux classes sociales issues du capitalisme, selon la leçon ?$$,
      'hint', $$L'une est minoritaire et riche, l'autre majoritaire et pauvre.$$,
      'expected', $$La bourgeoisie (riches propriétaires des capitaux) et le prolétariat (ouvriers, classe sociale des pauvres).$$
    )
  ),
  now()
);
