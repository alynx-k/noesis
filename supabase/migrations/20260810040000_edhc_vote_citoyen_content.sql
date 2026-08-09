-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- voting and citizen participation in national life, in 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le grand frère de Fatou vient d'avoir 18 ans. Il reçoit sa carte d'électeur et se demande à quoi sert vraiment son vote, et si voter est la seule façon de participer à la vie de la Nation. Fatou, plus jeune, veut comprendre pour se préparer à son tour.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le vote, un droit et un devoir civique$$,
        'body', $$Le vote est le droit reconnu à tout citoyen majeur de choisir, par un bulletin secret, ses représentants ou de se prononcer sur une question qui engage la Nation. C'est aussi un devoir civique, car il permet à chacun de participer aux décisions collectives.$$,
        'highlights', array[$$vote$$, $$devoir civique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$En Côte d'Ivoire, tout citoyen âgé d'au moins 18 ans, inscrit sur la liste électorale et muni de sa carte d'électeur, a le droit de voter lors des élections.$$),
        'example', jsonb_build_object('statement', $$Le grand frère de Fatou a 18 ans, sa carte d'électeur, et son nom sur la liste électorale. Peut-il voter ?$$, 'solution', $$Oui, il remplit les trois conditions nécessaires pour voter : l'âge, l'inscription sur la liste électorale et la carte d'électeur.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conditions et les étapes pour voter$$,
        'body', $$Pour pouvoir voter, il faut être de nationalité ivoirienne, avoir 18 ans révolus, s'inscrire sur la liste électorale de sa localité, puis retirer sa carte d'électeur. Le jour du scrutin, l'électeur se présente au bureau de vote avec sa pièce d'identité et sa carte pour glisser son bulletin dans l'urne.$$,
        'highlights', array[$$liste électorale$$, $$carte d'électeur$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Description$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Inscription$$, $$S'inscrire sur la liste électorale de sa commune$$),
            jsonb_build_array($$Retrait de la carte$$, $$Récupérer sa carte d'électeur$$),
            jsonb_build_array($$Jour du vote$$, $$Se présenter au bureau de vote avec ses documents$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite deux documents nécessaires pour voter le jour du scrutin.$$, 'solution', $$La carte d'électeur et une pièce d'identité.$$)
      ),
      jsonb_build_object(
        'heading', $$Les autres formes de participation à la vie de la Nation$$,
        'body', $$Participer à la vie de la Nation ne se limite pas au vote : un citoyen peut aussi s'exprimer dans des débats publics, s'engager dans une association, participer à des actions de développement communautaire, ou informer et sensibiliser son entourage.$$,
        'highlights', array[$$participation citoyenne$$]::text[],
        'example', jsonb_build_object('statement', $$Fatou est trop jeune pour voter. Comment peut-elle déjà participer à la vie de sa communauté ?$$, 'solution', $$Elle peut s'engager dans des activités scolaires ou associatives, participer au nettoyage de son quartier, ou sensibiliser ses camarades à des sujets citoyens.$$)
      ),
      jsonb_build_object(
        'heading', $$Un vote responsable, libre et honnête$$,
        'body', $$Un vote responsable suppose de choisir en toute liberté, sans céder à l'achat de voix, à la pression ou à la peur, et de respecter le choix des autres, même différent du sien.$$,
        'highlights', array[$$vote responsable$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi doit-on refuser de vendre son vote contre de l'argent ?$$, 'solution', $$Parce que le vote doit rester un choix libre et honnête ; le vendre fausse la volonté réelle des citoyens et fragilise la démocratie.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$À la veille d'une élection locale, un homme propose de l'argent à plusieurs jeunes majeurs de ton quartier en échange de leur vote pour un candidat.$$,
      'questions', array[
        $$Explique pourquoi cette pratique est contraire à un vote responsable.$$,
        $$Rappelle les conditions légales que ces jeunes doivent remplir pour voter.$$,
        $$Propose une attitude citoyenne que ces jeunes devraient adopter face à cette proposition.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que le vote et pourquoi est-il considéré comme un devoir civique ?$$,
      'hint', $$Pense au choix des représentants et à la participation aux décisions collectives.$$,
      'expected', $$Le vote est le droit de choisir ses représentants par un bulletin secret ; c'est un devoir civique car il permet à chacun de participer aux décisions qui engagent la Nation.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois conditions à remplir pour pouvoir voter en Côte d'Ivoire.$$,
      'hint', $$Pense à l'âge, l'inscription et la carte.$$,
      'expected', $$Avoir 18 ans révolus, être inscrit sur la liste électorale, et posséder sa carte d'électeur.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de participation à la vie de la Nation autre que le vote.$$,
      'hint', $$Pense aux jeunes qui n'ont pas encore l'âge de voter.$$,
      'expected', $$Par exemple : s'engager dans une association, participer à une action communautaire, ou sensibiliser son entourage à un sujet civique.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi l'achat de voix est-il néfaste pour la démocratie ?$$,
      'hint', $$Pense à la liberté et à la sincérité du choix des électeurs.$$,
      'expected', $$Parce qu'il fausse la volonté réelle des électeurs, remplace un choix libre par un choix acheté, et affaiblit la confiance dans les élections.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-vote-citoyen';
