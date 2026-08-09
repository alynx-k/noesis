-- Rewrite of exercise_questions for fr-orthographe-lexicale. No
-- ecole-ci.org source was ever identified for this lesson (the
-- "Orthographe" category is empty -- see
-- 20260806600000_fr_orthographe_lexicale_content.sql). Revisited this
-- session: the site is unreachable without login credentials this session
-- doesn't have (see 20260809500000_fr_dialogue_oral_real_exercises.sql for
-- the detailed finding). These exercises are original, from general
-- knowledge of the standard 3ème programme, grounded in this lesson's
-- content (lettres muettes, doubles consonnes, homophones lexicaux,
-- familles de mots) and matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Corrige l'erreur si besoin : « Il range toujours ses affaire dans le même tiroir. »$$,
    'hint', $$Pense au pluriel du mot « affaires » dans ce sens.$$,
    'expected', $$Il range toujours ses affaires dans le même tiroir (le mot « affaires », dans ce sens, prend toujours un s).$$
  ),
  jsonb_build_object(
    'question', $$Complète avec le bon homophone : « Il a rangé le vélo contre le mur, ... la maison. » (prêt/près)$$,
    'hint', $$Pense au mot qui indique la proximité dans l'espace.$$,
    'expected', $$Il a rangé le vélo contre le mur, près de la maison.$$
  ),
  jsonb_build_object(
    'question', $$Quel mot de la famille de « sang » permet de justifier son « g » final ?$$,
    'hint', $$Cherche un mot dérivé où le son se fait entendre.$$,
    'expected', $$« Sanglant » ou « sanguin » permettent d'entendre le son qui justifie le « g » de « sang ».$$
  ),
  jsonb_build_object(
    'question', $$Pourquoi le mot « rythme » s'écrit-il avec un « y » et un « th », et non simplement « ritme » ?$$,
    'hint', $$Pense à l'origine du mot et à la nécessité de mémoriser son orthographe.$$,
    'expected', $$Parce que c'est l'orthographe lexicale fixée pour ce mot, héritée du grec ; elle doit être mémorisée ou vérifiée dans un dictionnaire, car elle ne suit pas de règle générale.$$
  )
)
where id = 'fr-orthographe-lexicale';
