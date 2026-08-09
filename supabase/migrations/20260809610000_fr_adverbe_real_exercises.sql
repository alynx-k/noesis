-- Rewrite of exercise_questions for fr-adverbe. Matching ecole-ci.org
-- sources were identified last session (ids 2228-2230, categoryid=77) but
-- could not be fetched then because the Claude-in-Chrome extension
-- disconnected mid-session (see 20260806630000_fr_adverbe_content.sql).
-- Revisited this session: still unreachable, but for a different reason --
-- course pages 404 without authentication, and all four login flows
-- require credentials unavailable in this session, with no anonymous
-- browsing path (see 20260809500000_fr_dialogue_oral_real_exercises.sql for
-- the detailed finding). These exercises remain original, from general
-- knowledge of the standard 3ème programme, grounded in this lesson's
-- content (formation en -ment, groupe adverbial, invariabilité) and
-- matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Forme l'adverbe correspondant à l'adjectif « joyeux ».$$,
    'hint', $$Passe d'abord l'adjectif au féminin.$$,
    'expected', $$Joyeuse (féminin) + ment = joyeusement.$$
  ),
  jsonb_build_object(
    'question', $$Forme l'adverbe correspondant à l'adjectif « bruyant ».$$,
    'hint', $$Cet adjectif se termine en -ant.$$,
    'expected', $$Bruyamment (adjectif en -ant → -amment).$$
  ),
  jsonb_build_object(
    'question', $$Identifie le groupe adverbial dans : « Il conduit bien trop vite sur cette route. »$$,
    'hint', $$Cherche l'adverbe et les mots qui le renforcent.$$,
    'expected', $$« Bien trop vite » est le groupe adverbial : il modifie le verbe « conduit ».$$
  ),
  jsonb_build_object(
    'question', $$Pourquoi ne peut-on pas écrire « rapidements » au pluriel, même dans une phrase avec plusieurs sujets ?$$,
    'hint', $$Pense à la nature invariable de cette classe de mots.$$,
    'expected', $$Parce qu'un adverbe est invariable : il ne s'accorde jamais, ni en genre ni en nombre, quel que soit le sujet de la phrase.$$
  )
)
where id = 'fr-adverbe';
