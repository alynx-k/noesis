-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2398: "LEÇON 15: CORROSION ET PROTECTION DES MÉTAUX"
-- (https://lyc.ecole-ci.org/course/view.php?id=2398), resource id 22134.
-- Contenu réécrit à partir du PDF source (définition et causes de la
-- corrosion, corrosion chimique/électrochimique, méthodes de protection :
-- aciers inoxydables, passivation, recouvrement, galvanisation, anode
-- sacrificielle). Tout le contenu est factuel (électrochimie appliquée) :
-- demi-équations, exemples industriels réels et exercices sont
-- repris/adaptés tels quels ; explications reformulées. Cette leçon
-- clôture le thème « Oxydoréduction » et l'ensemble du programme de Chimie
-- de 1ère C sur la plateforme source (leçons 2, 3, 5, 6, 7, 8, 11, 12, 13,
-- 14, 15 — la leçon 4 ayant été sautée pour lacune structurelle confirmée,
-- et aucune leçon 1, 9 ou 10 n'apparaissant dans la liste de cours de
-- cette catégorie).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-corrosion-protection-metaux',
  '1ere',
  'C',
  'physique-chimie',
  $$Corrosion et protection des métaux$$,
  11,
  '1ere-c-pc-chimie-electrolyse',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève en 1ère C au Lycée Moderne Arsène Assouan Usher de Grand-Lahou retrouve une machette oubliée dans le champ de son père, entièrement recouverte de rouille. Son voisin de classe déclare avec assurance qu'il s'agit d'un phénomène de corrosion. Voulant comprendre ce phénomène, il en rend compte aux autres élèves de sa classe et à leur professeur de physique-chimie. Ensemble, ils entreprennent de s'informer sur le phénomène de corrosion, puis d'expliquer les méthodes de protection des métaux.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et causes de la corrosion$$,
        'body', $$La corrosion est l'ensemble des actions physico-chimiques qui produit la détérioration des métaux (et des pierres) exposés à leur environnement. Les métaux ne résistent pas tous de la même façon : les métaux nobles (or, platine) y sont pratiquement insensibles ; certains métaux (aluminium, zinc) sont protégés par une mince couche d'oxyde imperméable qui limite l'oxydation à la surface ; le fer, lui, rouille sous l'action de l'air humide, mais cette rouille étant poreuse, elle ne protège pas le métal et l'attaque continue en profondeur jusqu'à destruction totale de la pièce. On distingue la corrosion chimique, due à l'action directe de liquides ou de gaz sur le métal, et la corrosion électrochimique, où la condensation d'humidité et la dissolution de gaz et poussières forment à la surface du métal une solution ionique : s'il existe deux couples oxydant-réducteur différents (par exemple à cause d'une impureté), une véritable pile électrochimique se forme, et c'est le métal le plus réducteur, à la borne négative, qui se dissout.$$,
        'highlights', array[$$corrosion = détérioration physico-chimique des métaux exposés au milieu$$, $$corrosion chimique : action directe de liquides/gaz$$, $$corrosion électrochimique : pile électrochimique due à une impureté, le métal le plus réducteur se dissout$$]::text[],
        'example', jsonb_build_object('statement', $$Une petite inclusion de cuivre est présente à la surface d'une pièce en fer humide. Quel métal se corrode : le fer ou le cuivre ?$$, 'solution', $$Le fer, car il est plus réducteur que le cuivre (couples Fe²⁺/Fe et Cu²⁺/Cu) : il constitue la borne négative de la micro-pile formée et se dissout.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi la rouille ne protège-t-elle pas le fer contre une corrosion plus profonde ?$$, 'solution', $$Parce que la couche de rouille formée est poreuse, contrairement à la fine couche d'oxyde imperméable qui protège des métaux comme l'aluminium ou le zinc.$$)
      ),
      jsonb_build_object(
        'heading', $$Aciers spéciaux, modification chimique et recouvrement de surface$$,
        'body', $$Pour lutter contre la corrosion, on peut d'abord fabriquer des aciers spéciaux ou inoxydables, par addition de chrome, nickel, titane ou molybdène — efficaces mais coûteux. On peut aussi modifier chimiquement la surface à protéger, en plongeant la pièce dans un bain qui forme une pellicule imperméable : c'est le principe de la passivation à l'acide nitrique, ou de la parkérisation à l'acide phosphorique (procédé de phosphatation superficielle de l'acier, utilisé par exemple pour les carrosseries d'automobiles). Enfin, on peut simplement recouvrir la surface métallique de peintures, vernis, laques, matières plastiques ou émail, pour l'isoler de l'atmosphère oxydante.$$,
        'highlights', array[$$aciers inoxydables : ajout de chrome, nickel, titane, molybdène$$, $$passivation (acide nitrique) et parkérisation (acide phosphorique) : pellicule imperméable$$, $$recouvrement : peintures, vernis, matières plastiques$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce que la parkérisation ?$$, 'solution', $$Un procédé de protection des pièces métalliques par phosphatation superficielle de l'acier (bain d'acide phosphorique), destiné à ralentir le processus de corrosion.$$)
      ),
      jsonb_build_object(
        'heading', $$Immersion dans un métal fondu et recouvrement électrolytique$$,
        'body', $$On peut protéger une pièce de fer en la plongeant dans un métal fondu plus réducteur que lui (le zinc, donnant le fer galvanisé, ou l'étain, donnant le fer blanc) : ce métal recouvre la surface et forme une pile électrochimique où c'est lui qui se dissout, protégeant le fer. On peut aussi obtenir ce dépôt protecteur par électrolyse à anode soluble, comme dans le zincage : à l'anode de zinc, oxydation (Zn → Zn²⁺ + 2e⁻) ; à la cathode (la pièce à protéger), réduction (Zn²⁺ + 2e⁻ → Zn), ce qui dépose une couche de zinc protectrice sur la pièce.$$,
        'highlights', array[$$fer galvanisé = fer + zinc fondu ; fer blanc = fer + étain fondu$$, $$zincage : électrolyse à anode soluble de zinc$$, $$anode : Zn → Zn²⁺ + 2e⁻ ; cathode : Zn²⁺ + 2e⁻ → Zn$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on du fer recouvert d'une couche de zinc par immersion dans du zinc fondu ?$$, 'solution', $$Le fer galvanisé.$$)
      ),
      jsonb_build_object(
        'heading', $$La protection cathodique (anode sacrificielle)$$,
        'body', $$La protection cathodique consiste à réaliser une pile électrochimique dans laquelle la pièce en fer à protéger constitue la cathode, tandis qu'une anode en métal plus réducteur (zinc, aluminium...) est volontairement « sacrifiée » : c'est elle qui s'oxyde et se dissout progressivement, à la place du fer. Cette méthode protège par exemple les canalisations enterrées, les rails, les pylônes, ou les coques de navires, où des plaques de zinc fixées à la coque s'oxydent au fil du temps et doivent être remplacées périodiquement, alors que la coque en fer reste intacte.$$,
        'highlights', array[$$protection cathodique : la pièce à protéger = cathode ; l'anode « sacrificielle » s'oxyde à sa place$$, $$exemples : canalisations enterrées, coques de navires$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi appelle-t-on « sacrificielle » l'anode utilisée pour protéger la coque d'un navire ?$$, 'solution', $$Parce qu'elle est délibérément oxydée (dissoute) à la place du métal à protéger, et doit donc être remplacée périodiquement.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève de 1ère C, absent au cours de chimie sur la corrosion et la protection des métaux, veut comprendre cette leçon pour préparer son devoir de classe. Il te sollicite pour lui expliquer le phénomène de corrosion.$$,
      'questions', array[
        $$Définis la corrosion.$$,
        $$Cite les différentes méthodes de protection contre la corrosion.$$,
        $$Explique la corrosion électrochimique et la corrosion chimique.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels métaux sont pratiquement insensibles à la corrosion ?$$,
      'hint', $$On les appelle des métaux « nobles ».$$,
      'expected', $$Les métaux nobles, comme l'or et le platine.$$
    ),
    jsonb_build_object(
      'question', $$Dans une micro-pile de corrosion formée à la surface du fer, quel métal se dissout : le plus réducteur ou le moins réducteur ?$$,
      'hint', $$C'est celui qui constitue la borne négative de la pile.$$,
      'expected', $$Le métal le plus réducteur (borne négative de la pile).$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la méthode de protection consistant à plonger une pièce métallique dans un bain d'acide nitrique pour former une pellicule protectrice imperméable ?$$,
      'hint', $$C'est une modification chimique de la surface.$$,
      'expected', $$La passivation.$$
    ),
    jsonb_build_object(
      'question', $$Dans la protection cathodique d'une canalisation en fer enterrée, quel rôle joue le fer : anode ou cathode ?$$,
      'hint', $$C'est l'autre métal qui se sacrifie.$$,
      'expected', $$Le fer constitue la cathode ; c'est l'anode (en zinc ou aluminium) qui est sacrifiée à sa place.$$
    )
  ),
  now()
);
