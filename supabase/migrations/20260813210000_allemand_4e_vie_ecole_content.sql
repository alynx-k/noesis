-- Contenu ancré sur un vrai PDF officiel d'ecole-ci.org (Collège
-- Numérique, catégorie "QUATRIEME > Allemand", cours "THEME 2 LECON 1",
-- ressource mod/resource id 7532 : "ALLEMAND 4ème THEME 2 LECON 1.pdf").
-- Le PDF couvre le Thème 2 "Meine Schule" (manuel Deutsch? Na klar!),
-- leçon "Meine schöne Schule" : vocabulaire de l'école (Schulhof,
-- Stundenplan, Deutschlehrer), adjectifs et leurs contraires (sauber/
-- schmutzig, streng/nett, schwer/leicht, schnell/langsam), déclinaison de
-- l'article défini/indéfini à l'accusatif, et présent/parfait des verbes
-- kaufen/lernen/machen. NB : la ressource du cours "THEME 2 LECON 2" (id
-- 7496) sert exactement le même fichier PDF (vérifié : même taille, même
-- contenu) — il n'existe donc pas de second PDF distinct pour une
-- éventuelle leçon 2 dans ce catalogue. Reformulation entièrement
-- originale (aucune phrase du PDF recopiée telle quelle) ; rédigé en
-- allemand (immersion LV2), chrome de l'application en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deine Schule nimmt an einem Wettbewerb um die schönste Schule der Region teil. Du musst deine Schule, deinen Schulhof und deine Lehrkräfte auf Deutsch beschreiben.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: die Schule beschreiben$$,
        'body', $$Um seine Schule und die Personen dort zu beschreiben, braucht man Vokabular für Orte und passende Adjektive.$$,
        'highlights', array[$$der Schulhof$$, $$der Stundenplan$$, $$der Deutschlehrer$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Schulhof$$, $$der Platz im Freien vor der Schule$$),
            jsonb_build_array($$der Stundenplan$$, $$die Übersicht der Unterrichtsstunden$$),
            jsonb_build_array($$der Deutschlehrer$$, $$der Lehrer für das Fach Deutsch$$),
            jsonb_build_array($$die Hausaufgabe$$, $$die Übung, die man zu Hause macht$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Viele Adjektive haben ein festes Gegenteil: sauber ≠ schmutzig, streng ≠ nett, schwer ≠ leicht, schnell ≠ langsam. Damit kann man Orte und Personen genauer beschreiben.$$),
        'example', jsonb_build_object('statement', $$Wie ist der Schulhof deiner Schule?$$, 'solution', $$Der Schulhof ist groß und sauber.$$),
        'fixation', jsonb_build_object('question', $$Nenne das Gegenteil von "streng".$$, 'solution', $$Das Gegenteil von "streng" ist "nett".$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: der Akkusativ nach sehen und kaufen$$,
        'body', $$Das direkte Objekt eines Satzes (das Akkusativobjekt) verändert den bestimmten und unbestimmten Artikel im Maskulinum.$$,
        'highlights', array[$$der Akkusativ$$, $$den$$, $$einen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nominativ$$, $$Akkusativ (bestimmt)$$, $$Akkusativ (unbestimmt)$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Lehrer$$, $$den Lehrer$$, $$einen Lehrer$$),
            jsonb_build_array($$die Tasche$$, $$die Tasche$$, $$eine Tasche$$),
            jsonb_build_array($$das Heft$$, $$das Heft$$, $$ein Heft$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Nur beim maskulinen Artikel ändert sich die Form im Akkusativ (der→den, ein→einen); der feminine und der neutrale Artikel bleiben gleich. Verben wie sehen, kaufen und haben verlangen ein Akkusativobjekt.$$),
        'example', jsonb_build_object('statement', $$Was siehst du auf dem Schulhof?$$, 'solution', $$Ich sehe einen Lehrer und eine Schülerin.$$),
        'fixation', jsonb_build_object('question', $$Ergänze im Akkusativ: Kaufst du ___ (ein Kugelschreiber)?$$, 'solution', $$Kaufst du einen Kugelschreiber?$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: kaufen und lernen im Präsens und im Perfekt$$,
        'body', $$Um über regelmäßige Handlungen und über bereits abgeschlossene Handlungen zu sprechen, braucht man das Präsens und das Perfekt.$$,
        'highlights', array[$$das Perfekt$$, $$gekauft$$, $$gelernt$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Präsens$$, $$Perfekt$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$ich lerne$$, $$ich habe gelernt$$),
            jsonb_build_array($$du kaufst$$, $$du hast gekauft$$),
            jsonb_build_array($$wir machen$$, $$wir haben gemacht$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Regelmäßige Verben bilden das Perfekt mit dem Hilfsverb "haben" und dem Partizip II auf ge-...-t (gelernt, gekauft, gemacht). Das Partizip steht am Ende des Satzes.$$),
        'example', jsonb_build_object('statement', $$Was hast du gestern in der Schule gemacht?$$, 'solution', $$Ich habe die Hausaufgabe gemacht und ein neues Heft gekauft.$$),
        'fixation', jsonb_build_object('question', $$Bilde das Perfekt: ich / lernen / die Vokabeln$$, 'solution', $$Ich habe die Vokabeln gelernt.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du nimmst an einem Wettbewerb über die schönste Schule teil und musst deine Schule und deine Lehrkräfte vorstellen.$$,
      'questions', array[
        $$Beschreibe den Schulhof deiner Schule (mit einem Adjektiv und seinem Gegenteil).$$,
        $$Sag, was du in deiner Schultasche hast (im Akkusativ).$$,
        $$Beschreibe deinen Deutschlehrer / deine Deutschlehrerin mit zwei Adjektiven.$$,
        $$Sag, was du gestern für die Schule gemacht hast (im Perfekt).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze im Akkusativ: Siehst du ___ (die Lehrerin)?$$,
      'hint', $$Feminin bleibt im Akkusativ gleich.$$,
      'expected', $$Siehst du die Lehrerin?$$
    ),
    jsonb_build_object(
      'question', $$Nenne das Gegenteil von "schmutzig".$$,
      'hint', $$Es ist das Gegenteil von sauber.$$,
      'expected', $$Das Gegenteil von "schmutzig" ist "sauber".$$
    ),
    jsonb_build_object(
      'question', $$Bilde das Perfekt: wir / kaufen / ein Wörterbuch$$,
      'hint', $$haben + ge...t: gekauft.$$,
      'expected', $$Wir haben ein Wörterbuch gekauft.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze im Akkusativ: Ich habe ___ (ein Heft) und ___ (ein Kugelschreiber).$$,
      'hint', $$Neutrum bleibt gleich; maskulin wird "einen".$$,
      'expected', $$Ich habe ein Heft und einen Kugelschreiber.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-vie-ecole';
