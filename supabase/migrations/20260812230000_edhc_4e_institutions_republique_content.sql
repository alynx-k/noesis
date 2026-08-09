-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 4 : "LES COMPORTEMENTS RESPONSABLES FACE AUX SYMBOLES ET
-- AUX INSTITUTIONS DE LA RÉPUBLIQUE ET LA CONSOLIDATION DE L'AUTORITÉ DE
-- L'ÉTAT" (course/view.php?id=1446, mod/resource id=9752, pluginfile
-- 45341). Rewritten entirely in original wording from the real lesson
-- content (symbols of the Republic, responsible behaviour, the
-- Presidency and Parliament, importance for republican order); no
-- sentence copied verbatim from the source document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Des élèves envisagent de boycotter la cérémonie d'accueil du député de leur circonscription, simplement parce que leurs parents n'ont pas voté pour lui. Pour les amener à changer d'avis, leurs camarades décident de s'informer sur les comportements attendus face aux symboles et aux institutions de la République.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les symboles de la République et comment les respecter$$,
        'body', $$Les symboles de la République sont des signes distinctifs qui la représentent : la devise, les armoiries, l'hymne national, le drapeau et le portrait officiel du président de la République. Les respecter, c'est notamment se recueillir devant le drapeau et pendant l'hymne national, en prendre soin, s'arrêter de marcher quand on l'entend, et s'approprier les valeurs qu'il véhicule.$$,
        'highlights', array[$$symboles de la République$$, $$hymne national$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Les symboles de la République représentent l'unité et l'identité de la Nation ; leur respect par chaque citoyen, notamment lors de leur présentation publique, est un devoir civique.$$),
        'example', jsonb_build_object('statement', $$Des élèves continuent à parler entre eux pendant que l'hymne national retentit lors d'une cérémonie. Ce comportement est-il responsable ?$$, 'solution', $$Non, un comportement responsable exige de se recueillir en silence pendant l'hymne national, en signe de respect envers ce symbole de la République.$$)
      ),
      jsonb_build_object(
        'heading', $$Les institutions de la République$$,
        'body', $$Les institutions de la République sont les structures politiques établies par la loi. Le président de la République est le chef de l'État : il incarne l'unité nationale, veille au respect de la Constitution et dirige le pouvoir exécutif. Le Parlement, composé de l'Assemblée nationale et du Sénat, détient le pouvoir législatif : l'Assemblée nationale, formée des députés, vote les lois et le budget, tandis que le Sénat représente les collectivités.$$,
        'highlights', array[$$institutions de la République$$, $$Assemblée nationale$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Institution$$, $$Rôle principal$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Président de la République$$, $$Chef de l'État, garant de l'unité nationale$$),
            jsonb_build_array($$Assemblée nationale$$, $$Vote des lois et du budget$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Quel rôle joue l'Assemblée nationale au sein du Parlement ?$$, 'solution', $$Elle représente le peuple à travers les députés, vote les lois et le budget de l'État.$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements responsables face aux institutions$$,
        'body', $$Face aux institutions de la République et aux personnalités qui les incarnent, un citoyen responsable fait preuve d'obéissance, de respect et de soumission aux décisions légitimes qui en émanent, même lorsqu'il n'est pas personnellement d'accord avec elles.$$,
        'highlights', array[$$obéissance$$, $$respect des institutions$$]::text[],
        'example', jsonb_build_object('statement', $$Des élèves envisagent de boycotter l'accueil d'un député simplement parce qu'ils n'ont pas voté pour son parti. Ce comportement respecte-t-il les institutions de la République ?$$, 'solution', $$Non, un député élu incarne une institution de la République ; le respect qui lui est dû ne dépend pas des préférences politiques personnelles.$$)
      ),
      jsonb_build_object(
        'heading', $$Pourquoi ce respect est-il important ?$$,
        'body', $$Le respect des institutions et des symboles de la République garantit l'ordre républicain, préserve l'autorité de l'État et assure l'unité, la paix, l'harmonie et le progrès social de tous les citoyens.$$,
        'highlights', array[$$ordre républicain$$, $$autorité de l'État$$]::text[],
        'fixation', jsonb_build_object('question', $$Que risque une communauté qui ne respecte pas ses institutions et symboles nationaux ?$$, 'solution', $$Elle risque de fragiliser l'ordre républicain et l'autorité de l'État, ce qui peut nuire à l'unité et à la paix sociale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un groupe de jeunes envisage de perturber la visite de sensibilisation d'un groupe de députés dans leur commune, uniquement parce que ces députés appartiennent à un parti politique différent du leur.$$,
      'questions', array[
        $$Identifie le problème posé par le projet de ces jeunes.$$,
        $$Cite deux conséquences possibles d'une telle perturbation.$$,
        $$Explique pourquoi les députés doivent être respectés en tant qu'institution, indépendamment de leur parti.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite trois symboles de la République.$$,
      'hint', $$Pense au drapeau, à l'hymne et à la devise.$$,
      'expected', $$Le drapeau, l'hymne national, la devise, les armoiries ou le portrait officiel du président de la République (trois exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Quel est le rôle du président de la République ?$$,
      'hint', $$Pense à l'unité nationale et au pouvoir exécutif.$$,
      'expected', $$Il est le chef de l'État, incarne l'unité nationale, veille au respect de la Constitution et dirige le pouvoir exécutif.$$
    ),
    jsonb_build_object(
      'question', $$Que compose le Parlement et quel pouvoir détient-il ?$$,
      'hint', $$Pense à l'Assemblée nationale et au Sénat.$$,
      'expected', $$Le Parlement est composé de l'Assemblée nationale et du Sénat ; il détient le pouvoir législatif, notamment le vote des lois.$$
    ),
    jsonb_build_object(
      'question', $$Cite un comportement responsable à adopter face aux institutions de la République.$$,
      'hint', $$Pense au respect et à l'obéissance aux décisions légitimes.$$,
      'expected', $$Faire preuve de respect, d'obéissance et de soumission aux décisions légitimes des institutions et des personnalités qui les incarnent.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-institutions-republique';
