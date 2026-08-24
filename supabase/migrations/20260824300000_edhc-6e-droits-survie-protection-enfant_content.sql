-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 1 : LES DROITS À LA SURVIE ET A LA PROTECTION DE
-- L'ENFANT ET SON ÉPANOUISSEMENT" (id 1749). Contenu réécrit à partir du
-- PDF source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève de 6ème est constamment en retard au cours. Il confie à ses camarades que cela est dû aux travaux domestiques qu'il doit faire chaque jour pour sa tutrice, pendant que son cousin de la même classe n'exécute aucune tâche. Révoltés, ses camarades décident de s'informer sur les droits à la survie et à la protection de l'enfant.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition de l'enfant et de ses droits$$,
        'body', $$Un enfant est un être humain âgé de moins de 18 ans, sauf si la majorité est atteinte plus tôt selon la législation applicable. Les droits de l'enfant sont un ensemble de droits humains spécifiquement adaptés à l'enfant, pour tenir compte de sa fragilité, de son immaturité psychologique et de ses besoins propres.$$,
        'highlights', array[$$enfant = être humain de moins de 18 ans$$, $$droits de l'enfant = droits adaptés à sa fragilité et ses besoins propres$$]::text[],
        'fixation', jsonb_build_object('question', $$À partir de quel âge n'est-on plus considéré comme un enfant, en général ?$$, 'solution', $$18 ans (sauf majorité atteinte plus tôt selon la loi applicable).$$)
      ),
      jsonb_build_object(
        'heading', $$Les droits à la survie et à la protection$$,
        'body', $$Le droit à la survie garantit à l'enfant l'accès aux services de base et aux conditions de vie minimales : droit à l'alimentation, à la santé, au logement, à la nationalité. Le droit à la protection protège l'enfant contre un danger, un mal ou un risque : droit à la sécurité, à être protégé de la violence et de l'exploitation, et droit à une protection spéciale pour les enfants réfugiés ou handicapés.$$,
        'highlights', array[$$survie : alimentation, santé, logement, nationalité (accès aux besoins de base)$$, $$protection : sécurité, contre violence/exploitation, protection spéciale (réfugiés, handicapés)$$]::text[],
        'example', jsonb_build_object('statement', $$"La création de nombreux centres de santé" : est-ce un exemple de droit à la survie ou à la protection ?$$, 'solution', $$Un droit à la survie (accès aux services de santé de base).$$),
        'fixation', jsonb_build_object('question', $$"La lutte contre le recrutement d'enfants-soldats" relève de quel type de droit ?$$, 'solution', $$Le droit à la protection.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance du respect de ces droits$$,
        'body', $$Au niveau individuel, le respect des droits favorise l'épanouissement et le bien-être de l'enfant. Au niveau de la famille et de la communauté, il préserve la cohésion familiale et communautaire. Au niveau de l'État, il permet de réduire les charges publiques et de préserver un climat de paix. L'enfant, être vulnérable et fragile, bénéficie de protections particulières inscrites dans la Convention Internationale des Droits de l'Enfant du 9 novembre 1989 et dans la Constitution ivoirienne.$$,
        'highlights', array[$$individuel → épanouissement ; famille/communauté → cohésion ; État → réduction des charges, paix$$, $$Convention Internationale des Droits de l'Enfant (9 novembre 1989)$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi le respect des droits de l'enfant profite-t-il aussi à l'État ?$$, 'solution', $$Parce qu'il réduit les charges de l'État (moins d'enfants en difficulté à prendre en charge) et préserve un climat de paix.$$),
        'fixation', jsonb_build_object('question', $$Quel texte international protège spécifiquement les droits de l'enfant, et depuis quelle date ?$$, 'solution', $$La Convention Internationale des Droits de l'Enfant, depuis le 9 novembre 1989.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève de ta classe te confie que sa tante, chez qui il vit, l'oblige à faire seul toutes les corvées de la maison, ce qui l'empêche d'étudier et d'arriver à l'heure à l'école. Il te demande de l'aide.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Énumère deux droits à la survie de l'enfant.$$,
        $$Justifie ta décision de l'aider.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$"Être contraint de dormir à même le sol" est-il un cas de violation des droits de l'enfant ?$$,
      'hint', $$Pense au droit au logement décent.$$,
      'expected', $$Oui, c'est une violation du droit à la survie (conditions de vie minimales).$$
    ),
    jsonb_build_object(
      'question', $$"Avoir une nationalité" relève-t-il du droit à la survie ou à la protection ?$$,
      'hint', $$C'est un des exemples cités pour la survie.$$,
      'expected', $$Du droit à la survie.$$
    ),
    jsonb_build_object(
      'question', $$Cite un droit à la protection de l'enfant.$$,
      'hint', $$Pense à ce qui le protège d'un danger.$$,
      'expected', $$Par exemple : le droit à la sécurité, ou le droit d'être protégé de la violence et de l'exploitation.$$
    ),
    jsonb_build_object(
      'question', $$Le respect des droits de l'enfant favorise-t-il ou nuit-il à la cohésion familiale ?$$,
      'hint', $$Relis la partie sur l'importance au niveau de la famille.$$,
      'expected', $$Il favorise la cohésion familiale et communautaire.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-droits-survie-protection-enfant';
