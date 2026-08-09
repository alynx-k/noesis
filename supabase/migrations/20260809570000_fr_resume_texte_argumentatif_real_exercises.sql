-- Rewrite of exercise_questions for fr-resume-texte-argumentatif. The
-- ecole-ci.org page previously found (id 2344, "Expression Écrite") had 0
-- activities (see 20260806570000_fr_resume_texte_argumentatif_content.sql).
-- Revisited this session: the site is unreachable without login credentials
-- this session doesn't have (see
-- 20260809500000_fr_dialogue_oral_real_exercises.sql for the detailed
-- finding), so even that empty page could not be re-checked. These
-- exercises are original, from general knowledge of the standard 3ème
-- programme, grounded in this lesson's content (règles du résumé, repérage
-- de l'essentiel, reformulation) and matching the existing
-- difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$À combien de mots doit-on réduire un texte de 320 mots si l'on demande un résumé au quart ?$$,
    'hint', $$Divise le nombre de mots par quatre.$$,
    'expected', $$Environ 80 mots.$$
  ),
  jsonb_build_object(
    'question', $$Un texte source cite trois experts différents qui disent tous la même chose. Combien de ces citations faut-il garder dans un résumé, et pourquoi ?$$,
    'hint', $$Pense au rôle des citations répétitives par rapport à l'idée qu'elles illustrent.$$,
    'expected', $$Aucune en particulier n'est indispensable : il suffit de résumer l'idée commune à ces citations, sans reprendre les exemples ni les citations elles-mêmes.$$
  ),
  jsonb_build_object(
    'question', $$Reformule plus brièvement : « Il est important de noter que la pratique régulière d'une activité sportive contribue de manière significative à l'amélioration du bien-être général. »$$,
    'hint', $$Retire les tournures inutiles et va à l'essentiel.$$,
    'expected', $$Le sport régulier améliore le bien-être.$$
  ),
  jsonb_build_object(
    'question', $$Pourquoi un résumé ne doit-il jamais contenir l'avis personnel de celui qui résume ?$$,
    'hint', $$Pense à la différence entre résumer et commenter.$$,
    'expected', $$Parce que le résumé doit rester fidèle et objectif : il rapporte la pensée de l'auteur du texte, pas celle du lecteur qui résume.$$
  )
)
where id = 'fr-resume-texte-argumentatif';
