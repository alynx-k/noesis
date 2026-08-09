-- Contenu de secours (fallback) : cf. l'en-tête de
-- 20260810700000_allemand_preparatifs_voyage_content.sql pour le contexte
-- complet. Vérifié le 2026-08-08 : la catégorie Allemand 3ème
-- (categoryid=2) sur coll.ecole-ci.org redirige systématiquement vers une
-- page "Vous n'êtes pas inscrit(e) à ce cours" — hors périmètre de
-- l'abonnement actuel, alors que le reste du site est bien accessible.
-- Impossible de récupérer un PDF réel pour cette leçon. Contenu original
-- conservé, sur une visite à Berlin, rédigé en allemand (immersion LV2),
-- dernière leçon du catalogue Allemand 3ème.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Am Ende deines Aufenthalts besuchst du die Hauptstadt Berlin. Du entdeckst berühmte historische Orte und erzählst später von diesem Besuch im Perfekt, mit dem richtigen Datum.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Sehenswürdigkeiten in Berlin$$,
        'body', $$Berlin ist die Hauptstadt Deutschlands und hat viele historische Sehenswürdigkeiten: das Brandenburger Tor, die Berliner Mauer, und den Reichstag.$$,
        'highlights', array[$$die Hauptstadt$$, $$das Brandenburger Tor$$, $$die Berliner Mauer$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$die Hauptstadt$$, $$die wichtigste Stadt eines Landes, Sitz der Regierung$$),
            jsonb_build_array($$das Brandenburger Tor$$, $$ein berühmtes Denkmal und Symbol der Stadt Berlin$$),
            jsonb_build_array($$die Berliner Mauer$$, $$die frühere Mauer, die Berlin von 1961 bis 1989 teilte$$),
            jsonb_build_array($$der Reichstag$$, $$das Gebäude, in dem das deutsche Parlament tagt$$),
            jsonb_build_array($$das Denkmal$$, $$ein Bauwerk zur Erinnerung an eine Person oder ein Ereignis$$),
            jsonb_build_array($$die Geschichte$$, $$die Ereignisse der Vergangenheit$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um von deinem Besuch in Berlin zu erzählen, benutzt du das Perfekt: die meisten Verben (besuchen, besichtigen) bilden es mit "haben", Bewegungsverben (gehen, fahren) mit "sein".$$),
        'example', jsonb_build_object('statement', $$Was hast du in Berlin besucht?$$, 'solution', $$Ich habe das Brandenburger Tor besucht und bin zum Reichstag gegangen.$$),
        'fixation', jsonb_build_object('question', $$Ergänze im Perfekt: Wir ___ die Berliner Mauer ___ (besichtigen).$$, 'solution', $$Wir haben die Berliner Mauer besichtigt.$$)
      ),
      jsonb_build_object(
        'heading', $$Das Datum und die Ordnungszahlen$$,
        'body', $$Um zu sagen, wann du Berlin besucht hast, brauchst du Ordnungszahlen für das Datum: der erste, der zweite, der dritte...$$,
        'highlights', array[$$das Datum$$, $$der erste$$, $$am$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Zahl$$, $$Ordnungszahl$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$1$$, $$der erste$$),
            jsonb_build_array($$2$$, $$der zweite$$),
            jsonb_build_array($$3$$, $$der dritte$$),
            jsonb_build_array($$7$$, $$der siebte$$),
            jsonb_build_array($$20$$, $$der zwanzigste$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Man sagt "am + Ordnungszahl (mit -en) + Monat": am ersten August, am dritten Juli. Ordnungszahlen von 1 bis 19 enden meist auf -te, ab 20 auf -ste (Ausnahmen: erste, dritte, siebte).$$),
        'example', jsonb_build_object('statement', $$Wann bist du in Berlin angekommen? (der 3. August)$$, 'solution', $$Ich bin am dritten August in Berlin angekommen.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz mit dem Datum: die Reise / beginnen / der 1. Juli$$, 'solution', $$Die Reise beginnt am ersten Juli.$$)
      ),
      jsonb_build_object(
        'heading', $$Eine Meinung über den Besuch äußern$$,
        'body', $$Am Ende deines Besuchs kannst du deine Meinung über die Stadt und ihre Geschichte äußern.$$,
        'highlights', array[$$Meiner Meinung nach$$, $$beeindruckend$$, $$interessant$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Ausdruck$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Meiner Meinung nach...$$, $$ein Ausdruck, um eine persönliche Meinung einzuleiten$$),
            jsonb_build_array($$beeindruckend$$, $$etwas, das einen starken, positiven Eindruck macht$$),
            jsonb_build_array($$interessant$$, $$etwas, das das Interesse weckt$$),
            jsonb_build_array($$unvergesslich$$, $$etwas, das man nicht vergessen wird$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Ein Adjektiv nach "sein" bleibt unverändert, ohne Endung: Berlin ist beeindruckend. Der Reichstag ist interessant.$$),
        'example', jsonb_build_object('statement', $$Gib deine Meinung über das Brandenburger Tor.$$, 'solution', $$Meiner Meinung nach ist das Brandenburger Tor sehr beeindruckend.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz mit deiner Meinung über die Berliner Mauer.$$, 'solution', $$Meiner Meinung nach ist die Geschichte der Berliner Mauer sehr interessant.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Nach deiner Reise schreibst du einen Bericht über deinen Besuch in Berlin für die Schulzeitung.$$,
      'questions', array[
        $$Erzähl im Perfekt, was du in Berlin besucht hast.$$,
        $$Sag, an welchem Datum du in Berlin angekommen bist.$$,
        $$Beschreibe ein Denkmal oder Gebäude, das dich beeindruckt hat.$$,
        $$Gib deine Meinung über deinen Besuch in Berlin.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze im Perfekt: Ich ___ das Brandenburger Tor ___ (besuchen).$$,
      'hint', $$"besuchen" bildet das Perfekt mit "haben".$$,
      'expected', $$Ich habe das Brandenburger Tor besucht.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz mit dem Datum: die Klasse / ankommen / der 15. Mai$$,
      'hint', $$am + Ordnungszahl (fünfzehnten) + Monat.$$,
      'expected', $$Die Klasse kommt am fünfzehnten Mai an.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze im Perfekt: Wir ___ zum Reichstag ___ (gehen).$$,
      'hint', $$"gehen" ist ein Bewegungsverb, das Perfekt wird mit "sein" gebildet.$$,
      'expected', $$Wir sind zum Reichstag gegangen.$$
    ),
    jsonb_build_object(
      'question', $$Gib deine Meinung über die Berliner Mauer mit "Meiner Meinung nach".$$,
      'hint', $$Benutze ein Adjektiv wie "beeindruckend" oder "interessant".$$,
      'expected', $$Meiner Meinung nach ist die Berliner Mauer sehr interessant.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-visite-berlin';
