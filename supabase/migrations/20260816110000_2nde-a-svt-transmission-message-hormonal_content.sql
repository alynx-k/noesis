-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Sciences de la Vie et de la Terre, categoryid=159.
-- Moodle course id 3704: "SVT 2nd A_L4_La transmission d'un message hormonal"
-- (https://lyc.ecole-ci.org/course/view.php?id=3704)
-- Resource "Je lis le résumé de la leçon", pluginfile "SVT 2nd A_L4_La
-- transmission d'un message hormonal.pdf" (8 pages; internally "Leçon 2" of
-- the theme "La transmission de l'information au niveau de l'organisme").
-- Rewritten/paraphrased from the source PDF: the ovariectomy/castration
-- experiments on rats showing gonads act as endocrine glands (hormones,
-- target cells), the five-step mechanism of hormonal transmission
-- (stimulation, release into blood, transport, binding to a specific
-- membrane receptor, change of target-cell activity), and the additional
-- rat experiments distinguishing the exocrine (sperm) and endocrine
-- (testosterone) functions of the testis. 100% original wording; no
-- sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-svt-transmission-message-hormonal',
  '2nde',
  'A',
  'svt',
  $$La transmission d'un message hormonal$$,
  4,
  '2nde-a-svt-transmission-message-nerveux',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le cadre d'une semaine de sensibilisation à l'éducation sexuelle organisée par le club de santé du Lycée Moderne 1 de Bouaflé, une conférence est donnée sur le fonctionnement des organes reproducteurs. Les intervenants expliquent que les organes sexuels fonctionnent grâce à des substances chimiques produites par l'organisme lui-même. Curieux, les élèves de la classe de 2nde A décident d'identifier les organes responsables de la fabrication de ces substances et de comprendre comment ces substances parviennent jusqu'à leurs organes d'action.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les gonades produisent des substances qui circulent dans le sang$$,
        'body', $$Pour comprendre l'origine des caractères sexuels, on réalise deux expériences chez le rat. Chez une rate pubère non gestante, l'ablation complète des deux ovaires (ovariectomie) entraîne une stérilité durable ainsi qu'une régression progressive des caractères sexuels primaires et secondaires ; une injection d'extrait ovarien restaure ensuite ces caractères, mais sans lever la stérilité. Chez un rat pubère, l'ablation des deux testicules (castration) produit le même type de résultat : stérilité et régression des caractères sexuels, corrigées partiellement par une injection d'extrait testiculaire. Ces observations montrent que les ovaires et les testicules, appelés gonades, ne se contentent pas de fabriquer les cellules reproductrices : ils libèrent aussi, dans le sang, des substances chimiques qui agissent sur d'autres organes. Ces substances sont des hormones, et les organes qui les fabriquent sont des glandes endocrines. Les extraits actifs des ovaires correspondent aux œstrogènes et à la progestérone, tandis que celui des testicules correspond à la testostérone ; les organes qui répondent à ces hormones sont appelés des cellules ou organes cibles.$$,
        'highlights', array[$$hormone$$, $$glande endocrine$$, $$cellule cible$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Une glande endocrine est un organe qui sécrète une hormone directement dans le sang, sans canal excréteur, pour agir à distance sur des cellules cibles.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi l'ovariectomie d'une rate pubère provoque-t-elle une régression des caractères sexuels secondaires ?$$, 'solution', $$Parce que les ovaires, en tant que glandes endocrines, ne produisent plus les hormones (œstrogènes et progestérone) responsables du maintien de ces caractères.$$)
      ),
      jsonb_build_object(
        'heading', $$La transmission hormonale suit un mécanisme précis en plusieurs étapes$$,
        'body', $$Le trajet d'un message hormonal peut se résumer en cinq étapes : une cellule endocrine est stimulée, elle libère son hormone dans le sang, le sang transporte l'hormone jusqu'à l'organe cible, l'hormone se fixe sur un récepteur membranaire spécifique de la cellule cible, ce qui déclenche une modification de l'activité de cette cellule. L'hormone ne pénètre donc pas à l'intérieur de la cellule cible : elle reste à l'extérieur et forme, avec son récepteur, un complexe hormone-récepteur qui commande la réponse cellulaire. L'ampleur de cette réponse dépend à la fois de la concentration de l'hormone dans le sang et du nombre de récepteurs disponibles sur la cellule cible. Une même hormone diffusée dans tout l'organisme peut ainsi agir sur plusieurs organes cibles différents, avec des effets différents selon les récepteurs présents. Par ailleurs, l'action d'une hormone reste limitée dans le temps car elle est rapidement dégradée après avoir agi.$$,
        'highlights', array[$$récepteur membranaire$$, $$complexe hormone-récepteur$$, $$organe cible$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Événement$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$1$$, $$Stimulation de la cellule endocrine$$),
            jsonb_build_array($$2$$, $$Libération de l'hormone dans le sang$$),
            jsonb_build_array($$3$$, $$Transport de l'hormone par voie sanguine$$),
            jsonb_build_array($$4$$, $$Fixation de l'hormone sur son récepteur spécifique$$),
            jsonb_build_array($$5$$, $$Modification de l'activité de la cellule cible$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi une même hormone peut-elle produire des effets différents selon les organes ?$$, 'solution', $$Parce que ses effets dépendent du type et du nombre de récepteurs spécifiques présents sur chaque cellule cible, qui ne sont pas les mêmes d'un organe à l'autre.$$)
      ),
      jsonb_build_object(
        'heading', $$Les testicules assurent une double fonction, exocrine et endocrine$$,
        'body', $$Trois expériences complémentaires réalisées chez le rat permettent de préciser le rôle des testicules. La castration d'un rat impubère empêche, quelques jours plus tard, le développement de sa bourse et l'apparition de l'instinct sexuel, et le rend stérile. La castration d'un rat déjà pubère entraîne au contraire une régression de la prostate déjà développée et une disparition progressive de l'instinct sexuel, en plus de la stérilité. Mais lorsqu'on greffe un fragment de testicule sous la peau d'un rat castré, sans rétablir la connexion par les canaux déférents (spermiductes), la prostate et l'instinct sexuel sont maintenus alors que l'animal reste stérile. Ces résultats montrent que le testicule remplit deux fonctions distinctes : une fonction exocrine, par la production de spermatozoïdes qui doivent emprunter un canal pour être évacués et participer à la reproduction, et une fonction endocrine, par la sécrétion de testostérone qui, elle, passe directement dans le sang et suffit à elle seule à mettre en place et à entretenir les caractères sexuels secondaires, sans passer par les canaux génitaux.$$,
        'highlights', array[$$fonction exocrine$$, $$fonction endocrine$$, $$testostérone$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi la greffe d'un fragment de testicule sous la peau, sans rétablir les canaux déférents, suffit-elle à maintenir la prostate et l'instinct sexuel, mais pas la fertilité ?$$, 'solution', $$Parce que la testostérone, responsable du maintien des caractères sexuels secondaires, diffuse directement dans le sang depuis le greffon, alors que les spermatozoïdes, responsables de la fertilité, ont besoin d'un canal (spermiducte) pour rejoindre les voies génitales, canal qui fait défaut dans cette greffe.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux fonctions assurées par le testicule ?$$, 'solution', $$Une fonction exocrine (production de spermatozoïdes) et une fonction endocrine (production de testostérone).$$)
      ),
      jsonb_build_object(
        'heading', $$Bilan : une communication chimique à distance$$,
        'body', $$L'ensemble de ces expériences confirme que les organes sexuels ne fonctionnent pas de façon isolée : ils sont commandés à distance par des hormones sécrétées par des glandes endocrines (ovaires, testicules) et transportées par le sang jusqu'à des cellules cibles porteuses de récepteurs spécifiques. C'est ce mode de communication chimique qui explique le développement et le maintien des caractères sexuels évoqués lors de la conférence d'éducation sexuelle : sans les hormones ovariennes ou testiculaires, ces caractères ne pourraient ni apparaître ni se maintenir.$$,
        'highlights', array[$$communication chimique$$, $$glandes endocrines$$]::text[],
        'fixation', jsonb_build_object('question', $$Quels sont les deux organes cités dans la leçon qui jouent à la fois un rôle dans la reproduction et un rôle de glande endocrine ?$$, 'solution', $$Les ovaires et les testicules.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans une basse-cour, un jeune coq castré avant sa puberté devient un chapon : docile, il ne chante pas, ses caractères sexuels secondaires (crête, barbillons, oreillons) restent peu développés et il prend rapidement du poids, alors que son plumage et ses ergots continuent d'évoluer comme chez un coq normal. Lorsqu'on lui greffe quelques semaines plus tard des fragments de testicule, tous les caractères sexuels du coq réapparaissent progressivement.$$,
      'questions', array[
        $$Relève les caractères sexuels secondaires du coq qui ne se développent pas chez le chapon.$$,
        $$Que peux-tu conclure de la réapparition des caractères sexuels après la greffe de testicule ?$$,
        $$Explique par quel mécanisme la testostérone produite par le greffon peut agir sur des organes cibles situés loin des testicules.$$,
        $$Le testicule est-il, dans cette situation, une glande exocrine ou une glande endocrine ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment appelle-t-on un organe qui libère une hormone directement dans le sang ?$$,
      'hint', $$C'est le type de glande auquel appartiennent les ovaires et les testicules.$$,
      'expected', $$Une glande endocrine.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux hormones sécrétées par les ovaires ?$$,
      'hint', $$L'une porte un nom proche du mot « œstrus », l'autre prépare la grossesse.$$,
      'expected', $$Les œstrogènes (œstradiol) et la progestérone.$$
    ),
    jsonb_build_object(
      'question', $$Sur quelle structure de la cellule cible l'hormone doit-elle se fixer pour agir ?$$,
      'hint', $$Cette structure est spécifique à chaque hormone et se trouve sur la membrane.$$,
      'expected', $$Un récepteur membranaire spécifique.$$
    ),
    jsonb_build_object(
      'question', $$Quelle hormone testiculaire assure le maintien des caractères sexuels secondaires chez le mâle ?$$,
      'hint', $$C'est l'hormone qui manque chez le chapon.$$,
      'expected', $$La testostérone.$$
    )
  ),
  now()
);
