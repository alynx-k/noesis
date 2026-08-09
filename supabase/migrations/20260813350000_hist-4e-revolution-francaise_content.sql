-- REAL SOURCE: ecole-ci.org / Collège Numérique (coll.ecole-ci.org), course
-- id=2248 "4ème_HISTOIRE_T2_L2: LA REVOLUTION FRANCAISE DE 1789" (category
-- 23, Histoire - Géographie, QUATRIEME), résumé PDF "4ème H6 - La révolution
-- française de 1789.pdf" (mod/resource id=19247), Thème 2: Les
-- bouleversements sociopolitiques et économiques en Afrique et en Europe du
-- XVIIème au XIXème siècle. Facts, dates and figures below (162 millions de
-- livres de déficit, 2%/98% de la population, 83 départements, 21 septembre
-- 1792, etc.) are taken directly from that official lesson PDF. 100%
-- original wording — no sentence copied from the source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En famille, tu regardes sur RTI 1 un documentaire consacré à l'histoire de la France. Le présentateur affirme : « le 14 juillet 1789 marque une étape décisive dans l'histoire de la France : c'est le début de la révolution française ». De retour en classe, tu cherches à comprendre d'où vient cette révolution, comment elle s'est déroulée, et ce qu'elle a changé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Une France en crise à la veille de 1789$$,
        'body', $$Avant 1789, la France est une monarchie de droit divin : le roi détient seul les pouvoirs politique et judiciaire, et sa personne est considérée comme sacrée. La société est divisée en trois ordres inégaux. Le clergé et la noblesse, qui ne représentent que 2 % de la population, sont des privilégiés dispensés d'impôts, tandis que le tiers état, composé surtout de paysans et d'ouvriers et formant 98 % de la population, supporte à lui seul toutes les charges fiscales. À cela s'ajoute une crise économique et financière : les inondations de 1787 puis la sécheresse et la grêle de juillet 1788 font chuter les récoltes et flamber les prix, tandis que l'État affiche en 1788 un déficit budgétaire de 162 millions de livres, aggravé par le soutien financier apporté à la guerre d'indépendance des États-Unis et par les dépenses de la cour royale. Les nobles refusent toute réforme fiscale qui les obligerait eux aussi à contribuer. Les idées des philosophes des Lumières, comme Voltaire, Rousseau et Diderot, qui dénoncent l'arbitraire royal et réclament l'égalité entre les hommes, achèvent de préparer les esprits au changement.$$,
        'highlights', array[$$monarchie de droit divin$$, $$trois ordres$$, $$déficit de 162 millions de livres$$, $$philosophie des Lumières$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La Révolution française de 1789 trouve son origine dans le pouvoir absolu du roi, l'inégalité entre les trois ordres de la société (2 % de privilégiés face à 98 % de tiers état imposé), une grave crise économique et financière, et la diffusion des idées des philosophes des Lumières.$$),
        'table', jsonb_build_object(
          'headers', array[$$Ordre$$, $$Part de la population$$, $$Situation face à l'impôt$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Clergé et noblesse$$, $$2 %$$, $$Privilégiés, exemptés d'impôts$$),
            jsonb_build_array($$Tiers état$$, $$98 %$$, $$Supporte l'ensemble des impôts$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi les nobles s'opposent-ils à toute réforme des impôts en 1788 ?$$, 'solution', $$Parce qu'une telle réforme les obligerait, eux qui étaient jusque-là exemptés, à participer eux aussi au paiement des impôts, ce qui menacerait leurs privilèges.$$),
        'fixation', jsonb_build_object('question', $$Quelle part de la population française les privilégiés (clergé et noblesse) représentaient-ils avant 1789 ?$$, 'solution', $$Environ 2 % de la population.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes étapes de la Révolution$$,
        'body', $$Cherchant de nouvelles recettes fiscales, le roi convoque les états généraux, qui se réunissent le 5 mai 1789. Après un blocage prolongé entre les trois ordres, les députés du tiers état prêtent le serment du Jeu de paume puis se proclament, le 9 juillet 1789, Assemblée nationale constituante, chargée de rédiger une constitution. Le 14 juillet 1789, alors que le roi masse des troupes autour de Paris, le peuple parisien s'empare de la Bastille, ancienne prison d'État symbole de l'arbitraire royal, sauvant ainsi la jeune Assemblée d'un coup de force. La France devient alors une monarchie constitutionnelle (1789-1792), avant que la Convention ne proclame la Première République le 21 septembre 1792, mettant fin au règne de Louis XVI. En 1799, Napoléon Bonaparte instaure à son tour le régime du Consulat, dont il devient le premier Consul.$$,
        'highlights', array[$$états généraux$$, $$serment du Jeu de paume$$, $$prise de la Bastille$$, $$Première République$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Date$$, $$Événement$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$5 mai 1789$$, $$Réunion des états généraux$$),
            jsonb_build_array($$9 juillet 1789$$, $$Les députés du tiers état se proclament Assemblée nationale constituante$$),
            jsonb_build_array($$14 juillet 1789$$, $$Prise de la Bastille$$),
            jsonb_build_array($$21 septembre 1792$$, $$Proclamation de la Première République$$),
            jsonb_build_array($$1799$$, $$Napoléon Bonaparte instaure le Consulat$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi la prise de la Bastille, le 14 juillet 1789, est-elle restée un événement symbolique ?$$, 'solution', $$Parce qu'elle marque la chute d'une prison d'État perçue comme le symbole de l'arbitraire de la monarchie absolue, et parce qu'elle protège l'Assemblée constituante naissante face à la menace des troupes royales.$$),
        'fixation', jsonb_build_object('question', $$En quelle année la Première République est-elle proclamée, et que devient alors la monarchie ?$$, 'solution', $$En 1792 (le 21 septembre) ; la monarchie constitutionnelle prend fin.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences politiques de la Révolution$$,
        'body', $$Sur le plan politique, la Révolution met fin à la monarchie absolue et au système seigneurial hérité de l'Ancien Régime. Elle fait naître la première République française, instaure la séparation des pouvoirs, réorganise le territoire national en 83 départements et établit le droit de vote pour les citoyens. Portée par ces changements, la Révolution française va aussi influencer, dans les décennies suivantes, des mouvements révolutionnaires en Europe centrale et en Amérique du Sud.$$,
        'highlights', array[$$fin de la monarchie absolue$$, $$83 départements$$, $$séparation des pouvoirs$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Sur le plan politique, la Révolution française de 1789 met fin à la monarchie absolue et au système seigneurial, instaure la séparation des pouvoirs et le droit de vote des citoyens, réorganise la France en 83 départements, et inspirera par la suite d'autres mouvements révolutionnaires dans le monde.$$),
        'fixation', jsonb_build_object('question', $$En combien de départements la France est-elle réorganisée après la Révolution ?$$, 'solution', $$En 83 départements.$$)
      ),
      jsonb_build_object(
        'heading', $$La Déclaration des droits de l'homme et du citoyen$$,
        'body', $$Sur le plan social, économique et religieux, l'Assemblée abolit dans la nuit du 4 août 1789 les privilèges du clergé et de la noblesse, avant d'adopter, le 26 août 1789, la Déclaration des droits de l'homme et du citoyen, qui proclame l'égalité de tous devant la loi. Ce texte fondateur défend en particulier la liberté et l'égalité des citoyens en droit, la liberté d'association politique, le droit à la propriété et à la sûreté, le droit à une justice équitable, ainsi que la liberté d'expression, d'opinion et de religion.$$,
        'highlights', array[$$Déclaration des droits de l'homme et du citoyen$$, $$26 août 1789$$, $$égalité en droit$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux droits ou libertés affirmés par la Déclaration des droits de l'homme et du citoyen de 1789.$$, 'solution', $$Par exemple la liberté et l'égalité des citoyens en droit, et le droit à la propriété et à la sûreté ; on peut aussi citer la liberté d'expression, d'opinion et de religion.$$),
        'fixation', jsonb_build_object('question', $$À quelle date la Déclaration des droits de l'homme et du citoyen est-elle adoptée ?$$, 'solution', $$Le 26 août 1789.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur TV5, un présentateur déclare : « La révolution française de 1789 constitue un fait marquant dans l'histoire du pays. Elle a mis fin aux inégalités en France et transformé profondément la société française. »$$,
      'questions', array[
        $$Cite deux causes de la Révolution française de 1789.$$,
        $$Place dans l'ordre chronologique : prise de la Bastille, réunion des états généraux, proclamation de la Première République.$$,
        $$Explique en quoi la Déclaration des droits de l'homme et du citoyen a mis fin à certaines inégalités de l'Ancien Régime.$$,
        $$Cite deux conséquences politiques de la Révolution française sur l'organisation de l'État.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$À quelle date les états généraux sont-ils réunis, ouvrant la voie à la Révolution ?$$,
      'hint', $$C'est au début du mois de mai 1789.$$,
      'expected', $$Le 5 mai 1789.$$
    ),
    jsonb_build_object(
      'question', $$Que se passe-t-il à Paris le 14 juillet 1789 ?$$,
      'hint', $$Pense à une ancienne prison d'État, symbole de l'arbitraire royal.$$,
      'expected', $$Le peuple de Paris s'empare de la Bastille.$$
    ),
    jsonb_build_object(
      'question', $$Quel pourcentage de la population française le tiers état représentait-il avant 1789, et quel poids fiscal supportait-il ?$$,
      'hint', $$Pense à la part écrasante de la population qui n'était ni noble ni membre du clergé.$$,
      'expected', $$Le tiers état représentait environ 98 % de la population et supportait à lui seul l'ensemble des impôts.$$
    ),
    jsonb_build_object(
      'question', $$En quelle année la Première République est-elle proclamée en France, mettant fin à la monarchie ?$$,
      'hint', $$C'est en septembre, trois ans après la prise de la Bastille.$$,
      'expected', $$En 1792 (le 21 septembre).$$
    )
  ),
  content_generated_at = now()
where id = 'hist-4e-revolution-francaise';
