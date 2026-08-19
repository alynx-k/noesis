-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2341: "PL 1: Rythme_texte_poét_en_prose_1"
-- (https://lyc.ecole-ci.org/course/view.php?id=2341), resource id 21498.
-- Content is technical prosodic/poetic terminology, illustrated by brief
-- public-domain verse excerpts (Corneille, Le Cid, 1637 ; La Fontaine,
-- Fables, 17th c. ; Rimbaud, "Le Dormeur du val", 1870 ; Musset, "Les
-- Nuits", 1835-37 ; Baudelaire, "L'Horloge", Les Fleurs du Mal, 1857 —
-- all authors deceased well over 70 years, works in the public domain),
-- reproduced directly as is standard for prosody/versification teaching.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-rythme-texte-poetique-1',
  '1ere',
  'C',
  'francais',
  $$Le rythme dans le texte poétique (1)$$,
  17,
  '1ere-c-francais-resume-argumentatif-rediger-resume',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 1ère éprouvent des difficultés à analyser le rythme dans les textes poétiques ou en prose. Pour surmonter cette difficulté, ils s'exercent à identifier, analyser et utiliser judicieusement les ressources de la prosodie, à partir de ce texte : « Ô rage ! Ô désespoir ! Ô vieillesse ennemie ! / N'ai-je donc tant vécu pour cette infamie ? / Et ne suis-je blanchi dans les travaux guerriers / Que pour voir en un jour flétrir tant de lauriers ? » (Pierre Corneille, Le Cid).$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'accent tonique et le rythme$$,
        'body', $$Dans la langue, certaines syllabes sont plus marquées que d'autres : ce sont les syllabes accentuées ou toniques, les autres étant dites atones. Règle d'accentuation : quand un mot se termine par une syllabe comportant un « e » muet, l'accent tonique porte sur l'avant-dernière syllabe (mots à terminaison féminine, ex. « infamie », « ennemie ») ; dans les autres cas, l'accent porte sur la dernière syllabe (terminaison masculine, ex. « désespoir », « travaux »). C'est le retour de ces accents toniques, placés sur la dernière syllabe accentuée d'un mot ou d'un groupe de mots formant une unité grammaticale, qui crée le rythme.$$,
        'highlights', array[$$terminaison féminine (« e » muet final) : accent sur l'avant-dernière syllabe$$, $$terminaison masculine : accent sur la dernière syllabe$$, $$le rythme naît du retour régulier des accents toniques$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le vers « Ô rage ! Ô désespoir ! Ô vieillesse ennemie ! », identifie les syllabes accentuées.$$, 'solution', $$« Ô ra-GE ! Ô déses-POIR ! Ô vieilles-se enne-MIE ! » : les accents portent sur « -ge » (terminaison féminine du groupe), « -poir » (terminaison masculine), et « -mie » (terminaison féminine du groupe « vieillesse ennemie »).$$),
        'fixation', jsonb_build_object('question', $$Sur quelle syllabe porte l'accent tonique d'un mot à terminaison féminine (se terminant par un « e » muet) ?$$, 'solution', $$Sur l'avant-dernière syllabe du mot.$$)
      ),
      jsonb_build_object(
        'heading', $$Les coupes, la césure et les hémistiches$$,
        'body', $$La coupe se place immédiatement après une syllabe accentuée. On appelle césure la coupe qui partage un alexandrin (vers de douze syllabes) en deux parties égales ; ces deux parties sont appelées hémistiches.$$,
        'highlights', array[$$coupe : juste après une syllabe accentuée$$, $$césure : coupe médiane d'un alexandrin, séparant deux hémistiches égaux$$]::text[],
        'example', jsonb_build_object('statement', $$Découpe le vers « N'ai-je donc tant vécu que pour cette infamie ? » en identifiant coupe, césure et hémistiches.$$, 'solution', $$N'ai-je donc / tant vécu // que pour cet- / te infamie ? — la césure (//) sépare le vers en deux hémistiches de six syllabes chacun. Le rythme évoque ici le désespoir régulier du poète.$$),
        'fixation', jsonb_build_object('question', $$Combien de syllabes comporte un alexandrin, et en combien de parties égales la césure le divise-t-elle ?$$, 'solution', $$Un alexandrin comporte douze syllabes ; la césure le divise en deux hémistiches égaux.$$)
      ),
      jsonb_build_object(
        'heading', $$L'enjambement, le rejet et le contre-rejet$$,
        'body', $$On parle d'enjambement lorsque le vers ne s'arrête pas à la rime mais déborde jusqu'à la césure ou la fin du vers suivant, traduisant souvent un mouvement qui s'amplifie ou une durée qui se prolonge (ex. Rimbaud, « Les pieds dans les glaïeuls, il dort – souriant comme sourirait un enfant malade... »). Le rejet est le cas où un élément court d'un vers est rejeté au vers suivant, mettant en relief un mot clé (ex. La Fontaine : « Même il m'est arrivé quelque fois de manger / Le berger. », le verbe « manger » étant mis en évidence). Le contre-rejet, à l'inverse, est un élément court qui, à la fin d'un vers, annonce le début du vers suivant.$$,
        'highlights', array[$$enjambement : le vers déborde jusqu'au suivant, traduit un mouvement/une durée$$, $$rejet : élément court rejeté au vers suivant, met en relief un mot$$, $$contre-rejet : élément court en fin de vers annonçant le vers suivant$$]::text[],
        'example', jsonb_build_object('statement', $$Dans « Même il m'est arrivé quelque fois de manger / Le berger. » (La Fontaine), quel effet produit le rejet du mot « manger » ?$$, 'solution', $$Le rejet met en relief le verbe « manger », créant un effet de surprise et soulignant la gravité de l'aveu (le loup qui a mangé le berger).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre un rejet et un contre-rejet ?$$, 'solution', $$Le rejet place un élément court au début du vers suivant (reporté depuis le vers précédent), tandis que le contre-rejet place un élément court à la fin d'un vers, qui annonce le vers suivant.$$)
      ),
      jsonb_build_object(
        'heading', $$Les sonorités et les rimes$$,
        'body', $$Les échos sonores entre les mots établissent un rapport de son et de sens. L'assonance est la répétition d'un même son-voyelle ou de sons vocaliques voisins (ex. assonance en « i » qui révèle la douleur). L'allitération est la répétition d'un même son-consonne ou de sons consonantiques voisins. En poésie, la rime est la répétition de sonorités identiques en fin de vers ; on distingue les rimes plates ou suivies (AABB, ex. le texte de Corneille), les rimes croisées ou alternées (ABAB, ex. Musset, « Les Nuits »), et les rimes embrassées (ABBA, ex. Baudelaire, « L'Horloge »).$$,
        'highlights', array[$$assonance : répétition d'un son-voyelle ; allitération : répétition d'un son-consonne$$, $$rimes plates (AABB), croisées (ABAB), embrassées (ABBA)$$]::text[],
        'example', jsonb_build_object('statement', $$Identifie la disposition des rimes dans le quatrain de Corneille : « Ô rage ! Ô désespoir ! Ô vieillesse ennemie ! (A) / N'ai-je donc tant vécu pour cette infamie ? (A) / Et ne suis-je blanchi dans les travaux guerriers (B) / Que pour voir en un jour flétrir tant de lauriers ? (B) »$$, 'solution', $$Ce sont des rimes plates (ou suivies), disposées selon le schéma AABB.$$),
        'fixation', jsonb_build_object('question', $$Quel est le schéma des rimes embrassées ?$$, 'solution', $$ABBA.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici deux vers célèbres de Rimbaud, extraits du « Dormeur du val » : « C'est un trou de verdure où chante une rivière / Accrochant follement aux herbes des haillons. »$$,
      'questions', array[
        $$Identifie les syllabes accentuées dans ces deux vers, en justifiant ton choix selon la règle d'accentuation (terminaison féminine ou masculine).$$,
        $$Mesure le vers « Plus l'offenseur m'est cher et plus grande est l'offense » (compte les syllabes), puis délimite sa coupe et ses hémistiches s'il s'agit d'un alexandrin.$$,
        $$Indique le type de rythme (binaire ou ternaire) pour chacun des deux vers suivants : « J'ai dit à mon cœur, à mon faible cœur » et « Cette nuit, comme les autres, j'ai pleuré ».$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qui crée le rythme dans un vers, selon la règle vue en cours ?$$,
      'hint', $$C'est un phénomène de répétition régulière.$$,
      'expected', $$Le retour des accents toniques, placés sur la dernière syllabe accentuée de chaque mot ou groupe de mots formant une unité grammaticale.$$
    ),
    jsonb_build_object(
      'question', $$Qu'appelle-t-on la césure d'un alexandrin ?$$,
      'hint', $$Elle concerne un type de vers précis, de douze syllabes.$$,
      'expected', $$La coupe qui partage l'alexandrin en deux hémistiches égaux de six syllabes chacun.$$
    ),
    jsonb_build_object(
      'question', $$Quel effet produit généralement un enjambement dans un poème ?$$,
      'hint', $$Il concerne la perception du temps ou du mouvement.$$,
      'expected', $$Il traduit souvent un mouvement qui s'amplifie ou une durée qui se prolonge, en faisant déborder le sens au-delà de la fin du vers.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre l'assonance et l'allitération ?$$,
      'hint', $$L'une concerne les voyelles, l'autre les consonnes.$$,
      'expected', $$L'assonance est la répétition d'un même son-voyelle (ou de sons vocaliques voisins) ; l'allitération est la répétition d'un même son-consonne (ou de sons consonantiques voisins).$$
    )
  ),
  now()
);
