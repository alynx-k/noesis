-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the
-- Industrial Revolution (started in Britain mid-18th century, spread to
-- continental Europe and the US in the 19th century: steam engine/James
-- Watt, mechanised textile industry, coal and iron/steel, railways,
-- urbanisation and the industrial working class, ties to colonial
-- expansion). Kept qualitative on production/output figures. 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans un documentaire, une classe de 4ème découvre d'anciennes usines textiles anglaises du XIXème siècle, avec leurs machines à vapeur et leurs ouvriers nombreux, bien différentes des ateliers artisanaux d'autrefois. Comment l'Europe est-elle passée, en quelques décennies, d'une production artisanale à une production industrielle à grande échelle ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les origines de la révolution industrielle$$,
        'body', $$La révolution industrielle débute en Grande-Bretagne au cours du XVIIIème siècle, avant de se diffuser en Europe continentale et aux États-Unis au XIXème siècle. Elle est rendue possible par plusieurs inventions majeures, en particulier la machine à vapeur perfectionnée par James Watt, qui permet de remplacer la force humaine, animale ou hydraulique par une énergie mécanique puissante et régulière.$$,
        'highlights', array[$$révolution industrielle$$, $$machine à vapeur$$, $$James Watt$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La révolution industrielle est la transformation profonde des techniques de production, née en Grande-Bretagne au XVIIIème siècle et fondée notamment sur l'utilisation de la machine à vapeur, qui se diffuse en Europe et aux États-Unis au XIXème siècle.$$),
        'fixation', jsonb_build_object('question', $$Dans quel pays la révolution industrielle débute-t-elle ?$$, 'solution', $$En Grande-Bretagne, au XVIIIème siècle.$$)
      ),
      jsonb_build_object(
        'heading', $$De nouvelles industries et de nouvelles sources d'énergie$$,
        'body', $$L'industrie textile est la première à se mécaniser, avec des machines qui filent et tissent bien plus vite que le travail manuel. Le charbon devient la principale source d'énergie, alimentant les machines à vapeur des usines et des locomotives, tandis que la production de fer puis d'acier se développe fortement. Le chemin de fer, en expansion rapide, transforme les transports de marchandises et de personnes.$$,
        'highlights', array[$$industrie textile$$, $$charbon$$, $$chemin de fer$$]::text[],
        'example', jsonb_build_object('statement', $$Quel rôle joue le charbon dans la révolution industrielle ?$$, 'solution', $$Il constitue la principale source d'énergie, utilisée pour alimenter les machines à vapeur des usines et des locomotives.$$),
        'fixation', jsonb_build_object('question', $$Cite un moyen de transport dont le développement est lié à la révolution industrielle.$$, 'solution', $$Le chemin de fer (les trains à vapeur).$$)
      ),
      jsonb_build_object(
        'heading', $$Les transformations sociales : usines et classe ouvrière$$,
        'body', $$Le travail artisanal à domicile cède progressivement la place au travail en usine, où de nombreux ouvriers travaillent ensemble autour des machines, souvent dans des conditions difficiles (longues journées, bas salaires, travail des enfants). Cette nouvelle organisation du travail fait naître une classe sociale nouvelle et nombreuse, le prolétariat industriel, tandis que les villes industrielles connaissent une croissance rapide (urbanisation).$$,
        'highlights', array[$$classe ouvrière$$, $$urbanisation$$]::text[],
        'example', jsonb_build_object('statement', $$Pourquoi les villes industrielles connaissent-elles une croissance rapide de leur population au XIXème siècle ?$$, 'solution', $$Parce que les usines, installées en ville, attirent de nombreux travailleurs venus des campagnes à la recherche d'un emploi.$$),
        'fixation', jsonb_build_object('question', $$Comment appelle-t-on la nouvelle classe sociale nombreuse née du travail en usine ?$$, 'solution', $$La classe ouvrière, ou le prolétariat industriel.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences mondiales de la révolution industrielle$$,
        'body', $$La révolution industrielle bouleverse l'économie mondiale : les puissances industrielles européennes cherchent des matières premières (coton, caoutchouc, minerais) et de nouveaux marchés pour écouler leurs produits, ce qui contribue à l'expansion coloniale européenne en Afrique et en Asie au XIXème siècle. Elle marque ainsi le début de liens économiques nouveaux, souvent inégaux, entre l'Europe industrialisée et le reste du monde.$$,
        'highlights', array[$$matières premières$$, $$expansion coloniale$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel lien peut-on établir entre la révolution industrielle et l'expansion coloniale européenne du XIXème siècle ?$$, 'solution', $$Les puissances industrielles cherchent des matières premières et de nouveaux marchés, ce qui pousse à la conquête de colonies en Afrique et en Asie.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un historien compare un atelier artisanal du XVIIème siècle à une usine textile britannique du milieu du XIXème siècle, employant des centaines d'ouvriers autour de machines à vapeur.$$,
      'questions', array[
        $$Dans quel pays et à quel siècle débute la révolution industrielle ?$$,
        $$Quelle invention permet de remplacer la force humaine et animale dans les usines ?$$,
        $$Explique comment naît la classe ouvrière avec le développement des usines.$$,
        $$Quel lien existe-t-il entre la révolution industrielle et l'expansion coloniale européenne ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Dans quel pays débute la révolution industrielle, au XVIIIème siècle ?$$,
      'hint', $$C'est une île au nord-ouest de l'Europe.$$,
      'expected', $$En Grande-Bretagne.$$
    ),
    jsonb_build_object(
      'question', $$Quelle invention, perfectionnée par James Watt, symbolise la révolution industrielle ?$$,
      'hint', $$Elle fonctionne grâce au charbon et à l'eau chauffée.$$,
      'expected', $$La machine à vapeur.$$
    ),
    jsonb_build_object(
      'question', $$Quelle industrie est la première à se mécaniser pendant la révolution industrielle ?$$,
      'hint', $$Pense au filage et au tissage.$$,
      'expected', $$L'industrie textile.$$
    ),
    jsonb_build_object(
      'question', $$Comment appelle-t-on la nouvelle classe sociale, nombreuse, née du travail en usine ?$$,
      'hint', $$Pense aux ouvriers d'usine.$$,
      'expected', $$La classe ouvrière (le prolétariat industriel).$$
    )
  ),
  content_generated_at = now()
where id = 'hist-4e-revolution-industrielle';
