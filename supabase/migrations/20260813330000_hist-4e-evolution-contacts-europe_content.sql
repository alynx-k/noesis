-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the standard
-- Ivorian 4ème Histoire programme on early European contacts with the coast
-- of Côte d'Ivoire (Portuguese exploration, naming of "Côte des Dents" /
-- "Côte d'Ivoire", the French comptoir at Assinie and the Aniaba episode).
-- Kept qualitative/approximate on exact dates not reliably remembered
-- rather than inventing precision. 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En visitant le fort d'Assinie, dans le Sud-Est de la Côte d'Ivoire, une classe de 4ème découvre qu'un comptoir commercial français y existait déjà il y a plusieurs siècles, bien avant la colonisation proprement dite. Comment les premiers contacts entre les peuples de Côte d'Ivoire et les Européens se sont-ils noués et développés, du XVIème au XVIIIème siècle ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les premiers contacts : les explorateurs portugais$$,
        'body', $$Les premiers Européens à longer les côtes de l'actuelle Côte d'Ivoire, à partir du XVème et surtout au XVIème siècle, sont des navigateurs portugais, à la recherche d'une route maritime vers l'Afrique et l'Asie. Frappés par l'abondance de l'ivoire échangé par les populations côtières, ils nomment cette portion de littoral la « Côte des Dents », un nom qui évoluera plus tard en « Côte d'Ivoire ».$$,
        'highlights', array[$$navigateurs portugais$$, $$Côte des Dents$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les premiers contacts entre les peuples de Côte d'Ivoire et les Européens sont établis par des navigateurs portugais à partir du XVIème siècle ; le nom « Côte des Dents », lié au commerce de l'ivoire, évoluera plus tard en « Côte d'Ivoire ».$$),
        'fixation', jsonb_build_object('question', $$Quel nom les premiers navigateurs européens donnent-ils au littoral ivoirien, et pourquoi ?$$, 'solution', $$La « Côte des Dents », en raison de l'importance du commerce de l'ivoire (les dents d'éléphant) pratiqué avec les populations côtières.$$)
      ),
      jsonb_build_object(
        'heading', $$Le développement du commerce et des comptoirs$$,
        'body', $$Après les Portugais, d'autres Européens (Français, Hollandais, Anglais) viennent commercer sur la côte, échangeant des tissus, des armes et divers produits manufacturés contre de l'ivoire, de l'or et, progressivement, des captifs. Des comptoirs commerciaux, points d'échange fixes tenus par des marchands européens avec l'accord de chefs locaux, sont installés en divers points du littoral, notamment à Assinie.$$,
        'highlights', array[$$comptoirs commerciaux$$, $$Assinie$$]::text[],
        'example', jsonb_build_object('statement', $$Qu'est-ce qu'un comptoir commercial et pourquoi les Européens en installent-ils sur le littoral ivoirien ?$$, 'solution', $$C'est un point d'échange fixe tenu par des marchands européens, installé avec l'accord de chefs locaux, pour faciliter le commerce régulier de l'ivoire, de l'or et d'autres marchandises.$$),
        'fixation', jsonb_build_object('question', $$Cite deux produits échangés par les Européens contre l'ivoire et l'or sur la côte ivoirienne.$$, 'solution', $$Des tissus et des armes, par exemple, contre l'ivoire et l'or.$$)
      ),
      jsonb_build_object(
        'heading', $$Le comptoir français d'Assinie et l'épisode Aniaba$$,
        'body', $$À la fin du XVIIème siècle, les Français établissent un comptoir à Assinie et concluent un accord avec le roi local. Dans ce cadre, un jeune noble appelé Aniaba est envoyé en France, où il est reçu à la cour du roi Louis XIV, baptisé et éduqué avant de servir un temps comme officier français, illustrant les liens diplomatiques noués entre les royaumes côtiers et la France.$$,
        'highlights', array[$$comptoir d'Assinie$$, $$Aniaba$$]::text[],
        'example', jsonb_build_object('statement', $$Que révèle l'épisode d'Aniaba sur la nature des premiers contacts entre le royaume d'Assinie et la France ?$$, 'solution', $$Il révèle qu'il existait, au-delà du seul commerce, de véritables relations diplomatiques entre les chefs locaux et la couronne française.$$),
        'fixation', jsonb_build_object('question', $$Où les Français installent-ils un comptoir important sur la côte ivoirienne à la fin du XVIIème siècle ?$$, 'solution', $$À Assinie.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de l'évolution de ces contacts$$,
        'body', $$Ces contacts apportent aux populations côtières de nouveaux produits (tissus, armes à feu, objets métalliques) et favorisent des échanges culturels et diplomatiques. Mais ils marquent aussi, progressivement, le basculement d'un commerce centré sur l'ivoire et l'or vers un commerce de plus en plus tourné vers la traite des captifs, qui prendra une ampleur dramatique aux siècles suivants.$$,
        'highlights', array[$$nouveaux produits$$, $$basculement vers la traite$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel basculement inquiétant s'opère progressivement dans le commerce entre l'Europe et la côte ivoirienne ?$$, 'solution', $$Le commerce, d'abord centré sur l'ivoire et l'or, se tourne progressivement de plus en plus vers la traite des captifs.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un guide fait visiter les vestiges du comptoir d'Assinie à des élèves de 4ème et leur demande de reconstituer l'histoire des contacts entre ce royaume côtier et les Européens.$$,
      'questions', array[
        $$Quel peuple européen établit les tout premiers contacts avec le littoral ivoirien, et à partir de quand ?$$,
        $$Explique l'origine du nom « Côte des Dents » puis « Côte d'Ivoire ».$$,
        $$Qu'est-ce qu'un comptoir commercial ? Cite l'exemple d'Assinie.$$,
        $$Quel basculement s'opère progressivement dans la nature du commerce pratiqué sur cette côte ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quel peuple européen établit les premiers contacts avec le littoral de l'actuelle Côte d'Ivoire ?$$,
      'hint', $$Pense aux navigateurs à la recherche d'une route vers l'Afrique et l'Asie.$$,
      'expected', $$Les navigateurs portugais, à partir du XVIème siècle.$$
    ),
    jsonb_build_object(
      'question', $$D'où vient le nom « Côte des Dents », ancêtre du nom « Côte d'Ivoire » ?$$,
      'hint', $$Pense au commerce pratiqué sur cette côte.$$,
      'expected', $$De l'importance du commerce de l'ivoire (les dents d'éléphant) pratiqué par les populations côtières avec les Européens.$$
    ),
    jsonb_build_object(
      'question', $$Où les Français installent-ils un comptoir commercial important sur la côte ivoirienne à la fin du XVIIème siècle ?$$,
      'hint', $$Pense au lieu où le jeune Aniaba est envoyé en France.$$,
      'expected', $$À Assinie.$$
    ),
    jsonb_build_object(
      'question', $$Quel changement progressif et dramatique s'opère dans le commerce entre l'Europe et la côte ivoirienne au fil du temps ?$$,
      'hint', $$Pense à ce qui remplace peu à peu l'ivoire et l'or comme principale « marchandise ».$$,
      'expected', $$Le commerce se tourne de plus en plus vers la traite des captifs, au détriment du commerce initial de l'ivoire et de l'or.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-4e-evolution-contacts-europe';
