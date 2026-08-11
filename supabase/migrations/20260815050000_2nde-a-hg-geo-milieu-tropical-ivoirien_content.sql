-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Histoire-Géographie, categoryid=102.
-- Moodle course id 3341: "2nde_GEOGRAPHIE_T2_L2: LE MILIEU TROPICAL IVOIRIEN"
-- (https://lyc.ecole-ci.org/course/view.php?id=3341)
-- Resource "Je lis le résumé de la leçon", mod_resource id 33319, redirecting
-- to pluginfile "2nde G5- Le milieu tropical ivoirien.pdf" (the PDF itself
-- carries an "ecole-ci.online" footer watermark, but it is served directly
-- from the official lyc.ecole-ci.org Moodle platform).
-- Rewritten/paraphrased from the source PDF (Thème 2, Leçon 2): the natural
-- conditions of the tropical zone of Côte d'Ivoire (plateau relief, tropical
-- climate with the harmattan, savanna, ferruginous soils), its sparse and
-- weakly urbanized population, its economy dominated by subsistence and
-- commercial agriculture and livestock (secondary/tertiary sectors remaining
-- limited), and state strategies to reduce the gap with the subequatorial
-- zone. 100% original wording; no sentence copied from the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-hg-geo-milieu-tropical-ivoirien',
  '2nde',
  'A',
  'geographie',
  $$Le milieu tropical ivoirien$$,
  5,
  '2nde-a-hg-geo-milieu-subequatorial-ivoirien',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En observant une carte économique de la Côte d'Ivoire, des élèves de seconde constatent que le nord et le centre du pays semblent beaucoup moins mis en valeur que le sud. Intrigués par ce contraste, ils décident d'enquêter sur les atouts naturels du milieu tropical, la répartition de sa population et les activités économiques qui s'y développent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Un milieu physique moins arrosé que le Sud$$,
        'body', $$Le milieu tropical couvre le centre et le nord du pays, au-delà du 8e degré de latitude Nord (avec une avancée vers le sud dans le « V » Baoulé). Son relief, monotone, est dominé par des plateaux étagés, plus élevés au nord-ouest (jusqu'à 900 m) qu'au centre. Le climat tropical y est nettement moins humide que dans le Sud, avec des précipitations comprises entre 1 000 et 1 500 mm par an selon les régions, une saison sèche marquée et le passage de l'harmattan, un vent chaud et sec venu du Sahara. La végétation de savane domine, parfois arborée le long des cours d'eau, et les sols ferrugineux, peu profonds et fragiles, restent adaptés à certaines cultures (anacarde, coton, mil, sorgho) plutôt qu'aux grandes cultures de rente du Sud.$$,
        'highlights', array[$$climat tropical$$, $$harmattan$$, $$sols ferrugineux$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Composante naturelle$$, $$Situation dans le milieu tropical$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Relief$$, $$Plateaux étagés, 300 à 900 m d'altitude$$),
            jsonb_build_array($$Climat$$, $$Tropical, 1 000 à 1 500 mm/an, harmattan en saison sèche$$),
            jsonb_build_array($$Végétation$$, $$Savane arborée à forêts-galeries$$),
            jsonb_build_array($$Sol$$, $$Ferrugineux, peu profond et fragile$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Qu'est-ce que l'harmattan ?$$, 'solution', $$Un vent chaud et sec qui souffle du désert du Sahara vers les zones intertropicales, présent en saison sèche dans le milieu tropical ivoirien.$$)
      ),
      jsonb_build_object(
        'heading', $$Un espace faiblement peuplé et peu urbanisé$$,
        'body', $$Le milieu tropical n'abrite qu'environ un tiers de la population ivoirienne, très en retrait par rapport au milieu subéquatorial. Cette faible densité s'explique par des conditions naturelles moins favorables au développement d'activités économiques importantes, ce qui pousse une partie de la jeunesse à migrer vers le Sud. La population, composée notamment de Malinké, de Sénoufo, d'Akan et de Lobi, ainsi que de nombreux étrangers, est inégalement répartie : certaines zones comme Korhogo ou Bouaké sont plus densément peuplées, tandis que d'autres, comme le Bounkani, restent très peu peuplées. La trame urbaine y est également plus lâche, avec toutefois quelques grandes villes : Bouaké (deuxième ville du pays), Korhogo et Yamoussoukro, la capitale politique.$$,
        'highlights', array[$$faible densité$$, $$migration vers le Sud$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi une partie de la jeunesse du milieu tropical migre-t-elle vers le Sud ?$$, 'solution', $$Parce que les conditions naturelles du milieu tropical sont moins favorables au développement d'activités économiques importantes, ce qui pousse les jeunes à chercher de meilleures opportunités dans le milieu subéquatorial.$$)
      ),
      jsonb_build_object(
        'heading', $$Une économie dominée par l'agriculture et l'élevage$$,
        'body', $$L'économie du milieu tropical repose avant tout sur le secteur primaire. L'agriculture vivrière, orientée vers l'autosubsistance, produit des céréales (maïs, mil, sorgho, fonio), des tubercules et des légumes qui assurent la sécurité alimentaire régionale. L'agriculture commerciale, elle, vise l'exportation à travers des cultures comme le coton, l'anacarde ou la canne à sucre. Les méthodes restent cependant largement traditionnelles (culture sur brûlis, outils manuels, faible mécanisation), sauf dans quelques complexes agro-industriels modernes. L'élevage, favorisé par un climat moins pluvieux et l'abondance des herbages, y est également important et fournit une part significative des besoins nationaux en viande, avec l'appui de structures d'encadrement comme l'ANADER.$$,
        'highlights', array[$$agriculture vivrière$$, $$agriculture commerciale$$, $$élevage$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les résultats des cultures de rente comme le café et le cacao sont-ils plus incertains dans le milieu tropical que dans le milieu subéquatorial ?$$, 'solution', $$Parce que la pluviométrie y est plus faible et plus irrégulière, avec un début de saison des pluies incertain, ce qui rend ces cultures moins fiables que dans le Sud, plus humide.$$),
        'fixation', jsonb_build_object('question', $$Quelle structure de l'État encadre les éleveurs du milieu tropical pour moderniser leur activité ?$$, 'solution', $$L'ANADER.$$)
      ),
      jsonb_build_object(
        'heading', $$Des secteurs secondaire et tertiaire encore limités$$,
        'body', $$L'industrie reste peu développée dans le milieu tropical, avec surtout des unités liées à l'agriculture : complexes sucriers, usines de transformation d'anacarde, usines d'égrenage de coton et une industrie textile concentrée à Bouaké. Le secteur tertiaire s'appuie sur un commerce actif avec les pays voisins (Mali, Guinée, Burkina Faso), un artisanat réputé (tissage, forge, poterie) et un tourisme en développement autour de sites comme la mosquée de Kong ou le village des tisserands de Korhogo. Ces secteurs restent néanmoins nettement moins développés que dans le milieu subéquatorial.$$,
        'highlights', array[$$agro-industrie$$, $$commerce transfrontalier$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite une activité artisanale typique du milieu tropical ivoirien.$$, 'solution', $$Par exemple le tissage (tisserands de Korhogo, Tiébissou, Waraniéné) ou la poterie (potières de Katiola).$$)
      ),
      jsonb_build_object(
        'heading', $$Les stratégies de l'État pour réduire le retard du milieu tropical$$,
        'body', $$Conscient du retard économique du milieu tropical par rapport au milieu subéquatorial, l'État a engagé d'importants programmes de redynamisation, en misant notamment sur l'agro-industrie et sur des allègements fiscaux pour attirer les entreprises. D'importantes sommes ont ainsi été investies dans la reconstruction et la modernisation des filières coton, anacarde et riz. Ces politiques sont financées en grande partie par l'impôt (impôt foncier, patente, TVA, taxes communales) prélevé sur l'agriculture, l'élevage, le commerce et le transport, qui permet aussi de financer les équipements sociaux (hôpitaux, écoles, marchés, routes) de la région.$$,
        'highlights', array[$$agro-industrie$$, $$impôt$$]::text[],
        'fixation', jsonb_build_object('question', $$Sur quelles filières agricoles l'État s'appuie-t-il en priorité pour redynamiser le milieu tropical ?$$, 'solution', $$Le coton, l'anacarde et le riz.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'un reportage télévisé, un invité affirme que « le milieu tropical ivoirien est défavorisé par la nature, donc inapte à une agriculture hautement productive ». Un élève de seconde doit discuter cette affirmation à l'aide de ce qu'il sait des atouts et des limites naturelles de ce milieu.$$,
      'questions', array[
        $$Décris le relief et le climat du milieu tropical ivoirien.$$,
        $$Explique pourquoi la population du milieu tropical est moins nombreuse et moins urbanisée que celle du milieu subéquatorial.$$,
        $$Distingue l'agriculture vivrière de l'agriculture commerciale dans ce milieu.$$,
        $$Explique le rôle de l'impôt dans la mise en valeur du milieu tropical.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel type de sol, peu profond et fragile, domine dans le milieu tropical ivoirien ?$$,
      'hint', $$Il porte un nom proche de « fer ».$$,
      'expected', $$Le sol ferrugineux.$$
    ),
    jsonb_build_object(
      'question', $$Quelle formation végétale domine le milieu tropical ivoirien ?$$,
      'hint', $$Ce n'est pas la forêt dense, mais une végétation plus ouverte.$$,
      'expected', $$La savane.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux plus grandes villes du milieu tropical ivoirien citées dans la leçon ?$$,
      'hint', $$L'une est la capitale politique, l'autre la deuxième ville du pays.$$,
      'expected', $$Yamoussoukro et Bouaké.$$
    ),
    jsonb_build_object(
      'question', $$Cite une culture commerciale bien adaptée au milieu tropical ivoirien.$$,
      'hint', $$C'est une culture d'exportation, pas le cacao ni le café.$$,
      'expected', $$Par exemple le coton, l'anacarde ou la canne à sucre.$$
    )
  ),
  now()
);
