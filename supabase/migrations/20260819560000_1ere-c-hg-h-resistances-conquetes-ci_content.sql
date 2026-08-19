-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Histoire-Géographie (matière Histoire), categoryid=136.
-- Moodle course id 2443: "1ère H4-Les résistances aux conquêtes
-- territoriales en Afrique Exple de la Côte d'Ivoire"
-- (https://lyc.ecole-ci.org/course/view.php?id=2443), resource id 22662.
-- Contenu réécrit à partir du PDF source (causes et formes des
-- résistances, étapes de la conquête territoriale ivoirienne). Dates,
-- noms de résistants et de gouverneurs, et faits historiques réels
-- repris tels quels (données factuelles, non protégées).
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-hg-h-resistances-conquetes-ci',
  '1ere',
  'C',
  'histoire-geographie',
  $$Les résistances aux conquêtes territoriales en Afrique : l'exemple de la Côte d'Ivoire$$,
  12,
  '1ere-c-hg-h-imperialisme-congres-berlin',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour récompenser les meilleurs élèves des classes de 1ère, la direction de l'établissement organise une visite guidée à Kong pour découvrir les mosquées de Samory Touré. Les élèves s'interrogent sur la personnalité de Samory et les raisons de ses résistances à la conquête française. Ils décident de mener des recherches pour distinguer les causes et les formes de résistance territoriale, et analyser les étapes de la conquête territoriale en Côte d'Ivoire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les causes des résistances à la conquête coloniale$$,
        'body', $$Les causes politiques tiennent à la défense de la souveraineté : l'installation de postes de douane, les réquisitions et les convocations cavalières de leaders sont perçues comme des atteintes à la liberté des peuples indigènes. Les causes économiques tiennent à la perturbation des relations commerciales établies : les peuples côtiers (Alladian, Abouré), intermédiaires traditionnels entre Européens et peuples de l'intérieur, refusent de perdre leurs avantages commerciaux. Les causes religieuses tiennent à la résistance des peuples islamisés, qui considèrent les Français comme des infidèles perturbant les sociétés islamiques.$$,
        'highlights', array[$$3 causes : politiques (souveraineté), économiques (rôle d'intermédiaire commercial), religieuses (résistance islamique)$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi les peuples côtiers comme les Alladian ou les Abouré résistaient-ils à la pénétration française vers l'intérieur ?$$, 'solution', $$Parce qu'ils tiraient d'importants avantages économiques de leur rôle d'intermédiaires commerciaux entre les Européens et les peuples de l'intérieur, et craignaient de perdre ces avantages si les Français commerçaient directement avec l'intérieur.$$)
      ),
      jsonb_build_object(
        'heading', $$Les formes de résistances : passives et violentes$$,
        'body', $$Les résistances passives se manifestent pacifiquement : en 1885, les Abourés de Yaou ferment le fleuve Comoé aux Français ; en 1886, les Ebrié ferment la lagune au commerce européen ; d'autres populations migrent ou s'enfuient massivement. Les résistances violentes sont plus précoces : attaques des postes de douane de Lahou et Jacqueville par les lagunaires (1890), du fort de Dabou par les Adjoukrou et Bouboury (1891). De 1893 à 1898, Samory Touré mène une guerre permanente, usant de la technique de la terre brûlée, avant sa capture à Guélémou et sa déportation au Gabon. Les Baoulé (1894-1899), les Agni d'Agnibilékrou (1898-1899) et le royaume N'Denyé résistent également, de même que les populations forestières (postes de Daloa 1906, Man 1908, Agboville et Adzopé 1910), menées par des chefs comme Zokou Gbéli.$$,
        'highlights', array[$$résistances passives : fermeture de voies commerciales, migration, fuite$$, $$résistances violentes : Samory Touré (1893-1898, terre brûlée), Baoulé, Agni, guérilla forestière$$]::text[],
        'example', jsonb_build_object('statement', $$En quoi consistait la « technique de la terre brûlée » utilisée par Samory Touré ?$$, 'solution', $$À détruire systématiquement tout ce qui se trouvait sur le passage de l'ennemi (récoltes, villages, ressources), afin de l'affamer et de le priver de tout ravitaillement.$$),
        'fixation', jsonb_build_object('question', $$Que sont devenues les populations Ebrié en 1886, comme forme de résistance passive ?$$, 'solution', $$Elles ont fermé la lagune au commerce européen.$$)
      ),
      jsonb_build_object(
        'heading', $$La conquête pacifique (1893-1908)$$,
        'body', $$Le gouverneur Louis Gustave Binger (1893-1896) préconise cette politique, appliquée surtout par le gouverneur Clozel : collaboration avec les populations indigènes, recours limité à la force, administration civile. Elle se traduit par la création de comptoirs (Assinie, Grand-Bassam, Dabou, 1843-1875), les missions d'exploration (Treich-Laplène, Binger, Bidaud, entre 1887 et 1902) et la signature de traités et conventions (convention du 26 juin 1891 sur les frontières franco-britanniques ; création de la colonie de Côte d'Ivoire le 10 mars 1893). Cette politique échoue partiellement : l'occupation française reste limitée au nord, au littoral sud-est et à la frontière orientale ; le centre et l'ouest échappent à son autorité.$$,
        'highlights', array[$$3 formes : comptoirs (économique) + missions/explorations (politique) + conventions (diplomatique)$$, $$10 mars 1893 : création de la colonie de Côte d'Ivoire$$],
        'fixation', jsonb_build_object('question', $$Quel gouverneur a le mieux appliqué la politique de pénétration pacifique, et par quels moyens ?$$, 'solution', $$Le gouverneur Clozel, en collaborant avec les populations indigènes, en évitant le recours systématique à la force, et en installant une administration civile.$$)
      ),
      jsonb_build_object(
        'heading', $$La conquête brutale (1908-1920)$$,
        'body', $$Face à l'échec de la pénétration pacifique, le gouverneur Louis Gabriel Angoulvant (1908-1916) applique la « méthode forte » : forte augmentation des effectifs militaires (840 militaires sous Clozel contre plus de 2000 militaires, 1300 miliciens et 1247 gardes de police sous Angoulvant en 1910), aggravation des sanctions (internement et déportation des chefs), installation d'administrations civiles dans les régions soumises et de cercles militaires dans les régions insoumises (Bouna, Guiglo-Toulepleu, Dimbokro, Man). Cette méthode aboutit à la conquête totale de la Côte d'Ivoire en 1920.$$,
        'highlights', array[$$Angoulvant (1908-1916) : effectifs militaires multipliés par >2, sanctions renforcées, cercles militaires$$, $$conquête totale de la Côte d'Ivoire achevée en 1920$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi Angoulvant a-t-il choisi une méthode différente de celle de Clozel ?$$, 'solution', $$Parce que la politique de pénétration pacifique de Clozel avait échoué à soumettre l'ensemble du territoire : le centre et l'ouest de la Côte d'Ivoire échappaient encore à l'autorité française, rendant nécessaire une méthode plus contraignante pour achever la conquête.$$),
        'fixation', jsonb_build_object('question', $$Cite deux mesures de la « méthode forte » d'Angoulvant.$$, 'solution', $$Deux parmi : l'augmentation des effectifs militaires, l'aggravation des sanctions (internement/déportation des chefs), l'installation de cercles militaires dans les régions insoumises.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Dans un article de journal portant sur les résistances aux conquêtes coloniales en Côte d'Ivoire, un journaliste affirme que ces résistances furent violentes. Il ajoute que la conquête de la colonie a nécessité l'usage de la méthode forte à partir de 1908, et précise que cette méthode forte fut le moyen efficace de la conquête du territoire de la Côte d'Ivoire.$$,
      'questions', array[
        $$Indique la méthode de conquête de la colonie de Côte d'Ivoire évoquée dans ce texte.$$,
        $$Explique le passage : « cette méthode forte fut le moyen efficace de la conquête du territoire de la Côte d'Ivoire. »$$,
        $$« Les résistances à la conquête coloniale en Côte d'Ivoire furent violentes » : partages-tu cet avis ? Justifie ta réponse en distinguant résistances passives et violentes.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite les trois causes des résistances à la conquête coloniale en Côte d'Ivoire.$$,
      'hint', $$Elles touchent la souveraineté, le commerce et la religion.$$,
      'expected', $$Les causes politiques (défense de la souveraineté), économiques (perte des avantages commerciaux d'intermédiaires) et religieuses (résistance des peuples islamisés).$$
    ),
    jsonb_build_object(
      'question', $$Où et quand Samory Touré a-t-il été capturé, et où a-t-il été déporté ?$$,
      'hint', $$Le combat décisif a eu lieu près de Biankouman.$$,
      'expected', $$Il a été capturé à Guélémou, après un combat à Doué (nord de Biankouman), et déporté au Gabon.$$
    ),
    jsonb_build_object(
      'question', $$Quelles sont les deux grandes phases de la conquête territoriale de la Côte d'Ivoire, et leurs dates ?$$,
      'hint', $$L'une est pacifique, l'autre plus brutale.$$,
      'expected', $$La pénétration pacifique (1893-1908) et la manière forte (1908-1920).$$
    ),
    jsonb_build_object(
      'question', $$Quel gouverneur a mené la « manière forte » et en quelle année la Côte d'Ivoire a-t-elle été totalement conquise ?$$,
      'hint', $$C'est le successeur de Clozel.$$,
      'expected', $$Louis Gabriel Angoulvant ; la conquête totale a été achevée en 1920.$$
    )
  ),
  now()
);
