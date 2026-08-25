-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Histoire.
-- Cours : "Leçon 2 : La révolution du néolithique en Côte d'Ivoire"
-- (Thème 2 : La préhistoire de la Côte d'Ivoire). Contenu réécrit à
-- partir du PDF source ; situation d'apprentissage, définitions et
-- exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une sortie-découverte au Musée des Arts et des Civilisations d'Abidjan, l'attention des élèves de 6ème est attirée par des objets aux contours très fins, présentés dans le stand « Néolithique ». De retour en classe, ils décident de mener des recherches pour identifier les sites et les vestiges du néolithique, et caractériser la vie des hommes de cette époque en Côte d'Ivoire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le néolithique et ses vestiges en Côte d'Ivoire$$,
        'body', $$Le néolithique, ou âge de la pierre polie, est la deuxième et dernière période de la préhistoire. Il s'étend de -8000 à -3000 (naissance de l'écriture en Égypte) ; en Côte d'Ivoire, il s'achève vers -1500. Les sites du néolithique sont nombreux et répartis sur tout le territoire (Sud, Centre-Ouest, Centre, Nord, Est, Ouest). Les vestiges sont plus nombreux et variés que ceux du paléolithique : amas de coquillages sur le littoral, grandes dalles à Odienné, grottes à Man et Daloa, haches polies un peu partout, tessons de poterie, et gravures rupestres.$$,
        'highlights', array[$$néolithique = âge de la pierre polie, -8000 à -3000 (Côte d'Ivoire : jusqu'à -1500)$$, $$vestiges plus nombreux et variés qu'au paléolithique : haches polies, poterie, gravures rupestres$$]::text[],
        'fixation', jsonb_build_object('question', $$Que signifie le mot "néolithique" ?$$, 'solution', $$L'âge de la nouvelle pierre, ou l'âge de la pierre polie.$$)
      ),
      jsonb_build_object(
        'heading', $$Les nouvelles activités et le nouveau mode de vie$$,
        'body', $$De nouveaux outils plus fins et moins lourds apparaissent (haches, lames de silex, faucilles, meules, pilons), permettant de nouvelles activités : l'agriculture, l'élevage, l'artisanat et le troc. Les hommes deviennent sédentaires pour veiller sur leurs champs et leurs troupeaux, et construisent des maisons. Ils développent les premières organisations sociales et politiques (familles, villages, chefferies, tribus, royaumes), enterrent leurs morts et développent des pratiques religieuses (culte des ancêtres et des éléments de la nature).$$,
        'highlights', array[$$nouvelles activités : agriculture, élevage, artisanat, troc$$, $$sédentarisation → villages, chefferies, tribus, royaumes$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les hommes du néolithique cessent-ils d'être nomades ?$$, 'solution', $$Parce qu'ils doivent veiller sur leurs champs cultivés et leurs troupeaux ; ils se fixent donc et construisent des maisons.$$),
        'fixation', jsonb_build_object('question', $$Cite deux nouvelles activités apparues au néolithique.$$, 'solution', $$Par exemple : l'agriculture et l'élevage (deux parmi : artisanat, troc).$$)
      ),
      jsonb_build_object(
        'heading', $$Une révolution dans le mode de vie$$,
        'body', $$On parle de « révolution » du néolithique car ce fut une transformation radicale des activités et du mode de vie des hommes, marquant une rupture nette avec le paléolithique : de nomades chasseurs-cueilleurs, ils deviennent des agriculteurs-éleveurs sédentaires, organisés en communautés structurées.$$,
        'highlights', array[$$"révolution" = transformation radicale, rupture avec le mode de vie nomade du paléolithique$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi parle-t-on d'une "révolution" du néolithique plutôt que d'une simple évolution ?$$, 'solution', $$Parce que les changements (sédentarisation, agriculture, élevage, organisation sociale) sont radicaux et transforment profondément le mode de vie des hommes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors de la diffusion d'un documentaire sur la préhistoire en Côte d'Ivoire, des élèves découvrent des haches polies, des gravures rupestres, des amas de coquillages et des débris de poterie retrouvés dans des grottes. Le commentateur affirme que le néolithique est une période de grands bouleversements dans la vie des hommes.$$,
      'questions', array[
        $$Dis de quoi il s'agit dans cette situation.$$,
        $$Relève les vestiges du néolithique mentionnés dans la situation.$$,
        $$Es-tu d'accord avec le commentateur ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Le néolithique ivoirien commence-t-il à -8000 ou à -100 000 ?$$,
      'hint', $$-100 000 correspond au début du paléolithique.$$,
      'expected', $$À -8000.$$
    ),
    jsonb_build_object(
      'question', $$Les hommes du néolithique étaient-ils nomades ou sédentaires ?$$,
      'hint', $$Ils devaient surveiller leurs champs et leur bétail.$$,
      'expected', $$Sédentaires.$$
    ),
    jsonb_build_object(
      'question', $$Cite un vestige du néolithique retrouvé sur le littoral ivoirien.$$,
      'hint', $$Il vient de la mer.$$,
      'expected', $$Un amas de coquillages.$$
    ),
    jsonb_build_object(
      'question', $$Quelle nouvelle forme d'organisation sociale apparaît au néolithique en Côte d'Ivoire ?$$,
      'hint', $$Elle regroupe plusieurs familles.$$,
      'expected', $$Par exemple : le village, la chefferie, la tribu ou le royaume.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-6e-neolithique-cote-ivoire';
