-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806590000_fr_pronominalisation_content.sql). ecole-ci.org is
-- reachable now (see 20260812000000_fr-4e-debat_content.sql) — opened
-- Français 4ème > Grammaire > "Leçon 2: S1 Grammaire_La
-- pronominalisation_Les pronoms personnels" (course id 687): "Activités : 0",
-- no résumé/exercise uploaded. Falling back to original content. This 4ème
-- lesson goes beyond the 3ème pronominalisation lesson (le/la/les,
-- lui/leur, en/y, qui/que/dont): it covers demonstrative and possessive
-- pronouns, double pronominalisation, and compound relative pronouns, from
-- the standard Ivorian 4ème Français programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans ta rédaction, tu compares le village de ton enfance à celui de ta grand-mère. Ton professeur remarque que certaines reprises pronominales sont maladroites : il te propose une séance plus avancée sur la pronominalisation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les pronoms démonstratifs$$,
        'body', $$Les pronoms démonstratifs (celui, celle, ceux, celles, ceci, cela, ça) reprennent un nom déjà cité en le désignant ou en le comparant à un autre élément.$$,
        'highlights', array[$$celui$$, $$celle$$, $$ceux-ci$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Forme$$, $$Emploi$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$celui, celle, ceux, celles$$, $$suivis de « de » ou d'une relative$$),
            jsonb_build_array($$celui-ci / celui-là$$, $$distinguent deux éléments proches ou éloignés$$),
            jsonb_build_array($$ceci, cela, ça$$, $$reprennent une idée ou une phrase entière$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le pronom démonstratif reprend un nom en évitant sa répétition, notamment dans une comparaison : il s'accorde en genre et en nombre avec le nom qu'il remplace et s'emploie souvent suivi de « de » ou d'une proposition relative.$$),
        'example', jsonb_build_object('statement', $$Évite la répétition avec un pronom démonstratif : « Le climat de mon village est plus doux que le climat de la capitale. »$$, 'solution', $$Le climat de mon village est plus doux que celui de la capitale.$$),
        'fixation', jsonb_build_object('question', $$Évite la répétition avec un pronom démonstratif : « Les traditions de ce village ressemblent aux traditions du village voisin. »$$, 'solution', $$Les traditions de ce village ressemblent à celles du village voisin.$$)
      ),
      jsonb_build_object(
        'heading', $$Les pronoms possessifs$$,
        'body', $$Le pronom possessif (le mien, la tienne, les leurs...) remplace un groupe nominal en indiquant à la fois l'objet possédé et son possesseur.$$,
        'highlights', array[$$le mien$$, $$la sienne$$, $$les nôtres$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le pronom possessif s'accorde en genre et en nombre avec l'objet possédé (et non avec le possesseur) et varie selon la personne : le mien/la mienne, le tien/la tienne, le sien/la sienne, le nôtre, le vôtre, le leur.$$),
        'example', jsonb_build_object('statement', $$Remplace par un pronom possessif : « Mon cahier est plus épais que ton cahier. »$$, 'solution', $$Mon cahier est plus épais que le tien.$$),
        'fixation', jsonb_build_object('question', $$Remplace par un pronom possessif : « Nos idées valent bien leurs idées. »$$, 'solution', $$Nos idées valent bien les leurs.$$)
      ),
      jsonb_build_object(
        'heading', $$La double pronominalisation$$,
        'body', $$Quand une phrase comporte à la fois un COD et un COI, les deux peuvent être remplacés en même temps par deux pronoms, placés dans un ordre précis devant le verbe.$$,
        'highlights', array[$$un COD$$, $$un COI$$, $$l'ordre des pronoms$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans une double pronominalisation, l'ordre habituel est : me/te/se/nous/vous + le/la/les, ou le/la/les + lui/leur. Exemple : « Il me le donne. » ou « Il le lui donne. »$$),
        'example', jsonb_build_object('statement', $$Remplace le COD et le COI : « Le professeur explique la leçon aux élèves. »$$, 'solution', $$Le professeur la leur explique.$$),
        'fixation', jsonb_build_object('question', $$Remplace le COD et le COI : « Ma mère raconte cette histoire à mon petit frère. »$$, 'solution', $$Ma mère la lui raconte.$$)
      ),
      jsonb_build_object(
        'heading', $$Les pronoms relatifs composés$$,
        'body', $$Après une préposition, on emploie souvent un pronom relatif composé (lequel, auquel, duquel...) qui s'accorde en genre et en nombre avec son antécédent.$$,
        'highlights', array[$$lequel$$, $$auquel$$, $$duquel$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Préposition + pronom$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$avec lequel / laquelle$$, $$l'outil avec lequel il travaille$$),
            jsonb_build_array($$auquel / à laquelle$$, $$le club auquel il appartient$$),
            jsonb_build_array($$duquel / de laquelle$$, $$le sujet duquel on a parlé$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le pronom relatif composé (lequel, auquel, duquel et leurs variantes) s'emploie après une préposition pour relier une proposition relative à son antécédent, en s'accordant en genre et en nombre avec lui.$$),
        'example', jsonb_build_object('statement', $$Relie ces deux phrases avec un pronom relatif composé : « Voici le projet. Nous avons beaucoup travaillé sur ce projet. »$$, 'solution', $$Voici le projet sur lequel nous avons beaucoup travaillé.$$),
        'fixation', jsonb_build_object('question', $$Relie ces deux phrases avec un pronom relatif composé : « C'est une association. Il est fier d'appartenir à cette association. »$$, 'solution', $$C'est une association à laquelle il est fier d'appartenir.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu compares dans ta rédaction les traditions de ton village à celles d'un village voisin, et tu dois éviter toute répétition maladroite.$$,
      'questions', array[
        $$Utilise un pronom démonstratif pour comparer deux éléments de ton texte.$$,
        $$Utilise un pronom possessif pour éviter une répétition.$$,
        $$Rédige une phrase avec double pronominalisation (COD + COI).$$,
        $$Relie deux phrases avec un pronom relatif composé.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Évite la répétition avec un pronom démonstratif : « Les fêtes de ce village sont plus animées que les fêtes de la ville. »$$,
      'hint', $$Le nom remplacé est féminin pluriel.$$,
      'expected', $$Les fêtes de ce village sont plus animées que celles de la ville.$$
    ),
    jsonb_build_object(
      'question', $$Remplace par un pronom possessif : « Son avis compte autant que mon avis. »$$,
      'hint', $$Pense à « le mien ».$$,
      'expected', $$Son avis compte autant que le mien.$$
    ),
    jsonb_build_object(
      'question', $$Remplace le COD et le COI par deux pronoms : « Le maître donne le livre à l'élève. »$$,
      'hint', $$Ordre : COD + lui/leur.$$,
      'expected', $$Le maître le lui donne.$$
    ),
    jsonb_build_object(
      'question', $$Relie ces deux phrases avec un pronom relatif composé : « Voici les outils. Le menuisier travaille avec ces outils. »$$,
      'hint', $$Utilise « avec lesquels ».$$,
      'expected', $$Voici les outils avec lesquels le menuisier travaille.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-pronominalisation';
