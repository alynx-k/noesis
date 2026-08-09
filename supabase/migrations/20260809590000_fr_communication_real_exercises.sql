-- Rewrite of exercise_questions for fr-communication. A matching
-- ecole-ci.org source was identified last session ("LA COMMUNICATION S10",
-- categoryid=10) but could not be fetched then because the Claude-in-Chrome
-- extension disconnected mid-session (see
-- 20260806620000_fr_communication_content.sql). Revisited this session:
-- still unreachable, but for a different reason -- course pages 404 without
-- authentication, and all four login flows (élève/enseignant/parent/
-- visiteur) require credentials (matricule élève, téléphone) unavailable in
-- this session, with no anonymous browsing path (see
-- 20260809500000_fr_dialogue_oral_real_exercises.sql for the detailed
-- finding). These exercises remain original, from general knowledge of the
-- standard 3ème programme, grounded in this lesson's content (schéma de la
-- communication, obstacles, fonctions du langage) and matching the existing
-- difficulty/structure.
update public.courses
set exercise_questions = jsonb_build_array(
  jsonb_build_object(
    'question', $$Dans un appel téléphonique entre Yao et sa grand-mère, identifie l'émetteur et le récepteur au moment où Yao parle.$$,
    'hint', $$Repère qui parle et qui écoute à cet instant précis.$$,
    'expected', $$Yao est l'émetteur, car c'est lui qui parle à ce moment ; sa grand-mère est le récepteur, car c'est elle qui reçoit le message.$$
  ),
  jsonb_build_object(
    'question', $$Quel est le canal utilisé lorsqu'on envoie un message écrit sur une messagerie instantanée ?$$,
    'hint', $$Pense au support par lequel passe le message.$$,
    'expected', $$Le canal est le texte écrit transmis par l'application de messagerie.$$
  ),
  jsonb_build_object(
    'question', $$Quelle fonction du langage domine dans cette phrase : « Range tes affaires immédiatement ! »$$,
    'hint', $$Pense à ce que l'émetteur cherche à obtenir du récepteur.$$,
    'expected', $$C'est la fonction conative, car l'émetteur cherche à provoquer une action chez le récepteur.$$
  ),
  jsonb_build_object(
    'question', $$Donne un exemple d'obstacle à la communication qui n'est ni un bruit sonore ni un problème de langue.$$,
    'hint', $$Pense à un problème matériel, par exemple avec le canal utilisé.$$,
    'expected', $$Une coupure de réseau internet pendant un appel vidéo, qui empêche le message d'arriver correctement au récepteur.$$
  )
)
where id = 'fr-communication';
