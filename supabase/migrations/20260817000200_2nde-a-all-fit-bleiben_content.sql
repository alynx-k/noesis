-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Allemand, categoryid=96.
-- Moodle course id 1738 (Fiche 1): "LEÇON 3: FIT BLEIBEN"
-- (https://lyc.ecole-ci.org/course/view.php?id=1738), resource mod_resource
-- id 14354 redirecting to pluginfile "ALLEMAND 2nde LECON 3 FICHE 1.pdf".
-- Moodle course id 1741 (Fiche 2, même leçon): resource mod_resource id
-- 14378 redirecting to pluginfile "ALLEMAND 2nde LECON 3 FICHE 2.pdf".
-- Contenu entièrement en allemand (immersion linguistique), reformulé et
-- paraphrasé à partir des deux fiches PDF (Thème : la pratique du sport et
-- la santé ; vocabulaire des sports, phrases de but avec damit/um...zu,
-- situation d'un élève en surpoids, révision du passif dans tous les temps
-- et les trois emplois de "werden"). 100% reformulé, aucune phrase copiée
-- verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-all-fit-bleiben',
  '2nde',
  'A',
  'allemand',
  $$Fit bleiben$$,
  3,
  '2nde-a-all-du-und-ich',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Im Rahmen seiner Aktivitäten organisiert der Sportclub des Gymnasiums eine Debatte zum Thema „Sport und Gesundheit“, um für das Sporttreiben zu sensibilisieren. Kurz danach sehen zwei Schüler, Karim und sein Freund Diabagaté, auf dem Schulhof einen gleichaltrigen, übergewichtigen Mitschüler, der sich nur schwer bewegen kann. Besorgt wollen sie verstehen, warum er zu dick ist und was man für ihn tun kann – deshalb fragen sie einen Arzt um Rat.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Sportarten: der Wortschatz$$,
        'body', $$Es gibt sehr viele Sportarten, und jede hat im Deutschen ihr eigenes Wort: Fußball, Basketball, Handball, Volleyball, Tennis und Eishockey spielt man; Ski, Fahrrad und Snowboard fährt man; Gymnastik, Krafttraining und Leichtathletik macht man; und ganz allgemein treibt man Sport. Boxen, Karate, Turnen, Schwimmen und Parkour sind weitere beliebte Sportarten unter Jugendlichen.$$,
        'highlights', array[$$Sport treiben$$, $$Ski fahren$$, $$ein Tor schießen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$Beispiele$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$treiben$$, $$Sport treiben$$),
            jsonb_build_array($$fahren$$, $$Ski, Fahrrad, Snowboard fahren$$),
            jsonb_build_array($$spielen$$, $$Fußball, Tennis, Volleyball, Eishockey spielen$$),
            jsonb_build_array($$machen$$, $$Gymnastik, Krafttraining, Leichtathletik machen$$),
            jsonb_build_array($$schießen$$, $$ein Tor schießen$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Welches Verb passt zu „Ski, Fahrrad, Snowboard“?$$, 'solution', $$Das Verb „fahren“: Ski fahren, Fahrrad fahren, Snowboard fahren.$$)
      ),
      jsonb_build_object(
        'heading', $$Finalsätze mit damit und um…zu$$,
        'body', $$Um den Zweck oder das Ziel einer Handlung auszudrücken, benutzt man im Deutschen entweder damit oder um…zu. Man verwendet um…zu, wenn das Subjekt in beiden Satzteilen gleich ist. Man verwendet damit, wenn die beiden Satzteile unterschiedliche Subjekte haben. Wichtig: In einem Satz mit um…zu dürfen die Modalverben wollen, mögen und sollen nicht stehen.$$,
        'highlights', array[$$um…zu$$, $$damit$$]::text[],
        'example', jsonb_build_object('statement', $$Verbinde: „Der Sportclub organisiert eine Debatte.“ + „Die Schüler werden für das Sporttreiben sensibilisiert.“ (verschiedene Subjekte)$$, 'solution', $$„Der Sportclub organisiert eine Debatte, damit die Schüler für das Sporttreiben sensibilisiert werden.“$$),
        'fixation', jsonb_build_object('question', $$Benutzt man um…zu, wenn Haupt- und Nebensatz das gleiche Subjekt haben oder ein unterschiedliches?$$, 'solution', $$Man benutzt um…zu bei gleichem Subjekt; bei unterschiedlichem Subjekt benutzt man damit.$$)
      ),
      jsonb_build_object(
        'heading', $$Das Passiv in allen Zeiten$$,
        'body', $$Das Passiv bildet man mit werden + Partizip II. Im Präsens sagt man „Das Projekt wird finanziert“, im Präteritum „Das Projekt wurde finanziert“, und im (seltenen) Perfekt „Das Projekt ist finanziert worden“ – im Perfekt Passiv steht also sein + Partizip II + worden, nicht das normale Partizip „geworden“. Wenn kein anderes Wort die erste Position im Satz besetzt, kann der Platzhalter es an den Satzanfang treten: „Es wird hart und diszipliniert gearbeitet.“ Steht schon ein anderes Element vorne, entfällt das es: „Bei uns wird hart und diszipliniert gearbeitet.“$$,
        'highlights', array[$$werden + Partizip II$$, $$Perfekt Passiv: sein + Partizip II + worden$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Zeit$$, $$Beispiel$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Präsens$$, $$Das Projekt wird von privaten Sponsoren finanziert.$$),
            jsonb_build_array($$Präteritum$$, $$Das Projekt wurde von einem Ex-Boxer ins Leben gerufen.$$),
            jsonb_build_array($$Perfekt (selten)$$, $$Meine Schwester und ich sind von der Mama abgeholt worden.$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Wie bildet man das Perfekt Passiv?$$, 'solution', $$Mit sein + Partizip II des Verbs + worden, z. B. „ist finanziert worden“.$$)
      ),
      jsonb_build_object(
        'heading', $$Passiv mit Modalverben$$,
        'body', $$Wenn ein Modalverb wie können oder müssen im Satz steht, bildet man das Passiv mit Modalverb + Partizip II + werden (im Infinitiv, ganz am Satzende). Im Präteritum ändert sich nur die Form des Modalverbs, werden bleibt im Infinitiv: „Ich musste am Knie operiert werden.“$$,
        'highlights', array[$$Modalverb + Partizip II + werden$$]::text[],
        'example', jsonb_build_object('statement', $$Bilde das Passiv mit Modalverb: „Man kann viele Muskeln aufbauen.“$$, 'solution', $$„Viele Muskeln können aufgebaut werden.“$$),
        'fixation', jsonb_build_object('question', $$In welcher Form steht „werden“ im Passiv mit Modalverben?$$, 'solution', $$Im Infinitiv, am Ende des Satzes, z. B. „…operiert werden.“$$)
      ),
      jsonb_build_object(
        'heading', $$Die drei Verwendungen von werden$$,
        'body', $$Das Verb werden hat drei ganz unterschiedliche Funktionen. Erstens bildet es zusammen mit einem Partizip II das Passiv: „Das Projekt wird finanziert.“ Zweitens bildet es zusammen mit einem Adjektiv eine Veränderung, ähnlich wie „devenir“: „Der Schnee wird weich.“ Drittens bildet es zusammen mit einem Nomen einen zukünftigen Beruf oder Status: „Ich werde Profi.“ Man muss also immer genau schauen, was nach werden steht, um die richtige Bedeutung zu verstehen.$$,
        'highlights', array[$$werden + Partizip II$$, $$werden + Adjektiv$$, $$werden + Nomen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Struktur$$, $$Bedeutung$$, $$Beispiel$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$werden + Partizip II$$, $$Passiv$$, $$Das Projekt wird finanziert.$$),
            jsonb_build_array($$werden + Adjektiv$$, $$Veränderung (devenir)$$, $$Der Schnee wird weich.$$),
            jsonb_build_array($$werden + Nomen$$, $$zukünftiger Beruf/Status$$, $$Ich werde Profi.$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Welche Bedeutung hat „werden“ im Satz „Ich werde einmal Profi“?$$, 'solution', $$Werden + Nomen drückt hier einen zukünftigen Beruf aus, nicht das Passiv.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ein deutscher Freund fragt per E-Mail, welchen Sport du treibst und warum Sport für die Gesundheit wichtig ist. Erkläre ihm außerdem, warum ein übergewichtiger Mitschüler Sport treiben sollte, und benutze dabei einen Finalsatz mit damit oder um…zu sowie einen Satz im Passiv.$$,
      'questions', array[
        $$Nenne zwei Sportarten und das passende Verb dazu (z. B. Fußball spielen).$$,
        $$Bilde einen Finalsatz mit um…zu, der erklärt, warum man Sport treibt.$$,
        $$Bilde einen Satz im Passiv Präsens mit dem Verb „unterstützen“.$$,
        $$Erkläre den Unterschied zwischen „werden + Partizip II“ und „werden + Adjektiv“.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Welches Verb benutzt man für „Fußball, Tennis, Volleyball“?$$,
      'hint', $$Man benutzt dasselbe Verb wie bei Eishockey.$$,
      'expected', $$Spielen: Fußball spielen, Tennis spielen, Volleyball spielen.$$
    ),
    jsonb_build_object(
      'question', $$Wann benutzt man um…zu statt damit?$$,
      'hint', $$Denk an das Subjekt in beiden Satzteilen.$$,
      'expected', $$Wenn Haupt- und Nebensatz das gleiche Subjekt haben.$$
    ),
    jsonb_build_object(
      'question', $$Wie bildet man das Passiv, wenn ein Modalverb im Satz steht?$$,
      'hint', $$Denk an die Position von „werden“.$$,
      'expected', $$Mit Modalverb + Partizip II + werden (Infinitiv am Satzende), z. B. „…operiert werden.“$$
    ),
    jsonb_build_object(
      'question', $$Was bedeutet „werden“ im Satz „Der Schnee wird weich“?$$,
      'hint', $$Es ist nicht das Passiv.$$,
      'expected', $$Es drückt eine Veränderung aus (werden + Adjektiv), vergleichbar mit „devenir“.$$
    )
  ),
  now()
);
