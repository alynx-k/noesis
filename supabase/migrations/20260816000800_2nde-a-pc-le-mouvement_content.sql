-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Physique-Chimie, categoryid=100.
-- Moodle course id 3295: "LEÇON 1: LE MOUVEMENT" (Thème 1: Mécanique)
-- (https://lyc.ecole-ci.org/course/view.php?id=3295)
-- Resource "Je lis le résumé de la leçon", mod_resource id 32779, redirecting
-- to pluginfile "PC 2nd A - P1 Le mouvement.pdf" (série-A-specific document,
-- header "2nde A", 11 pages).
-- Rewritten/paraphrased from the source PDF: the relative character of
-- motion, the notion of a referential (Copernic/heliocentric, geocentric,
-- terrestrial) and a mobile point, space and time frames, the position
-- vector OM and displacement vector M1M2 = OM2 - OM1 (corrected here: the
-- source PDF has a visible typo "OM2 + OM1" for the displacement vector,
-- which is physically inconsistent with the standard definition of a
-- displacement between two positions; the standard formula is used since
-- the task requires equivalent technical accuracy, not verbatim
-- reproduction of an erroneous source), the trajectory (rectiligne,
-- circulaire, curviligne), average speed Vm = d/Δt, instantaneous speed
-- v(ti) via close positions, the velocity vector (point of application,
-- direction = tangent, sense = direction of motion, magnitude = v(t)), and
-- the two motion types studied at this level: uniform rectilinear motion
-- (constant velocity vector) and uniformly varied rectilinear motion
-- (constant direction/sense, varying magnitude). 100% original wording; no
-- sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-pc-le-mouvement',
  '2nde',
  'A',
  'physique-chimie',
  $$Le mouvement$$,
  9,
  '2nde-a-pc-tests-identification-ions',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$De retour de vacances, Mory, élève de seconde, voyage à bord d'un mini-car assis juste à côté du conducteur. Il remarque que l'aiguille d'un des compteurs du tableau de bord se déplace quand le véhicule roule, et s'arrête dès que le véhicule stationne. Son grand frère lui explique que cette aiguille indique la vitesse instantanée du véhicule. De retour à l'école, Mory décide, avec ses camarades et leur professeur, de comprendre précisément ce qu'est un mouvement, comment le repérer, et comment définir vitesse moyenne et vitesse instantanée.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le caractère relatif du mouvement et la notion de référentiel$$,
        'body', $$Considérons un observateur immobile qui regarde un véhicule en mouvement, à bord duquel se trouve un conducteur assis. Par rapport au véhicule, le conducteur est immobile (au repos) ; mais par rapport à l'observateur resté sur le trottoir, ce même conducteur est en mouvement. Un même objet peut donc être à la fois immobile et en mouvement, selon l'objet de référence choisi pour décrire sa position : le mouvement est relatif à ce choix. L'objet de référence (immobile ou considéré comme tel) auquel on rapporte l'étude d'un mouvement est appelé référentiel : c'est un solide indéformable par rapport auquel on décrit le mouvement d'un mobile. On distingue notamment le référentiel de Copernic (ou héliocentrique), utilisé pour étudier le mouvement des astres du système solaire, le référentiel géocentrique, utilisé pour étudier le mouvement des satellites de la Terre, et le référentiel terrestre, utilisé pour étudier le mouvement des objets à la surface de la Terre.$$,
        'highlights', array[$$caractère relatif du mouvement$$, $$référentiel$$, $$référentiel terrestre$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on que le mouvement d'un objet est relatif ?$$, 'solution', $$Parce qu'un même objet peut être immobile par rapport à un référentiel et en mouvement par rapport à un autre : la description du mouvement dépend du référentiel choisi.$$)
      ),
      jsonb_build_object(
        'heading', $$Repérer un point mobile dans l'espace et dans le temps$$,
        'body', $$Tout objet en mouvement peut, selon ses dimensions, être assimilé à un point appelé point mobile. Pour décrire précisément sa position, on utilise un repère d'espace, lié au référentiel, en général orthonormé, qui permet de définir les coordonnées du point mobile (dans l'espace à trois dimensions, dans un plan, ou sur une droite selon le mouvement étudié). On associe également à chaque position une date, grâce à un repère de temps défini par un instant initial choisi arbitrairement comme origine des dates (t = 0) et par une unité de date, la seconde (s) étant l'unité légale. On appelle vecteur-position du point mobile M à une date t le vecteur OM, exprimé dans le repère d'espace par OM = x·i + y·j + z·k. Si M1 et M2 désignent les positions d'un même point mobile à deux dates t1 et t2, le vecteur déplacement du mobile entre ces deux dates est le vecteur M1M2 = OM2 - OM1.$$,
        'highlights', array[$$repère d'espace$$, $$repère de temps$$, $$vecteur-position OM$$, $$vecteur déplacement$$]::text[],
        'example', jsonb_build_object('statement', $$Un point mobile a pour coordonnées (1 ; 4) à la date t1 et (5 ; 3) à la date t2, dans un repère plan. Donne son vecteur-position à chacune de ces deux dates.$$, 'solution', $$À t1 : OM = 1·i + 4·j. À t2 : OM = 5·i + 3·j.$$),
        'fixation', jsonb_build_object('question', $$Que représente le vecteur OM d'un point mobile M à une date t ?$$, 'solution', $$C'est le vecteur-position du point mobile à cette date, reliant l'origine du repère au point M.$$)
      ),
      jsonb_build_object(
        'heading', $$La trajectoire d'un point mobile$$,
        'body', $$La trajectoire d'un point mobile est l'ensemble des positions successivement occupées par ce point au cours de son mouvement ; elle dépend, elle aussi, du référentiel choisi. Selon sa forme, une trajectoire peut être rectiligne (une droite), circulaire (un cercle), ou plus généralement curviligne (une courbe quelconque).$$,
        'highlights', array[$$trajectoire$$, $$rectiligne, circulaire, curviligne$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on une trajectoire qui a la forme d'un cercle ?$$, 'solution', $$Une trajectoire circulaire.$$)
      ),
      jsonb_build_object(
        'heading', $$Vitesse moyenne et vitesse instantanée$$,
        'body', $$La vitesse moyenne Vm d'un mobile est le quotient de la distance d parcourue par la durée Δt mise pour la parcourir : Vm = d / Δt. Elle s'exprime en mètre par seconde (m.s⁻¹ ou m/s), sachant que 1 m.s⁻¹ = 3,6 km/h. La vitesse instantanée, notée v(t), est la vitesse du mobile à un instant précis t -- c'est elle que l'on lit sur les compteurs des véhicules. On l'évalue en calculant la vitesse moyenne entre deux instants très proches encadrant l'instant considéré : pour des positions Mi-1 et Mi+1 relevées aux dates ti-1 et ti+1 qui encadrent ti, on a v(ti) = Mi-1Mi+1 / (ti+1 - ti-1). Lorsque les positions sont enregistrées à intervalles de temps réguliers τ, cette relation se simplifie en v(ti) = Mi-1Mi+1 / (2τ).$$,
        'highlights', array[$$vitesse moyenne Vm = d/Δt$$, $$vitesse instantanée v(t)$$]::text[],
        'example', jsonb_build_object('statement', $$Un automobiliste parcourt d = 60 km entre deux villes en Δt = 55 min. Calcule sa vitesse moyenne en m.s⁻¹.$$, 'solution', $$Vm = d/Δt = 60000 / (55×60) ≈ 18,18 m.s⁻¹.$$),
        'fixation', jsonb_build_object('question', $$Comment évalue-t-on, en pratique, la vitesse instantanée d'un mobile à un instant ti donné ?$$, 'solution', $$En calculant la vitesse moyenne entre deux instants très proches qui encadrent ti.$$)
      ),
      jsonb_build_object(
        'heading', $$Le vecteur-vitesse et la nature du mouvement$$,
        'body', $$À chaque vitesse v(t), on associe un vecteur appelé vecteur-vitesse, noté v(t), caractérisé par un point d'application (la position M du mobile), une direction (la tangente à la trajectoire au point considéré), un sens (celui du mouvement) et une valeur (la vitesse v(t) elle-même, obtenue par v(ti) = Mi-1Mi+1 / (2τ) sur un enregistrement à intervalles réguliers τ). L'étude de ce vecteur-vitesse permet de déterminer la nature du mouvement. Lorsque, dans un mouvement rectiligne, le vecteur-vitesse reste rigoureusement constant -- même direction, même sens, même valeur -- le mouvement est dit rectiligne uniforme. Lorsqu'au contraire, sur une trajectoire rectiligne, le vecteur-vitesse conserve sa direction et son sens mais voit sa valeur varier régulièrement (par exemple en augmentant uniformément), le mouvement est dit rectiligne uniformément varié (accéléré si la vitesse augmente).$$,
        'highlights', array[$$vecteur-vitesse$$, $$mouvement rectiligne uniforme$$, $$mouvement rectiligne uniformément varié$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type de mouvement$$, $$Direction du vecteur-vitesse$$, $$Norme du vecteur-vitesse$$, $$Vecteur-vitesse$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Rectiligne uniforme$$, $$Constante$$, $$Constante$$, $$Constant$$),
            jsonb_build_array($$Rectiligne uniformément varié$$, $$Constante$$, $$Variable$$, $$Non constant$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Dans un mouvement rectiligne uniformément varié, que devient la direction du vecteur-vitesse au cours du temps ? Et sa valeur ?$$, 'solution', $$La direction (et le sens) restent constants, mais la valeur du vecteur-vitesse varie.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au cours d'une séance de travaux pratiques, un professeur demande à des élèves de seconde A de caractériser le mouvement d'un palet autoporteur à partir d'un enregistrement de ses positions successives, prises à intervalles de temps réguliers τ = 60 ms.$$,
      'questions', array[
        $$Rappelle la définition d'un référentiel et cite un exemple utilisé pour l'étude du mouvement d'un objet sur Terre.$$,
        $$Explique comment déterminer la nature (rectiligne, circulaire, curviligne) de la trajectoire d'un mobile à partir d'un enregistrement de positions.$$,
        $$Explique comment calculer la vitesse instantanée du mobile à l'une des positions enregistrées, connaissant τ.$$,
        $$Explique comment reconnaître, à partir des vecteurs-vitesses représentés en différents points, si le mouvement est uniforme ou uniformément varié.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un référentiel ?$$,
      'hint', $$C'est un solide par rapport auquel on décrit un mouvement.$$,
      'expected', $$Un solide indéformable par rapport auquel on décrit le mouvement d'un mobile.$$
    ),
    jsonb_build_object(
      'question', $$Quelle formule donne la vitesse moyenne d'un mobile ?$$,
      'hint', $$C'est une distance divisée par une durée.$$,
      'expected', $$Vm = d / Δt.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les trois formes possibles d'une trajectoire ?$$,
      'hint', $$Une droite, un cercle, ou une courbe quelconque.$$,
      'expected', $$Rectiligne, circulaire ou curviligne.$$
    ),
    jsonb_build_object(
      'question', $$Dans un mouvement rectiligne uniforme, comment varie le vecteur-vitesse au cours du temps ?$$,
      'hint', $$« Uniforme » est un indice important.$$,
      'expected', $$Il reste constant : même direction, même sens, même valeur.$$
    )
  ),
  now()
);
