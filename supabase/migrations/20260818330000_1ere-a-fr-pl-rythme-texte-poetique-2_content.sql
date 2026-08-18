-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1873: "PL 2: Rythme_texte_poét_en_prose_2"
-- (https://lyc.ecole-ci.org/course/view.php?id=1873), resource id 15938 —
-- "Séance 2 : le rythme dans le texte en prose" (Leçon 3). Méthodologie
-- réécrite à partir du PDF source (accent d'intensité, pause/coupe,
-- rythme binaire, ternaire, croissant, décroissant). Le PDF source
-- illustre avec un extrait de François Mauriac (Le nœud de vipères, 1932 —
-- sous droits d'auteur, Mauriac étant mort en 1970) et des phrases
-- d'exercice non attribuées : plutôt que de les reproduire, les exemples
-- de phrases ci-dessous sont ENTIÈREMENT ORIGINAUX, construits pour
-- illustrer exactement les mêmes structures rythmiques, en cohérence avec
-- la politique « 100% contenu original » de l'application.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-pl-rythme-texte-poetique-2',
  '1ere',
  'A',
  'francais',
  $$Le rythme dans le texte en prose$$,
  18,
  '1ere-a-fr-pl-rythme-texte-poetique-1',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le rythme ne concerne pas que la poésie : la prose a elle aussi un rythme, créé par la longueur et la construction des groupes de mots qui composent une phrase. Des élèves de 1ère A s'exercent à repérer ces rythmes dans des phrases en prose.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Accent d'intensité et pause$$,
        'body', $$Dans le texte en prose, l'accent d'intensité frappe la dernière syllabe accentuée d'un mot ou d'un groupe de mots (par exemple « les trompettes », où l'accent tombe sur « -pettes »). La pause (ou coupe) se place juste après cette syllabe accentuée, délimitant ainsi les groupes rythmiques de la phrase.$$,
        'highlights', array[$$accent d'intensité : dernière syllabe accentuée$$, $$pause = coupe$$]::text[],
        'fixation', jsonb_build_object('question', $$Où se place la pause (ou coupe) par rapport à la syllabe accentuée ?$$, 'solution', $$Juste après la syllabe accentuée.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rythme binaire et le rythme ternaire$$,
        'body', $$Le rythme est binaire lorsque la phrase se divise en deux groupes (propositions) de construction semblable, créant une symétrie qui permet le parallélisme ou l'opposition des idées. Il est ternaire lorsque la phrase se divise en trois groupes de construction semblable, produisant un effet de parallélisme ou de simultanéité.$$,
        'highlights', array[$$binaire : deux groupes symétriques$$, $$ternaire : trois groupes symétriques$$]::text[],
        'example', jsonb_build_object('statement', $$Identifie le rythme de la phrase : « Elle a vu l'orage approcher, et elle n'a rien pu faire. »$$, 'solution', $$Rythme binaire : la phrase se divise en deux groupes de construction proche (« elle a vu l'orage approcher » / « elle n'a rien pu faire »), créant une opposition entre l'observation et l'impuissance.$$),
        'fixation', jsonb_build_object('question', $$Quel effet produit un rythme ternaire, en plus du parallélisme ?$$, 'solution', $$Un effet de simultanéité, comme si les trois actions ou idées se déroulaient en même temps ou s'enchaînaient rapidement.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rythme croissant et le rythme décroissant$$,
        'body', $$Dans un rythme croissant, les groupes de la phrase deviennent de plus en plus longs, ce qui produit un effet d'amplification, comme une émotion ou une action qui grandit. Dans un rythme décroissant, c'est l'inverse : les groupes deviennent de plus en plus courts, ce qui donne souvent une impression d'essoufflement, de chute ou de conclusion abrupte.$$,
        'highlights', array[$$croissant : groupes de plus en plus longs$$, $$décroissant : groupes de plus en plus courts$$]::text[],
        'example', jsonb_build_object('statement', $$Identifie le rythme de la phrase : « Il tomba, il se releva péniblement, il reprit sa marche vers le village malgré la douleur. »$$, 'solution', $$Rythme croissant : les trois groupes s'allongent progressivement (« il tomba » / « il se releva péniblement » / « il reprit sa marche vers le village malgré la douleur »), ce qui amplifie l'effort du personnage.$$),
        'fixation', jsonb_build_object('question', $$Quelle impression produit généralement un rythme décroissant ?$$, 'solution', $$Une impression d'essoufflement, de chute ou de conclusion abrupte, les groupes de mots se raccourcissant progressivement.$$)
      ),
      jsonb_build_object(
        'heading', $$Reconnaître le rythme d'une phrase$$,
        'body', $$Pour analyser le rythme d'une phrase en prose, on la découpe d'abord en groupes rythmiques (à l'aide des pauses), puis on compte ces groupes (deux, trois ou plus) et on compare leur longueur et leur construction (semblable ou non, croissante ou décroissante) pour nommer le rythme observé.$$,
        'highlights', array[$$découper en groupes → compter → comparer longueur/construction$$],
        'example', jsonb_build_object('statement', $$Identifie le rythme de la phrase : « Ils avaient tant à se dire après ces années de silence, mais les mots, la voix, tout s'est tu. »$$, 'solution', $$Rythme décroissant : les groupes se raccourcissent (« ils avaient tant à se dire après ces années de silence » / « mais les mots » / « la voix » / « tout s'est tu »), traduisant un essoufflement progressif de la parole.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les trois étapes pour analyser le rythme d'une phrase en prose ?$$, 'solution', $$Découper la phrase en groupes rythmiques à l'aide des pauses, compter ces groupes, puis comparer leur longueur et leur construction.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici quatre phrases à analyser : P1 : « J'étais fatigué, et j'avais faim. » P2 : « Il ouvrit la porte, il entra, il s'assit sans un mot. » P3 : « Le vent soufflait doucement, puis plus fort, puis en violentes rafales. » P4 : « Elle avait rêvé de ce voyage pendant des années, elle l'avait préparé dans le moindre détail, et puis, enfin, elle partit. »$$,
      'questions', array[
        $$Identifie le rythme (binaire, ternaire, croissant ou décroissant) de la phrase P1, en justifiant.$$,
        $$Identifie le rythme de la phrase P3, en justifiant.$$,
        $$Identifie le rythme de la phrase P4, en justifiant.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de groupes rythmiques compte une phrase au rythme ternaire ?$$,
      'hint', $$Le préfixe « tern- » l'indique.$$,
      'expected', $$Trois groupes.$$
    ),
    jsonb_build_object(
      'question', $$Quel effet produit un rythme binaire quand les deux groupes expriment des idées contraires ?$$,
      'hint', $$Pense à la relation entre les deux groupes.$$,
      'expected', $$Un effet d'opposition entre les deux idées.$$
    ),
    jsonb_build_object(
      'question', $$Dans un rythme croissant, comment évolue la longueur des groupes de la phrase ?$$,
      'hint', $$C'est l'inverse du rythme décroissant.$$,
      'expected', $$Elle augmente progressivement d'un groupe à l'autre.$$
    ),
    jsonb_build_object(
      'question', $$Où se situe l'accent d'intensité dans un mot ou un groupe de mots en prose ?$$,
      'hint', $$C'est toujours la même syllabe.$$,
      'expected', $$Sur la dernière syllabe accentuée du mot ou du groupe de mots.$$
    )
  ),
  now()
);
