-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Allemand, categoryid=96.
-- Moodle course id 1744 (Fiche 1): "LEÇON 4: UNTER EINEM DACH"
-- (https://lyc.ecole-ci.org/course/view.php?id=1744), resource mod_resource
-- id 14414 redirecting to pluginfile "ALLEMAND 2nde LECON 4 FICHE 1.pdf".
-- Moodle course id 1747 (Fiche 2, même leçon): resource mod_resource id
-- 14450 redirecting to pluginfile "ALLEMAND 2nde LECON 4 FICHE 2.pdf".
-- Contenu entièrement en allemand (immersion linguistique), reformulé et
-- paraphrasé à partir des deux fiches PDF (Thème : la vie en famille ;
-- relations parents-enfants, fratrie, colocation/Wohngemeinschaft ;
-- grammaire du subjonctif II - formation et emplois -, des particules
-- modales et du pronom indéfini "man"). 100% reformulé, aucune phrase
-- copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-all-unter-einem-dach',
  '2nde',
  'A',
  'allemand',
  $$Unter einem Dach$$,
  4,
  '2nde-a-all-fit-bleiben',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Im Rahmen der Partnerschaft zwischen deinem Gymnasium und einem deutschen Gymnasium wollen die deutschen Partnerschüler eine Reise in die Côte d'Ivoire organisieren. Dafür schicken ivorische Schüler ihnen kommentierte Fotocollagen über das Gemeinschaftsleben in ihrem Land. Wenig später organisiert der Deutschclub außerdem eine Diskussion zum Thema „Formen des Zusammenlebens“: Konan sammelt dabei viele Informationen über die Vor- und Nachteile verschiedener Wohnformen und berichtet später darüber in seiner Klasse.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Zusammenleben unter einem Dach: von der Familie zur Wohngemeinschaft$$,
        'body', $$In Deutschland leben junge Leute nicht immer im Elternhaus: Viele Studenten ziehen in eine Wohngemeinschaft (WG), das heißt, sie teilen sich eine Wohnung mit anderen Studenten. Das Leben in einer WG bringt Themen wie Miete, Zimmer, Küche und Freundschaft mit sich, aber auch mögliche Konflikte, Streit und die Frage von Vertrauen und Toleranz. Trotzdem sagen viele, das WG-Leben habe „eben auch ein bisschen was von Familie“.$$,
        'highlights', array[$$Wohngemeinschaft (WG)$$, $$Zusammenleben$$]::text[],
        'property', jsonb_build_object('label', $$Wortschatz WG$$, 'text', $$die Miete, das Zimmer, die Küche, der Streit, das Vertrauen, die Toleranz, die Freundschaft, die Konflikte, die Erziehung, das Zusammenleben$$),
        'fixation', jsonb_build_object('question', $$Was bedeutet die Abkürzung „WG“, und was bedeutet sie konkret für das Leben von Studenten?$$, 'solution', $$„WG“ steht für Wohngemeinschaft: mehrere Personen, oft Studenten, teilen sich eine Wohnung.$$)
      ),
      jsonb_build_object(
        'heading', $$Der Konjunktiv II: Formen$$,
        'body', $$Der Konjunktiv II der Gegenwart wird aus dem Stamm des Präteritums gebildet, mit den Endungen -st, -n, -t, -n. Bei sein, haben und werden benutzt man ganz spezielle Formen: ich wäre, ich hätte, ich würde. Bei schwachen Verben ist die Konjunktiv-II-Form oft identisch mit dem Präteritum; um Verwechslungen zu vermeiden, benutzt man deshalb meistens würde + Infinitiv am Satzende (z. B. „er würde kaufen“). Bei starken Verben nimmt man den Präteritumstamm, fügt ein -e- hinzu und setzt, wenn möglich, einen Umlaut auf a, o oder u.$$,
        'highlights', array[$$würde + Infinitiv$$, $$Präteritumstamm + Umlaut$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Person$$, $$sein$$, $$haben$$, $$werden$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$ich$$, $$wäre$$, $$hätte$$, $$würde$$),
            jsonb_build_array($$du$$, $$wärest$$, $$hättest$$, $$würdest$$),
            jsonb_build_array($$er/es/sie$$, $$wäre$$, $$hätte$$, $$würde$$),
            jsonb_build_array($$wir$$, $$wären$$, $$hätten$$, $$würden$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Warum benutzt man bei vielen schwachen Verben lieber „würde + Infinitiv“ statt der einfachen Konjunktiv-II-Form?$$, 'solution', $$Weil die einfache Form bei schwachen Verben oft genauso aussieht wie das Präteritum; „würde + Infinitiv“ vermeidet die Verwechslung.$$)
      ),
      jsonb_build_object(
        'heading', $$Der Konjunktiv II: wichtige Verwendungen$$,
        'body', $$Der Konjunktiv II drückt vor allem vier Dinge aus. Erstens eine irreale Bedingung mit wenn: „Wenn sie mehr Vertrauen zu mir hätten, würde ich mich in der Schule mehr anstrengen.“ Zweitens einen Vergleich mit als ob, der nicht der Wirklichkeit entspricht: „Er tut, als ob er sehr reich wäre.“ Drittens einen Ratschlag mit an deiner/seiner Stelle: „An deiner Stelle würde ich einen Computer kaufen.“ Viertens eine höfliche Bitte: „Könntest du bitte dein Handy haben und meine Mutter anrufen?“$$,
        'highlights', array[$$irreale Bedingung$$, $$als ob$$, $$höfliche Bitte$$]::text[],
        'example', jsonb_build_object('statement', $$Formuliere höflich eine Bitte um ein Telefon, anstatt einfach zu befehlen „Gib mir dein Handy!“$$, 'solution', $$„Könntest du mir bitte dein Handy geben?“ – der Konjunktiv II macht die Bitte höflicher.$$),
        'fixation', jsonb_build_object('question', $$Welche Konjunktion benutzt man, um eine irreale Bedingung einzuleiten?$$, 'solution', $$„wenn“, gefolgt von einem Nebensatz im Konjunktiv II, z. B. „Wenn Ali so groß wie sein Bruder wäre, würde er schon Geld verdienen.“$$)
      ),
      jsonb_build_object(
        'heading', $$Modalpartikeln: kleine Wörter mit großer Wirkung$$,
        'body', $$Modalpartikeln wie denn, ja, schon, allerdings, übrigens und eben machen die gesprochene und persönlich geschriebene Sprache (zum Beispiel E-Mails) lebendiger. Sie zeigen die Einstellung oder das Gefühl des Sprechers. „Denn“ macht eine Frage interessierter: „Seid ihr denn zufrieden mit eurer Wohnung?“ „Ja“ drückt eine angenehme Überraschung oder Überzeugung aus: „Das ist ja nett.“ „Schon“ betont eine Meinung: „Das ist schon genial!“ „Allerdings“ drückt eine Einschränkung aus, „übrigens“ leitet eine Nebeninformation ein, und „eben“ drückt eine Ähnlichkeit oder Bestätigung aus.$$,
        'highlights', array[$$denn$$, $$ja$$, $$schon$$, $$eben$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Partikel$$, $$Bedeutung$$, $$Beispiel$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$denn$$, $$interessierte Frage$$, $$Seid ihr denn zufrieden?$$),
            jsonb_build_array($$ja$$, $$angenehme Überraschung / Überzeugung$$, $$Das ist ja nett.$$),
            jsonb_build_array($$schon$$, $$Betonung der eigenen Meinung$$, $$Das ist schon genial!$$),
            jsonb_build_array($$allerdings$$, $$Einschränkung$$, $$Hier sieht's allerdings sauber aus.$$),
            jsonb_build_array($$eben$$, $$Ähnlichkeit/Bestätigung$$, $$Das WG-Leben hat eben was von Familie.$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Welche Modalpartikel benutzt man, um eine Einschränkung auszudrücken?$$, 'solution', $$„Allerdings“, z. B. „Hier sieht's allerdings ziemlich sauber aus.“$$)
      ),
      jsonb_build_object(
        'heading', $$Das indefinite Pronomen man$$,
        'body', $$Man benutzt man, wenn man ganz allgemein von „den Leuten“ oder von niemandem Bestimmtem spricht. Im Nominativ heißt es man, im Akkusativ wird daraus einen, und im Dativ einem. Zum Beispiel: „Es gibt so Tage, wenn man lernen muss, da nervt einen schon das kleinste Geräusch“ (Akkusativ) oder „Da ist niemand da, der einem hilft, wenn man mal eine Frage hat“ (Dativ).$$,
        'highlights', array[$$man / einen / einem$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fall$$, $$Form$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Nominativ$$, $$man$$),
            jsonb_build_array($$Akkusativ$$, $$einen$$),
            jsonb_build_array($$Dativ$$, $$einem$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Welche Form von „man“ benutzt man im Dativ?$$, 'solution', $$„Einem“, z. B. „…der einem hilft.“$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du lebst mit deiner Tante und ihren Kindern zusammen unter einem Dach in einer Einzimmerwohnung, und du fühlst dich dort nicht wohl. Beschreibe die Probleme in der Wohnung und schlage Lösungen vor. Benutze dabei mindestens einen Satz im Konjunktiv II (irreale Bedingung oder Ratschlag) und eine Modalpartikel.$$,
      'questions', array[
        $$Zitiere zwei mögliche Probleme des Zusammenlebens in einer engen Wohnung.$$,
        $$Schlage eine Lösung vor, um eines dieser Probleme zu lösen.$$,
        $$Bilde einen Satz im Konjunktiv II mit „an deiner Stelle würde ich …“.$$,
        $$Erkläre, was das Wort „WG“ bedeutet und nenne zwei damit verbundene Wörter.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Wie bildet man den Konjunktiv II von „haben“ in der ich-Form?$$,
      'hint', $$Denk an den Präteritumstamm mit Umlaut.$$,
      'expected', $$Ich hätte.$$
    ),
    jsonb_build_object(
      'question', $$Mit welcher Konjunktion leitet man eine irreale Bedingung im Konjunktiv II ein?$$,
      'hint', $$Es ist dieselbe Konjunktion wie für reale Bedingungen.$$,
      'expected', $$„Wenn“, gefolgt von einem Verb im Konjunktiv II.$$
    ),
    jsonb_build_object(
      'question', $$Welche Modalpartikel drückt eine angenehme Überraschung aus?$$,
      'hint', $$Ein sehr kurzes Wort mit zwei Buchstaben.$$,
      'expected', $$„Ja“, z. B. „Das ist ja nett.“$$
    ),
    jsonb_build_object(
      'question', $$Welche Form hat das Pronomen „man“ im Akkusativ?$$,
      'hint', $$Es reimt sich nicht mit „man“.$$,
      'expected', $$„Einen“.$$
    )
  ),
  now()
);
