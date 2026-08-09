-- Exercise questions used to live in two separate hardcoded places that had
-- to be kept in sync by hand: constants/exercises.ts (question text + hint,
-- shown to the student) and the grade-answer edge function's own
-- QUESTION_CRITERIA dictionary (question text + expected answer, used by the
-- AI grader) — plus a THIRD copy of the course body text for grading
-- context. Consolidating all of it into the course row removes that
-- duplication and lets grade-answer work for any course id in this table,
-- not just the original 11.
alter table public.courses
  add column exercise_questions jsonb;

update public.courses set exercise_questions =
  case id
    when 'mondialisation' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Comment définirais-tu la mondialisation, si on te le demandait à l'examen ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase donne la définition exacte, à partir de « c'est le fait que les économies... ».$$,
        'expected', $$Définition exacte : l'intégration et l'interdépendance des économies formant un marché mondial, avec des flux de capitaux, d'informations, de marchandises et de personnes.$$
      ),
      jsonb_build_object(
        'question', $$Explique avec tes mots pourquoi l'Afrique est si peu présente dans le commerce mondial, malgré sa population et ses ressources.$$,
        'hint', $$Relis le début et le milieu du cours : les chiffres (moins de 4 % du commerce mondial) et les raisons (usines, infrastructures, dette, conflits) y sont expliqués.$$,
        'expected', $$L'Afrique représente moins de 4% du commerce mondial ; elle exporte des matières premières brutes plutôt que transformées ; manque d'usines, d'infrastructures, dette lourde, parfois conflits.$$
      ),
      jsonb_build_object(
        'question', $$Quelle est la différence entre ce que l'Afrique exporte et ce qu'elle importe ? En quoi c'est un désavantage pour elle ?$$,
        'hint', $$Relis le passage du cours qui parle de ce que l'Afrique exporte (matières premières brutes) et importe (produits déjà fabriqués).$$,
        'expected', $$Elle exporte des matières premières brutes (café, cacao, or, diamant, fer, bois) et importe des produits déjà transformés (voitures, médicaments, équipements) ; désavantage : elle ne profite pas de la valeur ajoutée de ce qu'elle produit.$$
      ),
      jsonb_build_object(
        'question', $$Cite au moins une piste pour améliorer la situation, et explique pourquoi elle pourrait aider.$$,
        'hint', $$Relis le passage du cours qui commence par « Mais ce n'est pas figé » : il liste plusieurs pistes.$$,
        'expected', $$Formation de la jeunesse, industries locales, regroupements régionaux comme la CEDEAO, accès aux nouvelles technologies.$$
      )
    )
    when 'acteurs' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Comment définirais-tu une firme transnationale, si on te le demandait à l'examen ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase donne la définition exacte, à partir de « une firme transnationale (ou multinationale) est... ».$$,
        'expected', $$Une entreprise qui exerce son activité dans au moins 5 pays différents, directement ou par l'intermédiaire de filiales, avec un chiffre d'affaires généralement supérieur à 500 millions de dollars.$$
      ),
      jsonb_build_object(
        'question', $$Explique avec tes mots pourquoi les États restent des acteurs importants de la mondialisation, même quand certaines entreprises semblent plus puissantes qu'eux.$$,
        'hint', $$Relis le passage du cours sur les États : routes, ports, aéroports, et zones franches.$$,
        'expected', $$Les États construisent les infrastructures (routes, ports, aéroports) qui permettent la circulation des marchandises, et créent des zones franches (avantages fiscaux) pour attirer les entreprises étrangères.$$
      ),
      jsonb_build_object(
        'question', $$Donne un exemple de firme transnationale et explique ce qui en fait une firme transnationale.$$,
        'hint', $$Relis le passage du cours sur Coca-Cola et Nestlé, et sur les firmes transnationales en général.$$,
        'expected', $$Un exemple comme Coca-Cola ou Nestlé : une entreprise présente dans plusieurs pays à la fois, qui produit parfois une partie de ses produits dans un pays et une autre ailleurs avant d'assembler et de vendre partout.$$
      ),
      jsonb_build_object(
        'question', $$Quel est le rôle d'une institution comme le FMI ou l'OMC dans la mondialisation ?$$,
        'hint', $$Relis le passage du cours sur les institutions internationales : le FMI et l'OMC.$$,
        'expected', $$Le FMI prête de l'argent aux pays en difficulté ; l'OMC encourage les échanges entre pays et essaie de limiter ce qui les freine.$$
      )
    )
    when 'atouts' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Qu'est-ce qu'un atout naturel ? Qu'est-ce qu'un atout humain ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase donne les deux définitions exactes, à partir de « un atout naturel est... ».$$,
        'expected', $$Un atout naturel est une ressource offerte par le milieu physique (climat, sol, eau, sous-sol) qu'un pays peut exploiter pour se développer. Un atout humain est une ressource liée à la population (nombre, main-d'œuvre, savoir-faire) qu'un pays peut mobiliser pour se développer.$$
      ),
      jsonb_build_object(
        'question', $$Donne un exemple d'atout naturel de la Côte d'Ivoire et explique comment il contribue à son économie.$$,
        'hint', $$Relis le passage du cours sur les atouts naturels : climat, sols fertiles, façade maritime avec les ports d'Abidjan et San Pedro, sous-sol.$$,
        'expected', $$Un exemple comme le climat chaud et humide (idéal pour le cacao, le café, l'hévéa, le palmier à huile), les sols fertiles du sud forestier, la façade maritime avec les ports d'Abidjan et San Pedro qui facilitent l'exportation, ou le pétrole et le gaz au large des côtes.$$
      ),
      jsonb_build_object(
        'question', $$Pourquoi peut-on dire que la population est un atout pour le développement économique d'un pays ?$$,
        'hint', $$Relis le passage du cours sur les atouts humains : population jeune et nombreuse, tradition paysanne, main-d'œuvre qualifiée.$$,
        'expected', $$Une population jeune et nombreuse fournit une main-d'œuvre importante pour l'agriculture et l'industrie ; la tradition paysanne de culture du cacao et du café se transmet de génération en génération ; Abidjan concentre une main-d'œuvre qualifiée.$$
      ),
      jsonb_build_object(
        'question', $$Cite un produit agricole pour lequel la Côte d'Ivoire est parmi les premiers producteurs mondiaux.$$,
        'hint', $$Relis le tout début du cours : il parle du chocolat, dont la Côte d'Ivoire est le premier producteur mondial.$$,
        'expected', $$Le cacao : la Côte d'Ivoire en est le premier producteur mondial, avec près de la moitié de la production mondiale.$$
      )
    )
    when 'secteurs' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Définis les trois secteurs d'activité économique et donne un exemple ivoirien pour chacun.$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase donne les trois définitions exactes, à partir de « le secteur primaire regroupe... ».$$,
        'expected', $$Secteur primaire : exploitation directe des ressources naturelles (ex. agriculture du cacao, pêche, extraction). Secteur secondaire : transformation de ces ressources (ex. transformation du cacao en pâte ou beurre de cacao). Secteur tertiaire : activités de service (ex. commerce, transport, banques, concentrés à Abidjan).$$
      ),
      jsonb_build_object(
        'question', $$Pourquoi peut-on dire que la transformation du cacao fait passer une activité du secteur primaire au secteur secondaire ?$$,
        'hint', $$Relis le passage du cours sur le secteur secondaire : la transformation du cacao en pâte ou en beurre de cacao.$$,
        'expected', $$Cultiver et récolter le cacao est une exploitation directe de la ressource (secteur primaire) ; le transformer en pâte ou en beurre de cacao dans une usine est une activité de transformation industrielle, ce qui relève du secteur secondaire.$$
      ),
      jsonb_build_object(
        'question', $$Explique pourquoi Abidjan concentre une grande partie des activités du secteur tertiaire en Côte d'Ivoire.$$,
        'hint', $$Relis le passage du cours sur le secteur tertiaire : Abidjan est la capitale économique du pays.$$,
        'expected', $$Abidjan est la capitale économique du pays, elle concentre le commerce, les transports, les banques, le tourisme et l'administration.$$
      ),
      jsonb_build_object(
        'question', $$Donne un exemple d'activité du secteur primaire en Côte d'Ivoire, autre que le cacao.$$,
        'hint', $$Relis le passage du cours sur le secteur primaire : agriculture (café, hévéa, anacarde, palmier à huile), pêche, extraction (pétrole, or).$$,
        'expected', $$Un exemple comme le café, l'hévéa, l'anacarde, le palmier à huile, la pêche, ou l'extraction de pétrole/or.$$
      )
    )
    when 'colonisation' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Qu'est-ce que l'impérialisme colonial, et en quelle année la Côte d'Ivoire devient-elle officiellement une colonie française ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase donne la définition exacte et la date, à partir de « l'impérialisme est... ».$$,
        'expected', $$L'impérialisme est la politique par laquelle une puissance étend sa domination politique, économique et territoriale sur d'autres régions du monde ; la colonisation en est la mise en œuvre concrète. La Côte d'Ivoire devient colonie française en 1893.$$
      ),
      jsonb_build_object(
        'question', $$Explique le rôle de la conférence de Berlin (1884-1885) dans le partage de l'Afrique entre puissances européennes.$$,
        'hint', $$Relis le passage du cours sur la conférence de Berlin : les puissances européennes se partagent le continent africain sur une carte.$$,
        'expected', $$Les grandes puissances européennes s'y réunissent entre 1884 et 1885 pour se partager le continent africain sur une carte, sans tenir compte des peuples qui y vivent ; la France obtient une large zone en Afrique de l'Ouest incluant l'actuelle Côte d'Ivoire.$$
      ),
      jsonb_build_object(
        'question', $$Qui est Samory Touré, et pourquoi peut-on dire qu'il incarne la résistance à la colonisation en Côte d'Ivoire ?$$,
        'hint', $$Relis le passage du cours sur la conquête militaire : Samory Touré combat les troupes françaises dans l'ouest du pays avant d'être capturé en 1898.$$,
        'expected', $$Samory Touré combat les troupes françaises dans l'ouest du pays pour résister à la conquête coloniale, avant d'être capturé en 1898.$$
      ),
      jsonb_build_object(
        'question', $$Cite au moins deux méthodes utilisées par l'administration coloniale française pour contrôler la population et exploiter le territoire.$$,
        'hint', $$Relis le passage du cours sur les méthodes coloniales : travail forcé, impôt de capitation, code de l'indigénat.$$,
        'expected', $$Le travail forcé, l'impôt de capitation, le code de l'indigénat, ou la réorganisation économique autour de l'exportation de matières premières (café, cacao).$$
      )
    )
    when 'independance' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Explique les grandes étapes qui mènent la Côte d'Ivoire à l'indépendance, et donne la date exacte de cette indépendance.$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase résume les étapes et donne la date exacte.$$,
        'expected', $$Abolition du travail forcé et création du PDCI (1946), loi-cadre Defferre donnant l'autonomie interne (1956), indépendance le 7 août 1960 avec Félix Houphouët-Boigny comme premier président.$$
      ),
      jsonb_build_object(
        'question', $$Qui est Félix Houphouët-Boigny et quel rôle a-t-il joué dans l'accession de la Côte d'Ivoire à l'indépendance ?$$,
        'hint', $$Relis le passage du cours sur la fondation du PDCI et du RDA en 1946.$$,
        'expected', $$Planteur et médecin devenu figure politique majeure ; fonde le PDCI en 1946, participe à la création du RDA au congrès de Bamako, fait voter l'abolition du travail forcé, devient premier président de la Côte d'Ivoire indépendante en 1960.$$
      ),
      jsonb_build_object(
        'question', $$Qu'est-ce que la loi-cadre Defferre de 1956, et en quoi change-t-elle la situation des colonies françaises d'Afrique noire ?$$,
        'hint', $$Relis le passage du cours sur les étapes vers l'autonomie : la loi-cadre Defferre donne un gouvernement local à chaque territoire.$$,
        'expected', $$Elle donne davantage d'autonomie interne aux territoires d'Afrique noire française : chaque territoire obtient son propre gouvernement local, même si la France garde le contrôle des grandes décisions.$$
      ),
      jsonb_build_object(
        'question', $$Pourquoi peut-on dire que 1960 est une année particulièrement importante à l'échelle de tout le continent africain ?$$,
        'hint', $$Relis le passage du cours sur « l'année de l'Afrique » : dix-sept pays africains deviennent indépendants en 1960.$$,
        'expected', $$On l'appelle « l'année de l'Afrique » car dix-sept pays africains deviennent indépendants la même année.$$
      )
    )
    when 'crises-afrique' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Quelles sont les principales causes des crises sociopolitiques qu'ont connues de nombreux pays africains après leur indépendance ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase résume les causes et les formes de ces crises.$$,
        'expected', $$Frontières héritées de la colonisation, système du parti unique, pauvreté et inégalités économiques, ingérences extérieures liées à la guerre froide.$$
      ),
      jsonb_build_object(
        'question', $$Explique en quoi les frontières héritées de la colonisation peuvent être une source de tensions dans un pays africain.$$,
        'hint', $$Relis le passage du cours sur les frontières héritées de la colonisation, tracées sans tenir compte des peuples et royaumes précoloniaux.$$,
        'expected', $$Ces frontières ont souvent été tracées sans tenir compte des peuples et royaumes précoloniaux, regroupant de force des populations différentes dans un même État ou séparant un même peuple entre plusieurs pays.$$
      ),
      jsonb_build_object(
        'question', $$Qu'est-ce qu'un coup d'État, et en quoi est-ce différent d'une guerre civile ?$$,
        'hint', $$Relis le passage du cours sur les formes que prennent ces crises : coups d'État, guerres civiles, régimes autoritaires.$$,
        'expected', $$Un coup d'État est le renversement du pouvoir civil par l'armée ; une guerre civile oppose des groupes armés à l'intérieur d'un même pays, sur une durée plus longue.$$
      ),
      jsonb_build_object(
        'question', $$Comment la guerre froide a-t-elle pu influencer certains conflits internes en Afrique ?$$,
        'hint', $$Relis le passage du cours sur le contexte international : les États-Unis et l'URSS soutiennent parfois des régimes ou des rébellions en Afrique.$$,
        'expected', $$Les États-Unis et l'URSS ont parfois soutenu, financièrement ou militairement, des régimes ou des rébellions en Afrique pour étendre leur influence, ce qui a aggravé certains conflits internes.$$
      )
    )
    when 'rwanda' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Explique le déroulement du génocide des Tutsi au Rwanda en 1994 : quel événement le déclenche, et quand se termine-t-il ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase résume le déclenchement et la fin du génocide.$$,
        'expected', $$Déclenché par l'attentat du 6 avril 1994 contre l'avion du président Habyarimana ; se déroule entre avril et juillet 1994 ; se termine quand le FPR reprend le contrôle du pays en juillet 1994.$$
      ),
      jsonb_build_object(
        'question', $$Comment la colonisation belge a-t-elle contribué à renforcer les tensions entre Hutu et Tutsi au Rwanda ?$$,
        'hint', $$Relis le passage du cours sur le contexte colonial : les cartes d'identité mentionnant l'appartenance ethnique.$$,
        'expected', $$L'administration belge renforce la distinction entre les groupes, notamment en introduisant des cartes d'identité mentionnant l'appartenance ethnique.$$
      ),
      jsonb_build_object(
        'question', $$Qu'est-ce que le Front Patriotique Rwandais (FPR), et quel est son rôle avant et pendant la crise de 1994 ?$$,
        'hint', $$Relis le passage du cours sur la guerre civile : le FPR envahit le Rwanda depuis l'Ouganda en octobre 1990.$$,
        'expected', $$Mouvement de réfugiés tutsi exilés qui envahit le Rwanda depuis l'Ouganda en octobre 1990, déclenchant la guerre civile ; il reprend le contrôle du pays en juillet 1994, mettant fin au génocide.$$
      ),
      jsonb_build_object(
        'question', $$Que prévoyaient les accords d'Arusha de 1993, et pourquoi n'ont-ils pas suffi à éviter le génocide ?$$,
        'hint', $$Relis le passage du cours sur les accords d'Arusha : un partage du pouvoir signé en août 1993, malgré des tensions qui restent très fortes.$$,
        'expected', $$Un partage du pouvoir entre le gouvernement rwandais et le FPR, signé en août 1993 ; les tensions sont restées très fortes et une partie du pouvoir hutu préparait en secret l'élimination des Tutsi.$$
      )
    )
    when 'guerre-mondiale' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Quelles sont les causes principales de la Seconde Guerre mondiale, et entre quelles dates se déroule-t-elle ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase résume les deux camps et les dates.$$,
        'expected', $$Traité de Versailles (1919), crise économique de 1929, montée du nazisme et politique d'expansion d'Hitler, invasion de la Pologne le 1er septembre 1939 ; la guerre se déroule de 1939 à 1945.$$
      ),
      jsonb_build_object(
        'question', $$En quoi le traité de Versailles de 1919 et la crise économique de 1929 ont-ils favorisé le déclenchement de la Seconde Guerre mondiale ?$$,
        'hint', $$Relis le passage du cours sur les causes : le traité de Versailles et la crise économique de 1929 favorisent la montée du nazisme.$$,
        'expected', $$Le traité de Versailles impose de lourdes sanctions à l'Allemagne et nourrit un ressentiment ; la crise de 1929 aggrave la situation économique et favorise la montée de régimes autoritaires comme le nazisme.$$
      ),
      jsonb_build_object(
        'question', $$Qu'est-ce que la Shoah ?$$,
        'hint', $$Relis le passage du cours sur les caractères de la guerre : le génocide organisé des Juifs d'Europe par le régime nazi.$$,
        'expected', $$L'extermination organisée des Juifs d'Europe par le régime nazi pendant la Seconde Guerre mondiale.$$
      ),
      jsonb_build_object(
        'question', $$Cite deux conséquences importantes de la Seconde Guerre mondiale à l'échelle mondiale.$$,
        'hint', $$Relis le passage du cours sur la fin et les conséquences de la guerre : bilan humain, création de l'ONU, début de la guerre froide.$$,
        'expected', $$Un bilan humain immense (plus de 50 millions de morts), la création de l'ONU en 1945, ou le début de la guerre froide entre les États-Unis et l'URSS.$$
      )
    )
    when 'onu' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Quand l'ONU est-elle créée, et quels sont ses deux principaux organes ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase donne la date et les deux organes principaux.$$,
        'expected', $$Créée en 1945 ; ses deux principaux organes sont l'Assemblée générale (tous les pays membres) et le Conseil de sécurité (chargé de la paix et de la sécurité internationale).$$
      ),
      jsonb_build_object(
        'question', $$Qu'est-ce que le droit de veto au Conseil de sécurité, et quels sont les cinq pays qui en disposent ?$$,
        'hint', $$Relis le passage du cours sur l'organisation de l'ONU : les cinq membres permanents du Conseil de sécurité.$$,
        'expected', $$Le droit de veto permet à un membre permanent de bloquer une décision du Conseil de sécurité ; les cinq pays sont les États-Unis, la Russie, la Chine, la France et le Royaume-Uni.$$
      ),
      jsonb_build_object(
        'question', $$Pourquoi peut-on dire que l'ONU est créée en réaction à l'échec de la Société des Nations (SDN) ?$$,
        'hint', $$Relis le passage du cours sur la création de l'ONU : elle remplace la SDN, qui avait échoué à empêcher un nouveau conflit mondial.$$,
        'expected', $$La SDN, créée après la Première Guerre mondiale, avait échoué à empêcher un nouveau conflit mondial ; l'ONU est créée en 1945 pour tenter de mieux maintenir la paix.$$
      ),
      jsonb_build_object(
        'question', $$Cite un exemple de mission ou de réalisation de l'ONU en dehors du maintien de la paix.$$,
        'hint', $$Relis le passage du cours sur les missions de l'ONU : droits humains, Déclaration universelle de 1948, développement économique et social.$$,
        'expected', $$La promotion des droits humains (Déclaration universelle des droits de l'homme, 1948) ou l'encouragement du développement économique et social dans le monde.$$
      )
    )
    when 'ua' then jsonb_build_array(
      jsonb_build_object(
        'question', $$Quand l'OUA est-elle créée, quand devient-elle l'Union Africaine, et quelle est la principale différence entre les deux organisations ?$$,
        'hint', $$Relis la toute fin du cours : la dernière phrase donne les deux dates et la principale différence.$$,
        'expected', $$L'OUA est créée en 1963 à Addis-Abeba, et devient l'Union Africaine en 2002 ; contrairement à l'OUA, l'UA se donne le droit d'intervenir dans un pays membre en cas de crimes graves.$$
      ),
      jsonb_build_object(
        'question', $$Pourquoi peut-on dire que l'OUA avait des moyens d'action limités face aux crises internes des pays africains ?$$,
        'hint', $$Relis le passage du cours sur l'OUA : elle est critiquée pour son manque de moyens d'action, au nom du principe de non-ingérence.$$,
        'expected', $$L'OUA respectait strictement le principe de non-ingérence, ce qui l'empêchait d'intervenir dans les crises internes des pays membres.$$
      ),
      jsonb_build_object(
        'question', $$Cite un nouvel outil ou une nouvelle institution que l'Union Africaine met en place, qui n'existait pas au temps de l'OUA.$$,
        'hint', $$Relis le passage du cours sur l'UA aujourd'hui : Parlement panafricain, Cour africaine des droits de l'homme et des peuples, droit d'intervention.$$,
        'expected', $$Le Parlement panafricain, la Cour africaine des droits de l'homme et des peuples, ou le droit d'intervention en cas de crimes graves.$$
      ),
      jsonb_build_object(
        'question', $$Que célèbre-t-on le 25 mai en Afrique, et pourquoi cette date a-t-elle été choisie ?$$,
        'hint', $$Relis le passage du cours sur la « Journée de l'Afrique » : elle rappelle la date de création de l'OUA en 1963.$$,
        'expected', $$La « Journée de l'Afrique », célébrée en souvenir de la création de l'OUA le 25 mai 1963 à Addis-Abeba.$$
      )
    )
  end
where id in ('mondialisation', 'acteurs', 'atouts', 'secteurs', 'colonisation', 'independance', 'crises-afrique', 'rwanda', 'guerre-mondiale', 'onu', 'ua');
