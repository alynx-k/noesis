-- Contenu ancré sur un vrai PDF officiel d'ecole-ci.org (Collège
-- Numérique, catégorie "QUATRIEME > Allemand", cours "THEME 4 LECON 1",
-- ressource mod/resource id 6679 : "ALLEMAND 4ème THEME 4 LECON 1.pdf").
-- Le PDF couvre le Thème 4 "Gesundheit" (manuel Deutsch? Na klar!), leçon
-- "Ich habe Schmerzen" : vocabulaire de la visite chez le médecin
-- (Krankenhaus, Arzt, Patient, Rezept, Spritze, untersuchen,
-- verschreiben), formes du pluriel des noms combinées à "wehtun"
-- (das Auge → die Augen tun mir weh), et un exercice associant conseils
-- de santé et maladies (dents, eau propre, moustiquaire → malaria etc.)
-- repris ici sous forme de conseils avec sollen/müssen. Reformulation
-- entièrement originale (aucune phrase du PDF recopiée telle quelle) ;
-- le vœu "Gute Besserung!" (section 4) n'apparaît pas explicitement dans
-- ce PDF et reste un ajout original pour coller au titre du catalogue.
-- Rédigé en allemand (immersion LV2), chrome de l'application en
-- français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dein Freund Kouassi ist krank und bleibt zu Hause. Du besuchst ihn, sprichst mit ihm über seinen Arztbesuch und gibst ihm Ratschläge.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: beim Arzt$$,
        'body', $$Wenn man krank ist, geht man ins Krankenhaus und trifft dort einen Arzt oder eine Ärztin, der/die einen untersucht.$$,
        'highlights', array[$$das Krankenhaus$$, $$der Arzt$$, $$der Schmerz$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Krankenhaus$$, $$der Ort, wohin kranke Menschen gehen$$),
            jsonb_build_array($$der Patient / die Patientin$$, $$eine kranke Person beim Arzt$$),
            jsonb_build_array($$untersuchen$$, $$den Gesundheitszustand prüfen$$),
            jsonb_build_array($$verschreiben$$, $$ein Medikament auf einem Rezept aufschreiben$$),
            jsonb_build_array($$die Spritze$$, $$eine Injektion mit einer Nadel$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um sein Befinden zu beschreiben, sagt man "Es geht mir schlecht" (allgemein) oder "Es tut mir weh" (an einer bestimmten Stelle).$$),
        'example', jsonb_build_object('statement', $$Was macht ein Arzt, wenn ein Patient krank ist?$$, 'solution', $$Er untersucht ihn und verschreibt ihm ein Medikament.$$),
        'fixation', jsonb_build_object('question', $$Was bekommt man beim Arzt, wenn man ein Medikament braucht?$$, 'solution', $$Man bekommt ein Rezept.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: Körperteile, Pluralformen und wehtun$$,
        'body', $$Deutsche Nomen bilden den Plural auf verschiedene Weisen; das gilt auch für die Körperteile, über die man beim Arzt spricht.$$,
        'highlights', array[$$der Plural$$, $$wehtun$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Singular$$, $$Plural$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Auge$$, $$die Augen$$),
            jsonb_build_array($$die Hand$$, $$die Hände$$),
            jsonb_build_array($$das Bein$$, $$die Beine$$),
            jsonb_build_array($$der Finger$$, $$die Finger$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Bei einem Körperteil im Singular sagt man "... tut mir weh", im Plural "... tun mir weh". Da es mehrere Pluralformen gibt (Endung -e, -er, -n, Umlaut oder keine Änderung), muss man jedes Nomen mit seinem Plural lernen.$$),
        'example', jsonb_build_object('statement', $$Was sagst du, wenn beide Augen schmerzen?$$, 'solution', $$Meine Augen tun mir weh.$$),
        'fixation', jsonb_build_object('question', $$Bilde den Plural: der Finger tut mir weh. (mehrere Finger)$$, 'solution', $$Die Finger tun mir weh.$$)
      ),
      jsonb_build_object(
        'heading', $$Ratschläge geben: sollen und müssen$$,
        'body', $$Um einem Kranken einen guten Rat zu geben, benutzt man die Modalverben "sollen" oder "müssen", gefolgt vom Infinitiv am Satzende.$$,
        'highlights', array[$$sollen$$, $$müssen$$, $$der Ratschlag$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Problem$$, $$Ratschlag$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Zahnschmerzen$$, $$Du sollst dir regelmäßig die Zähne putzen.$$),
            jsonb_build_array($$Malaria$$, $$Du musst unter einem Moskitonetz schlafen.$$),
            jsonb_build_array($$Durchfall$$, $$Du sollst nur sauberes Wasser trinken.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"sollen" konjugiert: ich soll, du sollst, er/sie/es soll, wir sollen, ihr sollt, sie/Sie sollen. "müssen" konjugiert: ich muss, du musst, er/sie/es muss. Beide stehen an zweiter Stelle im Satz; der Infinitiv steht am Ende.$$),
        'example', jsonb_build_object('statement', $$Was soll ein Kranker mit Fieber machen?$$, 'solution', $$Er soll viel Wasser trinken und sich ausruhen.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "müssen": Du ___ (müssen) ein Medikament gegen die Schmerzen kaufen.$$, 'solution', $$Du musst ein Medikament gegen die Schmerzen kaufen.$$)
      ),
      jsonb_build_object(
        'heading', $$Gute Besserung wünschen$$,
        'body', $$Wenn jemand krank ist, wünscht man ihm auf Deutsch gute Besserung.$$,
        'highlights', array[$$Gute Besserung$$, $$krank sein$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Der klassische Wunsch für einen Kranken ist "Gute Besserung!". Man kann auch sagen: "Ich hoffe, es geht dir bald besser."$$),
        'example', jsonb_build_object('statement', $$Was sagt man einem kranken Freund zum Abschied?$$, 'solution', $$Gute Besserung! Ich hoffe, es geht dir bald besser.$$),
        'fixation', jsonb_build_object('question', $$Schreib den klassischen deutschen Wunsch für einen Kranken.$$, 'solution', $$Gute Besserung!$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dein Freund Kouassi liegt krank im Bett. Du besuchst ihn, fragst nach seinen Schmerzen und gibst ihm Ratschläge.$$,
      'questions', array[
        $$Frag Kouassi, was ihm wehtut.$$,
        $$Nenne zwei Körperteile im Plural.$$,
        $$Gib Kouassi einen Ratschlag mit "sollen" oder "müssen".$$,
        $$Wünsche Kouassi gute Besserung.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze im Plural: Meine ___ (das Bein) tun mir weh.$$,
      'hint', $$das Bein → die Beine.$$,
      'expected', $$Meine Beine tun mir weh.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "sollen": Ihr ___ (sollen) zum Arzt gehen.$$,
      'hint', $$"sollen" in der ihr-Form: sollt.$$,
      'expected', $$Ihr sollt zum Arzt gehen.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz: der Arzt / verschreiben / ein Medikament$$,
      'hint', $$Präsens, 3. Person Singular: verschreibt.$$,
      'expected', $$Der Arzt verschreibt ein Medikament.$$
    ),
    jsonb_build_object(
      'question', $$Schreib den klassischen deutschen Wunsch für einen Kranken.$$,
      'hint', $$Er beginnt mit "Gute..."$$,
      'expected', $$Gute Besserung!$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-bon-retablissement';
