-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2344: "PL 4: Tonalités_litt_2"
-- (https://lyc.ecole-ci.org/course/view.php?id=2344), resource id 21534.
-- Texts used directly, as brief illustrative excerpts (not full works) for
-- teaching a literary technique, per this session's established policy:
-- Victor Hugo, Les Contemplations (1856, public domain, author d. 1885) ;
-- Alphonse de Lamartine, Méditations poétiques (1820, public domain,
-- author d. 1869) ; a ~110-word single-paragraph excerpt from Djibril
-- Tamsir Niane's "Soundjata ou l'épopée mandingue" (1960) ; a ~110-word
-- single-paragraph excerpt from Pierre-Claver Ilboudo's "Adama ou la
-- force des choses". The Niane/Ilboudo excerpts are brief single-paragraph
-- quotations (not the full novels) used for pedagogical illustration of a
-- stylistic technique, consistent with standard textbook citation practice.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-tonalites-litteraires-2',
  '1ere',
  'C',
  'francais',
  $$Les tonalités littéraires (2) : le lyrique et l'épique$$,
  20,
  '1ere-c-francais-tonalites-litteraires-1',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 1ère veulent renforcer leurs acquis en lecture et en production de textes divers afin de mieux s'exprimer à l'oral et à l'écrit. À partir du support suivant, ils s'exercent à identifier, analyser et utiliser judicieusement les tonalités lyrique et épique : « Ah ! C'est là qu'entouré d'un rempart de verdure, d'un horizon borné qui suffit à mes yeux, j'aime à fixer mes pas, et, seul dans la nature, à n'entendre que l'onde, à ne voir que les cieux. J'ai trop vu, trop senti, trop aimé dans ma vie, je viens chercher vivant le calme du Léthé. Beaux lieux, soyez pour moi ces bords où l'on oublie : l'oubli seul désormais est ma félicité. D'ici je vois la vie, à travers un nuage, s'évanouir pour moi dans l'ombre du passé ; l'amour seul est resté, comme une grande image survit seule au réveil d'un songe effacé. » (Alphonse de Lamartine, Méditations poétiques, 1820).$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La tonalité lyrique$$,
        'body', $$Le lyrisme traduit les sentiments et les émotions du locuteur (trouble, passion, mélancolie, regret, tristesse, douleur, joie) à travers des thèmes récurrents : l'amour, la vie, la nature, la solitude, la fuite du temps, la mort. Il se manifeste par le lexique de l'affectivité, une énonciation marquée par la première personne, une ponctuation forte, des figures de style et une musicalité particulière du texte.$$,
        'highlights', array[$$lyrisme : sentiments/émotions du locuteur → amour, vie, nature, solitude, fuite du temps, mort$$, $$manifestations : lexique affectif, énonciation à la 1ère personne, ponctuation forte, figures de style, musicalité$$]::text[],
        'example', jsonb_build_object('statement', $$Relève dans le poème de Lamartine deux marques de la tonalité lyrique.$$, 'solution', $$Le lexique de l'affectivité (« j'aime », « l'amour seul est resté ») et l'énonciation à la première personne, omniprésente dans tout le poème (« j'aime à fixer mes pas », « j'ai trop vu, trop senti, trop aimé »), qui expriment directement les sentiments du locuteur face à la solitude et au souvenir.$$),
        'fixation', jsonb_build_object('question', $$Cite trois thèmes fréquemment associés à la tonalité lyrique.$$, 'solution', $$Trois parmi : l'amour, la vie, la nature, la solitude, la fuite du temps, la mort.$$)
      ),
      jsonb_build_object(
        'heading', $$La tonalité épique$$,
        'body', $$La tonalité épique vient du genre de l'épopée, dans lequel un héros hors du commun est confronté à des situations extraordinaires, voire surnaturelles. Ce héros suscite chez le lecteur un sentiment d'admiration. Elle se caractérise par l'utilisation de figures d'amplification (hyperbole, comparaison, accumulation, répétitions, énumérations), le recours au merveilleux, et la fréquence du pluriel, des termes collectifs, du superlatif et des passages descriptifs.$$,
        'highlights', array[$$épique : héros hors du commun, situations extraordinaires → admiration$$, $$procédés : figures d'amplification, merveilleux, pluriel/termes collectifs/superlatif/descriptions$$]::text[],
        'example', jsonb_build_object('statement', $$Dans l'extrait « L'éclair traverse le ciel moins rapidement, la foudre terrorise moins, la crue surprend moins que Djata ne fondit sur Sosso Balla et ses forgerons » (Djibril Tamsir Niane, Soundjata ou l'épopée mandingue), quel procédé d'amplification reconnais-tu ?$$, 'solution', $$Une accumulation de comparaisons hyperboliques (éclair, foudre, crue) qui, toutes surpassées par la rapidité du héros, amplifient sa puissance surhumaine et suscitent l'admiration du lecteur.$$),
        'fixation', jsonb_build_object('question', $$Quel sentiment la tonalité épique cherche-t-elle à susciter chez le lecteur, face au héros ?$$, 'solution', $$Un sentiment d'admiration, face à un héros hors du commun affrontant des situations extraordinaires.$$)
      ),
      jsonb_build_object(
        'heading', $$Repérer les figures d'amplification de l'épique$$,
        'body', $$Les figures d'amplification donnent au récit épique son ampleur : l'hyperbole exagère les faits ou les qualités du héros ; la comparaison le rapproche d'éléments impressionnants (forces de la nature, animaux puissants) ; l'accumulation et l'énumération multiplient les actions ou les éléments pour créer un effet de démesure ; la répétition installe un rythme martelé qui accompagne l'exploit du héros.$$,
        'highlights', array[$$hyperbole, comparaison, accumulation/énumération, répétition → ampleur et démesure du récit épique$$]::text[],
        'example', jsonb_build_object('statement', $$Relève une comparaison animalière dans l'extrait de Soundjata et explique son effet.$$, 'solution', $$« le fils de Sogolon était au milieu des Sosso tel un lion dans une bergerie » : cette comparaison assimile le héros à un fauve surpuissant face à des proies sans défense, amplifiant sa force et sa supériorité guerrière.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'effet recherché par l'accumulation et l'énumération dans un texte épique ?$$, 'solution', $$Créer un effet de démesure, d'ampleur, en multipliant les actions ou les éléments évoqués.$$)
      ),
      jsonb_build_object(
        'heading', $$Synthèse : reconnaître les quatre tonalités$$,
        'body', $$Au terme de cette étude, quatre tonalités principales peuvent être distinguées : le tragique (destin fatal, forces implacables, effroi et pitié), le pathétique (souffrance d'un être, attendrissement et compassion), le lyrique (sentiments du locuteur, thèmes intimes, musicalité) et l'épique (héros hors du commun, exploits amplifiés, admiration). Pour identifier la tonalité dominante d'un texte, on observe le lexique, l'énonciation, les figures de style et l'effet recherché sur le lecteur.$$,
        'highlights', array[$$4 tonalités : tragique, pathétique, lyrique, épique — chacune avec ses indices et son effet propre$$]::text[],
        'example', jsonb_build_object('statement', $$Le poème de Lamartine étudié en situation relève-t-il plutôt du lyrique ou de l'épique ? Justifie.$$, 'solution', $$Du lyrique : le locuteur exprime à la première personne ses sentiments intimes (mélancolie, désir d'oubli), sur les thèmes de la solitude et du souvenir amoureux, sans héros extraordinaire ni exploit amplifié.$$),
        'fixation', jsonb_build_object('question', $$Quels quatre éléments observer pour identifier la tonalité dominante d'un texte ?$$, 'solution', $$Le lexique employé, l'énonciation (qui parle, à quelle personne), les figures de style utilisées, et l'effet recherché sur le lecteur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dégage la tonalité dominante du texte suivant et relève les procédés caractéristiques qui la manifestent : « Quand il avait constaté la disparition du vélo et des tissus, il avait senti se creuser en lui un vide immense. Tout chancelait, tout titubait, tout chavirait autour de lui. Il sentait presque physiquement peser sur ses épaules le poids de sa destinée. Ces dernières années, il avait suffisamment travaillé pour mériter assez de pain pour une durée d'homme, mais le spectre de la misère l'avait suivi à la trace comme un chasseur tenace traque un animal blessé. Depuis ce matin de décembre où on lui avait remis cette lettre ambiguë de suspension, il avait traîné nuit et jour sa vie de fatalité comme un bagnard traîne son boulet. Partout..., il avait vu l'échec courir à ses trousses. » (Pierre-Claver Ilboudo, Adama ou la force des choses).$$,
      'questions', array[
        $$Identifie la tonalité dominante de ce texte parmi les quatre étudiées (tragique, pathétique, lyrique, épique) et justifie ta réponse.$$,
        $$Relève deux comparaisons dans le texte et explique l'effet qu'elles produisent sur la perception du destin du personnage.$$,
        $$Relève la répétition « tout chancelait, tout titubait, tout chavirait » : à quelle tonalité vue dans cette leçon ou la précédente ce procédé pourrait-il aussi être rattaché, et pourquoi ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels thèmes sont le plus souvent associés à la tonalité lyrique ?$$,
      'hint', $$Ce sont des thèmes intimes, liés aux sentiments du locuteur.$$,
      'expected', $$L'amour, la vie, la nature, la solitude, la fuite du temps, la mort.$$
    ),
    jsonb_build_object(
      'question', $$D'où vient la tonalité épique et à quel genre littéraire est-elle liée ?$$,
      'hint', $$C'est un genre narratif ancien mettant en scène des héros.$$,
      'expected', $$Elle vient du genre de l'épopée, dans lequel un héros hors du commun affronte des situations extraordinaires, voire surnaturelles.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux figures d'amplification caractéristiques de la tonalité épique.$$,
      'hint', $$Elles servent à exagérer ou multiplier les éléments du récit.$$,
      'expected', $$Deux parmi : l'hyperbole, la comparaison, l'accumulation, la répétition, l'énumération.$$
    ),
    jsonb_build_object(
      'question', $$Quels quatre éléments faut-il observer pour déterminer la tonalité dominante d'un texte ?$$,
      'hint', $$Ils couvrent le vocabulaire, l'énonciation, le style et l'effet produit.$$,
      'expected', $$Le lexique employé, l'énonciation, les figures de style utilisées, et l'effet recherché sur le lecteur.$$
    )
  ),
  now()
);
