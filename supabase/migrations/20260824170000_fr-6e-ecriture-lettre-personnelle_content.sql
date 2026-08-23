-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Expression Écrite (categoryid=58).
-- Cours combinés : "6e_EE_L1_S1_lettre_perso_familère" (id 2169) et
-- "6e_EE_L2_S2_lettre_perso_non_familère" (id 2172). Contenu réécrit à
-- partir des PDF sources ; situation d'apprentissage, méthode et exemples
-- reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après ton admission en 6ème, tu es orienté(e) dans un nouveau collège. Cela fait un mois que tu as commencé les cours. Tu décides d'écrire à ton ami(e) resté(e) au village pour lui faire part de ta nouvelle vie au collège.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La lettre adressée à une personne familière$$,
        'body', $$La lettre personnelle est un écrit transmis à une personne proche (ami, parent, camarade) pour donner ou demander des nouvelles, annoncer un événement. Elle comprend cinq éléments obligatoires : (1) le nom, prénom et adresse de l'expéditeur en haut à gauche ; (2) le lieu et la date en haut à droite ; (3) la formule d'appel séparée du reste par un blanc ; (4) le corps de la lettre (introduction, développement, conclusion) ; (5) la formule de politesse suivie de la signature en bas à droite.$$,
        'highlights', array[$$5 éléments : expéditeur, lieu+date, formule d'appel, corps (intro/développement/conclusion), signature$$, $$registre courant ou familier pour une personne proche$$]::text[],
        'fixation', jsonb_build_object('question', $$Où se place le nom et l'adresse de l'expéditeur sur une lettre personnelle ?$$, 'solution', $$En haut à gauche.$$)
      ),
      jsonb_build_object(
        'heading', $$Organiser les idées : introduction, développement, conclusion$$,
        'body', $$Pour rédiger le corps de la lettre : l'introduction donne l'objet de la lettre (pourquoi on écrit) ; le développement apporte les détails et l'essentiel de l'information à transmettre ; la conclusion contient les salutations, remerciements ou l'au revoir. On utilise les pronoms personnels (je, tu) et adjectifs possessifs (mon, ton), les temps de l'indicatif, et différents types et formes de phrases.$$,
        'highlights', array[$$introduction = objet de la lettre ; développement = détails ; conclusion = salutations$$]::text[],
        'example', jsonb_build_object('statement', $$Dans une lettre où tu racontes ta nouvelle vie au collège, que mets-tu dans l'introduction ?$$, 'solution', $$La raison pour laquelle tu écris (ex : "Je t'écris cette lettre pour partager avec toi le plaisir de ma nouvelle vie de collégien.")$$),
        'fixation', jsonb_build_object('question', $$Que met-on généralement dans la conclusion d'une lettre personnelle ?$$, 'solution', $$Les salutations, des remerciements, ou une formule d'au revoir.$$)
      ),
      jsonb_build_object(
        'heading', $$La lettre adressée à une personne non familière$$,
        'body', $$Une lettre non familière s'adresse à une personne qui n'est pas un proche (directeur, préfet, maire...). Elle garde la même organisation matérielle, mais utilise un registre soutenu : lexique du respect et de la courtoisie ("Je vous prie de croire en l'expression de mon profond respect"), le vouvoiement (vous, votre, vos), et souvent le conditionnel ("je voudrais", "j'aimerais").$$,
        'highlights', array[$$personne non familière = pas un proche (directeur, maire, juge...)$$, $$registre soutenu : vouvoiement + conditionnel + formules de politesse élaborées$$]::text[],
        'example', jsonb_build_object('statement', $$Comment s'adresse-t-on à son Principal(e) pour demander une autorisation, à l'oral comme à l'écrit ?$$, 'solution', $$En le/la vouvoyant, avec un registre soutenu et des formules de politesse (ex : "Je vous prie de bien vouloir m'autoriser à...").$$),
        'fixation', jsonb_build_object('question', $$Quel mode verbal est souvent utilisé pour formuler poliment une demande dans une lettre non familière ?$$, 'solution', $$Le conditionnel ("je voudrais", "j'aimerais").$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Trois mois après le début des cours en 6ème, tu veux donner des nouvelles de ta nouvelle vie à ton ancien directeur de CM2, avec qui tu as gardé de bons rapports.$$,
      'questions', array[
        $$Identifie le type de texte à produire (lettre familière ou non familière) et justifie.$$,
        $$Rédige l'introduction de la lettre en donnant l'objet de ton message.$$,
        $$Rédige la lettre complète en 15 lignes maximum, avec tous les éléments obligatoires.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Range dans l'ordre les éléments d'une lettre personnelle : signature, corps de la lettre, formule d'appel, nom/prénom/adresse de l'expéditeur, lieu et date, formule de politesse.$$,
      'hint', $$L'expéditeur et la date viennent en premier, la signature en dernier.$$,
      'expected', $$Nom/prénom/adresse de l'expéditeur et lieu/date → formule d'appel → corps de la lettre → formule de politesse → signature.$$
    ),
    jsonb_build_object(
      'question', $$Le Préfet, ton oncle, ta sœur, le directeur : classe-les en "personnes familières" et "personnes non familières".$$,
      'hint', $$La famille est familière, les autorités ne le sont pas.$$,
      'expected', $$Familières : ton oncle, ta sœur. Non familières : le Préfet, le directeur.$$
    ),
    jsonb_build_object(
      'question', $$Quel pronom utilise-t-on pour s'adresser à une personne non familière ?$$,
      'hint', $$C'est le contraire du tutoiement.$$,
      'expected', $$"Vous" (le vouvoiement).$$
    ),
    jsonb_build_object(
      'question', $$À quelle partie de la lettre appartient la phrase "Je vous écris pour vous donner de mes nouvelles" ?$$,
      'hint', $$C'est la première partie du corps de la lettre.$$,
      'expected', $$L'introduction.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-ecriture-lettre-personnelle';
