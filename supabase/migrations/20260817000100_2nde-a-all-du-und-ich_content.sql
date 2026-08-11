-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Allemand, categoryid=96.
-- Moodle course id 1732 (Fiche 1): "LEÇON 2: DU UND ICH"
-- (https://lyc.ecole-ci.org/course/view.php?id=1732), resource mod_resource
-- id 14270 redirecting to pluginfile "ALLEMAND 2nde LECON 2 FICHE 1.pdf".
-- Moodle course id 1734 (Fiche 2, même leçon): resource mod_resource id
-- 14306 redirecting to pluginfile "ALLEMAND 2nde LECON 2 FICHE 2.pdf".
-- Contenu entièrement en allemand (immersion linguistique), reformulé et
-- paraphrasé à partir des deux fiches PDF (Thème : les relations
-- interpersonnelles ; critères d'une bonne relation, amitié, couples
-- biculturels ; grammaire des verbes à préposition, des pronoms adverbiaux
-- wo-/da-, des prépositions en -einander et des conjonctions de
-- coordination). 100% reformulé, aucune phrase copiée verbatim du PDF
-- source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-all-du-und-ich',
  '2nde',
  'A',
  'allemand',
  $$Du und ich$$,
  2,
  '2nde-a-all-kontakte-ueber-grenzen',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Die Mitglieder des Deutschclubs vom Lycée Classique organisieren eine Debatte zum Thema „Kriterien einer guten Beziehung“ und, in einer zweiten Runde, zu den Themen „bikulturelle Paare“ und „Liebe“. Alle Schüler der Klasse sind eingeladen, ihre Meinung zu äußern und dafür Argumente zu sammeln.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Was ist Jugendlichen in einer Beziehung wichtig?$$,
        'body', $$Eine Umfrage unter Jugendlichen zeigt, welche Eigenschaften bei Freundschaft und Liebe am meisten zählen. Ehrlichkeit steht klar an erster Stelle, vor allem bei Mädchen. Auch gutes Aussehen, Intelligenz, Humor und Zärtlichkeit spielen eine Rolle, während Geld und Interesse an Kultur und Politik seltener genannt werden. Die Zahlen zeigen außerdem kleine Unterschiede zwischen Jungen und Mädchen.$$,
        'highlights', array[$$Ehrlichkeit$$, $$Zärtlichkeit$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Eigenschaft$$, $$Jungen$$, $$Mädchen$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ehrlichkeit$$, $$44 %$$, $$55 %$$),
            jsonb_build_array($$Gutes Aussehen$$, $$37 %$$, $$33 %$$),
            jsonb_build_array($$Intelligenz$$, $$30 %$$, $$31 %$$),
            jsonb_build_array($$Humor$$, $$28 %$$, $$29 %$$),
            jsonb_build_array($$Zärtlichkeit$$, $$16 %$$, $$26 %$$),
            jsonb_build_array($$Geld$$, $$13 %$$, $$8 %$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Welche Eigenschaft ist laut der Umfrage sowohl bei Jungen als auch bei Mädchen am wichtigsten?$$, 'solution', $$Die Ehrlichkeit (44 % bei Jungen, 55 % bei Mädchen).$$)
      ),
      jsonb_build_object(
        'heading', $$Was tun gute Freunde?$$,
        'body', $$Gute Freunde erkennt man an konkretem Verhalten, nicht nur an schönen Worten. Sie erleben gemeinsam etwas, haben Vertrauen zueinander und helfen bei Problemen. Sie reden nicht schlecht übereinander, akzeptieren die Fehler des anderen und interessieren sich füreinander. Ein guter Freund ist außerdem zuverlässig und wünscht dem anderen immer nur Gutes.$$,
        'highlights', array[$$Vertrauen haben$$, $$zuverlässig sein$$]::text[],
        'property', jsonb_build_object('label', $$Wortschatz Freundschaft$$, 'text', $$gemeinsam etwas erleben – Vertrauen haben – bei Problemen helfen – nicht schlecht übereinander reden – Fehler akzeptieren – sich füreinander interessieren – zuverlässig sein$$),
        'fixation', jsonb_build_object('question', $$Nenne zwei Verhaltensweisen, die laut dem Text zu einer guten Freundschaft gehören.$$, 'solution', $$Zum Beispiel: gemeinsam etwas erleben und Vertrauen haben, oder bei Problemen helfen und die Fehler des anderen akzeptieren.$$)
      ),
      jsonb_build_object(
        'heading', $$Verben mit Präposition und die Pronomen wo(r)-/da(r)-$$,
        'body', $$Viele deutsche Verben brauchen eine feste Präposition, zum Beispiel „sich beklagen über“ (Akkusativ) oder „zerbrechen an“ (Dativ). Wenn man nach einer Sache fragt, bildet man das Fragewort mit wo(r) + Präposition: „Worüber beklagst du dich?“. Wenn man eine Sache durch ein Pronomen ersetzt, benutzt man da(r) + Präposition: „Ich beklage mich darüber.“ Bei einer Präposition, die mit einem Vokal beginnt, wird ein „r“ eingeschoben. Wichtig: Diese Pronominaladverbien benutzt man nur für Sachen, nicht für Personen – bei Personen sagt man zum Beispiel „an ihn“ und nicht „daran“.$$,
        'highlights', array[$$wo(r)- + Präposition$$, $$da(r)- + Präposition$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Präpositionen + Akkusativ$$, $$Präpositionen + Dativ$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$an, auf, für, gegen, in, über, um$$, $$an, bei, mit, nach, von, vor, zu$$),
            jsonb_build_array($$z.B. sich beklagen über …$$, $$z.B. zerbrechen an …$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Sie denkt an ihren Sohn. Wie fragt man danach, und wie ersetzt man „an ihren Sohn“ durch ein Pronomen?$$, 'solution', $$Frage: „An wen denkt sie?“ (Person → kein da-/wo-Pronomen). Antwort: „Sie denkt an ihn.“$$),
        'fixation', jsonb_build_object('question', $$Bildet man bei einer Person das Pronomen mit da(r)- + Präposition?$$, 'solution', $$Nein. Die wo(r)-/da(r)-Pronomen benutzt man nur für Sachen; bei Personen benutzt man Präposition + Personalpronomen (z. B. „an ihn“).$$)
      ),
      jsonb_build_object(
        'heading', $$Präpositionen mit -einander: etwas gemeinsam tun$$,
        'body', $$Um auszudrücken, dass zwei Personen etwas gegenseitig tun, verbindet man eine Präposition mit -einander. Aus „Ich verlasse mich auf ihn“ und „Er verlässt sich auf mich“ wird zum Beispiel „Wir verlassen uns aufeinander“. Genauso wird aus zwei einzelnen Sätzen mit „mit“, „über“ oder „von“ jeweils ein gemeinsamer Satz mit miteinander, übereinander oder voneinander.$$,
        'highlights', array[$$aufeinander$$, $$miteinander$$, $$voneinander$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Zwei einzelne Sätze$$, $$Ein gemeinsamer Satz$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Ich verlasse mich auf ihn. / Er verlässt sich auf mich.$$, $$Wir verlassen uns aufeinander.$$),
            jsonb_build_array($$Sie redet mit mir. / Ich rede mit ihr.$$, $$Wir reden miteinander.$$),
            jsonb_build_array($$Du lernst von ihm. / Er lernt von dir.$$, $$Ihr lernt voneinander.$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Verbinde: „Sie spricht nicht schlecht über ihn“ und „Er spricht nicht schlecht über sie“ zu einem Satz mit -einander.$$, 'solution', $$„Sie sprechen nicht schlecht übereinander.“$$)
      ),
      jsonb_build_object(
        'heading', $$Bikulturelle Paare: dafür und dagegen$$,
        'body', $$Der Text „Liebe ohne Grenzen“ diskutiert die Vor- und Nachteile bikultureller Paare. Auf der positiven Seite lernt man eine andere Kultur und andere Völker kennen, lernt Sprachen und Sitten, baut Vorurteile ab, und die Kinder wachsen zweisprachig auf. Auf der negativen Seite gibt es aber auch Konflikte, Missverständnisse und Streitereien, man kann die eigene Familie und Kultur vernachlässigen, und die Papiere für eine Heirat zu besorgen ist oft kompliziert.$$,
        'highlights', array[$$dafür$$, $$dagegen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Dafür$$, $$Dagegen$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Man lernt eine andere Kultur und Sprache kennen.$$, $$Es gibt oft Konflikte und Missverständnisse.$$),
            jsonb_build_array($$Man baut Vorurteile ab.$$, $$Man vergisst manchmal die eigene Familie.$$),
            jsonb_build_array($$Die Kinder wachsen zweisprachig auf.$$, $$Die Papiere für die Heirat sind kompliziert.$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Nenne ein Argument dafür und eines dagegen bei einem bikulturellen Paar.$$, 'solution', $$Dafür z. B.: Man lernt eine andere Kultur kennen. Dagegen z. B.: Es gibt oft Missverständnisse und Konflikte.$$)
      ),
      jsonb_build_object(
        'heading', $$Die koordinierenden Konjunktionen: und, oder, aber, denn, sondern$$,
        'body', $$Die Konjunktionen und, oder, aber, denn und sondern verbinden zwei Hauptsätze, ohne die Wortstellung im zweiten Satz zu verändern: Sie stehen auf „Position 0“, danach kommt sofort das Subjekt (Position 1) und dann das Verb (Position 2), genau wie in einem normalen Hauptsatz. „Und“ drückt eine Addition aus, „oder“ eine Alternative, „aber“ einen Kontrast. Zum Beispiel: „Die Menschen heute sind mobil, und sie reisen um die Welt.“$$,
        'highlights', array[$$Position 0$$, $$Hauptsatz + Hauptsatz$$]::text[],
        'example', jsonb_build_object('statement', $$Verbinde mit „aber“: „Ich mache das ganze Jahr Sport.“ / „Im Dezember mache ich einen Adventskalender.“$$, 'solution', $$„Ich mache das ganze Jahr Sport, aber im Dezember mache ich einen Adventskalender.“ (Kontrast, Verb bleibt an Position 2.)$$),
        'fixation', jsonb_build_object('question', $$Verändert sich die Wortstellung im zweiten Satz, wenn man ihn mit „und“ an den ersten Satz anschließt?$$, 'solution', $$Nein: „und“ steht auf Position 0, danach folgen wie gewohnt Subjekt (Position 1) und Verb (Position 2).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ein Freund bittet dich, ihm in 5 bis 8 Zeilen von den Kriterien einer guten Beziehung zu erzählen: Nenne drei Kriterien, beschreibe deinen besten Freund oder deine beste Freundin, und benutze dabei mindestens eine Präposition mit -einander sowie eine koordinierende Konjunktion.$$,
      'questions', array[
        $$Nenne drei Kriterien für eine gute Beziehung zwischen Freunden.$$,
        $$Beschreibe kurz deinen besten Freund oder deine beste Freundin.$$,
        $$Bilde einen Satz mit einer Präposition + -einander (z. B. miteinander, aufeinander).$$,
        $$Nenne ein Argument dafür und ein Argument dagegen bei einem bikulturellen Paar.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Welche Eigenschaft steht laut der Umfrage bei Mädchen an erster Stelle?$$,
      'hint', $$Es ist die Eigenschaft mit 55 %.$$,
      'expected', $$Die Ehrlichkeit.$$
    ),
    jsonb_build_object(
      'question', $$Bildet man das da(r)-Pronomen auch für Personen?$$,
      'hint', $$Denk an den Unterschied zwischen Sachen und Personen.$$,
      'expected', $$Nein, nur für Sachen. Für Personen benutzt man Präposition + Personalpronomen, z. B. „an ihn“.$$
    ),
    jsonb_build_object(
      'question', $$Verbinde zu einem Satz mit -einander: „Du lernst von ihm“ und „Er lernt von dir.“$$,
      'hint', $$Die Präposition ist „von“.$$,
      'expected', $$„Ihr lernt voneinander.“$$
    ),
    jsonb_build_object(
      'question', $$Nenne einen Nachteil bikultureller Paare, der im Text genannt wird.$$,
      'hint', $$Denk an Familie, Kultur oder Bürokratie.$$,
      'expected', $$Zum Beispiel: häufige Konflikte und Missverständnisse, oder komplizierte Papiere für die Heirat.$$
    )
  ),
  now()
);
