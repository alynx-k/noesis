-- Physique-Chimie 3ème — Les lentilles.
-- FALLBACK content: ecole-ci.org's lesson pages sit behind a phone-number/
-- matricule login wall with no accessible session (confirmed again this
-- session: a guessed lesson URL 404'd via WebFetch, and navigating to the
-- site's search redirected straight to co/logineleve.php). Written from
-- solid general knowledge of the standard Ivorian 3ème physique-chimie
-- optics competency (lentilles convergentes/divergentes, éléments
-- caractéristiques, construction d'image, vergence). Every sentence,
-- example and exercise below is original wording, not copied from any
-- source. Same CourseContentV2 shape as the maths/anglais/français
-- migrations (see e.g. 20260806240000_pyramides_cones_content.sql).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un photographe utilise un appareil muni d'une lentille pour capturer des images nettes, tandis qu'un opticien ajuste des verres correcteurs pour ses clients. Dans les deux cas, c'est le même objet optique qui est en jeu : la lentille. Comment une lentille transforme-t-elle la lumière pour former une image, et quelles grandeurs permettent de la caractériser ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Lentilles convergentes et lentilles divergentes$$,
        'body', $$Une lentille est un objet transparent limité par au moins une face courbe, capable de dévier les rayons lumineux qui la traversent. Une lentille convergente est plus épaisse en son centre qu'à ses bords : elle rapproche les rayons lumineux parallèles jusqu'à les faire converger en un point. Une lentille divergente est au contraire plus mince en son centre qu'à ses bords : elle écarte les rayons lumineux parallèles comme s'ils provenaient d'un même point.$$,
        'highlights', array[$$lentille convergente$$, $$lentille divergente$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une lentille convergente transforme un faisceau de rayons parallèles à son axe en un faisceau convergent vers un point. Une lentille divergente transforme ce même faisceau en un faisceau divergent, comme s'il provenait d'un point situé du côté de la source.$$),
        'example', jsonb_build_object('statement', $$On envoie un faisceau de rayons parallèles sur une lentille inconnue. En sortant de la lentille, les rayons se resserrent et se croisent en un point. De quel type de lentille s'agit-il ?$$, 'solution', $$Puisque les rayons convergent après la traversée, il s'agit d'une lentille convergente.$$),
        'fixation', jsonb_build_object('question', $$Une loupe, plus épaisse au centre qu'à ses bords, est-elle une lentille convergente ou divergente ?$$, 'solution', $$Elle est plus épaisse au centre : c'est une lentille convergente.$$)
      ),
      jsonb_build_object(
        'heading', $$Éléments caractéristiques d'une lentille convergente$$,
        'body', $$Toute lentille convergente possède un centre optique O, point par lequel passe tout rayon lumineux sans être dévié, et un axe optique, droite qui passe par O et est perpendiculaire au plan de la lentille. Elle possède aussi deux foyers, F et F', situés symétriquement de part et d'autre de O sur l'axe optique. La distance entre O et F' s'appelle la distance focale, notée f'.$$,
        'highlights', array[$$centre optique$$, $$axe optique$$, $$foyers$$, $$distance focale$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Le centre optique O laisse passer sans déviation tout rayon qui le traverse. Le foyer image F' est le point où converge tout rayon incident parallèle à l'axe optique. Le foyer objet F est le point tel que tout rayon issu de F ressort parallèle à l'axe optique après la lentille. La distance focale f' = OF' se mesure en mètres.$$),
        'example', jsonb_build_object('statement', $$Une lentille convergente a un centre optique O et un foyer image F' situé à 15 cm de O. Un rayon lumineux arrive parallèlement à l'axe optique. Que devient-il après la lentille ?$$, 'solution', $$Tout rayon incident parallèle à l'axe optique émerge en passant par le foyer image F', donc ce rayon traverse le point F' situé à 15 cm de O.$$),
        'fixation', jsonb_build_object('question', $$Un rayon lumineux passe par le foyer objet F avant d'atteindre la lentille convergente. Quelle direction a-t-il en sortant de la lentille ?$$, 'solution', $$Tout rayon issu du foyer objet F ressort parallèle à l'axe optique après la lentille.$$),
        'diagram', jsonb_build_object(
          'viewBox', jsonb_build_array(200, 100),
          'points', jsonb_build_array(
            jsonb_build_object('x', 10, 'y', 50),
            jsonb_build_object('x', 190, 'y', 50),
            jsonb_build_object('x', 100, 'y', 20),
            jsonb_build_object('x', 100, 'y', 80),
            jsonb_build_object('x', 100, 'y', 50, 'label', $$O$$),
            jsonb_build_object('x', 40, 'y', 50, 'label', $$F$$),
            jsonb_build_object('x', 160, 'y', 50, 'label', $$F'$$)
          ),
          'segments', jsonb_build_array(jsonb_build_array(0,1), jsonb_build_array(2,3))
        )
      ),
      jsonb_build_object(
        'heading', $$Construction de l'image donnée par une lentille convergente$$,
        'body', $$Pour construire l'image d'un objet à travers une lentille convergente, on utilise deux rayons particuliers issus du sommet de l'objet : celui qui passe par le centre optique O n'est pas dévié, et celui qui arrive parallèlement à l'axe optique ressort en passant par le foyer image F'. Leur point de croisement donne l'image du sommet de l'objet.$$,
        'highlights', array[$$image$$, $$rayons particuliers$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Si l'objet est placé au-delà du foyer objet F, l'image obtenue est réelle (elle peut être recueillie sur un écran) et renversée. Si l'objet est placé entre O et F, l'image est virtuelle (elle ne peut pas être recueillie sur un écran), droite et agrandie : c'est le principe de la loupe.$$),
        'example', jsonb_build_object('statement', $$Un objet est placé loin devant une lentille convergente, au-delà de son foyer objet. L'image obtenue est-elle réelle ou virtuelle ?$$, 'solution', $$L'objet est placé au-delà du foyer objet F, donc l'image est réelle et renversée.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi une loupe doit-elle être tenue près de l'objet observé pour l'agrandir ?$$, 'solution', $$Pour obtenir une image virtuelle, droite et agrandie, l'objet doit être placé entre le centre optique O et le foyer objet F, donc près de la lentille.$$)
      ),
      jsonb_build_object(
        'heading', $$Vergence d'une lentille$$,
        'body', $$La vergence caractérise le pouvoir convergent ou divergent d'une lentille. Elle est égale à l'inverse de la distance focale exprimée en mètres, et se mesure en dioptries, notées δ. Plus la distance focale est courte, plus la vergence est grande et plus la lentille dévie fortement la lumière.$$,
        'highlights', array[$$vergence$$, $$dioptries$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$C = 1/f', où f' est la distance focale en mètres et C la vergence en dioptries (δ). La vergence d'une lentille convergente est positive, celle d'une lentille divergente est négative.$$),
        'example', jsonb_build_object('statement', $$Une lentille convergente a une distance focale f'=25 cm. Calcule sa vergence.$$, 'solution', $$f'=0,25 m, donc C=1/0,25=4 δ.$$),
        'fixation', jsonb_build_object('question', $$Une lentille a une vergence C=8 δ. Calcule sa distance focale en cm.$$, 'solution', $$f'=1/C=1/8=0,125 m=12,5 cm.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un opticien doit choisir une lentille convergente pour fabriquer une loupe destinée à un élève. Il dispose de deux lentilles : l'une de distance focale 5 cm, l'autre de vergence 4 δ.$$,
      'questions', array[
        $$Calcule la vergence de la première lentille (distance focale 5 cm).$$,
        $$Calcule la distance focale de la seconde lentille (vergence 4 δ).$$,
        $$Laquelle des deux lentilles a le pouvoir convergent le plus fort ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Une lentille convergente a une distance focale f'=50 cm. Calcule sa vergence.$$,
      'hint', $$Convertis f' en mètres puis utilise C=1/f'.$$,
      'expected', $$f'=0,5 m, donc C=1/0,5=2 δ.$$
    ),
    jsonb_build_object(
      'question', $$Une lentille a une vergence C=5 δ. Calcule sa distance focale en cm.$$,
      'hint', $$Utilise f'=1/C, puis convertis le résultat en cm.$$,
      'expected', $$f'=1/5=0,2 m=20 cm.$$
    ),
    jsonb_build_object(
      'question', $$Un rayon lumineux traverse le centre optique O d'une lentille convergente. Décris ce qui lui arrive.$$,
      'hint', $$Rappelle la propriété du centre optique.$$,
      'expected', $$Un rayon passant par le centre optique O n'est pas dévié : il poursuit sa trajectoire en ligne droite.$$
    ),
    jsonb_build_object(
      'question', $$Un objet est placé entre le centre optique et le foyer objet d'une lentille convergente. Quelle est la nature de l'image obtenue ?$$,
      'hint', $$Compare la position de l'objet aux positions de O et F.$$,
      'expected', $$L'image est virtuelle, droite et agrandie : c'est le principe de la loupe.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-lentilles';
