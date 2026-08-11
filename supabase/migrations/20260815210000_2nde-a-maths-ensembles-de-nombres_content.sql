-- FALLBACK content. lyc.ecole-ci.org categoryid=99 (Mathématiques, Seconde A)
-- lists only one real lesson ("Calculs numériques" — see
-- 20260815200000_2nde-a-maths-calculs-numeriques_content.sql for the
-- verification that its apparent "L2" is a byte-identical duplicate, not a
-- second lesson). This lesson complements the official Ivorian Seconde A
-- programme (Compétence 1, Thème 1: Ensembles de nombres) with original,
-- general-knowledge content adapted to the série A (littéraire) level:
-- the sets N, Z, D, Q, R, their inclusions, and intervals of ℝ with union
-- and intersection. No source PDF was available for this topic in the
-- category; entirely original wording, examples and exercises.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-maths-ensembles-de-nombres',
  '2nde',
  'A',
  'mathematiques',
  $$Les ensembles de nombres$$,
  2,
  '2nde-a-maths-calculs-numeriques',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un professeur écrit au tableau plusieurs nombres : −5, 3/4, √2, 7, 0, −2,5 et π. Il demande à la classe de les ranger selon leur nature. Deux élèves se disputent : l'un affirme que √2 est « juste un nombre décimal compliqué », l'autre pense qu'il n'a rien à voir avec les autres nombres. Pour trancher, il faut connaître les différents ensembles de nombres et la façon dont ils s'emboîtent les uns dans les autres.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Entiers naturels et entiers relatifs$$,
        'body', $$L'ensemble des entiers naturels, noté ℕ, regroupe les nombres 0, 1, 2, 3, et ainsi de suite, utilisés pour compter. L'ensemble des entiers relatifs, noté ℤ, y ajoute les nombres négatifs comme −1, −2, −3 : c'est l'ensemble ℕ complété par les opposés de ses éléments non nuls.$$,
        'highlights', array[$$entiers naturels$$, $$entiers relatifs$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$ℕ = {0 ; 1 ; 2 ; 3 ; …}. ℤ = {… ; −3 ; −2 ; −1 ; 0 ; 1 ; 2 ; 3 ; …}. Tout entier naturel est un entier relatif.$$),
        'example', jsonb_build_object('statement', $$Le nombre −8 appartient-il à ℕ ? à ℤ ?$$, 'solution', $$−8 n'appartient pas à ℕ (les entiers naturels sont positifs ou nuls), mais −8 appartient à ℤ.$$),
        'fixation', jsonb_build_object('question', $$Le nombre 12 appartient-il à ℕ ? à ℤ ?$$, 'solution', $$12 appartient à ℕ et donc aussi à ℤ, puisque tout entier naturel est un entier relatif.$$)
      ),
      jsonb_build_object(
        'heading', $$Nombres décimaux et nombres rationnels$$,
        'body', $$Un nombre décimal est un nombre qui s'écrit avec un nombre fini de chiffres après la virgule, comme 2,5 ou −3,17 ; l'ensemble des décimaux se note 𝔻. Un nombre rationnel est un nombre qui peut s'écrire comme un quotient de deux entiers, le dénominateur étant non nul ; l'ensemble des rationnels se note ℚ. Tout décimal est rationnel, mais certains rationnels, comme 1/3, ne sont pas décimaux car leur écriture décimale ne s'arrête jamais.$$,
        'highlights', array[$$nombres décimaux$$, $$nombres rationnels$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$𝔻 est l'ensemble des nombres qui s'écrivent avec un nombre fini de décimales. ℚ est l'ensemble des nombres qui s'écrivent sous la forme p/q, avec p entier relatif et q entier naturel non nul. Tout élément de 𝔻 est élément de ℚ.$$),
        'example', jsonb_build_object('statement', $$Le nombre 1/3 est-il décimal ? est-il rationnel ?$$, 'solution', $$1/3 = 0,333… a une infinité de décimales : il n'est pas décimal. Mais il s'écrit comme le quotient de deux entiers, donc il est rationnel.$$),
        'fixation', jsonb_build_object('question', $$Le nombre 7/2 est-il décimal ?$$, 'solution', $$7/2 = 3,5, qui a un nombre fini de décimales : 7/2 est donc décimal (et rationnel).$$)
      ),
      jsonb_build_object(
        'heading', $$Nombres réels et nombres irrationnels$$,
        'body', $$Certains nombres, comme √2 ou π, ne peuvent s'écrire ni comme une fraction ni avec un nombre fini ou périodique de décimales : on les appelle des nombres irrationnels. L'ensemble formé par les rationnels et les irrationnels s'appelle l'ensemble des nombres réels, noté ℝ.$$,
        'highlights', array[$$nombres irrationnels$$, $$nombres réels$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$ℝ est l'ensemble de tous les nombres rationnels et irrationnels. √2, √3 et π sont des exemples de nombres irrationnels : ils appartiennent à ℝ mais pas à ℚ.$$),
        'example', jsonb_build_object('statement', $$Le nombre √9 est-il irrationnel ?$$, 'solution', $$√9 = 3, qui est un entier, donc rationnel : √9 n'est pas irrationnel, même si son écriture contient un radical.$$),
        'fixation', jsonb_build_object('question', $$Le nombre √2 est-il un nombre décimal ?$$, 'solution', $$Non : √2 est irrationnel, donc il ne s'écrit ni comme une fraction ni avec un nombre fini de décimales.$$)
      ),
      jsonb_build_object(
        'heading', $$Inclusions entre les ensembles de nombres$$,
        'body', $$Ces cinq ensembles s'emboîtent les uns dans les autres, du plus restreint au plus large : tout entier naturel est un entier relatif, tout entier relatif est décimal, tout décimal est rationnel, et tout rationnel est réel. On résume cette chaîne d'inclusions par une seule ligne.$$,
        'highlights', array[$$inclusion$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$ℕ ⊂ ℤ ⊂ 𝔻 ⊂ ℚ ⊂ ℝ. Les nombres irrationnels sont les éléments de ℝ qui n'appartiennent pas à ℚ.$$),
        'example', jsonb_build_object('statement', $$Le nombre −4 appartient-il à 𝔻 ? à ℚ ? à ℝ ?$$, 'solution', $$−4 est un entier relatif, donc décimal, donc rationnel, donc réel : il appartient bien à 𝔻, à ℚ et à ℝ.$$),
        'fixation', jsonb_build_object('question', $$Range le nombre 5/4 dans les ensembles auxquels il appartient parmi ℕ, ℤ, 𝔻, ℚ, ℝ.$$, 'solution', $$5/4 = 1,25 est décimal, donc il appartient à 𝔻, ℚ et ℝ, mais pas à ℕ ni à ℤ (il n'est pas entier).$$)
      ),
      jsonb_build_object(
        'heading', $$Intervalles de ℝ$$,
        'body', $$Un intervalle est une partie de ℝ formée de tous les nombres compris entre deux bornes. Le crochet est tourné vers l'intervalle quand la borne est incluse, et vers l'extérieur quand elle est exclue. On utilise aussi des intervalles non bornés, avec +∞ ou −∞, toujours notés avec un crochet tourné vers l'extérieur.$$,
        'highlights', array[$$intervalle$$, $$borne incluse$$, $$borne exclue$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Notation$$, $$Signification$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$[a ; b]$$, $$Tous les réels x tels que a ≤ x ≤ b (a et b inclus)$$),
            jsonb_build_array($$]a ; b[$$, $$Tous les réels x tels que a < x < b (a et b exclus)$$),
            jsonb_build_array($$[a ; b[$$, $$Tous les réels x tels que a ≤ x < b (a inclus, b exclu)$$),
            jsonb_build_array($$[a ; +∞[$$, $$Tous les réels x tels que x ≥ a$$),
            jsonb_build_array($$]−∞ ; a[$$, $$Tous les réels x tels que x < a$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Traduis par un intervalle : « tous les réels x tels que −2 < x ≤ 5 ».$$, 'solution', $$Cet ensemble se note ]−2 ; 5].$$),
        'fixation', jsonb_build_object('question', $$Traduis par un intervalle : « tous les réels x tels que x < 3 ».$$, 'solution', $$Cet ensemble se note ]−∞ ; 3[.$$)
      ),
      jsonb_build_object(
        'heading', $$Union et intersection d'intervalles$$,
        'body', $$L'union de deux intervalles regroupe tous les nombres appartenant à l'un ou à l'autre (ou aux deux). L'intersection ne garde que les nombres communs aux deux intervalles ; si aucun nombre n'est commun, l'intersection est l'ensemble vide, noté ∅.$$,
        'highlights', array[$$union$$, $$intersection$$, $$ensemble vide$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$A ∪ B (union) contient les éléments de A, ceux de B, ou des deux. A ∩ B (intersection) ne contient que les éléments communs à A et à B.$$),
        'example', jsonb_build_object('statement', $$Détermine [1 ; 6] ∩ [4 ; 9].$$, 'solution', $$Les nombres communs aux deux intervalles vont de 4 à 6, donc [1 ; 6] ∩ [4 ; 9] = [4 ; 6].$$),
        'fixation', jsonb_build_object('question', $$Détermine ]−∞ ; 2] ∪ [0 ; +∞[.$$, 'solution', $$Comme les deux intervalles se chevauchent entre 0 et 2, leur union couvre tout ℝ : ]−∞ ; 2] ∪ [0 ; +∞[ = ℝ.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour un contrôle qualité, une usine accepte une pièce mécanique si son diamètre d (en mm) vérifie d ∈ [19,8 ; 20,2], et un second test impose d ∈ ]19,5 ; 20[ pour un usage plus exigeant. Un technicien veut savoir quelles pièces satisfont les deux exigences à la fois.$$,
      'questions', array[
        $$Rappelle ce que signifie chacun des deux intervalles [19,8 ; 20,2] et ]19,5 ; 20[.$$,
        $$Détermine l'intersection de ces deux intervalles.$$,
        $$Une pièce de diamètre exactement 20 mm satisfait-elle les deux exigences ? Justifie à l'aide de ton résultat.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Le nombre −9 appartient-il à ℕ ? à ℤ ? Justifie.$$,
      'hint', $$Relis la définition de ℕ : ses éléments sont positifs ou nuls.$$,
      'expected', $$−9 n'appartient pas à ℕ car ℕ ne contient que des nombres positifs ou nuls, mais −9 appartient à ℤ.$$
    ),
    jsonb_build_object(
      'question', $$Le nombre 2/7 est-il décimal ? Justifie.$$,
      'hint', $$Effectue la division et regarde si elle s'arrête.$$,
      'expected', $$2/7 = 0,285714285714… a une infinité de décimales qui se répètent : 2/7 n'est pas décimal, bien qu'il soit rationnel.$$
    ),
    jsonb_build_object(
      'question', $$Range le nombre √16 parmi les ensembles ℕ, ℤ, 𝔻, ℚ, ℝ auxquels il appartient.$$,
      'hint', $$Calcule d'abord la valeur exacte de √16.$$,
      'expected', $$√16 = 4, qui est un entier naturel, donc √16 appartient à ℕ, ℤ, 𝔻, ℚ et ℝ.$$
    ),
    jsonb_build_object(
      'question', $$Détermine [2 ; 8[ ∩ ]5 ; 10].$$,
      'hint', $$Représente les deux intervalles sur une droite graduée pour repérer la zone commune.$$,
      'expected', $$La zone commune va de 5 (exclu, car exclu dans le second intervalle) à 8 (exclu, car exclu dans le premier) : [2 ; 8[ ∩ ]5 ; 10] = ]5 ; 8[.$$
    )
  ),
  now()
);
