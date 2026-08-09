-- Contenu de secours (fallback) confirmé après vérification réelle :
-- ecole-ci.org (Collège Numérique, https://coll.ecole-ci.org) est
-- désormais accessible, et les 8 leçons réellement publiées dans la
-- catégorie "QUATRIEME > Allemand" ont toutes été téléchargées et lues
-- (Thème 1 Begrüßung/Vorstellung, Thème 2 Meine Schule, Thème 3 Arbeit
-- und Freizeit, Thème 4 Gesundheit — cf. les autres fichiers
-- 20260813*_allemand_4e_*_content.sql pour le détail). Aucune de ces 8
-- leçons ne traite la vie au village ou la campagne ; il n'existe donc
-- pas de PDF officiel pour ce thème dans ce catalogue. Contenu original
-- inchangé, rédigé à partir d'une connaissance générale solide d'un
-- programme d'allemand LV2 débutant standard. Rédigé en allemand
-- (immersion LV2), chrome de l'application en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In den Ferien besucht eine deutsche Austauschschülerin ein Dorf in der Elfenbeinküste. Sie entdeckt das Leben auf dem Land und beschreibt, was sie sieht.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: das Dorf und das Landleben$$,
        'body', $$Auf dem Land gibt es andere Wörter und Landschaften als in der Stadt: das Feld, der Bauer, die Hütte.$$,
        'highlights', array[$$das Dorf$$, $$der Bauer$$, $$das Feld$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Dorf$$, $$eine kleine Ortschaft auf dem Land$$),
            jsonb_build_array($$der Bauer$$, $$ein Mann, der auf dem Feld arbeitet$$),
            jsonb_build_array($$das Feld$$, $$ein Stück Land, wo man Pflanzen anbaut$$),
            jsonb_build_array($$die Hütte$$, $$ein kleines, einfaches Haus$$),
            jsonb_build_array($$der Brunnen$$, $$eine Stelle, wo man Wasser holt$$),
            jsonb_build_array($$das Vieh$$, $$die Tiere eines Bauernhofs, zum Beispiel Kühe und Ziegen$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Zusammengesetzte Nomen wie "das Dorfleben" (Dorf + Leben) haben immer den Artikel des letzten Wortteils.$$),
        'example', jsonb_build_object('statement', $$Was gibt es in einem afrikanischen Dorf?$$, 'solution', $$In einem Dorf gibt es Hütten, Felder und oft einen Brunnen.$$),
        'fixation', jsonb_build_object('question', $$Nenne zwei Tiere, die man auf einem Bauernhof findet.$$, 'solution', $$Kühe und Ziegen sind zwei Tiere, die man auf einem Bauernhof findet.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: "es gibt" und der Akkusativ$$,
        'body', $$Um zu sagen, dass etwas existiert oder vorhanden ist, benutzt man den Ausdruck "es gibt" mit dem Akkusativ.$$,
        'highlights', array[$$es gibt$$, $$der Akkusativ$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nominativ$$, $$Akkusativ nach "es gibt"$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Brunnen$$, $$einen Brunnen$$),
            jsonb_build_array($$die Hütte$$, $$eine Hütte$$),
            jsonb_build_array($$das Feld$$, $$ein Feld$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"es gibt" ist unpersönlich und wird immer in der 3. Person Singular benutzt, gefolgt vom Akkusativ.$$),
        'example', jsonb_build_object('statement', $$Was gibt es in diesem Dorf?$$, 'solution', $$In diesem Dorf gibt es einen Brunnen und viele Felder.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz mit "es gibt": ein Markt / im Dorf$$, 'solution', $$Im Dorf gibt es einen Markt.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: Präpositionen des Ortes$$,
        'body', $$Um zu beschreiben, wo sich etwas befindet, benutzt man Präpositionen wie "in", "auf", "neben" und "vor" mit dem Dativ.$$,
        'highlights', array[$$in$$, $$auf$$, $$neben$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Präposition$$, $$Beispiel$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$in$$, $$Das Dorf liegt in den Bergen.$$),
            jsonb_build_array($$auf$$, $$Die Kühe sind auf dem Feld.$$),
            jsonb_build_array($$neben$$, $$Die Hütte steht neben dem Brunnen.$$),
            jsonb_build_array($$vor$$, $$Die Kinder spielen vor dem Haus.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Diese Präpositionen stehen mit dem Dativ, wenn sie einen festen Ort beschreiben (Wo-Frage): dem (maskulin/neutrum), der (feminin).$$),
        'example', jsonb_build_object('statement', $$Wo spielen die Kinder?$$, 'solution', $$Die Kinder spielen vor der Hütte.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit der richtigen Präposition und Artikel: Die Ziege steht ___ (neben) ___ (der Brunnen).$$, 'solution', $$Die Ziege steht neben dem Brunnen.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du beschreibst einem deutschen Brieffreund das Dorf, das du in den Ferien besucht hast.$$,
      'questions', array[
        $$Beschreibe, was es in diesem Dorf gibt (mit "es gibt").$$,
        $$Nenne zwei Tiere, die du auf dem Bauernhof gesehen hast.$$,
        $$Beschreibe, wo die Hütte steht (benutze eine Präposition).$$,
        $$Vergleiche das Leben im Dorf mit dem Leben in der Stadt.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Bilde einen Satz mit "es gibt": ein Brunnen / im Dorf$$,
      'hint', $$"es gibt" + Akkusativ.$$,
      'expected', $$Im Dorf gibt es einen Brunnen.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit der richtigen Präposition: Die Kühe sind ___ dem Feld.$$,
      'hint', $$"auf" + Dativ für eine Fläche.$$,
      'expected', $$Die Kühe sind auf dem Feld.$$
    ),
    jsonb_build_object(
      'question', $$Setze in den Akkusativ nach "es gibt": In diesem Dorf gibt es ___ (eine Hütte) und ___ (ein Feld).$$,
      'hint', $$Feminin und neutrum bleiben im Akkusativ unverändert.$$,
      'expected', $$In diesem Dorf gibt es eine Hütte und ein Feld.$$
    ),
    jsonb_build_object(
      'question', $$Nenne zwei Wörter, die das Leben auf dem Land beschreiben.$$,
      'hint', $$Denk an Orte oder Personen auf dem Land.$$,
      'expected', $$Das Dorf und der Bauer sind zwei Wörter, die das Leben auf dem Land beschreiben.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-visite-village';
