-- Physique-Chimie 3ème — Les forces.
-- Grounded in the real ecole-ci.org PDF for this lesson (Collège Numérique,
-- Physique-Chimie 3ème, cours id=1011, resource "PC 3ème_L2_Les forces.pdf",
-- fetched 2026-08-08 via the site's own course navigation). The PDF covers:
-- définition d'une force (mettre en mouvement/modifier/déformer/équilibrer),
-- dynamomètre et newton, caractéristiques et représentation vectorielle du
-- poids (direction verticale, sens haut-bas, P=mg, point d'application =
-- centre de gravité G), la poussée d'Archimède (PA=P-P', PA=masse_liquide
-- déplacé×g, caractéristiques), tension d'un fil, réaction d'un support, et
-- la classification forces de contact/à distance, localisée/répartie.
-- Every sentence below is original wording; no text was copied from the PDF.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Suite à une coupure d'eau, des élèves de 3ème vont puiser de l'eau à la rivière pour se laver. En plongeant le seau, ils remarquent qu'il semble beaucoup moins lourd sous l'eau qu'une fois sorti. Comment expliquer ce phénomène, et plus généralement, comment définir, caractériser et représenter une force ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Notion de force$$,
        'body', $$Une force est une action mécanique capable de mettre un corps en mouvement, de modifier le mouvement d'un corps déjà en mouvement, de déformer un corps, ou de participer à l'équilibre d'un corps. La valeur d'une force se mesure à l'aide d'un dynamomètre et s'exprime en newton (N).$$,
        'highlights', array[$$force$$, $$dynamomètre$$, $$newton$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une force est une action mécanique capable de : mettre en mouvement un corps ; modifier le mouvement d'un corps ; déformer un corps ; participer à l'équilibre d'un corps. Sa valeur se mesure avec un dynamomètre et s'exprime en newton (N).$$),
        'example', jsonb_build_object('statement', $$Un enfant appuie sur une éponge, qui s'écrase, puis pousse un chariot immobile, qui se met à rouler. Quels effets de force reconnais-tu ?$$, 'solution', $$Écraser l'éponge est une déformation ; pousser le chariot immobile met un corps en mouvement : ce sont deux effets possibles d'une force.$$),
        'fixation', jsonb_build_object('question', $$Quel instrument mesure la valeur d'une force, et dans quelle unité s'exprime-t-elle ?$$, 'solution', $$Un dynamomètre, et la valeur s'exprime en newton (N).$$)
      ),
      jsonb_build_object(
        'heading', $$Caractéristiques et représentation d'une force : exemple du poids$$,
        'body', $$Toute force possède quatre caractéristiques : une direction, un sens, une valeur et un point d'application. Pour le poids d'un corps, la direction est la verticale du lieu, le sens va du haut vers le bas, la valeur se calcule par P=m×g ou se mesure au dynamomètre, et le point d'application est le centre de gravité du corps, noté G. Le poids se représente par un vecteur noté P⃗, tracé verticalement vers le bas à partir de G, avec une longueur proportionnelle à sa valeur selon une échelle choisie.$$,
        'highlights', array[$$direction$$, $$sens$$, $$valeur$$, $$point d'application$$, $$centre de gravité$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les caractéristiques du poids sont : direction = verticale du lieu ; sens = du haut vers le bas ; valeur = P=m×g (mesurable aussi au dynamomètre) ; point d'application = centre de gravité G du corps.$$),
        'example', jsonb_build_object('statement', $$Donne les caractéristiques du poids d'un solide de masse m=20 kg (g=10 N/kg).$$, 'solution', $$Valeur : P=m×g=20×10=200 N. Direction : verticale du lieu. Sens : du haut vers le bas. Point d'application : le centre de gravité G du solide.$$),
        'fixation', jsonb_build_object('question', $$Un vecteur-poids est tracé à l'échelle 1 cm pour 25 N pour un solide de masse 5 kg (g=10 N/kg). Quelle longueur doit avoir ce vecteur ?$$, 'solution', $$P=m×g=5×10=50 N ; 50÷25=2, donc le vecteur mesure 2 cm.$$)
      ),
      jsonb_build_object(
        'heading', $$La poussée d'Archimède$$,
        'body', $$La poussée d'Archimède est la force exercée par un liquide sur tout corps qui y est immergé. Quand un solide accroché à un dynamomètre est plongé dans un liquide, l'indication du dynamomètre diminue : le poids réel P (hors du liquide) devient un poids apparent P' (dans le liquide), et la différence PA=P-P' est la valeur de la poussée d'Archimède. On montre qu'elle est égale au poids du liquide déplacé : PA=mL×g=aL×VL×g, où aL est la masse volumique du liquide et VL le volume déplacé (égal au volume immergé du solide).$$,
        'highlights', array[$$poussée d'Archimède$$, $$PA = P - P'$$, $$poids du liquide déplacé$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$PA = P - P' = mL × g = aL × VL × g. Caractéristiques de la poussée d'Archimède : point d'application = centre de poussée ; direction = verticale ; sens = du bas vers le haut ; valeur = poids du liquide déplacé.$$),
        'example', jsonb_build_object('statement', $$Une boule pèse 2,8 N dans l'air et 2,3 N une fois immergée dans l'eau. Calcule la poussée d'Archimède.$$, 'solution', $$PA = P - P' = 2,8 - 2,3 = 0,5 N.$$),
        'fixation', jsonb_build_object('question', $$Un solide immergé déplace 40 cm³ d'eau (a_eau=1 g/cm³, g=10 N/kg). Calcule la poussée d'Archimède.$$, 'solution', $$mL = 1×40 = 40 g = 0,04 kg ; PA = mL×g = 0,04×10 = 0,4 N.$$)
      ),
      jsonb_build_object(
        'heading', $$Autres forces et classification des forces$$,
        'body', $$La tension d'un fil, notée T⃗, est la force exercée par un fil tendu sur un solide, dirigée du solide vers le fil. La réaction d'un support, notée R⃗, est la force exercée par un support sur un solide posé dessus. On classe aussi les forces selon qu'elles nécessitent un contact ou non : une force de contact agit par contact direct (tension d'un fil, réaction d'un support, poussée d'Archimède), tandis qu'une force à distance agit sans contact (poids, force magnétique). On distingue enfin les forces à action localisée, qui agissent en un point précis (tension d'un fil), des forces à action répartie, qui agissent sur une surface ou un volume (réaction d'un support, poussée d'Archimède, poids).$$,
        'highlights', array[$$tension d'un fil$$, $$réaction d'un support$$, $$force de contact$$, $$force à distance$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Force de contact : agit par contact (tension d'un fil, réaction d'un support, poussée d'Archimède). Force à distance : agit sans contact (poids, force magnétique). Force à action localisée : agit en un point (tension d'un fil). Force à action répartie : agit en surface ou en volume (réaction d'un support, poussée d'Archimède, poids).$$),
        'example', jsonb_build_object('statement', $$Une lampe est suspendue au plafond par un fil. Quelle force le fil exerce-t-il sur la lampe, et de quel type est-elle ?$$, 'solution', $$Le fil exerce sur la lampe une tension T⃗, dirigée de la lampe vers le fil ; c'est une force de contact, à action localisée.$$),
        'fixation', jsonb_build_object('question', $$Un livre posé sur une table reçoit une force de la table appelée réaction du support. De quel type de force s'agit-il (contact/distance) ?$$, 'solution', $$C'est une force de contact, car la table touche directement le livre.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un solide accroché à un dynamomètre indique un poids de 1,6 N dans l'air. Une fois immergé dans un liquide inconnu, le dynamomètre indique 1,3 N, et le niveau d'un récipient gradué passe de 15 cm³ à 45 cm³ lorsqu'on y plonge le solide. On donne g=10 N/kg, a_eau=1 g/cm³, a_huile=0,9 g/cm³, a_eau salée=1,1 g/cm³.$$,
      'questions', array[
        $$Nomme la grandeur mesurée par le dynamomètre dans l'air, puis celle mesurée dans le liquide.$$,
        $$Calcule la valeur de la poussée d'Archimède, puis le volume et la masse du liquide déplacé.$$,
        $$Détermine la masse volumique du liquide et identifie sa nature.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite les quatre caractéristiques qui décrivent complètement une force.$$,
      'hint', $$Pense à où elle s'applique, dans quelle direction, dans quel sens et avec quelle intensité.$$,
      'expected', $$Le point d'application, la direction, le sens et la valeur (intensité en newtons) de la force.$$
    ),
    jsonb_build_object(
      'question', $$Donne les caractéristiques du poids d'un solide de masse m=15 kg (g=10 N/kg).$$,
      'hint', $$Utilise P=m×g et rappelle-toi de la direction, du sens et du point d'application du poids.$$,
      'expected', $$Valeur : P=15×10=150 N. Direction : verticale du lieu. Sens : du haut vers le bas. Point d'application : le centre de gravité G du solide.$$
    ),
    jsonb_build_object(
      'question', $$Un solide pèse 3,4 N dans l'air et 2,9 N immergé dans l'eau (a_eau=1 g/cm³, g=10 N/kg). Calcule la poussée d'Archimède puis le volume de liquide déplacé.$$,
      'hint', $$PA=P-P', puis VL=mL/aL avec mL=PA/g.$$,
      'expected', $$PA=3,4-2,9=0,5 N ; mL=0,5/10=0,05 kg=50 g ; VL=50/1=50 cm³.$$
    ),
    jsonb_build_object(
      'question', $$Classe ces trois forces selon qu'elles sont de contact ou à distance : la tension d'un fil ; le poids d'un corps ; la réaction d'un support.$$,
      'hint', $$Demande-toi s'il y a un contact direct entre les objets concernés.$$,
      'expected', $$La tension d'un fil et la réaction d'un support sont des forces de contact ; le poids est une force à distance.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-forces';
