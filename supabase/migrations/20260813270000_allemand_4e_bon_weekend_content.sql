-- Contenu ancré sur un vrai PDF officiel d'ecole-ci.org (Collège
-- Numérique, catégorie "QUATRIEME > Allemand", cours "THEME 3 LECON 2",
-- ressource mod/resource id 6691 : "ALLEMAND 4ème THEME 3 LECON 2.pdf").
-- Le PDF couvre le Thème 3 "Arbeit und Freizeit" (manuel Deutsch? Na
-- klar!), leçon "Mein Vorbild" : vocabulaire Werktag/Wochenende, verbes
-- forts au présent avec changement de voyelle (fahren a→ä, helfen e→i,
-- sehen e→ie), et formation du parfait avec haben ou sein (fahren →
-- ist gefahren). Reformulation entièrement originale (aucune phrase du
-- PDF recopiée telle quelle) ; remplace le point de grammaire "verbes à
-- particule séparable" de l'ancien contenu de secours, qui n'est pas ce
-- que cette leçon officielle enseigne, par la grammaire réellement
-- présente dans le PDF. Rédigé en allemand (immersion LV2), chrome de
-- l'application en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Es ist Freitagnachmittag. Du schreibst einem deutschen Brieffreund über dein letztes Wochenende: wohin deine Familie gefahren ist und wer wem geholfen hat.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Werktage und Wochenende$$,
        'body', $$Man unterscheidet zwischen den Werktagen (Montag bis Freitag), an denen man arbeitet oder zur Schule geht, und dem Wochenende, das der Erholung dient.$$,
        'highlights', array[$$der Werktag$$, $$das Wochenende$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Werktag$$, $$ein Tag mit Schule oder Arbeit$$),
            jsonb_build_array($$das Wochenende$$, $$Samstag und Sonntag, ohne Schule$$),
            jsonb_build_array($$sich ausruhen$$, $$sich erholen$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Am Wochenende benutzt man oft die Präposition "am": am Wochenende, am Samstag.$$),
        'example', jsonb_build_object('statement', $$Was macht man am Wochenende?$$, 'solution', $$Am Wochenende ruht man sich aus und fährt manchmal ans Meer.$$),
        'fixation', jsonb_build_object('question', $$Nenne zwei Werktage.$$, 'solution', $$Montag und Donnerstag sind zwei Werktage.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: starke Verben im Präsens (fahren, helfen, sehen)$$,
        'body', $$Manche Verben ändern im Präsens ihren Stammvokal in der 2. und 3. Person Singular (du/er/sie/es). Man nennt sie starke Verben.$$,
        'highlights', array[$$starke Verben$$, $$der Vokalwechsel$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$du-Form$$, $$er/sie/es-Form$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$fahren (a→ä)$$, $$du fährst$$, $$er fährt$$),
            jsonb_build_array($$helfen (e→i)$$, $$du hilfst$$, $$er hilft$$),
            jsonb_build_array($$sehen (e→ie)$$, $$du siehst$$, $$er sieht$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Nur in der 2. und 3. Person Singular ändert sich der Stammvokal; im Plural bleibt die Form regelmäßig (wir fahren, ihr fahrt, sie fahren).$$),
        'example', jsonb_build_object('statement', $$Wohin fährt deine Familie am Wochenende?$$, 'solution', $$Meine Familie fährt am Wochenende ans Meer.$$),
        'fixation', jsonb_build_object('question', $$Ergänze: Meine Schwester ___ (helfen) mir bei den Hausaufgaben.$$, 'solution', $$Meine Schwester hilft mir bei den Hausaufgaben.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: das Perfekt mit haben oder sein$$,
        'body', $$Im Perfekt benutzt man meistens "haben", aber Verben der Bewegung wie "fahren" bilden das Perfekt mit "sein".$$,
        'highlights', array[$$das Perfekt$$, $$sein$$, $$haben$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$Perfekt$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$machen$$, $$wir haben gemacht$$),
            jsonb_build_array($$fahren$$, $$wir sind gefahren$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Bewegungsverben ohne Objekt (fahren, gehen, kommen) bilden das Perfekt mit "sein" + Partizip II; die meisten anderen Verben benutzen "haben".$$),
        'example', jsonb_build_object('statement', $$Wie sagt man im Perfekt: Wir fahren ans Meer?$$, 'solution', $$Wir sind ans Meer gefahren.$$),
        'fixation', jsonb_build_object('question', $$Bilde das Perfekt mit "sein": ihr / fahren / ins Dorf$$, 'solution', $$Ihr seid ins Dorf gefahren.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du beschreibst einem deutschen Brieffreund dein letztes Wochenende: was deine Familie am Samstag gemacht hat und wer wem geholfen hat.$$,
      'questions', array[
        $$Sag, wohin deine Familie am Wochenende gefahren ist (im Perfekt).$$,
        $$Sag, wer dir bei den Hausaufgaben hilft (mit "helfen").$$,
        $$Sag, was du am Wochenende siehst oder machst (mit "sehen" oder "machen").$$,
        $$Nenne einen Unterschied zwischen einem Werktag und dem Wochenende.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze: Du ___ (fahren) am Sonntag zu deiner Tante.$$,
      'hint', $$du-Form mit Vokalwechsel a→ä: fährst.$$,
      'expected', $$Du fährst am Sonntag zu deiner Tante.$$
    ),
    jsonb_build_object(
      'question', $$Bilde das Perfekt: wir / fahren / ans Meer$$,
      'hint', $$Bewegungsverb: sein + gefahren.$$,
      'expected', $$Wir sind ans Meer gefahren.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze: Er ___ (sehen) seine Freunde auf dem Markt.$$,
      'hint', $$er-Form mit Vokalwechsel e→ie: sieht.$$,
      'expected', $$Er sieht seine Freunde auf dem Markt.$$
    ),
    jsonb_build_object(
      'question', $$Bilde das Perfekt: die Kinder / machen / die Hausaufgaben$$,
      'hint', $$Kein Bewegungsverb: haben + gemacht.$$,
      'expected', $$Die Kinder haben die Hausaufgaben gemacht.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-bon-weekend';
