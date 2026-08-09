-- Rewrite of exercise_questions for fr-lecture-article-journal. No
-- ecole-ci.org source was ever identified for this lesson (see
-- 20260806550000_fr_lecture_article_journal_content.sql). Revisited this
-- session: the site is unreachable without login credentials this session
-- doesn't have (see 20260809500000_fr_dialogue_oral_real_exercises.sql for
-- the detailed finding). These exercises are original, from general
-- knowledge of the standard 3ème programme, grounded in this lesson's
-- content (structure de l'article, QQOQCP, faits et commentaires) and
-- matching the existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$À quoi sert la méthode du QQOQCP lorsqu'on lit un article de journal ?$$,
    'hint', $$Pense à ce qu'elle permet de vérifier dans l'information.$$,
    'expected', $$Elle permet de vérifier que l'article répond bien aux questions essentielles (Qui, Quoi, Où, Quand, Comment, Pourquoi) pour informer complètement le lecteur.$$
  ),
  jsonb_build_object(
    'question', $$Dans la phrase « Vendredi soir, un violent orage a coupé l'électricité dans plusieurs quartiers d'Abidjan », quelle information répond à « Quand ? »$$,
    'hint', $$Cherche l'indication de temps.$$,
    'expected', $$« Vendredi soir » répond à la question « Quand ? ».$$
  ),
  jsonb_build_object(
    'question', $$Cette phrase rapporte-t-elle un fait ou une opinion : « Cette réforme est, selon moi, une véritable avancée », a estimé la directrice de l'école.$$,
    'hint', $$Repère qui exprime un jugement personnel et comment cela est signalé.$$,
    'expected', $$C'est une opinion, exprimée par la directrice et rapportée entre guillemets par le journaliste.$$
  ),
  jsonb_build_object(
    'question', $$Pourquoi le corps d'un article présente-t-il généralement les informations du plus important au moins important ?$$,
    'hint', $$Pense à un lecteur qui n'a pas le temps de tout lire.$$,
    'expected', $$Pour qu'un lecteur pressé comprenne l'essentiel dès les premières lignes, même s'il ne lit pas l'article jusqu'au bout.$$
  )
)
where id = 'fr-lecture-article-journal';
