-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Allemand, categoryid=119.
-- Moodle course id 1602: "LECON 2 FICHE 2" (Thema: (K)ein bisschen
-- erwachsen — Jeunesse : mature et immature)
-- (https://lyc.ecole-ci.org/course/view.php?id=1602), resource id 12710.
-- Contenu réécrit à partir du PDF source (règles grammaticales des
-- subordonnées temporelles wenn/als/während/bevor/nachdem, vocabulaire
-- des métiers). Faits linguistiques réels (règles grammaticales, noms de
-- métiers) repris tels quels ; explications et exemples reformulés, non
-- copiés verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-all-lecon2-temporalsaetze-berufe',
  '1ere',
  'A',
  'allemand',
  $$(K)ein bisschen erwachsen: Temporalsätze und Berufe$$,
  4,
  '1ere-a-all-lecon2-konjunktionen-modalverben',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Die Mitglieder des Deutschclubs von 1ère A haben einen Ausflug zu verschiedenen Arbeitsplätzen organisiert. Zurück in der Schule wollen sie einander von ihren zukünftigen Berufen erzählen, indem sie Temporalsätze (wenn, als, während, bevor, nachdem) benutzen.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Grammatik: wenn oder als?$$,
        'body', $$Wenn (quand, lorsque, chaque fois que) exprime une action répétée ou habituelle : au passé, au présent ou au futur. Als (quand, lorsque) exprime au contraire une action unique et achevée dans le passé. Exemple avec wenn (répétition passée) : « Wenn die Schüler Probleme hatten, informierten sie den Lehrer » (chaque fois que les élèves avaient des problèmes, ils informaient le professeur). Exemple avec als (action unique passée) : « Als ein Schüler krank war, konnte er zwei Tage nicht zur Firma gehen » (quand un élève a été malade [une fois], il n'a pas pu aller à l'entreprise pendant deux jours).$$,
        'highlights', array[$$wenn : action répétée/habituelle (passé, présent, futur)$$, $$als : action unique dans le passé$$]::text[],
        'example', jsonb_build_object('statement', $$Wähle wenn oder als: „___ ich zwölf Jahre alt war, bin ich zum ersten Mal nach Deutschland gereist." (une seule fois, dans le passé)$$, 'solution', $$Als (« Als ich zwölf Jahre alt war, bin ich zum ersten Mal nach Deutschland gereist. »)$$),
        'fixation', jsonb_build_object('question', $$Warum benutzt man „als" und nicht „wenn", um über ein einmaliges vergangenes Ereignis zu sprechen?$$, 'solution', $$Weil „wenn" eine Wiederholung oder eine Gewohnheit ausdrückt, während „als" ein einziges, abgeschlossenes Ereignis in der Vergangenheit bezeichnet.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: während, bevor, nachdem$$,
        'body', $$Während (pendant, pendant que) exprime la simultanéité de deux actions. Bevor (avant, avant que) exprime l'antériorité d'une action par rapport à une autre. Nachdem (après, après que) exprime la postériorité d'une action par rapport à une autre — le verbe de la subordonnée introduite par nachdem est généralement au parfait ou au plus-que-parfait, puisque cette action s'est déjà terminée. Ces trois conjonctions ont aussi une forme prépositionnelle : während + génitif, vor + datif, nach + datif.$$,
        'highlights', array[$$während = simultanéité ; bevor = antériorité ; nachdem = postériorité$$, $$formes prépositionnelles : während + Genitiv, vor + Dativ, nach + Dativ$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Konjunktion (Nebensatz)', 'Präposition (+ Kasus)', 'Bedeutung']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$während$$, $$während + Genitiv$$, $$pendant, pendant que (simultanéité)$$),
            jsonb_build_array($$bevor$$, $$vor + Dativ$$, $$avant, avant que (antériorité)$$),
            jsonb_build_array($$nachdem$$, $$nach + Dativ$$, $$après, après que (postériorité)$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Forme une phrase avec nachdem à partir de : « Der Schüler beendet sein Praktikum. Danach schreibt er einen Bericht. »$$, 'solution', $$Nachdem der Schüler sein Praktikum beendet hat, schreibt er einen Bericht.$$),
        'fixation', jsonb_build_object('question', $$Welche Präposition entspricht der Konjunktion „bevor", und mit welchem Kasus wird sie verwendet?$$, 'solution', $$Vor, mit dem Dativ.$$)
      ),
      jsonb_build_object(
        'heading', $$Weitere Temporalkonjunktionen und Berufswortschatz$$,
        'body', $$D'autres conjonctions temporelles courantes : bis (jusqu'à ce que) et seit/seitdem (depuis, depuis que). Pour parler d'un métier (der Beruf), le vocabulaire essentiel comprend : eine Ausbildung machen (faire une formation), eine Prüfung bestehen (réussir un examen), sich um eine Arbeitsstelle bewerben (postuler à un poste), Geld verdienen (gagner de l'argent), einen Beruf ausüben (exercer un métier). Exemples de métiers : der Arzt/die Ärztin (médecin), der Tierarzt/die Tierärztin (vétérinaire), der Journalist/die Journalistin (journaliste), der Informatiker/die Informatikerin (informaticien), der Archäologe/die Archäologin (archéologue).$$,
        'highlights', array[$$bis (jusqu'à ce que) ; seit/seitdem (depuis, depuis que)$$, $$eine Ausbildung machen, eine Prüfung bestehen, einen Beruf ausüben$$]::text[],
        'fixation', jsonb_build_object('question', $$Was braucht man, bevor man sich um eine Arbeitsstelle bewerben kann?$$, 'solution', $$Eine Ausbildung und meist eine bestandene Prüfung (ein Diplom als Nachweis).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dein jüngerer Bruder, der in der 3ème ist, möchte später Kinderarzt (pédiatre) werden. Er möchte von dir Informationen über diesen Beruf bekommen.$$,
      'questions', array[
        $$Sag, was man studieren soll und wie lange die Studien dauern (benutze dabei „bevor" oder „nachdem").$$,
        $$Beschreibe die Rolle des Kinderarztes (benutze dabei „während").$$,
        $$Erzähle, mit „als" oder „wenn", von einer Erfahrung, die dich zu diesem Berufswunsch geführt hat (frei erfunden).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Wähle wenn oder als: „___ es regnet, bleiben die Kinder zu Hause." (Wiederholung, jedes Mal)$$,
      'hint', $$Es handelt sich um eine Gewohnheit.$$,
      'expected', $$Wenn$$
    ),
    jsonb_build_object(
      'question', $$Welche Konjunktion drückt die Gleichzeitigkeit zweier Handlungen aus: während, bevor oder nachdem?$$,
      'hint', $$Sie bedeutet „pendant que".$$,
      'expected', $$Während$$
    ),
    jsonb_build_object(
      'question', $$Mit welchem Kasus wird die Präposition „nach" (Äquivalent zu „nachdem") verwendet?$$,
      'hint', $$Wie „vor".$$,
      'expected', $$Mit dem Dativ.$$
    ),
    jsonb_build_object(
      'question', $$Nenne einen Beruf, der mit Tieren zu tun hat.$$,
      'hint', $$Er behandelt kranke Tiere.$$,
      'expected', $$Der Tierarzt / die Tierärztin (le vétérinaire).$$
    )
  ),
  now()
);
