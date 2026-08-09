-- FALLBACK CONTENT: an attempt to reach ecole-ci.org for a source PDF hit the
-- same site-wide login wall documented earlier this session (navigating to
-- the home page auto-opened a "Connexion - Mon Ecole à la maison" tab with
-- no accessible session, and a direct category URL timed out entirely).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (Compétence 1: nutrition chez l'Homme -- aliments simples/composés,
-- nutriments, ration alimentaire équilibrée), 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Awa remarque que son petit frère, souvent malade et plus petit que les autres enfants de son âge, mange presque toujours la même chose : du riz sans légume ni viande. Elle se demande pourquoi les aliments sont si importants pour la croissance et la santé du corps humain.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les catégories d'aliments$$,
        'body', $$Un aliment simple apporte surtout un seul type de nutriment : le sucre n'apporte que des glucides, l'huile que des lipides. Un aliment composé, comme le riz, l'œuf ou le lait, apporte plusieurs nutriments à la fois.$$,
        'highlights', array[$$aliments simples$$, $$aliments composés$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un aliment simple contient surtout un seul type de nutriment, alors qu'un aliment composé en contient plusieurs à la fois.$$),
        'example', jsonb_build_object('statement', $$Classe ces aliments en aliments simples ou composés : le sucre, le riz, l'huile, l'œuf.$$, 'solution', $$Le sucre et l'huile sont des aliments simples (respectivement glucide et lipide) ; le riz et l'œuf sont des aliments composés, car ils contiennent plusieurs nutriments.$$),
        'fixation', jsonb_build_object('question', $$Le lait contient de l'eau, des protides, des glucides, des lipides et des sels minéraux. Est-ce un aliment simple ou composé ?$$, 'solution', $$C'est un aliment composé, car il contient plusieurs nutriments différents.$$)
      ),
      jsonb_build_object(
        'heading', $$Les nutriments et leurs rôles$$,
        'body', $$Les nutriments sont les éléments simples que l'organisme obtient en digérant les aliments. Les glucides et les lipides fournissent de l'énergie ; les protides bâtissent et réparent les tissus du corps ; les vitamines, les sels minéraux et l'eau assurent le bon fonctionnement de l'organisme.$$,
        'highlights', array[$$glucides$$, $$lipides$$, $$protides$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nutriment$$, $$Aliments sources$$, $$Rôle principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Glucides$$, $$riz, igname, pain, sucre$$, $$fournir de l'énergie$$),
            jsonb_build_array($$Lipides$$, $$huile, beurre, arachide$$, $$fournir de l'énergie de réserve$$),
            jsonb_build_array($$Protides$$, $$viande, poisson, œuf, haricot$$, $$bâtir et réparer les tissus$$),
            jsonb_build_array($$Vitamines$$, $$fruits, légumes$$, $$protéger et réguler l'organisme$$),
            jsonb_build_array($$Sels minéraux et eau$$, $$eau, légumes, fruits$$, $$maintenir l'équilibre du corps$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Selon leur rôle, les nutriments se répartissent en nutriments énergétiques (glucides, lipides), bâtisseurs (protides, sels minéraux) et fonctionnels (vitamines, eau, sels minéraux).$$),
        'example', jsonb_build_object('statement', $$Quel est le rôle principal des protides contenus dans le poisson ?$$, 'solution', $$Les protides bâtissent et réparent les tissus de l'organisme, comme les muscles.$$),
        'fixation', jsonb_build_object('question', $$Un sportif a besoin de beaucoup d'énergie pour courir. Quels nutriments doit-il consommer en priorité ?$$, 'solution', $$Des glucides et des lipides, qui sont les nutriments énergétiques.$$)
      ),
      jsonb_build_object(
        'heading', $$La ration alimentaire équilibrée$$,
        'body', $$Une ration alimentaire équilibrée réunit chaque jour, dans de bonnes proportions, des nutriments énergétiques, des nutriments bâtisseurs et des nutriments fonctionnels. Un repas trop pauvre en protides ou en vitamines peut provoquer un retard de croissance ou une malnutrition.$$,
        'highlights', array[$$ration alimentaire équilibrée$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une ration alimentaire équilibrée apporte, dans de bonnes proportions, tous les nutriments dont l'organisme a besoin chaque jour, associés à une eau suffisante.$$),
        'example', jsonb_build_object('statement', $$Pourquoi un repas composé uniquement de riz blanc n'est-il pas équilibré ?$$, 'solution', $$Parce qu'il apporte des glucides mais manque de protides, de vitamines et de sels minéraux nécessaires à la croissance et à la protection du corps.$$),
        'fixation', jsonb_build_object('question', $$Cite deux conséquences possibles d'une alimentation pauvre en protides chez un enfant.$$, 'solution', $$Un retard de croissance et une plus grande sensibilité aux maladies (malnutrition).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le petit frère d'Awa doit reprendre des forces. Sa famille prépare son repas de la semaine avec les moyens du bord : riz, poisson séché, feuilles de manioc, huile de palme, oranges et eau.$$,
      'questions', array[
        $$Classe ces aliments selon qu'ils sont simples ou composés.$$,
        $$Pour chaque aliment, indique le ou les nutriments qu'il apporte principalement.$$,
        $$Explique pourquoi ce repas peut être considéré comme une ration alimentaire équilibrée.$$,
        $$Propose un aliment à ajouter si le repas manquait de vitamines.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un nutriment ?$$,
      'hint', $$Pense à ce que devient un aliment après digestion.$$,
      'expected', $$Un nutriment est un élément simple, directement utilisable par l'organisme, obtenu par digestion des aliments.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois grandes catégories de nutriments selon leur rôle.$$,
      'hint', $$Énergie, construction, régulation.$$,
      'expected', $$Les nutriments énergétiques (glucides, lipides), les nutriments bâtisseurs (protides, sels minéraux) et les nutriments fonctionnels (vitamines, eau, sels minéraux).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi l'eau est-elle considérée comme un nutriment essentiel bien qu'elle n'apporte pas d'énergie ?$$,
      'hint', $$Pense à son rôle dans les échanges du corps.$$,
      'expected', $$Parce qu'elle est indispensable au fonctionnement de l'organisme : elle transporte les substances, régule la température et permet les réactions chimiques du corps, même si elle ne fournit pas d'énergie.$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple d'aliment simple et un exemple d'aliment composé, en justifiant.$$,
      'hint', $$Compare le nombre de nutriments contenus.$$,
      'expected', $$Le sucre est un aliment simple car il contient presque uniquement des glucides ; l'œuf est un aliment composé car il contient des protides, des lipides, des vitamines et des sels minéraux.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-aliments-homme';
