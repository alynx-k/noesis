-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Allemand, categoryid=119.
-- Moodle course id 1295: "LECON 1 FICHE 2" (Thema: Fürs Leben lernen —
-- École et formation) (https://lyc.ecole-ci.org/course/view.php?id=1295),
-- resource id 9118. Le PDF source renvoie à un texte de lecture d'un
-- manuel externe ("Ihr und Wir plus 3", non fourni) pour les projets
-- scolaires ; contenu composé originalement pour enseigner les mêmes
-- points de grammaire (adjectifs + prépositions, lassen au parfait) et le
-- même vocabulaire (types de projets scolaires en Allemagne, génériques
-- et factuels), qui sont des règles linguistiques, non soumises au droit
-- d'auteur.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-all-lecon1-adjektive-lassen',
  '1ere',
  'A',
  'allemand',
  $$Fürs Leben lernen: Adjektive mit Präpositionen und lassen$$,
  2,
  '1ere-a-all-lecon1-schulsystem',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Im Rahmen eines Austauschs mit einer deutschen Partnerschule nehmen Mitglieder des Deutschclubs von 1ère A an einem Sommerkurs teil. Sie möchten ihren deutschen Mitschülern über das soziale Engagement der Schüler durch Schulprojekte berichten, indem sie Adjektive mit Präpositionen und das Verb lassen benutzen.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Grammatik: Adjektive mit Präpositionen$$,
        'body', $$Certains adjectifs allemands se construisent toujours avec une préposition fixe, qui régit soit l'accusatif soit le datif. Avec l'accusatif : stolz auf (fier de), froh über (content de), glücklich über (heureux de), gespannt auf (impatient de), erstaunt über (étonné de). Avec le datif : interessiert an (intéressé par), zufrieden mit (satisfait de), begeistert von (enthousiasmé par), überzeugt von (convaincu de).$$,
        'highlights', array[$$+ Akkusativ : stolz auf, froh über, glücklich über, gespannt auf, erstaunt über$$, $$+ Dativ : interessiert an, zufrieden mit, begeistert von, überzeugt von$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Adjektiv + Präposition', 'Kasus', 'Beispiel']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$stolz auf$$, $$Akkusativ$$, $$Sie ist stolz auf ihr Projekt.$$),
            jsonb_build_array($$interessiert an$$, $$Dativ$$, $$Er ist interessiert an der Schülerzeitung.$$),
            jsonb_build_array($$zufrieden mit$$, $$Dativ$$, $$Wir sind zufrieden mit dem Ergebnis.$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Mit welchem Kasus wird das Adjektiv „begeistert von" verwendet?$$, 'solution', $$Mit dem Dativ.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: lassen als Vollverb im Perfekt$$,
        'body', $$Employé comme verbe à part entière (au sens de « laisser quelque chose quelque part »), lassen forme son participe passé normalement, avec le préfixe ge- : gelassen. Exemple au présent : « Die Schüler lassen ihre Bücher im Klassenzimmer » (les élèves laissent leurs livres dans la salle de classe). Au parfait : « Die Schüler haben ihre Bücher im Klassenzimmer gelassen. »$$,
        'highlights', array[$$lassen (laisser qqch. quelque part) → Partizip II : gelassen (avec ge-)$$]::text[],
        'example', jsonb_build_object('statement', $$Mets au parfait : « Er lässt sein Handy zu Hause. » (il laisse son portable à la maison)$$, 'solution', $$Er hat sein Handy zu Hause gelassen.$$),
        'fixation', jsonb_build_object('question', $$Wie lautet das Partizip II von lassen, wenn es als Vollverb benutzt wird?$$, 'solution', $$Gelassen.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: lassen als Modalverb (double infinitif)$$,
        'body', $$Employé comme auxiliaire modal (au sens de « faire faire » ou « laisser faire » quelque chose), lassen ne forme pas de participe passé avec ge- : au parfait, on utilise l'infinitif lassen lui-même, précédé de l'infinitif du verbe principal — c'est ce qu'on appelle le double infinitif, placé en fin de phrase, avec haben comme auxiliaire. Exemple au présent : « Der Lehrer lässt die Schüler diskutieren » (le professeur laisse les élèves discuter). Au parfait : « Der Lehrer hat die Schüler diskutieren lassen. »$$,
        'highlights', array[$$lassen (faire faire / laisser faire) → pas de ge-, double infinitif en fin de phrase$$, $$haben + [Infinitiv Hauptverb] + lassen$$]::text[],
        'example', jsonb_build_object('statement', $$Mets au parfait : « Die Schüler lassen sich ein neues Projekt einfallen. » (les élèves imaginent un nouveau projet)$$, 'solution', $$Die Schüler haben sich ein neues Projekt einfallen lassen.$$),
        'fixation', jsonb_build_object('question', $$Warum bildet lassen als Modalverb im Perfekt kein Partizip II mit ge-?$$, 'solution', $$Weil es, wie die anderen Modalverben (können, müssen...), im Perfekt einen Ersatzinfinitiv (double infinitif) bildet: haben + Infinitiv des Hauptverbs + lassen (statt gelassen), am Satzende.$$)
      ),
      jsonb_build_object(
        'heading', $$Wortschatz: Projekte an einer Schule$$,
        'body', $$Dans les lycées allemands, les élèves participent souvent à des projets d'engagement social, organisés notamment par le SMV (Schülermitverwaltung / Schülermitverantwortung, littéralement « co-gestion des élèves »). Exemples courants : « Schüler helfen Schülern » (des élèves aident d'autres élèves, tutorat entre pairs), un club Informatik, une Aktion gegen Vorurteile und Rassismus (action contre les préjugés et le racisme), une Schülerzeitung (journal des élèves), ou encore des projets d'embellissement de la cour de récréation (Schulhof) : peindre des fresques, installer des bacs à fleurs, construire des bancs en bois.$$,
        'highlights', array[$$SMV = Schülermitverantwortung (part de responsabilité des élèves)$$, $$exemples : Schüler helfen Schülern, Schülerzeitung, Aktion gegen Rassismus$$]::text[],
        'fixation', jsonb_build_object('question', $$Was bedeutet die Abkürzung SMV?$$, 'solution', $$Schülermitverantwortung (ou Schülermitverwaltung) — la part de responsabilité/gestion confiée aux élèves dans la vie scolaire.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ein Mitglied deines Deutschclubs hat Probleme mit der Verwendung von Adjektiven mit Präpositionen und mit lassen im Perfekt. Der Club organisiert einen Unterricht darüber.$$,
      'questions', array[
        $$Bilde drei Sätze mit verschiedenen Adjektiven mit Präpositionen (mindestens einen mit Akkusativ und einen mit Dativ).$$,
        $$Gib zwei Sätze mit lassen im Perfekt: einen mit lassen als Vollverb, einen mit lassen als Modalverb.$$,
        $$Beschreibe ein Schulprojekt, das du an deiner eigenen Schule organisieren würdest, und benutze dabei mindestens ein Adjektiv mit Präposition.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze die Präposition: „Ich bin stolz ___ mein Projekt." (Akkusativ)$$,
      'hint', $$stolz auf + Akkusativ.$$,
      'expected', $$auf$$
    ),
    jsonb_build_object(
      'question', $$Wie lautet das Partizip II von „lassen", wenn man z.B. sagt „ich habe mein Buch zu Hause ___"?$$,
      'hint', $$Hier ist lassen ein Vollverb.$$,
      'expected', $$gelassen$$
    ),
    jsonb_build_object(
      'question', $$Bilde den Perfekt-Satz mit lassen als Modalverb: „Die Lehrerin lässt die Schüler früher gehen."$$,
      'hint', $$Double infinitif, kein ge-.$$,
      'expected', $$Die Lehrerin hat die Schüler früher gehen lassen.$$
    ),
    jsonb_build_object(
      'question', $$Was bedeutet die Abkürzung SMV auf Deutsch?$$,
      'hint', $$Es geht um die Verantwortung der Schüler.$$,
      'expected', $$Schülermitverantwortung / Schülermitverwaltung.$$
    )
  ),
  now()
);
