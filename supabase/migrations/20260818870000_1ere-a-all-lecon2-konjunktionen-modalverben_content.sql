-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Allemand, categoryid=119.
-- Moodle course id 1294: "LECON 2 FICHE 1" (Thema: (K)ein bisschen
-- erwachsen — Jeunesse : mature et immature)
-- (https://lyc.ecole-ci.org/course/view.php?id=1294), resource id 9106.
-- Le PDF source renvoie à des textes de lecture d'un manuel externe ("Ihr
-- und Wir plus 3", non fournis) sur la jeunesse en Allemagne ; contenu
-- composé originalement pour enseigner les mêmes points de grammaire
-- (conjonctions doubles, sens des verbes de modalité), qui sont des
-- règles linguistiques factuelles, non soumises au droit d'auteur.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-all-lecon2-konjunktionen-modalverben',
  '1ere',
  'A',
  'allemand',
  $$(K)ein bisschen erwachsen: doppelte Konjunktionen und Modalverben$$,
  3,
  '1ere-a-all-lecon1-adjektive-lassen',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Während der Großferien war Koya in Deutschland und hat viele Informationen über das Leben junger Leute dort bekommen. Am ersten Schultag erzählt sie ihren Mitschülern davon, indem sie doppelte Konjunktionen und Modalverben in Sätzen benutzt.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Grammatik: doppelte Konjunktionen$$,
        'body', $$Les conjonctions doubles relient deux éléments en exprimant une nuance précise. sowohl... als auch (à la fois... et) exprime une addition sans opposition : « Sie ist sowohl klug als auch fleißig » (elle est à la fois intelligente et travailleuse). nicht nur..., sondern auch (non seulement... mais aussi) renforce l'addition. zwar..., aber (certes... mais) introduit une concession suivie d'une restriction. weder... noch (ni... ni) exprime une double négation.$$,
        'highlights', array[$$sowohl... als auch = à la fois... et$$, $$nicht nur..., sondern auch = non seulement... mais aussi$$, $$zwar..., aber = certes... mais$$, $$weder... noch = ni... ni$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Doppelte Konjunktion', 'Bedeutung', 'Beispiel']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$sowohl... als auch$$, $$à la fois... et$$, $$Er spricht sowohl Deutsch als auch Englisch.$$),
            jsonb_build_array($$zwar..., aber$$, $$certes... mais$$, $$Sie ist zwar jung, aber sehr reif.$$),
            jsonb_build_array($$weder... noch$$, $$ni... ni$$, $$Er hat weder Zeit noch Lust.$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Verbinde die Sätze mit „nicht nur..., sondern auch": „Die Jugendlichen studieren. Die Jugendlichen arbeiten auch nebenbei."$$, 'solution', $$Die Jugendlichen studieren nicht nur, sondern arbeiten auch nebenbei.$$),
        'fixation', jsonb_build_object('question', $$Welche doppelte Konjunktion drückt eine Konzession (une concession) gefolgt von einer Einschränkung aus?$$, 'solution', $$Zwar..., aber.$$)
      ),
      jsonb_build_object(
        'heading', $$Grammatik: die Bedeutung der Modalverben$$,
        'body', $$Chaque verbe de modalité allemand porte un ou plusieurs sens précis selon le contexte. dürfen exprime la permission (au négatif : l'interdiction). können exprime la possibilité, la capacité ou parfois la permission. mögen exprime le goût ou la préférence (au présent), tandis que sa forme möchte (subjonctif) exprime un souhait ou une intention. müssen exprime le devoir, la nécessité ou une contrainte. sollen exprime une obligation imposée par un tiers ou une intention/invitation, tandis que sa forme sollte (subjonctif) exprime une recommandation ou un conseil. wollen exprime le souhait ou l'intention propre du sujet.$$,
        'highlights', array[$$dürfen = permission (nicht dürfen = interdiction)$$, $$können = possibilité/capacité$$, $$müssen = obligation/nécessité$$, $$sollen = volonté imposée par un tiers ; sollte = conseil$$, $$wollen = volonté propre du sujet$$]::text[],
        'table', jsonb_build_object(
          'headers', array['Modalverb', 'Bedeutung']::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$dürfen$$, $$la permission (nicht dürfen : l'interdiction)$$),
            jsonb_build_array($$können$$, $$la possibilité, la capacité, ou la permission$$),
            jsonb_build_array($$mögen / möchte$$, $$le goût, la préférence / le souhait, l'intention$$),
            jsonb_build_array($$müssen$$, $$le devoir, la nécessité, l'obligation$$),
            jsonb_build_array($$sollen / sollte$$, $$l'obligation imposée par autrui / la recommandation, le conseil$$),
            jsonb_build_array($$wollen$$, $$le souhait, l'intention propre du sujet$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Welches Modalverb passt: « Meine Eltern sagen, ich ___ um 22 Uhr zu Hause sein. » (obligation imposée par une autre personne)$$, 'solution', $$soll (« Meine Eltern sagen, ich soll um 22 Uhr zu Hause sein. »)$$),
        'fixation', jsonb_build_object('question', $$Worin unterscheidet sich müssen von sollen?$$, 'solution', $$Müssen drückt eine Notwendigkeit oder eine objektive Verpflichtung aus, während sollen eher die Verpflichtung ausdrückt, die durch den Willen einer anderen Person auferlegt wird.$$)
      ),
      jsonb_build_object(
        'heading', $$Wortschatz: Jugendliche und ihre Realitäten$$,
        'body', $$En allemand, on distingue Kinder (les enfants, mineurs, minderjährig) et Jugendliche (les jeunes/adolescents), souvent volljährig (majeurs) et scolarisés dans le supérieur (die Hochschule). Chez les jeunes, les marques (Marken) et les vêtements (Klamotten) restent importants ; l'industrie publicitaire (die Werbeindustrie) s'intéresse fortement à eux comme consommateurs.$$,
        'highlights', array[$$Kinder (minderjährig) vs Jugendliche (oft volljährig)$$, $$Marken, Klamotten, Werbeindustrie$$]::text[],
        'fixation', jsonb_build_object('question', $$Was unterscheidet Kinder von Jugendlichen?$$, 'solution', $$Kinder sind minderjährig (unter 18 Jahre alt), während Jugendliche oft volljährig sind und die Hochschule besuchen können.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Du diskutierst per E-Mail mit deinem deutschen Freund Hans, der sich über das Leben der ivorischen Jugendlichen informieren möchte.$$,
      'questions', array[
        $$Nenne vier Charakteristiken von Jugendlichen in der Côte d'Ivoire (benutze mindestens eine doppelte Konjunktion).$$,
        $$Beschreibe, mit passenden Modalverben, was Jugendliche in deinem Umfeld dürfen, müssen und wollen.$$,
        $$Schreibe einen kurzen Text (5-6 Sätze) über die ivorische Jugend, in dem du sowohl doppelte Konjunktionen als auch Modalverben benutzt.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Ergänze: „Sie spricht ___ Deutsch ___ auch Französisch." (à la fois... et)$$,
      'hint', $$sowohl... als auch.$$,
      'expected', $$sowohl / als$$
    ),
    jsonb_build_object(
      'question', $$Welches Modalverb drückt eine Interdiction (l'interdiction) aus?$$,
      'hint', $$Es ist die verneinte Form eines Modalverbs.$$,
      'expected', $$nicht dürfen$$
    ),
    jsonb_build_object(
      'question', $$Welche Bedeutung hat „möchte" im Vergleich zu „mag"?$$,
      'hint', $$möchte ist der Konjunktiv von mögen.$$,
      'expected', $$„Möchte" drückt einen Wunsch oder eine Absicht aus, während „mag" (Präsens) einen Geschmack oder eine Vorliebe ausdrückt.$$
    ),
    jsonb_build_object(
      'question', $$Sind Jugendliche in der Regel minderjährig oder volljährig?$$,
      'hint', $$Im Gegensatz zu Kindern.$$,
      'expected', $$Oft volljährig (im Gegensatz zu Kindern, die minderjährig sind).$$
    )
  ),
  now()
);
