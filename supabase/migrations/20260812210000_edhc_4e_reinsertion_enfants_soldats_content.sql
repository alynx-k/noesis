-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 2 : "LA LUTTE CONTRE LE RECRUTEMENT DES ENFANTS-SOLDATS
-- ET LA PRÉSERVATION DE LA PAIX SOCIALE" (course/view.php?id=1451,
-- mod/resource id=9824, pluginfile 45420). Rewritten entirely in original
-- wording from the real lesson content (causes of recruitment, individual
-- and social consequences, conditions for reintegration); treated
-- factually and respectfully, without inventing statistics or case
-- details beyond what the lesson itself states.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Un ancien combattant encore adolescent vient s'installer dans un quartier. Les habitants, mal à l'aise, hésitent à l'approcher. Des élèves décident de s'informer sur ce que vivent les enfants-soldats et sur les moyens de les aider à retrouver une place dans la société.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Qui sont les enfants-soldats et pourquoi sont-ils recrutés ?$$,
        'body', $$Un enfant-soldat est un membre d'un groupe armé âgé de moins de seize ans. Du côté des groupes armés, ce recrutement répond à un besoin de combattants, à la volonté d'utiliser des enfants comme boucliers humains, ou à leur docilité plus grande. Du côté des enfants eux-mêmes, certains rejoignent ces groupes par recherche de sécurité, par désir de vengeance, ou simplement par insouciance face au danger.$$,
        'highlights', array[$$enfant-soldat$$, $$recrutement$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Est considéré comme enfant-soldat tout membre de moins de seize ans d'un groupe armé, quelles que soient les raisons, volontaires ou non, de son recrutement.$$),
        'example', jsonb_build_object('statement', $$Un adolescent de quatorze ans rejoint un groupe armé en pensant y trouver une protection contre l'insécurité de son quartier. Cela correspond-il à l'une des causes connues du recrutement ?$$, 'solution', $$Oui, la recherche de sécurité est l'une des raisons qui peuvent pousser un enfant à se faire recruter par un groupe armé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conséquences de l'utilisation des enfants-soldats$$,
        'body', $$Au niveau individuel, l'enfant-soldat peut subir des traumatismes liés aux horreurs vécues, des mutilations, sombrer dans la délinquance, ou perdre une partie de son humanité face à la violence, allant parfois jusqu'à la mort. Au niveau social, cette pratique alimente l'insécurité dans les communautés concernées.$$,
        'highlights', array[$$traumatisme$$, $$insécurité sociale$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Niveau$$, $$Conséquence$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Individuel$$, $$Traumatismes, mutilations, délinquance$$),
            jsonb_build_array($$Social$$, $$Insécurité au sein de la communauté$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Pourquoi peut-on dire que l'utilisation d'enfants-soldats fragilise la sécurité de toute une communauté ?$$, 'solution', $$Parce qu'elle favorise la violence et la délinquance, ce qui installe un climat d'insécurité qui dépasse le seul enfant concerné et touche l'ensemble du groupe social.$$)
      ),
      jsonb_build_object(
        'heading', $$Les conditions d'une bonne réinsertion$$,
        'body', $$Pour réussir la réinsertion d'un enfant-soldat, il faut l'associer aux activités normales des autres enfants, éviter de le stigmatiser, ne pas lui rappeler sans cesse les atrocités vécues, l'orienter vers l'apprentissage d'un métier, l'encourager à participer à des travaux d'intérêt public, et si possible le remettre à l'école.$$,
        'highlights', array[$$réinsertion$$, $$non-stigmatisation$$]::text[],
        'example', jsonb_build_object('statement', $$Un ancien enfant-soldat revient dans son quartier et un voisin lui propose de l'aider à apprendre un métier plutôt que de l'éviter. Cette attitude correspond-elle à une bonne pratique de réinsertion ?$$, 'solution', $$Oui, l'initiation à un métier fait partie des conditions reconnues pour favoriser la réinsertion d'un enfant-soldat.$$)
      ),
      jsonb_build_object(
        'heading', $$L'engagement de chacun pour la paix sociale$$,
        'body', $$La lutte contre le recrutement des enfants-soldats et leur réinsertion réussie favorisent la cohésion sociale et contribuent à préserver la paix. Chaque citoyen, en évitant le rejet et en soutenant les actions de réinsertion, participe à cet effort collectif.$$,
        'highlights', array[$$paix sociale$$, $$engagement citoyen$$]::text[],
        'fixation', jsonb_build_object('question', $$Pourquoi la réinsertion des enfants-soldats concerne-t-elle tous les citoyens et pas seulement les autorités ?$$, 'solution', $$Parce que l'accueil et le soutien de la communauté sont indispensables pour que la réinsertion réussisse et que la paix sociale soit préservée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Des enfants-soldats reviennent vivre dans leur village. Un comité local organise une collecte pour les aider, mais certains jeunes du village refusent d'y participer, estimant qu'ils ont causé trop de tort par le passé.$$,
      'questions', array[
        $$Identifie le problème posé par le refus de ces jeunes.$$,
        $$Cite deux conditions nécessaires à une bonne réinsertion des enfants-soldats.$$,
        $$Explique pourquoi il vaut mieux soutenir cette collecte que la boycotter.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on un enfant-soldat ?$$,
      'hint', $$Pense à l'âge et au lien avec un groupe armé.$$,
      'expected', $$Un membre d'un groupe armé âgé de moins de seize ans.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux causes qui poussent des enfants à se faire recruter par un groupe armé.$$,
      'hint', $$Pense à la sécurité, à la vengeance ou à l'insouciance.$$,
      'expected', $$La recherche de sécurité, le désir de vengeance ou l'insouciance face au danger (deux exemples cohérents suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux conséquences individuelles de l'utilisation des enfants comme soldats.$$,
      'hint', $$Pense aux traumatismes et aux mutilations.$$,
      'expected', $$Des traumatismes liés aux horreurs vécues, des mutilations, ou un basculement dans la délinquance (deux exemples cohérents suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite deux conditions favorisant la réinsertion d'un enfant-soldat.$$,
      'hint', $$Pense à l'école, au métier et à la non-stigmatisation.$$,
      'expected', $$Éviter de le stigmatiser, l'orienter vers l'apprentissage d'un métier, ou le remettre à l'école (deux exemples cohérents suffisent).$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-reinsertion-enfants-soldats';
