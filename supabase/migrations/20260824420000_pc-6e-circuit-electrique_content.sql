-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 1 : Le circuit électrique" (id 2095). Contenu réécrit à
-- partir du PDF source ; situation d'apprentissage, définitions et
-- exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 6ème, habitant un quartier où il y a des coupures intempestives d'électricité, veulent prendre des dispositions pour éclairer leur chambre la nuit. Avec leur professeur, ils apprennent à réaliser un circuit électrique et à le schématiser.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les bornes d'une pile et d'une lampe$$,
        'body', $$La pile plate a deux bornes : ses deux lames — la petite lame est la borne positive (+), la grande lame la borne négative (-). La pile cylindrique a pour bornes le bouton central (positive +) et l'enveloppe métallique (négative -). La lampe électrique a deux bornes : le culot et le plot central. Pour l'allumer avec une pile plate, il faut mettre en contact le plot avec une borne de la pile et le culot avec l'autre borne ; avec une pile cylindrique, on utilise un fil de connexion pour relier les bornes.$$,
        'highlights', array[$$pile plate : petite lame = + ; grande lame = -$$, $$pile cylindrique : bouton central = + ; enveloppe métallique = -$$, $$lampe : culot + plot central$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelles sont les deux bornes d'une lampe électrique ?$$, 'solution', $$Le culot et le plot central.$$)
      ),
      jsonb_build_object(
        'heading', $$Le circuit électrique et sa schématisation$$,
        'body', $$Un circuit électrique est une chaîne d'éléments électriques reliés les uns aux autres, directement ou par des fils de connexion, aux bornes d'un générateur. Le générateur (la pile) fait circuler le courant ; le récepteur (la lampe) l'utilise. Lorsqu'on ferme le circuit, un courant électrique le traverse. Les symboles normalisés : pile (trait long + trait court entre deux fils), lampe (cercle barré d'une croix), fil de connexion (simple trait), interrupteur ouvert/fermé.$$,
        'highlights', array[$$circuit = chaîne d'éléments reliés aux bornes d'un générateur$$, $$générateur (pile) = fait circuler le courant ; récepteur (lampe) = l'utilise$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la pile est-elle appelée "générateur" et la lampe "récepteur" ?$$, 'solution', $$La pile fait circuler (génère) le courant électrique, tandis que la lampe utilise (reçoit) ce courant pour s'allumer.$$),
        'fixation', jsonb_build_object('question', $$Que se passe-t-il quand on ferme un circuit électrique ?$$, 'solution', $$Un courant électrique circule à travers les éléments qui le composent.$$)
      ),
      jsonb_build_object(
        'heading', $$Sens conventionnel du courant, conducteurs et isolants$$,
        'body', $$Dans un circuit, le courant électrique sort du générateur par la borne positive (+) et revient par la borne négative (-) : c'est le sens conventionnel du courant. Un conducteur électrique est un corps traversé par le courant (exemples : les métaux — fer, cuivre, aluminium). Un isolant électrique ne se laisse pas traverser par le courant (exemple : le plastique, le bois sec). Tous les conducteurs ne sont pas des métaux (la mine de crayon, par exemple, conduit le courant).$$,
        'highlights', array[$$sens conventionnel : le courant sort du + et revient au - du générateur$$, $$conducteur = laisse passer le courant (métaux, mine de crayon) ; isolant = ne le laisse pas passer (plastique, bois sec)$$]::text[],
        'example', jsonb_build_object('statement', $$Une règle en bois empêche une lampe de s'allumer dans un circuit. Pourquoi ?$$, 'solution', $$Parce que le bois sec est un isolant électrique : il ne laisse pas passer le courant.$$),
        'fixation', jsonb_build_object('question', $$Tous les conducteurs électriques sont-ils des métaux ?$$, 'solution', $$Non, par exemple la mine de crayon (graphite) conduit le courant sans être un métal.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une élève de 6ème veut s'exercer à réaliser un circuit électrique. Elle dispose d'une pile plate, trois fils de connexion, une lampe électrique, deux pinces crocodiles et une règle en bois. Elle relie tous les éléments en boucle, mais la lampe ne s'allume pas.$$,
      'questions', array[
        $$Définis un circuit électrique.$$,
        $$Schématise le circuit électrique réalisé par l'élève.$$,
        $$Explique pourquoi la lampe ne s'allume pas.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$L'aluminium est-il un conducteur ou un isolant électrique ?$$,
      'hint', $$C'est un métal.$$,
      'expected', $$Un conducteur électrique.$$
    ),
    jsonb_build_object(
      'question', $$Complète : "Le courant électrique sort du générateur par la borne ______ et revient par la borne ______."$$,
      'hint', $$Pense au sens conventionnel.$$,
      'expected', $$"...sort par la borne positive (+) et revient par la borne négative (-)."$$
    ),
    jsonb_build_object(
      'question', $$Une tige en acier conduit-elle le courant électrique ?$$,
      'hint', $$L'acier est un métal.$$,
      'expected', $$Oui, l'acier est un métal donc un conducteur.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le rôle du générateur dans un circuit électrique ?$$,
      'hint', $$Il ne consomme pas le courant, il le produit.$$,
      'expected', $$Il fait circuler le courant électrique dans le circuit.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-circuit-electrique';
