-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 6 : "LA SOCIÉTÉ CIVILE ET LE BIEN-ÊTRE DES POPULATIONS"
-- (course/view.php?id=1440, mod/resource id=9692, pluginfile 45275).
-- Rewritten entirely in original wording from the real lesson content
-- (definition, components, principles/rules, importance in democracy,
-- responsible behaviour); no sentence copied verbatim from the source
-- document.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors d'un don de livres à la bibliothèque de son établissement, le président d'une ONG affirme que la société civile se tient toujours aux côtés des populations pour leur bien-être. Des élèves décident de s'informer sur ce qu'est réellement la société civile et sur son rôle en démocratie.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qu'est-ce que la société civile ?$$,
        'body', $$La société civile regroupe l'ensemble des associations volontaires et autonomes créées autour d'un projet d'intérêt commun pour défendre les intérêts des populations. Elle comprend notamment les ONG, les syndicats, les associations religieuses, les mutuelles de développement et les associations professionnelles.$$,
        'highlights', array[$$société civile$$, $$ONG$$, $$syndicats$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La société civile est constituée d'associations autonomes, créées librement autour d'un intérêt commun, pour défendre les intérêts des populations en dehors de l'État.$$),
        'example', jsonb_build_object('statement', $$Une association de quartier collecte des dons pour aider les familles sinistrées après une inondation. Fait-elle partie de la société civile ?$$, 'solution', $$Oui, car il s'agit d'une association volontaire et autonome organisée autour d'un intérêt commun, ce qui correspond à la définition de la société civile.$$)
      ),
      jsonb_build_object(
        'heading', $$Les principes et les règles de la société civile$$,
        'body', $$Les activités des organisations de la société civile doivent rester apolitiques et bénévoles. Leurs membres doivent avoir le sens du service public et rester disponibles pour la cause qu'ils défendent.$$,
        'highlights', array[$$apolitique$$, $$bénévolat$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Principe$$, $$Règle associée$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Activités apolitiques$$, $$Sens du service public$$),
            jsonb_build_array($$Activités bénévoles$$, $$Disponibilité des membres$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi les activités des organisations de la société civile doivent-elles rester apolitiques ?$$, 'solution', $$Pour préserver leur indépendance et leur crédibilité au service de l'intérêt commun, sans être instrumentalisées par des intérêts partisans.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance de la société civile en démocratie$$,
        'body', $$En démocratie, la société civile permet à la population de faire connaître son opinion, participe à l'équilibre des débats, défend les intérêts des citoyens face aux autorités, fait la promotion des valeurs civiques et morales, et mène des actions concrètes de développement, d'éducation, de santé et de protection au profit des populations.$$,
        'highlights', array[$$démocratie$$, $$défense des intérêts$$]::text[],
        'example', jsonb_build_object('statement', $$Une plateforme d'organisations de la société civile organise une marche pacifique pour dénoncer la cherté de la vie. Quel rôle de la société civile cela illustre-t-il ?$$, 'solution', $$Cela illustre son rôle de porte-voix des citoyens, qui lui permet de faire connaître leurs préoccupations et de défendre leurs intérêts auprès des autorités.$$)
      ),
      jsonb_build_object(
        'heading', $$Les comportements responsables face à la société civile$$,
        'body', $$Face à la société civile, un citoyen responsable fait preuve de respect en se conformant à la loi, de tolérance en acceptant les autres comme des égaux, d'honnêteté en reconnaissant les droits et devoirs de chacun, et de solidarité en s'associant à des causes justes. Ces comportements favorisent la paix sociale, la cohésion et le développement économique.$$,
        'highlights', array[$$respect$$, $$tolérance$$, $$solidarité$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi le respect de la liberté d'association est-il un comportement responsable face à la société civile ?$$, 'solution', $$Parce qu'il permet aux organisations de la société civile de mener librement leurs activités au service de l'intérêt commun, ce qui favorise la cohésion sociale.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Une organisation de la société civile dénonce les désagréments causés par des coupures d'électricité répétées et réclame un dédommagement pour les victimes. Certains jeunes du quartier estiment qu'une ONG n'a pas le droit de s'occuper de ce genre de problème et veulent s'y opposer.$$,
      'questions', array[
        $$Identifie le problème posé par la position de ces jeunes.$$,
        $$Cite deux composantes de la société civile.$$,
        $$Explique pourquoi une organisation de la société civile a le droit de défendre les intérêts de la population dans ce cas.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on la société civile ?$$,
      'hint', $$Pense aux associations volontaires et autonomes.$$,
      'expected', $$L'ensemble des associations volontaires et autonomes créées autour d'un projet d'intérêt commun pour défendre les intérêts des populations.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux composantes de la société civile.$$,
      'hint', $$Pense aux ONG, syndicats, associations religieuses.$$,
      'expected', $$Les ONG, les syndicats, les associations religieuses, les mutuelles de développement ou les associations professionnelles (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux principes qui doivent guider les activités de la société civile.$$,
      'hint', $$Pense à l'absence de politique et au bénévolat.$$,
      'expected', $$Les activités doivent être apolitiques et bénévoles.$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance de la société civile en démocratie ?$$,
      'hint', $$Pense à la voix des citoyens et à l'équilibre des débats.$$,
      'expected', $$Elle permet à la population de faire connaître son opinion, participe à l'équilibre des débats et défend les intérêts des citoyens face aux autorités.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-societe-civile';
