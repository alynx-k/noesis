-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Français, categoryid=162 ("Perfectionnement de la langue et savoir-faire").
-- Moodle course id 3223: "PL10: La versification vers et strophes"
-- (https://lyc.ecole-ci.org/course/view.php?id=3223)
-- Resource "Je lis le résumé de la leçon", redirecting to pluginfile
-- "10 PL 2nde la versification vers et strophes.pdf" (5 pages, Leçon 6 :
-- la versification, séance 1 : étudier les vers et les strophes). Note:
-- the PDF's own header banner reads "PREMIERE FRANCAIS" (apparent labelling
-- mistake by the source author), but the resource is filed, linked and
-- served under the Seconde A > Français > Perfectionnement de la langue
-- category (course id 3223, "PL10"), so it is treated here as the real
-- Seconde A resource for this slot.
-- Rewritten/paraphrased from the source PDF: the classical vers (pairs and
-- impairs, syllable count), the rules for counting syllables (e muet,
-- synérèse, diérèse), the vers libre, the strophe names by verse count, and
-- the sonnet and ballade as fixed-form poems. 100% original wording; no
-- sentence, and no line of the poems quoted in the source (Baudelaire,
-- Musset, Desnos, Richepin), copied here.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-fr-pl10-versification-vers-strophes',
  '2nde',
  'A',
  'francais',
  $$La versification : les vers et les strophes$$,
  9,
  '2nde-a-fr-pl9-figures-opposition-construction',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Invités à participer à une compétition de poésie, les élèves du lycée décident de se préparer afin d'être mieux outillés. À partir d'une série de courts poèmes, ils cherchent à identifier les éléments de la versification, à les analyser et à les utiliser en contexte.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le vers classique et sa mesure$$,
        'body', $$Le vers français est formé d'un nombre déterminé de syllabes, ou pieds, qui constituent sa mesure ou son mètre. En poésie classique, les vers sont réguliers : ils possèdent un nombre fixe de syllabes. On distingue les vers pairs (l'alexandrin de 12 syllabes, le décasyllabe de 10, l'octosyllabe de 8, l'hexasyllabe de 6, le quadrisyllabe de 4, le dissyllabe de 2) et les vers impairs (l'hendécasyllabe de 11 syllabes, l'ennéasyllabe de 9, l'heptasyllabe de 7, le pentasyllabe de 5, le trisyllabe de 3, le monosyllabe de 1). Les vers très courts, de six, quatre ou deux syllabes, s'emploient rarement en série continue : on les utilise surtout pour contraster avec des vers plus longs et créer un effet de surprise ou de brièveté.$$,
        'highlights', array[$$vers pairs$$, $$vers impairs$$, $$mesure$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nom du vers$$, $$Nombre de syllabes$$, $$Catégorie$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Alexandrin$$, $$12$$, $$Pair$$),
            jsonb_build_array($$Décasyllabe$$, $$10$$, $$Pair$$),
            jsonb_build_array($$Octosyllabe$$, $$8$$, $$Pair$$),
            jsonb_build_array($$Hendécasyllabe$$, $$11$$, $$Impair$$),
            jsonb_build_array($$Heptasyllabe$$, $$7$$, $$Impair$$),
            jsonb_build_array($$Pentasyllabe$$, $$5$$, $$Impair$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Combien de syllabes compte un alexandrin ?$$, 'solution', $$Douze syllabes.$$)
      ),
      jsonb_build_object(
        'heading', $$Compter les syllabes : e muet, synérèse et diérèse$$,
        'body', $$Pour compter le nombre de syllabes d'un vers, il faut oublier la prononciation du langage courant et prêter attention au e muet : il se prononce et compte pour une syllabe lorsqu'il est placé entre deux consonnes, mais il ne se prononce pas (il est dit élidé) lorsqu'il précède une voyelle ou se trouve en fin de vers. Deux autres procédés modifient le compte des syllabes : la synérèse, qui abrège le mot en prononçant en une seule syllabe deux sons habituellement prononcés séparément (par exemple le mot « lion » compté pour une seule syllabe), et la diérèse, son contraire, qui ralentit la prononciation du mot en séparant, en deux syllabes, deux sons habituellement prononcés ensemble, afin de respecter le mètre du poème (par exemple le mot « pion » compté pour deux syllabes, « pi-on »).$$,
        'highlights', array[$$e muet$$, $$synérèse$$, $$diérèse$$]::text[],
        'example', jsonb_build_object('statement', $$Dans un vers où le mot « lion » doit compter pour une seule syllabe, quel procédé est utilisé ?$$, 'solution', $$La synérèse, qui abrège le mot en fusionnant les deux sons en une seule syllabe.$$),
        'fixation', jsonb_build_object('question', $$Quand le e muet ne se prononce-t-il pas dans un vers ?$$, 'solution', $$Quand il précède une voyelle ou se trouve en fin de vers (il est alors élidé).$$)
      ),
      jsonb_build_object(
        'heading', $$Le vers libre$$,
        'body', $$On appelle vers libre la structure poétique adoptée à partir de la deuxième moitié du XIXe siècle. Le poète s'y affranchit des contraintes classiques : le vers gagne une certaine liberté qui l'éloigne des rimes régulières et de la césure fixe. Ce choix est particulièrement manifeste dans la poésie négro-africaine, où les poètes s'appuient sur des rythmes proches de l'oralité plutôt que sur le mètre classique.$$,
        'highlights', array[$$vers libre$$, $$poésie négro-africaine$$]::text[],
        'fixation', jsonb_build_object('question', $$À partir de quelle période le vers libre s'est-il développé ?$$, 'solution', $$À partir de la deuxième moitié du XIXe siècle.$$)
      ),
      jsonb_build_object(
        'heading', $$Les strophes$$,
        'body', $$Une strophe est un ensemble de vers formant une unité, séparée des autres par un blanc typographique. Les strophes portent un nom selon le nombre de vers qu'elles comptent. Les strophes les plus fréquentes sont le tercet (trois vers) et le quatrain (quatre vers).$$,
        'highlights', array[$$strophe$$, $$tercet$$, $$quatrain$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nombre de vers$$, $$Nom de la strophe$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$2 vers$$, $$Distique$$),
            jsonb_build_array($$3 vers$$, $$Tercet$$),
            jsonb_build_array($$4 vers$$, $$Quatrain$$),
            jsonb_build_array($$6 vers$$, $$Sizain$$),
            jsonb_build_array($$8 vers$$, $$Huitain$$),
            jsonb_build_array($$11 vers$$, $$Onzain$$),
            jsonb_build_array($$12 vers$$, $$Douzain$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Une strophe de quatre vers porte quel nom ?$$, 'solution', $$Un quatrain.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux strophes les plus fréquentes en poésie ?$$, 'solution', $$Le tercet (trois vers) et le quatrain (quatre vers).$$)
      ),
      jsonb_build_object(
        'heading', $$Les poèmes à forme fixe : le sonnet et la ballade$$,
        'body', $$Certains poèmes obéissent à une structure déterminée à l'avance : nombre de vers, de strophes, agencement des rimes. Le sonnet fut la forme fixe la plus répandue entre le XVIe et le XIXe siècle. D'origine italienne, il a été introduit en France par les poètes de la Pléiade. Il se présente sous la forme de 14 vers de même nombre de syllabes, regroupés en deux quatrains suivis de deux tercets. La ballade, elle, est une forme traditionnelle du Moyen Âge reprise au XIXe siècle : composée de trois strophes suivies d'un envoi plus court, elle a un nombre de vers par strophe égal au nombre de syllabes de chaque vers, et son dernier vers de chaque strophe est commun, servant de refrain.$$,
        'highlights', array[$$sonnet$$, $$ballade$$]::text[],
        'fixation', jsonb_build_object('question', $$Combien de vers compte un sonnet et comment sont-ils répartis ?$$, 'solution', $$Quatorze vers, répartis en deux quatrains suivis de deux tercets.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève compose un court poème de quatorze vers, répartis en deux strophes de quatre vers suivies de deux strophes de trois vers, tous de douze syllabes.$$,
      'questions', array[
        $$Quel nom porte le vers de douze syllabes utilisé par cet élève ?$$,
        $$Quelle forme fixe ce poème respecte-t-il ? Justifie ta réponse à partir du nombre et de l'agencement des strophes.$$,
        $$Comment nomme-t-on une strophe de trois vers ? Et une strophe de quatre vers ?$$,
        $$Explique la différence entre la synérèse et la diérèse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de syllabes compte un octosyllabe ?$$,
      'hint', $$Le préfixe « octo » signifie huit.$$,
      'expected', $$Huit syllabes.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que la diérèse ?$$,
      'hint', $$Elle sépare deux sons habituellement prononcés ensemble.$$,
      'expected', $$Un procédé qui sépare en deux syllabes deux sons habituellement prononcés en une seule, pour respecter le mètre du poème.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on une strophe de deux vers ?$$,
      'hint', $$Le préfixe évoque le chiffre deux.$$,
      'expected', $$Un distique.$$
    ),
    jsonb_build_object(
      'question', $$Combien de vers compte un sonnet ?$$,
      'hint', $$Deux quatrains et deux tercets.$$,
      'expected', $$Quatorze vers.$$
    )
  ),
  now()
);
