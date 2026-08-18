-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1874: "PL 3: Tonalités_litt_1"
-- (https://lyc.ecole-ci.org/course/view.php?id=1874), resource id 15950 —
-- "Séance 1 : les tonalités tragique et pathétique" (Leçon 2 : les
-- tonalités littéraires). Contenu réécrit à partir du PDF source
-- (définition, indices textuels et procédés caractéristiques de chaque
-- tonalité, fonction sur le lecteur). Les deux textes-supports (Victor
-- Hugo, Le dernier jour d'un condamné, 1829 ; "Demain dès l'aube", Les
-- Contemplations, 1856) sont dans le domaine public (Hugo mort en 1885,
-- largement plus de 70 ans) et cités fidèlement, comme il est nécessaire
-- pour tout exercice de repérage de tonalité littéraire.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-pl-tonalites-tragique-pathetique',
  '1ere',
  'A',
  'francais',
  $$Les tonalités littéraires : tragique et pathétique$$,
  19,
  '1ere-a-fr-pl-rythme-texte-poetique-2',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 1ère A veulent mieux reconnaître les tonalités d'un texte pour mieux le lire et l'analyser. Ils s'exercent à partir d'un extrait du Dernier jour d'un condamné de Victor Hugo (1829), où un homme condamné à mort rédige son journal peu avant son exécution : « Je viens de faire mon testament. À quoi bon ? Je suis condamné aux frais, et tout ce que j'ai y suffira à peine. La guillotine, c'est fort cher. Je laisse une mère, je laisse une femme, je laisse un enfant. [...] Mais ma fille, mon enfant, ma pauvre petite Marie, qui rit, qui joue, qui chante à cette heure et ne pense à rien, c'est celle-là qui me fait mal ! »$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La tonalité tragique$$,
        'body', $$La tonalité tragique suscite une émotion née de la conviction qu'il n'y a plus d'issue : elle exprime le pessimisme et la marche inéluctable d'un destin fatal qui voue l'homme à la souffrance ou à la mort, souvent face à des forces implacables (passionnelles, politiques, juridiques, sociales). Elle vise à provoquer chez le lecteur l'effroi et la pitié.$$,
        'highlights', array[$$destin inéluctable$$, $$forces implacables$$, $$effet : effroi et pitié$$]::text[],
        'property', jsonb_build_object('label', $$Indices caractéristiques$$, 'text', $$Langage soutenu ; champ lexical de la mort et de la souffrance ; forces implacables évoquées ; procédés comme la comparaison, la répétition/énumération, les exclamations, les oppositions.$$),
        'example', jsonb_build_object('statement', $$Dans le texte de Hugo, relève un indice de tonalité tragique lié au champ lexical de la mort, et un procédé de répétition/énumération.$$, 'solution', $$Champ lexical de la mort : « mon testament », « ma mort », « elle mourra ». Répétition/énumération : « Je laisse une mère, je laisse une femme, je laisse un enfant », qui accumule les pertes provoquées par la condamnation.$$),
        'fixation', jsonb_build_object('question', $$Que cherche à provoquer chez le lecteur une tonalité tragique ?$$, 'solution', $$L'effroi et la pitié, face à un destin inéluctable qui voue le personnage à la souffrance ou à la mort.$$)
      ),
      jsonb_build_object(
        'heading', $$Repérer la tonalité tragique dans un texte$$,
        'body', $$Pour repérer une tonalité tragique, on cherche d'abord les « forces implacables » qui pèsent sur le personnage (ici, la justice et la peine de mort), puis les traces de sa lucidité résignée face à cette fatalité. Le personnage tragique accepte souvent, avec une forme de dignité, l'inéluctabilité de son sort.$$,
        'highlights', array[$$forces implacables identifiées$$, $$lucidité résignée du personnage$$]::text[],
        'example', jsonb_build_object('statement', $$Relève, dans le texte de Hugo, la phrase qui montre que le condamné accepte lucidement la fatalité de sa peine.$$, 'solution', $$« J'admets que je sois justement puni » : le condamné reconnaît la légitimité de sa peine, tout en étant conscient de l'injustice faite à ses proches innocents.$$),
        'fixation', jsonb_build_object('question', $$Quel type de force pèse sur le condamné dans l'extrait de Hugo : une force naturelle, ou une force sociale/juridique ?$$, 'solution', $$Une force sociale et juridique : la justice qui l'a condamné à la peine de mort.$$)
      ),
      jsonb_build_object(
        'heading', $$La tonalité pathétique$$,
        'body', $$La tonalité pathétique déclenche un sentiment d'attendrissement, cherchant à émouvoir jusqu'aux larmes et à susciter la compassion pour celui qui souffre. Ses indices : un lexique de l'affectivité et de la souffrance, un champ lexical des larmes et de la douleur, des exclamations et des questions, des formes de phrases négatives ou emphatiques, et des phrases longues et complexes qui amplifient l'émotion.$$,
        'highlights', array[$$attendrissement, compassion$$, $$lexique affectif$$, $$exclamations, questions$$]::text[],
        'example', jsonb_build_object('statement', $$Relève, dans le texte de Hugo, un exemple de forme de phrase emphatique et un exemple de question qui traduisent la tonalité pathétique.$$, 'solution', $$Forme emphatique : « c'est celle-là qui me fait mal ! », qui met en relief la souffrance liée à sa fille. Question : « À quoi bon ? », qui exprime le désarroi du condamné dès la première phrase.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi les phrases longues et complexes renforcent-elles souvent la tonalité pathétique ?$$, 'solution', $$Parce qu'elles accumulent les détails affectifs (comme les nombreuses propositions relatives sur la petite Marie) et amplifient ainsi l'émotion avant la chute de la phrase.$$)
      ),
      jsonb_build_object(
        'heading', $$Distinguer tragique et pathétique dans un même texte$$,
        'body', $$Un même texte peut mêler tonalité tragique et tonalité pathétique : la première insiste sur la fatalité et les forces implacables (la justice, la mort), la seconde sur l'émotion et la compassion suscitées par la souffrance des innocents (ici, la fille du condamné). Pour les distinguer, on se demande si un passage insiste plutôt sur l'inéluctabilité du destin (tragique) ou sur l'attendrissement provoqué chez le lecteur (pathétique).$$,
        'highlights', array[$$tragique : fatalité, forces implacables$$, $$pathétique : émotion, compassion$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans l'extrait de Hugo, le passage sur la petite Marie relève-t-il plutôt du tragique ou du pathétique ?$$, 'solution', $$Plutôt du pathétique : il insiste sur l'innocence et l'affection pour l'enfant, cherchant à émouvoir le lecteur, plus que sur la fatalité du destin.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un autre poème de Victor Hugo, « Demain dès l'aube » (Les Contemplations, 1856) : « Demain, dès l'aube, à l'heure où blanchit la campagne, / Je partirai. Vois-tu, je sais que tu m'attends. / J'irai par la forêt, j'irai par la montagne. / Je ne puis demeurer loin de toi plus longtemps. [...] Et quand j'arriverai, je mettrai sur ta tombe / Un bouquet de houx vert et de bruyère en fleur. »$$,
      'questions', array[
        $$Quelle tonalité domine ce poème (tragique ou pathétique) ? Justifie avec un indice textuel précis.$$,
        $$Relève une répétition dans ce poème et explique l'effet qu'elle produit.$$,
        $$Pourquoi ne découvre-t-on la raison du voyage (« ta tombe ») qu'au tout dernier vers, et quel effet cela produit-il sur le lecteur ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle émotion la tonalité tragique cherche-t-elle à provoquer chez le lecteur ?$$,
      'hint', $$Il y a deux émotions citées ensemble.$$,
      'expected', $$L'effroi et la pitié.$$
    ),
    jsonb_build_object(
      'question', $$Quelle émotion la tonalité pathétique cherche-t-elle à provoquer chez le lecteur ?$$,
      'hint', $$Elle vise l'attendrissement.$$,
      'expected', $$La compassion et la pitié, jusqu'à émouvoir aux larmes.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux procédés rhétoriques que peuvent partager les tonalités tragique et pathétique.$$,
      'hint', $$Ils apparaissent dans les deux listes d'indices.$$,
      'expected', $$Par exemple la comparaison et les exclamations (également valables : répétitions, énumérations).$$
    ),
    jsonb_build_object(
      'question', $$Sur quoi porte principalement la tonalité tragique, par opposition à la tonalité pathétique ?$$,
      'hint', $$L'une insiste sur la fatalité, l'autre sur l'émotion.$$,
      'expected', $$Sur l'inéluctabilité du destin et les forces implacables qui pèsent sur le personnage, plutôt que sur l'attendrissement du lecteur.$$
    )
  ),
  now()
);
