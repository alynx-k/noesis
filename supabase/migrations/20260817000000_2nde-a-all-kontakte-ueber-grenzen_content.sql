-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Allemand, categoryid=96.
-- Moodle course id 1463 (Fiche 1): "LEÇON 1: KONTAKTE ÜBER GRENZEN"
-- (https://lyc.ecole-ci.org/course/view.php?id=1463), resource mod_resource
-- id 11054 redirecting to pluginfile "ALLEMAND 2nde LECON 1 FICHE 1.pdf".
-- Moodle course id 1723 (Fiche 2, même leçon): resource mod_resource id
-- 14186 redirecting to pluginfile "ALLEMAND 2nde LECON 1 FICHE 2.pdf".
-- Contenu entièrement en allemand (immersion linguistique), reformulé et
-- paraphrasé à partir des deux fiches PDF (Situation d'apprentissage sur la
-- Brieffreundschaft de Yao, textes A "Brieffreundschaften" et B
-- "Schüleraustausch", grammaire des prépositions suivies du génitif et du
-- participe I/II employé comme adjectif). 100% reformulé, aucune phrase
-- copiée verbatim du PDF source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-all-kontakte-ueber-grenzen',
  '2nde',
  'A',
  'allemand',
  $$Kontakte über Grenzen$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Yao ist Schüler in der Klasse der Seconde und Vorsitzender des Deutschclubs seines Gymnasiums. Er träumt von einer Partnerschaft mit einer Schule in Deutschland und beschließt, eine Brieffreundschaft zu organisieren. Sein Deutschlehrer schlägt ihm vor, zuerst zu klären: Warum sucht man überhaupt einen Brieffreund im Ausland, und wie stellt man sich in einem ersten Brief richtig vor?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Warum einen Brieffreund im Ausland suchen?$$,
        'body', $$Viele Jugendliche suchen einen Brieffreund oder eine Brieffreundin in einem anderen Land. Der Hauptgrund ist einfach: Man will eine Fremdsprache im echten Leben anwenden und dabei besser lernen. Außerdem lernt man Jugendliche aus anderen Ländern kennen, bekommt Informationen über fremde Kulturen und baut Vorurteile über andere Völker ab. So erfährt man ganz konkret, wie das Leben von Jugendlichen in anderen Ländern aussieht.$$,
        'highlights', array[$$Fremdsprachen anwenden$$, $$Vorurteile abbauen$$]::text[],
        'property', jsonb_build_object('label', $$Nützliche Ausdrücke$$, 'text', $$Meiner Meinung nach …, denn …. / Ich finde …, weil …. / Ich bin der Meinung, dass ….$$),
        'fixation', jsonb_build_object('question', $$Nenne zwei Gründe, warum Jugendliche einen Brieffreund im Ausland suchen.$$, 'solution', $$Zum Beispiel: eine Fremdsprache anwenden und besser lernen; Jugendliche aus anderen Ländern kennenlernen; Vorurteile über andere Völker abbauen.$$)
        ),
      jsonb_build_object(
        'heading', $$Sich in einem ersten Brief vorstellen$$,
        'body', $$In einem ersten Brief an einen Brieffreund stellt man sich zuerst mit Namen und Wohnort vor. Danach beschreibt man kurz sein Aussehen (Größe, Haarfarbe, Augenfarbe) und erzählt, wie man von dem Briefpartner erfahren hat, zum Beispiel über ein Onlinemagazin oder ein Brieffreundschaftsforum. Am Ende erzählt man von seinen Hobbys – Musik, Gitarre spielen, Kino, Schwimmen – und bittet höflich um eine Antwort mit Foto.$$,
        'highlights', array[$$sich vorstellen$$, $$Hobbys beschreiben$$]::text[],
        'example', jsonb_build_object('statement', $$Wie beginnt man einen ersten Brief an einen unbekannten Brieffreund höflich?$$, 'solution', $$Zum Beispiel: „Ich heiße … und wohne in …. Ich habe deinen Namen in einem Onlinemagazin unter ‚Brieffreundschaften‘ gelesen. Ich warte auf deine E-Mail. Herzliche Grüße!“$$),
        'fixation', jsonb_build_object('question', $$Welche drei Informationen gehören unbedingt in die Vorstellung am Anfang eines ersten Briefes?$$, 'solution', $$Der eigene Name, der Wohnort und – meistens – eine kurze Beschreibung des Aussehens.$$)
      ),
      jsonb_build_object(
        'heading', $$Präpositionen mit Genitiv$$,
        'body', $$Einige deutsche Präpositionen verlangen immer den Genitiv. Man erkennt sie oft in Texten über Austausch und Reisen, zum Beispiel wenn man über die Dauer eines Aufenthalts oder über die Gründe für ein Verhalten spricht. Nach diesen Präpositionen steht das Nomen im Genitiv, das heißt meistens mit der Endung -(e)s bei männlichen und sächlichen Wörtern.$$,
        'highlights', array[$$Präposition + Genitiv$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Präposition (Genitiv)$$, $$Bedeutung$$, $$Beispiel$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$während$$, $$pendant$$, $$während ihres Aufenthalts$$),
            jsonb_build_array($$trotz$$, $$malgré$$, $$trotz des schlechten Wetters$$),
            jsonb_build_array($$wegen$$, $$à cause de$$, $$wegen der großen Entfernung$$),
            jsonb_build_array($$innerhalb / außerhalb$$, $$à l'intérieur / à l'extérieur de$$, $$außerhalb des Unterrichts$$),
            jsonb_build_array($$statt / anlässlich$$, $$au lieu de / à l'occasion de$$, $$anlässlich des Besuchs$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Ergänze: „… (wegen) des schlechten Wetters waren die Austauschschüler nicht enttäuscht.“ Welcher Fall folgt auf „wegen“?$$, 'solution', $$Der Genitiv: „Wegen des schlechten Wetters …“$$)
      ),
      jsonb_build_object(
        'heading', $$Schüleraustausch: Kulturunterschiede entdecken$$,
        'body', $$Bei einem Schüleraustausch überraschen die Unterschiede zwischen den Ländern oft am meisten. In einem Interview erzählen Austauschschüler aus den USA und aus Kenia, was ihnen in Deutschland aufgefallen ist: das Essen, die Umgangsformen zwischen Lehrern und Schülern, die Fächer in der Schule. Manche Unterschiede hängen auch mit der Religion zusammen, zum Beispiel wenn Muslime aus religiösen Gründen kein Schweinefleisch essen und keinen Alkohol trinken.$$,
        'highlights', array[$$Kulturunterschiede$$, $$Austauschschüler$$]::text[],
        'property', jsonb_build_object('label', $$Landeskunde$$, 'text', $$Einen Kulturunterschied direkt zu erleben, ist der beste Weg, um ein Land wirklich zu verstehen.$$),
        'fixation', jsonb_build_object('question', $$Nenne einen Bereich, in dem Austauschschüler oft Kulturunterschiede feststellen.$$, 'solution', $$Zum Beispiel: das Essen, die Beziehung zwischen Lehrern und Schülern, die Schulfächer oder religiöse Gewohnheiten.$$)
      ),
      jsonb_build_object(
        'heading', $$Das Partizip I und II als Adjektiv$$,
        'body', $$Das Partizip I beschreibt etwas, das gerade passiert: ein langsam fahrender Zug ist ein Zug, der in diesem Moment fährt. Das Partizip II beschreibt etwas, das schon passiert ist: ein geschriebener Brief ist ein Brief, der schon geschrieben wurde. Das Partizip I bildet man aus dem Infinitiv des Verbs plus -d (fahren → fahrend). Das Partizip II bildet man wie im Perfekt, aber ohne das Hilfsverb (geschrieben, gelesen). Als Adjektiv verwendet, werden beide Partizipien wie normale Adjektive dekliniert.$$,
        'highlights', array[$$Partizip I$$, $$Partizip II$$]::text[],
        'example', jsonb_build_object('statement', $$Bilde das passende Partizip: „ein Ereignis, das gerade lebt“ und „ein Brief, der schon geschrieben wurde“.$$, 'solution', $$ein lebendes Ereignis (Partizip I) / ein geschriebener Brief (Partizip II).$$),
        'fixation', jsonb_build_object('question', $$Welches Partizip verwendet man, wenn eine Handlung schon vorher passiert ist?$$, 'solution', $$Das Partizip II, zum Beispiel „die gelesene E-Mail“.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ein Austauschschüler aus Deutschland kommt bald zu Besuch. Ein Schüler aus dem Deutschclub soll ihm in einer E-Mail erklären, warum Brieffreundschaften nützlich sind, sich kurz vorstellen und ihm eine typische Präposition mit Genitiv sowie ein Partizip als Adjektiv richtig erklären können.$$,
      'questions', array[
        $$Nenne zwei Gründe, warum man einen Brieffreund im Ausland sucht.$$,
        $$Stell dich in drei bis vier Sätzen vor, so wie in einem ersten Brief an einen Brieffreund.$$,
        $$Bilde einen Satz mit der Präposition „wegen“ und dem passenden Genitiv.$$,
        $$Erkläre den Unterschied zwischen Partizip I und Partizip II an einem Beispiel.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Warum sucht man laut dem Text einen Brieffreund im Ausland? Nenne einen Grund.$$,
      'hint', $$Denk an das Sprachenlernen oder an das Kennenlernen anderer Kulturen.$$,
      'expected', $$Zum Beispiel: um eine Fremdsprache anzuwenden und besser zu lernen, oder um Jugendliche aus anderen Ländern kennenzulernen.$$
    ),
    jsonb_build_object(
      'question', $$Welcher Fall (Kasus) folgt immer auf die Präposition „während“?$$,
      'hint', $$Es ist derselbe Fall wie nach „trotz“ und „wegen“.$$,
      'expected', $$Der Genitiv.$$
    ),
    jsonb_build_object(
      'question', $$Ist „ein fahrender Zug“ ein Beispiel für Partizip I oder Partizip II?$$,
      'hint', $$Überlege, ob die Handlung gerade passiert oder schon vorbei ist.$$,
      'expected', $$Partizip I, weil die Handlung gerade passiert.$$
    ),
    jsonb_build_object(
      'question', $$Nenne einen typischen Kulturunterschied, den Austauschschüler in Deutschland feststellen können.$$,
      'hint', $$Denk an Essen, Schule oder Religion.$$,
      'expected', $$Zum Beispiel: andere Essgewohnheiten, ein anderes Verhältnis zwischen Lehrern und Schülern, oder religiöse Regeln wie kein Schweinefleisch und kein Alkohol.$$
    )
  ),
  now()
);
