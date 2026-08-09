-- Contenu partiellement ancré sur un vrai PDF officiel d'ecole-ci.org
-- (Collège Numérique, catégorie "QUATRIEME > Allemand", cours "THEME 1
-- LECON 2", ressource mod/resource id 7556 : "ALLEMAND 4ème THEME 1
-- LECON 2.pdf"). Le PDF couvre la leçon "Wie alt bist du?" (Thème 1
-- "Begrüßung und Vorstellung", manuel Deutsch? Na klar!) : les nombres de
-- 0 à 20, la question "wie alt bist du/seid ihr" et la conjugaison au
-- pluriel de sein/haben/heißen/sagen. Ces deux points (nombres, question
-- de l'âge) sont repris et reformulés ici (aucune phrase du PDF recopiée)
-- pour ancrer les sections 1 et 2. En revanche, le PDF ne traite pas
-- l'anniversaire à proprement parler : la conjugaison de "werden" pour
-- annoncer un nouvel âge, les vœux ("Herzlichen Glückwunsch") et le
-- datif du destinataire d'un cadeau (sections 3 et 4) restent des ajouts
-- originaux, non issus de ce PDF, ajoutés pour coller au titre "Joyeux
-- anniversaire" du catalogue. Rédigé en allemand (immersion LV2), chrome
-- de l'application en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Deine Freundin Adjoua hat heute Geburtstag. Die ganze Klasse feiert mit ihr: man fragt nach ihrem neuen Alter, schenkt ihr etwas und wünscht ihr alles Gute.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Wortschatz: die Zahlen von 0 bis 20$$,
        'body', $$Um sein Alter zu nennen, muss man zuerst die Zahlen von 0 bis 20 beherrschen.$$,
        'highlights', array[$$null$$, $$zehn$$, $$zwanzig$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Zahl$$, $$Deutsch$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$0$$, $$null$$),
            jsonb_build_array($$5$$, $$fünf$$),
            jsonb_build_array($$10$$, $$zehn$$),
            jsonb_build_array($$15$$, $$fünfzehn$$),
            jsonb_build_array($$20$$, $$zwanzig$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Die Zahlen von 13 bis 19 enden auf "-zehn" (dreizehn, vierzehn...), und man muss sie auswendig lernen, um sein Alter richtig auszusprechen.$$),
        'example', jsonb_build_object('statement', $$Wie schreibt man die Zahl 14 auf Deutsch?$$, 'solution', $$Man schreibt: vierzehn.$$),
        'fixation', jsonb_build_object('question', $$Schreib die Zahl 17 auf Deutsch.$$, 'solution', $$siebzehn$$)
      ),
      jsonb_build_object(
        'heading', $$Nach dem Alter fragen und antworten$$,
        'body', $$Um das Alter einer Person zu erfragen, benutzt man "wie alt", gefolgt vom Verb "sein".$$,
        'highlights', array[$$wie alt$$, $$Jahre alt$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Frage$$, $$Antwort$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Wie alt bist du?$$, $$Ich bin dreizehn Jahre alt.$$),
            jsonb_build_array($$Wie alt seid ihr?$$, $$Wir sind vierzehn Jahre alt.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Im Plural bekommen "sein", "haben", "heißen" und "sagen" eigene Formen: wir sind/haben/heißen/sagen, ihr seid/habt/heißt/sagt, sie/Sie sind/haben/heißen/sagen.$$),
        'example', jsonb_build_object('statement', $$Wie fragst du zwei Freunde nach ihrem Alter?$$, 'solution', $$Wie alt seid ihr?$$),
        'fixation', jsonb_build_object('question', $$Ergänze im Plural: Wir ___ (sein) zwölf Jahre alt.$$, 'solution', $$Wir sind zwölf Jahre alt.$$)
      ),
      jsonb_build_object(
        'heading', $$Am Geburtstag: mit "werden" ein neues Alter erreichen$$,
        'body', $$An seinem Geburtstag wird man ein Jahr älter. Dafür benutzt man das Verb "werden" statt "sein".$$,
        'highlights', array[$$werden$$, $$der Geburtstag$$]::text[],
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$"werden" konjugiert: ich werde, du wirst, er/sie/es wird, wir werden, ihr werdet, sie/Sie werden. Struktur: Person + werden + Zahl + Jahre alt.$$),
        'example', jsonb_build_object('statement', $$Wie alt wird dein Bruder morgen?$$, 'solution', $$Mein Bruder wird morgen fünfzehn Jahre alt.$$),
        'fixation', jsonb_build_object('question', $$Ergänze mit "werden": Meine Schwester ___ heute elf Jahre alt.$$, 'solution', $$Meine Schwester wird heute elf Jahre alt.$$)
      ),
      jsonb_build_object(
        'heading', $$Gute Wünsche und ein Geschenk machen (Dativ)$$,
        'body', $$Am Geburtstag wünscht man der Person alles Gute und macht ihr oft ein Geschenk. Die beschenkte Person steht dabei im Dativ.$$,
        'highlights', array[$$schenken$$, $$der Dativ$$, $$Herzlichen Glückwunsch$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Nominativ$$, $$Dativ$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$der Freund$$, $$dem Freund$$),
            jsonb_build_array($$die Freundin$$, $$der Freundin$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammatik$$, 'text', $$Der klassische deutsche Geburtstagswunsch ist "Herzlichen Glückwunsch zum Geburtstag!". Bei "schenken" steht die beschenkte Person im Dativ und die Sache im Akkusativ.$$),
        'example', jsonb_build_object('statement', $$Was schenkst du deinem Freund zum Geburtstag?$$, 'solution', $$Ich schenke meinem Freund ein Buch.$$),
        'fixation', jsonb_build_object('question', $$Bilde einen Satz: wir / schenken / die Schwester / eine Kette$$, 'solution', $$Wir schenken der Schwester eine Kette.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deine Klasse feiert den Geburtstag von Adjoua. Ihr fragt nach ihrem Alter, wünscht ihr alles Gute und macht ihr ein Geschenk.$$,
      'questions', array[
        $$Frag Adjoua, wie alt sie heute wird.$$,
        $$Sag, wie alt du selbst bist.$$,
        $$Schreib den klassischen deutschen Geburtstagswunsch.$$,
        $$Sag, was ihr Adjoua schenkt (im Dativ).$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Schreib die Zahl 17 auf Deutsch.$$,
      'hint', $$Sie endet auf "-zehn".$$,
      'expected', $$siebzehn$$
    ),
    jsonb_build_object(
      'question', $$Ergänze mit "werden": Ihr ___ (werden) heute vierzehn Jahre alt.$$,
      'hint', $$"werden" in der ihr-Form: werdet.$$,
      'expected', $$Ihr werdet heute vierzehn Jahre alt.$$
    ),
    jsonb_build_object(
      'question', $$Ergänze im Plural mit "sein": Wir ___ dreizehn Jahre alt.$$,
      'hint', $$Plural von sein: sind.$$,
      'expected', $$Wir sind dreizehn Jahre alt.$$
    ),
    jsonb_build_object(
      'question', $$Setze die Person in den Dativ: Ich schenke ___ (der Bruder) ein Spiel.$$,
      'hint', $$"der" wird im Dativ zu "dem".$$,
      'expected', $$Ich schenke dem Bruder ein Spiel.$$
    )
  ),
  content_generated_at = now()
where id = 'allemand-4e-joyeux-anniversaire';
