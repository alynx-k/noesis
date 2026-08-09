-- Contenu de secours (fallback) : cf. l'en-tête de
-- 20260810700000_allemand_preparatifs_voyage_content.sql pour le contexte
-- complet. Vérifié le 2026-08-08 : la catégorie Allemand 3ème
-- (categoryid=2) sur coll.ecole-ci.org redirige systématiquement vers une
-- page "Vous n'êtes pas inscrit(e) à ce cours" — hors périmètre de
-- l'abonnement actuel, alors que le reste du site est bien accessible.
-- Impossible de récupérer un PDF réel pour cette leçon. Contenu original
-- conservé, sur l'arrivée et l'installation en Allemagne, rédigé en
-- allemand (immersion LV2, même logique que les leçons Anglais).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Nach einem langen Flug kommst du endlich in Deutschland an. Du musst durch die Zollkontrolle gehen, dein Gepäck holen, und dich in deiner neuen Wohnung einleben. Dafür brauchst du das Perfekt, um über das zu sprechen, was du schon gemacht hast.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: am Flughafen$$,
        'body', $$Bei der Ankunft in Deutschland triffst du zuerst auf den Flughafen: die Zollkontrolle, das Gepäckband, und die ersten Schritte in einem neuen Land.$$,
        'highlights', array[$$der Flughafen$$, $$die Zollkontrolle$$, $$die Ankunft$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Flughafen$$, $$der Ort, wo Flugzeuge landen und starten$$),
            jsonb_build_array($$die Zollkontrolle$$, $$die Kontrolle des Gepäcks und der Dokumente bei der Ankunft in einem Land$$),
            jsonb_build_array($$das Gepäckband$$, $$das Förderband, auf dem die Koffer nach dem Flug ankommen$$),
            jsonb_build_array($$die Ankunft$$, $$der Moment, in dem man an einem Ort ankommt$$),
            jsonb_build_array($$die Grenze$$, $$die Linie, die zwei Länder trennt$$),
            jsonb_build_array($$landen$$, $$mit dem Flugzeug den Boden erreichen$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um zu erzählen, was du schon getan hast, benutzt du das Perfekt: eine konjugierte Form von "haben" oder "sein" an zweiter Stelle und das Partizip II am Satzende. Die meisten Verben bilden das Perfekt mit "haben"; Verben der Bewegung oder Zustandsänderung (fahren, gehen, ankommen, werden) bilden es mit "sein".$$),
        'example', jsonb_build_object('statement', $$Was hast du am Flughafen gemacht?$$, 'solution', $$Ich habe mein Gepäck geholt und bin durch die Zollkontrolle gegangen.$$),
        'fixation', jsonb_build_object('question', $$Ergänze im Perfekt: Der Flug ___ pünktlich ___ (landen).$$, 'solution', $$Der Flug ist pünktlich gelandet.$$)
      ),
      jsonb_build_object(
        'heading', $$Sich in der neuen Wohnung einleben$$,
        'body', $$Nach der Ankunft muss man sich in einer neuen Wohnung einrichten: die Adresse finden, die Zimmer entdecken, und sich bei den Nachbarn vorstellen.$$,
        'highlights', array[$$sich einleben$$, $$die Wohnung$$, $$sich vorstellen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$die Wohnung$$, $$der Raum oder die Räume, in denen man wohnt$$),
            jsonb_build_array($$das Zimmer$$, $$ein Teil einer Wohnung, zum Beispiel das Schlafzimmer oder das Wohnzimmer$$),
            jsonb_build_array($$sich einleben$$, $$sich an einen neuen Ort gewöhnen und sich dort wohlfühlen$$),
            jsonb_build_array($$der Vermieter$$, $$die Person, die eine Wohnung vermietet$$),
            jsonb_build_array($$sich vorstellen$$, $$seinen Namen sagen und sich einer anderen Person bekannt machen$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Reflexive Verben wie "sich einleben" und "sich vorstellen" brauchen ein Reflexivpronomen, das sich mit dem Subjekt ändert: mich, dich, sich, uns, euch, sich.$$),
        'example', jsonb_build_object('statement', $$Wie stellst du dich einer neuen Familie vor?$$, 'solution', $$Ich stelle mich vor: Ich heiße Malik und komme aus Abidjan.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit dem richtigen Reflexivpronomen: Wir leben ___ schnell in der neuen Stadt ein.$$, 'solution', $$Wir leben uns schnell in der neuen Stadt ein.$$)
      ),
      jsonb_build_object(
        'heading', $$Das Perfekt mit "sein": Verben der Bewegung$$,
        'body', $$Verben, die eine Bewegung von einem Ort zum anderen oder eine Zustandsänderung ausdrücken, bilden ihr Perfekt mit "sein" statt mit "haben".$$,
        'highlights', array[$$fahren$$, $$gehen$$, $$ankommen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Infinitiv$$, $$Partizip II$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$fahren$$, $$gefahren$$),
            jsonb_build_array($$gehen$$, $$gegangen$$),
            jsonb_build_array($$ankommen$$, $$angekommen$$),
            jsonb_build_array($$bleiben$$, $$geblieben$$),
            jsonb_build_array($$werden$$, $$geworden$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Merke: fahren, gehen, ankommen, bleiben und werden bilden das Perfekt mit "sein", weil sie eine Ortsveränderung oder eine Zustandsänderung ausdrücken.$$),
        'example', jsonb_build_object('statement', $$Bilde einen Satz im Perfekt: ich / mit dem Bus / zur Wohnung / fahren$$, 'solution', $$Ich bin mit dem Bus zur Wohnung gefahren.$$),
        'fixation', jsonb_build_object('question', $$Ergänze im Perfekt: Meine Familie ___ drei Tage in Frankfurt ___ (bleiben).$$, 'solution', $$Meine Familie ist drei Tage in Frankfurt geblieben.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du erzählst deinen Eltern von deiner Ankunft in Deutschland: was du am Flughafen gemacht hast und wie du dich in deiner neuen Wohnung eingelebt hast.$$,
      'questions', array[
        $$Erzähl, wie deine Ankunft am Flughafen war (benutze das Perfekt).$$,
        $$Sag, mit welchem Verkehrsmittel du zu deiner Wohnung gefahren bist.$$,
        $$Beschreibe, wie du dich in deiner neuen Wohnung eingelebt hast.$$,
        $$Stell dich einer neuen Person vor, die du in Deutschland getroffen hast.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze im Perfekt: Ich ___ am Flughafen ___ (ankommen).$$,
      'hint', $$"ankommen" ist ein Bewegungsverb, das Perfekt wird mit "sein" gebildet.$$,
      'expected', $$Ich bin am Flughafen angekommen.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze im Perfekt: Wir ___ unser Gepäck ___ (holen).$$,
      'hint', $$"holen" bildet das Perfekt mit "haben".$$,
      'expected', $$Wir haben unser Gepäck geholt.$$
    ),
    jsonb_build_object(
      'question', $$Stelle dich kurz vor (Name, Herkunft) mit dem reflexiven Verb "sich vorstellen".$$,
      'hint', $$Benutze "Ich stelle mich vor: Ich heiße..."$$,
      'expected', $$Ich stelle mich vor: Ich heiße Aya und komme aus Abidjan.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze im Perfekt: Meine Familie ___ zwei Wochen bei Freunden ___ (bleiben).$$,
      'hint', $$"bleiben" bildet das Perfekt mit "sein".$$,
      'expected', $$Meine Familie ist zwei Wochen bei Freunden geblieben.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-arrivee-installation';
