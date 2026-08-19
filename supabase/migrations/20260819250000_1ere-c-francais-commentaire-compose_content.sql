-- REAL methodology sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2290: "EE 1: Com_composé_analyser_const_organiser_CI"
-- (https://lyc.ecole-ci.org/course/view.php?id=2290), resource id 20886.
-- The pedagogical method (analyse du libellé, centres d'intérêt, démarche
-- d'organisation) is reproduced from the source, which is methodological
-- and not subject to copyright concern. The source's illustrative literary
-- text (an excerpt from Sembène Ousmane's "Lettres de France", 1962, a
-- copyrighted short story) and its evaluation poem (Denise Jallais,
-- "Maturité", 1969/1987, also copyrighted) were NOT reproduced. Both were
-- replaced with an original text and a distinct original poem, composed to
-- preserve the same teaching point (désillusion / nostalgie du pays natal;
-- bonheur de l'enfance / réalités de l'âge adulte), documented here per
-- this project's content-originality policy for creative/narrative source
-- material.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-commentaire-compose',
  '1ere',
  'C',
  'francais',
  $$Le commentaire composé$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours de leurs recherches à la bibliothèque, des élèves de 1ère découvrent un sujet de commentaire composé. Curieux de comprendre le fonctionnement de cet exercice, ils s'organisent pour analyser le libellé, identifier les centres d'intérêt, rechercher et organiser les idées en vue de rédiger l'introduction, un centre d'intérêt et la conclusion.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Généralités sur le commentaire composé$$,
        'body', $$L'épreuve du commentaire composé porte sur un texte en prose ou en vers, choisi pour sa qualité littéraire. Le candidat doit rendre compte de la lecture personnelle qu'il en fait : montrer les qualités stylistiques et les richesses thématiques dans un développement rigoureux et bien argumenté. Le libellé suggère des points de départ pour une lecture efficace, mais ces indications ne sont ni exhaustives ni contraignantes. Généralement, elles portent sur deux ou trois points appelés les centres d'intérêt du texte.$$,
        'highlights', array[$$commentaire composé = lecture personnelle argumentée d'un texte littéraire (prose ou vers)$$, $$le libellé indique généralement 2 ou 3 centres d'intérêt, pistes non exhaustives$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quoi porte principalement l'analyse dans un commentaire composé ?$$, 'solution', $$Sur les qualités stylistiques et les richesses thématiques du texte, à travers un développement rigoureux et argumenté.$$)
      ),
      jsonb_build_object(
        'heading', $$Analyser le libellé$$,
        'body', $$Le libellé comporte deux parties : la consigne, qui indique ce qui doit être fait (« Faites un commentaire composé de ce texte ») ; et l'information, qui présente les centres d'intérêt — les pistes pour effectuer le commentaire. Les centres d'intérêt sont souvent liés par un rapport logique (causalité, opposition, etc.).$$,
        'highlights', array[$$libellé = consigne (ce qu'il faut faire) + information (les centres d'intérêt)$$, $$les centres d'intérêt sont souvent liés par un rapport logique$$]::text[],
        'example', jsonb_build_object('statement', $$Soit le libellé : « Faites un commentaire composé de ce texte. Étudiez d'abord la désillusion d'Aïssata après son mariage, puis sa nostalgie du village natal. » Identifie la consigne et les centres d'intérêt.$$, 'solution', $$Consigne : « Faites un commentaire composé de ce texte. » Centre d'intérêt 1 : la désillusion d'Aïssata après son mariage. Centre d'intérêt 2 : sa nostalgie du village natal. Les deux sont liés par un rapport de causalité : la désillusion suscite la nostalgie.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux parties d'un libellé de commentaire composé ?$$, 'solution', $$La consigne (ce qui doit être fait) et l'information (les centres d'intérêt proposés).$$)
      ),
      jsonb_build_object(
        'heading', $$Construire le sens du texte$$,
        'body', $$Avant d'organiser les centres d'intérêt, il faut construire le sens global du texte en identifiant : le thème (le sujet traité), la nature du texte (récit, poème, dialogue...), la tonalité (pathétique, lyrique, ironique...), et l'idée générale (la synthèse du propos).$$,
        'highlights', array[$$identifier thème, nature du texte, tonalité et idée générale avant l'analyse détaillée$$]::text[],
        'example', jsonb_build_object('statement', $$Voici un texte support : « Aïssata, jeune mariée déçue, écrit à sa sœur restée au village. Mon père m'avait montré la photo d'un homme établi à Abidjan ; il semblait prospère, souriant. J'ai cru au bonheur promis et j'ai accepté ce mariage, refusant tous mes prétendants du village. Aujourd'hui, je regrette. Cet homme rentre tard, fatigué, silencieux ; les journées se ressemblent, vides et grises. Comme je voudrais revoir le marché du village à l'aube, entendre le balafon lors des veillées, sentir l'odeur du foutou qui mijote chez ma mère, courir pieds nus avec mes cousines jusqu'au fleuve. Ici, à Abidjan, je suis entourée de monde et pourtant si seule. » Identifie le thème, la nature du texte, la tonalité et l'idée générale.$$, 'solution', $$Thème : la désillusion du mariage et la nostalgie du pays natal. Nature : récit à la première personne (lettre). Tonalité : pathétique et lyrique. Idée générale : le regret d'un bonheur espéré, remplacé par la solitude et le souvenir du village.$$),
        'fixation', jsonb_build_object('question', $$Que désigne la « tonalité » d'un texte littéraire ?$$, 'solution', $$L'atmosphère générale ou l'effet produit sur le lecteur (par exemple pathétique, lyrique, ironique, tragique).$$)
      ),
      jsonb_build_object(
        'heading', $$Organiser les centres d'intérêt$$,
        'body', $$Organiser les centres d'intérêt consiste à élaborer un plan détaillé : pour chaque centre d'intérêt, on identifie des sous-centres, puis pour chacun on relève les indices textuels pertinents (mots, phrases, figures de style), on les analyse (quel procédé ? quelle forme grammaticale ?) et on en donne l'interprétation (quel sens, quel effet sur le lecteur ?). Cette démarche se présente souvent sous forme de tableau : sous-centre / indices relevés / analyse / interprétation.$$,
        'highlights', array[$$démarche : sous-centre → indices textuels → analyse (procédé) → interprétation (sens, effet)$$]::text[],
        'example', jsonb_build_object('statement', $$Pour le centre d'intérêt « la désillusion d'Aïssata » dans le texte précédent, propose un sous-centre avec un indice, une analyse et une interprétation.$$, 'solution', $$Sous-centre : la déception face à la réalité. Indice relevé : « les journées se ressemblent, vides et grises ». Analyse : groupe nominal au champ lexical de la monotonie, absence de couleur. Interprétation : la vie qu'Aïssata espérait animée et heureuse se révèle terne, ce qui traduit sa désillusion profonde.$$),
        'fixation', jsonb_build_object('question', $$Dans la démarche d'organisation des centres d'intérêt, que doit-on faire après avoir relevé un indice textuel ?$$, 'solution', $$L'analyser (identifier le procédé stylistique ou grammatical employé), puis en proposer une interprétation (le sens ou l'effet produit).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Après le cours sur le commentaire composé, un élève s'entraîne avec un nouveau texte. Voici un poème original, intitulé « Avant » : « Avant, c'était les mangues volées au verger du voisin, / le rire des cousins sous le manguier, / le sable chaud entre les orteils, / les histoires du soir contées par grand-mère. / Maintenant je compte les factures, / je mesure mes pas dans le bruit de la ville, / j'ai perdu le goût des après-midis sans horloge. / Je suis devenu grand, et cela pèse. » Consigne : Faites un commentaire composé de ce poème. Étudiez d'abord les aspects du bonheur de l'enfance, puis les réalités de l'âge adulte.$$,
      'questions', array[
        $$Analyse le libellé : identifie la consigne et les deux centres d'intérêt proposés.$$,
        $$Pour le centre d'intérêt « le bonheur de l'enfance », relève deux indices textuels pertinents et propose une analyse (procédé employé) pour chacun.$$,
        $$Pour le centre d'intérêt « les réalités de l'âge adulte », relève un indice textuel et propose une interprétation de son effet de sens.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les deux composantes d'un libellé de commentaire composé ?$$,
      'hint', $$L'une indique la tâche à faire, l'autre propose des pistes de lecture.$$,
      'expected', $$La consigne (ce qui doit être fait) et l'information, qui présente les centres d'intérêt.$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les quatre éléments à identifier pour construire le sens global d'un texte ?$$,
      'hint', $$Ils précèdent l'analyse détaillée par centres d'intérêt.$$,
      'expected', $$Le thème, la nature du texte, la tonalité, et l'idée générale.$$
    ),
    jsonb_build_object(
      'question', $$Dans le tableau d'organisation des centres d'intérêt, quelles sont les quatre colonnes habituelles ?$$,
      'hint', $$Elles vont du repérage à l'interprétation.$$,
      'expected', $$Sous-centres, relevés (indices textuels), analyse, interprétation.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi dit-on que les indications du libellé « ne sont ni exhaustives ni contraignantes » ?$$,
      'hint', $$Cela concerne la liberté du candidat dans sa lecture.$$,
      'expected', $$Parce que le libellé propose des pistes de lecture pertinentes, mais le candidat garde une marge d'interprétation personnelle du texte, sans être limité strictement à ces seules pistes.$$
    )
  ),
  now()
);
