-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the standard
-- Ivorian 4ème Histoire programme on the slave trade in world history
-- (trans-Saharan, Atlantic/transatlantic and Oriental slave trades, the
-- triangular trade, consequences and abolition). Kept qualitative on
-- casualty/volume figures, which are debated among historians, rather than
-- inventing precise numbers; abolition dates given are the well-established
-- ones (France 1794, reinstated 1802, definitively abolished 1848).
-- 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Au musée de la mémoire d'Assinie, une classe de 4ème observe des chaînes et des documents anciens rappelant que des millions d'Africains ont été déportés de force vers d'autres continents pendant des siècles. Les élèves se demandent : qu'est-ce que la traite négrière, comment s'organisait-elle, et quelles traces a-t-elle laissées dans l'histoire de l'humanité ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la traite négrière ?$$,
        'body', $$La traite négrière désigne la capture, la déportation et la vente forcées d'êtres humains, réduits en esclavage, le plus souvent depuis l'Afrique vers d'autres continents. Elle a pris plusieurs formes dans l'histoire : la traite transsaharienne (vers le monde arabo-musulman, à travers le Sahara, pratiquée pendant plus d'un millénaire), la traite orientale (vers l'océan Indien) et la traite occidentale ou atlantique (vers les Amériques, à partir du XVIème siècle).$$,
        'highlights', array[$$traite négrière$$, $$traite transsaharienne$$, $$traite atlantique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La traite négrière est la capture, la déportation et la vente forcées d'êtres humains réduits en esclavage. Elle a existé sous plusieurs formes : transsaharienne, orientale et atlantique (ou occidentale), cette dernière ayant déporté des Africains vers les Amériques à partir du XVIème siècle.$$),
        'fixation', jsonb_build_object('question', $$Cite les trois grandes formes de traite négrière évoquées dans cette leçon.$$, 'solution', $$La traite transsaharienne, la traite orientale et la traite atlantique (occidentale).$$)
      ),
      jsonb_build_object(
        'heading', $$Le commerce triangulaire atlantique$$,
        'body', $$La traite atlantique s'organise selon un circuit appelé commerce triangulaire : des navires européens partent avec des marchandises manufacturées (tissus, armes, alcools) échangées sur les côtes africaines contre des captifs ; ceux-ci sont ensuite transportés dans des conditions inhumaines vers les Amériques lors de la traversée appelée « passage du milieu » ; ils y sont vendus comme esclaves pour travailler dans les plantations, dont les productions (sucre, coton, café) repartent enfin vers l'Europe.$$,
        'highlights', array[$$commerce triangulaire$$, $$passage du milieu$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Étape$$, $$Trajet$$, $$Marchandise/cargaison$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$1$$, $$Europe vers Afrique$$, $$Produits manufacturés (tissus, armes)$$),
            jsonb_build_array($$2$$, $$Afrique vers Amériques$$, $$Captifs réduits en esclavage$$),
            jsonb_build_array($$3$$, $$Amériques vers Europe$$, $$Sucre, coton, café$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Pourquoi appelle-t-on ce commerce « triangulaire » ?$$, 'solution', $$Parce qu'il relie trois continents (Europe, Afrique, Amériques) selon un circuit en trois étapes qui dessine un triangle sur la carte.$$),
        'fixation', jsonb_build_object('question', $$Que transportent les navires négriers lors de la traversée de l'Atlantique appelée « passage du milieu » ?$$, 'solution', $$Des captifs africains réduits en esclavage, entassés dans des conditions inhumaines.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de la traite négrière$$,
        'body', $$La traite négrière a causé d'immenses souffrances humaines et d'importantes pertes de population pour de nombreuses régions d'Afrique, en plus de déstructurer certaines sociétés africaines. Elle a par ailleurs contribué à l'enrichissement de puissances européennes et de leurs colonies, tout en alimentant des résistances (révoltes, marronage, fuite des esclaves) de la part des populations déportées.$$,
        'highlights', array[$$pertes humaines$$, $$résistances$$, $$marronage$$]::text[],
        'example', jsonb_build_object('statement', $$Cite une forme de résistance des populations déportées face à l'esclavage.$$, 'solution', $$Le marronage (la fuite des esclaves pour échapper à leurs maîtres) ou les révoltes d'esclaves dans les plantations.$$),
        'fixation', jsonb_build_object('question', $$Cite deux conséquences de la traite négrière pour les régions africaines touchées.$$, 'solution', $$D'importantes pertes de population et la déstructuration de certaines sociétés africaines.$$)
      ),
      jsonb_build_object(
        'heading', $$Vers l'abolition de l'esclavage$$,
        'body', $$Sous la pression de mouvements abolitionnistes, la France abolit une première fois l'esclavage en 1794, avant que Napoléon Bonaparte ne le rétablisse en 1802. L'esclavage est définitivement aboli dans les colonies françaises en 1848, notamment grâce à l'action de Victor Schœlcher. D'autres pays abolissent également la traite et l'esclavage au cours du XIXème siècle.$$,
        'highlights', array[$$abolition$$, $$Victor Schœlcher$$, $$1848$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'esclavage est aboli une première fois par la France en 1794, rétabli par Napoléon en 1802, puis définitivement aboli en 1848 dans les colonies françaises, sous l'impulsion notamment de Victor Schœlcher.$$),
        'fixation', jsonb_build_object('question', $$En quelle année l'esclavage est-il définitivement aboli dans les colonies françaises ?$$, 'solution', $$En 1848.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une exposition sur la mémoire de l'esclavage présente le trajet d'un navire négrier parti d'Europe, passé par les côtes africaines, arrivé aux Amériques, puis revenu en Europe.$$,
      'questions', array[
        $$Définis la traite négrière et cite ses trois grandes formes historiques.$$,
        $$Décris les trois étapes du commerce triangulaire atlantique.$$,
        $$Cite deux conséquences de la traite négrière pour l'Afrique.$$,
        $$Donne la date de l'abolition définitive de l'esclavage dans les colonies françaises.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la traite négrière ?$$,
      'hint', $$Pense à la capture et à la vente forcée d'êtres humains.$$,
      'expected', $$La capture, la déportation et la vente forcées d'êtres humains réduits en esclavage.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le commerce lié à la traite atlantique est-il appelé « commerce triangulaire » ?$$,
      'hint', $$Pense aux trois continents reliés par ce circuit.$$,
      'expected', $$Parce qu'il relie l'Europe, l'Afrique et les Amériques selon un circuit en trois étapes qui forme un triangle.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la fuite des esclaves pour échapper à leurs maîtres ?$$,
      'hint', $$C'est un mot en « m ».$$,
      'expected', $$Le marronage.$$
    ),
    jsonb_build_object(
      'question', $$En quelle année l'esclavage est-il définitivement aboli dans les colonies françaises ?$$,
      'hint', $$C'est une date du milieu du XIXème siècle, liée à Victor Schœlcher.$$,
      'expected', $$En 1848.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-4e-traite-negriere';
