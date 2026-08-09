-- Physique-Chimie 3ème — Solutions acides, basiques et neutres.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème chemistry competency (échelle de
-- pH, classement acide/neutre/basique, indicateurs colorés, effet d'une
-- dilution). Original wording throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève teste plusieurs liquides de sa maison avec du papier pH : le jus de citron colore le papier en rouge-orangé, l'eau du robinet ne change presque rien, et une solution de bicarbonate de soude colore le papier en bleu-vert. Ces trois liquides n'ont donc pas le même caractère chimique. Comment le pH permet-il de les distinguer ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le pH, mesure du caractère acide, basique ou neutre$$,
        'body', $$Le pH (potentiel hydrogène) est une grandeur qui permet de caractériser une solution aqueuse : il indique si elle est acide, basique ou neutre. Il varie sur une échelle de 0 à 14, et se mesure à l'aide d'un papier pH ou d'un pH-mètre.$$,
        'highlights', array[$$pH$$, $$échelle de 0 à 14$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le pH d'une solution aqueuse se mesure avec du papier pH (qui change de couleur) ou un pH-mètre (qui affiche une valeur numérique). Il varie de 0 à 14.$$),
        'example', jsonb_build_object('statement', $$On trempe un papier pH dans un jus de citron : il prend une teinte rouge-orangé, correspondant à un pH voisin de 2. Que peut-on dire de cette solution ?$$, 'solution', $$Un pH voisin de 2 est très inférieur à 7 : le jus de citron est une solution fortement acide.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux instruments qui permettent de mesurer le pH d'une solution ?$$, 'solution', $$Le papier pH (indicateur coloré) et le pH-mètre (appareil à affichage numérique).$$)
      ),
      jsonb_build_object(
        'heading', $$Solutions acides, basiques et neutres$$,
        'body', $$Selon la valeur de son pH, une solution aqueuse est classée en trois catégories : acide, neutre ou basique.$$,
        'highlights', array[$$acide$$, $$basique$$, $$neutre$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Valeur du pH$$, $$Caractère de la solution$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$0 ≤ pH < 7$$, $$Solution acide$$),
            jsonb_build_array($$pH = 7$$, $$Solution neutre$$),
            jsonb_build_array($$7 < pH ≤ 14$$, $$Solution basique$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une solution de pH inférieur à 7 est acide ; une solution de pH égal à 7 est neutre (comme l'eau pure) ; une solution de pH supérieur à 7 est basique. Plus le pH s'éloigne de 7, plus le caractère acide ou basique est marqué.$$),
        'example', jsonb_build_object('statement', $$Une solution de savon a un pH voisin de 10. Comment qualifie-t-on cette solution ?$$, 'solution', $$Un pH de 10 est supérieur à 7 : c'est une solution basique.$$),
        'fixation', jsonb_build_object('question', $$L'eau distillée a un pH voisin de 7. Comment qualifie-t-on cette solution ?$$, 'solution', $$Un pH égal à 7 correspond à une solution neutre.$$)
      ),
      jsonb_build_object(
        'heading', $$Indicateurs colorés$$,
        'body', $$Certaines substances, appelées indicateurs colorés, changent de couleur selon le caractère acide ou basique d'une solution, ce qui permet de le repérer sans mesurer précisément le pH.$$,
        'highlights', array[$$indicateurs colorés$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le papier de tournesol devient rouge en milieu acide et bleu en milieu basique. La phénolphtaléine reste incolore en milieu acide ou neutre, mais devient rose-fuchsia en milieu basique.$$),
        'example', jsonb_build_object('statement', $$On ajoute quelques gouttes de phénolphtaléine dans une solution, qui devient rose-fuchsia. Que peut-on en conclure sur cette solution ?$$, 'solution', $$La phénolphtaléine devient rose en milieu basique : la solution testée est donc basique.$$),
        'fixation', jsonb_build_object('question', $$Un papier de tournesol bleu, trempé dans une solution, devient rouge. Cette solution est-elle acide ou basique ?$$, 'solution', $$Le papier de tournesol devient rouge en milieu acide : la solution est donc acide.$$)
      ),
      jsonb_build_object(
        'heading', $$Effet d'une dilution sur le pH$$,
        'body', $$Diluer une solution, c'est y ajouter de l'eau pour diminuer la concentration des espèces dissoutes. Cette opération rapproche progressivement le pH de la solution de la valeur 7, celle de l'eau pure, sans jamais totalement l'atteindre par simple ajout d'eau.$$,
        'highlights', array[$$dilution$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Diluer une solution acide augmente progressivement son pH vers 7. Diluer une solution basique diminue progressivement son pH vers 7. Le pH d'une solution acide ou basique se rapproche donc de la neutralité lorsqu'on ajoute de l'eau.$$),
        'example', jsonb_build_object('statement', $$Une solution acide a un pH de 3. On y ajoute une grande quantité d'eau. Le pH final sera-t-il plus proche de 3 ou de 7 ?$$, 'solution', $$La dilution rapproche le pH de la neutralité, donc le pH final sera plus proche de 7 (tout en restant inférieur à 7, tant qu'on ne fait qu'ajouter de l'eau).$$),
        'fixation', jsonb_build_object('question', $$Une solution basique a un pH de 12. Si on la dilue fortement, son pH va-t-il augmenter ou diminuer ?$$, 'solution', $$Il va diminuer, en se rapprochant de 7, car la dilution rapproche toujours le pH d'une solution de la neutralité.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève teste plusieurs liquides de la maison avec du papier pH : le jus de citron donne un pH de 2, l'eau du robinet un pH de 7, et une solution de bicarbonate de soude un pH de 9.$$,
      'questions', array[
        $$Classe ces trois liquides en solutions acide, neutre ou basique.$$,
        $$Si l'élève ajoute une grande quantité d'eau au jus de citron, comment son pH va-t-il évoluer ?$$,
        $$Quel indicateur coloré l'élève pourrait-il utiliser pour distinguer, par un changement de couleur net, la solution de bicarbonate de soude d'une solution neutre ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une solution a un pH de 4. Est-elle acide, neutre ou basique ?$$,
      'hint', $$Compare la valeur du pH à 7.$$,
      'expected', $$pH=4<7, donc la solution est acide.$$
    ),
    jsonb_build_object(
      'question', $$Une solution a un pH de 11. Est-elle acide, neutre ou basique ?$$,
      'hint', $$Compare la valeur du pH à 7.$$,
      'expected', $$pH=11>7, donc la solution est basique.$$
    ),
    jsonb_build_object(
      'question', $$On trempe un papier de tournesol bleu dans du vinaigre : il devient rouge. Que peut-on en conclure sur le caractère du vinaigre ?$$,
      'hint', $$Pense à la couleur que prend le tournesol en milieu acide.$$,
      'expected', $$Le tournesol devient rouge en milieu acide : le vinaigre est donc une solution acide.$$
    ),
    jsonb_build_object(
      'question', $$Une solution basique de pH 9 est fortement diluée avec de l'eau. Son pH va-t-il se rapprocher de 7 ou s'en éloigner ?$$,
      'hint', $$Pense à l'effet de la dilution sur le pH d'une solution.$$,
      'expected', $$Son pH va se rapprocher de 7, car la dilution rapproche toujours le pH d'une solution acide ou basique de la neutralité.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-solutions-acides-basiques';
