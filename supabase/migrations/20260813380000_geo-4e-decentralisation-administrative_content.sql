-- FALLBACK CONTENT: confirmed absent from the real ecole-ci.org platform —
-- see 20260813300000_hist-4e-mise-en-place-peuples_content.sql header for
-- the re-check details (categoryid=23 browse + site search, no match).
-- Written from general knowledge of the Ivorian
-- 4ème Géographie programme on administrative decentralization (elected
-- local collectivités territoriales — communes, régions, districts
-- autonomes — as distinct from the State's own deconcentrated
-- representatives covered in the previous lesson). Kept qualitative on the
-- exact current number of communes/régions, which changes over time.
-- 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans sa commune, la famille de Mariam a voté pour élire son maire et ses conseillers municipaux, qui décident eux-mêmes de la construction d'un nouveau marché avec le budget de la commune. Mariam remarque que ce maire n'est pas nommé par l'État, contrairement au préfet de son département. Quelle est la différence entre ces deux façons d'administrer le territoire ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la décentralisation administrative ?$$,
        'body', $$La décentralisation administrative est le transfert de compétences et de moyens de l'État vers des collectivités territoriales dotées d'une personnalité juridique propre, d'un budget propre et d'organes élus par les populations. Contrairement à la déconcentration, les autorités décentralisées ne sont pas de simples agents de l'État : elles disposent d'une réelle autonomie de décision dans leur domaine de compétence.$$,
        'highlights', array[$$décentralisation$$, $$collectivités territoriales$$, $$autonomie$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La décentralisation administrative est le transfert de compétences et de moyens de l'État vers des collectivités territoriales élues, dotées de la personnalité juridique et d'une autonomie de décision, à la différence des représentants déconcentrés de l'État.$$),
        'fixation', jsonb_build_object('question', $$Quelle est la principale différence entre une autorité décentralisée et un représentant déconcentré de l'État ?$$, 'solution', $$L'autorité décentralisée est élue et dispose d'une autonomie de décision propre, alors que le représentant déconcentré est un agent de l'État qui agit en son nom.$$)
      ),
      jsonb_build_object(
        'heading', $$Les collectivités territoriales de Côte d'Ivoire$$,
        'body', $$Les principales collectivités territoriales de Côte d'Ivoire sont la commune, dirigée par un maire et un conseil municipal élus, et la région, en tant que collectivité territoriale, dirigée par un président de conseil régional. Certaines grandes agglomérations, comme Abidjan et Yamoussoukro, ont un statut particulier de district autonome.$$,
        'highlights', array[$$commune$$, $$région$$, $$district autonome$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Collectivité territoriale$$, $$Organe élu$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Commune$$, $$Maire et conseil municipal$$),
            jsonb_build_array($$Région$$, $$Président et conseil régional$$),
            jsonb_build_array($$District autonome (ex. Abidjan)$$, $$Gouverneur et conseil du district$$)
          )
        ),
        'example', jsonb_build_object('statement', $$Qui dirige une commune de Côte d'Ivoire, et comment cette personne accède-t-elle à sa fonction ?$$, 'solution', $$Un maire, élu par les habitants de la commune, assisté d'un conseil municipal également élu.$$),
        'fixation', jsonb_build_object('question', $$Cite deux collectivités territoriales de Côte d'Ivoire.$$, 'solution', $$La commune et la région ; on peut aussi citer le district autonome.$$)
      ),
      jsonb_build_object(
        'heading', $$Les compétences des collectivités décentralisées$$,
        'body', $$Les collectivités territoriales gèrent des domaines qui touchent directement la vie quotidienne des populations : voirie et marchés locaux, écoles primaires, centres de santé communautaires, état civil, gestion de l'eau et de l'assainissement local, et développement économique local, avec un budget propre alimenté notamment par les impôts locaux et les subventions de l'État.$$,
        'highlights', array[$$compétences locales$$, $$budget propre$$]::text[],
        'example', jsonb_build_object('statement', $$Cite un domaine géré directement par une commune plutôt que par l'État central.$$, 'solution', $$Par exemple la voirie et les marchés locaux, ou l'état civil, ou la gestion des écoles primaires communales.$$),
        'fixation', jsonb_build_object('question', $$D'où proviennent les ressources financières d'une collectivité décentralisée ?$$, 'solution', $$Principalement des impôts locaux et des subventions de l'État.$$)
      ),
      jsonb_build_object(
        'heading', $$Les avantages de la décentralisation$$,
        'body', $$La décentralisation favorise la démocratie locale en donnant aux populations le pouvoir de choisir leurs dirigeants locaux, elle permet une meilleure prise en compte des besoins spécifiques de chaque localité, et elle encourage la participation citoyenne au développement de son propre territoire.$$,
        'highlights', array[$$démocratie locale$$, $$participation citoyenne$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le principal avantage démocratique de la décentralisation ?$$, 'solution', $$Elle permet aux populations d'élire elles-mêmes leurs dirigeants locaux et de participer davantage aux décisions concernant leur territoire.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Les habitants d'une commune se réunissent pour discuter du budget voté par leur conseil municipal, destiné à financer la réhabilitation d'un marché local.$$,
      'questions', array[
        $$Définis la décentralisation administrative.$$,
        $$Cite deux collectivités territoriales décentralisées de Côte d'Ivoire.$$,
        $$Explique d'où provient le budget géré par le conseil municipal.$$,
        $$Cite un avantage démocratique de la décentralisation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Qu'est-ce que la décentralisation administrative ?$$,
      'hint', $$Pense au transfert de pouvoirs vers des collectivités élues et autonomes.$$,
      'expected', $$Le transfert de compétences et de moyens de l'État vers des collectivités territoriales élues, disposant d'une autonomie de décision propre.$$
    ),
    jsonb_build_object(
      'question', $$Qui dirige une commune ivoirienne, et comment cette personne accède-t-elle à sa fonction ?$$,
      'hint', $$Pense à une élection locale.$$,
      'expected', $$Un maire, élu par les habitants de la commune.$$
    ),
    jsonb_build_object(
      'question', $$Cite une compétence gérée par une commune plutôt que par l'État central.$$,
      'hint', $$Pense à la vie quotidienne locale.$$,
      'expected', $$Par exemple la voirie et les marchés locaux, ou l'état civil.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la principale différence entre décentralisation et déconcentration ?$$,
      'hint', $$Pense à l'élection et à l'autonomie de décision.$$,
      'expected', $$Dans la décentralisation, les autorités sont élues et autonomes, alors que dans la déconcentration, ce sont des agents nommés par l'État qui agissent en son nom.$$
    )
  ),
  content_generated_at = now()
where id = 'geo-4e-decentralisation-administrative';
