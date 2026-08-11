-- Physique-Chimie 4ème — Transformation, redressement et lissage d'une
-- tension alternative sinusoïdale.
-- REAL CONTENT sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2010 "Lecon9_Transformation, redressement et
-- lissage d'une tension alternative sinusoïdale", resource id 16416 ("Je
-- lis le résumé de la leçon"), PDF "PC 4ème_L9_Transformatio, redressement
-- et lissage dune tension alternative sinusoïdale.pdf" (11 pages, thème
-- "Courants et tensions alternatifs"). Rewritten in original wording —
-- paraphrased, not copied from the source PDF — keeping the same technical
-- content: le transformateur (quadripôle, primaire/secondaire, ne
-- fonctionne qu'en alternatif, abaisseur/élévateur), la transformation
-- d'une tension (conservation de la nature et de la fréquence, changement
-- de l'amplitude), le redressement par diode (simple alternance) et par
-- pont de diodes (double alternance), le lissage par condensateur, et
-- l'adaptateur (chargeur) qui enchaîne ces trois étapes.
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
