-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806540000_fr_lecture_texte_argumentatif_content.sql).
-- ecole-ci.org is reachable now (see 20260812000000_fr-4e-debat_content.sql)
-- — opened Français 4ème > Lecture (texte autonome) > "Leçon 2: S1_Le
-- dialogue argumentatif_Lecture méthodique..." (course id 811):
-- "Activités : 0", same empty-shell pattern as every other séance course
-- in this category. Falling back to original content, from the lesson
-- title/topic and the standard Ivorian 4ème Français programme (compétence
-- lecture — dialogue argumentatif).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le roman étudié en classe, deux personnages s'opposent sur la question de la scolarisation des filles. Pour bien comprendre leur échange, il faut savoir lire un dialogue argumentatif.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Reconnaître un dialogue argumentatif$$,
        'body', $$Un dialogue argumentatif met en scène deux personnages (ou plus) qui défendent des points de vue opposés sur un même sujet, chacun cherchant à convaincre l'autre.$$,
        'highlights', array[$$un point de vue$$, $$un interlocuteur$$, $$une thèse$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un dialogue argumentatif, chaque personnage défend une thèse à travers des répliques qui contiennent des arguments et des exemples, dans le but de faire changer d'avis son interlocuteur.$$),
        'example', jsonb_build_object('statement', $$Dans cet échange, quelle est la thèse d'Awa : « Awa : Je pense que les filles doivent poursuivre leurs études aussi longtemps que les garçons, car l'instruction leur donne les mêmes chances de réussir. » ?$$, 'solution', $$La thèse d'Awa est que les filles doivent avoir accès à une scolarité aussi longue que les garçons, car l'instruction assure l'égalité des chances.$$),
        'fixation', jsonb_build_object('question', $$Que cherche à faire un personnage qui prend la parole dans un dialogue argumentatif ?$$, 'solution', $$Il cherche à convaincre son interlocuteur d'adopter son point de vue en avançant des arguments.$$)
      ),
      jsonb_build_object(
        'heading', $$Repérer les marques de l'opposition$$,
        'body', $$Dans un dialogue argumentatif, les personnages expriment leur désaccord grâce à des connecteurs d'opposition et des verbes d'opinion qui marquent clairement leur point de vue.$$,
        'highlights', array[$$un connecteur d'opposition$$, $$un verbe d'opinion$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Marque$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Connecteur d'opposition$$, $$mais, cependant, pourtant, au contraire$$),
            jsonb_build_array($$Verbe d'opinion$$, $$je pense que, je crois que, à mon avis$$),
            jsonb_build_array($$Verbe de parole marquant le désaccord$$, $$objecter, rétorquer, protester$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les connecteurs d'opposition (mais, pourtant, au contraire) et les verbes de parole comme « objecter » ou « rétorquer » signalent qu'un personnage s'oppose à l'argument précédent.$$),
        'example', jsonb_build_object('statement', $$Repère la marque d'opposition : « — Je crois que le travail suffit, rétorqua Koffi. Pourtant, sans diplôme, il est difficile de trouver un bon emploi. »$$, 'solution', $$Le verbe « rétorqua » et le connecteur « Pourtant » marquent l'opposition de Koffi à l'idée précédente.$$),
        'fixation', jsonb_build_object('question', $$Quel connecteur pourrait introduire une objection à cette réplique : « Il est inutile d'étudier une langue étrangère. » ?$$, 'solution', $$« Mais » ou « Pourtant », par exemple : « Mais parler une langue étrangère ouvre de nombreuses opportunités. »$$)
      ),
      jsonb_build_object(
        'heading', $$Analyser les didascalies$$,
        'body', $$Les didascalies (indications scéniques) précisent le ton, les gestes ou l'attitude d'un personnage et aident à comprendre l'intensité de son argumentation.$$,
        'highlights', array[$$une didascalie$$, $$le ton$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les didascalies, souvent en italique ou entre parenthèses, indiquent comment une réplique doit être dite (le ton, un geste) et renseignent sur l'état d'esprit du personnage pendant l'argumentation.$$),
        'example', jsonb_build_object('statement', $$Que révèle cette didascalie sur l'état d'esprit du personnage : « — Tu as tort ! (en criant, les poings serrés) » ?$$, 'solution', $$Elle révèle une forte colère ou une conviction intense, le personnage étant très agité pendant son argumentation.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi les didascalies sont-elles utiles pour comprendre un dialogue argumentatif ?$$, 'solution', $$Parce qu'elles indiquent le ton et l'attitude des personnages, ce qui aide à mesurer l'intensité de leur désaccord.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans l'œuvre étudiée, un dialogue oppose un père et son fils sur le choix d'un métier. Tu dois analyser cet échange argumentatif.$$,
      'questions', array[
        $$Identifie la thèse défendue par chacun des deux personnages.$$,
        $$Relève un connecteur d'opposition et explique ce qu'il marque.$$,
        $$Analyse une didascalie et ce qu'elle révèle sur l'état d'esprit d'un personnage.$$,
        $$Explique quel personnage te semble le plus convaincant et pourquoi.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans cet extrait, quelle est la thèse de Fatou : « Fatou : À mon avis, il faut protéger la forêt, car sans elle, nos terres deviendront stériles. » ?$$,
      'hint', $$Cherche l'opinion générale qu'elle défend.$$,
      'expected', $$Fatou défend l'idée qu'il faut protéger la forêt, car sa disparition rendrait les terres stériles.$$
    ),
    jsonb_build_object(
      'question', $$Relève la marque d'opposition dans : « — On n'a pas besoin d'aller à l'école pour réussir, dit Yao. Pourtant, sans instruction, bien des portes restent fermées, répondit sa sœur. »$$,
      'hint', $$Cherche le connecteur qui introduit le désaccord.$$,
      'expected', $$Le connecteur d'opposition est « Pourtant », qui introduit l'objection de la sœur à l'idée de Yao.$$
    ),
    jsonb_build_object(
      'question', $$Que révèle cette didascalie : « — Je ne changerai pas d'avis. (en croisant les bras, d'un ton ferme) » ?$$,
      'hint', $$Pense à ce que le geste et le ton indiquent.$$,
      'expected', $$Elle révèle une détermination inébranlable du personnage, fermé au dialogue et sûr de sa position.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi dit-on qu'un dialogue argumentatif oppose des points de vue, contrairement à un simple dialogue narratif ?$$,
      'hint', $$Pense au but recherché par chaque personnage.$$,
      'expected', $$Parce que chaque personnage y défend une thèse et cherche à convaincre l'autre, alors qu'un dialogue narratif se contente de faire avancer l'histoire.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-lecture-dialogue-argumentatif';
