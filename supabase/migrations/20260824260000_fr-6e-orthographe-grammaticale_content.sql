-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Orthographe (categoryid=62).
-- Cours combinés (3 séances) : "6e_ORTHO_L2_ortho_gram_S1_accord_le_la_les"
-- (id 2185), "S2_leur_leur" (id 2186), "S3_accord_avoir_être" (id 2187).
-- Contenu réécrit à partir des PDF sources ; définitions et exemples
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 6ème éprouvent des difficultés à orthographier "leur" et à accorder les verbes précédés de "le/la/les" et les participes passés avec avoir ou être. Ils s'organisent pour maîtriser ces règles à partir d'un corpus de phrases.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le verbe précédé des pronoms "le, la, les, l'"$$,
        'body', $$"Le, la, les, l'" placés devant un verbe sont des pronoms personnels COD. Le verbe ne s'accorde pas avec eux lorsqu'il est à un temps simple : il s'accorde avec son sujet ("Ces bicyclettes, on les conduit facilement" — "conduit" s'accorde avec "on"). En revanche, le participe passé employé avec l'auxiliaire "avoir" s'accorde avec le COD "le/la/les/l'" placé avant le verbe : "Cette leçon, les élèves l'ont bien comprise" (comprise s'accorde avec "l'", qui reprend "leçon", féminin).$$,
        'highlights', array[$$temps simple + le/la/les devant : le verbe s'accorde avec le sujet, pas le pronom$$, $$participe passé + avoir + COD avant : accord avec le COD (l'/le/la/les)$$]::text[],
        'fixation', jsonb_build_object('question', $$"Ces roues, les mécaniciens les réparent." — le verbe s'accorde-t-il avec "les" ou avec "les mécaniciens" ?$$, 'solution', $$Avec le sujet "les mécaniciens" (temps simple, pas d'accord avec le pronom COD).$$)
      ),
      jsonb_build_object(
        'heading', $$"Leur" pronom personnel et "leur" adjectif possessif$$,
        'body', $$"Leur" est un pronom personnel quand il peut être remplacé par "lui" au singulier : "Papa offre un billet à ses frères" → "Papa leur offre un billet." Dans ce cas, "leur" est invariable et ne prend jamais de "s". "Leur" est un adjectif possessif quand il est situé devant un nom et peut être remplacé par "son/sa/ses" : "Les parents aiment leur enfant." Il s'accorde alors comme un déterminant : singulier si un seul objet est possédé par l'ensemble des possesseurs ("Les enfants entendent leur père"), pluriel si chacun possède plusieurs objets ("Tous les parents aiment leurs enfants").$$,
        'highlights', array[$$leur = lui (pluriel) → pronom personnel, invariable, jamais de "s"$$, $$leur = son/sa/ses → adjectif possessif, s'accorde (leur/leurs) selon le nombre d'objets possédés$$]::text[],
        'example', jsonb_build_object('statement', $$"Les oiseaux transportent des graines par ______ bec(s)." (un bec chacun) — leur ou leurs ?$$, 'solution', $$"Leur bec" (singulier accepté, car un seul bec par oiseau) — "leurs becs" est aussi admis.$$),
        'fixation', jsonb_build_object('question', $$Comment reconnaît-on "leur" pronom personnel de "leur" adjectif possessif ?$$, 'solution', $$Le pronom personnel peut être remplacé par "lui" ; l'adjectif possessif, situé devant un nom, peut être remplacé par "son/sa/ses".$$)
      ),
      jsonb_build_object(
        'heading', $$L'accord du participe passé avec avoir ou être$$,
        'body', $$Le participe passé employé avec l'auxiliaire "être" s'accorde toujours en genre et en nombre avec le sujet : "Il est parti" / "Elle est partie" / "Elles sont parties." Le participe passé employé avec l'auxiliaire "avoir" ne s'accorde jamais avec le sujet ("Les enfants ont lavé les habits"), mais s'accorde avec le COD si celui-ci est placé avant le verbe : "La robe que j'ai choisie est belle" (choisie s'accorde avec "que", reprenant "robe", féminin, placé avant).$$,
        'highlights', array[$$participe passé + être = accord avec le sujet (toujours)$$, $$participe passé + avoir = jamais avec le sujet ; accord avec le COD seulement s'il est placé avant$$]::text[],
        'example', jsonb_build_object('statement', $$Accorde : "La chemise que j'ai (voir) ______ est jaune."$$, 'solution', $$"La chemise que j'ai vue est jaune." (COD "que" = chemise, féminin, placé avant → accord)$$),
        'fixation', jsonb_build_object('question', $$"Nous avons chassé les oiseaux" — le participe s'accorde-t-il ? Pourquoi ?$$, 'solution', $$Non, car le COD "les oiseaux" est placé après le verbe.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton professeur te soumet un texte à corriger contenant des erreurs sur "leur", sur l'accord du verbe précédé de "le/la/les", et sur l'accord des participes passés.$$,
      'questions', array[
        $$Complète les phrases à trous avec "leur" ou "leurs" en justifiant ton choix.$$,
        $$Accorde correctement les participes passés employés avec "avoir" ou "être" dans un court texte.$$,
        $$Explique pourquoi "Ces bicyclettes, on les conduit facilement" ne prend pas d'accord avec "les".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complète : "Grand-mère appelle Aminata et Moussa pour ______ donner des galettes." (leur pronom ou adjectif ?)$$,
      'hint', $$Peut-on le remplacer par "lui" ? Alors c'est un pronom.$$,
      'expected', $$"...pour leur donner des galettes." (pronom personnel, invariable)$$
    ),
    jsonb_build_object(
      'question', $$Complète : "Fabrice et Aurore s'activent à mettre de l'ordre dans ______ chambre." (leur ou leurs ?)$$,
      'hint', $$Adjectif possessif — combien de chambres possèdent-ils ensemble ?$$,
      'expected', $$"...dans leur chambre." (une seule chambre pour les deux, singulier)$$
    ),
    jsonb_build_object(
      'question', $$Accorde : "Nous sommes (arriver) ______ du village hier."$$,
      'hint', $$Auxiliaire "être" → accord avec le sujet "nous".$$,
      'expected', $$"Nous sommes arrivés (ou arrivées) du village hier."$$
    ),
    jsonb_build_object(
      'question', $$Accorde : "La chaussure que j'ai (ramasser) ______ est à toi."$$,
      'hint', $$Auxiliaire "avoir" + COD "que" (= chaussure, féminin) placé avant.$$,
      'expected', $$"La chaussure que j'ai ramassée est à toi."$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-orthographe-grammaticale';
