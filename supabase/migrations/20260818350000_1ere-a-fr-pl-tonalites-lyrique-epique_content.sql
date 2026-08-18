-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1875: "PL 4: Tonalités_litt_2"
-- (https://lyc.ecole-ci.org/course/view.php?id=1875), resource id 15962 —
-- "Séance 2 : les tonalités lyrique et épique" (Leçon 2 : les tonalités
-- littéraires). Contenu réécrit à partir du PDF source (définitions,
-- procédés caractéristiques de chaque tonalité). Le texte-support épique
-- du PDF (Djibril Tamsir Niane, Soundjata ou l'épopée mandingue, 1960 —
-- sous droits d'auteur) et le texte d'évaluation en prose (Pierre-Claver
-- Ilboudo, Adama ou la force des choses — sous droits d'auteur) sont
-- remplacés par un court passage épique ENTIÈREMENT ORIGINAL, rédigé pour
-- ce cours dans le même registre. Le texte lyrique de Victor Hugo (Les
-- Contemplations, 1856, domaine public) et celui de Lamartine (Méditations
-- poétiques, 1820, domaine public) sont cités fidèlement.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-pl-tonalites-lyrique-epique',
  '1ere',
  'A',
  'francais',
  $$Les tonalités littéraires : lyrique et épique$$,
  20,
  '1ere-a-fr-pl-tonalites-tragique-pathetique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après les tonalités tragique et pathétique, des élèves de 1ère A veulent reconnaître deux autres grandes tonalités : le lyrique, qui exprime les sentiments intimes d'un locuteur, et l'épique, qui célèbre les exploits d'un héros hors du commun.

Texte support lyrique : Victor Hugo, « Demain dès l'aube » (Les Contemplations, 1856) — « Demain, dès l'aube, à l'heure où blanchit la campagne, / Je partirai. Vois-tu, je sais que tu m'attends. / J'irai par la forêt, j'irai par la montagne. / Je ne puis demeurer loin de toi plus longtemps. »

Texte support épique (original) : « Quand Fakoly parut sur la crête de la colline, son bouclier étincelant comme mille soleils, les guerriers ennemis reculèrent d'un même mouvement, saisis d'une terreur sacrée. Nul homme avant lui n'avait soulevé la grande lance de bronze léguée par les ancêtres. Ses bras, forgés par vingt années de combat, abattaient les guerriers par dizaines, comme le vent couche les épis mûrs. Les tambours de la victoire résonnaient déjà dans tous les villages, avant même que la bataille ne fût achevée. »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La tonalité lyrique$$,
        'body', $$Le lyrisme traduit les sentiments et les émotions intimes du locuteur (trouble, passion, mélancolie, regret, tristesse, joie) à travers des thèmes récurrents : l'amour, la nature, la solitude, la fuite du temps, la mort. Il se manifeste par le lexique de l'affectivité, une énonciation à la première personne, une ponctuation forte (exclamations, points de suspension), des figures de style et une musicalité marquée (rythme, sonorités).$$,
        'highlights', array[$$sentiments intimes du locuteur$$, $$1ère personne, lexique affectif$$, $$musicalité$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le texte support lyrique de Hugo, relève un indice d'énonciation à la première personne et un indice de musicalité.$$, 'solution', $$Énonciation à la première personne : « Je partirai », « Je ne puis demeurer loin de toi ». Musicalité : la répétition du verbe « j'irai » (« J'irai par la forêt, j'irai par la montagne ») crée un rythme régulier et scandé.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les thèmes les plus fréquemment associés à la tonalité lyrique ?$$, 'solution', $$L'amour, la vie, la nature, la solitude, la fuite du temps, la mort.$$)
      ),
      jsonb_build_object(
        'heading', $$La tonalité épique$$,
        'body', $$La tonalité épique vient du genre de l'épopée, où un héros hors du commun affronte des situations extraordinaires, parfois surnaturelles, suscitant chez le lecteur un sentiment d'admiration. Ses procédés caractéristiques : les figures d'amplification (hyperbole, comparaison, accumulation, répétition, énumération), le recours au merveilleux, et la fréquence du pluriel, des termes collectifs, du superlatif et des passages descriptifs.$$,
        'highlights', array[$$héros hors du commun$$, $$figures d'amplification$$, $$admiration du lecteur$$]::text[],
        'example', jsonb_build_object('statement', $$Dans le texte support épique, relève une hyperbole et une comparaison.$$, 'solution', $$Hyperbole : « son bouclier étincelant comme mille soleils » (exagération grandiose). Comparaison : « abattaient les guerriers par dizaines, comme le vent couche les épis mûrs. »$$),
        'fixation', jsonb_build_object('question', $$Quel sentiment le héros épique suscite-t-il chez le lecteur ?$$, 'solution', $$L'admiration.$$)
      ),
      jsonb_build_object(
        'heading', $$Distinguer lyrique et épique$$,
        'body', $$La tonalité lyrique se concentre sur l'intériorité d'un « je » qui exprime ses propres émotions, dans un cadre souvent intime (la nature, l'amour, le souvenir). La tonalité épique, à l'inverse, se tourne vers l'extérieur : elle célèbre les exploits collectifs et spectaculaires d'un héros, souvent au singulier grammatical mais représentant tout un peuple ou une cause.$$,
        'highlights', array[$$lyrique : intériorité d'un « je »$$, $$épique : exploits collectifs, héros représentatif$$]::text[],
        'fixation', jsonb_build_object('question', $$Le texte de Hugo « Demain dès l'aube » et le texte support épique se distinguent-ils par leur point de vue (individuel/intime ou collectif/héroïque) ?$$, 'solution', $$Oui : le texte de Hugo reste centré sur l'intériorité d'un « je » qui exprime son chagrin personnel, alors que le texte épique célèbre un exploit collectif à travers les actes du héros Fakoly, avec un effet d'amplification et d'admiration.$$)
      ),
      jsonb_build_object(
        'heading', $$Identifier la tonalité dominante d'un texte$$,
        'body', $$Pour identifier la tonalité dominante d'un texte, on cherche d'abord le point de vue (intime ou collectif), puis les procédés caractéristiques (lexique affectif et musicalité pour le lyrique ; figures d'amplification et merveilleux pour l'épique), avant de conclure en citant les indices les plus significatifs.$$,
        'highlights', array[$$point de vue → procédés → conclusion$$],
        'example', jsonb_build_object('statement', $$Voici un extrait des Méditations poétiques d'Alphonse de Lamartine (1820) : « J'ai trop vu, trop senti, trop aimé dans ma vie, / Je viens chercher vivant le calme du Léthé. » Identifie la tonalité dominante et justifie.$$, 'solution', $$Tonalité lyrique : le « je » exprime une lassitude intime et personnelle (« j'ai trop vu, trop senti, trop aimé »), avec un lexique de l'affectivité et une aspiration au repos et à l'oubli, thèmes typiquement lyriques.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la première question à se poser pour identifier la tonalité dominante d'un texte ?$$, 'solution', $$S'interroger sur le point de vue adopté : s'agit-il d'une intériorité intime (lyrique) ou d'exploits collectifs et amplifiés (épique) ?$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un second texte épique original : « Alors le vieux Bakary se leva, seul contre l'armée entière des envahisseurs, et son cri de guerre fit trembler les montagnes elles-mêmes. Comme un fauve acculé mais invaincu, il chargea, brisant les lances, dispersant les rangs, semant partout la terreur et l'étonnement. Jamais, de mémoire d'homme, on n'avait vu pareille bravoure. »$$,
      'questions', array[
        $$Identifie la tonalité dominante de ce texte et justifie ta réponse.$$,
        $$Relève une hyperbole et une comparaison dans ce texte.$$,
        $$Réécris les deux premières phrases de ce texte en tonalité lyrique (à la première personne, centrées sur une émotion intime), en gardant le même thème du courage.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les cinq manifestations typiques de la tonalité lyrique citées dans ce cours ?$$,
      'hint', $$Il y en a cinq listées.$$,
      'expected', $$Le lexique de l'affectivité, l'énonciation (1ère personne), la ponctuation forte, les figures de style, la musicalité.$$
    ),
    jsonb_build_object(
      'question', $$D'où vient la tonalité épique ?$$,
      'hint', $$C'est un genre littéraire précis.$$,
      'expected', $$Du genre de l'épopée, où un héros hors du commun affronte des situations extraordinaires.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux figures d'amplification typiques de la tonalité épique.$$,
      'hint', $$Elles servent à exagérer ou intensifier.$$,
      'expected', $$Par exemple l'hyperbole et la comparaison (également valables : accumulation, répétition, énumération).$$
    ),
    jsonb_build_object(
      'question', $$Sur quoi se concentre la tonalité lyrique, par opposition à la tonalité épique ?$$,
      'hint', $$L'une est intérieure, l'autre est tournée vers l'extérieur.$$,
      'expected', $$Sur l'intériorité et les émotions personnelles d'un « je », plutôt que sur des exploits collectifs et spectaculaires.$$
    )
  ),
  now()
);
