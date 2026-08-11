-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3346: "2nde_HISTOIRE_T1_L1: L'HISTOIRE ET LA FORMATION DU
-- CITOYEN" (https://lyc.ecole-ci.org/course/view.php?id=3346)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33391, redirecting
-- to pluginfile "2nde H1- Lhistoire et la formationndu citoyen.pdf".
-- Rewritten/paraphrased from the source PDF (Thème 1, Leçon 1): the
-- etymology and definition of history (Herodotus, Isidore of Seville), its
-- object of study, its multiple functions (temporal landmark, development
-- tool, ideological weapon), its role in transforming citizens and society
-- (inherited legacy, identity, social cohesion), and the sources historians
-- rely on (written, oral, archaeological — especially relevant for Africa).
-- 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-hist-histoire-formation-citoyen',
  '2nde',
  'A',
  'histoire',
  $$L'histoire et la formation du citoyen$$,
  1,
  null,
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'un débat sur l'histoire politique de la Côte d'Ivoire, un invité cite l'écrivain français Paul Valéry, qui décrivait l'histoire comme un « produit dangereux », capable d'enivrer les peuples et d'entretenir de vieilles blessures. Troublés par cette citation, des élèves de seconde décident d'approfondir ce qu'est réellement l'histoire et le rôle qu'elle joue dans la formation d'un citoyen.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'histoire, une science de la connaissance du passé$$,
        'body', $$Le mot « histoire » vient du grec historia, qui signifie « enquête » ou « recherche ». Dès 444 avant J.-C., l'historien grec Hérodote menait déjà des recherches sur les grandes actions humaines afin d'éviter qu'elles ne tombent dans l'oubli, aussi bien chez les Grecs que chez les peuples voisins. Plus tard, au début du VIIe siècle, l'historien espagnol Isidore de Séville la définissait comme « le récit des choses qui ont eu lieu, par lequel on peut connaître ce qui a été réalisé autrefois ». On retient aujourd'hui que l'histoire est une discipline scientifique qui s'intéresse à la connaissance du passé des sociétés humaines et cherche à le reconstituer.$$,
        'highlights', array[$$historia$$, $$Hérodote$$, $$Isidore de Séville$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$L'histoire est une discipline scientifique qui s'intéresse à la connaissance du passé des sociétés humaines et cherche à le reconstituer.$$),
        'fixation', jsonb_build_object('question', $$Que signifie le mot grec « historia », à l'origine du mot « histoire » ?$$, 'solution', $$« Enquête » ou « recherche ».$$)
      ),
      jsonb_build_object(
        'heading', $$L'objet d'étude de l'histoire$$,
        'body', $$La science historique étudie les faits et les événements qui ont marqué la vie des êtres humains et des sociétés. Cela englobe aussi bien les guerres et les grands événements politiques que les modes de vie quotidiens, les activités économiques ou les religions du passé. En d'autres termes, tout ce qui a façonné l'expérience humaine à travers le temps constitue une matière possible pour l'historien.$$,
        'highlights', array[$$faits et événements humains$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux catégories de faits humains qui constituent l'objet d'étude de l'histoire.$$, 'solution', $$Par exemple les guerres et les modes de vie (ou les activités économiques, ou les religions).$$)
      ),
      jsonb_build_object(
        'heading', $$Les fonctions multiples de l'histoire$$,
        'body', $$L'histoire remplit plusieurs fonctions. Elle sert d'abord de point de repère temporel pour une société : connaître son passé permet de s'orienter, un peuple sans repère étant, selon l'expression consacrée, « sans avenir ». Elle constitue aussi un outil de développement : selon l'historien Joseph Ki-Zerbo, elle « crée un capital spirituel qui constituera une source multiforme et permanente d'inspiration », comme l'illustrent l'impérialisme européen ou la révolution Meiji au Japon au XIXe siècle. Enfin, elle peut devenir une arme idéologique, capable de conscientiser un peuple sur sa valeur (comme le mouvement de la négritude) mais aussi de nourrir des nationalismes dangereux, comme celui de l'Allemagne nazie, qui a précipité le monde dans la Seconde Guerre mondiale.$$,
        'highlights', array[$$point de repère$$, $$outil de développement$$, $$arme idéologique$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Fonction$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Point de repère$$, $$L'indépendance de la Côte d'Ivoire, le 7 août 1960$$),
            jsonb_build_array($$Outil de développement$$, $$La révolution Meiji au Japon au XIXe siècle$$),
            jsonb_build_array($$Arme idéologique$$, $$Le nationalisme de l'Allemagne nazie$$)
          )
        ),
        'example', jsonb_build_object('statement', $$En quoi l'histoire a-t-elle pu servir d'« arme idéologique » dans le cas du mouvement de la négritude ?$$, 'solution', $$En permettant aux peuples africains de prendre conscience de la valeur de leur propre histoire et de leur identité culturelle, face à la vision dépréciative héritée de la colonisation.$$),
        'fixation', jsonb_build_object('question', $$Selon Ki-Zerbo, que crée l'histoire pour les nations ?$$, 'solution', $$Un « capital spirituel » qui constitue une source multiforme et permanente d'inspiration.$$)
      ),
      jsonb_build_object(
        'heading', $$L'histoire, moteur de transformation du citoyen et de la société$$,
        'body', $$L'étude de l'histoire permet d'apprécier les liens d'héritage d'une génération à l'autre et de transmettre aux générations futures les améliorations apportées au fil du temps, comme le montrent les transformations techniques en Europe entre le XVe et le XXe siècle. Elle révèle aussi l'identité d'un peuple : savoir d'où l'on vient aide à comprendre le présent et à envisager l'avenir. Enfin, elle renforce la cohésion sociale et la solidarité, en donnant à chacun l'occasion de mieux connaître sa propre société ainsi que celles des autres, favorisant ainsi l'ouverture et la construction d'un avenir commun.$$,
        'highlights', array[$$héritage$$, $$identité$$, $$cohésion sociale$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi l'étude de l'histoire aide-t-elle un citoyen à envisager l'avenir ?$$, 'solution', $$En lui permettant de comprendre le présent à la lumière du passé et d'apprécier l'héritage transmis par les générations précédentes.$$)
      ),
      jsonb_build_object(
        'heading', $$Les sources qui permettent de reconstituer le passé$$,
        'body', $$Pour reconstituer le passé, l'historien s'appuie sur plusieurs types de sources : les sources écrites (documents, archives), les sources archéologiques (objets, vestiges) et, en particulier pour les sociétés qui n'ont pas connu tôt l'écriture — c'est le cas de nombreuses sociétés d'Afrique noire — les sources orales, transmises de génération en génération par des spécialistes comme les griots ou les traditionnistes, ou par de simples témoins de faits vécus. Cette diversité de sources permet de croiser les informations pour rendre la reconstitution du passé aussi fiable que possible.$$,
        'highlights', array[$$sources écrites$$, $$sources orales$$, $$griots$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la source orale a-t-elle une importance particulière pour l'histoire de nombreuses sociétés d'Afrique noire ?$$, 'solution', $$Parce que ces sociétés n'ont pas connu l'écriture tôt dans leur histoire, si bien que leur mémoire collective a longtemps été transmise oralement, notamment par les griots et les traditionnistes.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux amis débattent : l'un cite Paul Valéry pour qui l'histoire « enivre les peuples » et leur « engendre de faux souvenirs » ; l'autre estime au contraire que l'étude de l'histoire fortifie le sens de la responsabilité citoyenne des jeunes. Un élève de seconde doit se positionner dans ce débat en s'appuyant sur ce qu'il sait des fonctions de l'histoire.$$,
      'questions', array[
        $$Donne la définition de l'histoire et explique l'origine du mot.$$,
        $$Présente deux fonctions de l'histoire, avec un exemple pour chacune.$$,
        $$Explique en quoi l'histoire contribue à la cohésion sociale d'un peuple.$$,
        $$Cite les principales sources utilisées par l'historien pour reconstituer le passé des sociétés africaines.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel historien grec, vers 444 avant J.-C., est considéré comme l'un des plus anciens historiens ?$$,
      'hint', $$Il a mené des enquêtes sur les grandes actions humaines chez les Grecs et les autres peuples.$$,
      'expected', $$Hérodote.$$
    ),
    jsonb_build_object(
      'question', $$Selon quel historien africain l'histoire « crée un capital spirituel » pour les nations ?$$,
      'hint', $$C'est un historien burkinabè cité dans la leçon.$$,
      'expected', $$Joseph Ki-Zerbo.$$
    ),
    jsonb_build_object(
      'question', $$Quelles personnes étaient traditionnellement chargées de transmettre oralement l'histoire dans de nombreuses sociétés d'Afrique noire ?$$,
      'hint', $$Ce sont des spécialistes de la parole et de la mémoire collective.$$,
      'expected', $$Les griots (et les traditionnistes).$$
    ),
    jsonb_build_object(
      'question', $$Quel auteur français a comparé l'histoire à un « produit dangereux » qui « enivre les peuples » ?$$,
      'hint', $$Sa citation est reprise en introduction de la leçon.$$,
      'expected', $$Paul Valéry.$$
    )
  ),
  now()
);
