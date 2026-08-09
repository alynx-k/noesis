-- FALLBACK CONTENT: see 20260810400000_svt_aliments_homme_content.sql header
-- for the ecole-ci.org access attempt this session (site-wide login wall).
-- Written from general knowledge of the standard Ivorian 3ème SVT programme
-- (le sang : composition, rôles, groupes sanguins ABO), 100% original
-- wording.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En classe, l'enseignant fait observer une goutte de sang au microscope. Les élèves découvrent que ce liquide rouge, apparemment simple, est en réalité composé de plusieurs éléments différents, chacun avec un rôle précis.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$La composition du sang$$,
        'body', $$Le sang est un tissu liquide composé de plasma, un liquide jaunâtre, dans lequel baignent des éléments figurés : les globules rouges, les globules blancs et les plaquettes.$$,
        'highlights', array[$$plasma$$, $$éléments figurés$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Constituant$$, $$Description$$, $$Rôle$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Plasma$$, $$liquide jaunâtre contenant eau, nutriments, déchets$$, $$transporte les substances dans l'organisme$$),
            jsonb_build_array($$Globules rouges (hématies)$$, $$cellules sans noyau, riches en hémoglobine$$, $$transportent le dioxygène$$),
            jsonb_build_array($$Globules blancs (leucocytes)$$, $$cellules à noyau$$, $$défendent l'organisme contre les microbes$$),
            jsonb_build_array($$Plaquettes$$, $$fragments de cellules$$, $$assurent la coagulation du sang$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le sang est un tissu liquide composé de plasma et d'éléments figurés (globules rouges, globules blancs, plaquettes) en suspension.$$),
        'example', jsonb_build_object('statement', $$Quel constituant du sang est responsable du transport du dioxygène vers les organes ?$$, 'solution', $$Les globules rouges, grâce à l'hémoglobine qu'ils contiennent.$$),
        'fixation', jsonb_build_object('question', $$Quel constituant du sang intervient lors d'une coupure pour arrêter le saignement ?$$, 'solution', $$Les plaquettes, qui déclenchent la coagulation.$$)
      ),
      jsonb_build_object(
        'heading', $$Les rôles du sang$$,
        'body', $$Le sang assure trois grandes fonctions : un rôle de transport des nutriments, des gaz respiratoires et des déchets, un rôle de défense de l'organisme contre les microbes, et un rôle de régulation du milieu intérieur.$$,
        'highlights', array[$$rôle de transport$$, $$rôle de défense$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le sang transporte les substances utiles et les déchets, défend l'organisme contre les microbes grâce aux globules blancs, et régule le milieu intérieur.$$),
        'example', jsonb_build_object('statement', $$Après un repas, comment les nutriments absorbés par l'intestin parviennent-ils aux différents organes du corps ?$$, 'solution', $$Ils sont transportés par le plasma sanguin, via la circulation du sang, jusqu'aux organes.$$),
        'fixation', jsonb_build_object('question', $$Quel rôle jouent les globules blancs lorsqu'un microbe pénètre dans l'organisme ?$$, 'solution', $$Ils assurent la défense de l'organisme en détruisant ou en neutralisant le microbe.$$)
      ),
      jsonb_build_object(
        'heading', $$Les groupes sanguins$$,
        'body', $$Le groupe sanguin d'une personne dépend des antigènes présents à la surface de ses globules rouges. Le système ABO distingue quatre groupes : A, B, AB et O, chacun associé à des anticorps particuliers dans le plasma.$$,
        'highlights', array[$$groupes sanguins$$, $$système ABO$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Groupe sanguin$$, $$Antigène sur les globules rouges$$, $$Anticorps dans le plasma$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$A$$, $$antigène A$$, $$anticorps anti-B$$),
            jsonb_build_array($$B$$, $$antigène B$$, $$anticorps anti-A$$),
            jsonb_build_array($$AB$$, $$antigènes A et B$$, $$aucun anticorps$$),
            jsonb_build_array($$O$$, $$aucun antigène$$, $$anticorps anti-A et anti-B$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le groupe sanguin dépend de la présence ou de l'absence des antigènes A et B sur les globules rouges, et se complète par le facteur Rhésus (positif ou négatif).$$),
        'example', jsonb_build_object('statement', $$Une personne du groupe AB peut-elle avoir des anticorps anti-A ou anti-B dans son plasma ?$$, 'solution', $$Non, car ses globules rouges portent déjà les deux antigènes A et B ; la présence de ces anticorps provoquerait une réaction contre son propre sang.$$),
        'fixation', jsonb_build_object('question', $$Quels antigènes portent les globules rouges d'une personne du groupe O ?$$, 'solution', $$Aucun antigène A ni B.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Lors d'une campagne de don de sang à l'école, l'infirmière détermine le groupe sanguin de chaque élève avant le prélèvement.$$,
      'questions', array[
        $$Rappelle les quatre groupes sanguins du système ABO.$$,
        $$Explique pourquoi il est indispensable de connaître le groupe sanguin d'un donneur avant un don.$$,
        $$Quel élément du sang serait analysé pour vérifier qu'un élève n'est pas anémié ?$$,
        $$Quel est le rôle des plaquettes en cas de petite blessure lors du prélèvement ?$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Cite les quatre constituants principaux du sang.$$,
      'hint', $$Un liquide et trois types d'éléments figurés.$$,
      'expected', $$Le plasma, les globules rouges, les globules blancs et les plaquettes.$$
    ),
    jsonb_build_object(
      'question', $$Quel est le rôle de l'hémoglobine contenue dans les globules rouges ?$$,
      'hint', $$Pense à la respiration.$$,
      'expected', $$L'hémoglobine fixe le dioxygène dans les poumons et le transporte jusqu'aux organes, où elle le libère.$$
    ),
    jsonb_build_object(
      'question', $$Qu'est-ce qui détermine le groupe sanguin A, B, AB ou O d'une personne ?$$,
      'hint', $$Pense à la surface des globules rouges.$$,
      'expected', $$La présence ou l'absence des antigènes A et/ou B à la surface des globules rouges détermine le groupe sanguin.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi le sang est-il qualifié de tissu liquide ?$$,
      'hint', $$Pense à ses deux composantes : liquide et cellules.$$,
      'expected', $$Parce qu'il est composé d'un liquide, le plasma, dans lequel baignent des cellules et des fragments de cellules (globules rouges, globules blancs, plaquettes).$$
    )
  ),
  content_generated_at = now()
where id = 'svt-sang';
