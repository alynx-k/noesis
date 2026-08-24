-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- EDHC (categoryid=54).
-- Cours : "Leçon 5 : LA CONSTITUTION DE LA COTE D'IVOIRE ET LA
-- PRESERVATION DE LA PAIX" (id 1722). Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours de sa conférence dans ton établissement, le juge de section a fait référence à la Constitution. Désireux d'en savoir plus sur cet instrument, les élèves présents décident de s'informer sur la Constitution, de la comprendre et d'en appliquer les dispositions.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et composantes de la Constitution$$,
        'body', $$La Constitution est la loi fondamentale qui organise la vie de l'État et de l'administration d'une nation. La Constitution ivoirienne comprend un Préambule (introduction), seize (16) Titres subdivisés en chapitres, quarante-huit (48) Chapitres eux-mêmes subdivisés en articles, et cent quatre-vingt-quatre (184) Articles.$$,
        'highlights', array[$$Constitution = loi fondamentale qui organise la vie de l'État$$, $$structure : préambule → 16 titres → 48 chapitres → 184 articles$$]::text[],
        'fixation', jsonb_build_object('question', $$Combien de titres comporte la Constitution ivoirienne ?$$, 'solution', $$Seize (16) titres.$$)
      ),
      jsonb_build_object(
        'heading', $$Le rôle de la Constitution$$,
        'body', $$La Constitution ivoirienne a pour rôle d'organiser la vie de l'État, de préciser le principe de gouvernement, d'énoncer les droits et devoirs des citoyens, et de définir les rapports entre les différents pouvoirs (exécutif, législatif, judiciaire). Elle définit aussi les compétences des différents organes de l'État.$$,
        'highlights', array[$$rôles : organiser l'État, préciser le régime, énoncer droits/devoirs, régler les rapports entre pouvoirs$$]::text[],
        'example', jsonb_build_object('statement', $$"La Constitution recommande la construction des routes" : est-ce vrai ou faux, selon ses rôles réels ?$$, 'solution', $$Faux — ce n'est pas un rôle de la Constitution, qui organise l'État et les pouvoirs, pas les infrastructures.$$),
        'fixation', jsonb_build_object('question', $$Quels trois pouvoirs la Constitution règle-t-elle les rapports entre eux ?$$, 'solution', $$Les pouvoirs exécutif, législatif et judiciaire.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance du respect de la Constitution$$,
        'body', $$Le respect de la Constitution favorise la stabilité politique, l'épanouissement social et économique des citoyens, et la prospérité du pays. Son respect garantit également la paix, l'harmonie sociale et la justice.$$,
        'highlights', array[$$stabilité politique + épanouissement social/économique + prospérité du pays$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi le respect de la Constitution favorise-t-il la prospérité du pays ?$$, 'solution', $$Parce qu'il garantit la stabilité politique, condition nécessaire au développement économique et social.$$),
        'fixation', jsonb_build_object('question', $$Cite deux effets positifs du respect de la Constitution.$$, 'solution', $$Par exemple : la stabilité politique et la prospérité du pays (deux parmi stabilité politique, épanouissement social/économique, prospérité).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un débat télévisé, un juge a déploré le non-respect des lois par de nombreux citoyens. Les élèves de ta classe décident de mener une campagne de sensibilisation sur le respect de la Constitution et te demandent de t'associer à eux.$$,
      'questions', array[
        $$Identifie le problème posé.$$,
        $$Cite deux rôles de la Constitution.$$,
        $$Justifie ta participation à cette campagne.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complète : "La Constitution ivoirienne est composée d'un ______, de ______, de ______ et d'______."$$,
      'hint', $$Utilise préambule, titres, chapitres, articles.$$,
      'expected', $$"...d'un préambule, de titres, de chapitres et d'articles."$$
    ),
    jsonb_build_object(
      'question', $$"La Constitution définit pour chaque citoyen la quantité de richesses" : est-ce un rôle réel de la Constitution ?$$,
      'hint', $$Ce n'est pas cité parmi ses rôles.$$,
      'expected', $$Non, ce n'est pas un rôle de la Constitution.$$
    ),
    jsonb_build_object(
      'question', $$Parmi "éviter les échecs scolaires" et "préserver la paix", laquelle justifie l'importance du respect de la Constitution ?$$,
      'hint', $$Une seule est directement liée à la Constitution.$$,
      'expected', $$"Préserver la paix."$$
    ),
    jsonb_build_object(
      'question', $$Combien d'articles compte la Constitution ivoirienne ?$$,
      'hint', $$C'est un nombre à trois chiffres.$$,
      'expected', $$184 articles.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-6e-constitution-cote-ivoire';
