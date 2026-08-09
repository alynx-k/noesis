-- Same CourseContentV2 shape as the Mathématiques/Anglais migrations (see
-- 20260806110000_calcul_litteral_content.sql for the rationale/pattern).
-- No ecole-ci.org page exists for this course (the "Expression
-- orale-Étude d'oeuvre intégrale" category is empty on the platform), so
-- this content is written from the lesson's own title/topic and the
-- standard 3ème French-programme scope. Entirely in French, as this is a
-- French-language course (unlike Anglais, no immersion language split
-- applies here).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Pour la fête de fin d'année, ta classe doit présenter une petite scène de dialogue devant les autres élèves. Avant de l'écrire, ton professeur de français veut que la classe révise les règles qui rendent un dialogue vivant et naturel.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les caractéristiques du dialogue oral$$,
        'body', $$Un dialogue oral repose sur l'échange entre au moins deux interlocuteurs. Contrairement à un texte écrit, il utilise des marques propres à l'oral : hésitations, répétitions, interjections, et un registre de langue adapté à la situation.$$,
        'highlights', array[$$interlocuteurs$$, $$registre de langue$$, $$interjections$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Un dialogue oral se caractérise par la prise de parole alternée entre les interlocuteurs, l'utilisation de phrases souvent courtes ou inachevées, et des marques d'oralité (euh, ben, alors) qui n'apparaissent presque jamais à l'écrit soigné.$$),
        'example', jsonb_build_object('statement', $$Identifie les marques d'oralité dans cet échange : « Alors, euh... tu viens ce soir ? — Ben oui, bien sûr ! »$$, 'solution', $$Les marques d'oralité sont « alors », « euh » et « ben » : elles montrent l'hésitation et la spontanéité propres à l'oral.$$),
        'fixation', jsonb_build_object('question', $$Réécris cette phrase écrite en une réplique plus orale : « Je pense que nous devrions partir maintenant. »$$, 'solution', $$Bon, on devrait y aller maintenant, non ?$$)
      ),
      jsonb_build_object(
        'heading', $$Les registres de langue$$,
        'body', $$Selon la personne à qui l'on s'adresse et la situation, on adapte son niveau de langue. On distingue généralement trois registres.$$,
        'highlights', array[$$familier$$, $$courant$$, $$soutenu$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Registre$$, $$Caractéristiques$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Familier$$, $$vocabulaire relâché, utilisé entre proches$$, $$« T'as pas vu mon stylo ? »$$),
            jsonb_build_array($$Courant$$, $$langage standard, utilisé au quotidien$$, $$« Tu n'as pas vu mon stylo ? »$$),
            jsonb_build_array($$Soutenu$$, $$vocabulaire recherché, syntaxe soignée$$, $$« N'auriez-vous pas aperçu mon stylo ? »$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le choix du registre dépend du contexte : on utilise le registre familier entre amis, le registre courant dans la plupart des échanges quotidiens, et le registre soutenu dans les situations formelles ou face à une personne qu'on ne connaît pas.$$),
        'example', jsonb_build_object('statement', $$Transpose cette phrase familière en registre courant : « Il est trop nul ce film ! »$$, 'solution', $$Ce film n'est pas très bon.$$),
        'fixation', jsonb_build_object('question', $$Transpose cette phrase courante en registre soutenu : « Tu peux m'aider ? »$$, 'solution', $$Pourriez-vous m'aider, s'il vous plaît ?$$)
      ),
      jsonb_build_object(
        'heading', $$Les règles de politesse et de prise de parole$$,
        'body', $$Un bon dialogue respecte des règles qui permettent à chacun de s'exprimer sans couper la parole à l'autre, et de réagir avec des formules adaptées.$$,
        'highlights', array[$$prise de parole$$, $$formules de politesse$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un dialogue réussi, chaque interlocuteur attend son tour, écoute l'autre, et utilise des formules de politesse (s'il te plaît, merci, excuse-moi) ainsi que des expressions pour relancer l'échange (Et toi ? Qu'en penses-tu ?).$$),
        'example', jsonb_build_object('statement', $$Complète ce dialogue avec une formule qui relance la parole : « J'ai adoré ce film. — ... »$$, 'solution', $$J'ai adoré ce film. — Ah bon ? Et qu'est-ce qui t'a plu exactement ?$$),
        'fixation', jsonb_build_object('question', $$Ajoute une formule de politesse à cette réplique un peu brute : « Passe-moi le sel. »$$, 'solution', $$Tu pourrais me passer le sel, s'il te plaît ?$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Pour la fête de fin d'année, ta classe doit présenter une petite scène de dialogue entre deux camarades qui organisent une sortie.$$,
      'questions', array[
        $$Écris un court dialogue (6 à 8 répliques) entre deux amis qui décident où aller ce week-end.$$,
        $$Utilise au moins deux marques d'oralité dans ton dialogue.$$,
        $$Choisis un registre de langue adapté à une conversation entre amis et justifie ton choix.$$,
        $$Ajoute une formule de politesse ou une relance dans l'une des répliques.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Identifie le registre de langue de cette phrase : « Bonjour, pourriez-vous m'indiquer le chemin de la gare ? »$$,
      'hint', $$Regarde la formulation et le vocabulaire employés.$$,
      'expected', $$C'est le registre soutenu (ou courant poli), car la formulation est polie et la syntaxe est correcte, adaptée à une personne inconnue.$$
    ),
    jsonb_build_object(
      'question', $$Réécris cette réplique familière en registre courant : « C'est trop chelou ce qu'il a dit. »$$,
      'hint', $$Remplace le vocabulaire familier par des mots standards.$$,
      'expected', $$C'est vraiment étrange, ce qu'il a dit.$$
    ),
    jsonb_build_object(
      'question', $$Ajoute une marque d'oralité à cette phrase pour la rendre plus naturelle à l'oral : « Je ne sais pas si je viendrai. »$$,
      'hint', $$Pense aux mots comme « euh », « bon », « enfin ».$$,
      'expected', $$Euh... je ne sais pas trop si je viendrai.$$
    ),
    jsonb_build_object(
      'question', $$Complète ce dialogue avec une formule qui relance la conversation : « Je pars en vacances la semaine prochaine. — ... »$$,
      'hint', $$Utilise une question pour montrer de l'intérêt.$$,
      'expected', $$Je pars en vacances la semaine prochaine. — Ah super, et où est-ce que tu vas ?$$
    )
  ),
  content_generated_at = now()
where id = 'fr-dialogue-oral';
