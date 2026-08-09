-- Contenu de secours (fallback) : cf. l'en-tête de
-- 20260810700000_allemand_preparatifs_voyage_content.sql pour le contexte
-- complet. Vérifié le 2026-08-08 : la catégorie Allemand 3ème
-- (categoryid=2) sur coll.ecole-ci.org redirige systématiquement vers une
-- page "Vous n'êtes pas inscrit(e) à ce cours" — hors périmètre de
-- l'abonnement actuel, alors que le reste du site est bien accessible.
-- Impossible de récupérer un PDF réel pour cette leçon. Contenu original
-- conservé, sur la découverte de Cologne, rédigé en allemand (immersion
-- LV2).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Du besuchst zum ersten Mal die Stadt Köln. Du willst den berühmten Kölner Dom finden und musst nach dem Weg fragen und Präpositionen des Ortes richtig benutzen.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: die Stadt und ihre Sehenswürdigkeiten$$,
        'body', $$Um eine deutsche Stadt wie Köln zu entdecken, brauchst du Wörter über die Sehenswürdigkeiten: den Dom, den Fluss, die Brücke und die Altstadt.$$,
        'highlights', array[$$die Stadt$$, $$der Dom$$, $$der Fluss$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$die Stadt$$, $$ein großer besiedelter Ort mit vielen Straßen und Gebäuden$$),
            jsonb_build_array($$der Dom$$, $$eine sehr große und wichtige Kirche$$),
            jsonb_build_array($$der Fluss$$, $$ein großes fließendes Gewässer, zum Beispiel der Rhein$$),
            jsonb_build_array($$die Brücke$$, $$eine Konstruktion, die über einen Fluss oder eine Straße führt$$),
            jsonb_build_array($$das Museum$$, $$ein Gebäude, in dem man Kunstwerke oder historische Objekte ausstellt$$),
            jsonb_build_array($$die Altstadt$$, $$der älteste Teil einer Stadt$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um zu sagen, WO sich etwas befindet, benutzt man Präpositionen wie "in", "an" und "neben" mit dem Dativ.$$),
        'example', jsonb_build_object('statement', $$Wo liegt der Kölner Dom?$$, 'solution', $$Der Kölner Dom liegt in der Altstadt, neben dem Rhein.$$),
        'fixation', jsonb_build_object('question', $$Ergänze im Dativ: Das Museum liegt ___ (an) d__ Fluss.$$, 'solution', $$Das Museum liegt an dem (am) Fluss.$$)
      ),
      jsonb_build_object(
        'heading', $$Nach dem Weg fragen$$,
        'body', $$Um sich in einer neuen Stadt zurechtzufinden, muss man nach dem Weg fragen und die Antwort verstehen können.$$,
        'highlights', array[$$Wie komme ich zu...$$, $$geradeaus$$, $$links$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Ausdruck$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Wie komme ich zu...?$$, $$eine Frage, um den Weg zu einem Ort zu erfahren$$),
            jsonb_build_array($$geradeaus$$, $$in gerader Richtung weitergehen$$),
            jsonb_build_array($$links / rechts$$, $$die Richtung nach links oder rechts$$),
            jsonb_build_array($$an der Ampel$$, $$am Ort einer Verkehrsampel$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Die Präposition "zu" steht mit dem Dativ, um ein Ziel anzugeben: zu dem -> zum, zu der -> zur.$$),
        'example', jsonb_build_object('statement', $$Wie komme ich zum Kölner Dom?$$, 'solution', $$Gehen Sie geradeaus und dann links. Der Dom liegt direkt neben dem Bahnhof.$$),
        'fixation', jsonb_build_object('question', $$Ergänze: Wie komme ich ___ (zu) Museum?$$, 'solution', $$Wie komme ich zum Museum?$$)
      ),
      jsonb_build_object(
        'heading', $$Wechselpräpositionen: Wohin? mit dem Akkusativ$$,
        'body', $$Wenn man eine Bewegung IN eine Richtung beschreibt (Wohin?), benutzt man dieselben Präpositionen wie für den Ort, aber mit dem Akkusativ statt dem Dativ.$$,
        'highlights', array[$$Wohin$$, $$Akkusativ$$, $$in die$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Vergleiche: "Ich bin in der Kirche" (Wo? Dativ) und "Ich gehe in die Kirche" (Wohin? Akkusativ). Wechselpräpositionen wie "in, an, auf" stehen mit dem Dativ bei einer festen Position und mit dem Akkusativ bei einer Bewegung.$$),
        'example', jsonb_build_object('statement', $$Bilde einen Satz mit "Wohin?": wir / gehen / in / der Dom$$, 'solution', $$Wir gehen in den Dom.$$),
        'fixation', jsonb_build_object('question', $$Wähle den richtigen Artikel: Die Touristen gehen auf ___ (der/die) Brücke, um den Rhein zu sehen.$$, 'solution', $$Die Touristen gehen auf die Brücke, um den Rhein zu sehen, weil es sich um eine Bewegung (Akkusativ) handelt.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du machst eine Stadtführung durch Köln für eine Gruppe von Touristen aus deinem Land.$$,
      'questions', array[
        $$Beschreibe, wo der Kölner Dom liegt.$$,
        $$Erkläre einem Touristen, wie er zum Museum kommt.$$,
        $$Bilde einen Satz mit einer Wechselpräposition im Akkusativ (Wohin?).$$,
        $$Bilde einen Satz mit einer Wechselpräposition im Dativ (Wo?).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze mit dem richtigen Artikel im Dativ: Der Dom liegt neben ___ (der) Bahnhof.$$,
      'hint', $$"neben" + Dativ; der -> dem.$$,
      'expected', $$Der Dom liegt neben dem Bahnhof.$$
    ),
    jsonb_build_object(
      'question', $$Bilde eine Frage, um nach dem Weg zum Museum zu fragen.$$,
      'hint', $$Benutze "Wie komme ich zu...?" mit "zum".$$,
      'expected', $$Wie komme ich zum Museum?$$
    ),
    jsonb_build_object(
      'question', $$Ergänze im Akkusativ: Die Kinder laufen in ___ (die) Kirche.$$,
      'hint', $$Bei einer Bewegung (Wohin?) benutzt man den Akkusativ.$$,
      'expected', $$Die Kinder laufen in die Kirche.$$
    ),
    jsonb_build_object(
      'question', $$Beschreibe in einem Satz, wo sich der Rhein in Köln befindet.$$,
      'hint', $$Benutze "fließen" oder "liegen" mit einer Präposition im Dativ.$$,
      'expected', $$Der Rhein fließt neben dem Kölner Dom.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-decouverte-cologne';
