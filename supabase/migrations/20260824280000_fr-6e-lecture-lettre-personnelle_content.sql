-- FALLBACK CONTENT : le cours "6e_LECT_L1_S1_explot_texte_lettre_perso"
-- (id 2177, catégorie Lecture, coll.ecole-ci.org) est mal indexé sur la
-- plateforme : sa ressource pointe en réalité vers le contenu de "La
-- conquête du feu" (récit simple), déjà utilisé dans
-- fr-6e-texte-narratif. Aucun autre cours de la catégorie Lecture ne
-- couvre l'analyse de lettre personnelle. Écrit à partir de la
-- connaissance générale du programme officiel MENA de 6ème, en
-- s'appuyant sur la méthode de lecture méthodique déjà enseignée
-- (hypothèse générale, axes de lecture, bilan) et sur la structure de la
-- lettre personnelle déjà étudiée en expression écrite
-- (fr-6e-ecriture-lettre-personnelle).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au Centre de Documentation et d'Information du collège, des élèves de 6ème trouvent une lettre personnelle qu'un ancien élève avait laissée à son professeur avant de quitter l'établissement. Intrigués, ils s'organisent pour en analyser le contenu et la manière dont elle est écrite.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Identifier la situation de communication$$,
        'body', $$Lire une lettre personnelle, c'est d'abord identifier qui écrit à qui, et pourquoi. On repère l'expéditeur et le destinataire (en haut de la lettre), le lieu et la date d'écriture, et l'objet de la lettre (annoncé dès l'introduction ou la formule d'appel). Ces éléments permettent de comprendre le contexte avant même de lire le contenu détaillé.$$,
        'highlights', array[$$identifier : qui écrit ? à qui ? d'où ? quand ? pourquoi ?$$, $$ces informations se trouvent dans l'en-tête et l'introduction$$]::text[],
        'fixation', jsonb_build_object('question', $$Où trouve-t-on habituellement le nom de l'expéditeur d'une lettre personnelle ?$$, 'solution', $$En haut à gauche de la lettre.$$)
      ),
      jsonb_build_object(
        'heading', $$Reconnaître le registre de langue et le ton$$,
        'body', $$Selon que la lettre s'adresse à une personne familière (ami, parent) ou non familière (directeur, autorité), le registre de langue change : tutoiement et vocabulaire courant/familier pour une personne proche, vouvoiement et formules de politesse élaborées pour une personne non familière. Le ton (joyeux, triste, reconnaissant, inquiet...) se repère à travers le choix des mots, la ponctuation (points d'exclamation, d'interrogation) et les expressions employées.$$,
        'highlights', array[$$registre familier (tutoiement) vs registre soutenu (vouvoiement, politesse)$$, $$le ton se lit dans le vocabulaire et la ponctuation$$]::text[],
        'example', jsonb_build_object('statement', $$Une lettre contient "Je te remercie infiniment, tu m'as tant manqué !" Quel est le registre et le ton ?$$, 'solution', $$Registre familier (tutoiement) ; ton affectueux et reconnaissant (souligné par l'exclamation).$$),
        'fixation', jsonb_build_object('question', $$À quoi reconnaît-on qu'une lettre s'adresse à une personne non familière ?$$, 'solution', $$Au vouvoiement et aux formules de politesse soutenues.$$)
      ),
      jsonb_build_object(
        'heading', $$Analyser le corps de la lettre : introduction, développement, conclusion$$,
        'body', $$Comme pour tout texte, on applique la méthode de lecture : formuler une hypothèse générale sur le sens de la lettre, puis vérifier par des axes de lecture (le vocabulaire employé, les sentiments exprimés, les événements racontés). Dans le corps de la lettre : l'introduction annonce l'objet ("Je t'écris pour..."), le développement apporte les détails, et la conclusion contient les salutations ou une demande finale. Un bilan permet de dire si l'hypothèse de départ est confirmée.$$,
        'highlights', array[$$hypothèse générale → axes de lecture (vocabulaire, sentiments, événements) → bilan$$, $$introduction = objet ; développement = détails ; conclusion = salutations$$]::text[],
        'example', jsonb_build_object('statement', $$Une lettre commence par "Je t'écris pour te dire à quel point ce collège va me manquer." Quelle est l'hypothèse générale de lecture ?$$, 'solution', $$C'est une lettre d'adieu, exprimant la nostalgie de l'auteur envers son ancien collège.$$),
        'fixation', jsonb_build_object('question', $$Que doit confirmer le bilan à la fin de la lecture d'une lettre ?$$, 'solution', $$Il confirme (ou nuance) l'hypothèse générale formulée au départ sur le sens et le ton de la lettre.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$On te remet une lettre personnelle écrite par un(e) élève de 6ème à son grand frère parti étudier en ville. Tu dois en analyser le sens et la forme.$$,
      'questions', array[
        $$Identifie l'expéditeur, le destinataire, et l'objet de la lettre.$$,
        $$Détermine le registre de langue utilisé et justifie ta réponse par des exemples du texte.$$,
        $$Formule une hypothèse générale de lecture, puis vérifie-la à travers le vocabulaire et les sentiments exprimés.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une lettre commence par "Cher Papa, comment vas-tu ?" — quel est le registre de langue ?$$,
      'hint', $$"Cher" et le tutoiement indiquent une relation proche.$$,
      'expected', $$Le registre familier (courant), car elle s'adresse à une personne proche avec tutoiement.$$
    ),
    jsonb_build_object(
      'question', $$Où, dans une lettre, trouve-t-on généralement l'objet du message ?$$,
      'hint', $$C'est en général la première partie du corps de la lettre.$$,
      'expected', $$Dans l'introduction.$$
    ),
    jsonb_build_object(
      'question', $$Quels indices textuels permettent de repérer le ton triste d'une lettre ?$$,
      'hint', $$Pense au vocabulaire et à la ponctuation.$$,
      'expected', $$Un vocabulaire évoquant la peine ou le manque, et une ponctuation expressive (points de suspension, exclamations).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la première étape de la méthode de lecture d'un texte ?$$,
      'hint', $$Avant même de vérifier, il faut proposer une idée.$$,
      'expected', $$Formuler une hypothèse générale de lecture.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-lecture-lettre-personnelle';
