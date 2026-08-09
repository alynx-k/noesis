-- Contenu de secours (fallback) : cf. l'en-tête de
-- 20260810700000_allemand_preparatifs_voyage_content.sql pour le contexte
-- complet. Vérifié le 2026-08-08 : la catégorie Allemand 3ème
-- (categoryid=2) sur coll.ecole-ci.org redirige systématiquement vers une
-- page "Vous n'êtes pas inscrit(e) à ce cours" — hors périmètre de
-- l'abonnement actuel, alors que le reste du site est bien accessible.
-- Impossible de récupérer un PDF réel pour cette leçon. Contenu original
-- conservé, sur les communautés africaines en Allemagne et la comparaison
-- des cultures, rédigé en allemand (immersion LV2).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In deutschen Städten leben viele Menschen afrikanischer Herkunft. Du entdeckst, wie afrikanische Kultur und Traditionen in Deutschland präsent sind, und du lernst, Kulturen mit dem Komparativ zu vergleichen.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Kulturen und Gemeinschaften$$,
        'body', $$Um über kulturelle Vielfalt zu sprechen, brauchst du Wörter über Kultur, Gemeinschaft und Herkunft.$$,
        'highlights', array[$$die Kultur$$, $$die Gemeinschaft$$, $$die Herkunft$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$die Kultur$$, $$die Gesamtheit der Traditionen, Sprachen und Gewohnheiten eines Volkes$$),
            jsonb_build_array($$die Gemeinschaft$$, $$eine Gruppe von Menschen mit gemeinsamen Merkmalen oder Interessen$$),
            jsonb_build_array($$die Herkunft$$, $$das Land oder der Ort, aus dem eine Person kommt$$),
            jsonb_build_array($$das Fest$$, $$eine Feier, oft mit Musik, Tanz und Essen$$),
            jsonb_build_array($$die Vielfalt$$, $$die Verschiedenheit von Kulturen, Sprachen oder Menschen$$),
            jsonb_build_array($$sich integrieren$$, $$sich in eine neue Gesellschaft einfügen$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um zwei Kulturen oder Situationen zu vergleichen, benutzt man den Komparativ mit "wie" bei Gleichheit (genauso... wie) und mit "als" bei einem Unterschied (Adjektiv + -er + als).$$),
        'example', jsonb_build_object('statement', $$Vergleiche das Wetter in Köln und in Abidjan.$$, 'solution', $$Das Wetter in Abidjan ist wärmer als das Wetter in Köln.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Vergleich mit "genauso... wie": die Musik in Berlin / lebendig / die Musik in Abidjan$$, 'solution', $$Die Musik in Berlin ist genauso lebendig wie die Musik in Abidjan.$$)
      ),
      jsonb_build_object(
        'heading', $$Afrikanische Gemeinschaften in deutschen Städten$$,
        'body', $$In Städten wie Berlin, Köln und Hamburg gibt es afrikanische Gemeinschaften, die ihre Kultur durch Feste, Musik, Märkte und Vereine feiern.$$,
        'highlights', array[$$die Gemeinschaft$$, $$das Fest$$, $$der Markt$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Beispiel$$, $$Beschreibung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das afrikanische Fest$$, $$ein Fest mit afrikanischer Musik, Tanz und traditionellem Essen$$),
            jsonb_build_array($$der afrikanische Verein$$, $$eine Organisation, die afrikanische Kultur in Deutschland fördert$$),
            jsonb_build_array($$der Markt$$, $$ein Ort, wo man afrikanische Produkte kaufen kann$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Das Adjektiv "afrikanisch" bekommt eine Endung, die vom Geschlecht des Substantivs abhängt: ein afrikanisches Fest (neutrum), die afrikanische Musik (feminin), der afrikanische Verein (maskulin).$$),
        'example', jsonb_build_object('statement', $$Beschreibe ein afrikanisches Fest in Köln.$$, 'solution', $$In Köln gibt es jedes Jahr ein afrikanisches Fest mit Musik, Tanz und traditionellem Essen.$$),
        'fixation', jsonb_build_object('question', $$Ergänze die richtige Adjektivendung: Das ist ein afrikanisch__ Restaurant.$$, 'solution', $$Das ist ein afrikanisches Restaurant.$$)
      ),
      jsonb_build_object(
        'heading', $$Zwischen zwei Kulturen leben$$,
        'body', $$Viele Menschen afrikanischer Herkunft leben zwischen zwei Kulturen: sie sprechen mehrere Sprachen und feiern Traditionen aus beiden Ländern.$$,
        'highlights', array[$$zwischen$$, $$die Tradition$$, $$sowohl... als auch$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Die Konjunktion "sowohl... als auch" verbindet zwei Elemente, die beide zutreffen: Subjekt + Verb + sowohl + Element 1 + als auch + Element 2.$$),
        'example', jsonb_build_object('statement', $$Beschreibe eine Person, die zwischen zwei Kulturen lebt.$$, 'solution', $$Sie fühlt sich sowohl deutsch als auch ivorisch.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz mit "sowohl... als auch": er / sprechen / Deutsch / Französisch$$, 'solution', $$Er spricht sowohl Deutsch als auch Französisch.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du schreibst einen kurzen Text über die afrikanische Gemeinschaft in einer deutschen Stadt, für ein Schulprojekt über kulturelle Vielfalt.$$,
      'questions', array[
        $$Vergleiche zwei Kulturen mit "wie" oder "als".$$,
        $$Beschreibe ein Beispiel afrikanischer Kultur in Deutschland.$$,
        $$Benutze ein Adjektiv mit der richtigen Endung, um ein Fest oder einen Verein zu beschreiben.$$,
        $$Erkläre, wie eine Person zwischen zwei Kulturen leben kann (benutze "sowohl... als auch").$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Bilde einen Vergleich mit "als": das Essen in Abidjan / würziger / das Essen in Berlin$$,
      'hint', $$"als" wird bei einem Unterschied benutzt (Komparativ + als).$$,
      'expected', $$Das Essen in Abidjan ist würziger als das Essen in Berlin.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze die richtige Adjektivendung: Das ist ein afrikanisch__ Fest.$$,
      'hint', $$neutrales Substantiv, Nominativ -> Endung -es.$$,
      'expected', $$Das ist ein afrikanisches Fest.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz mit "sowohl... als auch": meine Familie / feiern / deutsche Feste / ivorische Feste$$,
      'hint', $$sowohl + erstes Element + als auch + zweites Element.$$,
      'expected', $$Meine Familie feiert sowohl deutsche Feste als auch ivorische Feste.$$
    ),
    jsonb_build_object(
      'question', $$Nenne eine deutsche Stadt, in der eine afrikanische Gemeinschaft lebt.$$,
      'hint', $$Denk an eine der großen deutschen Städte, die im Text erwähnt wurden.$$,
      'expected', $$In Berlin lebt eine große afrikanische Gemeinschaft.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-afrique-allemagne';
