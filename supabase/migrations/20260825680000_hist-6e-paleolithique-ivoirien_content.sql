-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Histoire.
-- Cours : "Leçon 1 : Le paléolithique ivoirien" (Thème 2 : La préhistoire
-- de la Côte d'Ivoire). Contenu réécrit à partir du PDF source ;
-- situation d'apprentissage, définitions et exercices reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'un débat organisé par leur école sur la préhistoire en Côte d'Ivoire, un conférencier affirme : « Contrairement à certains pays d'Afrique de l'Est et du Sud, les objets datant du paléolithique sont peu nombreux en Côte d'Ivoire. » Curieux d'en savoir davantage, des élèves de 6ème entreprennent des recherches afin d'identifier les sites et vestiges du paléolithique et de caractériser la civilisation des hommes de cette époque en Côte d'Ivoire.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La préhistoire et le paléolithique$$,
        'body', $$Le passé de l'homme se subdivise en deux grandes périodes : la préhistoire et l'histoire. La préhistoire commence avec l'apparition de l'homme sur Terre (3,5 millions d'années avant J.-C.) et prend fin avec l'invention de l'écriture (an 3000 avant J.-C.). Le paléolithique, ou âge de la pierre taillée, en est la première période. Le paléolithique ivoirien débute à -100 000 et finit à -8000 ; il est connu grâce aux vestiges découverts lors de fouilles archéologiques.$$,
        'highlights', array[$$préhistoire = apparition de l'homme (-3,5 millions) → invention de l'écriture (-3000)$$, $$paléolithique ivoirien : de -100 000 à -8000$$]::text[],
        'fixation', jsonb_build_object('question', $$Qu'est-ce qui marque la fin de la préhistoire ?$$, 'solution', $$L'invention de l'écriture, vers l'an 3000 avant Jésus-Christ.$$)
      ),
      jsonb_build_object(
        'heading', $$Les sites et vestiges du paléolithique ivoirien$$,
        'body', $$Les sites sont les localités où ont été découvertes des traces laissées par les hommes de la préhistoire. En Côte d'Ivoire, on trouve des sites au Nord (Kong, Boundiali, Touba, Séguéla, Fourouna), au Sud (Bingerville, Anyama, Attinguié), à l'Est (Abengourou), au Centre (Béoumi, Toumodi, Bouaké) et à l'Ouest (Foué). Ces sites sont peu nombreux car les recherches archéologiques y sont difficiles. Les vestiges sont les outils, de formes grossières, laissés par ces hommes : galets aménagés, bifaces, racloirs, grattoirs, fragments d'armes, ainsi que des perçoirs, harpons, pointes et flèches, servant à racler, gratter, se défendre et chasser.$$,
        'highlights', array[$$sites répartis dans tout le pays (Nord, Sud, Est, Centre, Ouest) mais peu nombreux$$, $$vestiges : galets aménagés, bifaces, racloirs, grattoirs, fragments d'armes$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les sites du paléolithique sont-ils peu nombreux en Côte d'Ivoire ?$$, 'solution', $$Parce que les recherches archéologiques y sont difficiles (couverture végétale dense, sol acide qui ne conserve pas les ossements, roches de mauvaise qualité).$$),
        'fixation', jsonb_build_object('question', $$Cite deux vestiges du paléolithique ivoirien.$$, 'solution', $$Par exemple : les galets aménagés et les bifaces (deux parmi : racloirs, grattoirs, fragments d'armes).$$)
      ),
      jsonb_build_object(
        'heading', $$La civilisation des hommes au paléolithique$$,
        'body', $$Les hommes du paléolithique pratiquaient la chasse, la cueillette et la pêche ; leurs outils leur permettaient de racler des peaux, de couper du bois ou de la viande. Ils s'abritaient dans des cavernes, des grottes, des huttes ou aux pieds de grands arbres — on les qualifie de troglodytes. Ils étaient nomades, se déplaçant à la recherche de nourriture, et se vêtaient de peaux d'animaux, de feuilles ou d'écorces.$$,
        'highlights', array[$$activités : chasse, cueillette, pêche$$, $$habitat : grottes/cavernes (troglodytes) ; mode de vie : nomade$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi les hommes du paléolithique étaient-ils nomades ?$$, 'solution', $$Parce qu'ils se déplaçaient constamment à la recherche de nourriture.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une visite au Musée des Arts et des Civilisations d'Abidjan, un élève découvre des bifaces et des racloirs de formes grossières exposés dans le rayon consacré à la préhistoire de la Côte d'Ivoire. Le guide affirme : « La taille et le poids de ces outils ont influencé la vie des hommes de cette période. »$$,
      'questions', array[
        $$Dis de quoi il s'agit dans cette situation.$$,
        $$Localise (région) les vestiges évoqués dans la situation.$$,
        $$Es-tu d'accord avec l'affirmation du guide ? Justifie ta réponse.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Le paléolithique ivoirien commence-t-il à -100 000 ou à -3000 ?$$,
      'hint', $$-3000 correspond à l'invention de l'écriture, qui marque la fin de la préhistoire.$$,
      'expected', $$À -100 000.$$
    ),
    jsonb_build_object(
      'question', $$Cite une activité pratiquée par les hommes du paléolithique.$$,
      'hint', $$Ils ne cultivaient pas encore la terre.$$,
      'expected', $$Par exemple : la chasse (ou la cueillette, ou la pêche).$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi appelle-t-on les hommes du paléolithique des "troglodytes" ?$$,
      'hint', $$Pense à leur type d'habitat.$$,
      'expected', $$Parce qu'ils s'abritaient dans des grottes ou des cavernes.$$
    ),
    jsonb_build_object(
      'question', $$Avec quoi les hommes du paléolithique se vêtaient-ils ?$$,
      'hint', $$Ils n'avaient pas de tissu.$$,
      'expected', $$Des peaux d'animaux, des feuilles d'arbres, ou des écorces de bois.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-6e-paleolithique-ivoirien';
