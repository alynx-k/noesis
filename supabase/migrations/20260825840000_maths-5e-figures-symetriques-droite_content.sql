-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Cinquième,
-- Mathématiques (Thème : Transformation du plan).
-- Cours : "Leçon 2 : Figures symétriques par rapport à une droite".
-- Contenu réécrit à partir du PDF source ; situation d'apprentissage,
-- définitions et exercices reformulés, valeurs numériques conservées.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club littéraire d'un collège veut se doter d'un logo constitué d'un rectangle et de deux étoiles. Une seule étoile est représentée ; l'autre s'obtient en pliant la feuille selon une droite (EF). Émerveillés par ce logo, des élèves de 5ème décident de réaliser une construction précise de la deuxième étoile.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Symétrique d'un point par rapport à une droite$$,
        'body', $$Deux points A et B sont symétriques par rapport à une droite (D) signifie que (D) est la médiatrice du segment [AB] : (D) est perpendiculaire à (AB) et coupe [AB] en son milieu. Tout point appartenant à (D) est son propre symétrique. Pour construire le symétrique M' d'un point M : tracer la perpendiculaire à (D) passant par M, qui coupe (D) en un point H ; puis placer M' sur la demi-droite [MH) tel que MH = HM'.$$,
        'highlights', array[$$A et B symétriques par (D) ⟺ (D) = médiatrice de [AB]$$, $$construction : perpendiculaire par M → point H → M' tel que MH=HM'$$, $$un point de (D) est son propre symétrique$$]::text[],
        'fixation', jsonb_build_object('question', $$Un point C appartient à la droite (D). Quel est son symétrique par rapport à (D) ?$$, 'solution', $$C lui-même : tout point de la droite (D) est son propre symétrique.$$)
      ),
      jsonb_build_object(
        'heading', $$Propriétés de conservation par symétrie axiale$$,
        'body', $$La symétrie par rapport à une droite conserve : l'alignement (des points alignés ont des symétriques alignés) ; les droites et demi-droites (leur symétrique est une droite/demi-droite) ; les longueurs (un segment a pour symétrique un segment de même longueur, et le symétrique du milieu est le milieu du symétrique) ; les mesures d'angles (même mesure) ; les cercles (même rayon) ; le parallélisme et la perpendicularité entre droites.$$,
        'highlights', array[$$la symétrie axiale conserve : alignement, longueurs, angles, rayons de cercle, parallélisme, perpendicularité$$]::text[],
        'example', jsonb_build_object('statement', $$Deux droites (D) et (L) sont perpendiculaires. Leurs symétriques respectifs (D') et (L') par rapport à une droite (D1), sont-ils perpendiculaires ?$$, 'solution', $$Oui : la symétrie axiale conserve la perpendicularité entre droites.$$),
        'fixation', jsonb_build_object('question', $$Un angle EFG mesure 35°. Quelle est la mesure de son symétrique par rapport à une droite ?$$, 'solution', $$35° également : la symétrie conserve les mesures d'angles.$$)
      ),
      jsonb_build_object(
        'heading', $$Axe de symétrie d'une figure$$,
        'body', $$Une droite (D) est un axe de symétrie d'une figure (F) si chaque point de (F) a pour symétrique par rapport à (D) un point de (F). Exemples : un segment a deux axes de symétrie (son support et sa médiatrice) ; un carré en a quatre ; un rectangle en a deux ; un triangle isocèle en a un seul ; un triangle équilatéral en a trois ; un cercle en a une infinité (toute droite passant par son centre).$$,
        'highlights', array[$$axe de symétrie : chaque point de F a son symétrique dans F$$, $$segment=2 axes ; carré=4 ; rectangle=2 ; triangle isocèle=1 ; triangle équilatéral=3 ; cercle=infinité$$]::text[],
        'fixation', jsonb_build_object('question', $$Combien d'axes de symétrie possède un triangle équilatéral ?$$, 'solution', $$Trois.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une société de chemins de fer veut construire une gare desservant deux villes distantes de 5 km. L'emplacement doit être à l'intersection d'une voie rectiligne (L) et d'une bande rectiligne (F) proche de la voie ferrée. Les villes A et B sont symétriques par rapport à la droite (L), qui a été effacée du plan.$$,
      'questions', array[
        $$Reproduis la figure (échelle : 1cm pour 1km) et reconstruis la droite (L).$$,
        $$Place le point N, intersection de (F) et (L).$$,
        $$Justifie pourquoi N est le bon emplacement pour la gare.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la définition de deux points symétriques par rapport à une droite (D) ?$$,
      'hint', $$Cela concerne la médiatrice du segment qui les joint.$$,
      'expected', $$(D) est la médiatrice du segment qui relie ces deux points.$$
    ),
    jsonb_build_object(
      'question', $$Le symétrique d'un cercle de rayon 4cm par rapport à une droite a-t-il un rayon différent ?$$,
      'hint', $$La symétrie conserve les longueurs.$$,
      'expected', $$Non, son symétrique est un cercle de même rayon (4cm).$$
    ),
    jsonb_build_object(
      'question', $$Combien d'axes de symétrie possède un rectangle (non carré) ?$$,
      'hint', $$Moins qu'un carré.$$,
      'expected', $$Deux.$$
    ),
    jsonb_build_object(
      'question', $$Deux droites parallèles (D1) et (D2) ont pour symétriques respectifs (D3) et (D4) par rapport à une droite (Δ). (D3) et (D4) sont-elles parallèles ?$$,
      'hint', $$La symétrie axiale conserve le parallélisme.$$,
      'expected', $$Oui.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-5e-figures-symetriques-droite';
