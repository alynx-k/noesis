-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the
-- construction of the European Union (CECA 1951/Treaty of Paris, CEE
-- 1957/Treaty of Rome, Maastricht Treaty 1992 creating the EU, the euro,
-- Schengen area, main institutions, 27 member states since Brexit in
-- 2020) presented, per the catalog title, as a comparison point for
-- regional integration alongside ECOWAS (previous lesson). 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En cours, le professeur montre un billet en euros et explique qu'il est utilisé dans de nombreux pays européens différents, sans qu'il soit nécessaire de changer d'argent en passant d'un pays à l'autre. Les élèves, qui viennent d'étudier la CEDEAO, se demandent en quoi l'Union européenne ressemble ou diffère de l'organisation ouest-africaine.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La construction progressive de l'Union européenne$$,
        'body', $$L'intégration européenne débute après la Seconde Guerre mondiale, avec la création en 1951 de la Communauté européenne du charbon et de l'acier (CECA), réunissant six pays (France, Allemagne de l'Ouest, Italie, Belgique, Pays-Bas, Luxembourg). En 1957, le traité de Rome crée la Communauté économique européenne (CEE), qui approfondit la coopération économique. C'est enfin le traité de Maastricht, signé en 1992, qui crée officiellement l'Union européenne (UE) telle qu'on la connaît aujourd'hui.$$,
        'highlights', array[$$CECA$$, $$traité de Rome$$, $$traité de Maastricht$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'Union européenne est née d'une construction progressive : la CECA (1951), la CEE (traité de Rome, 1957), puis l'UE elle-même, créée par le traité de Maastricht en 1992.$$),
        'fixation', jsonb_build_object('question', $$Quel traité crée officiellement l'Union européenne, et en quelle année ?$$, 'solution', $$Le traité de Maastricht, en 1992.$$)
      ),
      jsonb_build_object(
        'heading', $$Les grandes réalisations de l'Union européenne$$,
        'body', $$L'UE a mis en place un marché unique permettant la libre circulation des personnes, des biens, des services et des capitaux entre ses États membres. Elle a également créé une monnaie commune, l'euro, adoptée par une partie de ses membres, et l'espace Schengen, qui supprime les contrôles aux frontières intérieures entre les pays qui y participent.$$,
        'highlights', array[$$marché unique$$, $$euro$$, $$espace Schengen$$]::text[],
        'example', jsonb_build_object('statement', $$Que permet l'espace Schengen à un citoyen européen voyageant d'un pays membre à un autre ?$$, 'solution', $$Il peut voyager sans subir de contrôle aux frontières intérieures entre les pays participant à l'espace Schengen.$$),
        'fixation', jsonb_build_object('question', $$Quelle monnaie commune l'Union européenne a-t-elle mise en place ?$$, 'solution', $$L'euro.$$)
      ),
      jsonb_build_object(
        'heading', $$Les institutions de l'Union européenne$$,
        'body', $$L'UE fonctionne grâce à plusieurs institutions : la Commission européenne, qui propose les lois et veille à leur application ; le Parlement européen, élu au suffrage universel direct par les citoyens européens, qui vote les lois avec le Conseil de l'UE ; le Conseil européen, qui réunit les chefs d'État et de gouvernement pour définir les grandes orientations ; et la Cour de justice de l'Union européenne, qui veille au respect du droit européen.$$,
        'highlights', array[$$Commission européenne$$, $$Parlement européen$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Institution$$, $$Rôle principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Commission européenne$$, $$Propose les lois et veille à leur application$$),
            jsonb_build_array($$Parlement européen$$, $$Vote les lois, élu au suffrage universel$$),
            jsonb_build_array($$Conseil européen$$, $$Définit les grandes orientations politiques$$),
            jsonb_build_array($$Cour de justice de l'UE$$, $$Veille au respect du droit européen$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quelle institution de l'UE est élue directement par les citoyens européens ?$$, 'solution', $$Le Parlement européen.$$)
      ),
      jsonb_build_object(
        'heading', $$Un exemple d'intégration régionale, comparable à la CEDEAO$$,
        'body', $$Depuis le retrait du Royaume-Uni en 2020, l'Union européenne compte vingt-sept États membres. Comme la CEDEAO en Afrique de l'Ouest, elle illustre la volonté de plusieurs pays voisins de coopérer étroitement pour renforcer leur poids économique et politique, tout en montrant que l'intégration régionale peut atteindre un niveau d'approfondissement (monnaie unique, libre circulation totale, parlement commun) que d'autres organisations régionales, comme la CEDEAO, cherchent encore à atteindre.$$,
        'highlights', array[$$intégration régionale$$, $$comparaison avec la CEDEAO$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi l'UE va-t-elle plus loin que la CEDEAO dans l'intégration régionale ?$$, 'solution', $$Elle dispose d'une monnaie unique largement partagée, d'un espace de libre circulation sans contrôle aux frontières intérieures et d'un Parlement élu directement par les citoyens, des étapes que la CEDEAO n'a pas encore toutes atteintes.$$),
        'fixation', jsonb_build_object('question', $$Combien d'États membres compte l'Union européenne depuis le retrait du Royaume-Uni en 2020 ?$$, 'solution', $$Vingt-sept États membres.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un élève doit comparer, dans un tableau, l'Union européenne et la CEDEAO comme deux exemples d'organisations d'intégration régionale.$$,
      'questions', array[
        $$Retrace les grandes étapes de la construction de l'Union européenne, de la CECA au traité de Maastricht.$$,
        $$Cite deux réalisations concrètes de l'intégration européenne.$$,
        $$Cite deux institutions de l'Union européenne et leur rôle.$$,
        $$Explique en quoi l'UE est un exemple d'intégration régionale plus approfondie que la CEDEAO.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel traité crée la Communauté européenne du charbon et de l'acier (CECA), en 1951 ?$$,
      'hint', $$C'est le traité signé dans la capitale française.$$,
      'expected', $$Le traité de Paris.$$
    ),
    jsonb_build_object(
      'question', $$Quel traité crée officiellement l'Union européenne, en 1992 ?$$,
      'hint', $$Pense à une ville des Pays-Bas.$$,
      'expected', $$Le traité de Maastricht.$$
    ),
    jsonb_build_object(
      'question', $$Quelle monnaie commune est utilisée par une partie des États membres de l'Union européenne ?$$,
      'hint', $$C'est la monnaie unique européenne.$$,
      'expected', $$L'euro.$$
    ),
    jsonb_build_object(
      'question', $$Quelle institution de l'UE est élue au suffrage universel direct par les citoyens européens ?$$,
      'hint', $$Pense à l'organe qui vote les lois avec le Conseil de l'UE.$$,
      'expected', $$Le Parlement européen.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-4e-union-europeenne';
