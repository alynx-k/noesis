-- Fallback content (not sourced from ecole-ci.org): the site's EDHC 3ème
-- pages sit behind a site-wide login wall (phone-number/matricule
-- verification, tab "Connexion - Mon Ecole à la maison" with no accessible
-- session) -- confirmed again before writing this batch of 13 files.
-- Written from general knowledge of the standard Ivorian 3ème EDHC
-- programme on parental duties and child development, in 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Aya, 14 ans, vit avec ses parents à Bouaké. Son père travaille loin et rentre rarement ; sa mère tient un petit commerce. Aya se plaint de ne jamais parler de ses soucis à ses parents, même si elle mange à sa faim et va à l'école. Sa classe se demande : nourrir et scolariser un enfant suffit-il à remplir tous les devoirs de parents ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les devoirs d'entretien et de protection$$,
        'body', $$Les parents ont le devoir de subvenir aux besoins matériels de l'enfant : nourriture, logement, vêtements et soins de santé. Ils doivent aussi le protéger contre les dangers physiques, les mauvais traitements, le travail forcé et toute forme d'exploitation.$$,
        'highlights', array[$$devoir d'entretien$$, $$protection$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'entretien matériel est une obligation légale et morale des parents : un enfant privé de nourriture, de soins ou de sécurité voit sa survie et son développement compromis.$$),
        'example', jsonb_build_object('statement', $$Un père envoie son fils de 12 ans vendre des sachets d'eau toute la journée au lieu de l'envoyer à l'école. Quel devoir ne respecte-t-il pas ?$$, 'solution', $$Il manque à son devoir de protection contre l'exploitation par le travail et à son devoir d'instruction, en privant l'enfant de scolarité.$$)
      ),
      jsonb_build_object(
        'heading', $$Les devoirs d'éducation et d'instruction$$,
        'body', $$Éduquer un enfant, c'est lui transmettre des valeurs (respect, honnêteté, sens de l'effort) et veiller à sa scolarisation. L'instruction prépare l'enfant à devenir un citoyen autonome et responsable.$$,
        'highlights', array[$$éducation$$, $$instruction$$, $$valeurs$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type de devoir$$, $$Exemple concret$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Éducation morale$$, $$Apprendre le respect des autres et l'honnêteté$$),
            jsonb_build_array($$Instruction scolaire$$, $$Inscrire l'enfant à l'école et suivre ses résultats$$),
            jsonb_build_array($$Éducation civique$$, $$Expliquer les règles de vie en société$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite deux valeurs que des parents doivent transmettre à leur enfant.$$, 'solution', $$Par exemple : le respect d'autrui et l'honnêteté (d'autres réponses cohérentes comme la persévérance ou la solidarité sont acceptées).$$)
      ),
      jsonb_build_object(
        'heading', $$Les devoirs affectifs et l'écoute$$,
        'body', $$Au-delà du matériel, l'enfant a besoin d'affection, d'écoute et de dialogue pour s'épanouir. Un parent attentif remarque les changements d'humeur de son enfant et prend le temps de discuter avec lui.$$,
        'highlights', array[$$affection$$, $$écoute$$, $$épanouissement$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'épanouissement de l'enfant repose sur trois piliers complémentaires : la satisfaction des besoins matériels, l'instruction, et l'équilibre affectif ; l'absence d'un seul de ces piliers fragilise le développement de l'enfant.$$),
        'example', jsonb_build_object('statement', $$Aya réussit bien à l'école mais se sent seule car ses parents ne lui parlent jamais de ses journées. Quel pilier de son épanouissement est fragilisé ?$$, 'solution', $$Le pilier affectif : ses besoins matériels et son instruction sont assurés, mais l'écoute et le dialogue lui manquent.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences du manquement aux devoirs parentaux$$,
        'body', $$Quand les devoirs de parents ne sont pas respectés, l'enfant peut être déscolarisé, exploité par le travail, mal encadré ou livré à lui-même, ce qui l'expose à la délinquance ou à des unions précoces. La loi ivoirienne protège l'enfant et sanctionne les manquements graves des parents.$$,
        'highlights', array[$$manquement$$, $$loi ivoirienne$$]::text[],
        'fixation', jsonb_build_object('question', $$Donne un exemple de conséquence possible quand un enfant est privé d'instruction.$$, 'solution', $$Par exemple : il risque d'être exploité par un travail précoce, ou de ne pas acquérir les compétences nécessaires pour devenir autonome plus tard.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans le quartier d'Aya, un voisin retire ses deux enfants de l'école pour les envoyer travailler au marché toute la journée, sans jamais leur parler de leurs difficultés.$$,
      'questions', array[
        $$Identifie deux devoirs de parents que ce voisin ne respecte pas.$$,
        $$Explique en quoi son comportement compromet l'épanouissement de ses enfants.$$,
        $$Propose une conduite responsable que ce parent devrait adopter.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite trois devoirs fondamentaux des parents envers leur enfant.$$,
      'hint', $$Pense au matériel, à l'instruction et à l'affectif.$$,
      'expected', $$L'entretien/la protection (nourriture, santé, sécurité), l'éducation/instruction (scolarité, valeurs), et l'affection/l'écoute (dialogue, soutien psychologique).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi dit-on que l'épanouissement de l'enfant repose sur plusieurs piliers et non sur un seul ?$$,
      'hint', $$Un enfant bien nourri mais jamais écouté est-il pleinement épanoui ?$$,
      'expected', $$Parce que le bien-être matériel, l'instruction et l'équilibre affectif sont tous nécessaires ; l'absence d'un seul de ces éléments fragilise le développement global de l'enfant.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple concret de manquement au devoir de protection.$$,
      'hint', $$Pense à l'exploitation par le travail ou à un enfant laissé sans surveillance dans une situation dangereuse.$$,
      'expected', $$Toute réponse cohérente comme faire travailler un enfant au lieu de l'envoyer à l'école, ou le laisser sans surveillance dans une situation risquée.$$
    ),
    jsonb_build_object(
      'question', $$Explique pourquoi l'écoute et le dialogue sont importants dans l'éducation d'un enfant.$$,
      'hint', $$Pense à la confiance, à l'équilibre psychologique et à la prévention des difficultés.$$,
      'expected', $$L'écoute permet à l'enfant de se sentir en confiance, d'exprimer ses difficultés et de construire un équilibre psychologique solide, ce qui prévient l'isolement et les comportements à risque.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-devoirs-parents';
