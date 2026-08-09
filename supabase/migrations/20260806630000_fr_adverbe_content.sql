-- Same CourseContentV2 shape as fr-dialogue-oral (see
-- 20260806500000_fr_dialogue_oral_content.sql). Matching ecole-ci.org
-- sources exist (id 2228/2229/2230, categoryid=77) but could not be
-- fetched in this session (the Claude-in-Chrome browser extension
-- disconnected and did not reconnect); this content is written from
-- general knowledge of the standard 3ème programme topic instead.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En relisant une rédaction, ton professeur souligne plusieurs adverbes mal placés ou mal orthographiés. Il propose une séance pour bien maîtriser cette classe de mots invariable.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'un adverbe ?$$,
        'body', $$L'adverbe est un mot invariable qui modifie le sens d'un verbe, d'un adjectif, d'un autre adverbe, ou parfois d'une phrase entière.$$,
        'highlights', array[$$invariable$$, $$un adverbe$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un adverbe ne s'accorde jamais, contrairement à l'adjectif. Il peut exprimer la manière (rapidement), le temps (hier), le lieu (ici), la quantité (beaucoup), ou la négation (ne...pas).$$),
        'example', jsonb_build_object('statement', $$Identifie l'adverbe dans cette phrase et précise ce qu'il modifie : « Elle chante merveilleusement. »$$, 'solution', $$L'adverbe est « merveilleusement » ; il modifie le verbe « chante » en précisant la manière dont elle chante.$$),
        'fixation', jsonb_build_object('question', $$Identifie l'adverbe dans : « Il est très fatigué aujourd'hui. » et précise ce qu'il modifie.$$, 'solution', $$« Très » est un adverbe qui modifie l'adjectif « fatigué », en renforçant son intensité.$$)
      ),
      jsonb_build_object(
        'heading', $$Former un adverbe en -ment$$,
        'body', $$De nombreux adverbes de manière se forment à partir d'un adjectif, en lui ajoutant le suffixe -ment.$$,
        'highlights', array[$$suffixe -ment$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Règle$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$adjectif au féminin + ment$$, $$lente → lentement$$),
            jsonb_build_array($$adjectif terminé par une voyelle + ment$$, $$vrai → vraiment$$),
            jsonb_build_array($$adjectif en -ant → -amment$$, $$brillant → brillamment$$),
            jsonb_build_array($$adjectif en -ent → -emment$$, $$patient → patiemment$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Pour former un adverbe de manière, on ajoute généralement -ment au féminin de l'adjectif, sauf pour les adjectifs terminés par une voyelle (on utilise le masculin), et les adjectifs en -ant/-ent qui suivent une règle particulière (-amment/-emment).$$),
        'example', jsonb_build_object('statement', $$Forme l'adverbe correspondant à l'adjectif « heureux ».$$, 'solution', $$« Heureuse » (féminin) + ment = heureusement.$$),
        'fixation', jsonb_build_object('question', $$Forme l'adverbe correspondant à l'adjectif « courant ».$$, 'solution', $$Couramment (adjectif en -ant → -amment).$$)
      ),
      jsonb_build_object(
        'heading', $$Le groupe adverbial$$,
        'body', $$Un adverbe peut être accompagné d'autres mots qui le complètent, formant ainsi un groupe adverbial.$$,
        'highlights', array[$$groupe adverbial$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un groupe adverbial est un adverbe accompagné d'un ou plusieurs mots qui le précisent ou le renforcent, comme « très rapidement » ou « bien trop lentement ».$$),
        'example', jsonb_build_object('statement', $$Identifie le groupe adverbial dans : « Il parle beaucoup trop fort. »$$, 'solution', $$Le groupe adverbial est « beaucoup trop fort », qui modifie le verbe « parle ».$$),
        'fixation', jsonb_build_object('question', $$Construis un groupe adverbial à partir de l'adverbe « souvent », en le renforçant.$$, 'solution', $$« Très souvent » ou « bien trop souvent » sont des groupes adverbiaux possibles.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu dois enrichir un court texte en ajoutant des adverbes et des groupes adverbiaux pertinents.$$,
      'questions', array[
        $$Ajoute un adverbe de manière à une phrase de ton texte.$$,
        $$Forme un adverbe en -ment à partir d'un adjectif de ton choix.$$,
        $$Construis un groupe adverbial en renforçant un adverbe simple.$$,
        $$Explique pourquoi l'adverbe que tu as utilisé ne s'accorde pas.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Forme l'adverbe correspondant à l'adjectif « doux ».$$,
      'hint', $$Passe d'abord l'adjectif au féminin.$$,
      'expected', $$Douce (féminin) + ment = doucement.$$
    ),
    jsonb_build_object(
      'question', $$Forme l'adverbe correspondant à l'adjectif « évident ».$$,
      'hint', $$Cet adjectif se termine en -ent.$$,
      'expected', $$Évidemment (adjectif en -ent → -emment).$$
    ),
    jsonb_build_object(
      'question', $$Identifie l'adverbe et ce qu'il modifie : « Ils sont arrivés très tôt. »$$,
      'hint', $$Il y a deux adverbes qui se modifient l'un l'autre.$$,
      'expected', $$« Très » modifie l'adverbe « tôt », qui lui-même modifie le verbe « sont arrivés ».$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi ne peut-on pas accorder l'adverbe dans « Elles chantent joliment » ?$$,
      'hint', $$Pense à la nature invariable de cette classe de mots.$$,
      'expected', $$Parce qu'un adverbe est un mot invariable : il ne prend jamais de marque de genre ni de nombre.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-adverbe';
