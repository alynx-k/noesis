-- Rewrite of exercise_questions for fr-ecriture-article-journal. No
-- ecole-ci.org source was ever identified for this lesson (see
-- 20260806580000_fr_ecriture_article_journal_content.sql). Revisited this
-- session: the site is unreachable without login credentials this session
-- doesn't have (see 20260809500000_fr_dialogue_oral_real_exercises.sql for
-- the detailed finding). These exercises are original, from general
-- knowledge of the standard 3ème programme, grounded in this lesson's
-- content (titre, chapeau et QQOQCP, corps de l'article) and matching the
-- existing difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Propose un titre pour un article sur la victoire du collège à un concours de mathématiques.$$,
    'hint', $$Reste court et informatif.$$,
    'expected', $$« Le collège remporte le concours régional de mathématiques »$$
  ),
  jsonb_build_object(
    'question', $$Rédige un chapeau répondant à Qui, Quoi, Où pour cet événement : une collecte de vivres organisée par les élèves de troisième dans la cour du collège.$$,
    'hint', $$Réponds aux trois questions en une seule phrase.$$,
    'expected', $$« Les élèves de troisième ont organisé une collecte de vivres dans la cour du collège. »$$
  ),
  jsonb_build_object(
    'question', $$Pourquoi doit-on éviter d'exagérer les faits dans le titre d'un article, même pour attirer l'attention du lecteur ?$$,
    'hint', $$Pense à la confiance du lecteur envers le journal.$$,
    'expected', $$Parce qu'un titre exagéré ou trompeur donnerait une fausse idée de l'information et nuirait à la crédibilité de l'article et du journal.$$
  ),
  jsonb_build_object(
    'question', $$Un article commence par les détails secondaires avant l'information principale. Que faudrait-il corriger ?$$,
    'hint', $$Pense à l'ordre habituel des informations dans le corps de l'article.$$,
    'expected', $$Il faudrait réorganiser l'article pour présenter d'abord l'information la plus importante, puis les détails secondaires ensuite.$$
  )
)
where id = 'fr-ecriture-article-journal';
