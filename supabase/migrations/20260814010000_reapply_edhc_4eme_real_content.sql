-- Re-applies the CURRENT on-disk content of the 13 EDHC 4eme migration
-- files, edited in place with real ecole-ci.org content after their
-- first (fallback) push -- see 20260814000000 for why this extra step
-- is needed (db push tracks by filename, not content).

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour la journée mondiale de l'enfant, les élèves de ton établissement veulent organiser des activités de sensibilisation. Avant de choisir lesquelles, ils décident de s'informer sur ce que signifie « promouvoir les droits de l'enfant » et sur qui peut les y aider.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Comment fait-on la promotion des droits de l'enfant ?$$,
        'body', $$Promouvoir les droits de l'enfant consiste à organiser des actions qui font connaître ces droits au plus grand nombre : conférences, projections de films, débats, témoignages, pièces de théâtre ou expositions, affichages, brochures, création de clubs de défense des droits de l'enfant, et diffusion de messages en langues nationales pour toucher toutes les couches de la population.$$,
        'highlights', array[$$promotion des droits de l'enfant$$, $$sensibilisation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Faire la promotion des droits de l'enfant, c'est mettre en œuvre des actions variées de sensibilisation et d'information destinées à faire connaître et respecter ces droits au sein de la population.$$),
        'example', jsonb_build_object('statement', $$Un club scolaire décide de créer des affiches et d'organiser une causerie-débat sur les droits de l'enfant. Ces actions relèvent-elles de la promotion des droits de l'enfant ?$$, 'solution', $$Oui, l'affichage et la causerie-débat sont deux moyens reconnus de sensibiliser la population aux droits de l'enfant.$$)
      ),
      jsonb_build_object(
        'heading', $$Qui contribue à cette promotion ?$$,
        'body', $$Certaines personnes, du fait de leur métier, sont des personnes ressources pour la promotion des droits de l'enfant : les juristes, les parlementaires, les travailleurs sociaux et le personnel de l'éducation. Des institutions spécialisées, comme les ONG de défense des droits de l'enfant (par exemple Save The Children) ou l'UNICEF, jouent aussi un rôle de référence dans ce domaine.$$,
        'highlights', array[$$personnes ressources$$, $$UNICEF$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type d'acteur$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Personne ressource$$, $$Juriste, travailleur social, enseignant$$),
            jsonb_build_array($$Institution$$, $$UNICEF, ONG de défense des droits de l'enfant$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi un enseignant peut-il être considéré comme une personne ressource pour la promotion des droits de l'enfant ?$$, 'solution', $$Parce que sa fonction auprès des élèves lui permet d'informer et de sensibiliser directement les enfants sur leurs droits.$$)
      ),
      jsonb_build_object(
        'heading', $$Ce que la promotion apporte à l'enfant$$,
        'body', $$La promotion des droits de l'enfant favorise l'épanouissement de sa personnalité, sa reconnaissance en tant que sujet de droit, le développement de ses aptitudes et le respect des valeurs de sa propre communauté comme de celles des autres, ainsi qu'une insertion harmonieuse dans la société.$$,
        'highlights', array[$$épanouissement$$, $$reconnaissance juridique$$]::text[],
        'example', jsonb_build_object('statement', $$Un enfant participe régulièrement à des clubs de droits de l'enfant où il apprend à connaître ses droits et à les faire respecter. En quoi cela contribue-t-il à son épanouissement ?$$, 'solution', $$Cela renforce sa confiance en lui, développe ses aptitudes et l'aide à mieux s'insérer dans sa communauté en connaissant et en faisant valoir ses droits.$$)
      ),
      jsonb_build_object(
        'heading', $$Ce que la promotion apporte à la famille et à la communauté$$,
        'body', $$Au niveau de la famille et de la communauté, la promotion des droits de l'enfant favorise l'entente entre les membres, renforce la cohésion sociale et contribue à la préservation de la paix, car une communauté qui respecte les droits de ses enfants prévient de nombreuses tensions.$$,
        'highlights', array[$$cohésion sociale$$, $$préservation de la paix$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi le respect des droits de l'enfant peut-il contribuer à la paix dans une communauté ?$$, 'solution', $$Parce qu'une communauté qui protège et respecte ses enfants réduit les frustrations et les conflits, ce qui favorise l'entente et la paix sociale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une ONG organise une campagne de sensibilisation sur les droits de l'enfant dans un quartier, mais certains jeunes refusent d'y participer, estimant que cela ne les concerne pas directement.$$,
      'questions', array[
        $$Identifie le problème posé par le refus de ces jeunes.$$,
        $$Cite deux actions concrètes de promotion des droits de l'enfant que l'ONG pourrait mener.$$,
        $$Explique pourquoi il serait important pour ces jeunes de participer à cette campagne.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite trois actions permettant de faire la promotion des droits de l'enfant.$$,
      'hint', $$Pense aux conférences, aux affiches, aux clubs...$$,
      'expected', $$Organiser des conférences, des projections de films, des causeries-débats, des expositions, des campagnes d'affichage, ou créer des clubs de droits de l'enfant (trois exemples cohérents suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on une « personne ressource » pour la promotion des droits de l'enfant ?$$,
      'hint', $$Pense à des métiers qui touchent au droit, au social ou à l'éducation.$$,
      'expected', $$Une personne qui, par sa fonction (juriste, parlementaire, travailleur social, personnel de l'éducation...), est bien placée pour informer et défendre les droits de l'enfant.$$
    ),
    jsonb_build_object(
      'question', $$Cite une institution qui œuvre pour la promotion des droits de l'enfant.$$,
      'hint', $$Pense à une organisation internationale ou à une ONG.$$,
      'expected', $$L'UNICEF ou une ONG de défense des droits de l'enfant comme Save The Children.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance de la promotion des droits de l'enfant pour la communauté ?$$,
      'hint', $$Pense à l'entente et à la paix.$$,
      'expected', $$Elle favorise l'entente entre les membres, renforce la cohésion sociale et contribue à la préservation de la paix au sein de la communauté.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-droits-enfant';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un ancien combattant encore adolescent vient s'installer dans un quartier. Les habitants, mal à l'aise, hésitent à l'approcher. Des élèves décident de s'informer sur ce que vivent les enfants-soldats et sur les moyens de les aider à retrouver une place dans la société.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qui sont les enfants-soldats et pourquoi sont-ils recrutés ?$$,
        'body', $$Un enfant-soldat est un membre d'un groupe armé âgé de moins de seize ans. Du côté des groupes armés, ce recrutement répond à un besoin de combattants, à la volonté d'utiliser des enfants comme boucliers humains, ou à leur docilité plus grande. Du côté des enfants eux-mêmes, certains rejoignent ces groupes par recherche de sécurité, par désir de vengeance, ou simplement par insouciance face au danger.$$,
        'highlights', array[$$enfant-soldat$$, $$recrutement$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Est considéré comme enfant-soldat tout membre de moins de seize ans d'un groupe armé, quelles que soient les raisons, volontaires ou non, de son recrutement.$$),
        'example', jsonb_build_object('statement', $$Un adolescent de quatorze ans rejoint un groupe armé en pensant y trouver une protection contre l'insécurité de son quartier. Cela correspond-il à l'une des causes connues du recrutement ?$$, 'solution', $$Oui, la recherche de sécurité est l'une des raisons qui peuvent pousser un enfant à se faire recruter par un groupe armé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de l'utilisation des enfants-soldats$$,
        'body', $$Au niveau individuel, l'enfant-soldat peut subir des traumatismes liés aux horreurs vécues, des mutilations, sombrer dans la délinquance, ou perdre une partie de son humanité face à la violence, allant parfois jusqu'à la mort. Au niveau social, cette pratique alimente l'insécurité dans les communautés concernées.$$,
        'highlights', array[$$traumatisme$$, $$insécurité sociale$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Niveau$$, $$Conséquence$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Individuel$$, $$Traumatismes, mutilations, délinquance$$),
            jsonb_build_array($$Social$$, $$Insécurité au sein de la communauté$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi peut-on dire que l'utilisation d'enfants-soldats fragilise la sécurité de toute une communauté ?$$, 'solution', $$Parce qu'elle favorise la violence et la délinquance, ce qui installe un climat d'insécurité qui dépasse le seul enfant concerné et touche l'ensemble du groupe social.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conditions d'une bonne réinsertion$$,
        'body', $$Pour réussir la réinsertion d'un enfant-soldat, il faut l'associer aux activités normales des autres enfants, éviter de le stigmatiser, ne pas lui rappeler sans cesse les atrocités vécues, l'orienter vers l'apprentissage d'un métier, l'encourager à participer à des travaux d'intérêt public, et si possible le remettre à l'école.$$,
        'highlights', array[$$réinsertion$$, $$non-stigmatisation$$]::text[],
        'example', jsonb_build_object('statement', $$Un ancien enfant-soldat revient dans son quartier et un voisin lui propose de l'aider à apprendre un métier plutôt que de l'éviter. Cette attitude correspond-elle à une bonne pratique de réinsertion ?$$, 'solution', $$Oui, l'initiation à un métier fait partie des conditions reconnues pour favoriser la réinsertion d'un enfant-soldat.$$)
      ),
      jsonb_build_object(
        'heading', $$L'engagement de chacun pour la paix sociale$$,
        'body', $$La lutte contre le recrutement des enfants-soldats et leur réinsertion réussie favorisent la cohésion sociale et contribuent à préserver la paix. Chaque citoyen, en évitant le rejet et en soutenant les actions de réinsertion, participe à cet effort collectif.$$,
        'highlights', array[$$paix sociale$$, $$engagement citoyen$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la réinsertion des enfants-soldats concerne-t-elle tous les citoyens et pas seulement les autorités ?$$, 'solution', $$Parce que l'accueil et le soutien de la communauté sont indispensables pour que la réinsertion réussisse et que la paix sociale soit préservée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des enfants-soldats reviennent vivre dans leur village. Un comité local organise une collecte pour les aider, mais certains jeunes du village refusent d'y participer, estimant qu'ils ont causé trop de tort par le passé.$$,
      'questions', array[
        $$Identifie le problème posé par le refus de ces jeunes.$$,
        $$Cite deux conditions nécessaires à une bonne réinsertion des enfants-soldats.$$,
        $$Explique pourquoi il vaut mieux soutenir cette collecte que la boycotter.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on un enfant-soldat ?$$,
      'hint', $$Pense à l'âge et au lien avec un groupe armé.$$,
      'expected', $$Un membre d'un groupe armé âgé de moins de seize ans.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux causes qui poussent des enfants à se faire recruter par un groupe armé.$$,
      'hint', $$Pense à la sécurité, à la vengeance ou à l'insouciance.$$,
      'expected', $$La recherche de sécurité, le désir de vengeance ou l'insouciance face au danger (deux exemples cohérents suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux conséquences individuelles de l'utilisation des enfants comme soldats.$$,
      'hint', $$Pense aux traumatismes et aux mutilations.$$,
      'expected', $$Des traumatismes liés aux horreurs vécues, des mutilations, ou un basculement dans la délinquance (deux exemples cohérents suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux conditions favorisant la réinsertion d'un enfant-soldat.$$,
      'hint', $$Pense à l'école, au métier et à la non-stigmatisation.$$,
      'expected', $$Éviter de le stigmatiser, l'orienter vers l'apprentissage d'un métier, ou le remettre à l'école (deux exemples cohérents suffisent).$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-reinsertion-enfants-soldats';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un camarade menace de s'en prendre à un élève en situation de handicap qui l'a vexé. Pour l'aider à comprendre pourquoi une telle réaction est inacceptable, ses camarades décident de s'informer sur les textes et les organismes qui protègent les personnes contre les discriminations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la discrimination ?$$,
        'body', $$La discrimination est un traitement inégal et défavorable qu'on impose à une personne à cause de ce qui la différencie des autres : son origine, son sexe, son âge, sa religion, la couleur de sa peau, sa position sociale, son ethnie, son état de santé, son état physique ou mental, ou encore son statut juridique, comme celui de réfugié.$$,
        'highlights', array[$$discrimination$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Constitue une discrimination tout traitement inégal et défavorable appliqué à une personne en raison d'une différence qui la caractérise, quelle qu'elle soit.$$),
        'example', jsonb_build_object('statement', $$Un élève en situation de handicap est mis à l'écart par ses camarades à cause de sa différence physique. S'agit-il d'une discrimination ?$$, 'solution', $$Oui, car il subit un traitement défavorable en raison de son état physique, ce qui correspond à une forme de discrimination.$$)
      ),
      jsonb_build_object(
        'heading', $$Les instruments de protection des droits de l'Homme$$,
        'body', $$Les instruments de protection sont des textes, internationaux ou nationaux, qui ont un caractère obligatoire pour les États qui les ratifient. Au niveau international, on trouve la Déclaration universelle des droits de l'Homme de 1948, la Convention sur l'élimination de toutes les formes de discrimination raciale de 1966, ou encore la convention protégeant les femmes contre les discriminations. Au niveau national, la Constitution ivoirienne et des lois spécifiques, comme celle interdisant les mutilations génitales ou celle rendant la scolarisation obligatoire entre cinq et seize ans, jouent ce rôle.$$,
        'highlights', array[$$instruments internationaux$$, $$instruments nationaux$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Niveau$$, $$Exemple d'instrument$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$International$$, $$Déclaration universelle des droits de l'Homme (1948)$$),
            jsonb_build_array($$National$$, $$Constitution ivoirienne, loi sur la scolarisation obligatoire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite un instrument national de protection contre les discriminations.$$, 'solution', $$La Constitution ivoirienne, ou la loi rendant la scolarisation obligatoire entre cinq et seize ans.$$)
      ),
      jsonb_build_object(
        'heading', $$Les mécanismes et les voies de recours$$,
        'body', $$Les mécanismes sont les structures chargées de faire respecter ces instruments : au niveau international, le Conseil des droits de l'Homme des Nations Unies ou la Cour africaine des droits de l'Homme ; au niveau national, le Conseil national des droits de l'Homme de Côte d'Ivoire ou le ministère chargé de la Famille et de l'Enfant. En cas de discrimination, une victime peut porter plainte à la police ou à la gendarmerie, ou saisir le tribunal compétent.$$,
        'highlights', array[$$mécanismes$$, $$voies de recours$$]::text[],
        'example', jsonb_build_object('statement', $$Une élève victime de discrimination liée à son genre souhaite faire valoir ses droits. Vers quel mécanisme national peut-elle se tourner ?$$, 'solution', $$Elle peut saisir le Conseil national des droits de l'Homme de Côte d'Ivoire ou le ministère chargé de la Famille et de l'Enfant, ou porter plainte auprès de la police ou de la gendarmerie.$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi ces instruments et mécanismes sont-ils importants ?$$,
        'body', $$Ces instruments et mécanismes permettent de lutter contre toutes les formes de discrimination, de restaurer la dignité des personnes qui en sont victimes, et de construire une société plus juste et plus égalitaire pour tous.$$,
        'highlights', array[$$dignité$$, $$égalité$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi les instruments de protection des droits de l'Homme contribuent-ils à une société plus égalitaire ?$$, 'solution', $$Parce qu'ils permettent de sanctionner les discriminations et de restaurer la dignité des victimes, ce qui rapproche la société de l'égalité entre tous ses membres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une élève est élue déléguée de sa classe, mais certains camarades refusent d'obéir à ses consignes uniquement parce que c'est une fille, et cherchent à pousser les autres à la contester.$$,
      'questions', array[
        $$Identifie la forme de discrimination illustrée par cette situation.$$,
        $$Cite un mécanisme national que cette élève pourrait saisir pour faire valoir ses droits.$$,
        $$Explique pourquoi ce refus n'est pas justifié.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on la discrimination ?$$,
      'hint', $$Pense au traitement inégal fondé sur une différence.$$,
      'expected', $$Un traitement inégal et défavorable appliqué à une personne en raison d'une différence qui la caractérise (origine, sexe, âge, religion, etc.).$$
    ),
    jsonb_build_object(
      'question', $$Cite un instrument international de protection des droits de l'Homme.$$,
      'hint', $$Pense à un texte adopté par les Nations Unies.$$,
      'expected', $$La Déclaration universelle des droits de l'Homme de 1948, ou la Convention sur l'élimination de toutes les formes de discrimination raciale.$$
    ),
    jsonb_build_object(
      'question', $$Cite un mécanisme national qui protège les droits de l'Homme en Côte d'Ivoire.$$,
      'hint', $$Pense à un conseil ou à un ministère.$$,
      'expected', $$Le Conseil national des droits de l'Homme de Côte d'Ivoire, ou le ministère chargé de la Famille et de l'Enfant.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance des instruments et mécanismes de protection contre les discriminations ?$$,
      'hint', $$Pense à la dignité et à l'égalité.$$,
      'expected', $$Ils permettent de lutter contre les discriminations, de restaurer la dignité des victimes et de construire une société plus juste et égalitaire.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-instruments-protection-discriminations';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves envisagent de boycotter la cérémonie d'accueil du député de leur circonscription, simplement parce que leurs parents n'ont pas voté pour lui. Pour les amener à changer d'avis, leurs camarades décident de s'informer sur les comportements attendus face aux symboles et aux institutions de la République.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les symboles de la République et comment les respecter$$,
        'body', $$Les symboles de la République sont des signes distinctifs qui la représentent : la devise, les armoiries, l'hymne national, le drapeau et le portrait officiel du président de la République. Les respecter, c'est notamment se recueillir devant le drapeau et pendant l'hymne national, en prendre soin, s'arrêter de marcher quand on l'entend, et s'approprier les valeurs qu'il véhicule.$$,
        'highlights', array[$$symboles de la République$$, $$hymne national$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les symboles de la République représentent l'unité et l'identité de la Nation ; leur respect par chaque citoyen, notamment lors de leur présentation publique, est un devoir civique.$$),
        'example', jsonb_build_object('statement', $$Des élèves continuent à parler entre eux pendant que l'hymne national retentit lors d'une cérémonie. Ce comportement est-il responsable ?$$, 'solution', $$Non, un comportement responsable exige de se recueillir en silence pendant l'hymne national, en signe de respect envers ce symbole de la République.$$)
      ),
      jsonb_build_object(
        'heading', $$Les institutions de la République$$,
        'body', $$Les institutions de la République sont les structures politiques établies par la loi. Le président de la République est le chef de l'État : il incarne l'unité nationale, veille au respect de la Constitution et dirige le pouvoir exécutif. Le Parlement, composé de l'Assemblée nationale et du Sénat, détient le pouvoir législatif : l'Assemblée nationale, formée des députés, vote les lois et le budget, tandis que le Sénat représente les collectivités.$$,
        'highlights', array[$$institutions de la République$$, $$Assemblée nationale$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Institution$$, $$Rôle principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Président de la République$$, $$Chef de l'État, garant de l'unité nationale$$),
            jsonb_build_array($$Assemblée nationale$$, $$Vote des lois et du budget$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quel rôle joue l'Assemblée nationale au sein du Parlement ?$$, 'solution', $$Elle représente le peuple à travers les députés, vote les lois et le budget de l'État.$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements responsables face aux institutions$$,
        'body', $$Face aux institutions de la République et aux personnalités qui les incarnent, un citoyen responsable fait preuve d'obéissance, de respect et de soumission aux décisions légitimes qui en émanent, même lorsqu'il n'est pas personnellement d'accord avec elles.$$,
        'highlights', array[$$obéissance$$, $$respect des institutions$$]::text[],
        'example', jsonb_build_object('statement', $$Des élèves envisagent de boycotter l'accueil d'un député simplement parce qu'ils n'ont pas voté pour son parti. Ce comportement respecte-t-il les institutions de la République ?$$, 'solution', $$Non, un député élu incarne une institution de la République ; le respect qui lui est dû ne dépend pas des préférences politiques personnelles.$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi ce respect est-il important ?$$,
        'body', $$Le respect des institutions et des symboles de la République garantit l'ordre républicain, préserve l'autorité de l'État et assure l'unité, la paix, l'harmonie et le progrès social de tous les citoyens.$$,
        'highlights', array[$$ordre républicain$$, $$autorité de l'État$$]::text[],
        'fixation', jsonb_build_object('question', $$Que risque une communauté qui ne respecte pas ses institutions et symboles nationaux ?$$, 'solution', $$Elle risque de fragiliser l'ordre républicain et l'autorité de l'État, ce qui peut nuire à l'unité et à la paix sociale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe de jeunes envisage de perturber la visite de sensibilisation d'un groupe de députés dans leur commune, uniquement parce que ces députés appartiennent à un parti politique différent du leur.$$,
      'questions', array[
        $$Identifie le problème posé par le projet de ces jeunes.$$,
        $$Cite deux conséquences possibles d'une telle perturbation.$$,
        $$Explique pourquoi les députés doivent être respectés en tant qu'institution, indépendamment de leur parti.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite trois symboles de la République.$$,
      'hint', $$Pense au drapeau, à l'hymne et à la devise.$$,
      'expected', $$Le drapeau, l'hymne national, la devise, les armoiries ou le portrait officiel du président de la République (trois exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quel est le rôle du président de la République ?$$,
      'hint', $$Pense à l'unité nationale et au pouvoir exécutif.$$,
      'expected', $$Il est le chef de l'État, incarne l'unité nationale, veille au respect de la Constitution et dirige le pouvoir exécutif.$$
    ),
    jsonb_build_object(
      'question', $$Que compose le Parlement et quel pouvoir détient-il ?$$,
      'hint', $$Pense à l'Assemblée nationale et au Sénat.$$,
      'expected', $$Le Parlement est composé de l'Assemblée nationale et du Sénat ; il détient le pouvoir législatif, notamment le vote des lois.$$
    ),
    jsonb_build_object(
      'question', $$Cite un comportement responsable à adopter face aux institutions de la République.$$,
      'hint', $$Pense au respect et à l'obéissance aux décisions légitimes.$$,
      'expected', $$Faire preuve de respect, d'obéissance et de soumission aux décisions légitimes des institutions et des personnalités qui les incarnent.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-institutions-republique';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$La seule librairie proposant des fournitures à prix abordable dans une localité vient de fermer pour non-paiement d'impôt. Des élèves, gênés dans leurs achats scolaires, envisagent de manifester devant le service des impôts. D'autres préfèrent d'abord comprendre ce qu'est vraiment l'impôt.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que l'impôt et quels sont ses types ?$$,
        'body', $$L'impôt est une somme d'argent que chaque citoyen verse à l'État selon ce qu'il gagne ou possède ; on l'appelle aussi taxe, contribution ou droit. On distingue l'impôt sur le revenu (prélevé sur les salaires ou les bénéfices), l'impôt sur la consommation (comme la TVA, prélevée sur les achats), et l'impôt sur le capital (prélevé sur les biens comme les véhicules ou les patentes commerciales).$$,
        'highlights', array[$$impôt$$, $$impôt sur le revenu$$, $$impôt sur la consommation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'impôt est une contribution obligatoire versée par les citoyens à l'État en fonction de leurs revenus, de leur consommation ou de leurs biens, sous des formes variées (revenu, consommation, capital).$$),
        'example', jsonb_build_object('statement', $$Une commerçante paie une taxe lors de l'achat de marchandises importées. À quel type d'impôt cela correspond-il ?$$, 'solution', $$Cela correspond à un impôt sur la consommation, prélevé sur les biens achetés.$$)
      ),
      jsonb_build_object(
        'heading', $$Qui collecte les impôts ?$$,
        'body', $$Le recouvrement des impôts aux frontières du territoire (terrestres, maritimes, aériennes) relève de la Direction générale des douanes. À l'intérieur du territoire, c'est la Direction générale des impôts (DGI) qui s'en charge, notamment à travers des centres d'impôts installés dans les communes pour faciliter le paiement et contrôler les contribuables.$$,
        'highlights', array[$$Direction générale des douanes$$, $$Direction générale des impôts$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Structure$$, $$Zone de compétence$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Direction générale des douanes$$, $$Frontières du territoire$$),
            jsonb_build_array($$Direction générale des impôts$$, $$Intérieur du territoire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle structure est chargée de collecter les impôts à l'intérieur du pays ?$$, 'solution', $$La Direction générale des impôts (DGI).$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi l'impôt est-il important ?$$,
        'body', $$Sur le plan socio-économique, les recettes fiscales permettent à l'État de payer ses dettes, les salaires des fonctionnaires, et d'assurer la sécurité et le bien-être de la population. Sur le plan politique, l'impôt aide l'État à réduire les inégalités entre les régions, à orienter le développement et à protéger la production nationale.$$,
        'highlights', array[$$recettes fiscales$$, $$développement$$]::text[],
        'example', jsonb_build_object('statement', $$Grâce aux recettes fiscales collectées, l'État construit une nouvelle route dans une région isolée. Quel rôle de l'impôt cela illustre-t-il ?$$, 'solution', $$Cela illustre le rôle politique de l'impôt, qui permet de réduire les disparités régionales en finançant le développement des zones moins desservies.$$)
      ),
      jsonb_build_object(
        'heading', $$Les responsabilités fiscales du citoyen$$,
        'body', $$Chaque citoyen a la responsabilité de déclarer avec sincérité les revenus ou les biens sur lesquels l'impôt est dû, et de s'en acquitter dans les délais légaux. En agissant ainsi, il contribue directement au développement économique et social de son pays.$$,
        'highlights', array[$$responsabilité fiscale$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux obligations principales d'un citoyen envers l'impôt ?$$, 'solution', $$Déclarer sincèrement ce qui est imposable, et payer l'impôt correspondant dans les délais légaux.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le directeur général des impôts appelle les contribuables à payer leurs impôts dans les délais. Un commerçant estime que son activité ne lui rapporte pas assez pour s'en acquitter et refuse de payer.$$,
      'questions', array[
        $$Identifie le problème posé par l'attitude de ce commerçant.$$,
        $$Cite deux conséquences possibles de son refus de payer l'impôt.$$,
        $$Explique en quoi le paiement de l'impôt est une responsabilité de tout citoyen.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que l'impôt ?$$,
      'hint', $$Pense à une somme versée à l'État selon les revenus ou les biens.$$,
      'expected', $$Une somme d'argent que chaque citoyen verse à l'État selon ce qu'il gagne ou possède.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux types d'impôts.$$,
      'hint', $$Pense au revenu, à la consommation et au capital.$$,
      'expected', $$L'impôt sur le revenu, l'impôt sur la consommation et l'impôt sur le capital (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quelle structure collecte les impôts aux frontières du territoire ?$$,
      'hint', $$Pense aux douanes.$$,
      'expected', $$La Direction générale des douanes.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les responsabilités fiscales d'un citoyen ?$$,
      'hint', $$Pense à la déclaration et au paiement dans les délais.$$,
      'expected', $$Déclarer avec sincérité l'impôt à payer et s'en acquitter dans le délai légal.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-impot-responsabilites-fiscales';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'un don de livres à la bibliothèque de son établissement, le président d'une ONG affirme que la société civile se tient toujours aux côtés des populations pour leur bien-être. Des élèves décident de s'informer sur ce qu'est réellement la société civile et sur son rôle en démocratie.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la société civile ?$$,
        'body', $$La société civile regroupe l'ensemble des associations volontaires et autonomes créées autour d'un projet d'intérêt commun pour défendre les intérêts des populations. Elle comprend notamment les ONG, les syndicats, les associations religieuses, les mutuelles de développement et les associations professionnelles.$$,
        'highlights', array[$$société civile$$, $$ONG$$, $$syndicats$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La société civile est constituée d'associations autonomes, créées librement autour d'un intérêt commun, pour défendre les intérêts des populations en dehors de l'État.$$),
        'example', jsonb_build_object('statement', $$Une association de quartier collecte des dons pour aider les familles sinistrées après une inondation. Fait-elle partie de la société civile ?$$, 'solution', $$Oui, car il s'agit d'une association volontaire et autonome organisée autour d'un intérêt commun, ce qui correspond à la définition de la société civile.$$)
      ),
      jsonb_build_object(
        'heading', $$Les principes et les règles de la société civile$$,
        'body', $$Les activités des organisations de la société civile doivent rester apolitiques et bénévoles. Leurs membres doivent avoir le sens du service public et rester disponibles pour la cause qu'ils défendent.$$,
        'highlights', array[$$apolitique$$, $$bénévolat$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Principe$$, $$Règle associée$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Activités apolitiques$$, $$Sens du service public$$),
            jsonb_build_array($$Activités bénévoles$$, $$Disponibilité des membres$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi les activités des organisations de la société civile doivent-elles rester apolitiques ?$$, 'solution', $$Pour préserver leur indépendance et leur crédibilité au service de l'intérêt commun, sans être instrumentalisées par des intérêts partisans.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance de la société civile en démocratie$$,
        'body', $$En démocratie, la société civile permet à la population de faire connaître son opinion, participe à l'équilibre des débats, défend les intérêts des citoyens face aux autorités, fait la promotion des valeurs civiques et morales, et mène des actions concrètes de développement, d'éducation, de santé et de protection au profit des populations.$$,
        'highlights', array[$$démocratie$$, $$défense des intérêts$$]::text[],
        'example', jsonb_build_object('statement', $$Une plateforme d'organisations de la société civile organise une marche pacifique pour dénoncer la cherté de la vie. Quel rôle de la société civile cela illustre-t-il ?$$, 'solution', $$Cela illustre son rôle de porte-voix des citoyens, qui lui permet de faire connaître leurs préoccupations et de défendre leurs intérêts auprès des autorités.$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements responsables face à la société civile$$,
        'body', $$Face à la société civile, un citoyen responsable fait preuve de respect en se conformant à la loi, de tolérance en acceptant les autres comme des égaux, d'honnêteté en reconnaissant les droits et devoirs de chacun, et de solidarité en s'associant à des causes justes. Ces comportements favorisent la paix sociale, la cohésion et le développement économique.$$,
        'highlights', array[$$respect$$, $$tolérance$$, $$solidarité$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi le respect de la liberté d'association est-il un comportement responsable face à la société civile ?$$, 'solution', $$Parce qu'il permet aux organisations de la société civile de mener librement leurs activités au service de l'intérêt commun, ce qui favorise la cohésion sociale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une organisation de la société civile dénonce les désagréments causés par des coupures d'électricité répétées et réclame un dédommagement pour les victimes. Certains jeunes du quartier estiment qu'une ONG n'a pas le droit de s'occuper de ce genre de problème et veulent s'y opposer.$$,
      'questions', array[
        $$Identifie le problème posé par la position de ces jeunes.$$,
        $$Cite deux composantes de la société civile.$$,
        $$Explique pourquoi une organisation de la société civile a le droit de défendre les intérêts de la population dans ce cas.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on la société civile ?$$,
      'hint', $$Pense aux associations volontaires et autonomes.$$,
      'expected', $$L'ensemble des associations volontaires et autonomes créées autour d'un projet d'intérêt commun pour défendre les intérêts des populations.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux composantes de la société civile.$$,
      'hint', $$Pense aux ONG, syndicats, associations religieuses.$$,
      'expected', $$Les ONG, les syndicats, les associations religieuses, les mutuelles de développement ou les associations professionnelles (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux principes qui doivent guider les activités de la société civile.$$,
      'hint', $$Pense à l'absence de politique et au bénévolat.$$,
      'expected', $$Les activités doivent être apolitiques et bénévoles.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance de la société civile en démocratie ?$$,
      'hint', $$Pense à la voix des citoyens et à l'équilibre des débats.$$,
      'expected', $$Elle permet à la population de faire connaître son opinion, participe à l'équilibre des débats et défend les intérêts des citoyens face aux autorités.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-societe-civile';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève confie à ses camarades que son grand frère, avec qui il partage un logement loué, utilise l'argent commun uniquement pour ses propres besoins. Pour l'aider à changer de comportement, ses camarades décident de s'informer sur la bonne gestion des ressources d'une famille.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que les ressources familiales ?$$,
        'body', $$Les ressources familiales sont l'ensemble des moyens qui permettent à une famille de satisfaire les besoins de ses membres : les revenus des parents, un éventuel héritage, les produits des champs, ou encore les revenus tirés d'activités génératrices de revenus menées par d'autres membres de la famille.$$,
        'highlights', array[$$ressources familiales$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les ressources familiales regroupent l'ensemble des moyens, financiers ou matériels, dont dispose une famille pour couvrir les besoins de tous ses membres.$$),
        'example', jsonb_build_object('statement', $$Une mère de famille vend une partie de la récolte de son champ pour couvrir les dépenses du mois. S'agit-il d'une ressource familiale ?$$, 'solution', $$Oui, les produits des champs font partie des ressources qui permettent à une famille de subvenir à ses besoins.$$)
      ),
      jsonb_build_object(
        'heading', $$Les besoins prioritaires d'une famille$$,
        'body', $$Une famille doit d'abord veiller à satisfaire ses besoins prioritaires : la nourriture, la santé, le logement, l'habillement, l'éducation, les loisirs, les factures et le transport. Ces besoins doivent être couverts avant toute dépense secondaire.$$,
        'highlights', array[$$besoins prioritaires$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Catégorie$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Besoin essentiel$$, $$Nourriture, santé, éducation$$),
            jsonb_build_array($$Besoin secondaire$$, $$Loisirs, biens non urgents$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi l'éducation est-elle considérée comme un besoin prioritaire de la famille ?$$, 'solution', $$Parce qu'elle conditionne l'avenir des enfants et fait partie des besoins essentiels à couvrir avant les dépenses secondaires.$$)
      ),
      jsonb_build_object(
        'heading', $$La gestion rationnelle des ressources$$,
        'body', $$Gérer rationnellement les ressources familiales, c'est planifier les dépenses en fonction des ressources disponibles, puis exécuter ce budget de manière rigoureuse, sans dépenser au fur et à mesure des rentrées d'argent sans réflexion préalable.$$,
        'highlights', array[$$gestion rationnelle$$, $$planification$$]::text[],
        'example', jsonb_build_object('statement', $$Le grand frère dépense l'argent du logement dès qu'il le reçoit, sans tenir compte des autres besoins du mois. Applique-t-il une gestion rationnelle des ressources ?$$, 'solution', $$Non, une gestion rationnelle suppose de planifier les dépenses selon les ressources disponibles, et non de dépenser sans réflexion dès qu'on reçoit de l'argent.$$)
      ),
      jsonb_build_object(
        'heading', $$Les bienfaits d'une gestion rationnelle$$,
        'body', $$Une gestion rigoureuse et planifiée des ressources permet d'assurer les besoins essentiels de tous les membres de la famille, d'améliorer leur qualité de vie, et de garantir leur avenir et leur bien-être sur le long terme.$$,
        'highlights', array[$$bien-être familial$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est l'un des principaux bienfaits d'une gestion rationnelle des ressources familiales ?$$, 'solution', $$Elle permet d'assurer les besoins essentiels de tous les membres de la famille et de garantir leur bien-être futur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le responsable des ressources d'une famille décide de dépenser une grosse somme pour son propre plaisir plutôt que de payer la scolarité d'un des enfants, ce qui provoque un mécontentement général dans la famille.$$,
      'questions', array[
        $$Identifie le problème posé par cette décision.$$,
        $$Cite deux besoins prioritaires que cette décision aurait dû respecter.$$,
        $$Propose une meilleure façon de gérer les ressources dans cette situation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'appelle-t-on les ressources familiales ?$$,
      'hint', $$Pense aux revenus des parents et à d'autres sources.$$,
      'expected', $$L'ensemble des moyens qui permettent à une famille de satisfaire les besoins de ses membres, comme les revenus des parents, un héritage ou les produits des champs.$$
    ),
    jsonb_build_object(
      'question', $$Cite trois besoins prioritaires d'une famille.$$,
      'hint', $$Pense à la nourriture, à la santé et à l'éducation.$$,
      'expected', $$La nourriture, la santé, le logement, l'habillement, l'éducation, les loisirs, les factures ou le transport (trois exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une gestion rationnelle des ressources ?$$,
      'hint', $$Pense à la planification des dépenses selon les ressources disponibles.$$,
      'expected', $$C'est planifier les dépenses en fonction des ressources disponibles et exécuter ce budget de manière rigoureuse.$$
    ),
    jsonb_build_object(
      'question', $$Cite un bienfait d'une bonne gestion des ressources familiales.$$,
      'hint', $$Pense au bien-être et à l'avenir de la famille.$$,
      'expected', $$Elle permet d'assurer les besoins essentiels des membres de la famille et de garantir leur avenir et leur bien-être.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-ressources-famille';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En raison de ses difficultés scolaires, le père d'un élève propose de l'aider à s'installer à son propre compte, mais celui-ci hésite, faute d'expérience en gestion. Ses camarades décident de s'informer sur ce qu'est une entreprise et sur l'insertion dans la vie active pour l'aider à décider.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'une entreprise et quels en sont les types ?$$,
        'body', $$Une entreprise est une organisation économique autonome qui produit des biens ou fournit des services destinés à des clients ou des usagers. On classe les entreprises selon leur nombre de salariés et leur chiffre d'affaires : des micro-entreprises (moins de dix salariés) aux grandes entreprises (deux cents salariés et plus, avec un chiffre d'affaires dépassant un milliard de francs CFA).$$,
        'highlights', array[$$entreprise$$, $$micro-entreprise$$, $$grande entreprise$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une entreprise est une organisation autonome qui produit des biens ou des services ; sa taille (micro, petite, moyenne ou grande) dépend notamment de son nombre de salariés et de son chiffre d'affaires.$$),
        'example', jsonb_build_object('statement', $$Un jeune ouvre un petit commerce de fruits et légumes avec deux employés. À quelle catégorie appartient cette activité ?$$, 'solution', $$Il s'agit d'une micro-entreprise ou d'une activité génératrice de revenus (AGR), car elle emploie très peu de salariés et nécessite peu d'investissement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les activités génératrices de revenus et l'apprentissage d'un métier$$,
        'body', $$Les activités génératrices de revenus (AGR) sont de petites activités spontanées, adaptées aux besoins du milieu, qui demandent peu d'investissement et peu de qualifications, comme le lavage de véhicules ou le commerce de fruits et légumes. Apprendre un métier permet d'acquérir des compétences professionnelles ainsi que des valeurs comme le sens des responsabilités, le respect des engagements et la discipline.$$,
        'highlights', array[$$AGR$$, $$apprentissage d'un métier$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite un bienfait de l'apprentissage d'un métier, en dehors des compétences techniques.$$, 'solution', $$Il permet d'acquérir des valeurs comme le sens des responsabilités, le respect des engagements ou la discipline.$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages de la création d'une entreprise$$,
        'body', $$Créer une entreprise, quelle que soit sa taille, apporte des avantages à plusieurs niveaux : au niveau individuel, cela permet de sortir du chômage, de gagner en autonomie et en fierté ; au niveau de la communauté, cela crée des emplois et lutte contre la pauvreté et l'oisiveté ; au niveau de l'État, cela crée des richesses qui contribuent au développement du pays.$$,
        'highlights', array[$$autonomie$$, $$création d'emplois$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Niveau$$, $$Avantage$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Individuel$$, $$Autonomie, insertion dans la vie active$$),
            jsonb_build_array($$Communautaire$$, $$Création d'emplois, lutte contre la pauvreté$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Un jeune, ne trouvant pas d'emploi salarié, crée sa propre petite entreprise de couture et embauche progressivement d'autres jeunes. Quel avantage communautaire cela illustre-t-il ?$$, 'solution', $$Cela illustre la création d'emplois, qui contribue à réduire le chômage et la pauvreté dans la communauté.$$)
      ),
      jsonb_build_object(
        'heading', $$L'entreprise comme moyen d'insertion dans la vie active$$,
        'body', $$L'insertion dans la vie active peut se faire soit par l'embauche dans une entreprise existante, soit par l'auto-emploi, c'est-à-dire en créant sa propre unité économique. Les entreprises restent ainsi un outil important d'intégration socio-économique des jeunes.$$,
        'highlights', array[$$insertion dans la vie active$$, $$auto-emploi$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux principales voies d'insertion dans la vie active ?$$, 'solution', $$L'embauche dans une entreprise existante, ou l'auto-emploi en créant sa propre entreprise.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un jeune titulaire d'un diplôme technique refuse une proposition de son oncle de l'initier à l'élevage de volailles pendant les vacances, jugeant ce métier peu valorisant, et conseille à son frère cadet de faire de même.$$,
      'questions', array[
        $$Identifie le problème posé par le refus de ce jeune.$$,
        $$Cite deux conséquences possibles de ce refus pour son insertion dans la vie active.$$,
        $$Explique en quoi accepter cette offre pourrait lui être bénéfique.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une entreprise ?$$,
      'hint', $$Pense à la production de biens ou de services.$$,
      'expected', $$Une organisation économique autonome qui produit des biens ou fournit des services destinés à des clients ou des usagers.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une activité génératrice de revenus (AGR) ?$$,
      'hint', $$Pense à une petite activité demandant peu d'investissement.$$,
      'expected', $$Une petite activité spontanée, adaptée aux besoins du milieu, qui demande peu d'investissement et peu de qualifications particulières.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux avantages de la création d'une entreprise au niveau individuel.$$,
      'hint', $$Pense à l'autonomie et à la sortie du chômage.$$,
      'expected', $$L'insertion dans la vie active (sortie du chômage) et l'autonomie financière et personnelle (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux principales voies d'insertion dans la vie active ?$$,
      'hint', $$Pense à l'embauche et à la création d'entreprise.$$,
      'expected', $$L'embauche dans une entreprise existante, ou l'auto-emploi en créant sa propre entreprise.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-entreprise-insertion';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors du festival culturel de sa commune, le maire affirme dans son discours que les alliances interethniques sont un moyen de préserver la cohésion sociale. Pour mieux comprendre cette affirmation, des élèves décident de s'informer sur les peuples Kwa et Krou et sur les alliances qui les unissent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les peuples Kwa et les peuples Krou$$,
        'body', $$Les peuples Kwa se répartissent en deux sous-groupes : les Kwa lagunaires (comme les Adioukrou, les Alladjan, les Abouré ou les Akyé, installés près des lagunes) et les Kwa Akan (comme les Baoulé, les Agni et les Abron, installés au centre et à l'est du pays). Les peuples Krou (comme les Bété, les Wê, les Godié, les Dida et les Kroumen) occupent plutôt l'ouest, le centre-ouest et le sud-ouest de la Côte d'Ivoire.$$,
        'highlights', array[$$peuples Kwa$$, $$peuples Krou$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans quelle partie de la Côte d'Ivoire se trouvent principalement les peuples Krou ?$$, 'solution', $$Ils occupent principalement l'ouest, le centre-ouest et le sud-ouest du pays.$$)
      ),
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'une alliance interethnique ?$$,
        'body', $$Une alliance interethnique est une parenté à plaisanterie fondée sur un pacte de non-agression entre deux peuples. Ces alliances trouvent souvent leur origine dans une assistance apportée lors d'un conflit passé, dans un pacte commercial, ou dans une médiation ayant permis de résoudre un différend ancien.$$,
        'highlights', array[$$alliance interethnique$$, $$pacte de non-agression$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une alliance interethnique lie deux peuples par un pacte de non-agression et de plaisanterie réciproque, né le plus souvent d'une assistance, d'un échange commercial ou d'une médiation passée entre eux.$$),
        'example', jsonb_build_object('statement', $$Deux peuples se doivent assistance depuis qu'un conflit ancien a été réglé par la médiation de l'un d'eux. Peut-on parler d'alliance interethnique ?$$, 'solution', $$Oui, la médiation lors d'un conflit est l'une des origines reconnues des alliances interethniques.$$)
      ),
      jsonb_build_object(
        'heading', $$Des exemples d'alliances entre peuples de Côte d'Ivoire$$,
        'body', $$Des alliances existent aussi bien à l'intérieur d'un même grand groupe qu'entre les groupes Kwa et Krou : par exemple les Agni et les Baoulé, ou les M'batto et les Ebrié, sont alliés au sein des peuples Akan ; les Godié et les Dida sont alliés au sein des peuples Krou ; et les Dida sont notamment alliés aux Abbey, aux Abidji et aux Akyé, montrant que des alliances relient aussi les groupes Kwa et Krou entre eux.$$,
        'highlights', array[$$alliances entre peuples$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type d'alliance$$, $$Exemple de peuples alliés$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Au sein des Akan$$, $$Agni et Baoulé$$),
            jsonb_build_array($$Entre Kwa et Krou$$, $$Dida et Abbey$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite un exemple d'alliance entre deux peuples appartenant au groupe Krou.$$, 'solution', $$L'alliance entre les Godié et les Dida, par exemple.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance des alliances interethniques$$,
        'body', $$Les alliances interethniques sont des mécanismes de prévention et de règlement des conflits. Elles véhiculent des valeurs comme l'honnêteté, la solidarité, la non-violence et le respect de la parole donnée, et contribuent à la préservation de la paix à travers les médiations qu'elles rendent possibles entre alliés ou avec des tiers.$$,
        'highlights', array[$$prévention des conflits$$, $$paix$$]::text[],
        'example', jsonb_build_object('statement', $$Deux élèves de peuples alliés se disputent, et un camarade allié de l'un d'eux intervient pour les réconcilier. Ce geste illustre-t-il l'importance des alliances interethniques ?$$, 'solution', $$Oui, car les alliances interethniques favorisent justement ce rôle de médiation pour préserver la paix entre les personnes concernées.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Suite à un désaccord survenu lors d'un match de football, deux élèves de la même classe, issus de peuples traditionnellement alliés, ne se parlent plus. Le chef de classe sollicite un allié de l'un des deux pour les réconcilier.$$,
      'questions', array[
        $$Identifie le problème posé par cette situation.$$,
        $$Rappelle ce qu'est une alliance interethnique.$$,
        $$Explique pourquoi cet élève devrait accepter la mission de réconciliation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on une alliance interethnique ?$$,
      'hint', $$Pense à une parenté à plaisanterie et à un pacte.$$,
      'expected', $$Une parenté à plaisanterie fondée sur un pacte de non-agression entre deux peuples.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux origines possibles d'une alliance interethnique.$$,
      'hint', $$Pense à l'assistance lors d'un conflit, au commerce ou à la médiation.$$,
      'expected', $$Une assistance lors d'un conflit passé, un pacte commercial, ou une médiation ayant réglé un différend (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite un exemple d'alliance entre deux peuples de Côte d'Ivoire.$$,
      'hint', $$Pense aux Agni et aux Baoulé, ou aux Godié et aux Dida.$$,
      'expected', $$Les Agni et les Baoulé, ou les Godié et les Dida, ou les Dida et les Abbey (un exemple suffit).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance des alliances interethniques pour la société ?$$,
      'hint', $$Pense à la prévention des conflits et à la paix.$$,
      'expected', $$Elles préviennent et règlent les conflits, véhiculent des valeurs comme l'honnêteté et la solidarité, et contribuent à la préservation de la paix sociale.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-alliances-kwa-krou';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de quatrième se vantent auprès de leurs camarades d'avoir plusieurs partenaires avec qui ils ont des rapports sexuels. Surpris par cette attitude, d'autres élèves de la classe décident de s'informer, auprès du personnel de santé, sur les grossesses à risques, les IST et le VIH-SIDA.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les causes des grossesses à risques, des IST et du VIH-SIDA$$,
        'body', $$Plusieurs comportements exposent les adolescents à ces risques : les rapports sexuels précoces, les rapports non protégés, les mauvaises fréquentations, une mauvaise connaissance de la réalité du VIH-SIDA, et le fait d'ignorer son propre statut sérologique ou celui de son ou sa partenaire.$$,
        'highlights', array[$$rapports non protégés$$, $$statut sérologique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les grossesses à risques, les IST et le VIH-SIDA trouvent leur origine principalement dans des comportements sexuels précoces ou non protégés et dans le manque d'information sur ces sujets.$$),
        'example', jsonb_build_object('statement', $$Un adolescent a un rapport sexuel sans savoir si sa ou son partenaire est porteur d'une infection. En quoi cela l'expose-t-il à un risque ?$$, 'solution', $$Il s'expose à un risque car la méconnaissance du statut sérologique de son ou sa partenaire est l'une des causes reconnues de transmission des IST et du VIH.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences pour la santé et la scolarité$$,
        'body', $$Une grossesse à risque peut entraîner l'interruption de la croissance de la jeune fille, des complications graves comme la fistule, une césarienne, voire le décès. Les IST et le VIH-SIDA peuvent quant à eux dégrader la santé, entraîner l'abandon des études, provoquer le rejet par la famille et alourdir les charges du foyer.$$,
        'highlights', array[$$conséquences sur la santé$$, $$abandon des études$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Situation$$, $$Conséquence possible$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Grossesse à risque$$, $$Complications de santé, interruption de la scolarité$$),
            jsonb_build_array($$IST ou VIH$$, $$Dégradation de la santé, abandon des études$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi une grossesse précoce peut-elle compromettre la scolarité d'une jeune fille ?$$, 'solution', $$Parce qu'elle peut entraîner une interruption des études, en plus des risques pour sa santé liés à un corps pas encore complètement développé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements responsables à adopter$$,
        'body', $$Pour éviter une grossesse non désirée, il existe des moyens contraceptifs adaptés. Pour se protéger des IST et du VIH-SIDA, les comportements responsables reconnus sont l'abstinence sexuelle, la fidélité réciproque entre partenaires, et le port du préservatif.$$,
        'highlights', array[$$abstinence$$, $$fidélité$$, $$préservatif$$]::text[],
        'example', jsonb_build_object('statement', $$Un couple d'adolescents décide d'attendre avant d'avoir des rapports sexuels. Quel comportement responsable cela illustre-t-il ?$$, 'solution', $$Cela illustre l'abstinence sexuelle, qui est l'un des comportements responsables permettant d'éviter les grossesses à risques, les IST et le VIH.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance d'adopter ces comportements$$,
        'body', $$Adopter des comportements responsables permet non seulement d'éviter les grossesses à risques, les IST et le VIH-SIDA, mais aussi de favoriser la réussite scolaire, de préserver sa santé, de réduire les charges de la famille et d'éviter des conflits avec les parents.$$,
        'highlights', array[$$comportement responsable$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi l'adoption de comportements responsables profite-t-elle aussi à la scolarité d'un adolescent ?$$, 'solution', $$Parce qu'en évitant les grossesses à risques et les maladies liées aux rapports non protégés, l'adolescent évite aussi les interruptions de scolarité qui en découlent souvent.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un(e) adolescent(e) refuse d'avoir un rapport sexuel avec son (sa) petit(e) ami(e), qui menace de rompre la relation en doutant de ses sentiments à cause de ce refus.$$,
      'questions', array[
        $$Identifie le problème posé par cette situation.$$,
        $$Cite deux causes des grossesses à risques, des IST et du VIH-SIDA.$$,
        $$Explique pourquoi il est justifié de maintenir cette position face à la menace de rupture.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux causes des grossesses à risques, des IST ou du VIH-SIDA.$$,
      'hint', $$Pense aux rapports précoces ou non protégés.$$,
      'expected', $$Les rapports sexuels précoces, les rapports non protégés, les mauvaises fréquentations ou la méconnaissance du statut sérologique (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite une conséquence possible d'une grossesse à risque.$$,
      'hint', $$Pense aux complications de santé.$$,
      'expected', $$L'interruption de la croissance de la jeune fille, une fistule, une césarienne, ou dans les cas les plus graves, la mort.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux comportements responsables permettant d'éviter les IST et le VIH-SIDA.$$,
      'hint', $$Pense à l'abstinence, à la fidélité et au préservatif.$$,
      'expected', $$L'abstinence sexuelle, la fidélité réciproque entre partenaires, et le port du préservatif (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance d'adopter des comportements responsables à ce sujet ?$$,
      'hint', $$Pense à la santé et à la réussite scolaire.$$,
      'expected', $$Cela permet de préserver sa santé, de favoriser la réussite scolaire, et d'éviter des conflits avec les parents ou des charges supplémentaires pour la famille.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-grossesses-risques-ist-vih';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves refusent de participer à l'anniversaire d'un camarade organisé dans un bar où l'on sert de l'alcool en abondance, malgré l'insistance des autres. Pour convaincre l'organisateur de changer de lieu, ils décident de s'informer sur les comportements responsables à adopter durant l'adolescence.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que l'adolescence ?$$,
        'body', $$L'adolescence est la période de croissance et de développement située entre l'enfance et l'âge adulte, généralement entre dix et dix-neuf ans. Elle se caractérise par d'importantes transformations physiques (comme le développement de la poitrine ou l'apparition de poils), physiologiques (comme les premières règles ou éjaculations) et psychologiques (besoin d'affirmation de soi, attachement au groupe d'amis, humeurs instables).$$,
        'highlights', array[$$adolescence$$, $$transformations$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'adolescence est une période de transition, comprise entre dix et dix-neuf ans, marquée par des transformations physiques, physiologiques et psychologiques profondes du jeune homme ou de la jeune fille.$$),
        'example', jsonb_build_object('statement', $$Un adolescent ressent un fort besoin de s'affirmer et d'appartenir à un groupe d'amis. De quel type de transformation s'agit-il ?$$, 'solution', $$D'une transformation psychologique, caractéristique de la période de l'adolescence.$$)
      ),
      jsonb_build_object(
        'heading', $$Les dangers de l'adolescence$$,
        'body', $$Le désir de s'affirmer peut exposer l'adolescent à plusieurs dangers : les mauvaises fréquentations, l'envie de vivre de nouvelles expériences comme la consommation d'alcool, de tabac ou de drogue, le désintérêt pour les études, ou encore le refus de l'autorité des aînés.$$,
        'highlights', array[$$mauvaises fréquentations$$, $$consommation d'alcool$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Danger$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Nouvelles expériences$$, $$Alcool, tabac, drogue$$),
            jsonb_build_array($$Rejet de l'autorité$$, $$Braver les aînés, désintérêt scolaire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi la consommation d'alcool est-elle considérée comme un danger de l'adolescence ?$$, 'solution', $$Parce qu'elle fait partie des nouvelles expériences recherchées par certains adolescents en quête d'affirmation, mais qui peuvent nuire gravement à leur santé et à leur avenir.$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements responsables à adopter$$,
        'body', $$Pour éviter les erreurs qui pourraient compromettre son avenir, l'adolescent devrait avoir de bonnes fréquentations, s'habiller de manière décente, s'abstenir de consommer alcool et tabac, respecter les aînés, écouter les conseils de ses parents, et adopter des comportements sexuels responsables.$$,
        'highlights', array[$$comportements responsables$$]::text[],
        'example', jsonb_build_object('statement', $$Face à l'insistance de ses camarades à fêter un anniversaire dans un bar, un élève propose plutôt d'organiser la fête dans un lieu sans alcool. Ce choix illustre-t-il un comportement responsable ?$$, 'solution', $$Oui, il illustre l'abstinence face à l'alcool, l'un des comportements responsables recommandés à l'adolescence.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance de ces comportements pour l'intégration sociale$$,
        'body', $$Adopter des comportements responsables à l'adolescence permet de vivre sainement cette période de transition, de réussir ses études, d'entretenir de bonnes relations avec ses parents et les autres adultes, et de s'insérer de manière harmonieuse dans sa communauté.$$,
        'highlights', array[$$intégration sociale harmonieuse$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi de bons comportements à l'adolescence favorisent-ils une intégration sociale harmonieuse ?$$, 'solution', $$Parce qu'ils permettent de préserver de bonnes relations avec l'entourage et de réussir sa scolarité, ce qui facilite ensuite une bonne insertion dans la communauté.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$En vacances chez son oncle, un adolescent constate que son cousin et ses amis boivent de l'alcool et fument régulièrement, prétendant que c'est le seul moyen de s'occuper pendant les vacances, et l'invitent à faire de même.$$,
      'questions', array[
        $$Identifie le problème posé par le comportement de ce cousin et de ses amis.$$,
        $$Cite deux comportements responsables que cet adolescent pourrait leur opposer.$$,
        $$Explique pourquoi il devrait refuser de les imiter.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on l'adolescence ?$$,
      'hint', $$Pense à la période entre l'enfance et l'âge adulte.$$,
      'expected', $$La période de croissance et de développement située entre l'enfance et l'âge adulte, environ entre dix et dix-neuf ans, marquée par des transformations physiques, physiologiques et psychologiques.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux dangers auxquels un adolescent peut être exposé.$$,
      'hint', $$Pense aux mauvaises fréquentations et aux substances nocives.$$,
      'expected', $$Les mauvaises fréquentations, la consommation d'alcool, de tabac ou de drogue, ou le désintérêt pour les études (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux comportements responsables à adopter à l'adolescence.$$,
      'hint', $$Pense au respect des aînés et à l'abstinence face à l'alcool.$$,
      'expected', $$Respecter les aînés, écouter les conseils des parents, s'abstenir de consommer alcool et tabac, ou avoir de bonnes fréquentations (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance de l'adoption de comportements responsables à l'adolescence ?$$,
      'hint', $$Pense à la scolarité et à l'intégration sociale.$$,
      'expected', $$Elle permet de vivre sainement cette période, de réussir ses études, d'avoir de bonnes relations avec les adultes, et de s'insérer harmonieusement dans sa communauté.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-adolescent-integration-sociale';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une excursion au bord du cours d'eau qui traverse leur ville, des élèves découvrent que l'eau est devenue jaunâtre et dégage une mauvaise odeur. Troublés par ce constat, ils décident de s'informer sur les causes de la dégradation de l'environnement et sur les moyens de le préserver.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que l'environnement et pourquoi se dégrade-t-il ?$$,
        'body', $$L'environnement est l'ensemble des éléments naturels et artificiels de notre milieu : l'eau, l'air, le sol, la flore et la faune. Il se dégrade essentiellement à cause des activités humaines : défrichements agricoles, abattage excessif du bois, exploitation minière, feux de brousse, pollution des eaux par des déchets industriels, pollution de l'air par les fumées, et chasse pratiquée à des fins commerciales.$$,
        'highlights', array[$$environnement$$, $$dégradation de l'environnement$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'environnement regroupe les éléments naturels et artificiels de notre milieu (eau, air, sol, flore, faune) ; sa dégradation résulte principalement des activités humaines qui modifient les écosystèmes.$$),
        'example', jsonb_build_object('statement', $$L'eau d'un cours d'eau devient jaunâtre et malodorante à cause de rejets industriels. Quelle cause de dégradation de l'environnement cela illustre-t-il ?$$, 'solution', $$Cela illustre la pollution des eaux par les déchets industriels, l'une des causes reconnues de dégradation de l'environnement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de la dégradation de l'environnement$$,
        'body', $$La dégradation de l'environnement entraîne le réchauffement climatique, la disparition d'espèces animales et végétales, la réduction des ressources en eau, l'aridité des sols, la baisse de la productivité agricole et des revenus des agriculteurs, ainsi que des maladies de peau ; toutes ces conséquences affectent gravement la qualité de vie des populations.$$,
        'highlights', array[$$réchauffement climatique$$, $$aridité des sols$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Cause$$, $$Conséquence$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Feux de brousse, déboisement$$, $$Aridité des sols, disparition d'espèces$$),
            jsonb_build_array($$Pollution des eaux et de l'air$$, $$Maladies, réduction des ressources en eau$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle conséquence la disparition progressive des forêts peut-elle avoir sur les sols ?$$, 'solution', $$Elle peut entraîner l'aridité des sols et la baisse de leur productivité agricole.$$)
      ),
      jsonb_build_object(
        'heading', $$Les mesures de préservation de l'environnement$$,
        'body', $$Pour protéger la flore et la faune, on peut utiliser des pare-feux, moderniser les techniques agricoles, réglementer l'exploitation du bois et de la chasse, ou favoriser l'élevage d'espèces animales plutôt que le braconnage. Pour protéger l'air et l'eau, il faut épurer les eaux usées avant leur rejet et renforcer la réglementation contre les engins polluants.$$,
        'highlights', array[$$mesures de préservation$$, $$épuration des eaux$$]::text[],
        'example', jsonb_build_object('statement', $$Une usine installe un système d'épuration pour traiter ses eaux usées avant de les rejeter dans la nature. Quelle mesure de préservation applique-t-elle ?$$, 'solution', $$Elle applique une mesure de protection de l'eau, en épurant ses rejets avant de les déverser dans la nature.$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi préserver l'environnement ?$$,
        'body', $$Respecter les mesures de préservation de l'environnement permet de maintenir l'équilibre de l'écosystème et de freiner l'avancée du désert, de favoriser une meilleure pluviométrie utile aux productions agricoles, et de préserver des espaces naturels importants pour la vie des populations.$$,
        'highlights', array[$$équilibre de l'écosystème$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi la préservation de l'environnement profite-t-elle à l'agriculture ?$$, 'solution', $$Elle favorise une meilleure pluviométrie et préserve la fertilité des sols, ce qui améliore les productions agricoles.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un cousin, en vacances au village, explique qu'il utilise des produits chimiques pour pêcher afin d'augmenter ses revenus, et propose à son jeune parent de venir l'aider le lendemain.$$,
      'questions', array[
        $$Identifie le problème posé par cette pratique.$$,
        $$Cite deux conséquences possibles de la dégradation de l'environnement liée à cette pratique.$$,
        $$Explique pourquoi il vaudrait mieux refuser de participer à cette activité.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on l'environnement ?$$,
      'hint', $$Pense aux éléments naturels et artificiels du milieu.$$,
      'expected', $$L'ensemble des éléments naturels et artificiels de notre milieu : l'eau, l'air, le sol, la flore et la faune.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux causes de la dégradation de l'environnement.$$,
      'hint', $$Pense aux feux de brousse et à la pollution.$$,
      'expected', $$Les feux de brousse, le déboisement, l'exploitation minière ou la pollution des eaux et de l'air par des rejets industriels (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux conséquences de la dégradation de l'environnement.$$,
      'hint', $$Pense au climat et aux sols.$$,
      'expected', $$Le réchauffement climatique, la disparition d'espèces, l'aridité des sols ou la baisse de la productivité agricole (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux mesures permettant de préserver l'environnement.$$,
      'hint', $$Pense aux pare-feux et à l'épuration des eaux.$$,
      'expected', $$L'utilisation de pare-feux, la modernisation des techniques agricoles, la réglementation de la chasse et du bois, ou l'épuration des eaux usées (deux exemples suffisent).$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-preservation-environnement';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En visite chez un camarade souffrant de diarrhées fréquentes, des élèves remarquent que les abords du point d'eau non protégé du quartier servent aussi à faire la lessive et la vaisselle. Surpris, ils décident de s'informer sur l'entretien des points d'eau et son importance pour la santé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un point d'eau ?$$,
        'body', $$Un point d'eau est un endroit ou un dispositif où l'on s'approvisionne en eau pour satisfaire ses besoins. On distingue les points d'eau naturels, comme le marigot, la rivière ou le fleuve, et les points d'eau artificiels, comme le puits, la borne-fontaine, le robinet ou la pompe hydraulique.$$,
        'highlights', array[$$point d'eau$$, $$point d'eau naturel$$, $$point d'eau artificiel$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un point d'eau est tout endroit ou dispositif, naturel (marigot, rivière, fleuve) ou artificiel (puits, pompe, borne-fontaine), où une population s'approvisionne en eau.$$),
        'example', jsonb_build_object('statement', $$Un village s'approvisionne en eau grâce à une pompe hydraulique installée par une ONG. À quel type de point d'eau appartient cette installation ?$$, 'solution', $$Il s'agit d'un point d'eau artificiel, puisqu'il résulte d'un aménagement réalisé par l'homme.$$)
      ),
      jsonb_build_object(
        'heading', $$Les causes et les conséquences de la pollution des points d'eau$$,
        'body', $$La pollution des points d'eau provient principalement des rejets domestiques, des rejets agricoles et des rejets industriels. Elle affecte gravement la santé des populations et favorise des maladies comme la bilharziose, l'onchocercose ou l'ulcère de Buruli.$$,
        'highlights', array[$$pollution des points d'eau$$, $$maladies hydriques$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Source de pollution$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Rejets domestiques$$, $$Lessive, vaisselle près du point d'eau$$),
            jsonb_build_array($$Rejets industriels$$, $$Déchets d'usine$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite une maladie liée à la pollution des points d'eau.$$, 'solution', $$La bilharziose, l'onchocercose ou l'ulcère de Buruli.$$)
      ),
      jsonb_build_object(
        'heading', $$Les mesures de préservation des points d'eau$$,
        'body', $$Pour préserver les points d'eau, on peut construire des ouvrages de protection comme des barrières ou des margelles autour du point d'eau, épurer les rejets des usines avant leur déversement, élaborer un code de conduite pour une gestion rationnelle de l'eau, et prévoir des sanctions contre les personnes qui polluent ces points d'eau.$$,
        'highlights', array[$$ouvrages de protection$$, $$sanctions$$]::text[],
        'example', jsonb_build_object('statement', $$Un village décide de construire une margelle autour de son puits et d'interdire la lessive à proximité. Ces actions relèvent-elles de la préservation des points d'eau ?$$, 'solution', $$Oui, la construction d'ouvrages de protection comme une margelle fait partie des mesures reconnues pour préserver la qualité des points d'eau.$$)
      ),
      jsonb_build_object(
        'heading', $$Un enjeu de santé pour toute la population$$,
        'body', $$L'entretien des points d'eau concerne toute la population, car une eau non protégée devient rapidement une source de maladies pour tous ceux qui l'utilisent. Préserver ces points d'eau, c'est donc directement préserver la santé de la communauté.$$,
        'highlights', array[$$santé de la population$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi l'entretien des points d'eau est-il l'affaire de toute la population et non d'une seule personne ?$$, 'solution', $$Parce qu'un point d'eau pollué peut rendre malade tous ceux qui l'utilisent ; sa préservation profite donc à l'ensemble de la communauté.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pendant les vacances au village, un cousin invite un élève à se baigner et à faire sa toilette dans une rivière où de nombreux jeunes viennent aussi se soulager, sans aucune protection du point d'eau.$$,
      'questions', array[
        $$Identifie le problème posé par cette pratique.$$,
        $$Cite deux mesures qui permettraient de préserver ce point d'eau.$$,
        $$Explique pourquoi il vaudrait mieux refuser cette invitation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un point d'eau ?$$,
      'hint', $$Pense aux endroits où l'on s'approvisionne en eau.$$,
      'expected', $$Un endroit ou un dispositif où l'on s'approvisionne en eau pour satisfaire ses besoins, comme un puits, une rivière ou une pompe.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux causes de la pollution des points d'eau.$$,
      'hint', $$Pense aux rejets domestiques, agricoles et industriels.$$,
      'expected', $$Les rejets domestiques, les rejets agricoles ou les rejets industriels (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite une maladie pouvant résulter de la pollution des points d'eau.$$,
      'hint', $$Pense à la bilharziose ou à l'onchocercose.$$,
      'expected', $$La bilharziose, l'onchocercose ou l'ulcère de Buruli.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux mesures permettant de préserver un point d'eau.$$,
      'hint', $$Pense aux ouvrages de protection et à l'épuration des eaux.$$,
      'expected', $$Construire des ouvrages de protection (barrières, margelles), épurer les rejets des usines, ou sanctionner les pollueurs (deux exemples suffisent).$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-entretien-points-eau';

