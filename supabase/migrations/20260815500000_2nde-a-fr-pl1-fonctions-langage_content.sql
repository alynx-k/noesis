-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3196: "PL1 : Les fonctions du langage"
-- (https://lyc.ecole-ci.org/course/view.php?id=3196)
-- Resource "Je lis le résumé de la leçon", mod_resource id 31591, redirecting
-- to pluginfile "1 PL PL 2nde les fonctions du langage.pdf" (3 pages).
-- Rewritten/paraphrased from the source PDF (Leçon 1 : La communication,
-- séance unique : les fonctions du langage): the six factors of the
-- communication scheme, the six corresponding functions of language
-- (expressive/émotive, conative, phatique, poétique, métalinguistique,
-- référentielle) with their definitions and examples, and the method to
-- identify the dominant function in a text. 100% original wording; no
-- sentence copied from the source. The poem excerpt used as an exercise in
-- the source PDF (Victor Hugo) was not reproduced; an original evaluation
-- scenario was written instead.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl1-fonctions-langage',
  '2nde',
  'A',
  'francais',
  $$Les fonctions du langage$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club littéraire du lycée a invité des humoristes et des comédiens pour animer le lancement de ses activités. Séduits par leur talent à capter l'attention, convaincre ou faire rire, les élèves de la classe de seconde A cherchent à comprendre les techniques de communication utilisées. À partir d'une série de courtes répliques, ils s'organisent pour identifier les fonctions du langage, les analyser et apprendre à les reconnaître en contexte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le schéma de la communication et ses six facteurs$$,
        'body', $$Pour qu'il y ait communication, six éléments, appelés facteurs, doivent être réunis : un destinateur (celui qui parle ou écrit) envoie un message à un destinataire (celui qui reçoit), par un canal (le moyen physique utilisé), à l'aide d'un code commun (la langue), et en faisant référence à un référent (le sujet, le contexte dont on parle). Le linguiste Roman Jakobson a montré que chacun de ces six facteurs, lorsqu'il est mis en valeur, donne naissance à une fonction du langage particulière.$$,
        'highlights', array[$$six facteurs$$, $$fonctions du langage$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Facteur de la communication$$, $$Fonction dominante associée$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Destinateur (émetteur)$$, $$Fonction expressive (ou émotive)$$),
            jsonb_build_array($$Destinataire (récepteur)$$, $$Fonction conative$$),
            jsonb_build_array($$Canal$$, $$Fonction phatique$$),
            jsonb_build_array($$Message$$, $$Fonction poétique$$),
            jsonb_build_array($$Code$$, $$Fonction métalinguistique$$),
            jsonb_build_array($$Référent (contexte)$$, $$Fonction référentielle$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Combien de facteurs interviennent dans tout acte de communication, selon le schéma étudié en cours ?$$, 'solution', $$Six : le destinateur, le destinataire, le message, le canal, le code et le référent.$$)
      ),
      jsonb_build_object(
        'heading', $$Les fonctions centrées sur les interlocuteurs : expressive et conative$$,
        'body', $$La fonction expressive (ou émotive) met l'accent sur le destinateur : elle traduit les sentiments, l'émotion ou le jugement de celui qui parle, et se reconnaît souvent à des interjections ou à des phrases exclamatives. La fonction conative, elle, est tournée vers le destinataire : elle cherche à agir sur lui, à le convaincre, à lui donner un ordre ou un conseil ; elle se manifeste par l'impératif, l'apostrophe ou les formes d'interpellation directe.$$,
        'highlights', array[$$fonction expressive$$, $$fonction conative$$]::text[],
        'example', jsonb_build_object('statement', $$Dans la phrase « Quelle belle voiture ! », quelle fonction du langage domine ?$$, 'solution', $$La fonction expressive, car le locuteur exprime son admiration, son émotion face à ce qu'il voit.$$),
        'fixation', jsonb_build_object('question', $$Quelle fonction du langage domine dans un ordre comme « Approche-toi ! » ?$$, 'solution', $$La fonction conative, puisque l'énoncé cherche à agir directement sur le destinataire.$$)
      ),
      jsonb_build_object(
        'heading', $$La fonction phatique et la fonction poétique$$,
        'body', $$La fonction phatique porte sur le canal de communication : elle sert à établir, à maintenir ou à vérifier le contact entre les interlocuteurs, par exemple au téléphone quand on demande « Allô, tu m'entends ? ». La fonction poétique, elle, met l'accent sur le message lui-même, sur sa forme : elle se manifeste par un travail sur les sonorités, le rythme, les images ou les figures de style, aussi bien en poésie que dans un slogan publicitaire.$$,
        'highlights', array[$$fonction phatique$$, $$fonction poétique$$]::text[],
        'fixation', jsonb_build_object('question', $$À quoi sert la fonction phatique lors d'une communication téléphonique ?$$, 'solution', $$Elle sert à vérifier que le contact (le canal) est bien établi et maintenu entre les interlocuteurs, par exemple « Allô, vous m'entendez ? ».$$)
      ),
      jsonb_build_object(
        'heading', $$La fonction métalinguistique et la fonction référentielle$$,
        'body', $$La fonction métalinguistique porte sur le code lui-même : le langage sert alors à expliquer ou à définir le langage, par exemple quand on précise le sens d'un mot ou une règle de grammaire. La fonction référentielle, elle, porte sur le référent, c'est-à-dire le sujet ou le contexte dont on parle : elle vise à informer et à transmettre un savoir sur le monde réel, de façon neutre et objective, comme dans un bulletin météorologique ou un article documentaire.$$,
        'highlights', array[$$fonction métalinguistique$$, $$fonction référentielle$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle fonction domine quand un dictionnaire explique le sens d'un mot ?$$, 'solution', $$La fonction métalinguistique, car le langage sert alors à expliquer le code lui-même.$$)
      ),
      jsonb_build_object(
        'heading', $$Identifier les fonctions du langage dans un texte$$,
        'body', $$Pour reconnaître la ou les fonctions dominantes d'un texte, il faut d'abord repérer le facteur de la communication mis en valeur (qui parle ? à qui ? de quoi ? de quelle manière ?), puis relever les indices grammaticaux et lexicaux qui le confirment : pronoms personnels, mode impératif, interjections, figures de style, termes techniques, etc. Un même texte peut combiner plusieurs fonctions, mais l'une d'entre elles domine généralement les autres.$$,
        'highlights', array[$$fonction dominante$$, $$indices$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un poème qui multiplie les rimes et les images pour décrire un paysage, quelle fonction s'ajoute à la fonction référentielle ?$$, 'solution', $$La fonction poétique, car l'auteur travaille aussi la forme du message (rimes, images, rythme).$$),
        'fixation', jsonb_build_object('question', $$Cite deux indices qui permettent de repérer la fonction conative dans un texte.$$, 'solution', $$Par exemple l'emploi du mode impératif et l'apostrophe, c'est-à-dire l'interpellation directe du destinataire.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une émission de radio, l'animateur s'exclame : « Quelle nouvelle extraordinaire ! », interpelle ensuite ses auditeurs par « Chers amis, ne manquez surtout pas la suite ! », vérifie leur écoute par « Vous êtes toujours avec nous ? », puis donne une information précise sur la météo du jour.$$,
      'questions', array[
        $$Présente le schéma de la communication et ses six facteurs.$$,
        $$Identifie la fonction du langage dominante dans chacune des quatre répliques de l'animateur.$$,
        $$Explique la différence entre la fonction expressive et la fonction conative.$$,
        $$Donne un exemple de phrase où domine la fonction référentielle.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel facteur de la communication est mis en valeur par la fonction poétique ?$$,
      'hint', $$C'est le facteur sur lequel porte le travail de style.$$,
      'expected', $$Le message.$$
    ),
    jsonb_build_object(
      'question', $$Quelle fonction du langage sert à vérifier que le contact est maintenu entre les interlocuteurs ?$$,
      'hint', $$Pense à « Allô, tu m'entends ? ».$$,
      'expected', $$La fonction phatique.$$
    ),
    jsonb_build_object(
      'question', $$Quel linguiste a proposé le modèle des six fonctions du langage étudié en cours ?$$,
      'hint', $$Un linguiste du XXe siècle.$$,
      'expected', $$Roman Jakobson.$$
    ),
    jsonb_build_object(
      'question', $$Quelle fonction domine quand on explique le sens d'un mot de vocabulaire ?$$,
      'hint', $$Le langage parle alors du langage lui-même.$$,
      'expected', $$La fonction métalinguistique.$$
    )
  ),
  now()
);
