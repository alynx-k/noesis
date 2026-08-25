-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Physique-Chimie (categoryid=51).
-- Cours : "Leçon 4 : Solides et liquides" (id 2092). Contenu réécrit à
-- partir du PDF source ; situation d'apprentissage, définitions et
-- exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Les membres de la coopérative scolaire d'un lycée ramènent périodiquement du marché, pour la cantine, de l'huile, du sel, du riz, de la banane, de la farine, du charbon de bois et de l'igname. Pour réussir le classement de ces produits, ils apprennent avec leur professeur les propriétés des solides et des liquides.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les solides compacts et divisés$$,
        'body', $$Les solides sont des corps qu'on peut saisir entre les doigts. On distingue les solides compacts (formés d'un seul bloc, avec une forme propre : le charbon de bois, la banane, l'igname) et les solides divisés (formés de plusieurs grains, sans forme propre, qui prennent la forme du récipient qui les contient : le sel en poudre, le riz, la farine).$$,
        'highlights', array[$$solide compact = un seul bloc, forme propre (banane, igname)$$, $$solide divisé = plusieurs grains, sans forme propre, prend la forme du récipient (sel, riz, farine)$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui distingue un solide compact d'un solide divisé ?$$, 'solution', $$Le solide compact est formé d'un seul bloc avec une forme propre ; le solide divisé est formé de plusieurs grains, sans forme propre.$$)
      ),
      jsonb_build_object(
        'heading', $$Les liquides et leur surface libre$$,
        'body', $$Les liquides ne peuvent pas être saisis entre les doigts, ils coulent : ce sont des fluides. Comme les solides divisés, ils n'ont pas de forme propre et prennent la forme du récipient qui les contient (huile, eau, jus de fruit, alcool). Ce qui les distingue des solides divisés : au repos, la surface libre d'un liquide est toujours plane et horizontale, alors que la surface libre d'un solide divisé est quelconque (irrégulière, en forme de tas).$$,
        'highlights', array[$$liquide = insaisissable, coule, sans forme propre (fluide)$$, $$surface libre d'un liquide au repos = toujours plane et horizontale$$, $$surface libre d'un solide divisé = quelconque$$]::text[],
        'example', jsonb_build_object('statement', $$Comment distinguer, sans les toucher, si un bécher contient de l'eau ou du sable au repos ?$$, 'solution', $$En observant la surface : celle de l'eau sera plane et horizontale, celle du sable sera irrégulière (formant un petit tas ou une pente).$$),
        'fixation', jsonb_build_object('question', $$Un liquide et un solide divisé partagent-ils une propriété commune ?$$, 'solution', $$Oui : tous deux n'ont pas de forme propre et prennent la forme du récipient qui les contient.$$)
      ),
      jsonb_build_object(
        'heading', $$Les pictogrammes de sécurité$$,
        'body', $$Un pictogramme est un symbole figurant sur les notices et étiquettes des produits de consommation, indiquant leur danger : inflammable, toxique, corrosif, explosif, comburant, dangereux pour l'environnement, irritant/nocif. Une bonne exploitation de ces pictogrammes permet d'éviter tout danger lors de la manipulation de produits chimiques (comme l'essence, l'eau de javel, ou les colles fortes).$$,
        'highlights', array[$$pictogramme = symbole de danger sur notices/étiquettes de produits$$, $$exemples : inflammable, toxique, corrosif, explosif, comburant$$]::text[],
        'example', jsonb_build_object('statement', $$Un camion-citerne transportant de l'essence porte les symboles "flamme" et "explosion". Que signifient-ils ?$$, 'solution', $$Le symbole flamme signifie que le produit est inflammable ; le symbole explosion signifie qu'il est explosif.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi doit-on toujours lire les pictogrammes sur un produit avant de l'utiliser ?$$, 'solution', $$Pour connaître ses dangers (toxicité, inflammabilité, etc.) et se protéger.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un exercice de devoir présente six récipients A, B, C, D, E, F contenant chacun soit un liquide au repos, soit un solide divisé.$$,
      'questions', array[
        $$Nomme le type de verrerie de laboratoire représenté par chaque récipient (bécher, verre à pied, cristallisoir, ballon, erlenmeyer, tube à essai).$$,
        $$Donne les propriétés qui différencient un solide divisé d'un liquide.$$,
        $$Classe les récipients selon qu'ils contiennent un liquide ou un solide divisé, en te basant sur la forme de leur surface libre.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un grain de riz est-il un solide compact ou un solide divisé ?$$,
      'hint', $$Pense à comment on le range dans un sac.$$,
      'expected', $$Un solide divisé (il est formé de nombreux petits grains).$$
    ),
    jsonb_build_object(
      'question', $$Tous les solides ont-ils une forme propre ?$$,
      'hint', $$Pense aux solides divisés.$$,
      'expected', $$Non, seuls les solides compacts ont une forme propre ; les solides divisés n'en ont pas.$$
    ),
    jsonb_build_object(
      'question', $$La surface libre d'un solide divisé au repos est-elle toujours plane et horizontale ?$$,
      'hint', $$C'est une propriété réservée aux liquides.$$,
      'expected', $$Non, elle est quelconque — seule celle d'un liquide au repos est toujours plane et horizontale.$$
    ),
    jsonb_build_object(
      'question', $$Classe : huile, sucre en poudre, pièce de monnaie, miel, sel — en liquides, solides divisés et solides compacts.$$,
      'hint', $$Une pièce de monnaie est saisissable et a une forme fixe.$$,
      'expected', $$Liquides : huile, miel. Solides divisés : sucre en poudre, sel. Solide compact : pièce de monnaie.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-6e-solides-liquides';
