-- Physique-Chimie 4ème — Analyse et synthèse de la lumière blanche.
-- Real content sourced from coll.ecole-ci.org (Collège Numérique, logged-in
-- access confirmed), course id 2015 "Lecon4_Analyse et synthese de la
-- lumiere blanche", resource id 16476 ("Je lis le résumé de la leçon"),
-- PDF "PC 4ème_L4_Analyse et synthese de la lumiere blanche.pdf" (7 pages,
-- thème Optique). Rewritten in original wording — paraphrased, not copied
-- from the source PDF — keeping the same technical content: decomposition
-- of white light (glass of water, prism) into the seven visible colours,
-- the rainbow, additive synthesis with the three primary colours (Newton's
-- disc), the role of a coloured filter, and the colour of objects lit by
-- white light versus coloured light (absorption/diffusion rule).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un élève achète une chemise dans une boutique éclairée par une lumière bleue : sous cet éclairage, la chemise lui paraît noire. Une fois rentré chez lui, à la lumière du jour, il découvre avec surprise que sa chemise est en réalité rouge. Pour comprendre ce changement d'apparence, il doit d'abord découvrir de quelles couleurs se compose réellement la lumière blanche, et comment la couleur d'un objet dépend de la lumière qui l'éclaire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Décomposition de la lumière blanche$$,
        'body', $$En faisant traverser un faisceau de lumière blanche à travers un verre d'eau ou un prisme, on observe sur un écran une bande continue de couleurs, appelée spectre : violet, indigo, bleu, vert, jaune, orange, rouge. Cette expérience, appelée analyse ou décomposition de la lumière blanche, prouve que la lumière blanche n'est pas une couleur simple, mais résulte de la superposition de ces sept couleurs.$$,
        'highlights', array[$$décomposition$$, $$analyse$$, $$spectre$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La lumière blanche se décompose, à travers un prisme ou un verre d'eau, en un spectre continu de sept couleurs : violet, indigo, bleu, vert, jaune, orange, rouge. Cette décomposition peut aussi être obtenue avec un réseau ou la face gravée d'un disque compact.$$),
        'example', jsonb_build_object('statement', $$Après une averse, un arc-en-ciel apparaît dans le ciel alors que le Soleil brille encore, l'observateur lui tournant le dos. Quelle expérience de la leçon ce phénomène rappelle-t-il ?$$, 'solution', $$Il rappelle la décomposition de la lumière blanche par un prisme ou un verre d'eau : ici, ce sont les gouttelettes d'eau en suspension dans l'air qui décomposent la lumière blanche du Soleil en ses sept couleurs.$$),
        'fixation', jsonb_build_object('question', $$Cite, dans l'ordre, les sept couleurs visibles obtenues en décomposant la lumière blanche.$$, 'solution', $$Violet, indigo, bleu, vert, jaune, orange, rouge.$$)
      ),
      jsonb_build_object(
        'heading', $$Synthèse de la lumière blanche$$,
        'body', $$À l'inverse de la décomposition, on peut recomposer de la lumière blanche : c'est la synthèse. Un disque de Newton, portant les sept couleurs du spectre, paraît blanc dès qu'il tourne assez vite. On peut aussi superposer trois lumières colorées, dites couleurs primaires : le rouge, le vert et le bleu. Leur superposition totale donne du blanc ; superposées deux à deux, elles donnent d'autres couleurs.$$,
        'highlights', array[$$synthèse$$, $$couleurs primaires$$, $$disque de Newton$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Rouge + vert + bleu = blanc. Deux à deux : rouge + vert = jaune, bleu + vert = cyan, rouge + bleu = magenta. Le rouge, le vert et le bleu sont les couleurs primaires de la lumière.$$),
        'example', jsonb_build_object('statement', $$Sur un écran, on superpose un faisceau de lumière bleue et un faisceau de lumière rouge, de même intensité. Quelle couleur apparaît dans la zone de superposition ?$$, 'solution', $$D'après la synthèse additive, bleu + rouge donne du magenta.$$),
        'fixation', jsonb_build_object('question', $$Quelle couleur obtient-on en superposant les trois couleurs primaires rouge, vert et bleu avec la même intensité ?$$, 'solution', $$On obtient du blanc.$$)
      ),
      jsonb_build_object(
        'heading', $$Rôle d'un filtre coloré$$,
        'body', $$Un filtre coloré, placé devant une source de lumière blanche, absorbe une partie des couleurs qui le traversent et ne laisse passer que les autres, qui lui donnent sa couleur. Il permet ainsi d'obtenir une lumière colorée à partir d'une lumière blanche.$$,
        'highlights', array[$$filtre coloré$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un filtre coloré absorbe certaines couleurs de la lumière incidente et transmet les autres. La lumière qui sort du filtre a la couleur des composantes transmises.$$),
        'example', jsonb_build_object('statement', $$Un filtre vert est placé devant une lampe émettant de la lumière blanche. Quelle couleur observe-t-on après le filtre ?$$, 'solution', $$Le filtre vert absorbe les autres couleurs et ne transmet que le vert : la lumière observée après le filtre est verte.$$),
        'fixation', jsonb_build_object('question', $$Un filtre rouge est traversé par de la lumière blanche. Que devient la lumière transmise ?$$, 'solution', $$Elle devient rouge, car le filtre absorbe les autres couleurs et ne laisse passer que le rouge.$$)
      ),
      jsonb_build_object(
        'heading', $$Couleur des objets éclairés$$,
        'body', $$Éclairé en lumière blanche, un objet diffuse certaines couleurs et absorbe les autres ; la couleur diffusée est sa couleur propre. Un objet blanc diffuse toutes les couleurs reçues, un objet noir les absorbe toutes. Éclairé par une lumière colorée, en revanche, l'objet ne peut diffuser que les couleurs présentes dans cette lumière et qu'il n'absorbe pas : s'il ne reçoit aucune des couleurs qu'il diffuse habituellement, il paraît noir ; s'il reçoit une couleur qu'il diffuse d'ordinaire, il conserve son apparence.$$,
        'highlights', array[$$couleur propre$$, $$absorption$$, $$diffusion$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La couleur propre d'un objet est celle qu'il diffuse quand il est éclairé en lumière blanche. Sous une lumière colorée, l'objet paraît noir si cette lumière ne contient pas la couleur qu'il diffuse habituellement, et garde sa couleur propre si elle la contient.$$),
        'example', jsonb_build_object('statement', $$Une chemise rouge, dont la couleur propre est le rouge, est éclairée par une lumière bleue ne contenant aucune composante rouge. De quelle couleur paraît-elle ?$$, 'solution', $$Elle paraît noire : la chemise ne peut diffuser que le rouge, absent de la lumière bleue reçue, donc elle n'a rien à renvoyer vers l'œil.$$),
        'fixation', jsonb_build_object('question', $$Un objet dont la couleur propre est le vert est éclairé par une lumière verte. De quelle couleur paraît-il ? Justifie.$$, 'solution', $$Il paraît vert : la lumière reçue contient justement la couleur qu'il diffuse habituellement, qu'il peut donc renvoyer vers l'œil.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$La voiture bleue d'une famille paraît noire, un soir, garée sous un lampadaire de couleur jaune ; sous la lumière du jour, elle est bien bleue. Un enfant de la famille demande une explication de ce changement d'apparence.$$,
      'questions', array[
        $$Cite les trois couleurs primaires de la lumière, dont la superposition donne du blanc.$$,
        $$Quelle est la couleur propre de la voiture, c'est-à-dire la couleur qu'elle diffuse en lumière blanche ?$$,
        $$Sachant que la lumière jaune du lampadaire résulte de la superposition du rouge et du vert (sans bleu), explique pourquoi la voiture paraît noire sous cet éclairage.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quels instruments permettent de décomposer la lumière blanche en un spectre continu de couleurs ?$$,
      'hint', $$Pense à deux exemples cités dans la leçon, l'un en verre, l'un liquide.$$,
      'expected', $$Un prisme, ou un simple verre d'eau (un réseau ou la face gravée d'un CD conviennent aussi).$$
    ),
    jsonb_build_object(
      'question', $$Quelle couleur obtient-on en synthèse additive en superposant du jaune (rouge + vert) et du bleu ?$$,
      'hint', $$Le jaune contient déjà le rouge et le vert ; ajoute le bleu aux trois couleurs primaires.$$,
      'expected', $$On obtient du blanc, car jaune + bleu réunit les trois couleurs primaires rouge, vert et bleu.$$
    ),
    jsonb_build_object(
      'question', $$Un citron, de couleur propre jaune, est éclairé en lumière blanche. Explique pourquoi il paraît jaune.$$,
      'hint', $$Pense à ce que le citron absorbe et à ce qu'il diffuse.$$,
      'expected', $$Le citron absorbe toutes les couleurs de la lumière blanche sauf le jaune, qu'il diffuse vers l'œil : c'est pourquoi il paraît jaune.$$
    ),
    jsonb_build_object(
      'question', $$Une jupe bleue, éclairée par une veilleuse de couleur rouge, paraît noire. Explique pourquoi.$$,
      'hint', $$La jupe ne peut diffuser que le bleu ; est-ce que la lumière rouge en contient ?$$,
      'expected', $$La jupe ne peut diffuser que le bleu, sa couleur propre, or la lumière rouge de la veilleuse ne contient pas de bleu : la jupe n'a donc rien à diffuser et paraît noire.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-analyse-synthese-lumiere-blanche';
