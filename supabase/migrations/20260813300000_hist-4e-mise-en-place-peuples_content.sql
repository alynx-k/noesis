-- FALLBACK CONTENT: re-checked in a later session once ecole-ci.org's real
-- Moodle platform (coll.ecole-ci.org, "Collège Numérique") became accessible
-- and logged-in. Browsed the actual Histoire - Géographie 4ème category
-- (categoryid=23) and ran targeted site searches (e.g. "peuples de Côte
-- d'Ivoire", "migrations") — this lesson has no course/PDF uploaded on the
-- platform (only 2 of the 12 4ème Histoire-Géographie lessons exist there:
-- hist-4e-revolution-francaise and geo-4e-cedeao, both now grounded in
-- their real PDFs). Written from general knowledge of the standard Ivorian 4ème Histoire
-- programme (Thème 1 : les peuples de Côte d'Ivoire et leurs contacts avec
-- l'Europe du XVIème au XVIIIème siècle). Kept qualitative on migration
-- dates/routes where precise figures are not reliably known; no invented
-- statistics. 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une veillée au village, le grand-père d'Aya raconte que leurs ancêtres akan seraient arrivés de la région de l'actuel Ghana plusieurs générations plus tôt, fuyant des guerres, avant de s'installer sur les terres qu'occupe aujourd'hui leur famille. Aya se demande : d'où venaient réellement les peuples qui habitent la Côte d'Ivoire actuelle, et comment se sont-ils installés sur ce territoire ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les grands mouvements migratoires du XVIème au XVIIIème siècle$$,
        'body', $$Le peuplement actuel de la Côte d'Ivoire résulte de vagues successives de migrations venues des régions voisines. Ces déplacements de populations, étalés du XVIème au XVIIIème siècle, ont été provoqués par des guerres, des crises politiques dans de grands royaumes et empires voisins (comme l'empire du Mali en déclin ou des conflits dans la région akan), ainsi que par la recherche de nouvelles terres à cultiver.$$,
        'highlights', array[$$migrations$$, $$XVIème-XVIIIème siècle$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le peuplement de la Côte d'Ivoire résulte de vagues successives de migrations, venues des régions voisines, entre le XVIème et le XVIIIème siècle, provoquées principalement par des guerres et des crises politiques dans les royaumes et empires voisins.$$),
        'example', jsonb_build_object('statement', $$Pourquoi de nombreux peuples ont-ils quitté leur région d'origine pour s'installer sur le territoire de l'actuelle Côte d'Ivoire ?$$, 'solution', $$Principalement pour fuir des guerres, des conflits de succession ou l'effondrement de grands royaumes et empires voisins, et pour chercher de nouvelles terres à cultiver.$$),
        'fixation', jsonb_build_object('question', $$Cite deux causes des migrations qui ont peuplé la Côte d'Ivoire.$$, 'solution', $$Les guerres et conflits dans les royaumes ou empires voisins, et la recherche de nouvelles terres.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grands groupes de peuples et leurs origines$$,
        'body', $$Les historiens distinguent généralement cinq grands groupes de peuples installés en Côte d'Ivoire selon leur région d'origine et leur langue : les Akan (venus de la région de l'actuel Ghana), les Krou (venus de la région de l'actuel Liberia), les Mandé du Nord (venus de la région de l'actuel Mali), les Mandé du Sud (venus de l'ouest) et les Voltaïques ou Gour (venus de la région de l'actuel Burkina Faso).$$,
        'highlights', array[$$Akan$$, $$Krou$$, $$Mandé$$, $$Voltaïques (Gour)$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Groupe$$, $$Région d'origine approximative$$, $$Zone d'installation en Côte d'Ivoire$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Akan$$, $$Actuel Ghana$$, $$Est et Sud-Est (ex. pays baoulé, agni)$$),
            jsonb_build_array($$Krou$$, $$Actuel Liberia$$, $$Sud-Ouest$$),
            jsonb_build_array($$Mandé du Nord$$, $$Actuel Mali$$, $$Nord-Ouest$$),
            jsonb_build_array($$Mandé du Sud$$, $$Régions à l'ouest$$, $$Ouest (ex. pays dan, gouro)$$),
            jsonb_build_array($$Voltaïques (Gour)$$, $$Actuel Burkina Faso$$, $$Nord et Nord-Est (ex. pays sénoufo, lobi)$$)
          )
        ),
        'example', jsonb_build_object('statement', $$À quel grand groupe appartiennent les peuples baoulé et agni, et de quelle région seraient-ils originaires ?$$, 'solution', $$Ils appartiennent au groupe akan et seraient originaires de la région de l'actuel Ghana.$$),
        'fixation', jsonb_build_object('question', $$Cite trois des cinq grands groupes de peuples qui ont peuplé la Côte d'Ivoire.$$, 'solution', $$Par exemple : les Akan, les Krou et les Mandé (du Nord ou du Sud) ; on peut aussi citer les Voltaïques (Gour).$$)
      ),
      jsonb_build_object(
        'heading', $$Les peuples déjà installés avant les grandes vagues migratoires$$,
        'body', $$Certains peuples occupaient déjà le territoire bien avant plusieurs de ces grandes vagues migratoires, notamment les peuples lagunaires établis le long du littoral et des lagunes (comme les Ebrié ou les Alladian). L'arrivée des nouveaux migrants a donné lieu, selon les régions, à des alliances, des échanges culturels, des assimilations, mais aussi parfois à des tensions pour l'occupation des terres.$$,
        'highlights', array[$$peuples lagunaires$$, $$cohabitation$$]::text[],
        'example', jsonb_build_object('statement', $$Comment les peuples déjà installés ont-ils généralement réagi à l'arrivée de nouveaux migrants ?$$, 'solution', $$Selon les cas, il y a eu des alliances, des échanges et des assimilations, mais aussi parfois des tensions ou des conflits pour l'occupation des terres.$$),
        'fixation', jsonb_build_object('question', $$Cite un exemple de peuple installé le long du littoral bien avant plusieurs des grandes vagues migratoires.$$, 'solution', $$Les peuples lagunaires, par exemple les Ebrié ou les Alladian.$$)
      ),
      jsonb_build_object(
        'heading', $$Conséquences de la mise en place des peuples$$,
        'body', $$La mise en place progressive de ces différents peuples explique la grande diversité ethnique, linguistique et culturelle de la Côte d'Ivoire actuelle. Chaque groupe a apporté ses propres institutions, ses langues et ses traditions, posant ainsi les bases de l'organisation sociopolitique qui sera étudiée dans la leçon suivante.$$,
        'highlights', array[$$mosaïque de peuples$$, $$diversité culturelle$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les vagues migratoires successives expliquent la grande diversité ethnique et culturelle de la Côte d'Ivoire, chaque groupe ayant conservé et transmis ses propres institutions, langues et traditions.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la principale conséquence, aujourd'hui visible, de ces vagues migratoires successives ?$$, 'solution', $$Une grande diversité ethnique, linguistique et culturelle du peuplement de la Côte d'Ivoire.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un professeur demande à sa classe de 4ème d'expliquer, à l'aide d'une carte muette, comment les différents peuples de Côte d'Ivoire se sont installés sur le territoire entre le XVIème et le XVIIIème siècle.$$,
      'questions', array[
        $$Cite deux causes des migrations qui ont conduit au peuplement de la Côte d'Ivoire.$$,
        $$Nomme trois des cinq grands groupes de peuples et leur région d'origine approximative.$$,
        $$Explique ce qui a pu se passer entre les peuples déjà installés et les nouveaux arrivants.$$,
        $$Explique en quoi ces migrations expliquent la diversité culturelle de la Côte d'Ivoire d'aujourd'hui.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Entre quels siècles se déroulent les principales vagues de migration qui peuplent la Côte d'Ivoire ?$$,
      'hint', $$Pense à la période indiquée dans le titre de la leçon.$$,
      'expected', $$Entre le XVIème et le XVIIIème siècle.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux causes des migrations de peuplement de la Côte d'Ivoire.$$,
      'hint', $$Pense aux guerres et à la recherche de terres.$$,
      'expected', $$Les guerres et crises politiques dans les royaumes ou empires voisins, et la recherche de nouvelles terres à cultiver.$$
    ),
    jsonb_build_object(
      'question', $$De quelle région seraient originaires les peuples akan, comme les Agni et les Baoulé ?$$,
      'hint', $$Pense à un pays voisin actuel à l'est de la Côte d'Ivoire.$$,
      'expected', $$De la région de l'actuel Ghana.$$
    ),
    jsonb_build_object(
      'question', $$Quel groupe de peuples occupait déjà le littoral et les lagunes avant plusieurs grandes vagues migratoires ?$$,
      'hint', $$Pense aux peuples installés près de la mer et des lagunes.$$,
      'expected', $$Les peuples lagunaires, par exemple les Ebrié ou les Alladian.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-4e-mise-en-place-peuples';
