-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Français, categoryid=130.
-- Moodle course id 2343: "PL 3: Tonalités_litt_1"
-- (https://lyc.ecole-ci.org/course/view.php?id=2343), resource id 21522.
-- Texte-support and évaluation text are both by Victor Hugo (Le dernier
-- jour d'un condamné, 1829 ; Les Contemplations, "Demain, dès l'aube",
-- 1856) — Hugo died in 1885, so his works are safely in the public
-- domain (life+70 well elapsed); both are reproduced in full as in the
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-francais-tonalites-litteraires-1',
  '1ere',
  'C',
  'francais',
  $$Les tonalités littéraires (1) : le tragique et le pathétique$$,
  19,
  '1ere-c-francais-rythme-texte-poetique-2',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les élèves de 1ère de ton établissement veulent renforcer leurs acquis en lecture et en production de textes divers afin de mieux s'exprimer à l'oral et à l'écrit. À partir du texte-support suivant, ils s'exercent à identifier, analyser et utiliser judicieusement les tonalités littéraires : « Un condamné à mort rédige son journal quelque temps avant son exécution. Je viens de faire mon testament. À quoi bon ? Je suis condamné aux frais, et tout ce que j'ai y suffira à peine. La guillotine, c'est fort cher. Je laisse une mère, je laisse une femme, je laisse un enfant. Une petite fille de trois ans, douce, rose, frêle, avec de grands yeux noirs et de longs cheveux châtains. Elle avait deux ans et un mois quand je l'ai vue pour la dernière fois. Ainsi, après ma mort, trois femmes, sans fils, sans mari, sans père ; trois orphelines de différente espèce ; trois veuves du fait de la loi. J'admets que je sois justement puni ; ces innocentes, qu'ont-elles fait ? N'importe ; on les déshonore, on les ruine. C'est la justice. Ce n'est pas que ma pauvre vieille mère m'inquiète ; elle a soixante-quatre ans ; elle mourra du coup. Ou si elle va quelques jours encore, pourvu que jusqu'au dernier moment elle ait un peu de cendre chaude dans sa chaufferette, elle ne dira rien. Ma femme ne m'inquiète pas non plus ; elle est déjà d'une mauvaise santé et d'un esprit faible. Elle mourra aussi. À moins qu'elle ne devienne folle. On dit que cela fait vivre ; mais du moins, l'intelligence ne souffre pas ; elle dort, elle est comme morte. Mais ma fille, mon enfant, ma pauvre petite Marie, qui rit, qui joue, qui chante à cette heure et ne pense à rien, c'est celle-là qui me fait mal ! » (Victor Hugo, Le dernier jour d'un condamné, 1829).$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La tonalité tragique$$,
        'body', $$La tonalité tragique suscite une émotion née de la conviction intime qu'il n'y a plus d'issue. Elle exprime le pessimisme, la marche inéluctable d'un destin fatal qui voue l'homme à la mort. Elle naît de la souffrance de héros souvent solitaires, confrontés aux drames de la destinée humaine, soumis par des forces implacables à la souffrance ou à la mort. Sa fonction est de provoquer chez le lecteur l'effroi et la pitié.$$,
        'highlights', array[$$tonalité tragique : destin fatal inéluctable, forces implacables → mort/souffrance$$, $$fonction : provoquer l'effroi et la pitié$$]::text[],
        'example', jsonb_build_object('statement', $$Relève, dans le texte de Victor Hugo, deux indices de la tonalité tragique.$$, 'solution', $$Le champ lexical de la mort et de la souffrance (« mon testament », « ma mort », « dernier moment », « elle mourra ») ; les forces implacables d'ordre juridique qui condamnent le narrateur (« J'admets que je sois justement puni », « Je suis condamné »).$$),
        'fixation', jsonb_build_object('question', $$Quelle est la fonction de la tonalité tragique sur le lecteur ?$$, 'solution', $$Provoquer chez le lecteur l'effroi et la pitié, face à un destin fatal et inéluctable.$$)
      ),
      jsonb_build_object(
        'heading', $$Les procédés de la tonalité tragique$$,
        'body', $$La tonalité tragique se reconnaît à plusieurs indices : un langage souvent soutenu ; les champs lexicaux de la mort et de la souffrance ; des passions destructrices (haine, amour, jalousie) ; des sentiments héroïques ; des forces implacables d'ordre passionnel, politique, juridique, social ou moral ; et des procédés rhétoriques comme la comparaison (« elle est comme morte »), la répétition associée à l'énumération (« je laisse une mère, je laisse une femme, je laisse un enfant »), l'exclamation, l'opposition et l'interjection.$$,
        'highlights', array[$$procédés : langage soutenu, champ lexical mort/souffrance, forces implacables, comparaison, répétition+énumération, exclamation, opposition$$]::text[],
        'example', jsonb_build_object('statement', $$Quel procédé rhétorique reconnais-tu dans « Je laisse une mère, je laisse une femme, je laisse un enfant » ?$$, 'solution', $$Une répétition associée à une énumération, qui souligne l'ampleur de la perte que le narrateur va infliger à ses proches.$$),
        'fixation', jsonb_build_object('question', $$Cite trois domaines dont peuvent relever les « forces implacables » propres à la tonalité tragique.$$, 'solution', $$Elles peuvent être d'ordre passionnel, politique, juridique, social ou moral (trois au choix parmi ces cinq).$$)
      ),
      jsonb_build_object(
        'heading', $$La tonalité pathétique$$,
        'body', $$La tonalité pathétique déclenche un sentiment d'attendrissement et cherche parfois à émouvoir jusqu'aux larmes. Elle suscite la compassion et la pitié chez celui qui lit ou regarde celui qui souffre. Elle se reconnaît au lexique de l'affectivité et de la souffrance, aux champs lexicaux des larmes et des lamentations, aux exclamations, aux questions, et à des procédés rhétoriques à forte charge émotive (comparaison, métaphore, répétition), ainsi qu'à des formes de phrases négatives ou emphatiques et à des structures syntaxiques longues et complexes. Sa fonction est de provoquer chez le lecteur la compassion et la pitié.$$,
        'highlights', array[$$tonalité pathétique : attendrissement, compassion, pitié$$, $$indices : lexique affectif/souffrance, exclamations, questions, phrases longues et complexes$$, $$fonction : provoquer la compassion et la pitié$$]::text[],
        'example', jsonb_build_object('statement', $$Relève dans le texte un exemple de métaphore et un exemple de phrase emphatique relevant du pathétique.$$, 'solution', $$Métaphore : « ma petite fille douce, rose ». Phrase emphatique : « c'est celle-là qui me fait mal ! », qui met en relief la douleur du narrateur face à sa fille.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence essentielle entre la fonction du tragique et celle du pathétique ?$$, 'solution', $$Le tragique vise à provoquer l'effroi et la pitié face à un destin fatal inéluctable, tandis que le pathétique vise surtout l'attendrissement et la compassion face à la souffrance d'un être.$$)
      ),
      jsonb_build_object(
        'heading', $$Distinguer et combiner les tonalités$$,
        'body', $$Un même texte peut mêler plusieurs tonalités : dans le texte-support, la situation du condamné relève du tragique (destin fatal, forces juridiques implacables) tandis que l'évocation de sa fille relève davantage du pathétique (attendrissement, compassion). Pour identifier la ou les tonalités dominantes d'un texte, il faut repérer le lexique employé, les procédés rhétoriques utilisés et les formes de phrases privilégiées, puis déterminer l'effet recherché sur le lecteur.$$,
        'highlights', array[$$un texte peut combiner plusieurs tonalités$$, $$démarche : lexique + procédés + formes de phrases → effet recherché$$]::text[],
        'example', jsonb_build_object('statement', $$Dans quel passage du texte-support la tonalité pathétique domine-t-elle le plus nettement sur la tonalité tragique ?$$, 'solution', $$Dans le dernier paragraphe, consacré à la petite Marie « qui rit, qui joue, qui chante à cette heure et ne pense à rien » : le lexique affectif et la longue phrase emphatique finale font dominer l'attendrissement sur la froideur du constat juridique.$$),
        'fixation', jsonb_build_object('question', $$Quelle démarche suivre pour identifier la ou les tonalités dominantes d'un texte ?$$, 'solution', $$Repérer le lexique employé, les procédés rhétoriques utilisés et les formes de phrases privilégiées, puis déterminer l'effet recherché sur le lecteur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dégage les tonalités dominantes dans le texte suivant : « Demain, dès l'aube, à l'heure où blanchit la campagne, je partirai. Vois-tu, je sais que tu m'attends. J'irai par la forêt, j'irai par la montagne. Je ne puis demeurer loin de toi plus longtemps. Je marcherai les yeux fixés sur mes pensées, sans rien voir au-dehors, sans entendre aucun bruit, seul, inconnu, le dos courbé, les mains croisées, triste, et le jour pour moi sera comme la nuit. Je ne regarderai ni l'or du soir qui tombe, ni les voiles au loin descendant sur Harfleur, et quand j'arriverai, je mettrai sur ta tombe un bouquet de houx vert et de bruyère en fleur. » (Victor Hugo, Les Contemplations, « Demain, dès l'aube »).$$,
      'questions', array[
        $$Identifie la tonalité dominante de ce poème et justifie ta réponse par au moins trois indices textuels précis (lexique, procédés rhétoriques, formes de phrases).$$,
        $$Relève une répétition et explique l'effet qu'elle produit sur le rythme et le sens du poème.$$,
        $$Ce poème te semble-t-il davantage tragique ou pathétique ? Justifie ta réponse en comparant sa tonalité à celle du texte-support de Victor Hugo étudié dans la leçon.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle émotion la tonalité tragique cherche-t-elle avant tout à provoquer chez le lecteur ?$$,
      'hint', $$Deux sentiments proches sont évoqués dans la définition.$$,
      'expected', $$L'effroi et la pitié, face à un destin fatal et inéluctable.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux procédés rhétoriques caractéristiques de la tonalité pathétique.$$,
      'hint', $$Ils créent une forte charge émotive.$$,
      'expected', $$La comparaison et la métaphore (ou la répétition), qui créent une forte charge émotive.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qui distingue une forme de phrase « emphatique » ?$$,
      'hint', $$Pense à un exemple du texte : « c'est celle-là qui me fait mal ! »$$,
      'expected', $$Elle met en relief un élément de la phrase par une construction particulière (ex. « c'est... qui... »), pour insister sur ce qui est dit.$$
    ),
    jsonb_build_object(
      'question', $$Un même texte peut-il combiner plusieurs tonalités ? Justifie brièvement.$$,
      'hint', $$Le texte-support de la leçon en est un exemple.$$,
      'expected', $$Oui : par exemple le texte-support de Victor Hugo combine le tragique (destin juridique inéluctable) et le pathétique (attendrissement suscité par la petite fille).$$
    )
  ),
  now()
);
