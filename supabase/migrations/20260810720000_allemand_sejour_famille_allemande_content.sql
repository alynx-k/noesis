-- Contenu de secours (fallback) : cf. l'en-tête de
-- 20260810700000_allemand_preparatifs_voyage_content.sql pour le contexte
-- complet. Vérifié le 2026-08-08 : la catégorie Allemand 3ème
-- (categoryid=2) sur coll.ecole-ci.org redirige systématiquement vers une
-- page "Vous n'êtes pas inscrit(e) à ce cours" — hors périmètre de
-- l'abonnement actuel, alors que le reste du site est bien accessible.
-- Impossible de récupérer un PDF réel pour cette leçon. Contenu original
-- conservé, sur un séjour dans une famille allemande, rédigé en allemand
-- (immersion LV2).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Du wohnst für einige Wochen bei einer deutschen Gastfamilie. Du musst die Familienmitglieder und den Tagesablauf verstehen, und höflich über die Mahlzeiten und die Hausregeln sprechen können.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: die Familie und der Tagesablauf$$,
        'body', $$Bei einer Gastfamilie lernst du zuerst die Familienmitglieder und den Rhythmus des Tages kennen: die Mahlzeiten, das Aufstehen, und die gemeinsamen Momente.$$,
        'highlights', array[$$die Gastfamilie$$, $$das Frühstück$$, $$der Tagesablauf$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$die Gastfamilie$$, $$die Familie, die einen ausländischen Gast bei sich aufnimmt$$),
            jsonb_build_array($$der Gastvater / die Gastmutter$$, $$der Mann / die Frau der Gastfamilie$$),
            jsonb_build_array($$das Frühstück$$, $$die erste Mahlzeit des Tages, am Morgen$$),
            jsonb_build_array($$das Mittagessen$$, $$die Mahlzeit am Mittag$$),
            jsonb_build_array($$das Abendessen$$, $$die Mahlzeit am Abend$$),
            jsonb_build_array($$der Tagesablauf$$, $$die Reihenfolge der Aktivitäten während eines Tages$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um zu sagen, wo oder bei wem man wohnt, benutzt man Präpositionen mit dem Dativ: "bei" (chez) und "zu" (vers/à). Der bestimmte Artikel ändert sich im Dativ: der -> dem, die -> der, das -> dem.$$),
        'example', jsonb_build_object('statement', $$Wo wohnst du während deines Aufenthalts? (die Gastfamilie)$$, 'solution', $$Ich wohne bei der Gastfamilie.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit der richtigen Präposition und dem richtigen Artikel: Ich gehe ___ (zu) d__ Gastmutter, um zu helfen.$$, 'solution', $$Ich gehe zu der (zur) Gastmutter, um zu helfen.$$)
      ),
      jsonb_build_object(
        'heading', $$Höflich sprechen: bitten und danken$$,
        'body', $$Bei einer Gastfamilie ist Höflichkeit sehr wichtig: man bittet höflich um etwas, bedankt sich, und respektiert die Hausregeln.$$,
        'highlights', array[$$bitte$$, $$danke$$, $$dürfen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Ausdruck$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Könnte ich bitte...?$$, $$eine höfliche Art, um etwas zu bitten$$),
            jsonb_build_array($$Danke schön / Vielen Dank$$, $$ein Ausdruck der Dankbarkeit$$),
            jsonb_build_array($$Es hat sehr gut geschmeckt.$$, $$ein Kompliment nach dem Essen$$),
            jsonb_build_array($$Darf ich...?$$, $$eine höfliche Frage, um eine Erlaubnis zu bitten$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Das Modalverb "dürfen" drückt eine Erlaubnis aus: ich darf, du darfst, er/sie/es darf, wir dürfen, ihr dürft, sie/Sie dürfen.$$),
        'example', jsonb_build_object('statement', $$Bitte höflich um ein Glas Wasser.$$, 'solution', $$Könnte ich bitte ein Glas Wasser haben?$$),
        'fixation', jsonb_build_object('question', $$Bilde eine höfliche Frage mit "dürfen": ich / das Fenster / öffnen$$, 'solution', $$Darf ich das Fenster öffnen?$$)
      ),
      jsonb_build_object(
        'heading', $$Den Tagesablauf beschreiben$$,
        'body', $$Um den Tagesablauf in der Gastfamilie zu beschreiben, benutzt man trennbare Verben wie "aufstehen" und "fernsehen" mit Zeitangaben wie "morgens", "mittags" und "abends".$$,
        'highlights', array[$$aufstehen$$, $$morgens$$, $$trennbares Verb$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Bei trennbaren Verben (aufstehen, fernsehen, anrufen...) trennt sich die Vorsilbe (auf-, fern-, an-) vom Verb und steht ganz am Satzende: Ich stehe um sechs Uhr auf.$$),
        'example', jsonb_build_object('statement', $$Wann stehst du bei deiner Gastfamilie auf?$$, 'solution', $$Ich stehe morgens um sechs Uhr auf und frühstücke mit der Familie.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz mit dem trennbaren Verb "fernsehen": wir / abends / zusammen$$, 'solution', $$Wir sehen abends zusammen fern.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du schreibst eine Postkarte an deine Eltern über deinen Aufenthalt bei einer deutschen Gastfamilie.$$,
      'questions', array[
        $$Beschreibe, bei wem du wohnst (benutze "bei + Dativ").$$,
        $$Beschreibe deinen Tagesablauf bei der Gastfamilie.$$,
        $$Bitte höflich um etwas, das du brauchst.$$,
        $$Bedanke dich bei deiner Gastfamilie für ihre Gastfreundschaft.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze mit "bei" und dem richtigen Artikel: Ich wohne ___ d__ Gastfamilie in Köln.$$,
      'hint', $$"bei" + Dativ; "die Familie" wird im Dativ zu "der Familie".$$,
      'expected', $$Ich wohne bei der Gastfamilie in Köln.$$
    ),
    jsonb_build_object(
      'question', $$Bilde eine höfliche Frage mit "dürfen": ich / noch etwas Brot / haben$$,
      'hint', $$"dürfen" ist ein Modalverb, konjugiert an zweiter Stelle.$$,
      'expected', $$Darf ich noch etwas Brot haben?$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz mit dem trennbaren Verb "aufstehen": meine Gastmutter / um sieben Uhr$$,
      'hint', $$Die Vorsilbe "auf" steht am Satzende.$$,
      'expected', $$Meine Gastmutter steht um sieben Uhr auf.$$
    ),
    jsonb_build_object(
      'question', $$Bedanke dich höflich für ein gutes Essen.$$,
      'hint', $$Benutze "Danke" und ein Kompliment über den Geschmack.$$,
      'expected', $$Vielen Dank, es hat sehr gut geschmeckt!$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-sejour-famille-allemande';
