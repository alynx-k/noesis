-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Physique-Chimie, categoryid=132.
-- Moodle course id 2397: "LEÇON 14: ÉLECTROLYSE"
-- (https://lyc.ecole-ci.org/course/view.php?id=2397), resource id 22122.
-- Contenu réécrit à partir du PDF source (électrolyse de l'acide
-- sulfurique, du chlorure d'étain, du chlorure de sodium ; électrolyse vs
-- réaction spontanée ; applications industrielles). Tout le contenu est
-- factuel (électrochimie) : demi-équations, observations expérimentales et
-- exercices numériques sont repris/adaptés tels quels ; explications
-- reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-pc-chimie-electrolyse',
  '1ere',
  'C',
  'physique-chimie',
  $$Électrolyse$$,
  10,
  '1ere-c-pc-chimie-oxydoreduction-voie-seche',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours d'un documentaire télévisé portant sur la fabrication de couverts de table, des élèves de 1ère C du Lycée Moderne Arsène Assouan Usher de Grand-Lahou apprennent que certains couverts (cuillères, fourchettes, couteaux) sont étamés par électrolyse d'une solution contenant des ions étain (Sn²⁺). Pour comprendre ce phénomène, ils en parlent à leur professeur de physique-chimie. Ensemble, ils se proposent d'interpréter l'électrolyse de quelques solutions, d'écrire les équations-bilans des réactions chimiques et de connaître quelques-unes de ses applications.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition de l'électrolyse$$,
        'body', $$L'électrolyse est l'ensemble des réactions chimiques qui se produisent lors du passage d'un courant électrique dans une solution ; cette solution est appelée un électrolyte. Contrairement à une réaction d'oxydoréduction spontanée, la réaction d'électrolyse n'est pas naturelle : elle est provoquée (ou forcée) par l'énergie électrique, qui permet d'inverser le sens des transformations naturelles du système formé par les couples oxydant-réducteur en présence. Lors d'une électrolyse, il se produit toujours une réduction à la cathode et une oxydation à l'anode ; les cations migrent vers la cathode.$$,
        'highlights', array[$$électrolyse : réactions provoquées par le passage du courant dans un électrolyte$$, $$réduction à la cathode ; oxydation à l'anode$$, $$réaction non naturelle, contrairement à celle d'une pile$$]::text[],
        'fixation', jsonb_build_object('question', $$Vers quelle électrode migrent les cations au cours d'une électrolyse ?$$, 'solution', $$Vers la cathode.$$)
      ),
      jsonb_build_object(
        'heading', $$Électrolyse de la solution aqueuse d'acide sulfurique$$,
        'body', $$Dans un électrolyseur à électrodes de platine contenant une solution d'acide sulfurique, le passage du courant produit un dégagement gazeux à chaque électrode : à l'anode, un gaz qui rallume une bûchette incandescente (le dioxygène) ; à la cathode, un gaz qui brûle avec une petite détonation (le dihydrogène). À l'anode, l'eau est oxydée : 2H2O → O2 + 4H⁺ + 4e⁻. À la cathode, les ions hydronium sont réduits : 4H⁺ + 4e⁻ → 2H2. L'équation-bilan globale est donc : 2H2O → 2H2 + O2.$$,
        'highlights', array[$$anode : 2H2O → O2 + 4H⁺ + 4e⁻ (oxydation)$$, $$cathode : 4H⁺ + 4e⁻ → 2H2 (réduction)$$, $$bilan : 2H2O → 2H2 + O2$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel test permet de reconnaître le dioxygène recueilli à l'anode ?$$, 'solution', $$Il rallume une bûchette présentant un point incandescent.$$)
      ),
      jsonb_build_object(
        'heading', $$Électrolyse de la solution de chlorure d'étain (SnCl2)$$,
        'body', $$Dans un électrolyseur à électrodes de graphite contenant une solution acidifiée de chlorure d'étain, on observe à l'anode des bulles gazeuses qui décolorent l'indigo, et à la cathode un dépôt métallique arborescent. À l'anode, les ions chlorure sont oxydés en dichlore (2Cl⁻ → Cl2 + 2e⁻). À la cathode, les ions étain sont réduits en étain métallique (Sn²⁺ + 2e⁻ → Sn). L'équation-bilan est : Sn²⁺ + 2Cl⁻ → Sn + Cl2. C'est ce principe qui permet, par exemple, d'étamer des couverts de table.$$,
        'highlights', array[$$anode : 2Cl⁻ → Cl2 + 2e⁻ (le dichlore décolore l'indigo)$$, $$cathode : Sn²⁺ + 2e⁻ → Sn (dépôt métallique arborescent)$$, $$bilan : Sn²⁺ + 2Cl⁻ → Sn + Cl2$$]::text[],
        'fixation', jsonb_build_object('question', $$Que révèle la décoloration de l'indigo à l'anode lors de cette électrolyse ?$$, 'solution', $$La présence de dichlore (Cl2), formé par l'oxydation des ions chlorure.$$)
      ),
      jsonb_build_object(
        'heading', $$Électrolyse de la solution de chlorure de sodium (NaCl)$$,
        'body', $$Dans un tube en U à électrodes de graphite contenant une solution aqueuse de chlorure de sodium, on observe à l'anode une décoloration de l'indigo (présence de dichlore), et à la cathode un dégagement gazeux accompagné d'un virage au rose de la phénolphtaléine (milieu devenu basique). À l'anode, les ions chlorure sont oxydés (2Cl⁻ → Cl2 + 2e⁻). À la cathode, c'est l'eau qui est réduite en dihydrogène et ions hydroxyde : 2H2O + 2e⁻ → H2 + 2OH⁻. L'équation-bilan est : 2H2O + 2Cl⁻ → H2 + Cl2 + 2OH⁻.$$,
        'highlights', array[$$cathode : 2H2O + 2e⁻ → H2 + 2OH⁻ (milieu devient basique)$$, $$bilan : 2H2O + 2Cl⁻ → H2 + Cl2 + 2OH⁻$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi le compartiment cathodique devient-il basique lors de l'électrolyse du chlorure de sodium ?$$, 'solution', $$Parce que la réduction de l'eau à la cathode produit des ions hydroxyde OH⁻ (2H2O + 2e⁻ → H2 + 2OH⁻).$$)
      ),
      jsonb_build_object(
        'heading', $$Importance et applications de l'électrolyse$$,
        'body', $$L'électrolyse présente un grand intérêt économique et industriel : elle permet de préparer certains produits peu abondants dans la nature (comme l'aluminium, le dichlore, le dihydrogène ou l'eau oxygénée), de protéger les métaux contre la corrosion par dépôt d'une fine couche métallique (galvanoplastie), et de purifier certains métaux précieux comme l'or (électrolyse à anode soluble). Elle est aussi utilisée pour la conservation d'anciens objets en archéologie.$$,
        'highlights', array[$$galvanoplastie : protection des métaux par dépôt métallique$$, $$purification des métaux précieux (électrolyse à anode soluble)$$, $$production industrielle : Al, Cl2, H2, H2O2$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la technique de protection d'un métal par dépôt d'une couche métallique obtenue par électrolyse ?$$, 'solution', $$La galvanoplastie.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève de 1ère C du Lycée Moderne Arsène Assouan Usher de Grand-Lahou possède une bague en cuivre dont la teinte est devenue terne après quelques années d'utilisation. Pour la protéger contre la corrosion, il sollicite un bijoutier qui décide de réaliser l'électrolyse d'une solution de chlorure d'argent, en utilisant la bague comme l'une des électrodes.$$,
      'questions', array[
        $$Nomme les électrodes que le bijoutier doit utiliser (anode et cathode), sachant que la bague doit recevoir le dépôt d'argent.$$,
        $$Écris les demi-équations qui ont lieu à chaque électrode, puis l'équation-bilan de la réaction.$$,
        $$Explique comment le bijoutier protège ainsi la bague contre la corrosion.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle réaction se produit toujours à la cathode lors d'une électrolyse ?$$,
      'hint', $$C'est l'inverse de ce qui se produit à l'anode.$$,
      'expected', $$Une réduction.$$
    ),
    jsonb_build_object(
      'question', $$Écris l'équation-bilan de l'électrolyse de l'eau (solution d'acide sulfurique).$$,
      'hint', $$Elle produit du dihydrogène et du dioxygène.$$,
      'expected', $$2H2O → 2H2 + O2.$$
    ),
    jsonb_build_object(
      'question', $$Dans l'électrolyse d'une solution de chlorure d'étain, quelle espèce est réduite à la cathode ?$$,
      'hint', $$C'est un cation métallique.$$,
      'expected', $$L'ion étain Sn²⁺, réduit en étain métallique Sn (Sn²⁺ + 2e⁻ → Sn).$$
    ),
    jsonb_build_object(
      'question', $$Cite une application industrielle de l'électrolyse.$$,
      'hint', $$Pense à la protection des métaux ou à la fabrication de certains produits chimiques.$$,
      'expected', $$La galvanoplastie (protection des métaux par dépôt métallique), la purification de métaux précieux, ou la production industrielle d'aluminium, de dichlore ou de dihydrogène.$$
    )
  ),
  now()
);
