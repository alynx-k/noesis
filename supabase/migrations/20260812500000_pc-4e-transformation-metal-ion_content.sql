-- Physique-Chimie 4ème — Transformation d'un métal en ion et
-- inversement.
-- FALLBACK content (see header of
-- 20260812400000_pc-4e-sources-recepteurs-lumiere_content.sql for the
-- sourcing attempts this pass). Written from solid general knowledge of
-- the standard 4ème chemistry competency (réaction lame de zinc / sulfate
-- de cuivre, oxydation du métal, réduction de l'ion métallique, dépôt
-- métallique forcé par électrolyse). Original wording throughout, not
-- copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une lame de zinc, plongée dans une solution bleue de sulfate de cuivre, se recouvre progressivement d'un dépôt rougeâtre, tandis que la couleur bleue de la solution s'atténue peu à peu. La lame de zinc, elle, s'amincit lentement. Que devient le zinc, et d'où vient ce dépôt rougeâtre ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Réaction entre un métal et une solution d'ions métalliques$$,
        'body', $$Lorsqu'on plonge une lame de zinc métallique dans une solution de sulfate de cuivre (contenant des ions cuivre Cu2+), une réaction chimique se produit spontanément : un dépôt de cuivre métallique rougeâtre se forme sur la lame de zinc, et la couleur bleue de la solution, due aux ions Cu2+, s'atténue progressivement.$$,
        'highlights', array[$$lame de zinc$$, $$sulfate de cuivre$$]::text[],
        'property', jsonb_build_object('label', $$Observation$$, 'text', $$Lors de la réaction entre le zinc métallique et les ions cuivre Cu2+ en solution, du cuivre métallique se dépose sur la lame de zinc, et la solution s'appauvrit en ions cuivre, ce qui atténue sa couleur bleue.$$),
        'example', jsonb_build_object('statement', $$Après plusieurs heures, la solution de sulfate de cuivre initialement bleue devient presque incolore. Que peut-on en conclure sur la quantité d'ions cuivre restants ?$$, 'solution', $$La quasi-disparition de la couleur bleue indique que la quantité d'ions cuivre Cu2+ en solution a fortement diminué : ils ont été consommés par la réaction.$$),
        'fixation', jsonb_build_object('question', $$Quel dépôt se forme sur la lame de zinc plongée dans la solution de sulfate de cuivre ?$$, 'solution', $$Un dépôt de cuivre métallique, de couleur rougeâtre.$$)
      ),
      jsonb_build_object(
        'heading', $$Transformation du métal en ion : l'oxydation$$,
        'body', $$Au cours de cette réaction, les atomes de zinc de la lame cèdent chacun deux électrons et passent en solution sous forme d'ions zinc Zn2+ : le métal se transforme en ion. Cette perte d'électrons par le métal est appelée oxydation.$$,
        'highlights', array[$$oxydation$$, $$ion zinc$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Zn → Zn2+ + 2 e⁻. Le zinc métallique perd deux électrons pour former l'ion zinc Zn2+ : c'est une oxydation.$$),
        'example', jsonb_build_object('statement', $$Écris la demi-équation traduisant la transformation du zinc métallique en ion zinc.$$, 'solution', $$Zn → Zn2+ + 2 e⁻.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la transformation d'un métal en ion, par perte d'électrons ?$$, 'solution', $$Une oxydation.$$)
      ),
      jsonb_build_object(
        'heading', $$Transformation de l'ion en métal : la réduction$$,
        'body', $$Les électrons cédés par le zinc sont aussitôt captés par les ions cuivre Cu2+ présents en solution, qui se transforment alors en cuivre métallique, se déposant sur la lame : l'ion se transforme en métal. Ce gain d'électrons par l'ion est appelé réduction.$$,
        'highlights', array[$$réduction$$, $$dépôt de cuivre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Cu2+ + 2 e⁻ → Cu. L'ion cuivre Cu2+ gagne deux électrons pour former du cuivre métallique : c'est une réduction. La réaction globale s'écrit : Zn + Cu2+ → Zn2+ + Cu.$$),
        'example', jsonb_build_object('statement', $$Vérifie que l'équation globale Zn + Cu2+ → Zn2+ + Cu est cohérente avec les deux demi-équations d'oxydation et de réduction.$$, 'solution', $$L'oxydation Zn → Zn2+ + 2e⁻ fournit deux électrons, exactement captés par la réduction Cu2+ + 2e⁻ → Cu : les électrons échangés s'équilibrent, et l'équation globale est bien Zn + Cu2+ → Zn2+ + Cu.$$),
        'fixation', jsonb_build_object('question', $$Écris la demi-équation traduisant la transformation de l'ion cuivre en cuivre métallique.$$, 'solution', $$Cu2+ + 2 e⁻ → Cu.$$)
      ),
      jsonb_build_object(
        'heading', $$Transformation forcée d'un ion en métal : l'électrolyse$$,
        'body', $$Certaines transformations d'ions métalliques en métal ne se produisent pas spontanément : c'est le cas du cuivre métallique, qui ne réagit pas naturellement avec les ions zinc Zn2+. Il est cependant possible de forcer un ion métallique à se transformer en métal en imposant un courant électrique à l'aide d'un générateur : c'est le principe de l'électrolyse, utilisé notamment pour recouvrir un objet d'une fine couche métallique (galvanoplastie).$$,
        'highlights', array[$$électrolyse$$, $$transformation forcée$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'électrolyse impose, grâce à un générateur, le passage d'un courant électrique qui force la réduction d'ions métalliques en métal à une électrode, même lorsque cette transformation ne se produit pas spontanément.$$),
        'example', jsonb_build_object('statement', $$Pour recouvrir un objet métallique d'une fine couche de nickel, on utilise un bain contenant des ions nickel et l'on fait passer un courant électrique. Quel nom porte cette technique ?$$, 'solution', $$C'est une électrolyse (technique de galvanoplastie), qui force le dépôt du métal sur l'objet grâce au courant imposé.$$),
        'fixation', jsonb_build_object('question', $$Quelle différence essentielle y a-t-il entre la réaction spontanée du zinc avec les ions cuivre et une électrolyse ?$$, 'solution', $$La réaction du zinc avec les ions cuivre est spontanée, sans générateur ; l'électrolyse nécessite un générateur qui impose le courant pour forcer la transformation.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève plonge une lame de fer dans une solution de sulfate de cuivre. Il observe un dépôt rougeâtre se former sur la lame, et la couleur bleue de la solution s'atténuer, exactement comme avec une lame de zinc.$$,
      'questions', array[
        $$Quel est le métal qui se dépose sur la lame de fer ?$$,
        $$Écris l'équation de la réaction, sachant que le fer se transforme en ions fer(II) Fe2+ en cédant deux électrons.$$,
        $$Cette réaction est-elle spontanée ou nécessite-t-elle un générateur ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une lame de zinc est plongée dans une solution de sulfate de cuivre. Quel dépôt observe-t-on sur la lame ?$$,
      'hint', $$Pense au métal formé à partir des ions Cu2+.$$,
      'expected', $$Un dépôt de cuivre métallique.$$
    ),
    jsonb_build_object(
      'question', $$Écris la demi-équation d'oxydation du zinc métallique en ion zinc.$$,
      'hint', $$Le zinc perd des électrons.$$,
      'expected', $$Zn → Zn2+ + 2 e⁻.$$
    ),
    jsonb_build_object(
      'question', $$Écris la demi-équation de réduction de l'ion cuivre en cuivre métallique.$$,
      'hint', $$L'ion cuivre gagne des électrons.$$,
      'expected', $$Cu2+ + 2 e⁻ → Cu.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la technique qui force, grâce à un générateur, la transformation d'un ion métallique en métal pour recouvrir un objet d'une fine couche métallique ?$$,
      'hint', $$C'est la même technique que celle utilisée pour l'électrolyse de l'eau.$$,
      'expected', $$L'électrolyse (galvanoplastie).$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-transformation-metal-ion';
