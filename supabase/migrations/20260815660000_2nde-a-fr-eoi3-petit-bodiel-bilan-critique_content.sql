-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=163 ("Etude de l'œuvre intégrale").
-- Moodle course id 3741: "EOI 3: Roman_Conclusion"
-- (https://lyc.ecole-ci.org/course/view.php?id=3741)
-- Resource "Je lis le résumé de la leçon", mod_resource id 38066,
-- redirecting to pluginfile "2nde_EOI_Roman_S13_Conclusion.pdf" (5 pages):
-- étude de l'œuvre intégrale "Petit Bodiel" d'Amadou Hampâté Bâ (éd. NEI,
-- 1993), séance n°4 : conclure l'étude de l'œuvre intégrale (synthèse,
-- jugement critique, impact sur le lecteur, situation d'évaluation).
-- Rewritten/paraphrased from the source PDF: the identification of the
-- work's genre (conte drolatique), its principal and secondary themes, the
-- critical judgement on its form (two registers of language, truculent and
-- poetic) and on its didactic function in traditional Africa, the
-- advantages/limits of the marvellous for the reader, and the source's own
-- worked evaluation (genre, main theme, role of the mother). 100% original
-- wording; no sentence copied from the source, and no truculent expression
-- from the tale reproduced.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-eoi3-petit-bodiel-bilan-critique',
  '2nde',
  'A',
  'francais',
  $$Étude de l'œuvre intégrale : « Petit Bodiel » — bilan et jugement critique$$,
  17,
  '2nde-a-fr-eoi2-petit-bodiel-lecture-methodique',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir étudié plusieurs extraits de « Petit Bodiel » d'Amadou Hampâté Bâ par lecture dirigée et lecture méthodique, les élèves de seconde A du Lycée Moderne 1 Odienné arrivent au terme de leur étude. En vue du Festival du Livre et des Arts du Denguélé, ils s'organisent pour dresser le bilan de l'œuvre : en dégager le genre, les thèmes, la portée, et porter un jugement critique sur sa forme et sur l'intérêt de sa lecture.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le genre et les thèmes de l'œuvre$$,
        'body', $$« Petit Bodiel » est un conte drolatique, c'est-à-dire un conte au ton comique. Il aborde plusieurs thèmes, mais celui du pouvoir est le plus important : son mode d'acquisition, son mode d'utilisation et ses conséquences. Autour de ce thème principal gravitent des thèmes secondaires : le travail, l'importance de la mère comme fondement de la société, et le merveilleux.$$,
        'highlights', array[$$conte drolatique$$, $$le pouvoir$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Thème$$, $$Statut$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Le pouvoir (acquisition, utilisation, conséquences)$$, $$Thème principal$$),
            jsonb_build_array($$Le travail$$, $$Thème secondaire$$),
            jsonb_build_array($$L'importance de la mère$$, $$Thème secondaire$$),
            jsonb_build_array($$Le merveilleux$$, $$Thème secondaire$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quel est le thème principal de l'œuvre « Petit Bodiel » ?$$, 'solution', $$Le pouvoir : son mode d'acquisition, son mode d'utilisation et ses conséquences.$$)
      ),
      jsonb_build_object(
        'heading', $$Jugement critique sur la forme de l'œuvre$$,
        'body', $$Sur le plan de la forme, l'œuvre « Petit Bodiel » est assez riche : deux registres de langue s'y côtoient, un registre tantôt truculent, tantôt poétique. Le style truculent se caractérise par des expressions imagées et souvent familières, tandis que le style poétique recherche l'harmonie et l'image. Sur le plan littéraire, l'œuvre réalise une jonction judicieuse entre le conte, l'humour et l'intervention du merveilleux.$$,
        'highlights', array[$$registre truculent$$, $$registre poétique$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les deux registres de langue qui se côtoient dans « Petit Bodiel » ?$$, 'solution', $$Un registre truculent et un registre poétique.$$)
      ),
      jsonb_build_object(
        'heading', $$La portée didactique du conte$$,
        'body', $$En Afrique traditionnelle, le conte n'était pas seulement récréatif : il servait aussi de support de formation et d'enseignement s'adressant à tous les âges. Par sa fonction didactique, le conte éduque, cultive, forme et initie le lecteur. C'est ce qu'illustre « Petit Bodiel » : la réussite d'un enfant paresseux au départ ne peut perdurer que s'il se comporte mieux par la suite, ce qui confirme que l'initiation par un raccourci magique, sans changement profond de comportement, reste fragile.$$,
        'highlights', array[$$fonction didactique$$, $$conte traditionnel$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi peut-on dire que la réussite de Petit Bodiel reste fragile, malgré sa transformation magique ?$$, 'solution', $$Parce que, selon la leçon du conte, un enfant paresseux au départ ne peut voir sa réussite perdurer que s'il change réellement de comportement, au-delà du seul pouvoir magique acquis.$$),
        'fixation', jsonb_build_object('question', $$Quelle fonction le conte remplissait-il en Afrique traditionnelle, au-delà du divertissement ?$$, 'solution', $$Une fonction didactique : il éduquait, cultivait, formait et initiait le lecteur ou l'auditeur.$$)
      ),
      jsonb_build_object(
        'heading', $$L'impact du merveilleux sur le lecteur$$,
        'body', $$Le recours au merveilleux dans le conte présente à la fois des avantages et des limites pour le lecteur. Parmi les avantages, on compte le plaisir procuré par l'histoire racontée, qui permet d'aboutir au sens profond (le signifié), d'émerveiller, de divertir, d'instruire et d'éduquer. Parmi les limites, on peut noter le risque de détourner le lecteur vers la forme apparente du récit (le signifiant, ici les animaux et les êtres surnaturels) au détriment de sa signification réelle (l'être humain), ainsi que le risque d'entraîner le lecteur dans un monde en décalage avec son vécu quotidien, où les catégories logiques habituelles sont bousculées.$$,
        'highlights', array[$$merveilleux$$, $$signifié$$, $$signifiant$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le principal risque du recours au merveilleux dans un conte, selon ce bilan ?$$, 'solution', $$Le risque de détourner le lecteur vers la forme du récit (les animaux, le surnaturel) au lieu de sa signification réelle, concernant l'être humain.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au terme de l'étude de l'œuvre intégrale « Petit Bodiel », un professeur demande à ses élèves de manifester leur intérêt pour l'œuvre en répondant à quelques questions de synthèse.$$,
      'questions', array[
        $$Détermine le genre de l'œuvre étudiée.$$,
        $$Donne le thème principal abordé dans l'œuvre.$$,
        $$Dis quelle place l'auteur accorde à la mère à travers cette œuvre.$$,
        $$Cite un avantage et une limite du recours au merveilleux dans ce conte.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel est le genre de l'œuvre « Petit Bodiel » ?$$,
      'hint', $$C'est un conte au ton comique.$$,
      'expected', $$Un conte drolatique.$$
    ),
    jsonb_build_object(
      'question', $$Quelle place l'auteur accorde-t-il à la mère dans l'œuvre ?$$,
      'hint', $$Elle représente une valeur sociale essentielle.$$,
      'expected', $$Le fondement de la société.$$
    ),
    jsonb_build_object(
      'question', $$Cite les deux registres de langue présents dans l'œuvre.$$,
      'hint', $$L'un est familier et imagé, l'autre recherche l'harmonie.$$,
      'expected', $$Le registre truculent et le registre poétique.$$
    ),
    jsonb_build_object(
      'question', $$Quelle fonction le conte traditionnel africain remplissait-il, selon ce bilan ?$$,
      'hint', $$Plus qu'un simple divertissement.$$,
      'expected', $$Une fonction didactique : il éduquait, cultivait, formait et initiait le lecteur ou l'auditeur.$$
    )
  ),
  now()
);
