-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 11 : L'ENTRETIEN DU CADRE DE VIE ET LA SANTÉ DES
-- POPULATIONS" (id 1706). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une visite à un camarade de classe malade, des élèves constatent que les toilettes dégagent de mauvaises odeurs et que les alentours de la maison servent de dépotoir aux habitants du quartier, attirant de nombreuses mouches. Préoccupés, ils décident de s'informer sur l'entretien du cadre de vie.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le cadre de vie et ses types$$,
        'body', $$Le cadre de vie est un espace aménagé par l'homme pour la satisfaction de ses besoins fondamentaux (habitations, jardin, sanitaires, espaces verts, aires de jeux). On distingue le cadre de vie sain, où les éléments sont bien entretenus et protègent des infections, du cadre de vie insalubre, où les éléments mal entretenus exposent aux infections et maladies. Les pratiques qui rendent un cadre de vie insalubre : ordures ménagères déversées et non ramassées, eaux usées déversées partout, absence de latrines, cour ou espace scolaire non entretenus.$$,
        'highlights', array[$$cadre de vie sain (bien entretenu) vs insalubre (mal entretenu, expose aux maladies)$$, $$pratiques insalubres : ordures/eaux usées déversées, absence de latrines, espaces non entretenus$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui distingue un cadre de vie sain d'un cadre de vie insalubre ?$$, 'solution', $$Le premier est bien entretenu et protège des maladies ; le second est mal entretenu et expose aux infections.$$)
      ),
      jsonb_build_object(
        'heading', $$Conséquences de l'insalubrité et mesures d'entretien$$,
        'body', $$Un cadre de vie insalubre provoque des maladies (paludisme, bilharziose, choléra, fièvre typhoïde), augmente les charges familiales, dégrade la qualité de vie et réduit la capacité de production. Pour l'État, cela signifie de gros investissements pour soigner ces maladies et une capacité d'investissement économique réduite. Les mesures d'entretien : balayer, traiter les ordures, désinfecter et assainir les latrines, curer les caniveaux, utiliser poubelles et toilettes, élaguer les arbres, tondre les pelouses.$$,
        'highlights', array[$$insalubrité → maladies (paludisme, bilharziose, choléra, typhoïde) + charges familiales et étatiques$$, $$entretien : balayer, traiter les ordures, désinfecter les latrines, curer les caniveaux$$]::text[],
        'example', jsonb_build_object('statement', $$La carie dentaire et le diabète sont-ils des maladies liées à l'insalubrité du cadre de vie ?$$, 'solution', $$Non — contrairement au paludisme, à la bilharziose ou à la fièvre typhoïde, ce ne sont pas des maladies liées à l'insalubrité.$$),
        'fixation', jsonb_build_object('question', $$Cite deux maladies liées à l'insalubrité du cadre de vie.$$, 'solution', $$Par exemple : le paludisme et la bilharziose (deux parmi paludisme, bilharziose, choléra, fièvre typhoïde).$$)
      ),
      jsonb_build_object(
        'heading', $$Le matériel d'entretien et les bienfaits de la salubrité$$,
        'body', $$Le matériel d'entretien comprend : le balai, la pelle, la poubelle, le plumeau (enlève la poussière), la brosse, le seau, la serpillière (pour laver et essuyer le sol), les gants, les produits d'entretien, la machette, la daba, le sécateur (pour couper les petites branches), et le râteau. L'entretien du cadre de vie familial, scolaire et communautaire permet de vivre dans un environnement sain, de préserver la santé des populations, et de réaliser des économies.$$,
        'highlights', array[$$matériel : balai, pelle, poubelle, plumeau, brosse, seau, serpillière, gants, sécateur, râteau$$, $$bienfaits : environnement sain + santé préservée + économies réalisées$$]::text[],
        'example', jsonb_build_object('statement', $$À quoi sert le plumeau ?$$, 'solution', $$À enlever la poussière sur la surface des meubles ou des objets.$$),
        'fixation', jsonb_build_object('question', $$Quel outil sert à couper les petites branches des arbres ?$$, 'solution', $$Le sécateur.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une campagne de salubrité a lieu dans ton quartier. Tu décides de mobiliser les jeunes pour y participer, car il y va de la santé des populations. Cependant, l'un de tes camarades te conseille d'abandonner cette activité, estimant que l'assainissement de la voirie est l'affaire des agents de la mairie, pas des jeunes.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Cite trois conséquences du conseil de ton camarade.$$,
        $$Justifie ton refus de suivre ce conseil.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$"Faire les selles dans la nature" rend-il le cadre de vie sain ou insalubre ?$$,
      'hint', $$Ce n'est pas une pratique d'hygiène.$$,
      'expected', $$Insalubre.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux mesures d'entretien du cadre de vie.$$,
      'hint', $$Pense aux actions courantes de nettoyage.$$,
      'expected', $$Par exemple : balayer et traiter les ordures (deux parmi balayer, traiter les ordures, désinfecter les latrines, curer les caniveaux).$$
    ),
    jsonb_build_object(
      'question', $$L'entretien du cadre de vie permet-il d'"accroître certaines infections" ?$$,
      'hint', $$C'est le contraire qui est vrai.$$,
      'expected', $$Non, au contraire, il permet d'éviter les maladies.$$
    ),
    jsonb_build_object(
      'question', $$Quel outil sert à laver et essuyer le sol ?$$,
      'hint', $$C'est un torchon.$$,
      'expected', $$La serpillière.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-entretien-cadre-vie';
