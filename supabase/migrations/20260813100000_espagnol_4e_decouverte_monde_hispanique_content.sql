-- Espagnol 4ème, leçon 1/7 : La découverte du monde hispanique.
-- ecole-ci.org est maintenant accessible (session élève fonctionnelle) : ce
-- contenu remplace le repli précédent et s'appuie sur les fiches réelles du
-- Collège Numérique (coll.ecole-ci.org, catégorie Espagnol 4ème) pour la
-- compétence "Traiter une situation relative à la découverte du monde
-- hispanique" -- Leçon 1 Fiche 1 (La découverte de l'Espagne : frontières,
-- Communautés Autonomes, prononciation des sons c/ch/g/j/ll/ñ/rr/y/z),
-- Fiche 2 (Localisation des pays de l'Amérique hispanique : indígena,
-- idioma, règle générale de l'accent tonique) et Fiche 3 (Présentation de
-- la Guinée Équatoriale : madera, turismo, règle de l'accent écrit/tilde).
-- Formulations, exemples et exercices 100% originaux (paraphrase, jamais de
-- copie des phrases des fiches sources) ; contenu pédagogique en espagnol
-- (immersion linguistique), seule la structure de l'app reste en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$El club de español de tu colegio prepara una exposición sobre "El mundo hispánico" para la semana cultural. Debes presentar España, un país de la América hispánica y Guinea Ecuatorial, y explicar a los visitantes cómo se pronuncia correctamente el español.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$España: fronteras y Comunidades Autónomas$$,
        'body', $$Para presentar un país con precisión, necesitas vocabulario de geografía política: la frontera (o límite) con otros países, y la manera en que España organiza su territorio en Comunidades Autónomas.$$,
        'highlights', array[$$la frontera$$, $$la Comunidad Autónoma$$, $$una ciudad$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Comunidad Autónoma$$, $$Ciudad importante$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Andalucía$$, $$Sevilla$$),
            jsonb_build_array($$Cataluña$$, $$Barcelona$$),
            jsonb_build_array($$Comunidad de Madrid$$, $$Madrid$$),
            jsonb_build_array($$Galicia$$, $$La Coruña$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Se dice "tener frontera con" + país. España tiene frontera terrestre con Portugal, Francia, Andorra y Marruecos, y también, de forma indirecta, con el Reino Unido "a través de" Gibraltar. "Comunidad Autónoma" es femenino: una Comunidad Autónoma, la Comunidad de Madrid.$$),
        'example', jsonb_build_object('statement', $$Explica con qué países tiene frontera España.$$, 'solution', $$España tiene frontera con Portugal, Francia, Andorra y Marruecos, y también con el Reino Unido a través de Gibraltar.$$),
        'fixation', jsonb_build_object('question', $$Completa: Cataluña es una ___ de España cuya capital es Barcelona.$$, 'solution', $$Cataluña es una Comunidad Autónoma de España cuya capital es Barcelona.$$)
      ),
      jsonb_build_object(
        'heading', $$Sonidos especiales del español: c, ch, g, j, ll, ñ, rr, y, z$$,
        'body', $$Antes de presentar oralmente un país, debes dominar los sonidos que no existen en francés: son letras y dígrafos con una pronunciación particular, muy distinta de su equivalente escrito en otros idiomas.$$,
        'highlights', array[$$la eñe$$, $$la jota$$, $$la doble erre$$, $$la elle$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Letra / dígrafo$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$c (ante e, i)$$, $$cinco$$),
            jsonb_build_array($$g (ante e, i) / j$$, $$gente, jardín$$),
            jsonb_build_array($$ll$$, $$llamar$$),
            jsonb_build_array($$ñ$$, $$español$$),
            jsonb_build_array($$rr$$, $$perro$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$La "ñ" es una consonante nasal palatal, distinta de "n". La "rr" (y la "r" a principio de palabra) es un sonido vibrante múltiple, más fuerte que la "r" simple entre vocales. "G" y "j" delante de "e" o "i" producen un sonido gutural aspirado. "Ll" y "y" suenan de forma palatal, parecida en muchas zonas hispanohablantes.$$),
        'example', jsonb_build_object('statement', $$Explica el sonido especial de la palabra "cañón".$$, 'solution', $$La palabra "cañón" contiene una "ñ", consonante nasal palatal que no existe en francés.$$),
        'fixation', jsonb_build_object('question', $$Subraya las letras de pronunciación especial en "el niño lleva un zapato rojo".$$, 'solution', $$El niño lleva un zapato rojo: las letras especiales son ñ, ll, z y j.$$)
      ),
      jsonb_build_object(
        'heading', $$Hispanoamérica: vocabulario y el acento tónico$$,
        'body', $$Para hablar de los países de la América hispánica, necesitas vocabulario como "indígena" o "idioma", y también dos reglas generales para saber en qué sílaba de una palabra recae la fuerza de la voz, sin necesidad de tilde escrita.$$,
        'highlights', array[$$un indígena$$, $$un idioma$$, $$la sílaba tónica$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra$$, $$Termina en$$, $$Sílaba tónica$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$amigo$$, $$vocal$$, $$penúltima (a-MI-go)$$),
            jsonb_build_array($$hablan$$, $$consonante n$$, $$penúltima (HA-blan)$$),
            jsonb_build_array($$ciudad$$, $$consonante d$$, $$última (ciu-DAD)$$),
            jsonb_build_array($$profesor$$, $$consonante r$$, $$última (profe-SOR)$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Regla 1: las palabras terminadas en vocal, o en las consonantes "n" o "s", llevan el acento tónico en la penúltima sílaba. Regla 2: las palabras terminadas en cualquier otra consonante llevan el acento tónico en la última sílaba. Ninguna de las dos necesita tilde escrita, porque siguen la regla general.$$),
        'example', jsonb_build_object('statement', $$Indica la sílaba tónica de "profesor" y explica por qué.$$, 'solution', $$"Profesor" termina en "r", una consonante distinta de n/s, así que el acento tónico cae en la última sílaba: profe-SOR.$$),
        'fixation', jsonb_build_object('question', $$¿En qué sílaba recae el acento tónico de "hablan"?$$, 'solution', $$"Hablan" termina en "n", así que el acento tónico cae en la penúltima sílaba: HA-blan.$$)
      ),
      jsonb_build_object(
        'heading', $$Guinea Ecuatorial y el acento escrito (la tilde)$$,
        'body', $$Guinea Ecuatorial, único país africano donde el español es lengua oficial, te permite descubrir palabras como "madera" o "turismo", y sobre todo una tercera regla: qué hacer cuando una palabra no respeta las dos reglas generales de acentuación.$$,
        'highlights', array[$$la tilde$$, $$el acento escrito$$, $$la madera$$, $$el turismo$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra$$, $$Por qué lleva tilde$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$América$$, $$esdrújula (a-MÉ-ri-ca), rompe la regla$$),
            jsonb_build_array($$Panamá$$, $$termina en vocal pero se acentúa en la última sílaba$$),
            jsonb_build_array($$indígena$$, $$esdrújula (in-DÍ-ge-na), rompe la regla$$),
            jsonb_build_array($$petróleo$$, $$esdrújula (pe-TRÓ-le-o), rompe la regla$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Cuando una palabra no sigue ninguna de las dos reglas generales de acentuación (vistas en la sección anterior), su sílaba tónica lleva una tilde escrita. Es el caso de casi todas las palabras esdrújulas (acentuadas en la antepenúltima sílaba), y de algunas palabras terminadas en vocal cuyo acento cae, excepcionalmente, en la última sílaba.$$),
        'example', jsonb_build_object('statement', $$Explica por qué "Panamá" lleva tilde.$$, 'solution', $$"Panamá" termina en vocal, así que por la regla general el acento debería caer en la penúltima sílaba, pero en realidad se pronuncia Pa-na-MÁ; como no sigue la regla, necesita tilde escrita.$$),
        'fixation', jsonb_build_object('question', $$¿Por qué "indígena" lleva tilde?$$, 'solution', $$"Indígena" es una palabra esdrújula (el acento cae en la antepenúltima sílaba: in-DÍ-ge-na), lo cual no sigue ninguna de las dos reglas generales, así que necesita tilde.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Para la exposición "El mundo hispánico" de tu colegio, debes localizar España, pronunciar correctamente una palabra con un sonido especial, aplicar la regla del acento tónico, y presentar Guinea Ecuatorial explicando por qué una de sus palabras clave lleva tilde.$$,
      'questions', array[
        $$Localiza España y cita dos países con los que tiene frontera.$$,
        $$Pronuncia una palabra con "ñ" o "rr" y explica su sonido especial.$$,
        $$Da la sílaba tónica de una palabra que termine en una consonante distinta de n/s.$$,
        $$Explica por qué una palabra esdrújula necesita tilde escrita.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa: España tiene frontera con Portugal, Francia, Andorra y ___ (país africano).$$,
      'hint', $$Es el país que separa España de África por el estrecho de Gibraltar.$$,
      'expected', $$España tiene frontera con Portugal, Francia, Andorra y Marruecos.$$
    ),
    jsonb_build_object(
      'question', $$¿Qué tiene de especial el sonido de la doble "rr" en la palabra "perro"?$$,
      'hint', $$Compárala con la "r" simple entre vocales.$$,
      'expected', $$La "rr" es un sonido vibrante múltiple, más fuerte que la "r" simple.$$
    ),
    jsonb_build_object(
      'question', $$Indica la sílaba tónica de "ciudad" y explica la regla que se aplica.$$,
      'hint', $$"Ciudad" termina en una consonante distinta de n y de s.$$,
      'expected', $$"Ciudad" termina en "d", así que el acento tónico cae en la última sílaba: ciu-DAD.$$
    ),
    jsonb_build_object(
      'question', $$¿Por qué la palabra "México" lleva tilde?$$,
      'hint', $$Cuenta las sílabas y localiza dónde cae la fuerza de la voz.$$,
      'expected', $$"México" es una palabra esdrújula (el acento cae en la antepenúltima sílaba: MÉ-xi-co), lo cual no sigue las reglas generales de acentuación, por eso necesita tilde escrita.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-decouverte-monde-hispanique';
