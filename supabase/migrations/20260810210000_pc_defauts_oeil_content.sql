-- Physique-Chimie 3ème — Les défauts de l'œil et leurs corrections.
-- FALLBACK content (ecole-ci.org still behind its login wall, see header
-- of 20260810200000_pc_lentilles_content.sql for the two attempts made
-- this session). Written from solid general knowledge of the standard
-- Ivorian 3ème programme (œil = système optique, myopie, hypermétropie,
-- presbytie, correction par association de lentilles). Original wording
-- throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une visite médicale scolaire, deux élèves passent un test de vue. L'un plisse les yeux pour lire le tableau mais lit très bien de près ; l'autre lit sans peine au tableau mais doit éloigner son cahier pour déchiffrer les lettres. Leurs yeux ne forment pas l'image au bon endroit. Quels sont ces défauts de vision, et comment les corrige-t-on ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'œil, un système optique convergent$$,
        'body', $$L'œil fonctionne comme un appareil optique. La cornée et le cristallin forment ensemble un système convergent qui joue le rôle d'une lentille convergente, tandis que la rétine, au fond de l'œil, joue le rôle d'un écran. Pour qu'une image nette se forme sur la rétine à différentes distances, le cristallin modifie sa forme, donc sa vergence : c'est l'accommodation.$$,
        'highlights', array[$$cristallin$$, $$rétine$$, $$accommodation$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Chez un œil normal (emmétrope), l'image d'un objet éloigné se forme exactement sur la rétine sans accommodation. En accommodant, cet œil peut aussi voir nettement des objets plus proches, jusqu'à un point rapproché appelé punctum proximum, situé vers 25 cm chez un adulte jeune.$$),
        'example', jsonb_build_object('statement', $$Un œil normal regarde une étoile, très éloignée. Où se forme l'image sur cet œil, et l'œil doit-il accommoder ?$$, 'solution', $$L'image se forme exactement sur la rétine, sans accommodation, car l'œil normal est naturellement adapté à la vision de loin au repos.$$),
        'fixation', jsonb_build_object('question', $$Comment s'appelle le point le plus proche qu'un œil normal peut voir nettement en accommodant au maximum ?$$, 'solution', $$C'est le punctum proximum, situé vers 25 cm de l'œil chez un adulte jeune.$$)
      ),
      jsonb_build_object(
        'heading', $$La myopie et sa correction$$,
        'body', $$Un œil myope est un œil trop convergent, souvent parce qu'il est trop allongé : l'image d'un objet éloigné se forme en avant de la rétine, ce qui rend la vision de loin floue, alors que la vision de près reste possible. Le point le plus éloigné vu nettement, le punctum remotum, se rapproche de l'œil au lieu d'être à l'infini.$$,
        'highlights', array[$$myopie$$, $$punctum remotum$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour corriger la myopie, il faut diminuer la convergence de l'œil : on place devant lui une lentille divergente, de vergence négative, qui ramène l'image sur la rétine.$$),
        'example', jsonb_build_object('statement', $$Un élève voit flou les objets situés au-delà de 3 m, mais lit correctement un livre tenu près des yeux. De quel défaut souffre-t-il, et quel type de lentille corrige ce défaut ?$$, 'solution', $$Il ne voit net que de près : il est myope. On corrige la myopie avec une lentille divergente.$$),
        'fixation', jsonb_build_object('question', $$Un œil myope forme l'image d'un objet éloigné avant ou après la rétine ?$$, 'solution', $$L'image se forme avant la rétine, car l'œil myope est trop convergent.$$)
      ),
      jsonb_build_object(
        'heading', $$L'hypermétropie et sa correction$$,
        'body', $$Un œil hypermétrope est au contraire un œil pas assez convergent, souvent parce qu'il est trop court : l'image d'un objet se forme en arrière de la rétine. La vision de loin reste souvent correcte grâce à l'accommodation, mais la vision de près devient difficile et fatigante.$$,
        'highlights', array[$$hypermétropie$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour corriger l'hypermétropie, il faut augmenter la convergence de l'œil : on place devant lui une lentille convergente, de vergence positive.$$),
        'example', jsonb_build_object('statement', $$Une personne hypermétrope doit accommoder fortement même pour regarder de loin, et se plaint de maux de tête en lisant. Quel type de lentille correctrice lui convient ?$$, 'solution', $$Une lentille convergente, qui ajoute la convergence manquante à son œil.$$),
        'fixation', jsonb_build_object('question', $$L'image d'un objet se forme en arrière de la rétine chez un œil hypermétrope : cet œil est-il trop convergent ou pas assez convergent ?$$, 'solution', $$Il n'est pas assez convergent, c'est pourquoi l'image se forme trop loin, en arrière de la rétine.$$)
      ),
      jsonb_build_object(
        'heading', $$La presbytie et l'association de lentilles$$,
        'body', $$La presbytie est un défaut lié à l'âge : le cristallin perd peu à peu sa capacité d'accommodation, et le punctum proximum s'éloigne de l'œil, rendant la lecture de près difficile. On la corrige, comme l'hypermétropie, avec une lentille convergente. Une personne à la fois myope et presbyte peut porter des verres progressifs, où deux vergences se combinent.$$,
        'highlights', array[$$presbytie$$, $$verres progressifs$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Lorsque deux lentilles minces sont accolées, la vergence totale du système est la somme des vergences de chaque lentille : C = C1 + C2.$$),
        'example', jsonb_build_object('statement', $$Une personne presbyte porte, pour la lecture, un verre progressif qui associe son verre de myopie de vergence −3 δ à une correction supplémentaire de +2 δ. Calcule la vergence totale de la partie basse du verre.$$, 'solution', $$C = C1+C2 = (−3)+(+2) = −1 δ.$$),
        'fixation', jsonb_build_object('question', $$Deux lentilles accolées ont pour vergences +5 δ et −5 δ. Calcule la vergence du système.$$, 'solution', $$C = 5+(−5) = 0 δ : le système n'est ni convergent ni divergent, il n'a pas d'effet sur la lumière.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une visite médicale scolaire, l'infirmière teste la vue de deux élèves. Le premier ne distingue pas nettement les lettres au tableau mais lit très bien son cahier. Le second doit éloigner sa feuille pour lire nettement, mais regarde au loin sans problème apparent.$$,
      'questions', array[
        $$Identifie le défaut visuel probable du premier élève et justifie ta réponse.$$,
        $$Identifie le défaut visuel probable du second élève et justifie ta réponse.$$,
        $$Pour chacun des deux élèves, indique le type de lentille correctrice (convergente ou divergente) à prescrire.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un œil forme l'image d'un objet éloigné en avant de sa rétine. Nomme ce défaut et le type de lentille qui le corrige.$$,
      'hint', $$Compare à la position normale de l'image sur la rétine.$$,
      'expected', $$C'est la myopie ; elle se corrige avec une lentille divergente.$$
    ),
    jsonb_build_object(
      'question', $$Un œil forme l'image d'un objet en arrière de sa rétine. Nomme ce défaut et le type de lentille qui le corrige.$$,
      'hint', $$L'œil est-il trop convergent ou pas assez convergent ?$$,
      'expected', $$C'est l'hypermétropie (ou la presbytie si le défaut est lié à l'âge) ; elle se corrige avec une lentille convergente.$$
    ),
    jsonb_build_object(
      'question', $$Deux lentilles accolées ont pour vergences +4 δ et −6 δ. Calcule la vergence du système obtenu et précise s'il est convergent ou divergent.$$,
      'hint', $$Additionne les deux vergences en tenant compte de leurs signes.$$,
      'expected', $$C = 4+(−6) = −2 δ ; le système est divergent car sa vergence est négative.$$
    ),
    jsonb_build_object(
      'question', $$Explique pourquoi une personne âgée hypermétrope peut avoir besoin d'une correction plus forte pour lire que pour regarder au loin.$$,
      'hint', $$Pense à la presbytie, qui s'ajoute à l'hypermétropie avec l'âge.$$,
      'expected', $$Avec l'âge, le cristallin perd sa capacité d'accommodation (presbytie), ce qui s'ajoute au manque de convergence de l'hypermétropie ; il faut donc une lentille convergente plus puissante pour la vision de près que pour la vision de loin.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-defauts-oeil';
