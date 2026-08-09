-- Physique-Chimie 3ème — Les alcanes.
-- FALLBACK content (ecole-ci.org login wall, see header of
-- 20260810200000_pc_lentilles_content.sql). Written from solid general
-- knowledge of the standard Ivorian 3ème chemistry competency (alcanes
-- CnH2n+2, nomenclature méthane à butane, combustion complète/incomplète).
-- Original wording throughout, not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une famille utilise une bonbonne de gaz pour cuisiner. Un jour, la flamme du réchaud, habituellement bleue, devient jaune et laisse un dépôt noir sur le fond des marmites. Ce gaz domestique est un alcane. Que sont exactement les alcanes, et pourquoi la couleur d'une flamme de gaz peut-elle changer ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Définition et formule générale des alcanes$$,
        'body', $$Les alcanes sont des hydrocarbures, c'est-à-dire des molécules formées uniquement d'atomes de carbone et d'hydrogène. Ce sont des hydrocarbures saturés : tous leurs atomes de carbone sont reliés entre eux par des liaisons simples uniquement.$$,
        'highlights', array[$$hydrocarbures$$, $$saturés$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La formule brute d'un alcane à n atomes de carbone est CnH2n+2, où n est un entier positif.$$),
        'example', jsonb_build_object('statement', $$Un alcane possède 6 atomes de carbone. Détermine sa formule brute.$$, 'solution', $$Pour n=6 : CnH2n+2 = C6H(2×6+2) = C6H14.$$),
        'fixation', jsonb_build_object('question', $$Un alcane a pour formule brute C8H18. Combien d'atomes de carbone possède-t-il, et cela est-il cohérent avec la formule générale des alcanes ?$$, 'solution', $$Il possède 8 atomes de carbone (n=8) ; on vérifie 2×8+2=18, ce qui correspond bien au nombre d'atomes d'hydrogène indiqué : c'est cohérent.$$)
      ),
      jsonb_build_object(
        'heading', $$Nomenclature des premiers alcanes$$,
        'body', $$Le nom d'un alcane se termine toujours par le suffixe -ane, précédé d'un préfixe qui indique le nombre d'atomes de carbone de la molécule.$$,
        'highlights', array[$$nomenclature$$, $$suffixe -ane$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nom$$, $$Formule brute$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Méthane$$, $$CH4$$),
            jsonb_build_array($$Éthane$$, $$C2H6$$),
            jsonb_build_array($$Propane$$, $$C3H8$$),
            jsonb_build_array($$Butane$$, $$C4H10$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les quatre premiers alcanes sont le méthane (1 atome de carbone), l'éthane (2 atomes), le propane (3 atomes) et le butane (4 atomes). Le méthane est le principal constituant du gaz naturel ; le propane et le butane sont utilisés comme gaz domestique en bouteille.$$),
        'example', jsonb_build_object('statement', $$Quel est le nom de l'alcane utilisé, en bonbonne, comme gaz de cuisine dans de nombreux foyers ivoiriens, de formule C4H10 ?$$, 'solution', $$C4H10 correspond au butane.$$),
        'fixation', jsonb_build_object('question', $$Quel est le principal alcane présent dans le gaz naturel ?$$, 'solution', $$C'est le méthane (CH4).$$)
      ),
      jsonb_build_object(
        'heading', $$Combustion complète des alcanes$$,
        'body', $$Quand un alcane brûle en présence d'une quantité suffisante de dioxygène, sa combustion est complète : elle produit uniquement du dioxyde de carbone et de l'eau, avec une flamme bleue caractéristique.$$,
        'highlights', array[$$combustion complète$$, $$dioxyde de carbone$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Lors d'une combustion complète, un alcane réagit avec le dioxygène pour donner du dioxyde de carbone (CO2) et de l'eau (H2O). Par exemple, pour le méthane : CH4 + 2 O2 → CO2 + 2 H2O.$$),
        'example', jsonb_build_object('statement', $$Écris et équilibre l'équation de la combustion complète du méthane.$$, 'solution', $$CH4 + 2 O2 → CO2 + 2 H2O. Vérification : à gauche, 1 C, 4 H, 4 O (2×2) ; à droite, 1 C, 4 H (2×2), et 2+2=4 O. L'équation est équilibrée.$$),
        'fixation', jsonb_build_object('question', $$Quels sont les deux produits obtenus lors de la combustion complète d'un alcane ?$$, 'solution', $$Du dioxyde de carbone (CO2) et de l'eau (H2O).$$)
      ),
      jsonb_build_object(
        'heading', $$Combustion incomplète et dangers$$,
        'body', $$Si la quantité de dioxygène est insuffisante, la combustion d'un alcane devient incomplète : elle produit alors du monoxyde de carbone, un gaz toxique et inodore, et parfois des particules de carbone (suie), reconnaissables à une flamme jaune-orangée et fuligineuse.$$,
        'highlights', array[$$combustion incomplète$$, $$monoxyde de carbone$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$En cas de manque de dioxygène, la combustion d'un alcane produit du monoxyde de carbone (CO), gaz toxique, et/ou du carbone solide (suie), au lieu du dioxyde de carbone. La flamme devient jaune et fuligineuse au lieu d'être bleue.$$),
        'example', jsonb_build_object('statement', $$Un chauffe-eau au gaz mal réglé produit une flamme jaune et dépose de la suie noire sur les parois. Que peut-on en déduire sur sa combustion ?$$, 'solution', $$La flamme jaune et le dépôt de suie indiquent une combustion incomplète, due à un manque de dioxygène, avec un risque de production de monoxyde de carbone toxique.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi le monoxyde de carbone, produit par une combustion incomplète, est-il particulièrement dangereux ?$$, 'solution', $$Parce que c'est un gaz toxique et inodore : il peut intoxiquer une personne sans être détecté par l'odorat.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une famille utilise une bonbonne de butane (C4H10) pour cuisiner. Un jour, la flamme du réchaud devient jaune et fuligineuse au lieu d'être bleue.$$,
      'questions', array[
        $$Identifie les réactifs et les produits de la combustion complète du butane (en présence de dioxygène, elle produit du dioxyde de carbone et de l'eau).$$,
        $$Que signifie le changement de couleur de la flamme, du bleu au jaune ?$$,
        $$Quel danger cette famille court-elle si elle continue à utiliser le réchaud dans cet état, dans une pièce mal ventilée ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un alcane possède 5 atomes de carbone. Détermine sa formule brute.$$,
      'hint', $$Utilise la formule générale CnH2n+2.$$,
      'expected', $$C5H12.$$
    ),
    jsonb_build_object(
      'question', $$Écris et équilibre l'équation de la combustion complète de l'éthane C2H6 (avec O2, produisant CO2 et H2O).$$,
      'hint', $$Compte les atomes de carbone, d'hydrogène et d'oxygène de chaque côté de l'équation.$$,
      'expected', $$2 C2H6 + 7 O2 → 4 CO2 + 6 H2O.$$
    ),
    jsonb_build_object(
      'question', $$Nomme les alcanes à 1, 2, 3 et 4 atomes de carbone.$$,
      'hint', $$Pense au suffixe -ane et au préfixe qui indique le nombre d'atomes de carbone.$$,
      'expected', $$Méthane (1 C), éthane (2 C), propane (3 C), butane (4 C).$$
    ),
    jsonb_build_object(
      'question', $$Quels sont les signes visibles d'une combustion incomplète d'un alcane, et quel gaz dangereux peut-elle produire ?$$,
      'hint', $$Pense à la couleur de la flamme et aux dépôts observés.$$,
      'expected', $$Une flamme jaune et fuligineuse, avec parfois un dépôt de suie noire (carbone) ; elle peut produire du monoxyde de carbone (CO), un gaz toxique.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-alcanes';
