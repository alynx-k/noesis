-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Histoire-Géographie (volet Histoire), categoryid=124.
-- Moodle course id 884: "1ère_HISTOIRE_T3_L2: LA DEUXIEME GUERRE MONDIALE:
-- Causes et Conséquences" (https://lyc.ecole-ci.org/course/view.php?id=884),
-- resource id 4257. Contenu réécrit à partir du PDF source (rejet du traité
-- de Versailles, crise de 1929, montée des totalitarismes, invasion de la
-- Pologne, conséquences humaines/économiques/politiques). Faits, dates et
-- chiffres réels (dates de l'Anschluss, chiffres de pertes, clauses ONU)
-- repris tels quels ; explications reformulées, non copiées verbatim.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-hg-h-deuxieme-guerre-mondiale',
  '1ere',
  'A',
  'histoire-geographie',
  $$La Deuxième Guerre mondiale : causes et conséquences$$,
  15,
  '1ere-a-hg-h-premiere-guerre-mondiale',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une exposition photographique sur la Deuxième Guerre mondiale, des élèves de 1ère A découvrent avec stupéfaction les destructions, les horreurs des camps de concentration nazis et les atrocités de tout genre. Choqués par ces images, ils décident de mener des recherches pour connaître les causes de cette guerre et apprécier ses conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le rejet du traité de Versailles et la montée de l'Allemagne nazie$$,
        'body', $$L'Allemagne considère le traité de Versailles comme un « diktat » qu'elle refuse d'accepter. Hitler boycotte la conférence de désarmement de 1933, rétablit le service militaire obligatoire, reconstitue une aviation militaire (plus de 4000 avions en 1936, 6600 en 1938), renforce ses effectifs et crée une marine de guerre. Le 7 mars 1936, il remilitarise la Rhénanie et quitte la SDN.$$,
        'highlights', array[$$traité de Versailles perçu comme un « diktat »$$, $$réarmement massif (aviation, marine, service militaire)$$, $$remilitarisation de la Rhénanie : 7 mars 1936$$]::text[],
        'fixation', jsonb_build_object('question', $$Que fait Hitler le 7 mars 1936 ?$$, 'solution', $$Il procède à la remilitarisation de la Rhénanie et quitte la SDN.$$)
      ),
      jsonb_build_object(
        'heading', $$La crise de 1929 et la montée des régimes totalitaires$$,
        'body', $$Le krach boursier du 24 octobre 1929 à New York plonge l'Europe dans la crise : le retrait des capitaux américains laisse l'Allemagne avec 6 millions de chômeurs, favorisant l'ascension du parti nazi. Hitler devient chancelier le 30 janvier 1933. Une fois au pouvoir, il cherche un « espace vital » pour la « race aryenne » qu'il juge supérieure : il annexe l'Autriche le 12 mars 1938 (l'Anschluss), puis exige et envahit les Sudètes en octobre 1938. L'Allemagne, l'Italie fasciste de Mussolini et le Japon de l'empereur Hirohito, tous des régimes autoritaires, forment les « puissances de l'Axe ».$$,
        'highlights', array[$$krach de 1929 → chômage massif en Allemagne$$, $$Hitler chancelier : 30 janvier 1933$$, $$Anschluss (Autriche) : 12 mars 1938$$]::text[],
        'property', jsonb_build_object('label', $$Vocabulaire$$, 'text', $$Anschluss : annexion/réunification de l'Autriche par l'Allemagne (mars 1938). Sudètes : population d'origine allemande vivant en Tchécoslovaquie, dont Hitler exige le rattachement.$$),
        'fixation', jsonb_build_object('question', $$Quel événement économique de 1929 a favorisé la montée du nazisme en Allemagne ?$$, 'solution', $$Le krach boursier de Wall Street (24 octobre 1929), qui a entraîné le retrait des capitaux américains et un chômage massif en Allemagne (6 millions de chômeurs).$$)
      ),
      jsonb_build_object(
        'heading', $$La passivité des démocraties et la formation des alliances$$,
        'body', $$Face aux agressions fascistes, les démocraties européennes restent passives, préoccupées par leurs problèmes internes, tandis que les États-Unis se replient sur eux-mêmes sans adhérer à la SDN. Deux blocs se forment : les puissances de l'Axe (Allemagne, Italie, Japon), scellées par le pacte anti-Komintern (1936-1937) puis le pacte d'acier (22 mai 1939) ; et les Alliés (Royaume-Uni de Churchill, France libre de de Gaulle, URSS de Staline, États-Unis de Roosevelt).$$,
        'highlights', array[$$passivité des démocraties + isolationnisme américain$$, $$Axe : Allemagne, Italie, Japon (pacte d'acier, 22/05/1939)$$, $$Alliés : Royaume-Uni, France libre, URSS, USA$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les trois pays formant les « puissances de l'Axe » ?$$, 'solution', $$L'Allemagne, l'Italie et le Japon.$$)
      ),
      jsonb_build_object(
        'heading', $$La crise polonaise et le déclenchement de la guerre$$,
        'body', $$Hitler exige le retour de Dantzig (territoire perdu après la Première Guerre mondiale) et un libre passage à travers le corridor polonais. En août 1939, il signe un pacte de non-agression avec l'URSS prévoyant le partage de la Pologne. Le 1er septembre 1939, l'Allemagne annexe Dantzig et envahit la Pologne. La France et le Royaume-Uni déclarent la guerre à l'Allemagne le 3 septembre 1939, déclenchant le conflit mondial.$$,
        'highlights', array[$$pacte germano-soviétique : août 1939$$, $$invasion de la Pologne : 1er septembre 1939$$, $$déclaration de guerre franco-britannique : 3 septembre 1939$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel événement précis déclenche la Deuxième Guerre mondiale, et à quelle date ?$$, 'solution', $$L'invasion de la Pologne par l'Allemagne, le 1er septembre 1939.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences humaines, économiques et politiques$$,
        'body', $$La guerre fait entre 50 et 60 millions de morts (six fois plus que la Première Guerre mondiale), dont 6 millions de Juifs exterminés dans les camps, ainsi que des Tziganes et des Slaves. Les bombardements atomiques d'Hiroshima (60 000 morts, 6 août 1945) et Nagasaki (40 000 morts, 9 août 1945) anéantissent ces deux villes. L'Europe, ruinée (plus de mille milliards de dollars engloutis), décline au profit des États-Unis et de l'URSS, qui deviennent les deux superpuissances. Le procès de Nuremberg juge les criminels nazis de novembre 1945 à octobre 1946, et l'ONU est créée le 25 juin 1945 à San Francisco pour maintenir la paix.$$,
        'highlights', array[$$50-60 millions de morts, dont 6 millions de Juifs (Shoah)$$, $$Hiroshima (06/08) et Nagasaki (09/08/1945)$$, $$ONU créée le 25 juin 1945$$]::text[],
        'fixation', jsonb_build_object('question', $$Quelle organisation internationale a été créée le 25 juin 1945 pour maintenir la paix, et où ?$$, 'solution', $$L'Organisation des Nations Unies (ONU), créée à San Francisco.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Après un cours sur la Deuxième Guerre mondiale, des élèves discutent des destructions et des atrocités survenues pendant six années. Pour certains, cela s'explique par la volonté d'Hitler de se venger du « diktat » du traité de Versailles. Pour d'autres, il faut accuser la passivité des démocraties libérales.$$,
      'questions', array[
        $$Dégage l'idée générale du texte.$$,
        $$Explique le passage : « les destructions, les horreurs des camps de concentration nazis, les mutilés et les atrocités de tout genre pendant six années ».$$,
        $$Comment justifies-tu les deux tendances exprimées pendant la discussion ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$À quelle date Hitler devient-il chancelier d'Allemagne ?$$,
      'hint', $$C'est le 30 d'un mois d'hiver 1933.$$,
      'expected', $$Le 30 janvier 1933.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on l'annexion de l'Autriche par l'Allemagne en mars 1938 ?$$,
      'hint', $$C'est un mot allemand signifiant « réunification ».$$,
      'expected', $$L'Anschluss.$$
    ),
    jsonb_build_object(
      'question', $$Quel pays a été envahi par l'Allemagne le 1er septembre 1939, déclenchant la guerre ?$$,
      'hint', $$Hitler y réclamait le corridor de Dantzig.$$,
      'expected', $$La Pologne.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux superpuissances qui dominent le monde à l'issue de la guerre ?$$,
      'hint', $$Elles incarnent deux régimes politiques opposés.$$,
      'expected', $$Les États-Unis et l'URSS.$$
    )
  ),
  now()
);
