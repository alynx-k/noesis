-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 1855: "EE 10: Prdtion-écrite_Rédiger_paragr_argument"
-- (https://lyc.ecole-ci.org/course/view.php?id=1855), resource id 15722 —
-- "Séance 9 : rédiger un paragraphe argumentatif" (production écrite).
-- Contenu méthodologique réécrit à partir du PDF source (composantes du
-- paragraphe argumentatif : argument/explication/exemple ; règle des au
-- moins trois paragraphes ; conclusion partielle avec bilan + annonce du
-- paragraphe suivant). Le sujet d'exemple du PDF (football) est remplacé
-- par le même sujet original sur la téléphonie mobile utilisé dans la
-- leçon précédente, pour rester 100% original tout en gardant la
-- continuité pédagogique.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-production-ecrite-rediger-paragraphe',
  '1ere',
  'A',
  'francais',
  $$La production écrite : rédiger un paragraphe argumentatif$$,
  10,
  '1ere-a-fr-production-ecrite-analyser-rechercher',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir trouvé et organisé leurs idées, les élèves de 1ère A doivent transformer chaque idée en un paragraphe rédigé pour construire le développement de leur production écrite, en respectant une structure précise et en enchaînant les paragraphes de façon cohérente.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les composantes du paragraphe argumentatif$$,
        'body', $$Le développement d'une production écrite comporte au moins trois paragraphes argumentatifs. Chaque paragraphe est composé de trois éléments : l'exposition de l'argument (l'idée défendue), son explication (pourquoi cet argument est valable) et un exemple d'illustration (un fait précis et vérifiable qui le prouve). Le tout premier paragraphe du développement est précédé d'une courte phrase d'introduction au développement.$$,
        'highlights', array[$$argument → explication → exemple$$, $$au moins trois paragraphes$$]::text[],
        'property', jsonb_build_object('label', $$Règle$$, 'text', $$Un paragraphe argumentatif complet comporte l'exposition de l'argument, son explication, puis un exemple d'illustration.$$),
        'fixation', jsonb_build_object('question', $$Combien de paragraphes argumentatifs au minimum compte le développement d'une production écrite ?$$, 'solution', $$Au moins trois.$$)
      ),
      jsonb_build_object(
        'heading', $$La conclusion partielle de chaque paragraphe$$,
        'body', $$Chaque paragraphe argumentatif (sauf éventuellement le tout dernier, qui mène à la conclusion générale) se termine par une conclusion partielle, composée de deux éléments : un bilan partiel qui résume brièvement ce que le paragraphe vient de démontrer, et l'annonce du paragraphe suivant, qui prépare la transition vers le prochain argument.$$,
        'highlights', array[$$bilan partiel$$, $$annonce du paragraphe suivant$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les deux éléments d'une conclusion partielle de paragraphe ?$$, 'solution', $$Le bilan partiel (résumé de ce que le paragraphe vient de montrer) et l'annonce du paragraphe suivant.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de paragraphe rédigé$$,
        'body', $$Reprenons le sujet : « Dans le domaine de la téléphonie mobile, l'Afrique n'a plus rien à envier aux autres continents. » Étayez cette assertion. Voici comment rédiger un premier paragraphe argumentatif à partir de l'argument « le mobile money a permis une innovation financière pionnière ».$$,
        'highlights', array[$$argument + explication + exemple précis$$],
        'example', jsonb_build_object('statement', $$Rédige ce paragraphe en respectant les trois composantes vues plus haut.$$, 'solution', $$L'Afrique a été pionnière dans l'usage financier du téléphone mobile (argument). En effet, dans de nombreux pays africains où une large part de la population n'a pas accès à un compte bancaire classique, le téléphone est devenu un véritable outil financier, permettant d'envoyer, de recevoir et d'épargner de l'argent sans passer par une banque (explication). C'est le cas du service M-Pesa, lancé au Kenya en 2007, qui a permis à des millions de personnes d'effectuer des transactions financières par simple SMS, une innovation depuis reprise dans plusieurs autres pays du monde (exemple). Ce premier constat sur les usages financiers appelle à présent à examiner ce qu'il en est des infrastructures qui rendent ces usages possibles (conclusion partielle).$$),
        'fixation', jsonb_build_object('question', $$Dans le paragraphe ci-dessus, quelle phrase constitue la conclusion partielle ?$$, 'solution', $$« Ce premier constat sur les usages financiers appelle à présent à examiner ce qu'il en est des infrastructures qui rendent ces usages possibles. »$$)
      ),
      jsonb_build_object(
        'heading', $$Enchaîner plusieurs paragraphes$$,
        'body', $$L'annonce du paragraphe suivant, à la fin d'un paragraphe, doit correspondre exactement à l'argument développé dans le paragraphe qui suit : cela crée une progression fluide et logique dans tout le développement. Il faut éviter de juxtaposer des paragraphes sans lien apparent entre eux — chaque conclusion partielle est le pont vers l'argument suivant.$$,
        'highlights', array[$$annonce = pont vers l'argument suivant$$, $$éviter la juxtaposition sans lien$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi est-il important que l'annonce du paragraphe suivant corresponde exactement à l'argument qui suit ?$$, 'solution', $$Pour assurer une progression logique et fluide du développement, sans que les paragraphes paraissent juxtaposés sans lien.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour le sujet « L'agriculture n'est plus, en Côte d'Ivoire, une activité réservée aux zones rurales », un élève a trouvé l'argument suivant pour un premier paragraphe : « L'agriculture urbaine se développe dans les grandes villes ivoiriennes. »$$,
      'questions', array[
        $$Rédige l'explication de cet argument (pourquoi est-ce vrai ou plausible ?).$$,
        $$Propose un exemple d'illustration précis et vérifiable pour cet argument.$$,
        $$Rédige une conclusion partielle qui annonce un second paragraphe sur un autre domaine (par exemple : les nouvelles technologies agricoles, ou la formation des jeunes agriculteurs).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels sont les trois éléments d'un paragraphe argumentatif de production écrite ?$$,
      'hint', $$Ce n'est pas exactement la même liste que pour la dissertation littéraire.$$,
      'expected', $$L'exposition de l'argument, son explication, et un exemple d'illustration.$$
    ),
    jsonb_build_object(
      'question', $$Que précède le tout premier paragraphe du développement ?$$,
      'hint', $$C'est une courte phrase, pas un paragraphe complet.$$,
      'expected', $$Une phrase d'introduction au développement.$$
    ),
    jsonb_build_object(
      'question', $$Que se passe-t-il si l'annonce d'un paragraphe ne correspond pas à l'argument du paragraphe suivant ?$$,
      'hint', $$Pense à la cohérence globale du texte.$$,
      'expected', $$Le développement perd en cohérence : les paragraphes semblent juxtaposés sans véritable lien logique.$$
    ),
    jsonb_build_object(
      'question', $$Un exemple d'illustration dans un paragraphe argumentatif doit-il être vague ou précis et vérifiable ?$$,
      'hint', $$Pense à ce qui rend un argument convaincant.$$,
      'expected', $$Précis et vérifiable, pour donner de la crédibilité à l'argument.$$
    )
  ),
  now()
);
