-- Physique-Chimie 3ème — Énergie mécanique.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème mechanics competency (Ec=½mv²,
-- Epp=mgh, Em=Ec+Epp, conservation sans frottement, dissipation avec
-- frottement). Original wording throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une kermesse, une bille de flipper est lancée au bas d'une rampe, monte jusqu'à un certain point, puis redescend. Elle ne reçoit aucune poussée supplémentaire pendant sa course. Comment expliquer que sa vitesse diminue en montant puis augmente en redescendant, sans qu'aucune énergie ne soit ni créée ni perdue ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Énergie cinétique$$,
        'body', $$Tout corps en mouvement possède une énergie liée à sa vitesse, appelée énergie cinétique. Elle dépend de la masse du corps et du carré de sa vitesse.$$,
        'highlights', array[$$énergie cinétique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Ec = (1/2)×m×v², où Ec est l'énergie cinétique en joules (J), m la masse en kilogrammes (kg), et v la vitesse en mètres par seconde (m/s).$$),
        'example', jsonb_build_object('statement', $$Une voiture de masse 1000 kg roule à 20 m/s. Calcule son énergie cinétique.$$, 'solution', $$Ec=(1/2)×1000×20²=(1/2)×1000×400=200 000 J.$$),
        'fixation', jsonb_build_object('question', $$Un cycliste et son vélo, de masse totale 80 kg, roulent à 5 m/s. Calcule leur énergie cinétique.$$, 'solution', $$Ec=(1/2)×80×5²=(1/2)×80×25=1000 J.$$)
      ),
      jsonb_build_object(
        'heading', $$Énergie potentielle de pesanteur$$,
        'body', $$Un corps situé en hauteur par rapport à un niveau de référence possède une énergie potentielle de pesanteur, car son poids pourrait effectuer un travail moteur s'il redescendait. Elle dépend de la masse du corps, de l'intensité de la pesanteur et de sa hauteur par rapport au niveau choisi.$$,
        'highlights', array[$$énergie potentielle de pesanteur$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Epp=m×g×h, où Epp est l'énergie potentielle de pesanteur en joules (J), m la masse en kg, g l'intensité de la pesanteur en N/kg (g≈9,8 N/kg sur Terre), et h la hauteur par rapport au niveau de référence, en mètres.$$),
        'example', jsonb_build_object('statement', $$Une pierre de masse 2 kg est posée sur un rocher à 5 m au-dessus du sol (g=9,8 N/kg). Calcule son énergie potentielle de pesanteur par rapport au sol.$$, 'solution', $$Epp=m×g×h=2×9,8×5=98 J.$$),
        'fixation', jsonb_build_object('question', $$Un seau d'eau de masse 10 kg est hissé à 3 m de hauteur (g=9,8 N/kg). Calcule son énergie potentielle de pesanteur.$$, 'solution', $$Epp=10×9,8×3=294 J.$$)
      ),
      jsonb_build_object(
        'heading', $$Énergie mécanique et sa conservation$$,
        'body', $$L'énergie mécanique d'un corps est la somme de son énergie cinétique et de son énergie potentielle de pesanteur. En l'absence de frottements, l'énergie mécanique se conserve au cours du mouvement : l'énergie cinétique et l'énergie potentielle se transforment l'une en l'autre, mais leur somme reste constante.$$,
        'highlights', array[$$énergie mécanique$$, $$conservation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Em=Ec+Epp. En l'absence de frottements, Em reste constante au cours du mouvement : toute perte d'énergie potentielle se retrouve intégralement en énergie cinétique, et inversement.$$),
        'example', jsonb_build_object('statement', $$Une bille de masse 0,5 kg est lâchée sans vitesse d'une hauteur de 2 m (g=9,8 N/kg), sans frottement. Calcule son énergie cinétique juste avant de toucher le sol.$$, 'solution', $$À la hauteur h=2 m, Epp=0,5×9,8×2=9,8 J et Ec=0 (vitesse nulle). Au sol, h=0 donc Epp=0. Comme Em se conserve, Ec au sol vaut 9,8 J.$$),
        'fixation', jsonb_build_object('question', $$Un pendule oscille sans frottement. Au point le plus haut de sa trajectoire, sa vitesse est nulle. Que peut-on dire de son énergie cinétique et de son énergie potentielle à cet instant ?$$, 'solution', $$Au point le plus haut, la vitesse est nulle donc Ec=0 : toute l'énergie mécanique est alors de l'énergie potentielle de pesanteur.$$)
      ),
      jsonb_build_object(
        'heading', $$Énergie mécanique en présence de frottements$$,
        'body', $$En présence de frottements, une partie de l'énergie mécanique se transforme en chaleur (et parfois en son), et n'est plus disponible sous forme mécanique. L'énergie mécanique du corps diminue alors progressivement au cours du mouvement.$$,
        'highlights', array[$$frottements$$, $$dissipation$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$En présence de frottements, l'énergie mécanique Em diminue au cours du temps : une partie est dissipée sous forme de chaleur. On dit que le système n'est plus conservatif.$$),
        'example', jsonb_build_object('statement', $$Une luge glisse sur une piste avec frottements et s'arrête finalement au bas de la pente, alors qu'elle avait de la vitesse en haut. Où est passée son énergie mécanique initiale ?$$, 'solution', $$Elle a été progressivement dissipée sous forme de chaleur par les frottements entre la luge et la neige.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi un pendule réel, soumis aux frottements de l'air, finit-il toujours par s'arrêter ?$$, 'solution', $$Parce que les frottements dissipent progressivement son énergie mécanique sous forme de chaleur, jusqu'à ce qu'elle s'annule.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une kermesse, une bille de flipper de masse 0,2 kg est lancée avec une vitesse de 4 m/s au bas d'une rampe, puis remonte, sans frottement notable, jusqu'à une hauteur h avant de redescendre (g=9,8 N/kg).$$,
      'questions', array[
        $$Calcule l'énergie cinétique de la bille au bas de la rampe.$$,
        $$En admettant la conservation de l'énergie mécanique, quelle est l'énergie potentielle de la bille au point le plus haut atteint (vitesse nulle en ce point) ?$$,
        $$Déduis-en la hauteur maximale h atteinte par la bille (arrondis au centième de mètre).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un skateboarder de masse 45 kg roule à 6 m/s. Calcule son énergie cinétique.$$,
      'hint', $$Utilise Ec=(1/2)×m×v².$$,
      'expected', $$Ec=0,5×45×36=810 J.$$
    ),
    jsonb_build_object(
      'question', $$Un fruit de masse 0,3 kg pend à une branche située à 4 m du sol (g=9,8 N/kg). Calcule son énergie potentielle de pesanteur par rapport au sol.$$,
      'hint', $$Utilise Epp=m×g×h.$$,
      'expected', $$Epp=0,3×9,8×4=11,76 J.$$
    ),
    jsonb_build_object(
      'question', $$Une balle de masse 0,1 kg est lâchée sans vitesse d'une hauteur de 5 m, sans frottement (g=9,8 N/kg). Calcule son énergie cinétique juste avant de toucher le sol.$$,
      'hint', $$Utilise la conservation de l'énergie mécanique : l'énergie cinétique au sol égale l'énergie potentielle initiale.$$,
      'expected', $$Epp initiale=0,1×9,8×5=4,9 J ; par conservation de l'énergie mécanique, Ec au sol=4,9 J.$$
    ),
    jsonb_build_object(
      'question', $$Une voiture ralentit à cause des frottements de l'air et du sol, sans changer d'altitude. Son énergie mécanique reste-t-elle constante ? Explique.$$,
      'hint', $$Pense à ce qui se passe à l'énergie en présence de frottements.$$,
      'expected', $$Non, une partie de son énergie mécanique (ici son énergie cinétique) est dissipée sous forme de chaleur par les frottements, donc l'énergie mécanique diminue.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-energie-mecanique';
