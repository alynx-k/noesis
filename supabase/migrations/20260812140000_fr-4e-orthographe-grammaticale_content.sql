-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806610000_fr_orthographe_grammaticale_content.sql).
-- ecole-ci.org is reachable now (see 20260812000000_fr-4e-debat_content.sql)
-- — opened Français 4ème > Orthographe > "Leçon 1: S1 Orthographe
-- grammaticale_l'accord du verbe avec le sujet dont le déterminant est
-- « beaucoup, assez, peu »" (course id 692): "Activités : 0", no
-- résumé/exercise uploaded. Falling back to original content. This 4ème
-- lesson goes beyond the 3ème orthographe grammaticale lesson (accord
-- sujet-verbe, adjectif, participe passé avec être/avoir): it covers the
-- accord of pronominal verbs' past participles, and the tricky words
-- "tout" and "même", from the standard Ivorian 4ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En te relisant, tu hésites entre « elles se sont lavées » et « elles se sont lavé les mains ». Ton professeur propose une séance sur des accords plus délicats de l'orthographe grammaticale.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'accord du participe passé des verbes pronominaux$$,
        'body', $$Le participe passé d'un verbe pronominal s'accorde le plus souvent avec le sujet, sauf si le verbe a un COD placé après lui.$$,
        'highlights', array[$$un verbe pronominal$$, $$le COD$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le participe passé d'un verbe pronominal s'accorde avec le sujet, sauf s'il y a un complément d'objet direct placé après le verbe : dans ce cas, le participe reste invariable (elles se sont lavées, mais elles se sont lavé les mains).$$),
        'example', jsonb_build_object('statement', $$Accorde le participe passé : « Les enfants se sont (amuser) au bord du fleuve. »$$, 'solution', $$Les enfants se sont amusés au bord du fleuve (accord avec le sujet « les enfants », pas de COD après le verbe).$$),
        'fixation', jsonb_build_object('question', $$Accorde le participe passé : « Elle s'est (couper) le doigt en cuisinant. »$$, 'solution', $$Elle s'est coupé le doigt en cuisinant (pas d'accord, car « le doigt » est COD placé après le verbe).$$)
      ),
      jsonb_build_object(
        'heading', $$L'accord de « tout »$$,
        'body', $$« Tout » peut être adjectif (il s'accorde), pronom (il s'accorde), ou adverbe (il reste souvent invariable) selon sa fonction dans la phrase.$$,
        'highlights', array[$$tout adjectif$$, $$tout pronom$$, $$tout adverbe$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nature de « tout »$$, $$Règle$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Adjectif (devant un nom)$$, $$s'accorde en genre et en nombre$$, $$toute la classe, tous les élèves$$),
            jsonb_build_array($$Pronom (remplace un nom)$$, $$s'accorde avec ce qu'il représente$$, $$Elles sont toutes venues.$$),
            jsonb_build_array($$Adverbe (devant un adjectif)$$, $$invariable, sauf devant un adjectif féminin commençant par une consonne$$, $$Elle est tout étonnée. / Elle est toute contente.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$« Tout » adverbe reste invariable devant un adjectif masculin ou un adjectif féminin commençant par une voyelle, mais s'accorde exceptionnellement devant un adjectif féminin commençant par une consonne, pour des raisons de prononciation.$$),
        'example', jsonb_build_object('statement', $$Accorde « tout » : « Elle semblait (tout) surprise par la nouvelle. »$$, 'solution', $$Elle semblait tout surprise par la nouvelle (« tout » reste invariable devant l'adjectif féminin « surprise », qui commence par une voyelle).$$),
        'fixation', jsonb_build_object('question', $$Accorde « tout » : « Elles étaient (tout) contentes du résultat. »$$, 'solution', $$Elles étaient toutes contentes du résultat (« tout » s'accorde devant l'adjectif féminin « contentes », qui commence par une consonne).$$)
      ),
      jsonb_build_object(
        'heading', $$L'accord de « même »$$,
        'body', $$« Même » varie selon qu'il est adjectif (il s'accorde) ou adverbe signifiant « aussi, y compris » (il reste invariable).$$,
        'highlights', array[$$même adjectif$$, $$même adverbe$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$« Même » adjectif (placé après un nom ou pronom, signifiant « identique » ou renforçant) s'accorde en nombre ; « même » adverbe (signifiant « y compris », placé devant un nom, un verbe ou un groupe) reste invariable.$$),
        'example', jsonb_build_object('statement', $$Accorde « même » si nécessaire : « Les enfants (même) les plus jeunes ont participé. »$$, 'solution', $$Les enfants, même les plus jeunes, ont participé (« même » est ici adverbe, signifiant « y compris », donc invariable).$$),
        'fixation', jsonb_build_object('question', $$Accorde « même » si nécessaire : « Ils ont réussi les épreuves, (même) les plus difficiles. »$$, 'solution', $$Ils ont réussi les épreuves, même les plus difficiles (« même » signifie ici « y compris » : c'est un adverbe, donc invariable).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu prépares une dictée d'entraînement autour de la course scolaire, contenant plusieurs verbes pronominaux et les mots « tout » et « même ».$$,
      'questions', array[
        $$Accorde correctement le participe passé d'un verbe pronominal avec COD après le verbe.$$,
        $$Accorde correctement le participe passé d'un verbe pronominal sans COD après le verbe.$$,
        $$Utilise « tout » comme adverbe devant un adjectif féminin commençant par une consonne.$$,
        $$Explique la différence entre « même » adjectif et « même » adverbe.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Accorde le participe passé : « Les athlètes se sont (préparer) avant la course. »$$,
      'hint', $$Pas de COD après le verbe : accord avec le sujet.$$,
      'expected', $$Les athlètes se sont préparés avant la course.$$
    ),
    jsonb_build_object(
      'question', $$Accorde le participe passé : « Elle s'est (fouler) la cheville pendant la course. »$$,
      'hint', $$« la cheville » est COD placé après le verbe.$$,
      'expected', $$Elle s'est foulé la cheville pendant la course (pas d'accord, COD après le verbe).$$
    ),
    jsonb_build_object(
      'question', $$Accorde « tout » : « Elle paraissait (tout) essoufflée après l'arrivée. »$$,
      'hint', $$« essoufflée » commence par une voyelle.$$,
      'expected', $$Elle paraissait tout essoufflée après l'arrivée (invariable devant un adjectif féminin commençant par une voyelle).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi « tout » s'accorde-t-il dans « Elles semblaient toutes contentes » mais reste invariable dans « Elles semblaient tout heureuses » ?$$,
      'hint', $$Regarde la première lettre de l'adjectif qui suit.$$,
      'expected', $$« Tout » s'accorde (« toutes ») devant l'adjectif féminin « contentes », qui commence par une consonne, mais reste invariable (« tout ») devant l'adjectif féminin « heureuses », qui commence par une voyelle.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-orthographe-grammaticale';
