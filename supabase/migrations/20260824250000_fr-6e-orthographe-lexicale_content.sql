-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Français, Orthographe (categoryid=62).
-- Cours combinés (3 séances) : "6e_ORTHO_L1_ortho_lexi_S1_accents_apostrophe"
-- (id 2182), "S2_se-ce_si-s'y..." (id 2183, contenu réel : les
-- homophones), "S3_doublement_consonnes" (id 2184). Contenu réécrit à
-- partir des PDF sources ; définitions et exemples reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le club littéraire du lycée municipal de Koumassi prévoit un concours d'orthographe pour les élèves du premier cycle. Pour bien s'y préparer, les élèves de 6ème s'entraînent à corriger des fautes d'orthographe lexicale : accents, apostrophe, élision, homophones et adverbes en "-ment".$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les accents, l'apostrophe et l'élision$$,
        'body', $$Il existe trois accents en français : l'accent aigu (uniquement sur "e" fermé : école), l'accent grave (sur "e" ouvert : grève ; ou sur "a"/"u" pour distinguer des homonymes : à/a, où/ou), et l'accent circonflexe (sur a, e, i, o, u : pâte, fête, maître). L'élision consiste à enlever la voyelle finale d'un mot devant un mot commençant par une voyelle ou un "h" muet, marquée à l'écrit par l'apostrophe : "l'éléphant", "l'homme", "je l'ai vu".$$,
        'highlights', array[$$accent aigu (é fermé) ; accent grave (è ouvert, ou à/où) ; circonflexe (â ê î ô û)$$, $$élision = perte de la voyelle finale devant voyelle/h muet → apostrophe$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quelles lettres peut-on mettre un accent circonflexe ?$$, 'solution', $$Sur a, e, i, o, u (jamais sur y).$$)
      ),
      jsonb_build_object(
        'heading', $$Les homophones grammaticaux$$,
        'body', $$Les homophones se prononcent pareil mais ont un sens différent. "Se" (pronom, devant un verbe : "Yao se lave") / "ce" (adjectif démonstratif, devant un nom : "ce livre") / "ceux" (pronom démonstratif, remplace un nom connu). "C'est" (= "ce sont" au pluriel) / "s'est" (forme pronominale : "le bébé s'est réveillé"). "Ses" (possessif pluriel) / "ces" (démonstratif pluriel). "Si" (conjonction : condition ou complétive) / "s'y" (lieu, remplaçable par "là-bas"). "La" (article ou pronom, remplaçable par "une"/un GN) / "là" (adverbe, remplaçable par "ici"). "Quelle/quel" (interrogatif ou exclamatif) / "qu'elle" (que + elle).$$,
        'highlights', array[$$se (+ verbe) / ce (+ nom) / ceux (remplace un nom)$$, $$c'est = ce sont ; s'est = forme pronominale ; si (condition) / s'y (= là-bas) ; la (= une) / là (= ici)$$]::text[],
        'example', jsonb_build_object('statement', $$Complète : "Il va à l'école, il ______ rend à pied." (s'y ou si ?)$$, 'solution', $$"Il va à l'école, il s'y rend à pied." (remplaçable par "là-bas")$$),
        'fixation', jsonb_build_object('question', $$Comment distingue-t-on "ses" et "ces" ?$$, 'solution', $$"Ses" est le pluriel de "sa/son" (possessif) ; "ces" est le pluriel de "ce/cet/cette" (démonstratif).$$)
      ),
      jsonb_build_object(
        'heading', $$Le doublement de consonne dans les adverbes en "-ment"$$,
        'body', $$Les adverbes en "-ment" se construisent souvent à partir d'un adjectif qualificatif. On double la consonne quand l'adverbe dérive d'un adjectif masculin en "-ent" ou "-ant" : violent → violemment, puissant → puissamment, courant → couramment. Exceptions : certains adjectifs en "-ent" ne doublent pas (lent → lentement, présent → présentement).$$,
        'highlights', array[$$adjectif en -ent/-ant → adverbe en -emment/-amment (double consonne)$$, $$exceptions : lent→lentement, présent→présentement (pas de doublement)$$]::text[],
        'example', jsonb_build_object('statement', $$Forme l'adverbe à partir de "diligent".$$, 'solution', $$"Diligemment" (diligent en -ent → -emment).$$),
        'fixation', jsonb_build_object('question', $$L'adverbe "élégamment" vient de quel adjectif ?$$, 'solution', $$"Élégant."$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Au concours d'orthographe du club littéraire, tu dois corriger un texte contenant plusieurs pièges : accents oubliés, homophones mal choisis, et adverbes en "-ment" mal orthographiés.$$,
      'questions', array[
        $$Corrige les accents manquants dans une liste de mots (ex : "eclater" → "éclater").$$,
        $$Choisis le bon homophone dans des phrases à trous (ce/se, si/s'y, la/là...).$$,
        $$Forme correctement les adverbes en "-ment" à partir des adjectifs "prudent", "vaillant" et "lent".$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Complète : "….. n'est pas la peine de pleurer." (ce ou se ?)$$,
      'hint', $$C'est un adjectif démonstratif devant un mot sous-entendu.$$,
      'expected', $$"Ce n'est pas la peine de pleurer."$$
    ),
    jsonb_build_object(
      'question', $$Complète : "Le bébé ______ réveillé en pleurant." (c'est ou s'est ?)$$,
      'hint', $$C'est la forme pronominale du verbe "se réveiller".$$,
      'expected', $$"Le bébé s'est réveillé en pleurant."$$
    ),
    jsonb_build_object(
      'question', $$Forme l'adverbe en "-ment" à partir de "puissant".$$,
      'hint', $$Adjectif en -ant → double consonne.$$,
      'expected', $$"Puissamment."$$
    ),
    jsonb_build_object(
      'question', $$Écris "resumer" et "poesie" avec les accents corrects.$$,
      'hint', $$Le son "é" fermé s'écrit avec un accent aigu.$$,
      'expected', $$"Résumer" et "poésie."$$
    )
  ),
  content_generated_at = now()
where id = 'fr-6e-orthographe-lexicale';
