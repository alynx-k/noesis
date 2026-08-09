-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (l'infection au VIH : le virus, modes de transmission, prévention et
-- dépistage). Sensitive topic: kept clinical, factual and non-alarmist, no
-- invented statistics. Transmission routes (blood, sexual, mother-to-child)
-- and the fact that everyday contact does not transmit HIV are standard,
-- carefully checked medical facts. 100% original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'une campagne de sensibilisation à l'école, une infirmière explique aux élèves ce qu'est le VIH, comment il se transmet, et comment chacun peut s'en protéger.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que le VIH et le sida$$,
        'body', $$Le VIH, virus de l'immunodéficience humaine, infecte et détruit progressivement certains globules blancs qui défendent l'organisme. Lorsque ces défenses sont très diminuées, la personne développe le sida, stade où l'organisme devient vulnérable à de nombreuses maladies.$$,
        'highlights', array[$$VIH$$, $$sida$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le VIH infecte et détruit progressivement certains globules blancs, affaiblissant les défenses de l'organisme ; lorsque ces défenses sont très diminuées, la personne développe le sida.$$),
        'example', jsonb_build_object('statement', $$Quelle est la différence entre être infecté par le VIH et avoir le sida ?$$, 'solution', $$Une personne infectée par le VIH peut rester en bonne santé apparente pendant des années ; le sida correspond au stade avancé de l'infection, lorsque le système immunitaire est très affaibli.$$),
        'fixation', jsonb_build_object('question', $$Quelles cellules du sang le VIH attaque-t-il principalement ?$$, 'solution', $$Certains globules blancs, qui jouent un rôle clé dans la défense de l'organisme.$$)
      ),
      jsonb_build_object(
        'heading', $$Les modes de transmission$$,
        'body', $$Le VIH se transmet essentiellement de trois façons : par le sang, par voie sexuelle lors de rapports non protégés, et de la mère à l'enfant pendant la grossesse, l'accouchement ou l'allaitement. Il ne se transmet pas par les gestes de la vie quotidienne comme une poignée de main ou un repas partagé.$$,
        'highlights', array[$$transmission sanguine$$, $$transmission sexuelle$$, $$transmission mère-enfant$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le VIH se transmet par le sang, par voie sexuelle et de la mère à l'enfant ; il ne se transmet pas par les contacts de la vie courante.$$),
        'example', jsonb_build_object('statement', $$Le partage d'un repas avec une personne séropositive présente-t-il un risque de transmission du VIH ?$$, 'solution', $$Non, le VIH ne se transmet pas par les contacts de la vie courante comme le partage d'un repas, d'un verre ou une poignée de main.$$),
        'fixation', jsonb_build_object('question', $$Cite les trois principales voies de transmission du VIH.$$, 'solution', $$La voie sanguine, la voie sexuelle et la transmission de la mère à l'enfant.$$)
      ),
      jsonb_build_object(
        'heading', $$La prévention et le dépistage$$,
        'body', $$La prévention du VIH repose sur des comportements responsables : abstinence, fidélité mutuelle, usage correct du préservatif, utilisation de matériel médical stérile, et dépistage volontaire, qui est le seul moyen de connaître son statut sérologique.$$,
        'highlights', array[$$prévention$$, $$dépistage$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La prévention du VIH repose sur des comportements responsables (abstinence, fidélité, préservatif, matériel médical stérile) et sur le dépistage, seul moyen de connaître son statut sérologique.$$),
        'example', jsonb_build_object('statement', $$Pourquoi le dépistage est-il un élément important de la lutte contre le VIH ?$$, 'solution', $$Parce qu'il permet à une personne de connaître son statut sérologique, d'accéder rapidement à une prise en charge médicale si elle est infectée, et d'adopter des comportements pour éviter de transmettre le virus.$$),
        'fixation', jsonb_build_object('question', $$Cite deux moyens de prévention de la transmission sexuelle du VIH.$$, 'solution', $$L'abstinence et l'usage correct du préservatif, ou la fidélité mutuelle entre partenaires non infectés.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors de la campagne de sensibilisation, un élève demande si l'on peut attraper le VIH en serrant la main d'une personne séropositive ou en partageant ses affaires de classe.$$,
      'questions', array[
        $$Explique pourquoi ce type de contact ne transmet pas le VIH.$$,
        $$Rappelle les trois principales voies de transmission du VIH.$$,
        $$Cite deux comportements permettant de se protéger d'une transmission sexuelle du virus.$$,
        $$Explique l'intérêt du dépistage pour une personne et pour la société.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Que signifie VIH et quel est son effet sur l'organisme ?$$,
      'hint', $$Pense aux globules blancs.$$,
      'expected', $$VIH signifie virus de l'immunodéficience humaine ; il infecte et détruit progressivement certains globules blancs, affaiblissant les défenses immunitaires de l'organisme.$$
    ),
    jsonb_build_object(
      'question', $$Cite les trois principales voies de transmission du VIH.$$,
      'hint', $$Sang, sexualité, grossesse.$$,
      'expected', $$La voie sanguine, la voie sexuelle, et la transmission de la mère à l'enfant pendant la grossesse, l'accouchement ou l'allaitement.$$
    ),
    jsonb_build_object(
      'question', $$Le VIH se transmet-il par une poignée de main ou un repas partagé ? Justifie.$$,
      'hint', $$Pense au mode réel de transmission.$$,
      'expected', $$Non, le VIH ne se transmet pas par les gestes de la vie courante comme une poignée de main ou un repas partagé ; il nécessite un contact avec du sang ou des sécrétions sexuelles, ou survient lors de la grossesse ou de l'allaitement.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le préservatif est-il un moyen efficace de prévention ?$$,
      'hint', $$Pense à la barrière physique lors du rapport sexuel.$$,
      'expected', $$Parce qu'il constitue une barrière qui empêche le contact direct entre les sécrétions sexuelles des partenaires lors du rapport, réduisant fortement le risque de transmission du virus.$$
    )
  ),
  content_generated_at = now()
where id = 'svt-infection-vih';
