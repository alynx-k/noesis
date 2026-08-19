-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2342: "PL 2: Rythme_texte_poét_en_prose_2"
-- (https://lyc.ecole-ci.org/course/view.php?id=2342), resource id 21510.
-- Content is technical prosodic terminology applied to prose, illustrated
-- by a brief public-domain excerpt (Bossuet, Oraisons funèbres, 17th c.)
-- and a brief 2-3 sentence quotation from François Mauriac's "Le nœud de
-- vipères" (1932), used as a short citation for prosodic/rhythmic
-- analysis — standard practice for teaching stylistics, not reproduction
-- of a substantial narrative excerpt.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-rythme-texte-poetique-2',
  '1ere',
  'C',
  'francais',
  $$Le rythme dans le texte en prose (2)$$,
  18,
  '1ere-c-francais-rythme-texte-poetique-1',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 1ère s'exercent à analyser le rythme, cette fois dans des textes en prose, à partir de deux extraits : « Celui qui règne dans les cieux et de qui relève tous les empires, à qui appartient la gloire, la majesté et l'indépendance, est aussi le seul qui se glorifie de faire la loi aux rois et de leur donner quand il lui plaît de grandes et terribles leçons. » (Bossuet, Oraisons funèbres) ; et : « Je connais mon cœur, ce nœud de vipères étouffé sous elles, saturé de leur venin, il continue de battre au-dessous de ce grouillement. Ce nœud de vipères qu'il est impossible de dénouer, qu'il faudrait trancher d'un coup de couteau, d'un coup de glaive. » (François Mauriac, Le nœud de vipères).$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les unités métriques dans la prose$$,
        'body', $$L'accent d'intensité est celui qui frappe la dernière syllabe accentuée d'un mot ou d'un groupe de mots. La pause, aussi appelée coupe, se place après cette dernière syllabe accentuée. Dans une phrase en prose, on découpe ainsi le texte en groupes rythmiques successifs, chacun se terminant sur une syllabe accentuée suivie d'une pause.$$,
        'highlights', array[$$accent d'intensité : frappe la dernière syllabe accentuée d'un groupe de mots$$, $$pause (coupe) : se place après cette syllabe accentuée$$]::text[],
        'example', jsonb_build_object('statement', $$Découpe la phrase suivante en groupes rythmiques : « Les trompettes, les fifres, les hautbois, les tambours, les canons... »$$, 'solution', $$Les trompet- / tes, les fifres / , les hautbois / , les tambours / , les canons… — chaque groupe se termine par une pause après la syllabe accentuée.$$),
        'fixation', jsonb_build_object('question', $$Où se place la pause (ou coupe) dans un groupe rythmique en prose ?$$, 'solution', $$Immédiatement après la dernière syllabe accentuée du groupe.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rythme binaire et le rythme ternaire$$,
        'body', $$On parle de rythme binaire lorsque deux propositions d'une phrase ont la même construction, créant une symétrie qui permet le parallélisme ou l'opposition des idées (ex. « Elle a vu ta blessure / et n'a pas pu la fermer. »). On parle de rythme ternaire lorsque trois propositions ont la même construction, produisant un effet de parallélisme ou de simultanéité (ex. « Je n'ai plus rien à apprendre, / j'ai marché plus vite qu'un autre, / et j'ai fait le tour de ma vie. »).$$,
        'highlights', array[$$rythme binaire : 2 propositions symétriques → parallélisme ou opposition$$, $$rythme ternaire : 3 propositions symétriques → parallélisme ou simultanéité$$]::text[],
        'example', jsonb_build_object('statement', $$Identifie le type de rythme de la phrase : « C'est là qu'il faut aller vivre, / c'est là qu'il faut aller mourir ! »$$, 'solution', $$C'est un rythme binaire : deux propositions de construction identique (« c'est là qu'il faut aller... »), créant une opposition entre « vivre » et « mourir ».$$),
        'fixation', jsonb_build_object('question', $$Quel effet produit généralement un rythme ternaire par rapport à un rythme binaire ?$$, 'solution', $$Un effet de parallélisme ou de simultanéité entre trois éléments, plutôt qu'une simple symétrie à deux termes (souvent utilisée pour l'opposition).$$)
      ),
      jsonb_build_object(
        'heading', $$Le rythme croissant et le rythme décroissant$$,
        'body', $$Dans un rythme croissant, les groupes de mots ou propositions d'une phrase deviennent de plus en plus longs, produisant un effet d'amplitude (ex. « Va-t'en, chétif insecte, excrément de la terre. »). Dans un rythme décroissant, à l'inverse, les groupes de mots deviennent de plus en plus courts (ex. « Vous aviez demandé à me voir, / vous m'avez vu, / je m'en vais, / adieu. »), produisant souvent un effet de chute ou d'apaisement.$$,
        'highlights', array[$$rythme croissant : groupes de plus en plus longs → effet d'amplitude$$, $$rythme décroissant : groupes de plus en plus courts → effet de chute$$]::text[],
        'example', jsonb_build_object('statement', $$Quel effet produit le rythme décroissant de la phrase « Vous aviez demandé à me voir, vous m'avez vu, je m'en vais, adieu » ?$$, 'solution', $$La brièveté croissante des groupes de mots mime une scène qui se referme rapidement, un départ qui s'accélère, jusqu'au mot final « adieu », très court et sans appel.$$),
        'fixation', jsonb_build_object('question', $$Quel effet stylistique un rythme croissant permet-il généralement de produire ?$$, 'solution', $$Un effet d'amplitude, d'accumulation ou d'intensification progressive.$$)
      ),
      jsonb_build_object(
        'heading', $$Appliquer l'analyse du rythme$$,
        'body', $$Pour analyser le rythme d'une phrase en prose, on identifie d'abord les groupes rythmiques (séparés par des pauses), puis on compare leur nombre et leur longueur relative pour déterminer le type de rythme (binaire, ternaire, croissant, décroissant), avant d'en interpréter l'effet.$$,
        'highlights', array[$$démarche : identifier les groupes rythmiques → comparer leur nombre/longueur → interpréter l'effet$$]::text[],
        'example', jsonb_build_object('statement', $$Analyse le rythme de la phrase : « Tu as bien fait d'arriver, j'allais quitter l'appartement. »$$, 'solution', $$Deux groupes rythmiques de construction comparable (« Tu as bien fait d'arriver » / « j'allais quitter l'appartement ») : c'est un rythme binaire, qui met en relation deux actions presque simultanées.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois étapes de la démarche d'analyse du rythme d'une phrase en prose ?$$, 'solution', $$Identifier les groupes rythmiques, comparer leur nombre et leur longueur relative pour déterminer le type de rythme, puis en interpréter l'effet stylistique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Analyse le rythme des phrases suivantes : P1 : « J'étais en ville, au bar, à la terrasse. » P2 : « Ils se divisent aussitôt en deux bandes comme des moissonneurs, et vont vendre leurs services à quiconque veut les employer. » P3 : « Elle avait reçu beaucoup d'éducation, elle écrivait comme un greffier, et avait appris à lire à son fils. »$$,
      'questions', array[
        $$Découpe chacune des trois phrases en groupes rythmiques.$$,
        $$Indique, pour chaque phrase, si le rythme est binaire, ternaire, croissant ou décroissant.$$,
        $$Pour la phrase P3, explique quel effet stylistique produit ce rythme, en lien avec le sens de la phrase (l'énumération des qualités du personnage).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Où se place l'accent d'intensité dans un groupe de mots en prose ?$$,
      'hint', $$C'est toujours la même position, quel que soit le groupe.$$,
      'expected', $$Sur la dernière syllabe accentuée du mot ou du groupe de mots.$$
    ),
    jsonb_build_object(
      'question', $$Combien de propositions de même construction caractérisent un rythme ternaire ?$$,
      'hint', $$Le nom du rythme l'indique.$$,
      'expected', $$Trois propositions de construction identique.$$
    ),
    jsonb_build_object(
      'question', $$Que produit un rythme croissant, en termes d'effet stylistique ?$$,
      'hint', $$Il s'agit d'un effet d'accumulation.$$,
      'expected', $$Un effet d'amplitude ou d'intensification progressive, les groupes de mots devenant de plus en plus longs.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la première étape pour analyser le rythme d'une phrase en prose ?$$,
      'hint', $$Elle précède la comparaison et l'interprétation.$$,
      'expected', $$Identifier les groupes rythmiques de la phrase, séparés par des pauses.$$
    )
  ),
  now()
);
