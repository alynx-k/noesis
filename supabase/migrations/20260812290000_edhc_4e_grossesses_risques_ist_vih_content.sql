-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 10 : "LES COMPORTEMENTS RESPONSABLES ET LA LUTTE CONTRE LES
-- GROSSESSES A RISQUES, LES IST ET LE VIH/SIDA" (course/view.php?id=1428,
-- mod/resource id=9560, pluginfile 45131). Rewritten entirely in
-- original wording from the real lesson content (causes and
-- consequences of risky pregnancies/STIs/HIV, responsible behaviours);
-- treated factually and respectfully, in age-appropriate terms, without
-- inventing statistics, and without copying any sentence verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de quatrième se vantent auprès de leurs camarades d'avoir plusieurs partenaires avec qui ils ont des rapports sexuels. Surpris par cette attitude, d'autres élèves de la classe décident de s'informer, auprès du personnel de santé, sur les grossesses à risques, les IST et le VIH-SIDA.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les causes des grossesses à risques, des IST et du VIH-SIDA$$,
        'body', $$Plusieurs comportements exposent les adolescents à ces risques : les rapports sexuels précoces, les rapports non protégés, les mauvaises fréquentations, une mauvaise connaissance de la réalité du VIH-SIDA, et le fait d'ignorer son propre statut sérologique ou celui de son ou sa partenaire.$$,
        'highlights', array[$$rapports non protégés$$, $$statut sérologique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les grossesses à risques, les IST et le VIH-SIDA trouvent leur origine principalement dans des comportements sexuels précoces ou non protégés et dans le manque d'information sur ces sujets.$$),
        'example', jsonb_build_object('statement', $$Un adolescent a un rapport sexuel sans savoir si sa ou son partenaire est porteur d'une infection. En quoi cela l'expose-t-il à un risque ?$$, 'solution', $$Il s'expose à un risque car la méconnaissance du statut sérologique de son ou sa partenaire est l'une des causes reconnues de transmission des IST et du VIH.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences pour la santé et la scolarité$$,
        'body', $$Une grossesse à risque peut entraîner l'interruption de la croissance de la jeune fille, des complications graves comme la fistule, une césarienne, voire le décès. Les IST et le VIH-SIDA peuvent quant à eux dégrader la santé, entraîner l'abandon des études, provoquer le rejet par la famille et alourdir les charges du foyer.$$,
        'highlights', array[$$conséquences sur la santé$$, $$abandon des études$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Situation$$, $$Conséquence possible$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Grossesse à risque$$, $$Complications de santé, interruption de la scolarité$$),
            jsonb_build_array($$IST ou VIH$$, $$Dégradation de la santé, abandon des études$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi une grossesse précoce peut-elle compromettre la scolarité d'une jeune fille ?$$, 'solution', $$Parce qu'elle peut entraîner une interruption des études, en plus des risques pour sa santé liés à un corps pas encore complètement développé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements responsables à adopter$$,
        'body', $$Pour éviter une grossesse non désirée, il existe des moyens contraceptifs adaptés. Pour se protéger des IST et du VIH-SIDA, les comportements responsables reconnus sont l'abstinence sexuelle, la fidélité réciproque entre partenaires, et le port du préservatif.$$,
        'highlights', array[$$abstinence$$, $$fidélité$$, $$préservatif$$]::text[],
        'example', jsonb_build_object('statement', $$Un couple d'adolescents décide d'attendre avant d'avoir des rapports sexuels. Quel comportement responsable cela illustre-t-il ?$$, 'solution', $$Cela illustre l'abstinence sexuelle, qui est l'un des comportements responsables permettant d'éviter les grossesses à risques, les IST et le VIH.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance d'adopter ces comportements$$,
        'body', $$Adopter des comportements responsables permet non seulement d'éviter les grossesses à risques, les IST et le VIH-SIDA, mais aussi de favoriser la réussite scolaire, de préserver sa santé, de réduire les charges de la famille et d'éviter des conflits avec les parents.$$,
        'highlights', array[$$comportement responsable$$]::text[],
        'fixation', jsonb_build_object('question', $$En quoi l'adoption de comportements responsables profite-t-elle aussi à la scolarité d'un adolescent ?$$, 'solution', $$Parce qu'en évitant les grossesses à risques et les maladies liées aux rapports non protégés, l'adolescent évite aussi les interruptions de scolarité qui en découlent souvent.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un(e) adolescent(e) refuse d'avoir un rapport sexuel avec son (sa) petit(e) ami(e), qui menace de rompre la relation en doutant de ses sentiments à cause de ce refus.$$,
      'questions', array[
        $$Identifie le problème posé par cette situation.$$,
        $$Cite deux causes des grossesses à risques, des IST et du VIH-SIDA.$$,
        $$Explique pourquoi il est justifié de maintenir cette position face à la menace de rupture.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux causes des grossesses à risques, des IST ou du VIH-SIDA.$$,
      'hint', $$Pense aux rapports précoces ou non protégés.$$,
      'expected', $$Les rapports sexuels précoces, les rapports non protégés, les mauvaises fréquentations ou la méconnaissance du statut sérologique (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite une conséquence possible d'une grossesse à risque.$$,
      'hint', $$Pense aux complications de santé.$$,
      'expected', $$L'interruption de la croissance de la jeune fille, une fistule, une césarienne, ou dans les cas les plus graves, la mort.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux comportements responsables permettant d'éviter les IST et le VIH-SIDA.$$,
      'hint', $$Pense à l'abstinence, à la fidélité et au préservatif.$$,
      'expected', $$L'abstinence sexuelle, la fidélité réciproque entre partenaires, et le port du préservatif (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance d'adopter des comportements responsables à ce sujet ?$$,
      'hint', $$Pense à la santé et à la réussite scolaire.$$,
      'expected', $$Cela permet de préserver sa santé, de favoriser la réussite scolaire, et d'éviter des conflits avec les parents ou des charges supplémentaires pour la famille.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-grossesses-risques-ist-vih';
