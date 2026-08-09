-- FALLBACK CONTENT: see 20260813000000_svt-4e-transformations-corps-humain_content.sql
-- header for the ecole-ci.org access attempt this session (site-wide
-- login wall). Written from general knowledge of the standard Ivorian
-- 4ème SVT programme (Compétence 4 : le traitement de l'eau souillée —
-- décantation, filtration, désinfection, stations de traitement). 100%
-- original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après une forte crue, l'eau de la rivière que le village utilise habituellement est trouble et chargée de particules. Un agent de santé montre aux habitants comment rendre cette eau plus sûre à boire, en attendant l'installation d'un point d'eau potable protégé.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Pourquoi traiter l'eau souillée$$,
        'body', $$L'eau prélevée dans une rivière, une mare ou un puits non protégé peut contenir des particules en suspension et des microorganismes pathogènes. La traiter avant de la consommer permet d'éliminer ces éléments et de réduire fortement le risque de maladies liées à l'eau.$$,
        'highlights', array[$$eau souillée$$, $$traitement de l'eau$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le traitement de l'eau souillée, avant sa consommation, élimine les particules en suspension et les microorganismes pathogènes qu'elle peut contenir.$$),
        'example', jsonb_build_object('statement', $$Pourquoi l'eau trouble de la rivière après une crue est-elle plus risquée à boire sans traitement ?$$, 'solution', $$Parce qu'elle contient davantage de particules en suspension et de microorganismes pathogènes entraînés par le ruissellement, ce qui augmente le risque de maladies si elle est consommée telle quelle.$$),
        'fixation', jsonb_build_object('question', $$Que peut contenir une eau souillée non traitée ?$$, 'solution', $$Des particules en suspension et des microorganismes pathogènes.$$)
      ),
      jsonb_build_object(
        'heading', $$La décantation et la filtration$$,
        'body', $$La décantation consiste à laisser reposer l'eau souillée : les particules les plus lourdes se déposent progressivement au fond du récipient, laissant une eau plus claire en surface. La filtration consiste ensuite à faire passer cette eau à travers un matériau poreux, comme du sable, du gravier ou un tissu propre, qui retient les particules restantes et une partie des microorganismes.$$,
        'highlights', array[$$décantation$$, $$filtration$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Principe$$, $$Effet$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Décantation$$, $$laisser reposer l'eau$$, $$les particules lourdes se déposent au fond$$),
            jsonb_build_array($$Filtration$$, $$faire passer l'eau à travers un matériau poreux$$, $$retient les particules fines restantes$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La décantation laisse déposer les particules lourdes par repos de l'eau, tandis que la filtration retient les particules restantes en faisant passer l'eau à travers un matériau poreux.$$),
        'example', jsonb_build_object('statement', $$Pourquoi filtre-t-on l'eau après l'avoir laissée décanter, plutôt que directement ?$$, 'solution', $$Parce que la décantation élimine déjà les particules les plus lourdes, ce qui rend la filtration plus efficace sur les particules fines restantes et évite de colmater rapidement le filtre.$$),
        'fixation', jsonb_build_object('question', $$Cite deux matériaux couramment utilisés pour filtrer l'eau.$$, 'solution', $$Le sable ou le gravier, ou encore un tissu propre.$$)
      ),
      jsonb_build_object(
        'heading', $$La désinfection de l'eau$$,
        'body', $$La décantation et la filtration n'éliminent pas tous les microorganismes pathogènes. Une étape de désinfection est donc nécessaire : faire bouillir l'eau plusieurs minutes tue la plupart des microorganismes, tout comme l'ajout d'une faible quantité d'un désinfectant chimique tel que le chlore, ou l'exposition prolongée de l'eau au soleil dans un récipient transparent.$$,
        'highlights', array[$$désinfection$$, $$ébullition$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La désinfection de l'eau, par ébullition, par ajout de chlore ou par exposition au soleil, élimine les microorganismes pathogènes non retenus par la décantation et la filtration.$$),
        'example', jsonb_build_object('statement', $$Pourquoi faut-il désinfecter l'eau même après l'avoir filtrée ?$$, 'solution', $$Parce que la filtration ne retient pas tous les microorganismes pathogènes, en particulier les plus petits ; seule une désinfection (ébullition, chlore, soleil) permet de les éliminer efficacement.$$),
        'fixation', jsonb_build_object('question', $$Cite deux méthodes de désinfection de l'eau utilisables à la maison.$$, 'solution', $$Faire bouillir l'eau, ou y ajouter un désinfectant chimique comme le chlore.$$)
      ),
      jsonb_build_object(
        'heading', $$Le traitement de l'eau dans les stations$$,
        'body', $$Dans une station de traitement d'eau, plusieurs étapes se succèdent à grande échelle : la coagulation-floculation regroupe les fines particules en flocons plus lourds, suivie de la décantation, puis de la filtration, et enfin de la désinfection, souvent par chloration, avant que l'eau potable ne soit distribuée à la population.$$,
        'highlights', array[$$station de traitement$$, $$chloration$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une station de traitement d'eau enchaîne coagulation-floculation, décantation, filtration et désinfection, pour produire une eau potable distribuée à la population.$$),
        'example', jsonb_build_object('statement', $$À quoi sert l'étape de coagulation-floculation dans une station de traitement ?$$, 'solution', $$Elle regroupe les fines particules en suspension en flocons plus gros et plus lourds, qui se déposent ensuite plus facilement lors de la décantation.$$),
        'fixation', jsonb_build_object('question', $$Cite, dans l'ordre, les grandes étapes du traitement de l'eau dans une station.$$, 'solution', $$Coagulation-floculation, décantation, filtration, puis désinfection.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Après la crue, les habitants doivent traiter l'eau de la rivière, trouble et potentiellement contaminée, avant de la boire.$$,
      'questions', array[
        $$Pourquoi est-il dangereux de boire l'eau de la rivière sans la traiter après une crue ?$$,
        $$Décris le principe de la décantation, puis celui de la filtration.$$,
        $$Pourquoi une étape de désinfection reste-t-elle nécessaire même après filtration ?$$,
        $$Cite, dans l'ordre, les étapes du traitement de l'eau dans une station moderne.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la décantation de l'eau ?$$,
      'hint', $$Pense au repos de l'eau.$$,
      'expected', $$C'est le fait de laisser reposer l'eau souillée pour que les particules les plus lourdes se déposent au fond du récipient.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la filtration de l'eau ?$$,
      'hint', $$Pense au passage à travers un matériau poreux.$$,
      'expected', $$C'est le passage de l'eau à travers un matériau poreux (sable, gravier, tissu) qui retient les particules fines restantes.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux méthodes de désinfection de l'eau et explique leur intérêt.$$,
      'hint', $$Pense à l'ébullition et au chlore.$$,
      'expected', $$L'ébullition et l'ajout de chlore permettent d'éliminer les microorganismes pathogènes qui ont résisté à la décantation et à la filtration.$$
    ),
    jsonb_build_object(
      'question', $$Cite les quatre grandes étapes du traitement de l'eau dans une station moderne.$$,
      'hint', $$Pense à l'ordre : regrouper, déposer, filtrer, désinfecter.$$,
      'expected', $$La coagulation-floculation, la décantation, la filtration et la désinfection.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-traitement-eau-souillee';
