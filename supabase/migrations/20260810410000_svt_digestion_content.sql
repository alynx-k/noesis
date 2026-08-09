-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall,
-- one auto-redirect to a login tab and one outright timeout). Written from
-- general knowledge of the standard Ivorian 3ème SVT programme (digestion
-- des aliments : appareil digestif, digestion mécanique/chimique,
-- absorption intestinale), 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après avoir mangé un morceau d'igname, Koffi se demande ce qui se passe dans son corps entre le moment où il avale et le moment où les nutriments arrivent dans son sang.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$L'appareil digestif$$,
        'body', $$L'appareil digestif est un long tube -- le tube digestif -- qui va de la bouche à l'anus, associé à des glandes annexes (glandes salivaires, foie, pancréas) qui produisent des sucs digestifs.$$,
        'highlights', array[$$appareil digestif$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Organe$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Bouche$$, $$broyage des aliments et début de la digestion chimique par la salive$$),
            jsonb_build_array($$Œsophage$$, $$transport des aliments vers l'estomac$$),
            jsonb_build_array($$Estomac$$, $$brassage et digestion chimique par le suc gastrique$$),
            jsonb_build_array($$Intestin grêle$$, $$digestion chimique finale et absorption des nutriments$$),
            jsonb_build_array($$Gros intestin$$, $$absorption de l'eau et formation des résidus$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'appareil digestif est un long tube digestif associé à des glandes annexes qui produisent des sucs digestifs.$$),
        'example', jsonb_build_object('statement', $$Cite dans l'ordre les organes traversés par un aliment depuis la bouche jusqu'à l'intestin grêle.$$, 'solution', $$Bouche, œsophage, estomac, intestin grêle.$$),
        'fixation', jsonb_build_object('question', $$Quel organe assure le broyage mécanique des aliments avant leur transport vers l'estomac ?$$, 'solution', $$La bouche, par la mastication et l'action des dents.$$)
      ),
      jsonb_build_object(
        'heading', $$La digestion mécanique et la digestion chimique$$,
        'body', $$La digestion mécanique fragmente les aliments en petits morceaux sans changer leur nature chimique (mastication, brassage). La digestion chimique, grâce aux enzymes des sucs digestifs, transforme les molécules complexes des aliments en nutriments simples et solubles.$$,
        'highlights', array[$$digestion mécanique$$, $$digestion chimique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La digestion mécanique réduit la taille des aliments ; la digestion chimique transforme leur composition grâce à des enzymes contenues dans les sucs digestifs.$$),
        'example', jsonb_build_object('statement', $$La mastication d'un morceau de pain est-elle une digestion mécanique ou chimique ?$$, 'solution', $$C'est une digestion mécanique, car elle réduit la taille de l'aliment sans le transformer chimiquement.$$),
        'fixation', jsonb_build_object('question', $$Quel type de digestion permet de transformer l'amidon du riz en glucose ?$$, 'solution', $$La digestion chimique, grâce à une enzyme appelée amylase.$$)
      ),
      jsonb_build_object(
        'heading', $$L'absorption intestinale$$,
        'body', $$L'absorption intestinale est le passage des nutriments à travers la paroi de l'intestin grêle vers le sang. Elle est facilitée par les villosités intestinales, de petits replis qui augmentent considérablement la surface de contact avec les nutriments.$$,
        'highlights', array[$$absorption intestinale$$, $$villosités intestinales$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'absorption intestinale est facilitée par les villosités intestinales, qui augmentent la surface d'échange entre l'intestin grêle et le sang.$$),
        'example', jsonb_build_object('statement', $$Pourquoi l'intestin grêle est-il l'organe principal de l'absorption des nutriments ?$$, 'solution', $$Parce que sa paroi interne, tapissée de villosités intestinales, offre une très grande surface de contact avec les nutriments issus de la digestion chimique.$$),
        'fixation', jsonb_build_object('question', $$Que deviennent les substances non digérées qui n'ont pas été absorbées dans l'intestin grêle ?$$, 'solution', $$Elles passent dans le gros intestin, où l'eau est réabsorbée, avant d'être évacuées sous forme de résidus.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Koffi a mangé un repas composé de riz, de sauce à l'arachide et de viande. Explique le trajet et la transformation de ce repas dans son corps.$$,
      'questions', array[
        $$Décris la digestion mécanique subie par ce repas dans la bouche et l'estomac.$$,
        $$Explique comment la digestion chimique transforme les nutriments complexes du repas.$$,
        $$Explique comment les nutriments obtenus passent dans le sang.$$,
        $$Que deviennent les éléments non digérés du repas ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Définis la digestion.$$,
      'hint', $$Pense à la transformation subie par les aliments.$$,
      'expected', $$La digestion est l'ensemble des transformations mécaniques et chimiques que subissent les aliments dans le tube digestif pour être transformés en nutriments assimilables.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le rôle des enzymes digestives ?$$,
      'hint', $$Elles agissent sur les grosses molécules.$$,
      'expected', $$Les enzymes digestives permettent la transformation chimique des molécules complexes des aliments en nutriments simples que l'organisme peut absorber.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi dit-on que l'intestin grêle est le siège principal de l'absorption ?$$,
      'hint', $$Pense à sa paroi interne.$$,
      'expected', $$Parce que sa paroi, couverte de très nombreuses villosités intestinales, offre une grande surface d'échange qui permet le passage efficace des nutriments vers le sang.$$
    ),
    jsonb_build_object(
      'question', $$Cite dans l'ordre les principaux organes du tube digestif.$$,
      'hint', $$Du haut vers le bas.$$,
      'expected', $$Bouche, œsophage, estomac, intestin grêle, gros intestin, anus.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-digestion';
