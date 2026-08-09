-- Contenu partiellement ancré sur un vrai PDF officiel d'ecole-ci.org
-- (Collège Numérique, catégorie "QUATRIEME > Allemand", cours "THEME 4
-- LECON 2", ressource mod/resource id 6667 : "ALLEMAND 4ème THEME 4
-- LECON 2.pdf"). Le PDF couvre la leçon "Treib doch Sport" (Thème 4
-- "Gesundheit", manuel Deutsch? Na klar!), dont le point de grammaire
-- central est l'impératif (formes du/wir/ihr/Sie, verbes irréguliers
-- geben→gib, nehmen→nimm, essen→iss, lesen→lies). Cette grammaire de
-- l'impératif est reprise et reformulée ici (section 2, aucune phrase du
-- PDF recopiée), transposée du contexte sportif du PDF ("fais du sport")
-- au contexte alimentaire du titre "Goûte donc" du catalogue. Le
-- vocabulaire de la nourriture, "schmecken" + datif et "gern"/"lieber"
-- (sections 1 et 3) ne sont pas dans ce PDF et restent des ajouts
-- originaux. Rédigé en allemand (immersion LV2), chrome de l'application
-- en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Auf dem Markt in Abidjan probiert eine deutsche Austauschschülerin zum ersten Mal ivorisches Essen. Ihre Gastfamilie ermutigt sie, verschiedene Gerichte zu probieren.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Essen und Geschmack$$,
        'body', $$Um über Essen und Geschmack zu sprechen, braucht man Vokabular für Lebensmittel und Geschmacksrichtungen.$$,
        'highlights', array[$$das Essen$$, $$probieren$$, $$schmecken$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Obst$$, $$Bananen, Ananas, Mangos$$),
            jsonb_build_array($$der Reis$$, $$ein wichtiges Grundnahrungsmittel$$),
            jsonb_build_array($$süß$$, $$wie Zucker$$),
            jsonb_build_array($$scharf$$, $$wie Pfeffer oder Chili$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Das Verb "probieren" bedeutet, ein Gericht zum ersten Mal zu kosten.$$),
        'example', jsonb_build_object('statement', $$Was isst du gern auf dem Markt?$$, 'solution', $$Ich esse gern Mangos und Reis.$$),
        'fixation', jsonb_build_object('question', $$Nenne ein süßes und ein scharfes Gericht.$$, 'solution', $$Die Mango ist süß, und der Pfeffer ist scharf.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: der Imperativ, um jemanden aufzufordern$$,
        'body', $$Um jemanden freundlich aufzufordern, etwas zu tun (zum Beispiel ein Gericht zu probieren), benutzt man den Imperativ. Er hat vier Formen: du, wir, ihr und die Höflichkeitsform Sie.$$,
        'highlights', array[$$der Imperativ$$, $$probier$$, $$probiert$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Person$$, $$Imperativform$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$du$$, $$Probier(e) den Fisch!$$),
            jsonb_build_array($$wir$$, $$Probieren wir den Fisch!$$),
            jsonb_build_array($$ihr$$, $$Probiert den Fisch!$$),
            jsonb_build_array($$Sie$$, $$Probieren Sie den Fisch!$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Der du-Imperativ entspricht dem Verbstamm, manchmal mit einem zusätzlichen -e (probier/probiere); der ihr-Imperativ entspricht der ihr-Form ohne Pronomen (probiert); der Sie-Imperativ stellt das Verb vor "Sie" (Probieren Sie). Einige Verben sind unregelmäßig: essen → iss!, nehmen → nimm!, geben → gib!, lesen → lies!$$),
        'example', jsonb_build_object('statement', $$Wie fordert man einen Freund auf, den Kuchen zu probieren?$$, 'solution', $$Probier den Kuchen!$$),
        'fixation', jsonb_build_object('question', $$Bilde den Imperativ (du-Form): essen / die Suppe$$, 'solution', $$Iss die Suppe!$$)
      ),
      jsonb_build_object(
        'heading', $$Vorlieben ausdrücken: schmecken und gern/lieber$$,
        'body', $$Um zu sagen, ob einem ein Gericht gefällt, benutzt man "schmecken" mit dem Dativ, oder "gern"/"lieber" nach dem konjugierten Verb.$$,
        'highlights', array[$$schmecken$$, $$gern$$, $$lieber$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"schmecken" braucht die Person im Dativ: Das Essen schmeckt mir/dir/ihm gut. "gern" steht direkt nach dem Verb (ich esse gern Reis); die Steigerung ist "lieber" (ich esse lieber Fisch).$$),
        'example', jsonb_build_object('statement', $$Schmeckt dir das Gericht?$$, 'solution', $$Ja, es schmeckt mir sehr gut, aber ich esse lieber Fufu.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "schmecken": Der Kuchen ___ ihnen gut.$$, 'solution', $$Der Kuchen schmeckt ihnen gut.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du isst mit einem deutschen Gast zu Mittag und ermutigst ihn, verschiedene ivorische Gerichte zu probieren.$$,
      'questions', array[
        $$Fordere den Gast höflich auf (mit "Sie"), den Fisch zu probieren.$$,
        $$Fordere zwei Freunde auf (ihr-Form), die Suppe zu probieren.$$,
        $$Frag, wie ihm das Gericht schmeckt.$$,
        $$Sag, was du lieber isst.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Bilde den Imperativ (du-Form): probieren / die Banane$$,
      'hint', $$Verbstamm + e.$$,
      'expected', $$Probier(e) die Banane!$$
    ),
    jsonb_build_object(
      'question', $$Bilde den Imperativ (Sie-Form): nehmen / etwas Reis$$,
      'hint', $$Bei der Sie-Form bleibt die Infinitivform: Nehmen Sie...$$,
      'expected', $$Nehmen Sie etwas Reis!$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "schmecken": Das Gericht ___ mir sehr gut.$$,
      'hint', $$3. Person Singular: schmeckt.$$,
      'expected', $$Das Gericht schmeckt mir sehr gut.$$
    ),
    jsonb_build_object(
      'question', $$Bilde den Imperativ (ihr-Form): essen / die Suppe$$,
      'hint', $$Der ihr-Imperativ entspricht der ihr-Form: esst.$$,
      'expected', $$Esst die Suppe!$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-goute-donc';
