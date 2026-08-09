-- Contenu ancré sur un vrai PDF officiel d'ecole-ci.org (plateforme
-- Collège Numérique, https://coll.ecole-ci.org, catégorie "QUATRIEME >
-- Allemand", cours "THEME 1 LECON 1", ressource mod/resource id 7592 :
-- "ALLEMAND 4ème THEME 1 LECON 1.pdf"). Le PDF couvre le Thème 1
-- "Begrüßung und Vorstellung" (manuel Deutsch? Na klar!), leçon "Hallo" :
-- salutations selon l'heure de la journée, conjugaison de heißen/sein/
-- haben au singulier, question woher/wo avec les prépositions aus/in, et
-- conjugaison au pluriel (dont la forme de politesse "Sie") de verbes
-- comme kommen/wohnen/zeigen/machen. Reformulation entièrement originale
-- (aucune phrase du PDF recopiée telle quelle) ; rédigé en allemand
-- (immersion LV2), chrome de l'application en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Es ist der erste Schultag nach den großen Ferien. Auf dem Schulhof triffst du eine neue Mitschülerin. Ihr begrüßt euch und lernt euch gegenseitig kennen: Namen, Herkunft und Wohnort.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Sich begrüßen: die richtige Tageszeit$$,
        'body', $$Auf Deutsch grüßt man nicht immer gleich: der passende Gruß hängt von der Tageszeit ab.$$,
        'highlights', array[$$guten Morgen$$, $$guten Tag$$, $$guten Abend$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Tageszeit$$, $$Gruß$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$von 4 bis 11 Uhr$$, $$Guten Morgen!$$),
            jsonb_build_array($$von 11 bis 17 Uhr$$, $$Guten Tag!$$),
            jsonb_build_array($$von 18 bis 22 Uhr$$, $$Guten Abend!$$),
            jsonb_build_array($$vor dem Schlafen$$, $$Gute Nacht!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Unter Jugendlichen benutzt man oft auch die informellen Grüße "hallo" oder "grüß dich", unabhängig von der Uhrzeit.$$),
        'example', jsonb_build_object('statement', $$Wie grüßt man einen Mitschüler um 15 Uhr?$$, 'solution', $$Man sagt: Guten Tag! oder einfach Hallo!$$),
        'fixation', jsonb_build_object('question', $$Welchen Gruß benutzt man um 20 Uhr?$$, 'solution', $$Um 20 Uhr sagt man: Guten Abend!$$)
      ),
      jsonb_build_object(
        'heading', $$Sich vorstellen: heißen, sein und haben$$,
        'body', $$Um sich vorzustellen, braucht man die Verben heißen, sein und haben im Präsens (Singular).$$,
        'highlights', array[$$heißen$$, $$sein$$, $$haben$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$ich-Form$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$heißen$$, $$ich heiße$$),
            jsonb_build_array($$sein$$, $$ich bin$$),
            jsonb_build_array($$haben$$, $$ich habe$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Die drei Verben werden im Singular unterschiedlich konjugiert: du heißt/bist/hast, er/sie/es heißt/ist/hat. "heißen" und "sein" dienen zur Namensangabe (Ich heiße Aya. / Ich bin Aya.), "haben" dagegen zur Angabe eines Besitzes (Ich habe eine Schwester.).$$),
        'example', jsonb_build_object('statement', $$Wie stellt sich Kofi vor?$$, 'solution', $$Ich heiße Kofi, ich bin Ivorer, und ich habe eine Schwester.$$),
        'fixation', jsonb_build_object('question', $$Ergänze: Ich ___ (heißen) Ama und ich ___ (haben) einen Bruder.$$, 'solution', $$Ich heiße Ama und ich habe einen Bruder.$$)
      ),
      jsonb_build_object(
        'heading', $$Herkunft und Wohnort: woher und wo$$,
        'body', $$Um zu sagen, woher man kommt und wo man wohnt, benutzt man zwei verschiedene Fragewörter mit je einer eigenen Präposition.$$,
        'highlights', array[$$woher$$, $$wo$$, $$aus$$, $$in$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Frage$$, $$Antwort$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Woher kommst du?$$, $$Ich komme aus der Elfenbeinküste.$$),
            jsonb_build_array($$Wo wohnst du?$$, $$Ich wohne in Bouaké.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Auf die Frage mit "woher" antwortet man mit der Präposition "aus" (+ Dativ); auf die Frage mit "wo" antwortet man mit der Präposition "in" (+ Dativ). Die beiden Fragen betreffen also zwei unterschiedliche Informationen: die Herkunft und den aktuellen Wohnort.$$),
        'example', jsonb_build_object('statement', $$Kannst du nach Herkunft und Wohnort fragen?$$, 'solution', $$Woher kommst du, und wo wohnst du?$$),
        'fixation', jsonb_build_object('question', $$Antworte: Woher kommst du? (Senegal)$$, 'solution', $$Ich komme aus dem Senegal.$$)
      ),
      jsonb_build_object(
        'heading', $$Mehrere Personen: der Plural und die Höflichkeitsform$$,
        'body', $$Wenn man über mehrere Personen spricht oder eine erwachsene Person respektvoll anspricht, ändert sich die Verbform.$$,
        'highlights', array[$$wir$$, $$ihr$$, $$Sie (Höflichkeitsform)$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Person$$, $$kommen$$, $$wohnen$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$wir$$, $$kommen$$, $$wohnen$$),
            jsonb_build_array($$ihr$$, $$kommt$$, $$wohnt$$),
            jsonb_build_array($$sie/Sie$$, $$kommen$$, $$wohnen$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Regelmäßige Verben wie kommen, wohnen, zeigen und machen bekommen im Plural die Endung -en (wir/sie/Sie) bzw. -t (ihr). Die Höflichkeitsform "Sie" wird benutzt, um eine erwachsene oder fremde Person respektvoll anzusprechen, zum Beispiel eine Lehrkraft.$$),
        'example', jsonb_build_object('statement', $$Wie fragt man eine Lehrerin höflich, woher sie kommt?$$, 'solution', $$Frau Koffi, woher kommen Sie?$$),
        'fixation', jsonb_build_object('question', $$Ergänze: Ihr ___ (wohnen) in Yamoussoukro.$$, 'solution', $$Ihr wohnt in Yamoussoukro.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Nach dem ersten Schultag kommst du nach Hause. Deine Mutter möchte wissen, was du gelernt hast, und bittet dich, sie auf Deutsch zu begrüßen und dich vorzustellen.$$,
      'questions', array[
        $$Begrüße deine Mutter mit dem passenden Gruß für den Abend.$$,
        $$Stelle dich vor: sag deinen Namen und deine Herkunft.$$,
        $$Sag, wo du wohnst.$$,
        $$Frag höflich (mit "Sie"), woher ein Erwachsener kommt.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze mit "sein": Meine Freundin ___ Ivorerin.$$,
      'hint', $$"sein" in der 3. Person Singular: ist.$$,
      'expected', $$Meine Freundin ist Ivorerin.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz: ich / kommen / aus / Ghana$$,
      'hint', $$"aus" + Dativ: aus Ghana.$$,
      'expected', $$Ich komme aus Ghana.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "wohnen": Wir ___ in Korhogo.$$,
      'hint', $$Plural-Endung -en: wir wohnen.$$,
      'expected', $$Wir wohnen in Korhogo.$$
    ),
    jsonb_build_object(
      'question', $$Stell einem Lehrer höflich die Frage nach seinem Namen (mit "Sie").$$,
      'hint', $$Benutz die Sie-Form von "heißen".$$,
      'expected', $$Wie heißen Sie, bitte?$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-bienvenue-afrique';
