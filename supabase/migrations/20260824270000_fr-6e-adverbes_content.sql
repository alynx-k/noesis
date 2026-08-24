-- FALLBACK CONTENT : cette leçon ("Les adverbes", Grammaire) n'existe pas
-- comme cours distinct sur coll.ecole-ci.org (Collège Numérique) — la
-- catégorie Grammaire s'arrête à la leçon 5 (le groupe verbal) et ne
-- couvre les adverbes que sous l'angle du doublement de consonne des
-- adverbes en "-ment" (déjà utilisé dans fr-6e-orthographe-lexicale).
-- Écrit à partir de la connaissance générale du programme officiel MENA
-- de 6ème, en reprenant le même registre pédagogique (situation
-- d'apprentissage, définitions, exemples) que les leçons réelles
-- voisines.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En corrigeant leurs rédactions, des élèves de 6ème remarquent que leur professeur souligne souvent des mots invariables qui précisent le sens d'un verbe ou d'un adjectif. Ils s'organisent pour identifier ces mots, les classer et les utiliser correctement.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et rôle de l'adverbe$$,
        'body', $$L'adverbe est un mot invariable qui modifie le sens d'un verbe, d'un adjectif, d'un autre adverbe ou d'une phrase entière. Contrairement au nom ou à l'adjectif, il ne s'accorde jamais en genre ni en nombre. Exemple : "Il court vite" (l'adverbe "vite" précise comment il court) ; "Elle est très intelligente" (l'adverbe "très" précise le degré de l'adjectif).$$,
        'highlights', array[$$adverbe = mot invariable qui précise un verbe, un adjectif, un autre adverbe ou une phrase$$, $$ne s'accorde jamais$$]::text[],
        'fixation', jsonb_build_object('question', $$Un adverbe peut-il s'accorder en genre et en nombre ?$$, 'solution', $$Non, l'adverbe est toujours invariable.$$)
      ),
      jsonb_build_object(
        'heading', $$Les catégories d'adverbes$$,
        'body', $$On distingue plusieurs catégories selon leur sens : adverbes de manière ("bien", "mal", "vite", et ceux en "-ment" comme "rapidement") ; adverbes de temps ("hier", "aujourd'hui", "bientôt", "toujours") ; adverbes de lieu ("ici", "là", "dehors", "partout") ; adverbes de quantité/intensité ("beaucoup", "peu", "très", "assez") ; adverbes d'affirmation et de négation ("oui", "non", "ne...pas", "jamais").$$,
        'highlights', array[$$manière (bien, vite, -ment) ; temps (hier, bientôt) ; lieu (ici, là)$$, $$quantité (beaucoup, très) ; affirmation/négation (oui, non, ne...pas)$$]::text[],
        'example', jsonb_build_object('statement', $$Dans "Il viendra bientôt", quelle est la catégorie de l'adverbe "bientôt" ?$$, 'solution', $$Un adverbe de temps.$$),
        'fixation', jsonb_build_object('question', $$Donne un adverbe de lieu.$$, 'solution', $$Par exemple : ici, là, dehors, partout, ailleurs (un au choix).$$)
      ),
      jsonb_build_object(
        'heading', $$La formation des adverbes en "-ment"$$,
        'body', $$De nombreux adverbes de manière se forment à partir d'un adjectif qualificatif au féminin + "-ment" : "lent" → "lente" → "lentement" ; "heureux" → "heureuse" → "heureusement". Pour les adjectifs terminés par une voyelle au masculin, on ajoute "-ment" directement au masculin : "vrai" → "vraiment" ; "poli" → "poliment". Pour les adjectifs en "-ent" ou "-ant", la consonne double souvent : "prudent" → "prudemment" ; "courant" → "couramment".$$,
        'highlights', array[$$adjectif féminin + -ment (lente → lentement)$$, $$adjectif en -ent/-ant → -emment/-amment (prudent → prudemment)$$]::text[],
        'example', jsonb_build_object('statement', $$Forme l'adverbe à partir de l'adjectif "doux" (féminin : douce).$$, 'solution', $$"Doucement."$$),
        'fixation', jsonb_build_object('question', $$Forme l'adverbe à partir de "vrai".$$, 'solution', $$"Vraiment" (le masculin se termine déjà par une voyelle).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour améliorer un texte descriptif, ton professeur te demande d'enrichir tes phrases avec des adverbes bien choisis.$$,
      'questions', array[
        $$Relève trois adverbes dans un court texte et indique leur catégorie (manière, temps, lieu...).$$,
        $$Forme un adverbe de manière à partir de l'adjectif "joyeux".$$,
        $$Rédige deux phrases utilisant chacune un adverbe de temps différent.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans "Elle parle très fort", quels sont les deux adverbes et leurs catégories ?$$,
      'hint', $$L'un précise l'intensité, l'autre la manière.$$,
      'expected', $$"Très" (adverbe de quantité/intensité) et "fort" (adverbe de manière).$$
    ),
    jsonb_build_object(
      'question', $$Forme l'adverbe à partir de l'adjectif "heureux" (féminin : heureuse).$$,
      'hint', $$Ajoute "-ment" au féminin.$$,
      'expected', $$"Heureusement."$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la catégorie de l'adverbe "jamais" ?$$,
      'hint', $$Il exprime une absence totale.$$,
      'expected', $$Un adverbe de négation.$$
    ),
    jsonb_build_object(
      'question', $$Complète avec un adverbe de lieu : "Range tes affaires ______."$$,
      'hint', $$Pense à "ici" ou "là".$$,
      'expected', $$Par exemple : "Range tes affaires ici." (ou "là", "dehors"...)$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-adverbes';
