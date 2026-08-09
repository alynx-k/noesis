-- Contenu de secours (fallback) : tentative de récupération d'un vrai PDF
-- ecole-ci.org menée le 2026-08-08. Le site "Collège Numérique"
-- (coll.ecole-ci.org) est bien accessible avec la connexion actuelle
-- (d'autres matières/niveaux s'ouvrent normalement, PDF compris). Mais la
-- catégorie Allemand de TROISIEME (Cours > TROISIEME > Allemand,
-- categoryid=2) liste 8 cours génériques "THEME n LEÇON m"
-- (id Moodle 870, 868, 867, 866, 864, 862, 859, 841) et CHACUN d'entre eux
-- (4 testés directement dans des onglets neufs : 870, 868, 867, 866) redirige
-- systématiquement vers une page d'inscription affichant "Vous n'êtes pas
-- inscrit(e) à ce cours" / "Votre inscription ne vous permet pas d'avoir
-- accès à ce cours" : la catégorie Allemand 3ème est donc hors du périmètre
-- de l'abonnement actuel, contrairement aux autres matières/niveaux.
-- Impossible d'en récupérer un PDF réel. Contenu original conservé, écrit à
-- partir d'une connaissance générale solide d'un programme d'allemand LV2
-- débutant standard, sur le thème des préparatifs d'un voyage en Allemagne.
-- Même approche immersive que les leçons Anglais : contenu de la leçon
-- (situation, sections, vocabulaire, grammaire, exemples, exercices) rédigé
-- en allemand ; seul le chrome structurel de l'application reste en
-- français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Du bereitest deine erste Reise nach Deutschland vor. Du musst wissen, was du einpacken musst, welche Dokumente du brauchst, und wie man auf Deutsch über zukünftige Pläne spricht.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: die Reisevorbereitungen$$,
        'body', $$Bevor du nach Deutschland reist, musst du die richtigen Wörter kennen, um deine Reise zu planen: was du einpackst, welche Dokumente du brauchst, und was du organisieren musst.$$,
        'highlights', array[$$der Koffer$$, $$der Reisepass$$, $$packen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Koffer$$, $$ein Gepäckstück, in das man Kleidung und andere Sachen für die Reise packt$$),
            jsonb_build_array($$der Reisepass$$, $$ein amtliches Dokument, das die Identität einer Person im Ausland bestätigt$$),
            jsonb_build_array($$das Visum$$, $$eine offizielle Erlaubnis, in ein Land einzureisen$$),
            jsonb_build_array($$das Flugticket$$, $$der Fahrschein für eine Reise mit dem Flugzeug$$),
            jsonb_build_array($$packen$$, $$Kleidung und Gegenstände in einen Koffer legen$$),
            jsonb_build_array($$buchen$$, $$einen Platz oder ein Ticket im Voraus reservieren$$),
            jsonb_build_array($$das Gepäck$$, $$alle Koffer und Taschen, die man auf eine Reise mitnimmt$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Das Modalverb "müssen" drückt eine Notwendigkeit aus: ich muss, du musst, er/sie/es muss, wir müssen, ihr müsst, sie/Sie müssen. Es steht an zweiter Stelle im Satz, und der Infinitiv des zweiten Verbs steht am Satzende.$$),
        'example', jsonb_build_object('statement', $$Was musst du vor der Reise machen?$$, 'solution', $$Ich muss meinen Koffer packen und meinen Reisepass mitnehmen.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit der richtigen Form von "müssen": Wir ___ (müssen) unsere Fahrkarten buchen.$$, 'solution', $$Wir müssen unsere Fahrkarten buchen.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: die Zukunft mit "werden" ausdrücken$$,
        'body', $$Um über Pläne zu sprechen, die du in der Zukunft machen wirst, benutzt du das Verb "werden" als Hilfsverb an zweiter Stelle und den Infinitiv am Satzende.$$,
        'highlights', array[$$werden$$, $$Infinitiv$$, $$Satzende$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"werden" wird konjugiert: ich werde, du wirst, er/sie/es wird, wir werden, ihr werdet, sie/Sie werden. Danach folgt der Infinitiv des Hauptverbs ganz am Ende des Satzes.$$),
        'example', jsonb_build_object('statement', $$Was wirst du in Deutschland machen?$$, 'solution', $$Ich werde die Museen besuchen und neue Freunde kennenlernen.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz im Futur: du / eine Sprachschule / besuchen$$, 'solution', $$Du wirst eine Sprachschule besuchen.$$)
      ),
      jsonb_build_object(
        'heading', $$Fragen zur Reiseplanung stellen$$,
        'body', $$Bei der Planung einer Reise stellt man oft Fragen mit Fragewörtern wie "Wohin", "Wann" und "Wie lange", um Ziel, Zeitpunkt und Dauer der Reise zu klären.$$,
        'highlights', array[$$Wohin$$, $$Wann$$, $$Wie lange$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fragewort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Wohin$$, $$fragt nach dem Ziel einer Bewegung, zum Beispiel: Wohin fährst du?$$),
            jsonb_build_array($$Wann$$, $$fragt nach dem Zeitpunkt eines Ereignisses, zum Beispiel: Wann fliegst du ab?$$),
            jsonb_build_array($$Wie lange$$, $$fragt nach der Dauer eines Aufenthalts, zum Beispiel: Wie lange bleibst du?$$),
            jsonb_build_array($$Wie$$, $$fragt nach der Art und Weise, zum Beispiel: Wie reist du?$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$In einer W-Frage steht das Fragewort an erster Stelle, direkt danach das konjugierte Verb, dann das Subjekt: Fragewort + Verb + Subjekt + ...?$$),
        'example', jsonb_build_object('statement', $$Bilde eine Frage mit "Wohin": (du / fahren / nach Berlin)$$, 'solution', $$Wohin fährst du? Ich fahre nach Berlin.$$),
        'fixation', jsonb_build_object('question', $$Stelle die passende Frage zu dieser Antwort: "Ich bleibe zwei Wochen in Deutschland."$$, 'solution', $$Wie lange bleibst du in Deutschland? Ich bleibe zwei Wochen in Deutschland.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du planst deine erste Reise nach Deutschland. Ein Freund möchte wissen, was du vorbereitest, wohin du fährst, wann du abfliegst und wie lange du bleibst.$$,
      'questions', array[
        $$Sag, was du für die Reise einpacken musst (benutze "müssen").$$,
        $$Sag, was du in Deutschland machen wirst (benutze das Futur mit "werden").$$,
        $$Beantworte die Frage: Wohin fährst du und wie lange bleibst du?$$,
        $$Nenne zwei Dokumente, die du für die Reise brauchst.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze mit der richtigen Form von "müssen": Ich ___ (müssen) meinen Reisepass mitnehmen.$$,
      'hint', $$"müssen" ist ein Modalverb; das Verb "mitnehmen" bleibt im Infinitiv am Satzende.$$,
      'expected', $$Ich muss meinen Reisepass mitnehmen.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz im Futur mit "werden": wir / unsere Koffer / packen$$,
      'hint', $$werden (konjugiert) + Subjekt + ... + Infinitiv am Satzende.$$,
      'expected', $$Wir werden unsere Koffer packen.$$
    ),
    jsonb_build_object(
      'question', $$Stelle eine Frage mit "Wie lange" zu dieser Antwort: "Ich bleibe drei Wochen in Berlin."$$,
      'hint', $$Das Fragewort steht am Satzanfang, danach das konjugierte Verb.$$,
      'expected', $$Wie lange bleibst du in Berlin?$$
    ),
    jsonb_build_object(
      'question', $$Nenne zwei wichtige Dokumente für eine Reise nach Deutschland.$$,
      'hint', $$Denk an amtliche Papiere, die man am Flughafen zeigen muss.$$,
      'expected', $$Der Reisepass und das Visum sind zwei wichtige Dokumente für eine Reise nach Deutschland.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-preparatifs-voyage';
