-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- SVT, categoryid=125.
-- Moodle course id 899: "SVT 1ère A_L6_La Transmission d'un caractère lié
-- aux autosomes" (https://lyc.ecole-ci.org/course/view.php?id=899),
-- resource id 4437. Contenu réécrit à partir du PDF source (arbre
-- généalogique de l'albinisme, méthode de test de liaison au sexe,
-- vocabulaire génétique). Faits scientifiques réels (albinisme, méthode
-- de croisement théorique) repris tels quels ; explications reformulées,
-- non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-svt-transmission-caractere-autosomes',
  '1ere',
  'A',
  'svt',
  $$La transmission d'un caractère héréditaire lié aux autosomes$$,
  6,
  '1ere-a-svt-regulation-naissances',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une élève de 1ère A arrive à la rentrée avec ses parents de teint noir comme elle, un frère et une sœur tous deux albinos. Des camarades surpris s'adressent à leur professeur, qui explique que l'albinisme est un caractère héréditaire. Ne sachant rien de ce phénomène, la classe décide de s'informer et de déterminer son mode de transmission.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulaire de génétique$$,
        'body', $$Le gène est une portion d'ADN localisée sur un chromosome, responsable d'un caractère. Un gène peut exister sous plusieurs formes appelées allèles ; tout individu diploïde n'en possède que deux, un sur chaque chromosome homologue, à une position appelée locus. L'ensemble des gènes d'un individu constitue son génotype ; l'ensemble de ses caractères observables constitue son phénotype. Un individu est homozygote si ses deux allèles sont identiques, hétérozygote s'ils sont différents — dans ce cas, l'allèle qui s'exprime est dit dominant, celui qui ne s'exprime pas est récessif.$$,
        'highlights', array[$$gène → allèles → locus$$, $$génotype (gènes) vs phénotype (caractères visibles)$$, $$homozygote vs hétérozygote$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre génotype et phénotype ?$$, 'solution', $$Le génotype est l'ensemble des gènes (et allèles) que possède un individu, tandis que le phénotype est l'ensemble de ses caractères observables, apparents, déterminés par ce génotype.$$)
      ),
      jsonb_build_object(
        'heading', $$L'analyse d'un arbre généalogique (pédigrée)$$,
        'body', $$Dans une famille étudiée, un couple d'apparence normale (sains) a eu 5 enfants dont 3 albinos. Puisque des parents sains ont pu avoir des enfants malades, les parents portent nécessairement l'allèle de l'albinisme sous forme masquée : ils sont hétérozygotes. L'allèle responsable de l'albinisme est donc récessif, et l'allèle normal est dominant. On note l'allèle normal A et l'allèle albinos a.$$,
        'highlights', array[$$parents sains + enfants malades → parents hétérozygotes$$, $$allèle albinos (a) récessif, allèle normal (A) dominant$$]::text[],
        'fixation', jsonb_build_object('question', $$Comment peut-on affirmer qu'un allèle est récessif à partir d'un arbre généalogique ?$$, 'solution', $$Lorsque deux parents phénotypiquement sains (d'apparence normale) ont un enfant malade, cela prouve qu'ils étaient hétérozygotes, portant l'allèle malade sous forme masquée — donc que cet allèle est récessif.$$)
      ),
      jsonb_build_object(
        'heading', $$Déterminer si le gène est porté par un autosome ou un chromosome sexuel$$,
        'body', $$Pour vérifier si un gène est lié au sexe, on émet l'hypothèse qu'il est porté par le chromosome X (Y étant génétiquement inerte), puis on calcule les proportions théoriques de descendants pour un couple donné à l'aide d'un échiquier de croisement. Pour le couple hétérozygote étudié (XA//Xa croisé avec XA/Y), le calcul théorique montre qu'aucune fille ne peut être albinos — seuls des garçons peuvent l'être. Or, dans le pédigrée réel, une fille est bien albinos : ce résultat contredit l'hypothèse de liaison au chromosome X. Le gène de l'albinisme est donc porté par un autosome (un chromosome non sexuel), et non par un chromosome sexuel.$$,
        'highlights', array[$$hypothèse : gène sur X → calcul théorique$$, $$contradiction avec le pédigrée réel → gène autosomal$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi l'existence d'une fille albinos dans le pédigrée permet-elle d'exclure une liaison au chromosome X ?$$, 'solution', $$Parce que si le gène de l'albinisme était porté par le chromosome X, le croisement théorique du couple hétérozygote (XA//Xa × XA/Y) ne pourrait produire que des garçons albinos (Xa/Y), jamais de filles albinos (qui auraient besoin de deux X porteurs de l'allèle a). Une fille albinos observée dans la réalité contredit donc cette hypothèse.$$),
        'fixation', jsonb_build_object('question', $$Quelle méthode utilise-t-on pour déterminer si un gène est porté par un autosome ou par le chromosome X ?$$, 'solution', $$On émet l'hypothèse d'une liaison au chromosome X, on calcule les proportions théoriques de descendants malades par sexe à l'aide d'un échiquier de croisement, puis on compare ce résultat théorique aux observations réelles du pédigrée ; une contradiction invalide l'hypothèse.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$La drépanocytose est due à une hémoglobine anormale S. Les individus sains sont homozygotes A//A [A], les malades sont homozygotes S//S [S], et les individus apparemment sains mais porteurs sont hétérozygotes A//S [AS] (les deux hémoglobines s'expriment). Un arbre généalogique montre qu'un couple apparemment sain (phénotype [AS] pour l'un des parents) a une fille malade [S].$$,
      'questions', array[
        $$Montre, à partir du raisonnement du cours, que l'allèle de la drépanocytose est récessif.$$,
        $$En posant l'hypothèse d'une liaison au chromosome X, montre que cette hypothèse doit être rejetée si une fille du couple est malade.$$,
        $$Conclus sur le support chromosomique (autosome ou chromosome sexuel) de l'allèle de la drépanocytose.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un allèle ?$$,
      'hint', $$C'est lié aux différentes formes d'un gène.$$,
      'expected', $$L'une des formes possibles d'un gène.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que le locus ?$$,
      'hint', $$C'est une position.$$,
      'expected', $$L'emplacement (la position) d'un gène ou d'un allèle sur un chromosome.$$
    ),
    jsonb_build_object(
      'question', $$Si deux parents phénotypiquement sains ont un enfant malade, que peut-on en déduire sur leur génotype ?$$,
      'hint', $$Ils portent l'allèle sous forme cachée.$$,
      'expected', $$Qu'ils sont tous les deux hétérozygotes, porteurs de l'allèle malade à l'état masqué (récessif).$$
    ),
    jsonb_build_object(
      'question', $$Sur quel type de chromosome (Y compris) est porté le gène de l'albinisme, d'après l'analyse du pédigrée du cours ?$$,
      'hint', $$Ce n'est pas un chromosome sexuel.$$,
      'expected', $$Sur un autosome (chromosome non sexuel).$$
    )
  ),
  now()
);
