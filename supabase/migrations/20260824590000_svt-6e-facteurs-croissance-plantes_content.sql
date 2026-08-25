-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- SVT (categoryid=52).
-- Cours : "Leçon 5 : Les facteurs de croissance chez les plantes à
-- fleurs" (id 2058). Contenu réécrit à partir du PDF source ; situation
-- d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves de 6ème réalisent un jardin scolaire. Ils repiquent des plants de tomate identiques sur deux parcelles A et B ; seule la parcelle A reçoit de l'engrais. Au bout de quelques semaines, les plants de la parcelle A ont une meilleure croissance. Les élèves cherchent à identifier les facteurs qui influencent la croissance des plantes à fleurs.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Influence de l'eau$$,
        'body', $$Trois pots de maïs identiques sont testés : sol régulièrement arrosé (A), sol inondé (B), sol sec (C). Une semaine après, seul le plant A se développe normalement ; les plants B et C se fanent et meurent. Le plant A se développe grâce à un apport convenable d'eau ; le plant B meurt par excès d'eau (asphyxie des racines) ; le plant C meurt par manque d'eau.$$,
        'highlights', array[$$eau convenable = bonne croissance ; excès d'eau = asphyxie des racines ; manque d'eau = dessèchement$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi un sol inondé fait-il mourir la plante ?$$, 'solution', $$L'excès d'eau asphyxie les racines de la plante.$$)
      ),
      jsonb_build_object(
        'heading', $$Influence des sels minéraux$$,
        'body', $$Deux pots de maïs dans du sable lavé sont arrosés, l'un avec de l'eau distillée (A), l'autre avec de l'eau enrichie en sels minéraux NPK — azote, phosphore, potassium (B). Le plant A se développe peu (manque de sels minéraux) ; le plant B se développe normalement grâce aux sels minéraux NPK. Ces sels minéraux peuvent provenir des engrais verts, du fumier, ou de l'engrais chimique.$$,
        'highlights', array[$$sels minéraux NPK (azote, phosphore, potassium) = nécessaires à la croissance$$, $$sources : engrais vert, fumier, engrais chimique$$]::text[],
        'example', jsonb_build_object('statement', $$Une parcelle déjà exploitée (pauvre en sels minéraux) donne des plants moins développés qu'une parcelle enrichie d'engrais NPK. Pourquoi ?$$, 'solution', $$Parce que l'engrais NPK apporte les sels minéraux nécessaires à une bonne croissance, absents ou insuffisants dans la parcelle épuisée.$$),
        'fixation', jsonb_build_object('question', $$Que signifient les lettres N, P, K dans "engrais NPK" ?$$, 'solution', $$Azote (N), Phosphore (P), Potassium (K).$$)
      ),
      jsonb_build_object(
        'heading', $$Influence de la lumière$$,
        'body', $$Deux plants de maïs dans un sol humide et riche en sels minéraux, arrosés régulièrement : l'un exposé à la lumière (A), l'autre à l'obscurité sous une cloche noire (B). Le plant A se développe bien (feuilles vertes, tige robuste) ; le plant B se développe peu (feuilles jaunâtres, tige frêle). En présence de lumière, la plante verte utilise sa chlorophylle pour transformer le dioxyde de carbone, l'eau et les sels minéraux en matière organique : elle est dite autotrophe.$$,
        'highlights', array[$$lumière + chlorophylle → fabrication de matière organique (plante autotrophe)$$, $$manque de lumière → feuilles jaunes, tige frêle$$]::text[],
        'example', jsonb_build_object('statement', $$Des plantes en pot restent 3 semaines dans une maison fermée (volets clos). Que va-t-il leur arriver ?$$, 'solution', $$Elles vont jaunir et s'affaiblir par manque de lumière (incapables de fabriquer leur matière organique).$$),
        'fixation', jsonb_build_object('question', $$Pourquoi dit-on qu'une plante verte est "autotrophe" ?$$, 'solution', $$Parce qu'elle fabrique elle-même sa matière organique, grâce à la lumière et à la chlorophylle.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Deux groupes d'élèves réalisent des pépinières de tomate : le groupe 1 sur une parcelle enrichie d'engrais NPK, le groupe 2 sur une parcelle déjà exploitée. Les plants du groupe 1 sont bien développés, ceux du groupe 2 beaucoup moins.$$,
      'questions', array[
        $$Cite les trois facteurs de croissance des plantes à fleurs.$$,
        $$Identifie le facteur mis en évidence dans cette situation.$$,
        $$Explique la différence de croissance observée.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Un plant de maïs se fane et meurt dans un sol régulièrement arrosé et riche en sels minéraux, mais placé sous une cloche noire. Quel facteur manque ?$$,
      'hint', $$Ce n'est ni l'eau ni les sels minéraux.$$,
      'expected', $$La lumière.$$
    ),
    jsonb_build_object(
      'question', $$Un sol sec provoque-t-il une bonne ou une mauvaise croissance des plantes ?$$,
      'hint', $$Le manque d'eau nuit à la plante.$$,
      'expected', $$Une mauvaise croissance (la plante se fane et meurt).$$
    ),
    jsonb_build_object(
      'question', $$Quels trois éléments la plante verte utilise-t-elle, grâce à la lumière, pour fabriquer sa matière organique ?$$,
      'hint', $$Un gaz, un liquide, et des nutriments du sol.$$,
      'expected', $$Le dioxyde de carbone, l'eau, et les sels minéraux.$$
    ),
    jsonb_build_object(
      'question', $$Cite une source possible de sels minéraux pour le sol.$$,
      'hint', $$Pense aux engrais.$$,
      'expected', $$Par exemple : l'engrais vert, le fumier, ou l'engrais chimique (NPK).$$
    )
  ),
  content_generated_at = now()
where id = 'svt-6e-facteurs-croissance-plantes';
