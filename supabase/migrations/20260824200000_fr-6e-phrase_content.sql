-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Grammaire (categoryid=61).
-- Cours combinés (6 séances) : "6e_Gr_L1_S1_phrase_constituants" (id
-- 2189), "S2_types_phrases_décla_interro" (id 2190),
-- "S3_types_phrases_impér_exclamatif" (id 2191),
-- "S4_types_phrases_affirm_négative" (id 2192), "S5_phrases_emphatiques"
-- (id 2193), "S6_types_phrases_active_passive" (id 2194). Contenu réécrit
-- à partir des PDF sources ; définitions et exemples reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours de leurs recherches en bibliothèque, les élèves de 6ème découvrent un corpus de phrases variées. Intéressés, ils s'organisent pour connaître les différents types et formes de phrases, les définir et les utiliser en contexte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les constituants de la phrase, et les types déclaratif/interrogatif$$,
        'body', $$La phrase de base comprend deux constituants obligatoires : le groupe nominal sujet (GNS, ex : "Les soldats reviennent") et le groupe verbal (GV : verbe seul, verbe + COD/COI, ou être + attribut). Un constituant facultatif (souvent un complément circonstanciel) peut être supprimé ou déplacé sans changer le sens. La phrase déclarative donne une information ("La voiture est belle.") et se termine par un point. La phrase interrogative pose une question ("Comment t'appelles-tu ?") ; elle peut se former par intonation simple, pronom interrogatif, "est-ce que", ou inversion du sujet.$$,
        'highlights', array[$$GNS + GV = constituants obligatoires ; complément circonstanciel = facultatif$$, $$déclarative → point . ; interrogative → point d'interrogation ?$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les deux constituants obligatoires de la phrase de base ?$$, 'solution', $$Le groupe nominal sujet (GNS) et le groupe verbal (GV).$$)
      ),
      jsonb_build_object(
        'heading', $$Les types impératif et exclamatif, et les formes affirmative/négative$$,
        'body', $$La phrase impérative donne un ordre, un conseil ou une interdiction ("Portez ces valises."). La phrase exclamative exprime un sentiment ("Comme il est beau cet homme !"). Ces types peuvent se combiner avec une forme : la forme affirmative (absence de négation) ou la forme négative, marquée par des locutions comme "ne...pas", "ne...jamais", "ne...que", "ne...ni...ni". La coordination affirmative utilise "et" ; la coordination négative utilise "ni...ni...ne".$$,
        'highlights', array[$$impérative = ordre/conseil/interdiction ; exclamative = sentiment$$, $$forme affirmative (pas de négation) / forme négative (ne...pas, ne...que, ne...ni...ni)$$]::text[],
        'example', jsonb_build_object('statement', $$Transforme "Tu ne dois pas boire cette eau" en phrase impérative.$$, 'solution', $$"Ne bois pas cette eau !"$$),
        'fixation', jsonb_build_object('question', $$Quelle locution utilise-t-on pour coordonner deux éléments niés ?$$, 'solution', $$"ni...ni...ne" (ou "ne...ni...ni").$$)
      ),
      jsonb_build_object(
        'heading', $$La phrase emphatique et la transformation passive$$,
        'body', $$La phrase emphatique met en relief un élément, par changement d'ordre ("Belle, est cette maison !"), répétition par un pronom ("Ce professeur, je l'aime bien"), ou présentatifs ("C'est... qui/que", "Il y a... qui", "Voici/voilà"). La transformation passive fait passer une phrase active à la voix passive : le sujet actif devient complément d'agent (introduit par "par" ou "de"), le COD devient sujet passif, et on utilise "être" + participe passé accordé avec le sujet. Exemple : "Yao mange la mangue" (actif) → "La mangue est mangée par Yao" (passif).$$,
        'highlights', array[$$emphatique = mise en relief (répétition par pronom, "c'est...qui/que", "voici/voilà")$$, $$passif : sujet actif → complément d'agent (par/de) ; COD actif → sujet passif ; être + participe passé$$]::text[],
        'example', jsonb_build_object('statement', $$Mets à la voix passive : "Le chat a mangé la souris."$$, 'solution', $$"La souris a été mangée par le chat."$$),
        'fixation', jsonb_build_object('question', $$La transformation passive est-elle possible avec n'importe quel verbe ?$$, 'solution', $$Non, seulement si le verbe actif a un COD (verbe transitif direct).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton professeur te soumet quatre phrases et te demande de manipuler leurs types et formes.$$,
      'questions', array[
        $$Distingue les constituants obligatoires et facultatifs de chaque phrase.$$,
        $$Transforme chaque phrase en type interrogatif, exclamatif et impératif.$$,
        $$Associe chaque phrase aux formes négative et emphatique.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$"Chaque matin, les feuilles tombent." — identifie le constituant facultatif.$$,
      'hint', $$C'est un complément qu'on peut supprimer sans changer le sens de base.$$,
      'expected', $$"Chaque matin" (complément circonstanciel de temps).$$
    ),
    jsonb_build_object(
      'question', $$Transforme en phrase interrogative avec inversion du sujet : "Tu viens ce soir."$$,
      'hint', $$Inverse le sujet et le verbe.$$,
      'expected', $$"Viens-tu ce soir ?"$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la forme (affirmative ou négative) de "Il ne mange que des végétaux" ?$$,
      'hint', $$"ne...que" est une locution restrictive, mais reste une négation.$$,
      'expected', $$Forme négative (avec la locution "ne...que").$$
    ),
    jsonb_build_object(
      'question', $$Mets à la voix passive : "On achètera des mangues."$$,
      'hint', $$Le sujet "on" (impersonnel) ne s'exprime pas comme complément d'agent.$$,
      'expected', $$"Des mangues seront achetées."$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-phrase';
