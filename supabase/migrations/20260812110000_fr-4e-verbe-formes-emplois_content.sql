-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806640000_fr_infinitif_participe_content.sql). ecole-ci.org is
-- reachable now (see 20260812000000_fr-4e-debat_content.sql) — opened
-- Français 4ème > Grammaire > "Leçon 3: S1 Grammaire_Le verbe_formes et
-- emplois_La morphologie des verbes du 3ème groupe" (course id 693):
-- "Activités : 0", no résumé/exercise uploaded. Falling back to original
-- content, from the lesson title/topic and the standard Ivorian 4ème
-- Français programme (compétence grammaire — le verbe : formes et
-- emplois).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En rédigeant le compte rendu d'une expérience scientifique, tu hésites entre écrire « on a construit le barrage » et « le barrage a été construit ». Il te faut comprendre les différentes formes et emplois du verbe.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La voix active et la voix passive$$,
        'body', $$Un verbe peut être employé à la voix active, où le sujet fait l'action, ou à la voix passive, où le sujet subit l'action réalisée par un complément d'agent.$$,
        'highlights', array[$$la voix active$$, $$la voix passive$$, $$le complément d'agent$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Voix$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Active$$, $$Les ouvriers construisent le barrage.$$),
            jsonb_build_array($$Passive$$, $$Le barrage est construit par les ouvriers.$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$À la voix passive, le COD de la phrase active devient sujet, le sujet devient complément d'agent introduit par « par » (parfois « de »), et le verbe se construit avec l'auxiliaire être suivi du participe passé.$$),
        'example', jsonb_build_object('statement', $$Transforme à la voix passive : « Le maître corrige les copies. »$$, 'solution', $$Les copies sont corrigées par le maître.$$),
        'fixation', jsonb_build_object('question', $$Transforme à la voix passive : « Les élèves ont organisé la fête. »$$, 'solution', $$La fête a été organisée par les élèves.$$)
      ),
      jsonb_build_object(
        'heading', $$La forme pronominale$$,
        'body', $$Un verbe à la forme pronominale se construit avec un pronom réfléchi (me, te, se, nous, vous, se) de la même personne que le sujet, et peut avoir un sens réfléchi, réciproque ou passif.$$,
        'highlights', array[$$le sens réfléchi$$, $$le sens réciproque$$, $$le sens passif$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un verbe pronominal réfléchi exprime une action que le sujet fait sur lui-même (il se lave), réciproque une action échangée entre plusieurs sujets (ils se saluent), et un verbe pronominal de sens passif exprime une action subie sans agent exprimé (ce plat se mange froid).$$),
        'example', jsonb_build_object('statement', $$Quel est le sens du verbe pronominal dans : « Les deux amis se sont réconciliés. » ?$$, 'solution', $$C'est un sens réciproque : l'action de se réconcilier est échangée entre les deux amis.$$),
        'fixation', jsonb_build_object('question', $$Quel est le sens du verbe pronominal dans : « Ce tissu se lave à la main. » ?$$, 'solution', $$C'est un sens passif : le tissu subit l'action de laver, sans agent exprimé.$$)
      ),
      jsonb_build_object(
        'heading', $$Les emplois des temps et des modes$$,
        'body', $$Selon l'intention du locuteur, un même fait peut être exprimé à différents temps et modes : indicatif pour un fait réel, conditionnel pour une hypothèse, subjonctif pour un souhait ou un doute.$$,
        'highlights', array[$$l'indicatif$$, $$le conditionnel$$, $$le subjonctif$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'indicatif exprime un fait certain, le conditionnel une hypothèse ou une politesse, l'impératif un ordre, et le subjonctif un souhait, un doute ou une nécessité, souvent après des verbes comme « il faut que » ou « je souhaite que ».$$),
        'example', jsonb_build_object('statement', $$Quel mode et quel temps employer dans : « Il faut que tu (finir) ton exercice. » ?$$, 'solution', $$Il faut que tu finisses ton exercice — subjonctif présent, car la phrase exprime une nécessité.$$),
        'fixation', jsonb_build_object('question', $$Conjugue au conditionnel présent pour exprimer une hypothèse : « Si j'avais le temps, je (visiter) ce musée. »$$, 'solution', $$Si j'avais le temps, je visiterais ce musée.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Tu rédiges le compte rendu d'une expérience scientifique menée en classe et dois choisir les formes verbales les plus adaptées.$$,
      'questions', array[
        $$Transforme une phrase active de ton texte à la voix passive.$$,
        $$Utilise un verbe pronominal de sens réciproque ou passif dans une phrase.$$,
        $$Utilise le subjonctif après une expression de nécessité (« il faut que »).$$,
        $$Explique la différence entre la voix active et la voix passive.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Transforme à la voix passive : « Les villageois ont célébré la récolte. »$$,
      'hint', $$Le COD devient sujet, ajoute « par ».$$,
      'expected', $$La récolte a été célébrée par les villageois.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le sens du verbe pronominal dans : « Les deux équipes se sont affrontées avec fair-play. » ?$$,
      'hint', $$Pense à une action partagée entre deux sujets.$$,
      'expected', $$C'est un sens réciproque : l'action d'affronter est échangée entre les deux équipes.$$
    ),
    jsonb_build_object(
      'question', $$Conjugue au subjonctif présent : « Je souhaite que vous (réussir) votre examen. »$$,
      'hint', $$Après « je souhaite que », on emploie le subjonctif.$$,
      'expected', $$Je souhaite que vous réussissiez votre examen.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi utilise-t-on la voix passive plutôt que la voix active dans certains textes informatifs ?$$,
      'hint', $$Pense à ce que l'on veut mettre en valeur dans la phrase.$$,
      'expected', $$Parce qu'elle permet de mettre en valeur l'action ou son résultat plutôt que l'auteur de l'action, notamment quand celui-ci est inconnu ou peu important.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-verbe-formes-emplois';
