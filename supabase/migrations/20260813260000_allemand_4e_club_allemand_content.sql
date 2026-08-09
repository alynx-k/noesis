-- Contenu partiellement ancré sur un vrai PDF officiel d'ecole-ci.org
-- (Collège Numérique, catégorie "QUATRIEME > Allemand", cours "THEME 3
-- LECON 1", ressource mod/resource id 7472 : "ALLEMAND 4ème THEME 3
-- LECON 1.pdf"). Le PDF couvre le Thème 3 "Arbeit und Freizeit" (manuel
-- Deutsch? Na klar!), leçon "Mein Traumberuf" : vocabulaire des loisirs
-- (das Hobby, die Freizeit), les modalverben möchten/wollen/können/mögen,
-- et les subjonctions weil/dass/wenn. Ces deux points de grammaire et le
-- sous-thème "loisirs" sont repris et reformulés ici (sections 1 à 3,
-- aucune phrase du PDF recopiée), transposés du contexte "métier de rêve"
-- du PDF au contexte du club d'allemand du catalogue. Le verbe réfléchi
-- "sich treffen" (section 4), central pour l'idée de club, n'est pas dans
-- ce PDF et reste un ajout original. Rédigé en allemand (immersion LV2),
-- chrome de l'application en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In deiner Schule gibt es einen Deutschclub. Die Mitglieder sprechen über ihre Hobbys und darüber, was sie im Club schon auf Deutsch können.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: Hobbys und Freizeitaktivitäten$$,
        'body', $$Im Deutschclub spricht man oft über die eigenen Hobbys, also die Aktivitäten, die man in der Freizeit gern macht.$$,
        'highlights', array[$$das Hobby$$, $$die Freizeit$$, $$gern$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Wort$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$das Hobby$$, $$eine Lieblingsbeschäftigung in der Freizeit$$),
            jsonb_build_array($$die Freizeit$$, $$die Zeit ohne Schule oder Arbeit$$),
            jsonb_build_array($$Fußball spielen$$, $$ein beliebter Sport$$),
            jsonb_build_array($$Musik hören$$, $$Lieder oder Radio anhören$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Um sein Hobby zu nennen, sagt man "Mein Hobby ist..." oder "In meiner Freizeit spiele ich gern...".$$),
        'example', jsonb_build_object('statement', $$Was ist dein Hobby?$$, 'solution', $$Mein Hobby ist Musik hören, und ich spiele auch gern Fußball.$$),
        'fixation', jsonb_build_object('question', $$Nenne zwei Freizeitaktivitäten, die man im Deutschclub machen kann.$$, 'solution', $$Man kann im Deutschclub Lieder hören und Spiele spielen.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: die Modalverben möchten, wollen, können, mögen$$,
        'body', $$Um über Wünsche, Absichten und Fähigkeiten zu sprechen, benutzt man Modalverben. Sie stehen an zweiter Stelle, das Hauptverb steht als Infinitiv am Satzende.$$,
        'highlights', array[$$möchten$$, $$können$$, $$das Modalverb$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Verb$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$möchten$$, $$einen Wunsch ausdrücken$$),
            jsonb_build_array($$wollen$$, $$eine feste Absicht ausdrücken$$),
            jsonb_build_array($$können$$, $$eine Fähigkeit ausdrücken$$),
            jsonb_build_array($$mögen$$, $$eine Vorliebe ausdrücken$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"können" konjugiert: ich kann, du kannst, er/sie/es kann, wir können, ihr könnt, sie/Sie können. Die anderen Modalverben (möchten, wollen, mögen) folgen einem ähnlichen Muster mit unregelmäßigem Singular.$$),
        'example', jsonb_build_object('statement', $$Was möchtest du im Deutschclub lernen?$$, 'solution', $$Ich möchte ein deutsches Lied singen können.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "können": Nach einem Jahr im Club ___ (können) wir viele Wörter auf Deutsch.$$, 'solution', $$Nach einem Jahr im Club können wir viele Wörter auf Deutsch.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: Nebensätze mit weil, dass und wenn$$,
        'body', $$Um einen Grund, eine Aussage oder eine Bedingung auszudrücken, benutzt man die Subjunktionen weil, dass und wenn. Das konjugierte Verb steht dabei am Ende des Nebensatzes.$$,
        'highlights', array[$$weil$$, $$dass$$, $$wenn$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Konjunktion$$, $$Bedeutung$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$weil$$, $$drückt einen Grund aus$$),
            jsonb_build_array($$dass$$, $$leitet eine Aussage ein$$),
            jsonb_build_array($$wenn$$, $$drückt eine Bedingung aus$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$In einem Nebensatz mit weil, dass oder wenn steht das konjugierte Verb ganz am Ende: Ich gehe in den Club, weil ich Deutsch üben möchte.$$),
        'example', jsonb_build_object('statement', $$Warum gehst du in den Deutschclub?$$, 'solution', $$Ich gehe in den Deutschclub, weil ich gern Deutsch spreche.$$),
        'fixation', jsonb_build_object('question', $$Verbinde die Sätze mit "weil": Ich singe gern. Ich bin im Deutschclub.$$, 'solution', $$Ich bin im Deutschclub, weil ich gern singe.$$)
      ),
      jsonb_build_object(
        'heading', $$Sich treffen: ein reflexives Verb für den Club$$,
        'body', $$Um zu sagen, dass sich die Mitglieder eines Clubs regelmäßig versammeln, benutzt man das reflexive Verb "sich treffen".$$,
        'highlights', array[$$sich treffen$$, $$das Mitglied$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"sich treffen" konjugiert: ich treffe mich, du triffst dich, er/sie/es trifft sich, wir treffen uns, ihr trefft euch, sie/Sie treffen sich.$$),
        'example', jsonb_build_object('statement', $$Wann trefft ihr euch im Deutschclub?$$, 'solution', $$Wir treffen uns jeden Mittwoch nach der Schule.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "sich treffen": Die Mitglieder ___ ___ jeden Freitag.$$, 'solution', $$Die Mitglieder treffen sich jeden Freitag.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du stellst den Deutschclub deiner Schule einem neuen Mitglied vor: eure Hobbys, was ihr könnt und warum ihr euch trefft.$$,
      'questions', array[
        $$Sag, was dein Hobby ist.$$,
        $$Sag, was du im Club schon auf Deutsch kannst (mit "können").$$,
        $$Erkläre mit "weil", warum du in den Club gehst.$$,
        $$Sag, wann sich der Club trifft (mit "sich treffen").$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze mit "möchten": Ich ___ (möchten) ein deutsches Lied lernen.$$,
      'hint', $$"möchten" in der ich-Form: möchte.$$,
      'expected', $$Ich möchte ein deutsches Lied lernen.$$
    ),
    jsonb_build_object(
      'question', $$Verbinde mit "dass": Der Lehrer sagt. Der Club trifft sich am Montag.$$,
      'hint', $$"dass" leitet eine Aussage ein, Verb ans Ende.$$,
      'expected', $$Der Lehrer sagt, dass sich der Club am Montag trifft.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "sich treffen": Wir ___ ___ jeden Dienstag.$$,
      'hint', $$wir-Form: wir treffen uns.$$,
      'expected', $$Wir treffen uns jeden Dienstag.$$
    ),
    jsonb_build_object(
      'question', $$Bilde einen Satz mit "wenn": (du / kommen früh) (wir / singen zusammen)$$,
      'hint', $$"wenn" + Verb am Ende des Nebensatzes.$$,
      'expected', $$Wenn du früh kommst, singen wir zusammen.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-club-allemand';
