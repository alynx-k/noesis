-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- health-center attendance and the fight against self-medication and
-- endemic/parasitic diseases, in 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Depuis trois jours, le petit frère de Koffi a de la fièvre. Au lieu de l'emmener au centre de santé, leur oncle lui donne des comprimés achetés au marché, « comme la dernière fois ». La fièvre ne baisse pas et l'enfant s'affaiblit. Koffi se demande pourquoi on ne va pas directement voir un soignant.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le rôle des centres de santé$$,
        'body', $$Un centre de santé est une structure où du personnel qualifié examine, diagnostique et soigne les patients, assure la vaccination, le suivi des femmes enceintes, et sensibilise la population à la prévention des maladies.$$,
        'highlights', array[$$centre de santé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Seul un personnel de santé qualifié peut établir un diagnostic fiable, car des symptômes semblables peuvent correspondre à des maladies différentes nécessitant des traitements différents.$$),
        'example', jsonb_build_object('statement', $$Le petit frère de Koffi a de la fièvre depuis trois jours. Pourquoi est-il risqué de deviner soi-même la cause de cette fièvre ?$$, 'solution', $$Parce que la fièvre peut avoir plusieurs causes (paludisme, infection, autre maladie) et seul un examen médical permet d'identifier la bonne cause et le bon traitement.$$)
      ),
      jsonb_build_object(
        'heading', $$Les dangers de l'automédication$$,
        'body', $$L'automédication consiste à se soigner soi-même, souvent avec des médicaments achetés sans ordonnance, sans diagnostic ni conseil d'un professionnel. Elle peut retarder la prise en charge d'une maladie grave, masquer les symptômes, ou provoquer des effets indésirables.$$,
        'highlights', array[$$automédication$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Risque de l'automédication$$, $$Conséquence possible$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Mauvais diagnostic$$, $$Traitement inadapté, maladie qui s'aggrave$$),
            jsonb_build_array($$Mauvais dosage$$, $$Effets secondaires, résistance aux médicaments$$),
            jsonb_build_array($$Retard de consultation$$, $$Maladie découverte trop tard$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite un risque possible lié à l'automédication.$$, 'solution', $$Par exemple : un mauvais diagnostic entraînant un traitement inadapté, ou un retard dans la prise en charge d'une maladie grave.$$)
      ),
      jsonb_build_object(
        'heading', $$Les maladies endémiques et parasitaires$$,
        'body', $$Certaines maladies, comme le paludisme ou des maladies parasitaires liées à l'eau non potable ou à l'hygiène, sont fréquentes en Côte d'Ivoire. Leur prévention passe par l'hygiène, l'usage de moustiquaires, l'accès à l'eau potable, et une consultation rapide en cas de symptômes.$$,
        'highlights', array[$$maladies endémiques$$, $$maladies parasitaires$$]::text[],
        'example', jsonb_build_object('statement', $$Cite deux moyens simples de prévenir le paludisme, une maladie endémique fréquente.$$, 'solution', $$Dormir sous une moustiquaire imprégnée et éliminer les eaux stagnantes autour de l'habitation.$$)
      ),
      jsonb_build_object(
        'heading', $$Adopter le réflexe de consulter un centre de santé$$,
        'body', $$Face à un symptôme inhabituel ou persistant, le bon réflexe est de se rendre rapidement dans un centre de santé plutôt que d'attendre ou de se soigner seul, afin de bénéficier d'un diagnostic fiable et d'un traitement adapté.$$,
        'highlights', array[$$réflexe de consulter$$]::text[],
        'fixation', jsonb_build_object('question', $$Que devrait faire l'oncle de Koffi dès l'apparition de la fièvre de l'enfant ?$$, 'solution', $$L'emmener directement dans un centre de santé pour un diagnostic fiable, au lieu de lui donner des médicaments sans avis médical.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un village, plusieurs habitants préfèrent acheter des médicaments au marché plutôt que de se rendre au centre de santé, jugé trop loin ou trop cher.$$,
      'questions', array[
        $$Explique les risques de cette pratique pour la santé des habitants.$$,
        $$Cite deux maladies endémiques ou parasitaires fréquentes que la fréquentation du centre de santé permettrait de mieux prévenir ou soigner.$$,
        $$Propose un argument pour convaincre ces habitants de privilégier le centre de santé.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que l'automédication et pourquoi est-elle dangereuse ?$$,
      'hint', $$Pense à l'absence de diagnostic professionnel.$$,
      'expected', $$Se soigner soi-même sans avis médical ; elle est dangereuse car elle peut entraîner un mauvais diagnostic, un traitement inadapté ou un retard de prise en charge.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux services que peut offrir un centre de santé, au-delà du traitement d'une maladie.$$,
      'hint', $$Pense à la vaccination et au suivi des femmes enceintes.$$,
      'expected', $$Par exemple : la vaccination et le suivi des femmes enceintes (ou la sensibilisation à la prévention des maladies).$$
    ),
    jsonb_build_object(
      'question', $$Cite une maladie endémique fréquente en Côte d'Ivoire et un moyen de la prévenir.$$,
      'hint', $$Pense au paludisme et à la moustiquaire.$$,
      'expected', $$Le paludisme, qui peut être prévenu en dormant sous une moustiquaire imprégnée et en éliminant les eaux stagnantes.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi est-il conseillé de se rendre rapidement dans un centre de santé dès l'apparition de symptômes persistants ?$$,
      'hint', $$Pense au diagnostic fiable et à la prise en charge rapide.$$,
      'expected', $$Parce qu'un personnel qualifié peut établir un diagnostic fiable et proposer un traitement adapté, évitant ainsi que la maladie ne s'aggrave.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-centres-sante';
