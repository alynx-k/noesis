-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- SVT (categoryid=52).
-- Cours : "Leçon 3 : La reproduction chez les mammifères" (id 2060).
-- Contenu réécrit à partir du PDF source ; situation d'apprentissage,
-- définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour produire des lapins, des élèves de 6ème démarrent un élevage avec un mâle et une femelle, mis en cage ensemble 5 minutes durant lesquelles il y a eu accouplement. Au bout de quelques semaines, des lapereaux apparaissent dans la cage de la femelle. Les élèves cherchent à comprendre la formation de ces nouveaux individus.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Caractères sexuels externes et internes$$,
        'body', $$Sur la face ventrale du lapin, on observe des organes différents selon le sexe : chez le mâle, le pénis et les bourses (caractères sexuels externes) ; chez la femelle, les mamelles et la vulve. Après dissection, on observe les organes internes : chez le mâle, deux testicules, deux spermiductes, une vésicule séminale et une prostate ; chez la femelle, deux ovaires, deux oviductes, un utérus et un vagin. Les testicules produisent les spermatozoïdes ; les ovaires produisent les ovules.$$,
        'highlights', array[$$externes : mâle = pénis + bourses ; femelle = vulve + mamelles$$, $$internes : mâle = testicules + spermiductes ; femelle = ovaires + oviductes + utérus + vagin$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel organe interne produit les spermatozoïdes ?$$, 'solution', $$Les testicules.$$)
      ),
      jsonb_build_object(
        'heading', $$La fécondation : union des cellules reproductrices$$,
        'body', $$Au cours de l'accouplement, le mâle dépose les spermatozoïdes dans le vagin de la femelle. Ils se déplacent grâce à leur flagelle à travers les oviductes jusqu'à l'ovule, l'entourent, et un seul y pénètre. Le noyau du spermatozoïde fusionne alors avec celui de l'ovule : c'est la fécondation. Cette fécondation se produit à l'intérieur de l'appareil reproducteur femelle : c'est une fécondation interne. Elle forme une cellule-œuf.$$,
        'highlights', array[$$étapes : accouplement → émission des spermatozoïdes → rapprochement → fusion des noyaux = fécondation$$, $$fécondation interne = se produit dans l'appareil reproducteur de la femelle$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi dit-on que la fécondation chez les mammifères est "interne" ?$$, 'solution', $$Parce qu'elle a lieu à l'intérieur de l'appareil reproducteur de la femelle.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on le résultat de la fusion du spermatozoïde et de l'ovule ?$$, 'solution', $$La cellule-œuf.$$)
      ),
      jsonb_build_object(
        'heading', $$Développement interne et viviparité$$,
        'body', $$Après la fécondation, la cellule-œuf subit des divisions successives (2 cellules, 4 cellules...) jusqu'à former un embryon, qui se fixe dans la paroi de l'utérus. Quelques semaines plus tard, l'embryon devient un fœtus, puis un individu entièrement formé après la mise bas. Ce développement se fait entièrement dans l'appareil reproducteur de la femelle : c'est un développement interne. Les mammifères sont dits vivipares car l'œuf se développe entièrement à l'intérieur de la mère.$$,
        'highlights', array[$$cellule-œuf → divisions → embryon → fœtus → nouvel individu (mise bas)$$, $$vivipare = développement interne, entièrement dans l'appareil reproducteur femelle$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les mammifères sont-ils qualifiés de "vivipares" ?$$, 'solution', $$Parce que l'œuf fécondé se développe entièrement à l'intérieur de l'appareil reproducteur de la femelle, jusqu'à la naissance d'un individu déjà formé.$$),
        'fixation', jsonb_build_object('question', $$Range dans l'ordre : fœtus / embryon / cellule-œuf / cellule en division.$$, 'solution', $$Cellule-œuf → cellule en division → embryon → fœtus.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une visite dans une ferme, des élèves de 6ème observent un taureau et une vache en accouplement. Un technicien agro-pastoral leur montre des schémas de cellules prélevées chez le taureau (une cellule avec un long flagelle) et chez la vache (une cellule ronde sans flagelle).$$,
      'questions', array[
        $$Identifie les deux cellules représentées (nomme leurs parties : noyau, cytoplasme, membrane).$$,
        $$Explique le rôle de l'accouplement dans la reproduction des mammifères.$$,
        $$Décris ce qui se passe après la fécondation, jusqu'à la naissance du veau.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Le pénis et les bourses sont-ils des caractères sexuels externes ou internes ?$$,
      'hint', $$Ils sont visibles de l'extérieur.$$,
      'expected', $$Des caractères sexuels externes.$$
    ),
    jsonb_build_object(
      'question', $$Range dans l'ordre chronologique : fusion des noyaux / accouplement / rapprochement des cellules / émission des spermatozoïdes.$$,
      'hint', $$L'accouplement vient toujours en premier.$$,
      'expected', $$1. Accouplement, 2. Émission des spermatozoïdes, 3. Rapprochement des cellules, 4. Fusion des noyaux.$$
    ),
    jsonb_build_object(
      'question', $$Où se déroule le développement de l'œuf chez les mammifères ?$$,
      'hint', $$Contrairement aux oiseaux.$$,
      'expected', $$Entièrement à l'intérieur de l'appareil reproducteur de la femelle (développement interne).$$
    ),
    jsonb_build_object(
      'question', $$Quel organe relie l'embryon à sa mère pour lui apporter nutriments et oxygène ?$$,
      'hint', $$C'est un organe temporaire propre à la grossesse.$$,
      'expected', $$Le placenta.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-6e-reproduction-mammiferes';
