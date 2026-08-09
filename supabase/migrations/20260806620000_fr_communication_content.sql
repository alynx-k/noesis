-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). A matching ecole-ci.org
-- source exists ("LA COMMUNICATION S10", categoryid=10) but could not be
-- fetched in this session (the Claude-in-Chrome browser extension
-- disconnected mid-session and did not reconnect); this content is
-- therefore written from general knowledge of the standard 3ème programme
-- topic (Jakobson's communication schema and the functions of language),
-- not from that specific source. Entirely original wording either way.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour un exposé de sciences humaines, ton professeur de français te demande d'expliquer comment fonctionne la communication entre deux personnes, à l'aide d'un schéma.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les éléments du schéma de la communication$$,
        'body', $$Toute situation de communication met en jeu plusieurs éléments essentiels, qu'on peut identifier dans n'importe quel échange, écrit ou oral.$$,
        'highlights', array[$$émetteur$$, $$récepteur$$, $$message$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Élément$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$L'émetteur$$, $$la personne qui envoie le message$$),
            jsonb_build_array($$Le récepteur$$, $$la personne qui reçoit le message$$),
            jsonb_build_array($$Le message$$, $$l'information transmise$$),
            jsonb_build_array($$Le code$$, $$la langue ou le système de signes utilisé (français, gestes, symboles...)$$),
            jsonb_build_array($$Le canal$$, $$le moyen par lequel le message circule (voix, écrit, téléphone...)$$),
            jsonb_build_array($$Le référent$$, $$le sujet dont parle le message$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une communication réussie suppose que l'émetteur et le récepteur partagent le même code, et que le canal choisi permette au message d'arriver clairement jusqu'au récepteur.$$),
        'example', jsonb_build_object('statement', $$Identifie l'émetteur, le récepteur et le canal dans cette situation : un élève envoie un message vocal à son camarade pour lui expliquer un exercice.$$, 'solution', $$L'émetteur est l'élève qui parle, le récepteur est son camarade, et le canal est le message vocal (l'audio).$$),
        'fixation', jsonb_build_object('question', $$Identifie le code utilisé dans un panneau de signalisation routière.$$, 'solution', $$Le code utilisé est un système de symboles visuels (pictogrammes), compris par tous les usagers de la route.$$)
      ),
      jsonb_build_object(
        'heading', $$Les obstacles à la communication$$,
        'body', $$La communication peut échouer si un obstacle empêche le message d'être transmis ou compris correctement.$$,
        'highlights', array[$$un bruit$$, $$un malentendu$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$On appelle « bruit » tout ce qui perturbe la transmission d'un message : un bruit réel (environnement bruyant), un code mal partagé (langue différente), ou un canal défaillant (mauvaise connexion). Ces obstacles peuvent créer un malentendu.$$),
        'example', jsonb_build_object('statement', $$Donne un exemple d'obstacle à la communication lors d'un appel téléphonique.$$, 'solution', $$Une mauvaise connexion qui coupe la voix est un obstacle qui empêche le message d'arriver clairement.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi deux personnes qui ne parlent pas la même langue ont-elles du mal à communiquer ?$$, 'solution', $$Parce qu'elles ne partagent pas le même code, ce qui empêche le message d'être compris.$$)
      ),
      jsonb_build_object(
        'heading', $$Les fonctions du langage$$,
        'body', $$Selon l'intention de l'émetteur, un message peut remplir différentes fonctions : informer, exprimer un sentiment, convaincre, ou simplement maintenir le contact.$$,
        'highlights', array[$$fonction informative$$, $$fonction expressive$$, $$fonction conative$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fonction$$, $$But$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Fonction informative$$, $$transmettre une information$$, $$« Il pleut aujourd'hui. »$$),
            jsonb_build_array($$Fonction expressive$$, $$exprimer un sentiment de l'émetteur$$, $$« Je suis tellement content ! »$$),
            jsonb_build_array($$Fonction conative$$, $$chercher à agir sur le récepteur$$, $$« Ferme la porte, s'il te plaît. »$$),
            jsonb_build_array($$Fonction phatique$$, $$maintenir le contact$$, $$« Allô, tu m'entends ? »$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un même message peut remplir plusieurs fonctions à la fois, mais l'une d'elles domine généralement, selon ce que l'émetteur cherche à obtenir du récepteur.$$),
        'example', jsonb_build_object('statement', $$Quelle est la fonction dominante de cette phrase : « Range ta chambre tout de suite ! »$$, 'solution', $$C'est la fonction conative, car l'émetteur cherche à obtenir une action du récepteur.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la fonction dominante de cette phrase : « J'ai tellement hâte d'être en vacances ! »$$, 'solution', $$C'est la fonction expressive, car l'émetteur exprime son propre sentiment.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour ton exposé de sciences humaines, tu dois analyser une situation de communication de ton choix (conversation, appel, message écrit).$$,
      'questions', array[
        $$Identifie les six éléments du schéma de la communication dans la situation choisie.$$,
        $$Repère un obstacle possible à cette communication.$$,
        $$Détermine la fonction dominante du message analysé.$$,
        $$Propose une solution pour éviter l'obstacle identifié.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans un SMS envoyé par Awa à Kouadio, qui est l'émetteur et qui est le récepteur ?$$,
      'hint', $$Repère qui envoie et qui reçoit le message.$$,
      'expected', $$Awa est l'émetteur, car elle envoie le message ; Kouadio est le récepteur, car il le reçoit.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le canal utilisé lorsqu'on discute en face à face avec quelqu'un ?$$,
      'hint', $$Pense au moyen physique par lequel passe le message.$$,
      'expected', $$Le canal est la voix (la parole orale directe).$$
    ),
    jsonb_build_object(
      'question', $$Quelle fonction du langage domine dans « Allô, tu es toujours là ? »$$,
      'hint', $$Pense au but de cette phrase : informer, ou vérifier le contact ?$$,
      'expected', $$C'est la fonction phatique, car le but est de vérifier que le contact est maintenu.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de bruit qui pourrait perturber une communication en classe.$$,
      'hint', $$Pense à un obstacle sonore ou matériel.$$,
      'expected', $$Un brouhaha dans la classe qui empêche d'entendre clairement les paroles du professeur.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-communication';
