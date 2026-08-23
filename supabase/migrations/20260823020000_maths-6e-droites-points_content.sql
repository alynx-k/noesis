-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Mathématiques, categoryid=50.
-- Moodle course id 2104: "Leçon2: Droites et points"
-- (https://coll.ecole-ci.org/course/view.php?id=2104), resource id 17533.
-- Contenu réécrit à partir du PDF source (thème "Géométrie du plan",
-- programme officiel MENA) ; situation d'apprentissage, définitions,
-- notations et exercices reformulés, non copiés verbatim. Les figures
-- géométriques du PDF sont décrites textuellement (schéma non reproductible
-- en JSON).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club « Environnement Sain » du Collège Moderne Tambi dispose d'un jardin botanique clôturé et sans porte. Pour empêcher les animaux de détruire les plants, les élèves veulent fabriquer une porte et en donner le schéma à un menuisier. Pour cela, ils décident de tracer des droites, de placer des points et de construire des droites perpendiculaires et parallèles.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Points, droites et appartenance$$,
        'body', $$Un point est représenté par une petite croix et noté par une lettre majuscule (ex. A). Une droite est une ligne rectiligne illimitée des deux côtés, notée par une lettre majuscule entre parenthèses, par exemple (D) (« la droite D »). Lorsqu'une droite (D) passe par un point C, on écrit C ∈ (D) (« C appartient à (D) ») ; sinon on écrit C ∉ (D) (« C n'appartient pas à (D) »).$$,
        'highlights', array[$$droite (D) : illimitée des deux côtés, notée entre parenthèses$$, $$∈ = appartient à la droite ; ∉ = n'appartient pas$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment note-t-on qu'un point M appartient à une droite (L) ?$$, 'solution', $$M ∈ (L).$$)
      ),
      jsonb_build_object(
        'heading', $$Points alignés, droites par un ou deux points$$,
        'body', $$Des points sont alignés lorsqu'ils appartiennent à une même droite. Par un point, il passe plusieurs droites. Par deux points distincts A et B, il passe une droite et une seule, notée (AB) (ou (BA)). Sur une droite, un point détermine deux demi-droites : par exemple, un point M sur (D) partage celle-ci en la demi-droite [MA) et la demi-droite [MB).$$,
        'highlights', array[$$par deux points distincts : une seule droite (AB)$$, $$un point sur une droite → deux demi-droites$$]::text[],
        'example', jsonb_build_object('statement', $$Les points F, G et P appartiennent à une droite (D). Donne trois façons de nommer (D).$$, 'solution', $$(FG), (FP) ou (GP) (ou leurs équivalents (GF), (PF), (PG)) : toute paire de points de la droite permet de la nommer.$$),
        'fixation', jsonb_build_object('question', $$Combien de droites passent par deux points distincts donnés ?$$, 'solution', $$Une seule.$$)
      ),
      jsonb_build_object(
        'heading', $$Droites sécantes et perpendiculaires$$,
        'body', $$Deux droites sécantes sont deux droites qui ont un seul point commun, appelé point d'intersection. Deux droites sont perpendiculaires lorsqu'elles sont sécantes en formant un angle droit ; on note (L) ⊥ (H). Par un point donné, il passe une seule droite perpendiculaire à une droite donnée.$$,
        'highlights', array[$$sécantes = un seul point commun$$, $$perpendiculaires = sécantes + angle droit, noté ⊥$$, $$par un point : une seule perpendiculaire à une droite donnée$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie la notation (L) ⊥ (H) ?$$, 'solution', $$Que la droite (L) est perpendiculaire à la droite (H) : elles sont sécantes et forment un angle droit.$$)
      ),
      jsonb_build_object(
        'heading', $$Droites parallèles$$,
        'body', $$Deux droites sont parallèles lorsqu'elles sont perpendiculaires à une même droite ; on note (Q) // (L). Par un point n'appartenant pas à une droite donnée, il ne passe qu'une seule droite parallèle à cette droite. Deux propriétés importantes : (1) lorsque deux droites sont parallèles, toute droite parallèle à l'une est parallèle à l'autre ; (2) lorsque deux droites sont parallèles, toute droite perpendiculaire à l'une est perpendiculaire à l'autre.$$,
        'highlights', array[$$parallèles = perpendiculaires à une même droite, noté //$$, $$(H)//(L) et (T)//(H) ⟹ (T)//(L)$$, $$(D)//(L) et (M)⊥(D) ⟹ (M)⊥(L)$$]::text[],
        'example', jsonb_build_object('statement', $$Sur une figure, les droites (AB) et (GF) sont toutes deux perpendiculaires à une droite (D). Que peut-on en conclure ?$$, 'solution', $$(AB) et (GF) sont parallèles, car deux droites perpendiculaires à une même droite sont parallèles entre elles.$$),
        'fixation', jsonb_build_object('question', $$Si (K)//(T) et (P)//(T), que peut-on dire de (K) et (P) ?$$, 'solution', $$(K) et (P) sont parallèles (toute droite parallèle à l'une est parallèle à l'autre).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Adou pose sur une droite (D) deux équerres qui forment les triangles rectangles CAB et EGF, avec (AB) et (GF) toutes deux perpendiculaires à (D) au niveau des points A et G. Son camarade Lago affirme que les droites (BC) et (FG) sont sécantes, ce qui déclenche une discussion.$$,
      'questions', array[
        $$Cite deux droites parallèles de cette figure et justifie ta réponse à l'aide d'une propriété du cours.$$,
        $$D'après cette propriété, les droites (AB) et (GF) peuvent-elles être sécantes ?$$,
        $$Lago a-t-il raison d'affirmer que (BC) et (FG) sont sécantes ? Explique.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment note-t-on la droite qui passe par les points A et B ?$$,
      'hint', $$Utilise les deux lettres entre parenthèses.$$,
      'expected', $$(AB), qu'on peut aussi noter (BA).$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que deux droites sécantes ?$$,
      'hint', $$Pense au nombre de points communs.$$,
      'expected', $$Deux droites qui ont un seul point commun (leur point d'intersection).$$
    ),
    jsonb_build_object(
      'question', $$Deux droites (H) et (L) sont perpendiculaires à une même droite (D). Que peut-on dire de (H) et (L) ?$$,
      'hint', $$C'est la définition même du parallélisme donnée dans le cours.$$,
      'expected', $$Elles sont parallèles : (H) // (L).$$
    ),
    jsonb_build_object(
      'question', $$Par un point n'appartenant pas à une droite donnée, combien de droites parallèles à cette droite peut-on tracer ?$$,
      'hint', $$C'est une propriété d'unicité.$$,
      'expected', $$Une seule.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-6e-droites-points';
