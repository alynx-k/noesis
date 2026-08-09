-- Fallback content (not sourced from ecole-ci.org): same site-wide login
-- wall as the other EDHC files in this batch (see 20260810000000). Written
-- from general knowledge of the standard Ivorian 3ème EDHC programme on
-- legal protection against violence toward vulnerable people, in 100%
-- original wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Dans le village de Kouassi, une fillette de 10 ans est régulièrement battue par sa tutrice. Une voisine hésite à intervenir, ne sachant pas quels recours existent pour protéger l'enfant. La classe étudie les instruments et mécanismes qui permettent de protéger les personnes vulnérables contre la violence.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qui sont les personnes vulnérables ?$$,
        'body', $$Une personne vulnérable est une personne qui, en raison de son âge, de son sexe, de son handicap ou de sa situation sociale, a plus de difficulté à se défendre seule contre les abus. Les enfants, les femmes, les personnes âgées et les personnes en situation de handicap en font partie.$$,
        'highlights', array[$$personne vulnérable$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Catégorie$$, $$Exemple de violence subie$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Enfants$$, $$Maltraitance, mariage précoce, travail forcé$$),
            jsonb_build_array($$Femmes$$, $$Violences conjugales, excision$$),
            jsonb_build_array($$Personnes âgées ou handicapées$$, $$Abandon, exclusion, maltraitance$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi un enfant est-il considéré comme une personne vulnérable ?$$, 'solution', $$Parce qu'il dépend des adultes pour sa sécurité et n'a pas encore les moyens physiques, juridiques ou économiques de se défendre seul.$$)
      ),
      jsonb_build_object(
        'heading', $$Les instruments juridiques nationaux$$,
        'body', $$La Côte d'Ivoire dispose de lois qui interdisent et sanctionnent les violences faites aux personnes vulnérables, notamment le Code pénal ivoirien et le Code de l'enfant, ainsi qu'un ministère chargé de la famille, de la femme et de l'enfant qui coordonne les actions de protection.$$,
        'highlights', array[$$instruments juridiques nationaux$$, $$Code pénal$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un instrument juridique est un texte de loi ou une convention qui fixe des droits, interdit certains comportements et prévoit des sanctions ; il donne une base légale pour agir contre la violence.$$),
        'example', jsonb_build_object('statement', $$Un homme frappe régulièrement son épouse. Quel type d'instrument juridique permet de le poursuivre en justice ?$$, 'solution', $$Le Code pénal ivoirien, qui sanctionne les violences physiques, y compris au sein du couple.$$)
      ),
      jsonb_build_object(
        'heading', $$Les instruments juridiques internationaux$$,
        'body', $$Au niveau international, la Convention internationale des droits de l'enfant et la Charte africaine des droits et du bien-être de l'enfant engagent les États, dont la Côte d'Ivoire, à protéger les enfants contre toute forme de violence, d'exploitation et de négligence.$$,
        'highlights', array[$$Convention internationale des droits de l'enfant$$]::text[],
        'fixation', jsonb_build_object('question', $$Quel est le rôle d'une convention internationale ratifiée par un pays ?$$, 'solution', $$Elle engage ce pays à respecter et à faire appliquer, dans ses propres lois, les droits qu'elle énonce.$$)
      ),
      jsonb_build_object(
        'heading', $$Les mécanismes de protection et les recours possibles$$,
        'body', $$Pour agir concrètement, il existe des mécanismes comme les services sociaux, la police et la gendarmerie, les centres d'écoute, les associations de défense des droits humains, et des lignes téléphoniques d'urgence permettant de signaler une violence.$$,
        'highlights', array[$$mécanismes de protection$$, $$signaler une violence$$]::text[],
        'example', jsonb_build_object('statement', $$La voisine de la fillette battue veut agir sans se mettre en danger. Que peut-elle faire concrètement ?$$, 'solution', $$Elle peut alerter les services sociaux, la police/gendarmerie, ou une association de protection de l'enfance, qui ont les moyens légaux d'intervenir.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un enseignant remarque que l'un de ses élèves porte souvent des marques de coups et semble craintif. Il veut agir sans se tromper de procédure.$$,
      'questions', array[
        $$Identifie la ou les personnes vulnérables concernées dans cette situation.$$,
        $$Cite un instrument juridique qui protège cet élève.$$,
        $$Indique deux mécanismes ou structures que l'enseignant peut solliciter pour protéger l'élève.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Donne la définition d'une personne vulnérable et cite deux catégories concernées.$$,
      'hint', $$Pense à ce qui rend une personne moins capable de se défendre seule.$$,
      'expected', $$Une personne vulnérable a plus de difficulté à se défendre seule face aux abus, en raison de son âge, son sexe, son handicap ou sa situation sociale ; par exemple les enfants et les femmes (ou les personnes âgées/handicapées).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est la différence entre un instrument juridique national et un instrument juridique international ?$$,
      'hint', $$Pense à l'échelle d'application : un seul pays ou plusieurs États.$$,
      'expected', $$Un instrument national (comme le Code pénal ivoirien) s'applique dans un seul pays, tandis qu'un instrument international (comme la Convention des droits de l'enfant) engage plusieurs États qui l'ont ratifié.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux mécanismes concrets qui permettent de signaler ou de faire cesser une violence faite à une personne vulnérable.$$,
      'hint', $$Pense aux autorités et aux structures d'aide.$$,
      'expected', $$Par exemple : alerter la police/gendarmerie, saisir les services sociaux, contacter une association de protection, ou utiliser une ligne d'urgence.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi est-il important que la loi sanctionne les violences faites aux personnes vulnérables ?$$,
      'hint', $$Pense à la dissuasion et à la protection effective des victimes.$$,
      'expected', $$Parce que la sanction dissuade les auteurs de violence, protège les victimes et affirme que ces actes ne sont pas tolérés par la société.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-protection-vulnerables';
