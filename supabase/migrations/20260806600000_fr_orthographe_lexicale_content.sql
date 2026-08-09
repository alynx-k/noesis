-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). No source found (the
-- "Orthographe" category is empty on ecole-ci.org), so this content is
-- original, from the lesson's title/topic and the standard 3ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Ton professeur te rend ta dernière dictée avec plusieurs fautes d'orthographe lexicale soulignées. Il te propose une séance pour revoir les pièges les plus fréquents de l'orthographe des mots.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que l'orthographe lexicale ?$$,
        'body', $$L'orthographe lexicale concerne la façon dont s'écrit un mot en lui-même, indépendamment de sa fonction dans la phrase.$$,
        'highlights', array[$$orthographe lexicale$$, $$orthographe grammaticale$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'orthographe lexicale fixe l'écriture propre à chaque mot (par exemple, « nénuphar » s'écrit avec un « ph »), alors que l'orthographe grammaticale dépend des règles d'accord entre les mots d'une phrase.$$),
        'example', jsonb_build_object('statement', $$« Chocolat » s'écrit-il avec un ou deux « c » ? Que doit-on faire en cas de doute ?$$, 'solution', $$« Chocolat » s'écrit avec un seul « c ». En cas de doute, il faut consulter un dictionnaire, car l'orthographe lexicale ne se déduit pas d'une règle générale.$$),
        'fixation', jsonb_build_object('question', $$Explique la différence entre une faute d'orthographe lexicale et une faute d'orthographe grammaticale.$$, 'solution', $$Une faute lexicale concerne l'écriture d'un mot isolé (par exemple, oublier une lettre), tandis qu'une faute grammaticale concerne un accord incorrect entre des mots (par exemple, un pluriel oublié).$$)
      ),
      jsonb_build_object(
        'heading', $$Les pièges fréquents de l'orthographe lexicale$$,
        'body', $$Certaines lettres muettes, doubles consonnes ou groupes de lettres reviennent souvent et causent des erreurs récurrentes.$$,
        'highlights', array[$$lettres muettes$$, $$doubles consonnes$$, $$homophones$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Piège$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Les lettres muettes finales$$, $$un « tabac », un « climat », un « lit »$$),
            jsonb_build_array($$Les doubles consonnes$$, $$« appartement », « professionnel »$$),
            jsonb_build_array($$Les mots avec « ph »$$, $$« téléphone », « pharmacie »$$),
            jsonb_build_array($$Les homophones lexicaux$$, $$« ver », « verre », « vers », « vert »$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Beaucoup de fautes viennent de lettres muettes en fin de mot, de consonnes doublées, ou de la confusion entre des homophones (mots qui se prononcent pareil mais s'écrivent différemment et n'ont pas le même sens).$$),
        'example', jsonb_build_object('statement', $$Choisis l'orthographe correcte : « Il boit un ver / verre d'eau. »$$, 'solution', $$Il boit un verre d'eau (le récipient), et non un « ver » (l'animal) ni « vers » (la préposition ou le poème).$$),
        'fixation', jsonb_build_object('question', $$Complète avec le bon homophone : « Le poète a écrit un joli ... . » (ver/verre/vers)$$, 'solution', $$Le poète a écrit un joli vers.$$)
      ),
      jsonb_build_object(
        'heading', $$Les familles de mots pour mémoriser l'orthographe$$,
        'body', $$Connaître la famille d'un mot (les mots qui partagent la même racine) aide souvent à en retrouver l'orthographe exacte.$$,
        'highlights', array[$$une famille de mots$$, $$un mot dérivé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les mots d'une même famille partagent souvent la même racine et donc une orthographe proche. Par exemple, « grand » explique le « d » muet de « grandeur » ou « grandir ».$$),
        'example', jsonb_build_object('statement', $$Quel mot de la famille de « temps » permet de justifier son « p » muet ?$$, 'solution', $$« Temporaire » ou « temporel » permettent d'entendre le « p », ce qui justifie l'orthographe de « temps ».$$),
        'fixation', jsonb_build_object('question', $$Quel mot de la famille de « lait » permet de justifier son orthographe ?$$, 'solution', $$« Laitier » ou « laitage » permettent de justifier le « t » final de « lait ».$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton professeur organise une dictée préparée sur le thème du marché, avec plusieurs mots à orthographe piégeuse.$$,
      'questions', array[
        $$Donne l'orthographe correcte de trois mots contenant une lettre muette.$$,
        $$Trouve un homophone lexical et utilise chaque mot dans une phrase différente.$$,
        $$Utilise la famille d'un mot pour justifier son orthographe.$$,
        $$Explique une règle qui t'aide à retenir l'orthographe d'un mot difficile.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Corrige l'erreur si besoin : « Il fait ses devoir tous les soirs. »$$,
      'hint', $$Pense au pluriel de « devoir » dans ce sens.$$,
      'expected', $$Il fait ses devoirs tous les soirs (le mot « devoirs » prend toujours un s au pluriel, même si on ne l'entend pas).$$
    ),
    jsonb_build_object(
      'question', $$Complète avec le bon homophone : « Il pleut des cordes, le ... est mauvais aujourd'hui. » (ten/temps/tant)$$,
      'hint', $$Pense au mot qui désigne la météo.$$,
      'expected', $$Il pleut des cordes, le temps est mauvais aujourd'hui.$$
    ),
    jsonb_build_object(
      'question', $$Quel mot de la famille de « chant » permet de justifier son « t » final ?$$,
      'hint', $$Cherche un mot dérivé où le « t » s'entend.$$,
      'expected', $$« Chanteur » ou « chanter » permettent d'entendre le son qui justifie le « t ».$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le mot « nénuphar » s'écrit-il avec un « ph » et non un « f » ?$$,
      'hint', $$Pense à l'origine du mot et à la nécessité de le mémoriser.$$,
      'expected', $$Parce que c'est l'orthographe lexicale fixée pour ce mot ; elle doit être mémorisée ou vérifiée dans un dictionnaire, car elle ne suit pas de règle générale.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-orthographe-lexicale';
