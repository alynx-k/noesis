-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Allemand, categoryid=119.
-- Moodle course id 1293: "LECON 3 FICHE 1" (le PDF source porte encore
-- l'en-tête "LEÇON 2" — a priori une erreur d'étiquetage côté plateforme,
-- son contenu grammatical — les emplois de « es » — étant bien distinct
-- des leçons 1 et 2 déjà traitées).
-- (https://lyc.ecole-ci.org/course/view.php?id=1293), resource id 9094.
-- Contenu réécrit à partir du PDF source (règle grammaticale sur les
-- trois emplois de « es » en allemand : partie obligatoire d'une
-- expression, pronom, ou « pion » placé avant le verbe). Fait
-- linguistique réel (règle grammaticale) repris tel quel ; explications
-- et exemples reformulés, non copiés verbatim. Dernière leçon de la
-- séquence Allemand de 1ère A (5/5 leçons disponibles sur la
-- plateforme).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-all-verwendung-von-es',
  '1ere',
  'A',
  'allemand',
  $$Die Verwendung von "es"$$,
  5,
  '1ere-a-all-lecon2-temporalsaetze-berufe',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Estelle und Mariama, zwei Schülerinnen von 1ère A, diskutieren über die Wichtigkeit von Büchern und Filmen. In ihren Sätzen benutzen sie oft das Wort „es" — aber nicht immer auf dieselbe Weise. Die Klasse entscheidet, die verschiedenen Verwendungen von „es" genauer zu untersuchen.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Erste Verwendung: es als fester (obligatorischer) Teil eines Ausdrucks$$,
        'body', $$Dans certaines expressions figées, es fait partie intégrante du verbe et ne peut jamais être supprimé ni remplacé, même si l'on ne sait pas exactement « à quoi » il renvoie. C'est le cas des verbes impersonnels (météo, sensations) et de nombreuses locutions fixes : « Es regnet » (il pleut), « Es gibt viele Bücher » (il y a beaucoup de livres), « Wie geht es dir? » (comment vas-tu ?), « Es hängt vom Wetter ab » (cela dépend du temps).$$,
        'highlights', array[$$es obligatoire dans les verbes impersonnels : es regnet, es gibt...$$, $$ne peut jamais être omis ou déplacé dans ces expressions$$]::text[],
        'fixation', jsonb_build_object('question', $$Kann man in „Es gibt viele Bücher" das „es" weglassen?$$, 'solution', $$Nein — hier ist „es" ein fester Bestandteil des Ausdrucks „es gibt" und kann nicht weggelassen werden.$$)
      ),
      jsonb_build_object(
        'heading', $$Zweite Verwendung: es als Pronomen$$,
        'body', $$Es peut fonctionner comme un véritable pronom personnel, reprenant un nom neutre singulier déjà mentionné (ou toute une idée/proposition précédente) — exactement comme « il/elle » ou « ça » en français. Exemple : « Ich habe das Buch gelesen. Es war sehr spannend » (j'ai lu le livre. Il était très passionnant — es reprend das Buch). Autre exemple : « Ich habe den Kindern versprochen, ins Kino zu gehen, und ich habe es gehalten » (j'ai promis aux enfants d'aller au cinéma, et je l'ai tenu — es reprend toute l'idée de la promesse).$$,
        'highlights', array[$$es (pronom) reprend un nom neutre singulier ou toute une idée déjà exprimée$$],
        'example', jsonb_build_object('statement', $$In „Ich habe den Roman noch nicht beendet, aber ich werde es bald tun", worauf bezieht sich „es"?$$, 'solution', $$„Es" bezieht sich hier auf die ganze Handlung „den Roman beenden" (nicht nur auf ein einzelnes Nomen).$$),
        'fixation', jsonb_build_object('question', $$Wie unterscheidet man „es" als Pronomen von „es" als festem Ausdrucksteil?$$, 'solution', $$Als Pronomen ersetzt „es" ein konkretes Nomen oder eine ganze Idee, die man auch explizit nennen könnte; als fester Ausdrucksteil gehört „es" untrennbar zum Verb und verweist auf nichts Konkretes.$$)
      ),
      jsonb_build_object(
        'heading', $$Dritte Verwendung: es als Platzhalter (Vorfeld-es)$$,
        'body', $$Enfin, es peut occuper la première position de la phrase (le « Vorfeld », juste avant le verbe conjugué) uniquement pour respecter la règle du verbe en seconde position, lorsqu'aucun autre élément ne veut occuper cette place — notamment dans les phrases passives sans sujet exprimé. Ce es-là disparaît dès qu'un autre complément prend sa place en tête de phrase. Exemple : « Es wird viel gelesen » (on lit beaucoup) devient, si on met un complément en tête, « In dieser Schule wird viel gelesen » — le es disparaît, car il n'était là que pour occuper la première position.$$,
        'highlights', array[$$es-Platzhalter : occupe la 1ère position uniquement quand rien d'autre ne le fait$$, $$disparaît dès qu'un complément prend sa place en tête de phrase$$, $$fréquent dans les phrases passives sans sujet$$]::text[],
        'example', jsonb_build_object('statement', $$Vergleiche: „Es wird die Fantasie gefördert." und „Die Fantasie wird gefördert." Was passiert mit „es"?$$, 'solution', $$Im ersten Satz steht „es" als Platzhalter in der ersten Position, weil sonst nichts dort stehen würde. Im zweiten Satz übernimmt „die Fantasie" diese erste Position, und „es" verschwindet vollständig — es war kein echtes Satzglied.$$),
        'fixation', jsonb_build_object('question', $$Warum verschwindet das Platzhalter-„es", wenn ein anderes Satzglied an den Satzanfang tritt?$$, 'solution', $$Weil es keine eigene grammatische Funktion (kein Satzglied) ist, sondern nur die erste Position im Satz besetzt, wenn diese sonst leer bliebe; sobald ein anderes Element (z.B. das Subjekt oder eine Zeitangabe) diese Position einnimmt, wird das Platzhalter-„es" überflüssig.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Der Deutschclub deiner Schule wiederholt heute die Grammatiklektion über die Verwendung von „es".$$,
      'questions', array[
        $$Gib jeweils ein Beispiel für die drei Verwendungen von „es" (fester Ausdrucksteil, Pronomen, Platzhalter).$$,
        $$Erkläre deinen Mitschülern, wie man die drei Verwendungen unterscheiden kann.$$,
        $$Wandle den Satz „Es wird ein neues Buch veröffentlicht" so um, dass „es" verschwindet (setze ein anderes Element an den Satzanfang).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$In „Es schneit viel in diesem Winter", welche Verwendung von „es" liegt vor?$$,
      'hint', $$Es ist ein Wetterverb.$$,
      'expected', $$Es ist ein fester (obligatorischer) Teil des unpersönlichen Ausdrucks — es kann nicht weggelassen werden.$$
    ),
    jsonb_build_object(
      'question', $$In „Ich habe das Fahrrad repariert. Es funktioniert jetzt gut", worauf bezieht sich „es"?$$,
      'hint', $$Es ersetzt ein Nomen.$$,
      'expected', $$Auf „das Fahrrad" — hier ist „es" ein echtes Pronomen.$$
    ),
    jsonb_build_object(
      'question', $$Was passiert mit dem Platzhalter-„es", wenn ein anderes Satzglied den Satz eröffnet?$$,
      'hint', $$Es hat keine eigene Bedeutung.$$,
      'expected', $$Es verschwindet vollständig aus dem Satz.$$
    ),
    jsonb_build_object(
      'question', $$Kann man das Platzhalter-„es" durch ein konkretes Nomen ersetzen?$$,
      'hint', $$Es hat keine eigene Bedeutung.$$,
      'expected', $$Nein, das Platzhalter-„es" hat keine eigene Bedeutung und verweist auf nichts — es besetzt nur eine freie Position im Satz.$$
    )
  ),
  now()
);
