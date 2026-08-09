-- Rewritten from the REAL ecole-ci.org PDF: "4e_Maths leçon 5 Calcul
-- Litteral" (Collège Numérique, Thème "Calculs algébriques", Leçon 5,
-- course id 1991, resource id 16188, downloaded from coll.ecole-ci.org and
-- read directly). The real lesson is richer than the earlier fallback: it
-- covers suppression de parenthèses, priorités opératoires, développement
-- de a(x+y) and (a+b)(x+y), the three produits remarquables, and
-- factorisation (facteur commun + produits remarquables) — all confirmed
-- as genuine 4ème content by this PDF. Every sentence, example and
-- exercise below is an original composition in our own wording — no
-- sentence is copied verbatim from the source PDF. No diagram: purely
-- algebraic lesson.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dès la rentrée de septembre, un élève de 4ème dépose 1500 F dans sa tirelire. Chaque mois suivant, il y ajoute une pièce de 250 F économisée sur son argent de poche. Il aimerait écrire une formule unique qui donne directement le montant de son épargne au bout de n mois, sans refaire le calcul à la main chaque fois — c'est exactement ce que permet le calcul littéral.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Expressions littérales et suppression de parenthèses$$,
        'body', $$Une expression littérale contient une ou plusieurs lettres représentant des nombres. Dans une somme algébrique, on peut supprimer une parenthèse précédée d'un signe + sans rien changer aux termes qu'elle contient ; en revanche, si elle est précédée d'un signe −, il faut changer le signe de chacun de ses termes en la supprimant.$$,
        'highlights', array[$$expression littérale$$, $$suppression de parenthèses$$]::text[],
        'property', jsonb_build_object('label', $$Règles$$, 'text', $$Règle 1 : une parenthèse précédée du signe + (ou d'aucun signe) se supprime sans changer les signes de ses termes. Règle 2 : une parenthèse précédée du signe − se supprime en changeant le signe de chacun de ses termes.$$),
        'example', jsonb_build_object('statement', $$Écris sans parenthèses : x − (3a − b) − (−m + t).$$, 'solution', $$x − (3a − b) − (−m + t) = x − 3a + b + m − t.$$),
        'fixation', jsonb_build_object('question', $$Écris sans parenthèses : (5 − 2a) + (−c + 3) − a.$$, 'solution', $$(5 − 2a) + (−c + 3) − a = 5 − 2a − c + 3 − a = 8 − 3a − c.$$)
      ),
      jsonb_build_object(
        'heading', $$Développement d'un produit$$,
        'body', $$Développer un produit consiste à l'écrire sous la forme d'une somme. Pour un facteur unique multipliant une parenthèse, on distribue ce facteur à chaque terme. Pour deux parenthèses de deux termes chacune, chaque terme de la première se multiplie par chaque terme de la seconde.$$,
        'highlights', array[$$développer$$, $$distributivité$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$a(x+y) = ax+ay et a(x−y) = ax−ay. Pour deux parenthèses : (a+b)(x+y) = ax+ay+bx+by.$$),
        'example', jsonb_build_object('statement', $$Développe (x+4)(y−3).$$, 'solution', $$(x+4)(y−3) = xy − 3x + 4y − 12.$$),
        'fixation', jsonb_build_object('question', $$Développe −3(2x − 5).$$, 'solution', $$−3(2x−5) = −3×2x − 3×(−5) = −6x + 15.$$)
      ),
      jsonb_build_object(
        'heading', $$Produits remarquables$$,
        'body', $$Trois développements reviennent si souvent qu'on les appelle produits remarquables : le carré d'une somme, le carré d'une différence, et le produit d'une somme par une différence. Les connaître par cœur évite de redévelopper à chaque fois terme à terme.$$,
        'highlights', array[$$produits remarquables$$]::text[],
        'property', jsonb_build_object('label', $$Propriétés$$, 'text', $$(a+b)² = a² + 2ab + b² ; (a−b)² = a² − 2ab + b² ; (a+b)(a−b) = a² − b².$$),
        'example', jsonb_build_object('statement', $$Développe (x+6)² et (x+9)(x−9).$$, 'solution', $$(x+6)² = x² + 2×x×6 + 6² = x² + 12x + 36. (x+9)(x−9) = x² − 9² = x² − 81.$$),
        'fixation', jsonb_build_object('question', $$Développe (x−5)².$$, 'solution', $$(x−5)² = x² − 2×x×5 + 5² = x² − 10x + 25.$$)
      ),
      jsonb_build_object(
        'heading', $$Factorisation$$,
        'body', $$Factoriser une somme, c'est l'écrire sous forme d'un produit de facteurs — l'opération inverse du développement. On peut soit mettre en évidence un facteur commun à tous les termes, soit reconnaître la forme d'un produit remarquable pour revenir directement à sa forme factorisée.$$,
        'highlights', array[$$factoriser$$, $$facteur commun$$]::text[],
        'property', jsonb_build_object('label', $$Méthodes$$, 'text', $$Facteur commun : ka+kb = k(a+b). Produits remarquables à l'envers : a²+2ab+b² = (a+b)² ; a²−2ab+b² = (a−b)² ; a²−b² = (a+b)(a−b).$$),
        'example', jsonb_build_object('statement', $$Factorise A = 8x² − 20x, puis B = x² + 16x + 64.$$, 'solution', $$A = 4x×2x − 4x×5 = 4x(2x−5). B = x² + 2×x×8 + 8² = (x+8)².$$),
        'fixation', jsonb_build_object('question', $$Factorise C = x² − 49.$$, 'solution', $$C = x² − 7² = (x+7)(x−7).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un collège veut clôturer un terrain rectangulaire de longueur (x+y) et de largeur z avec un grillage, en prévoyant une porte en bois de 1 m de large. La porte coûte 12 000 F et le mètre de grillage coûte 1 800 F.$$,
      'questions', array[
        $$Justifie que le périmètre du terrain s'écrit 2(x+y) + 2z, puis calcule-le pour x = 12 m, y = 28 m et z = 18 m.$$,
        $$Sachant que la longueur de grillage nécessaire est (périmètre − 1), exprime puis calcule le coût total C des travaux (grillage + porte).$$,
        $$Le trésorier de la coopérative dispose de 130 000 F. Cette somme suffit-elle pour financer les travaux ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Écris sans parenthèses l'expression 9 − (2x − 5) + (−y + 1).$$,
      'hint', $$Change les signes des termes de la parenthèse précédée d'un −, garde ceux de la parenthèse précédée d'un +.$$,
      'expected', $$9 − (2x − 5) + (−y + 1) = 9 − 2x + 5 − y + 1 = 15 − 2x − y.$$
    ),
    jsonb_build_object(
      'question', $$Développe et réduis (x+3)(x−7).$$,
      'hint', $$Multiplie chaque terme de la première parenthèse par chaque terme de la seconde, puis regroupe les termes semblables.$$,
      'expected', $$(x+3)(x−7) = x² − 7x + 3x − 21 = x² − 4x − 21.$$
    ),
    jsonb_build_object(
      'question', $$Développe (2x−3)² à l'aide d'un produit remarquable.$$,
      'hint', $$Utilise (a−b)² = a² − 2ab + b² avec a = 2x et b = 3.$$,
      'expected', $$(2x−3)² = (2x)² − 2×2x×3 + 3² = 4x² − 12x + 9.$$
    ),
    jsonb_build_object(
      'question', $$Factorise D = 5x(x+2) − (x+2), puis calcule sa valeur pour x = 4.$$,
      'hint', $$Repère le facteur commun (x+2) dans les deux termes de D.$$,
      'expected', $$D = (x+2)(5x−1). Pour x=4 : D = (4+2)(5×4−1) = 6×19 = 114.$$
    )
  ),
  content_generated_at = now()
where id = 'maths-4e-calcul-litteral';
