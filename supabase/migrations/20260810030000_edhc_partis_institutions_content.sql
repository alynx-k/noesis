-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- responsible behavior toward political parties and republican
-- institutions, in 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$À l'approche d'une élection, deux camarades de classe se disputent violemment parce que leurs familles ne soutiennent pas le même parti politique. Le professeur en profite pour expliquer comment se comporter face aux partis politiques et aux institutions, afin de préserver la paix sociale.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Le rôle des partis politiques$$,
        'body', $$Un parti politique est un groupe de citoyens réunis autour d'idées communes pour conquérir ou exercer le pouvoir par des moyens légaux, notamment les élections. Le pluralisme politique, c'est-à-dire l'existence de plusieurs partis, permet aux citoyens de choisir entre différents projets de société.$$,
        'highlights', array[$$parti politique$$, $$pluralisme politique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans une démocratie, la diversité des partis politiques est normale et légitime ; elle ne doit jamais justifier la violence ou la haine entre citoyens de sensibilités différentes.$$),
        'example', jsonb_build_object('statement', $$Deux voisins soutiennent des partis différents mais continuent à s'entraider au quotidien. Quelle attitude illustrent-ils ?$$, 'solution', $$Ils illustrent la tolérance politique : ils respectent leurs différences d'opinion sans que cela nuise à leur relation.$$)
      ),
      jsonb_build_object(
        'heading', $$Les institutions de la République$$,
        'body', $$Les institutions de la République sont les organes qui organisent la vie de l'État : la Présidence, le Gouvernement, l'Assemblée nationale qui vote les lois, et la Justice qui les fait respecter. Elles doivent être respectées par tous les citoyens, quel que soit leur bord politique.$$,
        'highlights', array[$$institutions de la République$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Institution$$, $$Rôle principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Présidence de la République$$, $$Diriger l'exécutif, représenter l'État$$),
            jsonb_build_array($$Assemblée nationale$$, $$Voter les lois, contrôler le gouvernement$$),
            jsonb_build_array($$Justice$$, $$Faire respecter les lois, trancher les litiges$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle institution est chargée de voter les lois en Côte d'Ivoire ?$$, 'solution', $$L'Assemblée nationale.$$)
      ),
      jsonb_build_object(
        'heading', $$Adopter un comportement responsable$$,
        'body', $$Face aux partis politiques, un comportement responsable consiste à respecter les opinions différentes des siennes, à refuser les discours de haine ou d'exclusion, et à privilégier le dialogue plutôt que l'affrontement, surtout en période électorale.$$,
        'highlights', array[$$comportement responsable$$, $$discours de haine$$]::text[],
        'example', jsonb_build_object('statement', $$Un camarade insulte un autre élève à cause du parti soutenu par sa famille. Que devrait-il faire à la place ?$$, 'solution', $$Il devrait respecter l'opinion politique différente de son camarade, dialoguer calmement au lieu d'insulter, et éviter tout discours de haine.$$)
      ),
      jsonb_build_object(
        'heading', $$La préservation de la paix sociale$$,
        'body', $$La paix sociale se construit par le respect mutuel, la tolérance des différences d'opinion, le rejet de la violence, et la confiance envers les institutions chargées de régler les désaccords, notamment la justice.$$,
        'highlights', array[$$paix sociale$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite une attitude qui aide à préserver la paix sociale en période électorale.$$, 'solution', $$Par exemple : accepter les résultats par les voies légales, dialoguer avec ceux qui pensent différemment, ou refuser la violence verbale et physique.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Après une élection, des jeunes d'un quartier veulent organiser une manifestation violente contre les partisans d'un autre parti pour contester les résultats.$$,
      'questions', array[
        $$Explique pourquoi ce comportement met en danger la paix sociale.$$,
        $$Cite l'institution vers laquelle ils devraient se tourner pour contester légalement les résultats.$$,
        $$Propose un comportement responsable que ces jeunes pourraient adopter à la place.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce qu'un parti politique et à quoi sert le pluralisme politique ?$$,
      'hint', $$Pense au choix offert aux citoyens.$$,
      'expected', $$Un parti politique est un groupe de citoyens réunis autour d'idées communes pour exercer le pouvoir légalement ; le pluralisme permet aux citoyens de choisir entre plusieurs projets de société.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux institutions de la République et leur rôle.$$,
      'hint', $$Pense à qui vote les lois et qui les fait respecter.$$,
      'expected', $$Par exemple : l'Assemblée nationale (vote les lois) et la Justice (fait respecter les lois, tranche les litiges).$$
    ),
    jsonb_build_object(
      'question', $$Donne un exemple de comportement responsable face à une différence d'opinion politique.$$,
      'hint', $$Pense au dialogue plutôt qu'à l'affrontement.$$,
      'expected', $$Par exemple : respecter l'opinion de l'autre, dialoguer calmement, refuser les insultes ou la violence liées aux préférences politiques.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le respect des institutions est-il important pour la paix sociale ?$$,
      'hint', $$Pense à ce qui se passerait si chacun rejetait les décisions des institutions.$$,
      'expected', $$Parce que les institutions permettent de régler les désaccords par des voies légales et pacifiques ; les rejeter pousse à la violence et menace la cohésion de la société.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-partis-institutions';
