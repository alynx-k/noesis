-- Espagnol 4ème, leçon 3/7 : L'échange d'information.
-- ecole-ci.org est maintenant accessible : ce contenu remplace le repli
-- précédent et s'appuie sur les fiches réelles du Collège Numérique
-- (coll.ecole-ci.org, catégorie Espagnol 4ème) pour la compétence "Traiter
-- une situation relative à l'échange d'information" -- Leçon 3 Fiche 1
-- (Poser des questions / répondre : les mots interrogatifs), Fiche 2
-- (Décrire : adjectifs de forme/taille/couleur), Fiche 3 (S'orienter /
-- orienter : adverbes de lieu) et Fiche 4 (Raconter un fait : le présent
-- de l'indicatif pour un fait actuel ou habituel). Formulations, exemples
-- et exercices 100% originaux (paraphrase, jamais de copie des phrases des
-- fiches sources) ; contenu pédagogique en espagnol (immersion
-- linguistique), seule la structure de l'app reste en français.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Trabajas en la radio de tu colegio. Debes hacer preguntas a un compañero sobre un acontecimiento reciente, describir un lugar, orientar a un oyente que busca el colegio, y contar lo que ha pasado en un evento.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Preguntar y responder: las palabras interrogativas$$,
        'body', $$Para obtener información precisa durante una entrevista, necesitas dominar las principales palabras interrogativas del español, y distinguir "preguntar" de "contestar" (o "responder").$$,
        'highlights', array[$$preguntar$$, $$contestar$$, $$adónde$$, $$por qué$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Palabra interrogativa$$, $$Uso$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$¿Adónde...?$$, $$destino de un movimiento$$),
            jsonb_build_array($$¿Dónde...?$$, $$lugar$$),
            jsonb_build_array($$¿Cuándo...?$$, $$momento$$),
            jsonb_build_array($$¿Por qué...?$$, $$causa$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Todas las palabras interrogativas llevan tilde: qué, cómo, cuándo, dónde, adónde, quién/es, cuál/es, por qué. "Preguntar" es la acción de hacer una pregunta; "contestar" y "responder" son sinónimos para reaccionar a una pregunta.$$),
        'example', jsonb_build_object('statement', $$Pregunta a tu compañero adónde va después de las clases.$$, 'solution', $$¿Adónde vas después de las clases?$$),
        'fixation', jsonb_build_object('question', $$Completa con la palabra interrogativa adecuada: ¿___ te llamas tú?$$, 'solution', $$¿Cómo te llamas tú?$$)
      ),
      jsonb_build_object(
        'heading', $$Describir con adjetivos$$,
        'body', $$Transmitir información también significa describir un lugar o un objeto con precisión, usando adjetivos de forma, de tamaño y de color que concuerdan con el sustantivo.$$,
        'highlights', array[$$redondo/a$$, $$alto/a$$, $$limpio/a$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Categoría$$, $$Ejemplos$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$forma$$, $$redondo/a, cuadrado/a$$),
            jsonb_build_array($$tamaño$$, $$alto/a, bajo/a, grande$$),
            jsonb_build_array($$color$$, $$blanco/a, negro/a, azul$$),
            jsonb_build_array($$estado$$, $$limpio/a, sucio/a$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Los adjetivos terminados en -o/-a concuerdan en género y número con el sustantivo: un edificio alto, una casa alta, unas casas altas. Los adjetivos de color como "azul" tienen una sola forma para masculino y femenino, pero sí concuerdan en número: un techo azul, unas paredes azules.$$),
        'example', jsonb_build_object('statement', $$Describe el patio de tu colegio.$$, 'solution', $$El patio de mi colegio es grande y siempre está limpio.$$),
        'fixation', jsonb_build_object('question', $$Completa con el adjetivo en la forma correcta: Las paredes del estudio de radio son ___ (blanco).$$, 'solution', $$Las paredes del estudio de radio son blancas.$$)
      ),
      jsonb_build_object(
        'heading', $$Orientarse y orientar a alguien$$,
        'body', $$Cuando un oyente busca cómo llegar a un lugar, necesitas adverbios de lugar para indicarle el camino con claridad.$$,
        'highlights', array[$$a la derecha$$, $$a la izquierda$$, $$cerca de$$, $$enfrente de$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Adverbio / expresión$$, $$Contrario$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$a la derecha$$, $$a la izquierda$$),
            jsonb_build_array($$cerca de$$, $$lejos de$$),
            jsonb_build_array($$delante de$$, $$detrás de$$),
            jsonb_build_array($$enfrente de$$, $$al lado de$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$Para preguntar por un camino se usan "¿por dónde?" (recorrido), "¿adónde?" (destino) y "¿de dónde?" (procedencia). Para orientar, se dan instrucciones con imperativo o infinitivo: gira a la derecha, sigue todo recto, bajas en la parada del mercado.$$),
        'example', jsonb_build_object('statement', $$Orienta a un oyente que busca la entrada del colegio desde la parada de autobús.$$, 'solution', $$Desde la parada de autobús, sigue todo recto y la entrada del colegio está a la izquierda, enfrente de la farmacia.$$),
        'fixation', jsonb_build_object('question', $$Completa: La biblioteca está ___ (contrario de "lejos de") de la sala de radio.$$, 'solution', $$La biblioteca está cerca de la sala de radio.$$)
      ),
      jsonb_build_object(
        'heading', $$Contar un hecho: el presente de indicativo$$,
        'body', $$Para el boletín de la radio, se cuenta un acontecimiento reciente o habitual usando el presente de indicativo, el tiempo más sencillo y directo para relatar algo que pasa o que suele pasar.$$,
        'highlights', array[$$corren$$, $$empieza$$, $$gritan$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Uso del presente$$, $$Ejemplo$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$hecho actual$$, $$Los jugadores entran en el campo.$$),
            jsonb_build_array($$hecho habitual$$, $$Todos los años, hay una fiesta en el colegio.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Gramática$$, 'text', $$El presente de indicativo sirve tanto para un hecho que ocurre en el momento (un partido que se está jugando) como para un hecho habitual (algo que pasa cada año). Es el tiempo más usado para dar un relato en directo, como en un boletín de radio.$$),
        'example', jsonb_build_object('statement', $$Relata en presente el comienzo de un partido de fútbol del colegio.$$, 'solution', $$Los dos equipos entran en el campo, el árbitro silba y empieza el partido.$$),
        'fixation', jsonb_build_object('question', $$Conjuga en presente: Cada año, los alumnos ___ (celebrar) el fin del curso con una fiesta.$$, 'solution', $$Cada año, los alumnos celebran el fin del curso con una fiesta.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Para el boletín de la radio del colegio, debes hacer una pregunta a un compañero, describir un lugar, orientar a un oyente hacia el colegio, y contar en presente un acontecimiento reciente.$$,
      'questions', array[
        $$Haz una pregunta a un compañero usando una palabra interrogativa.$$,
        $$Describe un lugar del colegio con dos adjetivos.$$,
        $$Orienta a alguien hacia la entrada del colegio.$$,
        $$Cuenta en presente de indicativo un acontecimiento reciente.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Completa con la palabra interrogativa adecuada: ¿___ vive tu familia?$$,
      'hint', $$Preguntas por un lugar.$$,
      'expected', $$¿Dónde vive tu familia?$$
    ),
    jsonb_build_object(
      'question', $$Completa con el adjetivo en la forma correcta: La sala de radio es ___ (pequeño) pero muy ___ (limpio).$$,
      'hint', $$Recuerda hacer concordar el adjetivo con "sala" (femenino singular).$$,
      'expected', $$La sala de radio es pequeña pero muy limpia.$$
    ),
    jsonb_build_object(
      'question', $$Completa con el adverbio de lugar contrario: La cantina no está lejos del patio, está ___ del patio.$$,
      'hint', $$Es el contrario exacto de "lejos de".$$,
      'expected', $$La cantina no está lejos del patio, está cerca del patio.$$
    ),
    jsonb_build_object(
      'question', $$Conjuga en presente de indicativo: Todos los viernes, el club de español ___ (organizar) una actividad.$$,
      'hint', $$Es un hecho habitual, usa el presente.$$,
      'expected', $$Todos los viernes, el club de español organiza una actividad.$$
    )
  ),
  content_generated_at = now()
where id = 'espagnol-4e-echange-information';
