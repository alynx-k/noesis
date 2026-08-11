-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3221: "PL8: FIGURES d'amplification et d'atténuation"
-- (https://lyc.ecole-ci.org/course/view.php?id=3221)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "8 PL 2nde FIGURES d'amplification et d'atténuation.pdf" (4 pages,
-- Leçon 5 : les figures de style, séance 2 : les figures d'amplification
-- et d'atténuation).
-- Rewritten/paraphrased from the source PDF: the recap table defining
-- gradation, accumulation and anaphore (amplification, built on
-- énumération/répétition) and euphémisme (atténuation, adoucissement d'une
-- réalité choquante) with their procédé and effet, plus litote presented
-- as the complementary attenuation figure. 100% original wording; no
-- sentence, and no literary quotation (Racine, Aragon, Damas, Corm), copied
-- from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl8-figures-amplification-attenuation',
  '2nde',
  'A',
  'francais',
  $$Les figures de style : amplification et atténuation$$,
  7,
  '2nde-a-fr-pl7-figures-analogie',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Poursuivant l'étude des figures de style découvertes lors de la prestation du parolier-poète invité par le club littéraire, les élèves de seconde A remarquent que certains passages insistent fortement sur une idée pour la mettre en valeur, tandis que d'autres, au contraire, adoucissent une réalité difficile à énoncer directement. Ils s'organisent pour identifier ces figures d'amplification et d'atténuation, les analyser et les utiliser en contexte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les figures d'amplification : la gradation et l'accumulation$$,
        'body', $$La gradation est une suite de mots ou de groupes de mots organisés selon une progression, ascendante ou descendante. Fondée sur le procédé de l'énumération, elle permet d'amener progressivement l'idée qui constitue le point culminant du propos, afin de la mettre en valeur. L'accumulation, elle, est la succession de plusieurs termes qui expriment une même idée ; elle aussi fondée sur l'énumération, elle permet de renforcer une idée, d'impressionner ou d'exalter le lecteur.$$,
        'highlights', array[$$gradation$$, $$accumulation$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Figure$$, $$Définition$$, $$Effet recherché$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Gradation$$, $$Progression ascendante ou descendante d'une suite de mots$$, $$Mettre en valeur le point culminant de l'idée$$),
            jsonb_build_array($$Accumulation$$, $$Succession de plusieurs termes pour une même idée$$, $$Renforcer, impressionner, exalter$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Dans une phrase construite ainsi : « Il a trébuché, il a chancelé, il s'est effondré », s'agit-il d'une gradation ascendante ou descendante ?$$, 'solution', $$D'une gradation ascendante : les trois actions vont crescendo jusqu'à l'effondrement final, qui est le point culminant.$$),
        'fixation', jsonb_build_object('question', $$Sur quel procédé reposent la gradation et l'accumulation ?$$, 'solution', $$Sur l'énumération d'une suite de mots ou de groupes de mots.$$)
      ),
      jsonb_build_object(
        'heading', $$L'anaphore$$,
        'body', $$L'anaphore est la répétition d'un même mot ou groupe de mots en tête de phrases, de propositions ou de vers successifs. Fondée sur le procédé de la répétition, elle est particulièrement utilisée en poésie, dans la prière ou dans l'incantation : elle permet d'invoquer, de louer, de magnifier ou d'exalter ce dont on parle.$$,
        'highlights', array[$$anaphore$$, $$répétition$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un poème qui commencerait chacun de ses vers par « Je me souviens... », quelle figure de style reconnaît-on ?$$, 'solution', $$Une anaphore : la répétition de « Je me souviens » en tête de chaque vers.$$),
        'fixation', jsonb_build_object('question', $$Dans quels types de textes l'anaphore est-elle particulièrement fréquente ?$$, 'solution', $$En poésie, dans la prière et dans l'incantation.$$)
      ),
      jsonb_build_object(
        'heading', $$Les figures d'atténuation : la litote et l'euphémisme$$,
        'body', $$Contrairement aux figures d'amplification, les figures d'atténuation cherchent à adoucir ou à minimiser une idée. La litote consiste à dire moins pour suggérer davantage : on emploie une expression atténuée, souvent une négation, pour faire entendre un sens plus fort que celui qui est littéralement exprimé. L'euphémisme, lui, adoucit l'expression d'une réalité jugée grossière, brutale ou choquante, en employant un mot ou une expression de sens affaibli, parfois une périphrase, dans le respect des règles de bienséance.$$,
        'highlights', array[$$litote$$, $$euphémisme$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Figure$$, $$Définition$$, $$Exemple de procédé$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Litote$$, $$Dire moins pour suggérer plus (souvent par la négation)$$, $$« Ce n'est pas mauvais » pour dire « c'est très bon »$$),
            jsonb_build_array($$Euphémisme$$, $$Adoucir une réalité choquante ou grossière$$, $$« les non-voyants » pour « les aveugles »$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi dit-on souvent « il nous a quittés » plutôt que « il est mort » ?$$, 'solution', $$Il s'agit d'un euphémisme : on adoucit l'annonce d'une réalité brutale par respect des règles de bienséance.$$),
        'fixation', jsonb_build_object('question', $$Quel est le principe de la litote ?$$, 'solution', $$Dire moins, souvent par une tournure négative, pour suggérer davantage.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un discours d'hommage, un orateur déclare : « Notre doyen n'était pas n'importe qui : il a marché, il a couru, il a volé vers ses objectifs, sans jamais faiblir. Aujourd'hui, il nous a quittés pour un monde meilleur. »$$,
      'questions', array[
        $$Relève dans ce discours une gradation et précise si elle est ascendante ou descendante.$$,
        $$Relève une litote et explique ce qu'elle laisse entendre.$$,
        $$Relève un euphémisme et explique la réalité qu'il adoucit.$$,
        $$Réécris la dernière phrase du discours en remplaçant l'euphémisme par une expression plus directe.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une gradation ?$$,
      'hint', $$Elle progresse, vers le haut ou vers le bas.$$,
      'expected', $$Une suite de mots organisée selon une progression ascendante ou descendante.$$
    ),
    jsonb_build_object(
      'question', $$Sur quel procédé repose l'anaphore ?$$,
      'hint', $$Un mot ou un groupe de mots revient plusieurs fois.$$,
      'expected', $$La répétition d'un mot ou groupe de mots en tête de phrases, de propositions ou de vers successifs.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qu'une litote ?$$,
      'hint', $$On dit moins pour suggérer plus.$$,
      'expected', $$Une figure qui consiste à dire moins, souvent par la négation, pour suggérer davantage.$$
    ),
    jsonb_build_object(
      'question', $$À quoi sert un euphémisme ?$$,
      'hint', $$Il évite de choquer.$$,
      'expected', $$Il adoucit l'expression d'une réalité grossière, brutale ou choquante.$$
    )
  ),
  now()
);
