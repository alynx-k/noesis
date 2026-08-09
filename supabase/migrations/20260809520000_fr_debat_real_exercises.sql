-- Rewrite of exercise_questions for fr-debat. No ecole-ci.org source was
-- ever identified for this lesson (see 20260806520000_fr_debat_content.sql).
-- Revisited this session: the site remains unreachable without login
-- credentials this session doesn't have (see
-- 20260809500000_fr_dialogue_oral_real_exercises.sql for the detailed
-- finding). These exercises are original, from general knowledge of the
-- standard 3ème programme, grounded in this lesson's content (règles du
-- débat, construction d'un argument, réponse à un argument adverse) and
-- matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Construis un argument complet (opinion + justification) sur le tri des déchets à l'école.$$,
    'hint', $$Affirme une opinion, puis justifie-la avec « car ».$$,
    'expected', $$Je pense que le tri des déchets devrait être obligatoire à l'école, car il permet de réduire la pollution et de sensibiliser les élèves à l'environnement.$$
  ),
  jsonb_build_object(
    'question', $$Ajoute un exemple à cet argument : « Boire suffisamment d'eau est essentiel pour la concentration en classe. »$$,
    'hint', $$Utilise « par exemple » pour illustrer concrètement.$$,
    'expected', $$Boire suffisamment d'eau est essentiel pour la concentration en classe. Par exemple, un élève déshydraté a souvent plus de mal à rester attentif pendant un contrôle.$$
  ),
  jsonb_build_object(
    'question', $$Réponds avec une concession puis une nuance à cet argument : « Le port de l'uniforme scolaire supprime toute liberté d'expression. »$$,
    'hint', $$Commence par « Je comprends que... mais... ».$$,
    'expected', $$Je comprends que cela puisse limiter certains choix, mais l'uniforme évite aussi les comparaisons entre élèves selon leurs vêtements.$$
  ),
  jsonb_build_object(
    'question', $$Pourquoi un débat a-t-il besoin d'un modérateur qui distribue la parole ?$$,
    'hint', $$Pense à ce qui se passerait si tout le monde parlait en même temps.$$,
    'expected', $$Sans modérateur, les participants les plus à l'aise monopoliseraient la parole et l'échange perdrait en clarté et en équité.$$
  )
)
where id = 'fr-debat';
