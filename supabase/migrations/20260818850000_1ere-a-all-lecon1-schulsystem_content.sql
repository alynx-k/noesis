-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Allemand, categoryid=119.
-- Moodle course id 1592: "LECON 1 FICHE 1" (Thema: Fürs Leben lernen —
-- École et formation) (https://lyc.ecole-ci.org/course/view.php?id=1592),
-- resource id 12602. Le PDF source ne contient que des exercices et des
-- explications grammaticales renvoyant à des textes de lecture d'un
-- manuel externe ("Ihr und Wir plus 3", non fournis dans le PDF) : ces
-- textes n'ont donc pas pu être repris. Contenu composé originalement
-- pour enseigner le même vocabulaire (système scolaire allemand) et les
-- mêmes points de grammaire couverts par la fiche (Konjunktiv II
-- Vergangenheit, Relativsätze, suffixe -schaft), qui sont des règles
-- linguistiques factuelles, non soumises au droit d'auteur.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-all-lecon1-schulsystem',
  '1ere',
  'A',
  'allemand',
  $$Fürs Leben lernen: das deutsche Schulsystem$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Nach dem Unterricht über das ivorische Schulsystem wollen die Schüler von 1ère A auch das deutsche Schulsystem verstehen. Ihr deutscher Brieffreund Karl erklärt es ihnen mit Sätzen im Konjunktiv II und mit Relativsätzen.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Das deutsche Schulsystem (vocabulaire)$$,
        'body', $$Après l'école primaire (die Grundschule), les élèves allemands sont orientés vers différents types d'établissements : das Gymnasium (le lycée général, qui mène à l'Abitur, le baccalauréat), die Realschule (qui mène au Realschulabschluss), et die Hauptschule (qui mène au Hauptschulabschluss). Après ces diplômes, les élèves peuvent poursuivre vers die Universität, die Fachhochschule (école supérieure technique) ou une Berufsausbildung (formation professionnelle) via die Berufsschule.$$,
        'highlights', array[$$Grundschule (primaire) → Gymnasium / Realschule / Hauptschule$$, $$Abitur = baccalauréat (obtenu au Gymnasium)$$, $$après le diplôme : Universität, Fachhochschule ou Berufsausbildung$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Schultyp', 'Schulabschluss', 'Möglichkeit danach']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Gymnasium$$, $$das Abitur$$, $$die Universität$$),
            jsonb_build_array($$Realschule$$, $$der Realschulabschluss$$, $$die Fachhochschule$$),
            jsonb_build_array($$Hauptschule$$, $$der Hauptschulabschluss$$, $$die Berufsausbildung$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Welchen Schulabschluss bekommt man am Gymnasium?$$, 'solution', $$Das Abitur.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: Konjunktiv II (Vergangenheit)$$,
        'body', $$Le Konjunktiv II passé sert à exprimer un regret ou une hypothèse irréelle concernant le passé (« j'aurais pu... », « j'aurais dû... »). Il se forme avec hätte ou wäre (au prétérit du subjonctif) + le participe passé du verbe : « Ich hätte mehr gelernt » (j'aurais plus étudié) ; « Ich wäre früher gekommen » (je serais venu plus tôt). Avec un verbe de modalité (können, müssen, sollen...), la construction est : hätte + infinitif du verbe + infinitif du verbe de modalité, en fin de phrase : « Ich hätte mehr lernen können » (j'aurais pu étudier plus).$$,
        'highlights', array[$$hätte/wäre + Partizip II : « ich hätte gelernt », « ich wäre gegangen »$$, $$avec verbe de modalité : hätte + Infinitiv + Modalverb$$]::text[],
        'property', jsonb_build_object('label', $$Choix de l'auxiliaire$$, 'text', $$On utilise wäre pour les verbes de mouvement/changement d'état (gehen, kommen, bleiben...) et hätte pour la plupart des autres verbes — la même règle que pour le passé composé (sein vs haben).$$),
        'example', jsonb_build_object('statement', $$Traduis en allemand, au Konjunktiv II passé : « J'aurais pu rester à la maison » (verbe können, verbe principal bleiben).$$, 'solution', $$Ich hätte zu Hause bleiben können.$$),
        'fixation', jsonb_build_object('question', $$Wie bildet man den Konjunktiv II der Vergangenheit mit einem Modalverb?$$, 'solution', $$Hätte + Infinitiv des Hauptverbs + Infinitiv des Modalverbs, am Satzende.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: Relativsätze (les subordonnées relatives)$$,
        'body', $$Une proposition relative allemande commence par un pronom relatif (der, die, das...) qui s'accorde en genre et en nombre avec le nom qu'il remplace (Bezugswort), mais dont le cas dépend de sa fonction dans la subordonnée. Le verbe se place toujours en fin de proposition relative. Exemple : « Die Lehrerin, die gut unterrichtet, ist beliebt » (le pronom die est féminin singulier comme « die Lehrerin », et au nominatif car sujet du verbe unterrichtet).$$,
        'highlights', array[$$le genre/nombre du pronom relatif suit le nom (Bezugswort)$$, $$le cas du pronom relatif suit sa fonction dans la subordonnée$$, $$le verbe conjugué se place en fin de proposition relative$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Kasus', 'maskulin', 'feminin', 'neutrum', 'Plural']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Nominativ$$, $$der$$, $$die$$, $$das$$, $$die$$),
            jsonb_build_array($$Akkusativ$$, $$den$$, $$die$$, $$das$$, $$die$$),
            jsonb_build_array($$Dativ$$, $$dem$$, $$der$$, $$dem$$, $$denen$$),
            jsonb_build_array($$Genitiv$$, $$dessen$$, $$deren$$, $$dessen$$, $$deren$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Ergänze das Relativpronomen: « Das ist der Lehrer, ___ ich sehr mag. » (der Lehrer = objet direct de mag, donc accusatif)$$, 'solution', $$den (« Das ist der Lehrer, den ich sehr mag. »)$$),
        'fixation', jsonb_build_object('question', $$Wo steht das konjugierte Verb in einem Relativsatz?$$, 'solution', $$Am Ende des Relativsatzes.$$)
      ),
      jsonb_build_object(
        'heading', $$Wortbildung: Nomen auf -schaft$$,
        'body', $$Le suffixe -schaft transforme un nom, un adjectif ou un verbe en un substantif toujours féminin. Exemples : der Partner + -schaft → die Partnerschaft (le partenariat) ; schwanger (enceinte) + -schaft → die Schwangerschaft (la grossesse) ; wandern (randonner) + -schaft → die Wanderschaft (le compagnonnage/l'errance).$$,
        'highlights', array[$$Nomen/Adjektiv/Verb + -schaft = immer feminin (die)$$, $$Beispiele : die Partnerschaft, die Freundschaft, die Mannschaft$$]::text[],
        'fixation', jsonb_build_object('question', $$Welches Genus haben Nomen auf -schaft immer?$$, 'solution', $$Feminin (die).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du bist Mitglied des Deutschclubs deiner Schule. Der Schulleiter lädt dich ein, eine Konferenz über das Thema „ivorisches und deutsches Schulsystem" zu halten.$$,
      'questions', array[
        $$Nenne einen ivorischen und einen deutschen Schultyp.$$,
        $$Zitiere einen ivorischen und einen deutschen Schulabschluss.$$,
        $$Gib zwei Unterschiede und zwei Gemeinsamkeiten der beiden Schulsysteme (verwende dabei mindestens einen Relativsatz).$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Welchen Abschluss bekommt man am Ende des Gymnasiums?$$,
      'hint', $$Es ist das deutsche Äquivalent zum ivorischen Baccalauréat.$$,
      'expected', $$Das Abitur.$$
    ),
    jsonb_build_object(
      'question', $$Bilde den Konjunktiv II der Vergangenheit: „Ich gehe zur Schule." (Präsens → Konjunktiv II Vergangenheit)$$,
      'hint', $$gehen ist ein Bewegungsverb → wäre.$$,
      'expected', $$Ich wäre zur Schule gegangen.$$
    ),
    jsonb_build_object(
      'question', $$Welches Relativpronomen passt: „Der Schüler, ___ Heft ich gefunden habe, heißt Karl." (Genitiv, maskulin)$$,
      'hint', $$Genitiv maskulin/neutrum.$$,
      'expected', $$dessen$$
    ),
    jsonb_build_object(
      'question', $$Nenne ein Beispiel für ein Nomen auf -schaft, das von einem Adjektiv abgeleitet ist.$$,
      'hint', $$z.B. von „schwanger".$$,
      'expected', $$Die Schwangerschaft (von schwanger + -schaft).$$
    )
  ),
  now()
);
