-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806590000_fr_pronominalisation_content.sql). ecole-ci.org is
-- reachable now (see 20260812000000_fr-4e-debat_content.sql) — opened
-- Français 4ème > Grammaire > "Leçon 1: S1 Grammaire_Le groupe
-- nominal_Les différentes expansions du GN" (course id 684): "Activités : 0",
-- no résumé/exercise uploaded. Falling back to original content, from the
-- lesson title/topic and the standard Ivorian 4ème Français programme
-- (compétence grammaire — le groupe nominal).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En corrigeant ta rédaction, ton professeur souligne plusieurs groupes nominaux mal construits. Pour améliorer tes phrases, tu dois revoir la structure du groupe nominal et ses expansions.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le noyau et le déterminant$$,
        'body', $$Un groupe nominal s'organise toujours autour d'un nom noyau, généralement précédé d'un déterminant qui l'introduit et précise son sens.$$,
        'highlights', array[$$le nom noyau$$, $$le déterminant$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le groupe nominal minimal est formé d'un déterminant et d'un nom noyau (« le village », « une histoire »). Le nom noyau commande les accords en genre et en nombre de tout le groupe.$$),
        'example', jsonb_build_object('statement', $$Identifie le déterminant et le nom noyau dans « ces vieux manuscrits ».$$, 'solution', $$Déterminant : ces. Nom noyau : manuscrits.$$),
        'fixation', jsonb_build_object('question', $$Identifie le déterminant et le nom noyau dans « ma meilleure amie ».$$, 'solution', $$Déterminant : ma. Nom noyau : amie.$$)
      ),
      jsonb_build_object(
        'heading', $$Les expansions du nom$$,
        'body', $$Le nom noyau peut être enrichi par des expansions qui apportent des précisions : un adjectif épithète, un complément du nom, ou une proposition subordonnée relative.$$,
        'highlights', array[$$un adjectif épithète$$, $$un complément du nom$$, $$une proposition relative$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Expansion$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Adjectif épithète$$, $$un vieux village$$),
            jsonb_build_array($$Complément du nom (introduit par une préposition)$$, $$un village de pêcheurs$$),
            jsonb_build_array($$Proposition subordonnée relative$$, $$un village qui domine la vallée$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une expansion du nom précise ou enrichit le sens du nom noyau sans être indispensable à la construction grammaticale de la phrase : on peut souvent la supprimer sans rendre la phrase incorrecte.$$),
        'example', jsonb_build_object('statement', $$Ajoute un complément du nom au groupe nominal « une maison ».$$, 'solution', $$une maison en terre battue$$),
        'fixation', jsonb_build_object('question', $$Ajoute une proposition subordonnée relative au groupe nominal « le fleuve ».$$, 'solution', $$le fleuve qui traverse la ville$$)
      ),
      jsonb_build_object(
        'heading', $$Les accords dans le groupe nominal$$,
        'body', $$Tous les éléments du groupe nominal (déterminant, adjectifs épithètes) s'accordent en genre et en nombre avec le nom noyau.$$,
        'highlights', array[$$l'accord en genre$$, $$l'accord en nombre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le déterminant et les adjectifs épithètes du groupe nominal prennent le genre et le nombre du nom noyau, y compris lorsque plusieurs adjectifs se succèdent.$$),
        'example', jsonb_build_object('statement', $$Accorde correctement : « de (beau) histoire(s) (ancien) »$$, 'solution', $$de belles histoires anciennes$$),
        'fixation', jsonb_build_object('question', $$Accorde correctement : « un(e) (grand) fête(s) (traditionnel) »$$, 'solution', $$de grandes fêtes traditionnelles$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu relis ta rédaction sur ton village natal et cherches à enrichir tes groupes nominaux pour la rendre plus précise.$$,
      'questions', array[
        $$Identifie le nom noyau de trois groupes nominaux de ton texte.$$,
        $$Ajoute une expansion différente (adjectif, complément du nom, relative) à trois groupes nominaux.$$,
        $$Vérifie les accords en genre et en nombre dans chaque groupe nominal enrichi.$$,
        $$Explique la différence entre un complément du nom et une proposition subordonnée relative.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Identifie le déterminant et le nom noyau dans « cette longue rivière ».$$,
      'hint', $$Le nom noyau commande les accords.$$,
      'expected', $$Déterminant : cette. Nom noyau : rivière.$$
    ),
    jsonb_build_object(
      'question', $$Ajoute un adjectif épithète et un complément du nom au groupe nominal « un chapeau ».$$,
      'hint', $$Combine les deux types d'expansion.$$,
      'expected', $$un vieux chapeau de paille$$
    ),
    jsonb_build_object(
      'question', $$Transforme en groupe nominal enrichi d'une relative : « Le marché. Il se tient chaque samedi. »$$,
      'hint', $$Utilise « qui » pour relier les deux phrases.$$,
      'expected', $$le marché qui se tient chaque samedi$$
    ),
    jsonb_build_object(
      'question', $$Accorde correctement : « de (nouveau) route(s) (goudronné) »$$,
      'hint', $$Le nom est au pluriel féminin.$$,
      'expected', $$de nouvelles routes goudronnées$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-groupe-nominal';
