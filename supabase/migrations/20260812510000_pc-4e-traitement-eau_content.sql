-- Physique-Chimie 4ème — Traitement de l'eau.
-- FALLBACK content (see header of
-- 20260812400000_pc-4e-sources-recepteurs-lumiere_content.sql for the
-- sourcing attempts this pass). Written from solid general knowledge of
-- the standard 4ème chemistry competency (étapes de potabilisation :
-- dégrillage, décantation, coagulation-floculation, filtration,
-- désinfection), contextualisé avec la SODECI, société ivoirienne de
-- distribution d'eau. Original wording throughout, not copied from any
-- source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$L'eau prélevée dans un fleuve ou une lagune est trouble, chargée de débris, de particules en suspension et de micro-organismes : elle n'est absolument pas consommable en l'état. Pourtant, quelques heures plus tard, elle arrive limpide et potable au robinet des habitations. Quelles étapes une usine de traitement fait-elle subir à cette eau pour la rendre propre à la consommation ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$De l'eau brute à l'eau potable$$,
        'body', $$L'eau prélevée dans le milieu naturel (fleuve, lagune, forage) est appelée eau brute. Elle contient des déchets grossiers, des particules en suspension responsables de sa turbidité, ainsi que des micro-organismes, dont certains peuvent être pathogènes. Une usine de traitement lui fait subir plusieurs étapes successives pour la rendre potable, c'est-à-dire propre à la consommation humaine.$$,
        'highlights', array[$$eau brute$$, $$eau potable$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$L'eau potable est une eau qui peut être consommée sans risque pour la santé, débarrassée de ses impuretés et de ses micro-organismes pathogènes par un traitement adapté.$$),
        'example', jsonb_build_object('statement', $$Pourquoi l'eau prélevée directement dans une lagune ne peut-elle pas être bue sans traitement préalable ?$$, 'solution', $$Parce qu'elle contient des particules en suspension et des micro-organismes, dont certains pathogènes, qui la rendent impropre à la consommation en l'état.$$),
        'fixation', jsonb_build_object('question', $$Comment nomme-t-on l'eau prélevée directement dans le milieu naturel, avant tout traitement ?$$, 'solution', $$L'eau brute.$$)
      ),
      jsonb_build_object(
        'heading', $$Étapes mécaniques : dégrillage et décantation$$,
        'body', $$Le dégrillage (ou tamisage) est la première étape : l'eau brute traverse des grilles qui retiennent les déchets les plus grossiers (branches, feuilles, débris). Vient ensuite la décantation, durant laquelle l'eau est laissée au repos dans de grands bassins, ce qui permet aux particules les plus lourdes en suspension de se déposer au fond sous l'effet de leur propre poids.$$,
        'highlights', array[$$dégrillage$$, $$décantation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le dégrillage retient les déchets grossiers par une simple barrière physique. La décantation sépare les particules en suspension les plus lourdes par sédimentation naturelle, sans intervention chimique.$$),
        'example', jsonb_build_object('statement', $$Après un passage dans un bassin de décantation, l'eau est déjà plus claire mais reste encore légèrement trouble. Pourquoi la décantation seule ne suffit-elle pas à clarifier totalement l'eau ?$$, 'solution', $$Parce que les particules les plus fines restent en suspension trop longtemps pour se déposer par simple gravité : une étape supplémentaire (coagulation-floculation) est nécessaire pour les éliminer.$$),
        'fixation', jsonb_build_object('question', $$Quelle étape du traitement de l'eau retient les déchets les plus grossiers grâce à des grilles ?$$, 'solution', $$Le dégrillage (ou tamisage).$$)
      ),
      jsonb_build_object(
        'heading', $$Coagulation-floculation et filtration$$,
        'body', $$Pour éliminer les particules fines qui ne décantent pas naturellement, on ajoute à l'eau un réactif appelé coagulant : les particules fines s'agglomèrent alors en amas plus gros, appelés flocons, qui peuvent ensuite se déposer ou être retenus. L'eau traverse enfin des filtres, souvent constitués de sable et de charbon actif, qui retiennent les dernières particules en suspension.$$,
        'highlights', array[$$coagulation-floculation$$, $$filtration$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La coagulation-floculation agglomère les particules fines en flocons plus faciles à séparer. La filtration, à travers du sable et du charbon actif, retient les dernières impuretés et clarifie l'eau.$$),
        'example', jsonb_build_object('statement', $$Pourquoi ajoute-t-on un coagulant à l'eau avant la filtration ?$$, 'solution', $$Pour agglomérer les fines particules en suspension en flocons plus gros, plus faciles à retenir lors de la filtration.$$),
        'fixation', jsonb_build_object('question', $$À travers quels matériaux l'eau passe-t-elle généralement lors de l'étape de filtration ?$$, 'solution', $$Du sable et du charbon actif.$$)
      ),
      jsonb_build_object(
        'heading', $$Désinfection et distribution$$,
        'body', $$Même filtrée, l'eau peut encore contenir des micro-organismes invisibles. La désinfection, réalisée par ajout de chlore (chloration) ou par ozonation, élimine les micro-organismes pathogènes restants et protège l'eau contre une nouvelle contamination pendant son acheminement. L'eau potable est ensuite stockée dans des châteaux d'eau avant d'être distribuée jusqu'aux robinets, comme le fait la SODECI en Côte d'Ivoire.$$,
        'highlights', array[$$désinfection$$, $$chloration$$, $$distribution$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La désinfection (chloration ou ozonation) élimine les micro-organismes pathogènes restants après la filtration, rendant l'eau potable et sûre pour la consommation.$$),
        'example', jsonb_build_object('statement', $$Pourquoi ajoute-t-on du chlore à l'eau potable avant sa distribution, même après une filtration efficace ?$$, 'solution', $$Pour éliminer les micro-organismes pathogènes restants et protéger l'eau d'une nouvelle contamination pendant son transport jusqu'aux robinets.$$),
        'fixation', jsonb_build_object('question', $$Quelle société assure le traitement et la distribution de l'eau potable en Côte d'Ivoire ?$$, 'solution', $$La SODECI (Société de Distribution d'Eau de Côte d'Ivoire).$$),
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Dégrillage$$, $$Retenir les déchets grossiers$$),
            jsonb_build_array($$Décantation$$, $$Déposer les particules lourdes en suspension$$),
            jsonb_build_array($$Coagulation-floculation$$, $$Agglomérer les particules fines en flocons$$),
            jsonb_build_array($$Filtration$$, $$Retenir les dernières impuretés (sable, charbon actif)$$),
            jsonb_build_array($$Désinfection$$, $$Éliminer les micro-organismes pathogènes$$)
          )
        )
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une usine de traitement d'eau prélève de l'eau trouble dans un fleuve. Elle la fait successivement passer par des grilles, puis dans un grand bassin de repos, puis lui ajoute un réactif provoquant la formation de flocons, avant de la filtrer sur du sable et de lui ajouter du chlore.$$,
      'questions', array[
        $$Nomme, dans l'ordre, chacune des cinq étapes décrites dans ce scénario.$$,
        $$Quel est le rôle du réactif ajouté avant la filtration ?$$,
        $$Pourquoi l'ajout de chlore est-il indispensable, même après la filtration sur sable ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la première étape du traitement de l'eau, qui retient les déchets grossiers grâce à des grilles ?$$,
      'hint', $$Elle porte aussi le nom de tamisage.$$,
      'expected', $$Le dégrillage.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le rôle de la décantation dans le traitement de l'eau ?$$,
      'hint', $$Pense à ce qui se passe quand l'eau est laissée au repos.$$,
      'expected', $$Elle permet aux particules lourdes en suspension de se déposer au fond du bassin sous l'effet de leur propre poids.$$
    ),
    jsonb_build_object(
      'question', $$À travers quels matériaux l'eau passe-t-elle généralement lors de la filtration ?$$,
      'hint', $$Ce sont deux matériaux naturels très utilisés en filtration.$$,
      'expected', $$Du sable et du charbon actif.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la désinfection (chloration) est-elle une étape indispensable du traitement de l'eau ?$$,
      'hint', $$Pense à ce que la filtration seule ne peut pas éliminer.$$,
      'expected', $$Parce qu'elle élimine les micro-organismes pathogènes restants, invisibles, que la filtration seule ne suffit pas toujours à retenir, rendant ainsi l'eau sûre pour la consommation.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-traitement-eau';
