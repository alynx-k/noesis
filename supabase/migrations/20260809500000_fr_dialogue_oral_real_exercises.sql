-- Rewrite of exercise_questions for fr-dialogue-oral. No ecole-ci.org source
-- was ever identified for this lesson (see 20260806500000_fr_dialogue_oral_content.sql).
-- Revisited this session: ecole-ci.org's course pages return 404 without
-- authentication, and all four login flows (élève/enseignant/parent/
-- visiteur) require credentials (matricule élève, téléphone) unavailable in
-- this session, with no anonymous browsing path -- so the site is treated
-- as unreachable here too. These exercises are therefore original, written
-- from general knowledge of the standard 3ème programme, grounded in this
-- lesson's own content (registres de langue, marques d'oralité, politesse
-- et relance) and matching the same difficulty/structure as before.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Quel registre de langue reconnais-tu dans : « Eh, tu me passes ton stylo, steuplaît ? »$$,
    'hint', $$Observe le tutoiement et le vocabulaire relâché.$$,
    'expected', $$C'est le registre familier : le tutoiement spontané et la déformation « steuplaît » sont typiques d'un échange entre proches.$$
  ),
  jsonb_build_object(
    'question', $$Transpose cette phrase courante en registre soutenu : « Tu peux fermer la fenêtre ? »$$,
    'hint', $$Passe au vouvoiement et à une formule plus polie.$$,
    'expected', $$« Pourriez-vous fermer la fenêtre, s'il vous plaît ? »$$
  ),
  jsonb_build_object(
    'question', $$Adoucis cet ordre un peu sec avec une formule de politesse : « Donne-moi ça. »$$,
    'hint', $$Ajoute une expression polie sans changer le sens de la demande.$$,
    'expected', $$« Donne-moi ça, s'il te plaît. »$$
  ),
  jsonb_build_object(
    'question', $$Complète cette réplique avec une relance qui montre de l'intérêt : « J'ai raté mon bus ce matin. — ... »$$,
    'hint', $$Pose une question pour faire rebondir la conversation.$$,
    'expected', $$« J'ai raté mon bus ce matin. — Ah zut, et comment as-tu fait pour venir alors ? »$$
  )
)
where id = 'fr-dialogue-oral';
