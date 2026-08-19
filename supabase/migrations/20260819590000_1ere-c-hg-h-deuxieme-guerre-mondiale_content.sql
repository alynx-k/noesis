-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie (matière Histoire), categoryid=136.
-- Moodle course id 2446: "1ère H7-La deuxième Guerre Mondiale Causes et
-- Conséquences" (https://lyc.ecole-ci.org/course/view.php?id=2446),
-- resource id 22698. Contenu réécrit à partir du PDF source (causes,
-- alliances, déclenchement et conséquences humaines/économiques/
-- politiques de la Seconde Guerre mondiale). Dates, chiffres et faits
-- historiques réels repris tels quels (données factuelles, non
-- protégées).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-h-deuxieme-guerre-mondiale',
  '1ere',
  'C',
  'histoire-geographie',
  $$La Deuxième Guerre mondiale : causes et conséquences$$,
  15,
  '1ere-c-hg-h-premiere-guerre-mondiale',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Invitée à une exposition photographique au Musée des civilisations d'Abidjan sur la Deuxième Guerre mondiale, une classe de 1ère découvre avec stupéfaction les destructions, les horreurs des camps de concentration nazis, les mutilés et les atrocités de tout genre. Choqués par ces images, les élèves entreprennent des recherches pour connaître les causes de cette guerre et apprécier ses conséquences.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le rejet du traité de Versailles et la montée des régimes totalitaires$$,
        'body', $$L'Allemagne rejette le traité de Versailles, qu'elle considère comme un « diktat ». Hitler, animé par une volonté expansionniste, boycotte la conférence de désarmement de 1933, rétablit le service militaire obligatoire et reconstitue une aviation militaire (plus de 4000 avions en 1936, 6600 en 1938). La crise économique de 1929 (krach de Wall Street) plonge l'Allemagne dans le chômage (6 millions de chômeurs), favorisant l'ascension du parti nazi : Hitler devient chancelier le 30 janvier 1933. Une fois au pouvoir, il cherche un « espace vital » pour la « race aryenne » qu'il juge supérieure : annexion de l'Autriche (Anschluss, 12 mars 1938), puis des Sudètes tchécoslovaques (octobre 1938).$$,
        'highlights', array[$$rejet du traité de Versailles → réarmement allemand$$, $$crise de 1929 → chômage massif → Hitler chancelier (30/01/1933)$$, $$Anschluss (12/03/1938) + annexion des Sudètes (10/1938)$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce que l'« Anschluss », et quand a-t-il eu lieu ?$$, 'solution', $$L'annexion de l'Autriche par l'Allemagne, le 12 mars 1938.$$)
      ),
      jsonb_build_object(
        'heading', $$Alliances, passivité des démocraties et déclenchement de la guerre$$,
        'body', $$L'Allemagne, l'Italie fasciste de Mussolini et le Japon de l'empereur Hirohito forment les puissances de l'Axe (axe Rome-Berlin proclamé en novembre 1936, Pacte d'acier germano-italien du 22 mai 1939). Face à ces agressions, les démocraties (France, Angleterre) restent passives, les États-Unis se tiennent à l'écart, et la méfiance envers l'URSS communiste empêche tout front uni. En août 1939, Hitler signe un pacte de non-agression avec l'URSS prévoyant le partage de la Pologne. Le 1er septembre 1939, l'Allemagne envahit la Pologne ; la France et le Royaume-Uni (les futurs Alliés, avec l'URSS et les États-Unis) déclarent la guerre à l'Allemagne le 3 septembre 1939.$$,
        'highlights', array[$$Axe : Allemagne (Hitler) + Italie (Mussolini) + Japon (Hirohito)$$, $$Alliés : Royaume-Uni (Churchill) + France libre (de Gaulle) + URSS (Staline) + USA (Roosevelt)$$, $$1er septembre 1939 : invasion de la Pologne → déclaration de guerre le 3 septembre$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la passivité des démocraties est-elle considérée comme un facteur ayant favorisé le déclenchement de la guerre ?$$, 'solution', $$Parce que l'absence de front uni contre les agressions fascistes (Anschluss, annexion des Sudètes) a permis à l'Allemagne de poursuivre sa politique expansionniste sans rencontrer de résistance ferme, jusqu'à l'invasion de la Pologne.$$),
        'fixation', jsonb_build_object('question', $$Quel prétexte Hitler a-t-il invoqué pour envahir la Pologne le 1er septembre 1939 ?$$, 'solution', $$Le mauvais traitement supposé de la minorité allemande de Dantzig et l'exigence du retour de ce territoire à l'Allemagne, ainsi qu'un libre passage à travers le corridor polonais.$$)
      ),
      jsonb_build_object(
        'heading', $$Un traumatisme humain et matériel considérable$$,
        'body', $$La guerre fait entre 50 et 60 millions de morts (six fois plus que la Première Guerre mondiale), dont la moitié de civils. Six millions de Juifs sont exterminés dans les camps, avec les Tziganes et les Slaves considérés par les nazis comme des « sous-hommes ». Les bombardements atomiques d'Hiroshima (6 août 1945, 60 000 morts) et Nagasaki (9 août 1945, 40 000 morts) anéantissent ces deux villes japonaises. Matériellement, l'Europe est ruinée : en URSS, 1700 villes détruites ; en Allemagne, 70% des immeubles rasés dans la Ruhr ; en France, 300 000 maisons détruites et 37 000 km de voies ferrées endommagées. La dette publique explose et la guerre coûte plus de mille milliards de dollars à l'Europe, qui décline au profit des USA et de l'URSS.$$,
        'highlights', array[$$50-60 millions de morts (6x plus que la 1ère Guerre mondiale) ; 6 millions de Juifs exterminés$$, $$Hiroshima (06/08/1945) et Nagasaki (09/08/1945) : bombes atomiques$$, $$Europe ruinée → déclin au profit des USA et de l'URSS$$]::text[],
        'fixation', jsonb_build_object('question', $$Combien de personnes ont été exterminées dans les camps du fait de la politique raciale nazie, selon la leçon ?$$, 'solution', $$Environ 6 millions de Juifs, ainsi que des Tziganes et des Slaves.$$)
      ),
      jsonb_build_object(
        'heading', $$Un nouvel ordre politique mondial$$,
        'body', $$Après la guerre, la carte de l'Europe est redessinée et Berlin divisée en quatre zones d'occupation (USA, France, URSS, Grande-Bretagne). Les nazis sont jugés pour crimes de guerre et crimes contre l'humanité au procès de Nuremberg (novembre 1945 - octobre 1946). Les vainqueurs créent l'ONU le 25 juin 1945 à San Francisco, pour maintenir la paix. Deux superpuissances émergent, dotées de systèmes politiques opposés : les États-Unis (démocratie) et l'URSS (communisme).$$,
        'highlights', array[$$procès de Nuremberg (11/1945-10/1946) : crimes de guerre et contre l'humanité$$, $$ONU créée le 25 juin 1945 (San Francisco)$$, $$2 superpuissances : USA (démocratie) et URSS (communisme)$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel événement juridique majeur a jugé les responsables nazis après la guerre, et où s'est-il tenu ?$$, 'solution', $$Le procès de Nuremberg, en Allemagne, de novembre 1945 à octobre 1946.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Après un cours sur la Deuxième Guerre mondiale, des élèves discutent des destructions, des horreurs des camps de concentration nazis et des atrocités survenues pendant six années. Pour certains, cela est arrivé parce qu'Adolf Hitler voulait se venger du « diktat » du traité de Versailles. Pour d'autres, il faut accuser la passivité des démocraties libérales.$$,
      'questions', array[
        $$Dégage l'idée générale de ce texte.$$,
        $$Explique le passage : « les destructions, les horreurs des camps de concentration nazis, les mutilés et les atrocités de tout genre pendant six années ».$$,
        $$Comment justifies-tu les deux positions exprimées dans la discussion (vengeance du diktat de Versailles vs passivité des démocraties) ?$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelle est la première cause de la Deuxième Guerre mondiale évoquée dans la leçon ?$$,
      'hint', $$Elle concerne le traité qui a suivi la Première Guerre mondiale.$$,
      'expected', $$Le rejet par l'Allemagne du traité de Versailles, considéré comme un « diktat ».$$
    ),
    jsonb_build_object(
      'question', $$Quels trois pays formaient les puissances de l'Axe ?$$,
      'hint', $$Ils sont associés à Berlin, Rome et Tokyo.$$,
      'expected', $$L'Allemagne, l'Italie et le Japon.$$
    ),
    jsonb_build_object(
      'question', $$Quel événement a directement déclenché l'entrée en guerre de la France et du Royaume-Uni, le 3 septembre 1939 ?$$,
      'hint', $$C'est une invasion territoriale.$$,
      'expected', $$L'invasion de la Pologne par l'Allemagne, le 1er septembre 1939.$$
    ),
    jsonb_build_object(
      'question', $$Quelle organisation internationale a été créée en 1945 pour maintenir la paix, et où ?$$,
      'hint', $$Elle succède à la SDN, jugée trop faible.$$,
      'expected', $$L'ONU (Organisation des Nations Unies), créée le 25 juin 1945 à San Francisco.$$
    )
  ),
  now()
);
