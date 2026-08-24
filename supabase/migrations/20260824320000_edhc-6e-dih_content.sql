-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 3 : LE DROIT INTERNATIONAL HUMANITAIRE ET LA
-- PRÉSERVATION DE LA DIGNITÉ HUMAINE" (id 1728). Contenu réécrit à partir
-- du PDF source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$L'administration de ton établissement a accueilli des enfants déplacés de guerre, répartis dans les classes, ce qui oblige certains élèves à s'asseoir à 3 ou 4 par table-banc. Face à ces conditions difficiles, un groupe d'élèves préfère prendre contact avec la Croix-Rouge pour s'informer sur le Droit International Humanitaire (DIH).$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et règles du DIH$$,
        'body', $$Le Droit International Humanitaire (DIH) est un ensemble de règles qui protègent les personnes sans défense pendant les conflits armés et limite les moyens et méthodes utilisés pendant la guerre. Ces règles ont été fixées par la Convention de Genève signée le 22 août 1864. Elles concernent l'assistance aux populations vulnérables, aux civils, aux prisonniers, et le rapprochement familial. Elles interdisent notamment : l'utilisation des enfants comme soldats, l'utilisation d'armes non conventionnelles (mines antipersonnelles, armes chimiques), les attaques contre les civils et leurs biens, et les tortures ou traitements inhumains des prisonniers de guerre.$$,
        'highlights', array[$$DIH = règles protégeant les personnes sans défense pendant les conflits armés (Convention de Genève, 22 août 1864)$$, $$interdit : enfants-soldats, armes non conventionnelles, attaques sur civils, torture des prisonniers$$]::text[],
        'fixation', jsonb_build_object('question', $$Que protège le DIH pendant les conflits armés ?$$, 'solution', $$Les personnes sans défense (civils, prisonniers, blessés) et il limite les moyens et méthodes de guerre.$$)
      ),
      jsonb_build_object(
        'heading', $$Historique du DIH$$,
        'body', $$Les textes du DIH ont évolué selon les besoins liés aux types de conflits : en 1863, création du Comité International de Secours, qui devient la Croix-Rouge ; le 22 août 1864, adoption de la réglementation des conflits internationaux ; le 12 août 1949, adoption de la réglementation des guerres civiles ; le 8 juin 1977, adoption des règles de protection des victimes des conflits armés internationaux.$$,
        'highlights', array[$$1863 : Comité International de Secours → Croix-Rouge$$, $$1864 (conflits internationaux) → 1949 (guerres civiles) → 1977 (protection des victimes)$$]::text[],
        'example', jsonb_build_object('statement', $$Quel événement de 1863 est à l'origine du DIH moderne ?$$, 'solution', $$La création du Comité International de Secours, qui deviendra la Croix-Rouge.$$),
        'fixation', jsonb_build_object('question', $$Quel texte, adopté le 12 août 1949, concerne les guerres civiles ?$$, 'solution', $$La réglementation des guerres civiles (Conventions de Genève de 1949).$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance du DIH$$,
        'body', $$Le DIH protège toutes les victimes et réduit les atrocités et souffrances causées par la guerre. Les sanctions qu'il prévoit permettent de punir et de décourager les auteurs de crimes de guerre. En définitive, le DIH contribue à protéger et à valoriser l'être humain, en réglementant les moyens et méthodes de guerre et en limitant les excès dans les conflits armés, ce qui préserve la dignité humaine.$$,
        'highlights', array[$$le DIH protège les victimes, punit/décourage les crimes de guerre, préserve la dignité humaine$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les sanctions prévues par le DIH sont-elles importantes ?$$, 'solution', $$Elles permettent de punir et de décourager les auteurs de crimes de guerre.$$),
        'fixation', jsonb_build_object('question', $$En une phrase, à quoi sert le DIH ?$$, 'solution', $$Il protège les personnes qui ne participent pas ou plus aux combats et réglemente les moyens et méthodes de guerre, préservant ainsi la dignité humaine.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le Haut-Commissariat des réfugiés (HCR) a installé un camp pour des déplacés ayant fui des zones de guerre, à proximité de chez toi. Une nuit, certains de tes camarades du quartier décident d'aller piller les provisions stockées dans un petit magasin de ce camp, et te demandent de te joindre à eux.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Rappelle l'importance du DIH.$$,
        $$Justifie ton refus de participer à ce pillage.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Parmi ces pratiques, laquelle respecte les règles du DIH : "tuer tous les ennemis capturés" ou "ne jamais s'attaquer aux femmes, aux enfants et aux personnes âgées" ?$$,
      'hint', $$Une seule protège les personnes vulnérables.$$,
      'expected', $$"Ne jamais s'attaquer aux femmes, aux enfants et aux personnes âgées."$$
    ),
    jsonb_build_object(
      'question', $$Vrai ou faux : les règles du DIH interdisent l'utilisation des enfants comme soldats.$$,
      'hint', $$C'est l'une des interdictions principales du DIH.$$,
      'expected', $$Vrai.$$
    ),
    jsonb_build_object(
      'question', $$Vrai ou faux : les règles du DIH autorisent la pose de mines antipersonnelles.$$,
      'hint', $$Ce sont des armes non conventionnelles.$$,
      'expected', $$Faux — elles sont interdites.$$
    ),
    jsonb_build_object(
      'question', $$Quelle définition du DIH est correcte : "règles qui protègent les combattants" ou "règles qui limitent les moyens utilisés en temps de conflits armés" ?$$,
      'hint', $$Le DIH protège surtout les non-combattants.$$,
      'expected', $$"Règles qui visent à limiter les moyens utilisés en temps de conflits armés."$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-dih';
