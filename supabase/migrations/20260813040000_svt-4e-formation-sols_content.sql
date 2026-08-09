-- FALLBACK CONTENT: see 20260813000000_svt-4e-transformations-corps-humain_content.sql
-- header for the ecole-ci.org access attempt this session (site-wide
-- login wall). Written from general knowledge of the standard Ivorian
-- 4ème SVT programme (Compétence 3 : la formation des sols — de la
-- roche mère altérée à un sol structuré en horizons). 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Sur le même site où la classe a observé un granite fissuré transformé en arène, un sol épais et fertile s'est développé un peu plus loin, portant une végétation dense. Les élèves se demandent combien de temps il a fallu pour qu'un sol se forme à partir d'une roche.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le point de départ : la roche mère altérée$$,
        'body', $$La formation d'un sol commence par la dégradation d'une roche, mécanique, chimique et biologique, qui produit une roche mère altérée, meuble et poreuse, appelée arène. Ce matériau constitue la base minérale sur laquelle le sol va progressivement se construire.$$,
        'highlights', array[$$roche mère$$, $$pédogenèse$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La formation d'un sol, ou pédogenèse, débute à partir d'une roche mère altérée (arène), issue de la dégradation d'une roche.$$),
        'example', jsonb_build_object('statement', $$Pourquoi une roche massive et intacte ne peut-elle pas donner directement un sol ?$$, 'solution', $$Parce qu'un sol nécessite un matériau meuble et poreux capable de retenir l'eau, l'air et la matière organique ; seule une roche préalablement dégradée en arène offre ces conditions.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on le processus de formation d'un sol ?$$, 'solution', $$La pédogenèse.$$)
      ),
      jsonb_build_object(
        'heading', $$L'apport de la matière organique$$,
        'body', $$À la surface de l'arène, les débris de végétaux et d'animaux morts s'accumulent puis sont décomposés par des décomposeurs, bactéries, champignons, vers de terre et autres invertébrés, qui les transforment en une matière organique appelée humus. L'humus enrichit le sol en éléments nutritifs et améliore sa structure.$$,
        'highlights', array[$$humification$$, $$décomposeurs$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les décomposeurs transforment les débris végétaux et animaux en humus, matière organique qui enrichit le sol et améliore sa structure.$$),
        'example', jsonb_build_object('statement', $$Quel est le rôle des vers de terre dans la formation du sol ?$$, 'solution', $$En se nourrissant de débris organiques et en creusant des galeries, les vers de terre participent à la décomposition de la matière organique en humus et améliorent l'aération et le mélange du sol.$$),
        'fixation', jsonb_build_object('question', $$Cite deux organismes décomposeurs présents dans le sol.$$, 'solution', $$Les bactéries et les champignons, ou encore les vers de terre.$$)
      ),
      jsonb_build_object(
        'heading', $$Les facteurs de la formation d'un sol$$,
        'body', $$La formation d'un sol dépend de plusieurs facteurs : la nature de la roche mère, le climat, qui accélère plus ou moins la dégradation et la décomposition selon la température et les précipitations, les êtres vivants présents, le relief, et surtout le temps, car la formation d'un sol est un processus très lent, qui se compte souvent en siècles.$$,
        'highlights', array[$$facteurs pédogénétiques$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La formation d'un sol dépend de la roche mère, du climat, des êtres vivants, du relief et du temps ; c'est un processus très lent.$$),
        'example', jsonb_build_object('statement', $$Pourquoi un sol se forme-t-il plus vite dans une région chaude et humide que dans une région froide et sèche ?$$, 'solution', $$Parce que la chaleur et l'humidité accélèrent à la fois la dégradation chimique de la roche et la décomposition de la matière organique par les êtres vivants.$$),
        'fixation', jsonb_build_object('question', $$Cite trois facteurs qui influencent la formation d'un sol.$$, 'solution', $$La nature de la roche mère, le climat et les êtres vivants (ou le relief, ou le temps).$$)
      ),
      jsonb_build_object(
        'heading', $$La mise en place des horizons$$,
        'body', $$Au fil du temps, le sol se structure en couches superposées appelées horizons : un horizon de surface riche en humus, un horizon intermédiaire où s'accumulent des éléments minéraux entraînés par l'eau, et, en profondeur, la roche mère plus ou moins altérée. Cette organisation en horizons caractérise un sol mature.$$,
        'highlights', array[$$horizons$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un sol mature se structure progressivement en horizons superposés, depuis la surface riche en humus jusqu'à la roche mère altérée en profondeur.$$),
        'example', jsonb_build_object('statement', $$Pourquoi l'horizon de surface d'un sol est-il généralement le plus sombre ?$$, 'solution', $$Parce qu'il est le plus riche en humus, la matière organique issue de la décomposition des débris végétaux et animaux, qui donne au sol sa couleur sombre.$$),
        'fixation', jsonb_build_object('question', $$Que trouve-t-on en profondeur, sous les horizons d'un sol mature ?$$, 'solution', $$La roche mère, plus ou moins altérée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les élèves comparent l'affleurement de granite fissuré et le sol épais qui s'est développé un peu plus loin, portant une végétation dense.$$,
      'questions', array[
        $$À partir de quel matériau un sol commence-t-il à se former ?$$,
        $$Quel est le rôle des décomposeurs dans la formation d'un sol ?$$,
        $$Cite trois facteurs qui influencent la vitesse de formation d'un sol.$$,
        $$Décris la structure en horizons d'un sol mature.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la pédogenèse ?$$,
      'hint', $$Pense au mot formé sur "sol" en grec (pedon).$$,
      'expected', $$C'est le processus de formation d'un sol, à partir de la dégradation d'une roche et de l'accumulation de matière organique.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce que l'humus et comment se forme-t-il ?$$,
      'hint', $$Pense aux décomposeurs.$$,
      'expected', $$L'humus est la matière organique du sol, formée par la décomposition des débris végétaux et animaux par les décomposeurs (bactéries, champignons, vers de terre).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la formation d'un sol est-elle un processus très lent ?$$,
      'hint', $$Pense à la dégradation de la roche et à l'accumulation d'humus.$$,
      'expected', $$Parce qu'elle nécessite la dégradation progressive d'une roche en profondeur et l'accumulation lente de matière organique en surface, deux phénomènes qui prennent souvent des siècles.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois grandes zones (horizons) que l'on distingue généralement dans un sol mature.$$,
      'hint', $$Surface, intermédiaire, profondeur.$$,
      'expected', $$Un horizon de surface riche en humus, un horizon intermédiaire d'accumulation minérale, et la roche mère altérée en profondeur.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-formation-sols';
