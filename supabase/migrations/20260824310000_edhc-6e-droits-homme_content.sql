-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 2 : LES DROITS DE L'HOMME ET L'ÉPANOUISSEMENT INDIVIDUEL
-- ET COLLECTIF" (id 1741). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une manifestation d'élèves, suite au renvoi de camarades dont les parents n'avaient pas payé les frais du COGES, a été sévèrement réprimée par la police à la demande du proviseur. Surpris par cette violence, les membres du club des droits de l'homme de la classe décident de s'informer sur les droits de l'homme.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et évolution des droits de l'homme$$,
        'body', $$Les droits de l'homme sont un ensemble de privilèges et de libertés que l'État reconnaît à tout être humain. Leur protection a évolué progressivement : l'Habeas corpus (voté en 1679) protège le citoyen anglais des procès arbitraires ; la Déclaration des Droits de l'Homme et du Citoyen (DDHC, 1789) déclare tous les citoyens français égaux en droit et en liberté ; la Déclaration Universelle des Droits de l'Homme (DUDH, votée par l'ONU en 1948) étend les droits de l'homme à tous les peuples sans discrimination.$$,
        'highlights', array[$$Habeas corpus (1679, Angleterre) → DDHC (1789, France) → DUDH (1948, ONU)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel texte, voté par l'ONU en 1948, étend les droits de l'homme à tous les peuples ?$$, 'solution', $$La Déclaration Universelle des Droits de l'Homme (DUDH).$$)
      ),
      jsonb_build_object(
        'heading', $$Les trois grandes familles de droits$$,
        'body', $$Les droits civils et politiques visent à accorder plus de liberté aux citoyens vis-à-vis de l'État (droit à la liberté et à la sûreté de la personne, droit au respect de la vie privée). Les droits économiques et socio-culturels garantissent le bien-être social, économique et culturel (droit au travail, à l'information, à l'éducation). Les droits de solidarité rendent l'individu plus sociable et conscient de ses responsabilités dans la préservation de la paix et de l'environnement (droit à la paix et à la sécurité, droit au développement).$$,
        'highlights', array[$$civils et politiques : liberté, sûreté, vie privée$$, $$économiques et socio-culturels : travail, information, éducation$$, $$solidarité : paix, sécurité, développement$$]::text[],
        'example', jsonb_build_object('statement', $$Le "droit syndical" et le "droit à la santé" appartiennent à quelles familles de droits ?$$, 'solution', $$Le droit syndical est un droit civil et politique ; le droit à la santé est un droit économique et socio-culturel.$$),
        'fixation', jsonb_build_object('question', $$À quelle famille appartient le "droit au développement" ?$$, 'solution', $$Aux droits de solidarité.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance du respect des droits de l'homme$$,
        'body', $$Pour l'individu, leur respect favorise le bien-être, l'épanouissement et la dignité humaine. Pour les populations, il évite les conflits interreligieux, les frustrations et les tensions sociales. Pour l'État, il favorise la paix sociale, le développement harmonieux et la consolidation de la démocratie — un État qui respecte les droits de l'homme est appelé "État de droit". Pour la communauté internationale, il favorise l'égalité entre les peuples, la solidarité internationale et la paix dans le monde.$$,
        'highlights', array[$$individu : bien-être, dignité ; populations : évite tensions/conflits$$, $$État de droit = État qui respecte les droits de l'homme$$]::text[],
        'example', jsonb_build_object('statement', $$Comment appelle-t-on un État qui respecte les droits de l'homme ?$$, 'solution', $$Un "État de droit".$$),
        'fixation', jsonb_build_object('question', $$Que permet d'éviter le respect des droits de l'homme au niveau des populations ?$$, 'solution', $$Les conflits interreligieux, les frustrations et les tensions sociales.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des élèves de ton établissement décident d'organiser une grève pour protester contre de mauvaises conditions de travail. L'administration veut les rencontrer pour les convaincre de renoncer à la manifestation ; certains sont favorables à la négociation, d'autres préfèrent maintenir la grève.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Énumère trois conséquences du maintien de la grève.$$,
        $$Justifie ton choix en faveur de la négociation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Associe chaque instrument à sa date : DUDH, DDHC, Habeas corpus / 1679, 1789, 1948.$$,
      'hint', $$L'Habeas corpus est le plus ancien, la DUDH le plus récent.$$,
      'expected', $$Habeas corpus = 1679 ; DDHC = 1789 ; DUDH = 1948.$$
    ),
    jsonb_build_object(
      'question', $$Le "droit à la liberté" appartient à quelle famille de droits ?$$,
      'hint', $$Il concerne la relation entre le citoyen et l'État.$$,
      'expected', $$Les droits civils et politiques.$$
    ),
    jsonb_build_object(
      'question', $$Que favorise le respect des droits de l'homme au niveau de l'État ?$$,
      'hint', $$Pense à la paix sociale et à la démocratie.$$,
      'expected', $$La paix sociale, le développement harmonieux, et la consolidation de la démocratie.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la définition des droits de l'homme ?$$,
      'hint', $$C'est un ensemble reconnu par l'État.$$,
      'expected', $$Un ensemble de privilèges et de libertés que l'État reconnaît à tout être humain.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-droits-homme';
