-- Réapplication forcée : les 5 dernières leçons Physique-Chimie 4ème (13/13) ont été réécrites
-- en place avec du vrai contenu ecole-ci.org après avoir déjà été poussées en fallback.

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un grave incendie survenu une nuit dans un quartier d'Abidjan a détruit une partie d'une maison. Les voisins pensaient d'abord à un acte criminel, avant d'apprendre que l'incendie était dû à un court-circuit électrique. Un élève de 4ème, habitant du quartier, prend alors conscience du danger que représente le courant du secteur et décide, avec ses camarades, de comprendre ce danger et les moyens de s'en protéger.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Caractéristiques du courant du secteur$$,
        'body', $$Le courant du secteur est le courant fourni par le réseau de distribution d'électricité ; en Côte d'Ivoire, cette distribution est assurée par la CIE. La tension efficace qu'il délivre vaut 220 V. Étant une tension alternative sinusoïdale, sa valeur instantanée atteint en réalité une tension maximale Um, liée à la tension efficace Ueff par la relation Um = 1,41 × Ueff, soit environ 310 V pour le secteur ivoirien. Sa période T, durée d'un motif complet visible à l'oscilloscope, vaut 20 ms (0,02 s), ce qui correspond à une fréquence N = 1/T = 50 Hz.$$,
        'highlights', array[$$courant du secteur$$, $$tension efficace$$, $$tension maximale$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Um = 1,41 × Ueff. En Côte d'Ivoire : Ueff = 220 V, Um ≈ 310 V, T = 20 ms = 0,02 s, et la fréquence N = 1/T = 50 Hz.$$),
        'example', jsonb_build_object('statement', $$Une prise du secteur affiche une tension efficace de 225 V. Calcule la tension maximale correspondante.$$, 'solution', $$Um = 1,41 × 225 ≈ 317 V.$$),
        'fixation', jsonb_build_object('question', $$Quelle formule relie la tension maximale et la tension efficace d'un courant alternatif sinusoïdal, et quelle est la fréquence du courant du secteur en Côte d'Ivoire ?$$, 'solution', $$Um = 1,41 × Ueff ; la fréquence du secteur ivoirien est N = 50 Hz.$$)
      ),
      jsonb_build_object(
        'heading', $$Les trois bornes d'une prise du secteur$$,
        'body', $$Une prise de courant du secteur comporte trois bornes distinctes. En approchant un tournevis testeur (un petit tournevis muni d'une lampe témoin) de chacune des bornes, tout en le touchant du doigt, la lampe ne s'allume que pour une seule borne : c'est la phase, notée P. Pour les deux autres bornes, la lampe reste éteinte : ce sont le neutre, noté N, et la prise de terre, notée T.$$,
        'highlights', array[$$phase$$, $$neutre$$, $$terre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une prise du secteur possède trois bornes : la phase P (seule borne à allumer la lampe du tournevis testeur), le neutre N et la terre T (lampe éteinte pour ces deux bornes).$$),
        'example', jsonb_build_object('statement', $$Un électricien approche un tournevis testeur des trois bornes d'une prise. La lampe témoin ne s'allume que pour une seule borne. Quel est le nom de cette borne ?$$, 'solution', $$C'est la phase (P), seule borne capable d'allumer la lampe du tournevis testeur.$$),
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on la borne de phase d'une prise de courant ?$$, 'solution', $$C'est la seule borne pour laquelle un tournevis testeur allume sa lampe témoin.$$)
      ),
      jsonb_build_object(
        'heading', $$Électrisation, électrocution et court-circuit$$,
        'body', $$Le contact du corps humain avec le courant du secteur peut provoquer une électrisation : un choc physiologique violent (brûlure, tremblement, tétanisation, arrêt cardiaque ou asphyxie) causé par le passage du courant à travers l'organisme. Lorsque ce passage de courant entraîne la mort, on parle d'électrocution. On considère qu'à partir d'environ 25 V, le courant traversant le corps humain devient dangereux, en particulier lorsque celui-ci établit un contact entre la phase et le neutre, ou entre la phase et la terre. Un court-circuit est, quant à lui, la connexion directe des bornes d'un élément du circuit par un simple fil : il peut échauffer les fils, détruire les isolants et déclencher un incendie. La surcharge, qui consiste à brancher trop d'appareils sur une même prise, est une autre cause fréquente de danger pour les installations, en provoquant une surintensité pouvant elle aussi provoquer un incendie.$$,
        'highlights', array[$$électrisation$$, $$électrocution$$, $$court-circuit$$]::text[],
        'property', jsonb_build_object('label', $$Définitions$$, 'text', $$Électrisation : choc physiologique dû au passage du courant dans le corps, sans décès. Électrocution : électrisation mortelle. Court-circuit : connexion directe des bornes d'un élément du circuit par un fil. Seuil de danger pour le corps humain : environ 25 V.$$),
        'example', jsonb_build_object('statement', $$Une personne touche accidentellement à la fois le fil de phase et le fil de neutre d'une installation, et en meurt. Comment appelle-t-on cet accident ?$$, 'solution', $$C'est une électrocution : une électrisation qui a entraîné la mort de la personne.$$),
        'fixation', jsonb_build_object('question', $$Que se passe-t-il pour les fils et les isolants lorsqu'un court-circuit se produit entre la phase et le neutre ?$$, 'solution', $$Les fils s'échauffent, les isolants sont détruits, et un incendie peut se déclencher.$$),
        'table', jsonb_build_object(
          'headers', array[$$Terme$$, $$Définition$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Électrisation$$, $$Choc physiologique dû au passage du courant, sans décès$$),
            jsonb_build_array($$Électrocution$$, $$Électrisation mortelle$$),
            jsonb_build_array($$Court-circuit$$, $$Connexion directe des bornes d'un élément par un fil$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Dispositifs de protection et règles de sécurité$$,
        'body', $$Pour protéger les appareils, on utilise un fusible (un petit fil qui fond et ouvre le circuit dès que l'intensité devient trop élevée), un disjoncteur général (qui coupe l'électricité du bâtiment si l'intensité totale dépasse la valeur souscrite), un stabilisateur (qui délivre une tension stable malgré les variations du secteur) ou un onduleur (qui stabilise la tension tout en accumulant de l'énergie pour alimenter brièvement les appareils lors d'une coupure brutale, le temps de les éteindre correctement). Pour protéger les personnes, la prise de terre dévie le courant de fuite vers le sol plutôt qu'à travers le corps en cas de contact accidentel, et le disjoncteur différentiel coupe automatiquement le circuit dès que la différence entre les intensités des fils de phase et de neutre atteint 30 mA. Parmi les règles de sécurité à respecter : ne jamais toucher un fil dénudé, débrancher un appareil avant toute réparation, éviter de brancher trop d'appareils sur une même prise, ne jamais manipuler un appareil avec les mains ou les pieds humides, couper le courant avant toute intervention sur l'installation, et ne jamais introduire d'objets métalliques dans une prise.$$,
        'highlights', array[$$disjoncteur différentiel$$, $$prise de terre$$, $$règles de sécurité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le disjoncteur différentiel coupe le circuit dès que la différence entre les intensités de phase et de neutre atteint 30 mA, protégeant les personnes en s'appuyant sur la prise de terre qui dévie le courant de fuite vers le sol.$$),
        'example', jsonb_build_object('statement', $$Le disjoncteur différentiel d'une maison se déclenche brusquement alors qu'un appareil défectueux laisse fuir du courant vers sa carcasse, reliée à la terre. Pourquoi ce déclenchement protège-t-il les occupants ?$$, 'solution', $$Le disjoncteur différentiel détecte que les intensités de phase et de neutre ne sont plus égales à cause de la fuite vers la terre ; il coupe alors l'alimentation avant qu'une personne touchant l'appareil ne soit électrisée.$$),
        'fixation', jsonb_build_object('question', $$Cite deux règles de sécurité à respecter pour éviter les dangers du courant du secteur.$$, 'solution', $$Par exemple : ne jamais toucher un fil dénudé, et couper le courant avant toute intervention sur une installation.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un atelier, un technicien remarque que le disjoncteur général se déclenche chaque fois que plusieurs machines fonctionnent en même temps sur la même ligne. Un autre jour, un fer à souder défectueux, dont la carcasse est reliée à la terre, déclenche cette fois le disjoncteur différentiel.$$,
      'questions', array[
        $$Pourquoi le disjoncteur général se déclenche-t-il lorsque trop de machines fonctionnent simultanément sur la même ligne ?$$,
        $$Quel phénomène a permis au disjoncteur différentiel de détecter le défaut du fer à souder ?$$,
        $$Cite deux règles de sécurité que le technicien doit malgré tout respecter pour éviter tout risque d'électrisation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la tension efficace et la fréquence du courant du secteur en Côte d'Ivoire ?$$,
      'hint', $$Ce sont deux valeurs caractéristiques fournies par la CIE.$$,
      'expected', $$Ueff = 220 V et N = 50 Hz.$$
    ),
    jsonb_build_object(
      'question', $$Comment identifie-t-on la borne de phase d'une prise à l'aide d'un tournevis testeur ?$$,
      'hint', $$Pense à la lampe témoin du tournevis.$$,
      'expected', $$C'est la seule borne qui allume la lampe du tournevis testeur.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre électrisation et électrocution ?$$,
      'hint', $$L'une des deux est mortelle, l'autre non.$$,
      'expected', $$L'électrisation est un choc physiologique dû au courant, sans décès ; l'électrocution est une électrisation qui entraîne la mort.$$
    ),
    jsonb_build_object(
      'question', $$Quel dispositif protège une personne en coupant le circuit dès qu'une fuite de courant de 30 mA est détectée entre la phase et le neutre ?$$,
      'hint', $$Il est associé au fil de terre.$$,
      'expected', $$Le disjoncteur différentiel.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-dangers-courant-secteur';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 4ème apprend, en suivant une émission télévisée, que tous les appareils électroniques fonctionnent avec une tension continue. Il est troublé, car il sait que le secteur sur lequel ces appareils sont pourtant branchés délivre une tension alternative sinusoïdale. Avec ses camarades et leur professeur de Physique-Chimie, il décide de comprendre comment un simple boîtier peut transformer, redresser puis lisser la tension du secteur pour obtenir une tension continue.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le transformateur$$,
        'body', $$Un transformateur est un quadripôle, c'est-à-dire un composant à quatre bornes, constitué de deux bobines électriquement distinctes couplées magnétiquement par un même noyau. Il comprend un circuit primaire (ou circuit d'entrée) et un circuit secondaire (ou circuit de sortie). Un transformateur ne peut fonctionner qu'en courant alternatif : il doit obligatoirement être branché aux bornes d'un générateur de tension alternative. Selon la façon dont il est construit, un transformateur peut être abaisseur de tension (il diminue la tension) ou élévateur de tension (il l'augmente).$$,
        'highlights', array[$$transformateur$$, $$quadripôle$$, $$primaire$$, $$secondaire$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le transformateur est un quadripôle à deux bobines couplées par un noyau, comportant un circuit primaire et un circuit secondaire. Il ne fonctionne qu'en tension alternative, et peut être abaisseur ou élévateur de tension.$$),
        'example', jsonb_build_object('statement', $$Peut-on brancher un transformateur directement sur une pile qui délivre une tension continue ?$$, 'solution', $$Non : un transformateur ne fonctionne qu'avec une tension alternative, jamais avec une tension continue comme celle d'une pile.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux circuits d'un transformateur, et comment se nomment-ils ?$$, 'solution', $$Le circuit primaire (ou circuit d'entrée) et le circuit secondaire (ou circuit de sortie).$$)
      ),
      jsonb_build_object(
        'heading', $$Transformation d'une tension alternative sinusoïdale$$,
        'body', $$En observant simultanément, à l'oscilloscope, la tension à l'entrée et la tension à la sortie d'un transformateur, on constate que les deux tensions restent alternatives sinusoïdales et conservent la même période, donc la même fréquence. En revanche, leurs valeurs maximales diffèrent : le transformateur modifie l'amplitude de la tension sans changer sa nature ni sa fréquence.$$,
        'highlights', array[$$amplitude$$, $$fréquence$$, $$oscilloscope$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le transformateur conserve la nature (alternative sinusoïdale) et la fréquence de la tension d'entrée, mais modifie sa valeur maximale (son amplitude).$$),
        'example', jsonb_build_object('statement', $$À l'oscilloscope, la tension d'entrée d'un transformateur a une amplitude de 6 V, et sa tension de sortie une amplitude de 4 V, les deux courbes ayant la même période. Quel type de transformateur est-ce ?$$, 'solution', $$C'est un transformateur abaisseur de tension, puisque l'amplitude de sortie (4 V) est inférieure à celle d'entrée (6 V), la fréquence restant inchangée.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui reste identique entre la tension d'entrée et la tension de sortie d'un transformateur, et qu'est-ce qui change ?$$, 'solution', $$La nature (alternative sinusoïdale) et la fréquence restent identiques ; seule la valeur maximale (l'amplitude) change.$$)
      ),
      jsonb_build_object(
        'heading', $$Le redressement par diode et par pont de diodes$$,
        'body', $$Une diode est un composant électronique qui ne laisse passer le courant que dans un seul sens, appelé sens passant. Placée en série dans un circuit alimenté par une tension alternative, une diode conserve l'alternance positive et bloque l'alternance négative : c'est le redressement simple alternance. Le pont de diodes est un quadripôle formé de plusieurs diodes, qui reçoit le signal alternatif sur deux bornes d'entrée et délivre un signal modifié sur deux bornes de sortie : il conserve les alternances positives et transforme les alternances négatives en alternances positives, réalisant ainsi un redressement double alternance.$$,
        'highlights', array[$$diode$$, $$sens passant$$, $$redressement simple alternance$$, $$redressement double alternance$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une diode ne laisse passer le courant que dans un seul sens. Seule, elle réalise un redressement simple alternance (l'alternance négative est supprimée) ; un pont de diodes réalise un redressement double alternance (l'alternance négative devient positive).$$),
        'example', jsonb_build_object('statement', $$Une tension alternative traverse une seule diode montée en série. Que devient l'alternance correspondant au sens bloqué par la diode ?$$, 'solution', $$Cette alternance est supprimée : la tension de sortie s'annule pendant cette partie de la période, ce qui correspond à un redressement simple alternance.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre le redressement obtenu avec une seule diode et celui obtenu avec un pont de diodes ?$$, 'solution', $$Avec une seule diode, l'alternance négative est simplement supprimée (redressement simple alternance) ; avec un pont de diodes, l'alternance négative est transformée en alternance positive (redressement double alternance).$$)
      ),
      jsonb_build_object(
        'heading', $$Le lissage par condensateur et l'adaptateur$$,
        'body', $$La tension obtenue après redressement reste ondulée, même si elle ne change plus de sens. Un condensateur, placé en parallèle à la sortie du montage redresseur, permet de lisser cette tension en réduisant fortement son ondulation, ce qui la rapproche d'une tension continue. Un adaptateur, tel que le chargeur d'un téléphone ou d'un ordinateur portable, enchaîne ces trois transformations dans l'ordre : un transformateur abaisseur diminue d'abord la tension du secteur, un pont de diodes la redresse ensuite, puis un condensateur la lisse pour obtenir une tension quasi continue.$$,
        'highlights', array[$$condensateur$$, $$lissage$$, $$adaptateur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un condensateur lisse une tension redressée en réduisant son ondulation. Un adaptateur enchaîne toujours : abaissement (transformateur), puis redressement (pont de diodes), puis lissage (condensateur), pour obtenir une tension quasi continue à partir du secteur.$$),
        'example', jsonb_build_object('statement', $$Le chargeur d'un téléphone est branché sur le secteur et alimente correctement la batterie avec une tension quasi continue. Quels sont, dans l'ordre, les trois éléments qui composent ce chargeur ?$$, 'solution', $$Un transformateur abaisseur, suivi d'un pont de diodes, suivi d'un condensateur.$$),
        'fixation', jsonb_build_object('question', $$Quel composant permet de réduire l'ondulation d'une tension redressée pour la rapprocher d'une tension continue ?$$, 'solution', $$Le condensateur.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 100),
          'points', jsonb_build_array(
            jsonb_build_object('x', 10, 'y', 85),
            jsonb_build_object('x', 35, 'y', 15),
            jsonb_build_object('x', 60, 'y', 85),
            jsonb_build_object('x', 85, 'y', 15),
            jsonb_build_object('x', 110, 'y', 85),
            jsonb_build_object('x', 135, 'y', 15),
            jsonb_build_object('x', 160, 'y', 85),
            jsonb_build_object('x', 185, 'y', 15)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(1,2), jsonb_build_array(2,3), jsonb_build_array(3,4), jsonb_build_array(4,5), jsonb_build_array(5,6), jsonb_build_array(6,7))
        )
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une séance de travaux pratiques, un professeur de Physique-Chimie demande à un groupe d'élèves de produire, à partir du courant du secteur, une tension continue capable de faire fonctionner un petit moteur. Il met à leur disposition un transformateur, un pont de diodes et un condensateur.$$,
      'questions', array[
        $$Décris simplement ce qu'est un transformateur.$$,
        $$Quel est le rôle du pont de diodes placé après le transformateur ?$$,
        $$Pourquoi le condensateur est-il indispensable pour que le moteur fonctionne correctement ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un transformateur ne fonctionne-t-il qu'en courant alternatif ou peut-il aussi fonctionner en courant continu ?$$,
      'hint', $$Pense au principe du couplage magnétique entre ses deux bobines.$$,
      'expected', $$Il ne fonctionne qu'en courant alternatif ; il doit être branché à un générateur de tension alternative.$$
    ),
    jsonb_build_object(
      'question', $$Quel composant électronique ne laisse passer le courant que dans un seul sens, appelé sens passant ?$$,
      'hint', $$C'est un composant à deux bornes utilisé pour le redressement.$$,
      'expected', $$La diode.$$
    ),
    jsonb_build_object(
      'question', $$Quelle différence y a-t-il entre un redressement simple alternance et un redressement double alternance ?$$,
      'hint', $$Compare ce que devient l'alternance négative dans chaque cas.$$,
      'expected', $$En simple alternance, l'alternance négative est supprimée (une seule diode) ; en double alternance, elle est transformée en alternance positive (pont de diodes).$$
    ),
    jsonb_build_object(
      'question', $$Range dans le bon ordre les trois éléments d'un adaptateur : condensateur, pont de diodes, transformateur.$$,
      'hint', $$Le transformateur agit toujours en premier sur la tension du secteur.$$,
      'expected', $$Transformateur (abaissement), puis pont de diodes (redressement), puis condensateur (lissage).$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-transformation-redressement-lissage';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En lisant l'étiquette d'une bouteille d'eau minérale, une élève de 4ème remarque que celle-ci indique les formules de plusieurs espèces chimiques portant des charges positives ou négatives. Intriguée, elle en parle à ses camarades de classe : ensemble, avec leur professeur, ils décident de comprendre ce que sont ces espèces chimiques et comment on peut les identifier.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Constitution et neutralité électrique de l'atome$$,
        'body', $$L'atome est la plus petite particule indivisible de la matière. Il est constitué de deux parties : le noyau, situé au centre et porteur de charges électriques positives, et les électrons, qui gravitent autour du noyau et portent des charges électriques négatives. Dans un atome, il y a toujours autant de charges positives portées par le noyau que de charges négatives portées par les électrons : la charge globale de l'atome est donc nulle, et l'on dit qu'il est électriquement neutre.$$,
        'highlights', array[$$atome$$, $$noyau$$, $$électrons$$, $$neutralité électrique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un atome est constitué d'un noyau chargé positivement, autour duquel gravitent des électrons chargés négativement. Le nombre de charges positives du noyau est toujours égal au nombre d'électrons : l'atome est électriquement neutre.$$),
        'example', jsonb_build_object('statement', $$Un atome porte-t-il toujours une charge électrique positive, à cause de son noyau ?$$, 'solution', $$Non : même si le noyau est chargé positivement, les électrons qui l'entourent portent exactement autant de charges négatives, si bien que l'atome, dans son ensemble, est électriquement neutre.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux parties qui constituent un atome, et quel est le signe de la charge électrique de chacune ?$$, 'solution', $$Le noyau, chargé positivement, et les électrons, chargés négativement, qui gravitent autour de lui.$$)
      ),
      jsonb_build_object(
        'heading', $$L'ion : cations et anions$$,
        'body', $$Un ion est un atome, ou un assemblage d'atomes, ayant gagné ou perdu un ou plusieurs électrons. Lorsqu'un atome (ou un assemblage d'atomes) gagne un ou plusieurs électrons, il devient chargé négativement : on l'appelle un anion. Lorsqu'il perd un ou plusieurs électrons, il devient chargé positivement : on l'appelle un cation.$$,
        'highlights', array[$$ion$$, $$cation$$, $$anion$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un cation se forme par perte d'électrons (charge positive) ; un anion se forme par gain d'électrons (charge négative).$$),
        'example', jsonb_build_object('statement', $$Un atome de cuivre perd deux électrons. Quel type d'ion obtient-on, et comment le note-t-on ?$$, 'solution', $$On obtient un cation, l'ion cuivre II, de formule Cu2+.$$),
        'fixation', jsonb_build_object('question', $$Un atome de chlore gagne un électron. L'ion obtenu est-il un cation ou un anion ?$$, 'solution', $$C'est un anion, chargé négativement, puisque l'atome a gagné un électron.$$),
        'table', jsonb_build_object(
          'headers', array[$$Cations$$, $$Formule$$, $$Anions$$, $$Formule$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ion cuivre II$$, $$Cu2+$$, $$Ion hydroxyde$$, $$OH-$$),
            jsonb_build_array($$Ion fer II$$, $$Fe2+$$, $$Ion carbonate$$, $$CO32-$$),
            jsonb_build_array($$Ion fer III$$, $$Fe3+$$, $$Ion sulfate$$, $$SO42-$$),
            jsonb_build_array($$Ion zinc$$, $$Zn2+$$, $$Ion nitrate$$, $$NO3-$$),
            jsonb_build_array($$Ion sodium$$, $$Na+$$, $$Ion chlorure$$, $$Cl-$$),
            jsonb_build_array($$Ion aluminium$$, $$Al3+$$, $$Ion permanganate$$, $$MnO4-$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$La solution aqueuse$$,
        'body', $$Une solution aqueuse est une solution obtenue en dissolvant un corps dans l'eau : l'eau joue le rôle de solvant, et le corps dissous celui de soluté. Une solution aqueuse ionique contient à la fois des cations et des anions, et elle reste globalement électriquement neutre, car les charges positives des cations compensent exactement les charges négatives des anions.$$,
        'highlights', array[$$solution aqueuse$$, $$solvant$$, $$soluté$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une solution aqueuse ionique contient des cations et des anions en quantités telles que leurs charges se compensent : la solution est électriquement neutre.$$),
        'example', jsonb_build_object('statement', $$Une solution de sulfate de cuivre contient des ions cuivre Cu2+ et des ions sulfate SO42-. Pourquoi cette solution est-elle globalement neutre ?$$, 'solution', $$Parce que les charges positives portées par les ions cuivre sont exactement compensées par les charges négatives portées par les ions sulfate.$$),
        'fixation', jsonb_build_object('question', $$Dans une solution aqueuse, quel corps joue le rôle de solvant ?$$, 'solution', $$L'eau.$$)
      ),
      jsonb_build_object(
        'heading', $$Identification des ions métalliques en solution$$,
        'body', $$Certains ions métalliques présentent une couleur caractéristique en solution : l'ion cuivre II (Cu2+) donne une solution bleue, l'ion fer II (Fe2+) une solution vert pâle, l'ion fer III (Fe3+) une solution rouille orangée, tandis que les ions zinc, sodium et aluminium donnent des solutions incolores. On peut aussi identifier certains ions par un test faisant apparaître un précipité caractéristique : la soude forme un précipité bleu avec l'ion cuivre II, vert pâle avec l'ion fer II, rouille avec l'ion fer III et blanc avec l'ion zinc ; le nitrate d'argent forme avec l'ion chlorure un précipité blanc qui noircit à la lumière ; le chlorure de baryum forme avec l'ion sulfate un précipité blanc.$$,
        'highlights', array[$$test d'identification$$, $$précipité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Chaque ion métallique peut être identifié par sa couleur en solution ou par le précipité caractéristique qu'il forme avec un réactif adapté (soude, nitrate d'argent ou chlorure de baryum).$$),
        'example', jsonb_build_object('statement', $$On ajoute quelques gouttes de soude à une solution inconnue et l'on observe l'apparition d'un précipité rouille. Quel ion cette observation révèle-t-elle ?$$, 'solution', $$L'ion fer III (Fe3+), dont le précipité d'hydroxyde formé avec la soude a une couleur rouille caractéristique.$$),
        'fixation', jsonb_build_object('question', $$Quel réactif utilise-t-on pour identifier l'ion sulfate, et quelle observation obtient-on ?$$, 'solution', $$Le chlorure de baryum, qui forme avec l'ion sulfate un précipité blanc.$$),
        'table', jsonb_build_object(
          'headers', array[$$Ion à identifier$$, $$Réactif$$, $$Observation$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ion cuivre II (Cu2+)$$, $$Soude$$, $$Précipité bleu$$),
            jsonb_build_array($$Ion fer II (Fe2+)$$, $$Soude$$, $$Précipité vert pâle$$),
            jsonb_build_array($$Ion fer III (Fe3+)$$, $$Soude$$, $$Précipité rouille$$),
            jsonb_build_array($$Ion chlorure (Cl-)$$, $$Nitrate d'argent$$, $$Précipité blanc noircissant à la lumière$$),
            jsonb_build_array($$Ion sulfate (SO42-)$$, $$Chlorure de baryum$$, $$Précipité blanc$$)
          )
        )
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Sur l'étiquette de flacons du laboratoire de Physique-Chimie de son collège, une élève découvre les inscriptions suivantes : sulfate de fer, chlorure de fer. Elle sait que chacun de ces produits contient des ions, mais souhaite les identifier précisément.$$,
      'questions', array[
        $$Donne le nom et la formule des ions contenus dans le sulfate de fer, sachant qu'il contient de l'ion fer II.$$,
        $$Donne le nom et la formule des ions contenus dans le chlorure de fer, sachant qu'il contient de l'ion fer III.$$,
        $$Indique le réactif permettant d'identifier l'ion sulfate, ainsi que celui permettant d'identifier l'ion chlorure.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un atome neutre possède 12 protons dans son noyau. Combien possède-t-il d'électrons ?$$,
      'hint', $$Pense à la neutralité électrique de l'atome.$$,
      'expected', $$12 électrons, car un atome neutre a autant d'électrons que de protons.$$
    ),
    jsonb_build_object(
      'question', $$Un atome de zinc perd deux électrons. Quel ion obtient-on, et quelle est sa formule ?$$,
      'hint', $$Une perte d'électrons forme un cation.$$,
      'expected', $$On obtient l'ion zinc, cation de formule Zn2+.$$
    ),
    jsonb_build_object(
      'question', $$Quelle couleur observe-t-on lorsqu'une solution contient des ions cuivre II (Cu2+) ?$$,
      'hint', $$C'est la couleur bien connue du sulfate de cuivre.$$,
      'expected', $$La solution est bleue.$$
    ),
    jsonb_build_object(
      'question', $$Quel réactif permet d'identifier l'ion chlorure, et quelle observation caractéristique obtient-on ?$$,
      'hint', $$Le précipité obtenu réagit à la lumière.$$,
      'expected', $$Le nitrate d'argent, qui forme avec l'ion chlorure un précipité blanc noircissant à la lumière.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-atomes-ions';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'une séance de travaux pratiques de chimie, un élève de 4ème laisse tomber par mégarde un objet métallique dans un produit chimique. Le lendemain matin, il constate que l'objet a disparu dans le liquide. Intrigué, il en parle à ses camarades de classe : ensemble, avec leur professeur de Physique-Chimie, ils décident de comprendre comment un métal peut se transformer en ion, et réciproquement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Transformation chimique du cuivre en ion cuivre II$$,
        'body', $$Lorsqu'on verse de l'acide nitrique sur des copeaux de cuivre, on observe un dégagement de gaz roux (le dioxyde d'azote, NO2, un gaz très toxique), la disparition progressive des copeaux de cuivre, et l'apparition d'une solution bleue. En ajoutant de la soude à cette solution, on obtient un précipité bleu, caractéristique de l'ion cuivre II. Cette réaction chimique correspond donc à la transformation du métal cuivre en ion cuivre II, avec libération de deux électrons.$$,
        'highlights', array[$$acide nitrique$$, $$ion cuivre II$$, $$gaz roux$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'action de l'acide nitrique sur le cuivre transforme le métal cuivre (Cu) en ion cuivre II (Cu2+), selon l'équation Cu → Cu2+ + 2e-.$$),
        'example', jsonb_build_object('statement', $$On verse de l'acide nitrique sur un copeau de cuivre. Après quelques instants, on ajoute de la soude à la solution obtenue et un précipité bleu apparaît. Quel ion cette observation met-elle en évidence ?$$, 'solution', $$L'ion cuivre II (Cu2+), dont l'hydroxyde forme un précipité bleu caractéristique avec la soude.$$),
        'fixation', jsonb_build_object('question', $$Quel gaz toxique se dégage lorsque l'acide nitrique réagit avec le cuivre métallique ?$$, 'solution', $$Le dioxyde d'azote (NO2), reconnaissable à sa couleur rousse.$$)
      ),
      jsonb_build_object(
        'heading', $$Transformation chimique de l'ion cuivre II en cuivre métal$$,
        'body', $$Lorsqu'on plonge un clou de fer dans une solution bleue de sulfate de cuivre (contenant des ions cuivre II), on observe un dépôt rouge de cuivre métallique sur le clou, tandis que la solution, initialement bleue, devient progressivement verte. En ajoutant de la soude à cette solution devenue verte, on obtient un précipité vert, caractéristique de l'ion fer II. Les ions cuivre II se transforment donc en cuivre métal en captant des électrons, tandis que le fer métallique se transforme simultanément en ions fer II en cédant ces mêmes électrons.$$,
        'highlights', array[$$sulfate de cuivre$$, $$dépôt de cuivre$$, $$ion fer II$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Cu2+ + 2e- → Cu (réduction de l'ion cuivre II) ; Fe → Fe2+ + 2e- (oxydation du fer). Ces deux transformations se produisent simultanément, ce qui se traduit par l'équation-bilan globale : Fe + Cu2+ → Cu + Fe2+.$$),
        'example', jsonb_build_object('statement', $$Après avoir plongé un clou de fer dans une solution de sulfate de cuivre, on observe un dépôt rouge sur le clou et la solution devient verte. Explique ces deux observations à l'aide de l'équation-bilan de la réaction.$$, 'solution', $$Le dépôt rouge est du cuivre métal, formé par la réduction des ions cuivre II (Cu2+ + 2e- → Cu) ; la couleur verte provient des ions fer II formés par l'oxydation du fer (Fe → Fe2+ + 2e-), conformément à l'équation globale Fe + Cu2+ → Cu + Fe2+.$$),
        'fixation', jsonb_build_object('question', $$Écris l'équation-bilan globale de la réaction entre le fer métallique et les ions cuivre II.$$, 'solution', $$Fe + Cu2+ → Cu + Fe2+.$$)
      ),
      jsonb_build_object(
        'heading', $$Transformation électrochimique par électrolyse$$,
        'body', $$Lorsqu'un courant électrique traverse une solution de sulfate de cuivre entre une anode de cuivre et une cathode de graphite, on observe un dépôt rouge de cuivre sur la cathode, une diminution de l'épaisseur de l'anode de cuivre, et une solution qui ne change pas de couleur. À l'anode, le métal cuivre se transforme en ions cuivre II ; à la cathode, les ions cuivre II se transforment en métal cuivre. Ces réactions, provoquées par le passage du courant électrique, sont appelées réactions électrochimiques.$$,
        'highlights', array[$$électrolyse$$, $$anode$$, $$cathode$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$À l'anode : Cu → Cu2+ + 2e- (le métal s'use). À la cathode : Cu2+ + 2e- → Cu (un dépôt métallique se forme). Ces transformations, dites électrochimiques, nécessitent le passage d'un courant électrique imposé par un générateur.$$),
        'example', jsonb_build_object('statement', $$Lors d'une électrolyse d'une solution de sulfate de cuivre avec une anode de cuivre et une cathode de graphite, pourquoi l'anode de cuivre s'amincit-elle progressivement ?$$, 'solution', $$Parce qu'à l'anode, les atomes de cuivre métallique se transforment en ions cuivre II qui passent en solution (Cu → Cu2+ + 2e-), ce qui réduit progressivement l'épaisseur de l'anode.$$),
        'fixation', jsonb_build_object('question', $$Qu'observe-t-on à la cathode de graphite lors de l'électrolyse d'une solution de sulfate de cuivre ?$$, 'solution', $$Un dépôt rouge de cuivre métallique, formé par la réduction des ions cuivre II présents en solution.$$)
      ),
      jsonb_build_object(
        'heading', $$Nature du courant électrique$$,
        'body', $$Dans les métaux, le courant électrique correspond à la circulation d'électrons libres. Dans les solutions aqueuses en revanche, le courant est dû à une double migration des ions : les cations se déplacent dans un sens, les anions dans l'autre.$$,
        'highlights', array[$$électrons libres$$, $$migration des ions$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un métal, le courant électrique est assuré par la circulation d'électrons libres. Dans une solution aqueuse, il résulte de la double migration des ions (cations et anions se déplaçant en sens opposés).$$),
        'example', jsonb_build_object('statement', $$Quelle est la différence entre la nature du courant électrique dans un fil de cuivre et dans une solution de sulfate de cuivre ?$$, 'solution', $$Dans le fil de cuivre, le courant est dû à la circulation d'électrons libres ; dans la solution, il est dû à la double migration des ions cuivre et sulfate en sens opposés.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui assure le passage du courant électrique dans une solution aqueuse ionique ?$$, 'solution', $$La double migration des ions : les cations et les anions se déplacent chacun dans un sens.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un professeur plonge une lame de zinc dans une solution bleue de sulfate de cuivre. Après quelques instants, un dépôt rougeâtre apparaît sur la lame, et la couleur bleue de la solution s'atténue.$$,
      'questions', array[
        $$Quel métal se dépose sur la lame de zinc ?$$,
        $$Écris l'équation-bilan de cette réaction, sachant que le zinc se transforme en ions zinc Zn2+ en cédant deux électrons.$$,
        $$Cette transformation est-elle une réaction chimique spontanée ou une réaction électrochimique nécessitant un générateur ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel gaz toxique se dégage lorsqu'on verse de l'acide nitrique sur des copeaux de cuivre ?$$,
      'hint', $$Il est reconnaissable à sa couleur rousse.$$,
      'expected', $$Le dioxyde d'azote (NO2).$$
    ),
    jsonb_build_object(
      'question', $$Écris l'équation-bilan de la réaction entre le métal fer et les ions cuivre II.$$,
      'hint', $$Le fer s'oxyde pendant que l'ion cuivre se réduit.$$,
      'expected', $$Fe + Cu2+ → Cu + Fe2+.$$
    ),
    jsonb_build_object(
      'question', $$Lors de l'électrolyse d'une solution de sulfate de cuivre, que se passe-t-il à l'anode de cuivre ?$$,
      'hint', $$Pense au sens de la transformation : métal vers ion.$$,
      'expected', $$Le cuivre métallique de l'anode se transforme en ions cuivre II qui passent en solution (Cu → Cu2+ + 2e-), ce qui amincit l'anode.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la nature du courant électrique dans une solution aqueuse ionique ?$$,
      'hint', $$Ce n'est pas une circulation d'électrons libres comme dans un métal.$$,
      'expected', $$Le courant résulte de la double migration des ions : les cations et les anions se déplacent en sens opposés.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-transformation-metal-ion';

update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$L'eau distribuée par la SODECI dans une ville de Côte d'Ivoire provient d'un lac qui reçoit des eaux de ruissellement, chargées d'impuretés. Pourtant, l'eau qui arrive au robinet des habitations est consommée sans aucun risque. Des élèves de 4ème, avec l'aide de leur professeur de Physique-Chimie, décident de comprendre par quelles étapes cette eau doit passer pour devenir potable.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Nécessité de traiter l'eau et agents de pollution$$,
        'body', $$L'eau est indispensable à la vie, mais elle peut aussi en présenter un danger lorsqu'elle est polluée. C'est pourquoi elle doit être traitée avant toute consommation : en Côte d'Ivoire, c'est notamment le rôle de la SODECI, société de distribution d'eau. Parmi les agents responsables de la pollution de l'eau figurent les bactéries, les déchets organiques et les produits phytosanitaires (utilisés en agriculture).$$,
        'highlights', array[$$SODECI$$, $$agents de pollution$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'eau doit être traitée avant consommation à cause de plusieurs agents de pollution : bactéries, déchets organiques, produits phytosanitaires.$$),
        'example', jsonb_build_object('statement', $$Pourquoi une eau prélevée directement dans un lac ne peut-elle pas être bue sans traitement préalable ?$$, 'solution', $$Parce qu'elle peut contenir des agents de pollution comme des bactéries, des déchets organiques ou des produits phytosanitaires, dangereux pour la santé.$$),
        'fixation', jsonb_build_object('question', $$Cite trois agents responsables de la pollution de l'eau.$$, 'solution', $$Les bactéries, les déchets organiques et les produits phytosanitaires.$$)
      ),
      jsonb_build_object(
        'heading', $$Les étapes du traitement physico-chimique de l'eau$$,
        'body', $$Le traitement de l'eau brute suit plusieurs étapes successives. La floculation consiste à injecter dans l'eau un réactif, le sulfate d'alumine, qui provoque la formation de flocons regroupant la matière organique en suspension. Vient ensuite la décantation, durant laquelle l'eau est laissée au repos pour que ces flocons se déposent. La filtration fait ensuite passer l'eau à travers un filtre qui ne laisse passer que les particules les plus légères. La désinfection (ou stérilisation), réalisée à l'aide d'hypochlorite de calcium, d'ozone ou de dichlore gazeux, détruit les micro-organismes susceptibles de transmettre des maladies. Enfin, la neutralisation ajuste le pH de l'eau pour le rendre neutre (pH = 7).$$,
        'highlights', array[$$floculation$$, $$décantation$$, $$filtration$$, $$désinfection$$, $$neutralisation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les étapes du traitement physico-chimique de l'eau se déroulent toujours dans le même ordre : floculation, décantation, filtration, désinfection, puis neutralisation.$$),
        'example', jsonb_build_object('statement', $$Pourquoi ajoute-t-on du sulfate d'alumine à l'eau avant l'étape de décantation ?$$, 'solution', $$Le sulfate d'alumine provoque la floculation : il regroupe les particules organiques en suspension en flocons plus gros, qui pourront ensuite se déposer lors de la décantation.$$),
        'fixation', jsonb_build_object('question', $$Range dans l'ordre les cinq étapes du traitement physico-chimique de l'eau.$$, 'solution', $$Floculation, décantation, filtration, désinfection, neutralisation.$$),
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Floculation$$, $$Regrouper les particules en flocons grâce au sulfate d'alumine$$),
            jsonb_build_array($$Décantation$$, $$Laisser les flocons se déposer au repos$$),
            jsonb_build_array($$Filtration$$, $$Ne laisser passer que les particules légères$$),
            jsonb_build_array($$Désinfection$$, $$Détruire les micro-organismes pathogènes$$),
            jsonb_build_array($$Neutralisation$$, $$Ramener le pH de l'eau à une valeur neutre (pH = 7)$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Interprétation d'une facture d'eau$$,
        'body', $$Une facture d'eau, comme celle de la SODECI, se base sur des relevés appelés index. L'ancien index correspond à l'index relevé lors de la facture précédente, tandis que le nouvel index correspond au relevé actuel du compteur. Le cubage consommé, exprimé en mètres cubes, s'obtient en calculant la différence entre le nouvel index et l'ancien index.$$,
        'highlights', array[$$ancien index$$, $$nouvel index$$, $$cubage consommé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Cubage consommé = Nouvel index − Ancien index.$$),
        'example', jsonb_build_object('statement', $$Sur une facture, l'ancien index est de 1 210 m3 et le nouvel index de 1 305 m3. Calcule le cubage consommé.$$, 'solution', $$Cubage consommé = 1 305 − 1 210 = 95 m3.$$),
        'fixation', jsonb_build_object('question', $$Que représente le cubage consommé indiqué sur une facture d'eau ?$$, 'solution', $$Il représente la quantité d'eau, en mètres cubes, consommée depuis le relevé précédent ; il s'obtient en soustrayant l'ancien index du nouvel index.$$)
      ),
      jsonb_build_object(
        'heading', $$Bons comportements pour économiser l'eau$$,
        'body', $$La préservation de l'eau est l'affaire de tous : quelques gestes simples permettent de réduire de 20 à 30 % la consommation d'eau d'un foyer. On peut par exemple préférer les douches aux bains, ne pas laisser couler l'eau en se brossant les dents, utiliser une chasse d'eau à double commande, laver une voiture à l'éponge plutôt qu'au jet, arroser le jardin le soir pour limiter l'évaporation, et être économe en eau lors du lavage des légumes ou des vêtements.$$,
        'highlights', array[$$économie d'eau$$, $$gestes éco-citoyens$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Des gestes éco-citoyens simples (douches plutôt que bains, chasse d'eau à double commande, arrosage du soir...) peuvent réduire de 20 à 30 % la consommation d'eau d'un foyer.$$),
        'example', jsonb_build_object('statement', $$Pourquoi conseille-t-on d'arroser un jardin le soir plutôt qu'en pleine journée ?$$, 'solution', $$Parce que la chaleur du jour favorise l'évaporation de l'eau ; arroser le soir limite cette évaporation et permet à l'eau de mieux profiter aux plantes.$$),
        'fixation', jsonb_build_object('question', $$Cite deux gestes simples permettant de réduire la consommation d'eau d'un foyer.$$, 'solution', $$Par exemple : préférer les douches aux bains, et ne pas laisser couler l'eau en se brossant les dents.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un village situé loin d'une usine de traitement, les habitants sont obligés d'utiliser l'eau d'un marigot. L'infirmier du village sensibilise la population sur les risques de maladies liés à la consommation de cette eau non traitée.$$,
      'questions', array[
        $$Cite deux agents responsables de la pollution de l'eau du marigot.$$,
        $$Énumère, dans l'ordre, les étapes du traitement physico-chimique qui permettraient de rendre cette eau potable.$$,
        $$Propose une méthode simple, adaptée à un village sans usine de traitement, pour rendre l'eau du marigot plus sûre à consommer.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel réactif utilise-t-on lors de l'étape de floculation du traitement de l'eau ?$$,
      'hint', $$C'est un sel d'aluminium.$$,
      'expected', $$Le sulfate d'alumine.$$
    ),
    jsonb_build_object(
      'question', $$Quelle étape du traitement de l'eau permet de détruire les micro-organismes susceptibles de transmettre des maladies ?$$,
      'hint', $$Elle peut être réalisée à l'ozone, au chlore ou à l'hypochlorite de calcium.$$,
      'expected', $$La désinfection (ou stérilisation).$$
    ),
    jsonb_build_object(
      'question', $$Sur une facture d'eau, l'ancien index est de 980 m3 et le nouvel index de 1 040 m3. Calcule le cubage consommé.$$,
      'hint', $$Cubage consommé = Nouvel index − Ancien index.$$,
      'expected', $$Cubage consommé = 1 040 − 980 = 60 m3.$$
    ),
    jsonb_build_object(
      'question', $$Cite un geste simple permettant de réduire la consommation d'eau d'un foyer.$$,
      'hint', $$Pense à la douche, à la chasse d'eau ou à l'arrosage du jardin.$$,
      'expected', $$Par exemple : préférer les douches aux bains, utiliser une chasse d'eau à double commande, ou arroser le jardin le soir.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-traitement-eau';

