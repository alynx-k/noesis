-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Grammaire (categoryid=61).
-- Cours combinés : "6e_Gr_L4-S1_Morph_verbes_1er_gpe" (id 2205),
-- "S2_présent_indic_valeurs_emplois" (id 2206),
-- "S3_futur_simple_valeurs_emplois" (id 2207), "S4_imparfait_passé
-- composé" (id 2208), et le contenu sur les auxiliaires d'aspect issu de
-- la séance 6 de cette même leçon. Contenu réécrit à partir des PDF
-- sources ; définitions et exemples reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours de leurs lectures, des élèves de 6ème découvrent un récit émouvant et veulent s'inspirer du style de l'auteur pour rédiger leurs propres textes. Ils décident d'étudier le verbe : sa morphologie, ses temps et leurs valeurs d'emploi.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Morphologie des verbes du 1er et du 2ème groupe$$,
        'body', $$Le verbe, noyau du groupe verbal, se compose d'un radical (porte le sens) et d'une désinence (indique mode, temps, personne). Les verbes du 1er groupe se terminent à l'infinitif par "-er" (participe présent en "-ant") et gardent leur radical dans presque tous les cas : "aimer" → j'aime, nous aimons. Les verbes du 2ème groupe se terminent par "-ir" (participe présent en "-issant") : "grandir" → je grandis, nous grandissons, ils grandissent.$$,
        'highlights', array[$$1er groupe : infinitif en -er, participe présent en -ant$$, $$2ème groupe : infinitif en -ir, participe présent en -issant (nous ...issons)$$]::text[],
        'fixation', jsonb_build_object('question', $$À quel groupe appartient "réussir", et comment le sais-tu ?$$, 'solution', $$Au 2ème groupe : son infinitif est en "-ir" et il fait "nous réussissons" (avec -iss-).$$)
      ),
      jsonb_build_object(
        'heading', $$Le présent et le futur simple de l'indicatif$$,
        'body', $$Le présent exprime une action au moment où l'on parle, mais aussi : une vérité générale ("La terre tourne autour du soleil"), une action habituelle ("Chaque jeudi, je me repose"), un futur proche ("Demain, je vais à Paris"), ou un présent de narration pour rendre un récit passé plus vivant. Le futur simple (radical/infinitif + ai, as, a, ons, ez, ont) exprime une action à venir, mais peut aussi avoir la valeur d'un impératif ("Vous achèverez cet exercice") ou dépendre d'une condition ("En cas d'échec, il reprendra son année").$$,
        'highlights', array[$$présent : vérité générale, habitude, futur proche, narration$$, $$futur simple = infinitif + ai/as/a/ons/ez/ont ; peut valoir un impératif$$]::text[],
        'example', jsonb_build_object('statement', $$"Houphouët meurt en 1993" : quelle valeur du présent est ici employée ?$$, 'solution', $$Le présent de narration (présent historique), pour rendre un fait passé plus vivant.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la valeur du présent dans "Les hommes sont mortels" ?$$, 'solution', $$Le présent de vérité générale.$$)
      ),
      jsonb_build_object(
        'heading', $$Le couple imparfait / passé composé, et les auxiliaires d'aspect$$,
        'body', $$Dans un récit, le passé composé (avoir/être au présent + participe passé) exprime le premier plan (les actions importantes, achevées), tandis que l'imparfait (radical + ais/ais/ait/ions/iez/aient) exprime le second plan (description, état, habitude). Le passé composé remplace souvent le passé simple dans le récit moderne. Les auxiliaires d'aspect (aller, venir de, être en train de, commencer à, être sur le point de) forment des périphrases verbales qui précisent le déroulement d'une action : futur proche ("je vais venir"), passé proche ("je viens d'arriver"), action en cours ("je suis en train de manger"), début d'action ("il commence à pleuvoir").$$,
        'highlights', array[$$passé composé = premier plan (actions) ; imparfait = second plan (description, état)$$, $$auxiliaires d'aspect : aller (futur proche), venir de (passé proche), être en train de (en cours)$$]::text[],
        'example', jsonb_build_object('statement', $$Réécris avec les bons temps : "Mme Robert, la patronne (arriver). Elle (s'occuper) de l'usine."$$, 'solution', $$"Mme Robert, la patronne est arrivée. Elle s'occupait de l'usine." (action achevée au passé composé, état habituel à l'imparfait)$$),
        'fixation', jsonb_build_object('question', $$Quel auxiliaire d'aspect exprime une action tout juste terminée ?$$, 'solution', $$"Venir de" (le passé proche) — ex : "je viens de prendre mon café."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Inspiré(e) par un récit émouvant lu en classe, tu écris un court paragraphe racontant un souvenir personnel, en veillant à bien choisir tes temps verbaux.$$,
      'questions', array[
        $$Conjugue au présent de l'indicatif deux verbes du 1er groupe et un verbe du 2ème groupe utiles à ton récit.$$,
        $$Rédige deux phrases : une au passé composé pour une action importante, une à l'imparfait pour une description.$$,
        $$Utilise un auxiliaire d'aspect (aller, venir de, être en train de) dans une phrase de ton récit.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Conjugue le verbe "chérir" (2ème groupe) à la 3ème personne du singulier du présent de l'indicatif.$$,
      'hint', $$Les verbes du 2ème groupe prennent "-it" à cette personne.$$,
      'expected', $$"Il/elle chérit."$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la valeur du présent dans "Demain, je prends l'avion à 12h30" ?$$,
      'hint', $$L'action se situe dans un futur proche malgré le présent.$$,
      'expected', $$Le présent du futur proche.$$
    ),
    jsonb_build_object(
      'question', $$Mets "bâtir" au futur simple à la 1ère personne du pluriel.$$,
      'hint', $$Radical + -ons.$$,
      'expected', $$"Nous bâtirons."$$
    ),
    jsonb_build_object(
      'question', $$Dans "il régnait depuis 50 ans", pourquoi utilise-t-on l'imparfait plutôt que le passé composé ?$$,
      'hint', $$C'est une situation qui dure, pas une action ponctuelle achevée.$$,
      'expected', $$Parce que c'est une action habituelle/durative (second plan), pas une action ponctuelle achevée.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-verbe';
