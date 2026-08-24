-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Grammaire (categoryid=61).
-- Cours combinés (5 séances) : "6e_Gr_L2_S1_constituants_GN" (id 2195),
-- "S2_expansions_nom" (id 2196), "S3_déter_adj_démons_poss" (id 2197),
-- "S4_degré_comparatif" (id 2198), "S5_degré_compa_superlatif" (id 2199).
-- Contenu réécrit à partir des PDF sources ; définitions et exemples
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au cours de leurs recherches en bibliothèque, les élèves de 6ème découvrent un corpus de phrases contenant des groupes nominaux variés. Ils s'organisent pour en identifier les constituants, les expansions, les déterminants et les degrés de comparaison.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les constituants et les expansions du groupe nominal$$,
        'body', $$Le groupe nominal (GN) est un ensemble de mots rattaché à un nom-noyau. Il comprend deux constituants obligatoires : le déterminant et le nom (GN = Dét + N), ou peut être un nom propre/pronom. Il peut aussi comporter une expansion du nom (facultative) : l'adjectif qualificatif (épithète, lié directement au nom, ou apposé, séparé par une virgule), le complément du nom (préposition + mot : "la maison de repos"), ou la proposition subordonnée relative (introduite par qui, que, dont, où : "le chien qui est malade"). Dans la phrase, le GN peut être sujet, COD, COI, complément circonstanciel, complément du nom, ou en apposition.$$,
        'highlights', array[$$GN = déterminant + nom (+ expansion facultative)$$, $$3 expansions : adjectif qualificatif, complément du nom, subordonnée relative$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les deux constituants obligatoires du groupe nominal ?$$, 'solution', $$Le déterminant et le nom (noyau).$$)
      ),
      jsonb_build_object(
        'heading', $$Les déterminants démonstratifs et possessifs$$,
        'body', $$Le déterminant est toujours placé devant le nom et s'accorde en genre et en nombre. Les adjectifs démonstratifs (ce, cet, cette, ces) servent à montrer/désigner : "ce" devant consonne masculin singulier, "cet" devant voyelle ou h muet, "cette" au féminin singulier, "ces" au pluriel. Les adjectifs possessifs (mon/ma, ton/ta, son/sa, notre, votre, leur au singulier ; mes, tes, ses, nos, vos, leurs au pluriel) expriment la possession ; on emploie "mon/ton/son" devant un nom féminin commençant par une voyelle ou un h muet (ex : "mon école").$$,
        'highlights', array[$$ce/cet (masc. sing.) ; cette (fém. sing.) ; ces (pluriel)$$, $$mon/ton/son devant un nom féminin qui commence par une voyelle ou un h muet$$]::text[],
        'example', jsonb_build_object('statement', $$Complète : "______ arbre est petit." (adjectif démonstratif)$$, 'solution', $$"Cet arbre est petit." (cet, car "arbre" commence par une voyelle)$$),
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on "mon école" et non "ma école" ?$$, 'solution', $$Parce que "école" est féminin mais commence par une voyelle — on utilise alors "mon" pour l'euphonie.$$)
      ),
      jsonb_build_object(
        'heading', $$Les degrés de comparaison : comparatif et superlatif$$,
        'body', $$L'adjectif qualificatif a trois degrés de comparatif : d'infériorité ("moins + adjectif + que" : "La tortue est moins rapide que le lièvre"), d'égalité ("aussi + adjectif + que"), de supériorité ("plus + adjectif + que"). Le superlatif relatif ajoute un article défini au comparatif ("le/la/les plus/moins + adjectif" : "la classe la plus propre"), parfois suivi d'un complément introduit par "de" ou d'une relative au subjonctif. Le superlatif absolu utilise "très" ou un équivalent (fort, extrêmement, super) sans comparaison : "très propre."$$,
        'highlights', array[$$comparatif : moins/aussi/plus + adjectif + que$$, $$superlatif relatif = le/la/les + comparatif ; superlatif absolu = très/extrêmement + adjectif (sans comparaison)$$]::text[],
        'example', jsonb_build_object('statement', $$Le mont Cameroun (4040m) est-il "plus" ou "moins" élevé que le Kilimandjaro (5895m) ?$$, 'solution', $$"Le mont Cameroun est moins élevé que le mont Kilimandjaro." (comparatif d'infériorité)$$),
        'fixation', jsonb_build_object('question', $$Quelle est la différence entre le superlatif relatif et le superlatif absolu ?$$, 'solution', $$Le superlatif relatif compare (le plus/moins... de), le superlatif absolu exprime un degré sans comparaison (très, extrêmement...).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$À l'occasion de la journée porte ouverte, ton établissement organise un concours de beauté. Tu dois comparer et apprécier les candidates à l'aide des degrés de comparaison de l'adjectif.$$,
      'questions', array[
        $$Écris une phrase utilisant le comparatif d'égalité pour comparer deux candidates.$$,
        $$Écris une phrase utilisant le superlatif relatif pour désigner la candidate la plus appréciée.$$,
        $$Ajoute une expansion (adjectif, complément du nom, ou relative) au groupe nominal "la candidate".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans "Le chien de la patiente a aboyé", quelle est l'expansion du nom "chien" et de quel type est-elle ?$$,
      'hint', $$Elle est introduite par la préposition "de".$$,
      'expected', $$"De la patiente" — c'est un complément du nom.$$
    ),
    jsonb_build_object(
      'question', $$Complète : "……..oiseau m'a réveillé." (adjectif démonstratif devant un nom masculin qui commence par une voyelle)$$,
      'hint', $$C'est la forme utilisée devant une voyelle.$$,
      'expected', $$"Cet oiseau m'a réveillé."$$
    ),
    jsonb_build_object(
      'question', $$Complète avec le comparatif de supériorité : "La voiture est ______ rapide ______ le vélo."$$,
      'hint', $$Structure : plus + adjectif + que.$$,
      'expected', $$"La voiture est plus rapide que le vélo."$$
    ),
    jsonb_build_object(
      'question', $$"Cet élève est super intelligent" : s'agit-il d'un superlatif relatif ou absolu ?$$,
      'hint', $$Il n'y a pas de comparaison avec un groupe.$$,
      'expected', $$Un superlatif absolu (pas de comparaison, juste un haut degré).$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-groupe-nominal';
