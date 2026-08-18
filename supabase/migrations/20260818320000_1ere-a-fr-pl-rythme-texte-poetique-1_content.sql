-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1871: "PL 1: Rythme_texte_poét_en_prose_1"
-- (https://lyc.ecole-ci.org/course/view.php?id=1871), resource id 15914 —
-- "Leçon 3 : le rythme dans le texte poétique et dans le texte en prose,
-- séance 1 : étudier le rythme dans le texte poétique". Contenu réécrit à
-- partir du PDF source (accent tonique, mesure, coupes, césure et
-- hémistiches, enjambement/rejet/contre-rejet, sonorités, types de rimes,
-- rythme binaire/ternaire). Les vers cités (Corneille, Le Cid, 1636 ;
-- Musset, Les Nuits, 1835-37 ; Baudelaire, "L'horloge", Les Fleurs du Mal,
-- 1857 ; La Fontaine, Fables, 1668) sont dans le domaine public (auteurs
-- morts depuis largement plus de 70 ans) et cités ponctuellement, comme
-- c'est nécessaire pour tout enseignement de la prosodie — reformulation
-- des explications, citations fidèles des vers eux-mêmes.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-pl-rythme-texte-poetique-1',
  '1ere',
  'A',
  'francais',
  $$Le rythme dans le texte poétique (1)$$,
  17,
  '1ere-a-fr-resume-rediger-resume',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 1ère A ont du mal à analyser le rythme d'un texte poétique : accents, coupes, rimes. Ils décident de s'exercer à partir de vers classiques, en commençant par cette réplique célèbre de Rodrigue dans Le Cid de Corneille : « Ô rage ! Ô désespoir ! Ô vieillesse ennemie ! / N'ai-je donc tant vécu pour cette infamie ? / Et ne suis-je blanchi dans les travaux guerriers / Que pour voir en un jour flétrir tant de lauriers ? »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'accent tonique et la mesure du rythme$$,
        'body', $$Dans un mot, certaines syllabes sont plus marquées (accentuées, ou toniques) que d'autres (atones). Quand un mot se termine par une syllabe contenant un « e » muet (terminaison féminine, comme « infamie »), l'accent tonique porte sur l'avant-dernière syllabe. Sinon (terminaison masculine, comme « désespoir »), il porte sur la dernière syllabe. C'est le retour régulier de ces accents toniques, placés sur la dernière syllabe accentuée de chaque groupe de mots formant une unité grammaticale, qui crée le rythme du vers.$$,
        'highlights', array[$$syllabe tonique / atone$$, $$terminaison féminine → avant-dernière syllabe$$, $$terminaison masculine → dernière syllabe$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le vers « Ô rage ! Ô désespoir ! Ô vieillesse ennemie ! », identifie les syllabes toniques de « désespoir » et de « ennemie ».$$, 'solution', $$« Désespoir » est à terminaison masculine : l'accent porte sur la dernière syllabe (-poir). « Ennemie » est à terminaison féminine (le « e » final est muet) : l'accent porte sur l'avant-dernière syllabe (-mi-).$$),
        'fixation', jsonb_build_object('question', $$Sur quelle syllabe porte l'accent tonique d'un mot à terminaison féminine (qui se termine par un « e » muet) ?$$, 'solution', $$Sur l'avant-dernière syllabe du mot.$$)
      ),
      jsonb_build_object(
        'heading', $$Coupes, césure et hémistiches$$,
        'body', $$La coupe se place immédiatement après une syllabe accentuée. Dans l'alexandrin (vers de douze syllabes), la coupe principale qui le partage en deux parties égales de six syllabes s'appelle la césure ; chacune des deux moitiés obtenues est un hémistiche.$$,
        'highlights', array[$$coupe$$, $$césure = coupe centrale de l'alexandrin$$, $$hémistiche = chaque moitié$$]::text[],
        'example', jsonb_build_object('statement', $$Découpe le vers « N'ai-je donc tant vécu // que pour cette infamie ? » en ses deux hémistiches, en indiquant la césure.$$, 'solution', $$Premier hémistiche : « N'ai-je donc tant vécu » (6 syllabes). Césure. Second hémistiche : « que pour cette infamie ? » (6 syllabes).$$),
        'fixation', jsonb_build_object('question', $$Combien de syllabes compte un alexandrin, et combien chaque hémistiche en comporte-t-il ?$$, 'solution', $$L'alexandrin compte douze syllabes ; chaque hémistiche en comporte six.$$)
      ),
      jsonb_build_object(
        'heading', $$Enjambement, rejet et contre-rejet$$,
        'body', $$On parle d'enjambement quand la phrase déborde d'un vers sur le suivant sans marquer de pause à la rime, ce qui traduit souvent un mouvement ou une durée qui se prolonge. Le rejet est le cas particulier où un élément court est rejeté en tout début du vers suivant, ce qui met ce mot en relief. Le contre-rejet, à l'inverse, place en fin de vers un élément court qui annonce déjà le vers suivant.$$,
        'highlights', array[$$enjambement : la phrase déborde sur le vers suivant$$, $$rejet : élément court rejeté au début du vers suivant$$, $$contre-rejet : élément court en fin de vers$$]::text[],
        'example', jsonb_build_object('statement', $$Dans les vers de La Fontaine : « Même il m'est arrivé quelquefois de manger / Le berger. », quel effet produit le rejet du mot « berger » ?$$, 'solution', $$Le rejet de « le berger » au début du vers suivant met ce mot clé en évidence, créant un effet de surprise comique (le loup avoue avoir mangé non seulement les moutons, mais aussi le berger).$$),
        'fixation', jsonb_build_object('question', $$Quel effet général produit généralement un enjambement ?$$, 'solution', $$Il traduit souvent un mouvement qui s'amplifie ou une durée qui se prolonge, en refusant la pause attendue à la fin du vers.$$)
      ),
      jsonb_build_object(
        'heading', $$Sonorités et types de rimes$$,
        'body', $$L'assonance est la répétition d'un même son-voyelle (ou de sons vocaliques voisins) ; l'allitération est la répétition d'un même son-consonne. En fin de vers, les rimes se disposent selon trois schémas classiques : rimes plates ou suivies (AABB, deux vers qui riment ensemble, puis les deux suivants), rimes croisées ou alternées (ABAB), et rimes embrassées (ABBA, la seconde paire encadrant la première).$$,
        'highlights', array[$$assonance : répétition d'un son-voyelle$$, $$allitération : répétition d'un son-consonne$$, $$rimes plates AABB, croisées ABAB, embrassées ABBA$$]::text[],
        'example', jsonb_build_object('statement', $$Le vers de Corneille cité en situation utilise des rimes plates (AABB). Explique pourquoi, à partir des quatre vers du texte 1.$$, 'solution', $$« ennemie » (A) rime avec « infamie » (A) : deux vers consécutifs riment ensemble (AA). « guerriers » (B) rime avec « lauriers » (B) : les deux vers suivants riment ensemble aussi (BB). D'où le schéma AABB, dit rimes plates ou suivies.$$),
        'fixation', jsonb_build_object('question', $$Comment se disposent les rimes embrassées, et à quel schéma cela correspond-il ?$$, 'solution', $$Le premier vers rime avec le quatrième, et le deuxième avec le troisième : schéma ABBA (la seconde paire de rimes « encadre » la première).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un extrait des Nuits d'Alfred de Musset : « Dante, pourquoi dis-tu qu'il expire misère / Qu'un souvenir heureux dans les jours de douleur ? / Quel chagrin t'a dicté cette parole amère / Cette offense au malheur ? »$$,
      'questions', array[
        $$Identifie le schéma de rimes de cet extrait (plates, croisées ou embrassées) en justifiant ta réponse.$$,
        $$« Misère » est-il un mot à terminaison féminine ou masculine ? Sur quelle syllabe porte son accent tonique ?$$,
        $$Découpe le premier vers en ses deux hémistiches, en indiquant la césure.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on la coupe qui partage un alexandrin en deux parties égales de six syllabes ?$$,
      'hint', $$C'est un terme technique précis, différent de « coupe » en général.$$,
      'expected', $$La césure.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre l'assonance et l'allitération ?$$,
      'hint', $$L'une porte sur les voyelles, l'autre sur les consonnes.$$,
      'expected', $$L'assonance répète un son-voyelle ; l'allitération répète un son-consonne.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le schéma des rimes croisées ?$$,
      'hint', $$Les rimes alternent d'un vers sur deux.$$,
      'expected', $$ABAB.$$
    ),
    jsonb_build_object(
      'question', $$Que met en évidence le procédé du rejet dans un vers ?$$,
      'hint', $$C'est un effet de mise en relief.$$,
      'expected', $$Un mot clé, rejeté en tout début du vers suivant.$$
    )
  ),
  now()
);
