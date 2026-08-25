-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Histoire.
-- Cours : "Leçon 3 : Les sources d'information et la dignité humaine en
-- temps de guerre ou de violence". Contenu réécrit à partir du PDF
-- source ; situation d'apprentissage, définitions et exercices
-- reformulés.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Une équipe de la Croix-Rouge locale organise une campagne de sensibilisation sur le respect de la dignité humaine en temps de guerre dans un établissement scolaire. Les élèves découvrent des images d'atrocités (mutilés, villages incendiés) commises lors de crises en Afrique. Choqués, ils approchent les agents de la Croix-Rouge pour identifier les sources de ces informations, comprendre les atteintes à la dignité humaine, et initier des actions de préservation.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les sources d'information en temps de guerre$$,
        'body', $$Une source d'information est un élément, un document ou une personne qui fournit des renseignements sur un sujet. En temps de guerre, on distingue les sources étatiques ou officielles (radio, télévision et presse des gouvernements ou autorités militaires en conflit) et les sources non officielles, elles-mêmes de deux types : les sources traditionnelles (victimes, témoins, personnels d'ONG, journalistes, enquêteurs indépendants) et les sources multimédia (réseaux sociaux), qui diffusent parfois des rumeurs pouvant provoquer des souffrances inutiles.$$,
        'highlights', array[$$sources officielles (radio/TV/presse d'État) vs non officielles (témoins, ONG, réseaux sociaux)$$, $$les rumeurs des réseaux sociaux peuvent aggraver les violences$$]::text[],
        'fixation', jsonb_build_object('question', $$Un journaliste indépendant présent sur le terrain est-il une source officielle ou non officielle ?$$, 'solution', $$Une source non officielle (traditionnelle).$$)
      ),
      jsonb_build_object(
        'heading', $$Les atteintes à la dignité humaine$$,
        'body', $$La dignité humaine est le respect que mérite tout être humain, quel que soit son âge, son sexe, son état de santé, sa condition sociale, sa religion ou son origine. On distingue les violences physiques (viols, vols, meurtres), les violences morales (injures, humiliations, attaques d'édifices religieux), les crimes de guerre (enlèvements, tortures, esclavage sexuel) et les crimes contre l'humanité (génocide, déportations, exécutions massives). Ces atteintes entraînent la mort, des blessures, la haine, la vengeance, des orphelins, ainsi que des grossesses non désirées et la propagation du VIH-SIDA.$$,
        'highlights', array[$$4 catégories : violences physiques, violences morales, crimes de guerre, crimes contre l'humanité$$, $$conséquences : mort, blessures, haine, orphelins, maladies$$]::text[],
        'example', jsonb_build_object('statement', $$Une population civile est déportée massivement lors d'un conflit. À quelle catégorie appartient cet acte ?$$, 'solution', $$À un crime contre l'humanité (la déportation en fait partie).$$),
        'fixation', jsonb_build_object('question', $$Dans quelle catégorie classe-t-on les injures et humiliations ?$$, 'solution', $$Les violences morales.$$)
      ),
      jsonb_build_object(
        'heading', $$La préservation de la dignité humaine$$,
        'body', $$Pour préserver la dignité humaine en temps de guerre, il faut respecter les règles du Droit International Humanitaire (DIH) : ne pas attaquer les civils, ne pas tuer ou blesser un ennemi désarmé ou hors de combat, ne pas utiliser d'armes non conventionnelles, porter assistance aux blessés et malades, bien traiter les prisonniers de guerre, interdire la torture, et garantir le droit à la justice.$$,
        'highlights', array[$$DIH = règles pour protéger civils, blessés et prisonniers pendant un conflit armé$$]::text[],
        'fixation', jsonb_build_object('question', $$Cite deux règles du DIH.$$, 'solution', $$Par exemple : ne pas attaquer les civils, et bien traiter les prisonniers de guerre (deux parmi les règles citées).$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un conflit oppose un village à un village voisin suite à des rumeurs véhiculées par des jeunes. Ce conflit a fait plusieurs morts et blessés parmi les vieillards et les femmes ; des jeunes filles ont été violées. Tu es choisi pour mener une campagne de sensibilisation sur la paix et la préservation de la dignité humaine.$$,
      'questions', array[
        $$Dis de quoi il s'agit dans cette situation.$$,
        $$Relève la source d'information évoquée dans la situation.$$,
        $$Rédige un court message de sensibilisation à adresser aux populations.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$La radio d'État qui communique sur un conflit en cours est-elle une source officielle ou non officielle ?$$,
      'hint', $$Elle appartient aux autorités étatiques.$$,
      'expected', $$Une source officielle (étatique).$$
    ),
    jsonb_build_object(
      'question', $$Un génocide appartient-il à la catégorie des violences physiques ou des crimes contre l'humanité ?$$,
      'hint', $$C'est la catégorie la plus grave.$$,
      'expected', $$Des crimes contre l'humanité.$$
    ),
    jsonb_build_object(
      'question', $$Que signifie le sigle DIH ?$$,
      'hint', $$C'est le droit qui encadre les conflits armés.$$,
      'expected', $$Le Droit International Humanitaire.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi les rumeurs diffusées sur les réseaux sociaux en temps de guerre sont-elles dangereuses ?$$,
      'hint', $$Elles ne sont pas toujours vérifiées.$$,
      'expected', $$Parce qu'elles peuvent être fausses et aggraver les violences en provoquant des souffrances inutiles.$$
    )
  ),
  content_generated_at = now()
where id = 'hist-6e-sources-info-dignite-humaine';
