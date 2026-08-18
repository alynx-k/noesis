-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Français, categoryid=121.
-- Moodle course id 863: "EE 2: Com_composé_rédiger_un_CI"
-- (https://lyc.ecole-ci.org/course/view.php?id=863), resource id 4005 —
-- "Séance 4 : Rédiger un centre d'intérêt".
-- Contenu méthodologique (structure du développement, construction d'un
-- paragraphe argumentatif, récapitulatif des règles de rédaction) réécrit
-- à partir du PDF source. Comme pour la leçon précédente, l'extrait
-- littéraire réel utilisé par le PDF (Sembène Ousmane) est remplacé par un
-- texte support ENTIÈREMENT ORIGINAL pour illustrer la méthode, en
-- cohérence avec la politique « 100% contenu original » de l'application.
-- La liste récapitulative des règles de rédaction est fidèle au programme.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-fr-rediger-centre-interet',
  '1ere',
  'A',
  'francais',
  $$Rédiger un centre d'intérêt$$,
  2,
  '1ere-a-fr-commentaire-compose-methode',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir appris à analyser un libellé et organiser les centres d'intérêt d'un texte, les élèves de 1ère A veulent maintenant savoir comment transformer leur plan détaillé (sous-centres, indices, analyse) en un développement rédigé, avec de vraies phrases et des paragraphes argumentés.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Structure générale du développement$$,
        'body', $$Le développement du commentaire composé comporte en général deux grandes parties, correspondant aux deux centres d'intérêt du libellé. Chaque partie est séparée de la précédente par une phrase de transition qui résume le centre d'intérêt qui s'achève et annonce celui qui commence. L'unité de base de la rédaction est le paragraphe : on élabore au moins deux paragraphes par centre d'intérêt (un paragraphe par sous-centre), et chaque paragraphe commence obligatoirement par un alinéa.$$,
        'highlights', array[$$deux parties = deux centres d'intérêt$$, $$phrase de transition$$, $$paragraphe = unité de base$$]::text[],
        'property', jsonb_build_object('label', $$Règle$$, 'text', $$On élabore au moins deux paragraphes par centre d'intérêt, séparés par une phrase de transition entre les grandes parties.$$),
        'fixation', jsonb_build_object('question', $$À quoi sert la phrase de transition entre deux centres d'intérêt ?$$, 'solution', $$Elle résume le centre d'intérêt qui vient d'être traité et annonce celui qui va suivre, pour assurer la cohérence du développement.$$)
      ),
      jsonb_build_object(
        'heading', $$Construire un paragraphe argumentatif$$,
        'body', $$Chaque paragraphe se construit comme un paragraphe argumentatif : on énonce l'idée du paragraphe (le sous-centre traité), on cite les indices textuels s'y rapportant, on analyse ces indices (quel procédé d'écriture ?) puis on les interprète (quel effet de sens ?). Il faut être synthétique, employer des mots simples pour éviter la paraphrase, et utiliser des tournures qui introduisent l'effet littéraire, comme « cela met en évidence », « cela traduit », « cela suggère » ou « en somme ».$$,
        'highlights', array[$$idée → citation → analyse → interprétation$$, $$éviter la paraphrase$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Tournure$$, $$Usage$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Cela met en évidence...$$, $$introduire une analyse$$),
            jsonb_build_array($$Cela traduit / suggère...$$, $$introduire une interprétation$$),
            jsonb_build_array($$Par ailleurs / en outre...$$, $$enchaîner un nouveau sous-centre$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi faut-il éviter la paraphrase dans un paragraphe de commentaire composé ?$$, 'solution', $$Parce que la paraphrase se contente de reformuler le texte sans l'analyser ; un commentaire doit expliquer les effets et le sens produits par les procédés d'écriture.$$)
      ),
      jsonb_build_object(
        'heading', $$Exemple de rédaction d'un sous-centre$$,
        'body', $$Prenons un texte support : « Depuis que Awa a quitté le village pour la capitale, elle écrit chaque mois à sa mère. Sous les néons de la ville, elle se surprend à rêver du grand fromager de la cour familiale, du bruit du pilon à l'aube, des rires de ses sœurs autour du feu. » Pour le sous-centre « les souvenirs sensoriels du village », un paragraphe rédigé pourrait suivre l'ordre : idée, citation, analyse, interprétation.$$,
        'highlights', array[$$paragraphe rédigé$$]::text[],
        'example', jsonb_build_object('statement', $$Rédige le paragraphe correspondant au sous-centre « les souvenirs sensoriels du village », à partir du texte support.$$, 'solution', $$Awa reste profondément attachée aux souvenirs sensoriels de son village natal. En effet, les groupes nominaux « le bruit du pilon à l'aube » et « les rires de ses sœurs autour du feu » convoquent l'ouïe et mettent en évidence une mémoire vivante, faite de sons familiers. Cela traduit un attachement affectif fort à ces instants simples du quotidien villageois, qui contrastent avec l'anonymat suggéré par « les néons de la ville ».$$),
        'fixation', jsonb_build_object('question', $$Dans l'exemple ci-dessus, quelle phrase joue le rôle de l'« idée du paragraphe » ?$$, 'solution', $$« Awa reste profondément attachée aux souvenirs sensoriels de son village natal » — elle énonce le sous-centre avant les citations et l'analyse.$$)
      ),
      jsonb_build_object(
        'heading', $$Récapitulatif : les règles de présentation$$,
        'body', $$Pour rédiger le développement d'un commentaire composé : le commentaire est entièrement rédigé (pas de plan télégraphique) ; on ne met ni titre ni numérotation apparente pour les parties ; chaque paragraphe commence par un alinéa ; on élabore une phrase de transition entre chaque paragraphe et entre chaque centre d'intérêt ; on soigne la présentation en faisant apparaître les parties par des sauts de ligne ; on utilise une langue correcte et soutenue, en évitant les termes vagues et les imprécisions.$$,
        'highlights', array[$$pas de titre ni de numérotation$$, $$alinéa à chaque paragraphe$$, $$langue soutenue$$]::text[],
        'fixation', jsonb_build_object('question', $$Doit-on numéroter ou mettre des titres pour marquer les centres d'intérêt dans la copie finale d'un commentaire composé ?$$, 'solution', $$Non : le commentaire est entièrement rédigé, sans titre ni numérotation ; les paragraphes et les transitions suffisent à marquer la structure.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Voici un texte support : « Le vieux Koffi regardait le fleuve depuis son banc, comme chaque soir. Les enfants du quartier passaient en courant, insouciants, sans un regard pour lui. Il se souvenait d'un temps où ce même banc était toujours entouré de voisins venus écouter ses histoires. » Le centre d'intérêt à rédiger est : « la solitude du vieux Koffi ».$$,
      'questions', array[
        $$Propose une idée de paragraphe (sous-centre) pour ce centre d'intérêt, à partir du texte support.$$,
        $$Rédige le paragraphe correspondant en suivant l'ordre idée → citation → analyse → interprétation, avec au moins une tournure vue dans ce cours.$$,
        $$Rédige une phrase de transition qui pourrait introduire un second centre d'intérêt sur « le contraste entre le présent et le passé ».$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Combien de paragraphes élabore-t-on au minimum par centre d'intérêt dans un commentaire composé ?$$,
      'hint', $$C'est un nombre précisé dans la règle de structure.$$,
      'expected', $$Au moins deux paragraphes par centre d'intérêt.$$
    ),
    jsonb_build_object(
      'question', $$Quel est l'ordre habituel des quatre étapes dans un paragraphe de commentaire composé ?$$,
      'hint', $$Commence par énoncer ce que le paragraphe va montrer.$$,
      'expected', $$Idée du paragraphe, citation des indices textuels, analyse des indices, interprétation.$$
    ),
    jsonb_build_object(
      'question', $$Que doit-on éviter à tout prix dans la rédaction d'un commentaire composé : la paraphrase ou l'analyse ?$$,
      'hint', $$L'une des deux reformule sans expliquer.$$,
      'expected', $$La paraphrase — elle se contente de reformuler le texte sans en analyser les effets.$$
    ),
    jsonb_build_object(
      'question', $$Doit-on mettre un titre pour chaque centre d'intérêt dans la copie rédigée ?$$,
      'hint', $$Repense au récapitulatif des règles de présentation.$$,
      'expected', $$Non, aucun titre ni numérotation : le commentaire est entièrement rédigé sous forme de paragraphes liés par des transitions.$$
    )
  ),
  now()
);
