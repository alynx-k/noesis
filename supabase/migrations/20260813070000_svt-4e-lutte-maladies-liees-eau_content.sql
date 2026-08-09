-- FALLBACK CONTENT: see 20260813000000_svt-4e-transformations-corps-humain_content.sql
-- header for the ecole-ci.org access attempt this session (site-wide
-- login wall). Written from general knowledge of the standard Ivorian
-- 4ème SVT programme (Compétence 4 : la lutte contre les maladies liées
-- à l'eau — accès à l'eau potable, assainissement, hygiène, prévention
-- du contact avec l'eau contaminée, prise en charge). Sensitive
-- public-health topic: kept clinical, factual and non-alarmist, no
-- invented statistics. 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Après la visite de l'infirmier, le village décide d'agir : construire des latrines, protéger le puits et informer les habitants sur les gestes à adopter face aux maladies liées à l'eau. Les élèves cherchent à comprendre quelles actions permettent réellement de limiter ces maladies.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Améliorer l'accès à l'eau potable$$,
        'body', $$La construction de puits protégés, de forages et de réseaux de distribution d'eau potable réduit fortement le risque de boire une eau contaminée. Une eau potable est une eau propre à la consommation, exempte de microorganismes pathogènes et de substances dangereuses.$$,
        'highlights', array[$$eau potable$$, $$forages$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'amélioration de l'accès à l'eau potable, par des puits protégés, des forages ou des réseaux de distribution, réduit fortement le risque des maladies transmises par l'eau contaminée.$$),
        'example', jsonb_build_object('statement', $$Pourquoi un puits protégé, muni d'une margelle et d'un couvercle, est-il plus sûr qu'un puits ouvert ?$$, 'solution', $$Parce que la margelle et le couvercle empêchent les eaux de ruissellement, la poussière et les animaux d'introduire des matières contaminées dans l'eau, ce qui limite les risques de contamination.$$),
        'fixation', jsonb_build_object('question', $$Qu'est-ce qu'une eau potable ?$$, 'solution', $$C'est une eau propre à la consommation, exempte de microorganismes pathogènes et de substances dangereuses pour la santé.$$)
      ),
      jsonb_build_object(
        'heading', $$Améliorer l'assainissement et l'hygiène$$,
        'body', $$La construction et l'utilisation de latrines évitent que les matières fécales contaminent l'environnement et les points d'eau. Le lavage régulier des mains au savon, notamment après être allé aux toilettes et avant de manger, ainsi qu'une bonne hygiène alimentaire, limitent la transmission des microorganismes pathogènes.$$,
        'highlights', array[$$latrines$$, $$lavage des mains$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'utilisation de latrines et le lavage des mains au savon limitent la contamination fécale de l'environnement et la transmission des maladies liées à l'eau.$$),
        'example', jsonb_build_object('statement', $$Pourquoi le lavage des mains au savon après les toilettes est-il un geste important contre les maladies diarrhéiques ?$$, 'solution', $$Parce qu'il élimine les microorganismes pathogènes présents sur les mains, empêchant leur transmission à l'eau, aux aliments ou à d'autres personnes.$$),
        'fixation', jsonb_build_object('question', $$Pourquoi la construction de latrines réduit-elle la contamination de l'eau ?$$, 'solution', $$Parce qu'elle évite que les matières fécales, source de microorganismes pathogènes, se répandent dans l'environnement et atteignent les points d'eau.$$)
      ),
      jsonb_build_object(
        'heading', $$Éviter le contact avec les eaux contaminées$$,
        'body', $$Pour prévenir les maladies transmises par contact, comme la bilharziose, il est recommandé d'éviter de se baigner, de laver le linge ou de pêcher dans des eaux stagnantes connues pour héberger les mollusques hôtes des parasites, et de porter des bottes ou des chaussures lors des activités près de ces eaux.$$,
        'highlights', array[$$prévention du contact$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Éviter le contact direct avec des eaux stagnantes suspectes, ou se protéger la peau lors de ce contact, prévient les maladies transmises par pénétration cutanée comme la bilharziose.$$),
        'example', jsonb_build_object('statement', $$Pourquoi conseiller aux enfants de ne plus se baigner dans la mare du village ?$$, 'solution', $$Parce que cette eau stagnante peut héberger des mollusques porteurs des larves responsables de la bilharziose, qui pénètrent la peau lors d'un simple contact avec l'eau.$$),
        'fixation', jsonb_build_object('question', $$Cite un moyen d'éviter la contamination lors d'activités près d'une eau stagnante à risque.$$, 'solution', $$Éviter le contact direct avec cette eau, ou porter des bottes/chaussures protectrices.$$)
      ),
      jsonb_build_object(
        'heading', $$L'éducation sanitaire et la prise en charge$$,
        'body', $$Les campagnes de sensibilisation informent la population sur les risques liés à l'eau et sur les bons comportements à adopter. En cas de maladie, une prise en charge rapide, par exemple la réhydratation orale en cas de diarrhée, ou un traitement médical adapté, limite les complications.$$,
        'highlights', array[$$éducation sanitaire$$, $$réhydratation orale$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'éducation sanitaire informe sur les comportements préventifs, tandis qu'une prise en charge rapide, comme la réhydratation orale en cas de diarrhée, limite les complications des maladies liées à l'eau.$$),
        'example', jsonb_build_object('statement', $$Pourquoi la réhydratation orale est-elle un geste important en cas de diarrhée sévère ?$$, 'solution', $$Parce qu'elle compense la perte importante d'eau et de sels minéraux causée par la diarrhée, évitant une déshydratation grave en attendant une prise en charge médicale complète si nécessaire.$$),
        'fixation', jsonb_build_object('question', $$Quel est l'intérêt d'une campagne de sensibilisation sur les maladies liées à l'eau ?$$, 'solution', $$Elle informe la population sur les risques et les gestes préventifs à adopter, ce qui contribue à réduire la fréquence de ces maladies dans la communauté.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le village met en place plusieurs actions : construction de latrines, protection du puits, campagne d'information et conseils pour éviter la baignade dans la mare.$$,
      'questions', array[
        $$Explique en quoi la protection du puits réduit les risques sanitaires.$$,
        $$Cite deux gestes d'hygiène qui limitent la transmission des maladies diarrhéiques.$$,
        $$Pourquoi conseille-t-on d'éviter le contact avec certaines eaux stagnantes ?$$,
        $$Quel geste de première urgence permet de limiter les complications d'une diarrhée sévère ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite deux moyens d'améliorer l'accès à l'eau potable dans un village.$$,
      'hint', $$Pense aux points d'eau protégés.$$,
      'expected', $$La construction de puits protégés ou de forages, et la mise en place d'un réseau de distribution d'eau potable.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la construction de latrines est-elle une mesure efficace contre les maladies liées à l'eau ?$$,
      'hint', $$Pense à la contamination fécale de l'environnement.$$,
      'expected', $$Parce qu'elle évite que les matières fécales, sources de microorganismes pathogènes, contaminent l'environnement et les points d'eau.$$
    ),
    jsonb_build_object(
      'question', $$Comment se protéger de la bilharziose lors d'activités près d'une eau stagnante suspecte ?$$,
      'hint', $$Pense au contact direct avec la peau.$$,
      'expected', $$En évitant le contact direct avec cette eau (baignade, lessive, pêche) ou en portant des bottes ou des chaussures protectrices.$$
    ),
    jsonb_build_object(
      'question', $$Que faut-il faire en priorité face à une personne souffrant d'une diarrhée sévère ?$$,
      'hint', $$Pense à compenser les pertes en eau et en sels.$$,
      'expected', $$La réhydrater rapidement, par exemple avec une solution de réhydratation orale, pour compenser les pertes en eau et en sels minéraux, puis consulter un professionnel de santé.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-4e-lutte-maladies-liees-eau';
