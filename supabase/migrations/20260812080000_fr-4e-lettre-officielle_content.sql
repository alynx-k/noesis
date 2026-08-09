-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806580000_fr_ecriture_article_journal_content.sql).
-- ecole-ci.org is reachable now (see 20260812000000_fr-4e-debat_content.sql)
-- and "EXP. ECRITE: LA LETTRE OFFICIELLE" (course id 2245) is one of only 3
-- populated Français 4ème courses with a "Je lis le résumé de la leçon"
-- resource — but that resource (mod/resource id=19190) resolves to
-- "3e_EDHC_C5_L12_protection_parcs_nationaux.pdf" (pluginfile/56299), an
-- unrelated EDHC 3ème document, not a Français text. The "Je fais mes
-- exercices" H5P activity (id=19758) is correctly labelled "EE_lettre_
-- officielle" but its player renders no visible content ("Voir les
-- tentatives (0)" only). The other two populated Expression Écrite courses
-- serve the exact same wrong PDF under different pluginfile ids, so this
-- is a site-side content-linking bug, not a one-off. No usable grounding
-- text was available. Falling back to original content, from the lesson
-- title/topic and the standard Ivorian 4ème Français programme (compétence
-- expression écrite — lettre officielle / administrative).
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le comité des élèves souhaite demander au proviseur l'autorisation d'organiser une kermesse pour financer un voyage scolaire. Il te charge de rédiger la lettre officielle de demande.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Reconnaître la lettre officielle$$,
        'body', $$La lettre officielle (ou administrative) s'adresse à une autorité ou une institution dans un cadre précis : demande, réclamation, information. Elle exige rigueur et politesse.$$,
        'highlights', array[$$le destinataire$$, $$l'expéditeur$$, $$l'objet$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une lettre officielle s'adresse à une personne identifiée par sa fonction (le proviseur, le maire, le directeur) et respecte des codes précis de présentation et de politesse, contrairement à une lettre familière.$$),
        'example', jsonb_build_object('statement', $$Dans quel cas écrit-on une lettre officielle plutôt qu'une lettre familière ?$$, 'solution', $$Lorsqu'on s'adresse à une autorité ou une institution (un directeur, une administration) pour une demande, une réclamation ou une information officielle.$$),
        'fixation', jsonb_build_object('question', $$Cite deux différences entre une lettre officielle et une lettre familière.$$, 'solution', $$La lettre officielle utilise un registre soutenu et des formules de politesse codifiées, alors que la lettre familière emploie un registre courant et des formules plus libres ; la lettre officielle mentionne aussi précisément l'objet et les coordonnées des deux parties.$$)
      ),
      jsonb_build_object(
        'heading', $$La présentation codifiée de la lettre$$,
        'body', $$La lettre officielle respecte une mise en page fixe : coordonnées de l'expéditeur, lieu et date, coordonnées du destinataire, objet, formule d'appel, corps, formule de politesse, signature.$$,
        'highlights', array[$$la formule d'appel$$, $$la formule de politesse$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Élément$$, $$Emplacement$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Coordonnées de l'expéditeur$$, $$en haut à gauche$$),
            jsonb_build_array($$Lieu et date$$, $$en haut à droite$$),
            jsonb_build_array($$Coordonnées du destinataire$$, $$sous la date, à droite$$),
            jsonb_build_array($$Objet$$, $$au-dessus du corps de la lettre$$),
            jsonb_build_array($$Formule d'appel et de politesse$$, $$début et fin du corps de la lettre$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'objet résume en une courte ligne le motif de la lettre (« Objet : demande d'autorisation... ») et se place juste avant le corps du texte, après les coordonnées des deux parties.$$),
        'example', jsonb_build_object('statement', $$Rédige l'objet d'une lettre demandant l'autorisation d'organiser une kermesse.$$, 'solution', $$Objet : Demande d'autorisation pour l'organisation d'une kermesse scolaire$$),
        'fixation', jsonb_build_object('question', $$Rédige l'objet d'une lettre signalant un dégât dans une salle de classe.$$, 'solution', $$Objet : Signalement d'un dégât matériel en salle de classe$$)
      ),
      jsonb_build_object(
        'heading', $$Les formules de politesse codifiées$$,
        'body', $$La lettre officielle s'ouvre et se ferme par des formules figées, dont le choix dépend du destinataire et du degré de respect attendu.$$,
        'highlights', array[$$Monsieur le Proviseur$$, $$sentiments respectueux$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$La formule d'appel reprend la fonction du destinataire (« Monsieur le Proviseur », « Madame la Directrice »), et la formule de politesse finale reprend cette même appellation (« Veuillez agréer, Monsieur le Proviseur, l'expression de mes salutations respectueuses »).$$),
        'example', jsonb_build_object('statement', $$Rédige une formule de politesse finale adressée au maire de la commune.$$, 'solution', $$Veuillez agréer, Monsieur le Maire, l'expression de ma haute considération.$$),
        'fixation', jsonb_build_object('question', $$Corrige cette formule trop familière pour une lettre officielle : « Merci d'avance, à bientôt ! »$$, 'solution', $$Je vous prie d'agréer, Monsieur le Proviseur, l'expression de mes salutations respectueuses.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Le comité des élèves te charge de rédiger une lettre officielle au proviseur pour demander l'autorisation d'organiser une kermesse au profit d'un voyage scolaire.$$,
      'questions', array[
        $$Rédige les coordonnées de l'expéditeur, du destinataire, le lieu et la date.$$,
        $$Rédige un objet clair et une formule d'appel adaptée.$$,
        $$Rédige le corps de la lettre en expliquant la demande et sa justification.$$,
        $$Rédige une formule de politesse finale adaptée au destinataire.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Rédige l'objet d'une lettre demandant un duplicata de bulletin scolaire.$$,
      'hint', $$Résume le motif en une courte ligne commençant par « Objet : ».$$,
      'expected', $$Objet : Demande de duplicata de bulletin scolaire$$
    ),
    jsonb_build_object(
      'question', $$Rédige une formule d'appel adressée à la directrice d'un centre culturel.$$,
      'hint', $$Reprend la fonction exacte du destinataire.$$,
      'expected', $$Madame la Directrice,$$
    ),
    jsonb_build_object(
      'question', $$Corrige cette formule trop familière pour une lettre officielle adressée au proviseur : « Salut, j'espère que tout va bien. »$$,
      'hint', $$Utilise une formule d'appel codifiée.$$,
      'expected', $$Monsieur le Proviseur,$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi la formule de politesse finale doit-elle reprendre l'appellation utilisée dans la formule d'appel ?$$,
      'hint', $$Pense à la cohérence et au respect dû au destinataire.$$,
      'expected', $$Parce que cela assure la cohérence de la lettre et marque le respect constant envers le destinataire tout au long du courrier.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-lettre-officielle';
