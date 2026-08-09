-- Contenu de secours (fallback) : cf. l'en-tête de
-- 20260810700000_allemand_preparatifs_voyage_content.sql pour le contexte
-- complet. Vérifié le 2026-08-08 : la catégorie Allemand 3ème
-- (categoryid=2) sur coll.ecole-ci.org redirige systématiquement vers une
-- page "Vous n'êtes pas inscrit(e) à ce cours" — hors périmètre de
-- l'abonnement actuel, alors que le reste du site est bien accessible.
-- Impossible de récupérer un PDF réel pour cette leçon. Contenu original
-- conservé, sur la vie des jeunes en Allemagne, rédigé en allemand
-- (immersion LV2).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Du interessierst dich für das Leben der Jugendlichen in Deutschland: ihre Schule, ihre Hobbys und ihre Freizeit. Du möchtest darüber sprechen, was sie mögen, was sie können, und was sie dürfen.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Schule und Hobbys$$,
        'body', $$Um über das Leben der deutschen Jugendlichen zu sprechen, brauchst du Wörter über die Schule, die Hausaufgaben und die Freizeitbeschäftigungen.$$,
        'highlights', array[$$die Schule$$, $$das Hobby$$, $$die Freizeit$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$die Schule$$, $$der Ort, wo Kinder und Jugendliche lernen$$),
            jsonb_build_array($$das Fach$$, $$ein Schulfach, zum Beispiel Mathematik oder Deutsch$$),
            jsonb_build_array($$die Hausaufgabe$$, $$die Arbeit, die man zu Hause für die Schule macht$$),
            jsonb_build_array($$das Hobby$$, $$eine Freizeitbeschäftigung, die man gerne macht$$),
            jsonb_build_array($$der Verein$$, $$eine Gruppe von Menschen mit einem gemeinsamen Interesse, zum Beispiel ein Sportverein$$),
            jsonb_build_array($$die Freizeit$$, $$die Zeit, in der man nicht arbeitet oder lernt$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um über Vorlieben und Fähigkeiten zu sprechen, benutzt man die Modalverben "mögen" (ich mag, du magst, er/sie/es mag, wir mögen, ihr mögt, sie/Sie mögen) und "können" (ich kann, du kannst, er/sie/es kann, wir können, ihr könnt, sie/Sie können).$$),
        'example', jsonb_build_object('statement', $$Was magst du in deiner Freizeit machen und was kannst du gut?$$, 'solution', $$Ich mag Fußball spielen, und ich kann gut schwimmen.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "mögen" oder "können": Meine Freundin ___ (können) gut singen, aber sie ___ (mögen) Sport nicht so gern.$$, 'solution', $$Meine Freundin kann gut singen, aber sie mag Sport nicht so gern.$$)
      ),
      jsonb_build_object(
        'heading', $$Vereine und Freizeitaktivitäten$$,
        'body', $$Viele deutsche Jugendliche sind Mitglied in einem Verein: einem Sportverein, einem Musikverein, oder einer Jugendgruppe. Dort treffen sie Freunde und lernen neue Dinge.$$,
        'highlights', array[$$der Verein$$, $$Mitglied$$, $$treffen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verein$$, $$Beispiel$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Sportverein$$, $$Fußball, Handball, Schwimmen$$),
            jsonb_build_array($$der Musikverein$$, $$Gitarre spielen, in einem Chor singen$$),
            jsonb_build_array($$die Jugendgruppe$$, $$gemeinsam Ausflüge machen, sich engagieren$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Die Präposition "in" steht mit dem Dativ, um eine Mitgliedschaft auszudrücken: "Mitglied in einem Verein sein". Der unbestimmte Artikel im Dativ: ein -> einem (maskulin/neutrum), eine -> einer (feminin).$$),
        'example', jsonb_build_object('statement', $$In welchem Verein bist du Mitglied?$$, 'solution', $$Ich bin Mitglied in einem Fußballverein.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz: sie (Plural) / Mitglied / ein Musikverein / sein$$, 'solution', $$Sie sind Mitglied in einem Musikverein.$$)
      ),
      jsonb_build_object(
        'heading', $$Was Jugendliche dürfen und nicht dürfen$$,
        'body', $$In Deutschland gibt es Regeln für Jugendliche: was sie dürfen und was sie noch nicht dürfen, je nach ihrem Alter.$$,
        'highlights', array[$$dürfen$$, $$das Alter$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Das Modalverb "dürfen" drückt eine Erlaubnis aus (ich darf, du darfst, er/sie/es darf, wir dürfen, ihr dürft, sie/Sie dürfen). Die Verneinung "nicht dürfen" drückt ein Verbot aus; vor einem Substantiv benutzt man "kein/keine".$$),
        'example', jsonb_build_object('statement', $$Dürfen 15-jährige Jugendliche in Deutschland allein ins Kino gehen?$$, 'solution', $$Ja, mit 15 Jahren dürfen Jugendliche in Deutschland oft allein ins Kino gehen.$$),
        'fixation', jsonb_build_object('question', $$Verneine diesen Satz: Jugendliche unter 16 Jahren dürfen Alkohol kaufen.$$, 'solution', $$Jugendliche unter 16 Jahren dürfen keinen Alkohol kaufen.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du tauschst dich mit einem deutschen Brieffreund über das Leben der Jugendlichen aus: Schule, Hobbys, Vereine und Regeln.$$,
      'questions', array[
        $$Sag, was du in deiner Freizeit magst und was du gut kannst.$$,
        $$Beschreibe einen Verein, in dem du oder ein Freund Mitglied bist.$$,
        $$Erkläre, was Jugendliche in deinem Land dürfen und nicht dürfen.$$,
        $$Vergleiche die Schule in Deutschland mit der Schule in deinem Land.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze mit "können": Mein Bruder ___ (können) sehr gut Klavier spielen.$$,
      'hint', $$können ist ein Modalverb: ich kann, du kannst, er/sie/es kann...$$,
      'expected', $$Mein Bruder kann sehr gut Klavier spielen.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "mögen": Wir ___ (mögen) Musik und Tanzen.$$,
      'hint', $$mögen in der Wir-Form: wir mögen.$$,
      'expected', $$Wir mögen Musik und Tanzen.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz mit "Mitglied in + Dativ sein": ich / ein Sportverein$$,
      'hint', $$"in einem Sportverein" (Dativ).$$,
      'expected', $$Ich bin Mitglied in einem Sportverein.$$
    ),
    jsonb_build_object(
      'question', $$Verneine: Jugendliche dürfen abends spät ausgehen.$$,
      'hint', $$Setze "nicht" vor das Adverb, das du verneinen willst.$$,
      'expected', $$Jugendliche dürfen abends nicht spät ausgehen.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-jeunes-allemagne';
