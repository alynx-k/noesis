-- Same CourseContentV2 shape as the Français 3ème content migrations (see
-- e.g. 20260806600000_fr_orthographe_lexicale_content.sql). ecole-ci.org is
-- reachable now (see 20260812000000_fr-4e-debat_content.sql) — opened
-- Français 4ème > Orthographe > "Leçon 1: S1 Orthographe lexicale_Formation
-- des mots par composition/par dérivation simple" (course id 686):
-- "Activités : 0", no résumé/exercise uploaded. Falling back to original
-- content. This 4ème lesson goes beyond the 3ème orthographe lexicale
-- lesson (lettres muettes, doubles consonnes, homophones lexicaux, familles
-- de mots): it covers paronymes, préfixes in-/im-/il-/ir-, and le doublement
-- de consonnes devant un suffixe, from the standard Ivorian 4ème programme.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$En corrigeant ton exposé écrit, ton professeur relève une confusion entre « éminent » et « imminent », ainsi que plusieurs erreurs de préfixes. Il propose une séance sur des pièges plus avancés de l'orthographe lexicale.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les paronymes$$,
        'body', $$Les paronymes sont des mots dont la prononciation ou l'écriture se ressemble fortement, mais dont le sens est différent : ils créent souvent des confusions.$$,
        'highlights', array[$$un paronyme$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Paronymes$$, $$Sens$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$éminent / imminent$$, $$remarquable / qui va arriver bientôt$$),
            jsonb_build_array($$conjecture / conjoncture$$, $$hypothèse / situation générale du moment$$),
            jsonb_build_array($$évoquer / invoquer$$, $$rappeler / faire appel à$$),
            jsonb_build_array($$affectif / effectif$$, $$émotionnel / réel, mis en œuvre$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Deux paronymes se ressemblent par leur forme mais n'ont pas le même sens : en cas de doute, il faut vérifier le sens exact dans un dictionnaire avant de choisir le bon mot.$$),
        'example', jsonb_build_object('statement', $$Choisis le mot correct : « Un danger (éminent/imminent) menaçait le village. »$$, 'solution', $$Un danger imminent menaçait le village (« imminent » signifie qui va arriver très bientôt).$$),
        'fixation', jsonb_build_object('question', $$Choisis le mot correct : « C'est un (éminent/imminent) professeur, connu dans tout le pays. »$$, 'solution', $$C'est un éminent professeur, connu dans tout le pays (« éminent » signifie remarquable).$$)
      ),
      jsonb_build_object(
        'heading', $$Les préfixes in-, im-, il-, ir-$$,
        'body', $$Le préfixe négatif « in- » change de forme selon la première lettre du mot auquel il s'ajoute, pour faciliter la prononciation.$$,
        'highlights', array[$$in-$$, $$im-$$, $$il-$$, $$ir-$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Préfixe$$, $$Devant$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$im-$$, $$m, b, p$$, $$impossible, imbuvable$$),
            jsonb_build_array($$il-$$, $$l$$, $$illisible, illégal$$),
            jsonb_build_array($$ir-$$, $$r$$, $$irrégulier, irréel$$),
            jsonb_build_array($$in-$$, $$les autres lettres$$, $$incorrect, inutile$$)
          )
        ),
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le préfixe « in- » devient « im- » devant m, b, p ; « il- » devant l ; « ir- » devant r ; il garde la forme « in- » devant les autres lettres.$$),
        'example', jsonb_build_object('statement', $$Ajoute le bon préfixe négatif à « lettré ».$$, 'solution', $$illettré (le préfixe devient « il- » devant un l).$$),
        'fixation', jsonb_build_object('question', $$Ajoute le bon préfixe négatif à « responsable ».$$, 'solution', $$irresponsable (le préfixe devient « ir- » devant un r).$$)
      ),
      jsonb_build_object(
        'heading', $$Le doublement de consonne devant un suffixe$$,
        'body', $$Lorsqu'on ajoute un suffixe à certains mots, la consonne finale peut se doubler, notamment pour les mots en « -et » et « -on » suivis de « -er », « -ette » ou « -on ».$$,
        'highlights', array[$$un suffixe$$, $$le doublement de consonne$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Certains mots doublent leur consonne finale devant un suffixe commençant par une voyelle : chat → chaton mais chatte, un sot → sottise, un chien → chienne. Il n'existe pas de règle unique : il faut souvent mémoriser ou vérifier au dictionnaire.$$),
        'example', jsonb_build_object('statement', $$Quel est le féminin de « paysan » ? Le « n » double-t-il ?$$, 'solution', $$Le féminin est « paysanne » : le « n » se double devant le « e » du féminin.$$),
        'fixation', jsonb_build_object('question', $$Quel est le nom dérivé de « sot » qui double sa consonne ?$$, 'solution', $$« Sottise » : le « t » de « sot » se double devant le suffixe.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton professeur prépare une dictée piégée contenant des paronymes, des mots préfixés en in-/im-/il-/ir-, et des mots à consonne doublée.$$,
      'questions', array[
        $$Distingue deux paronymes dans une phrase de ton choix.$$,
        $$Forme le contraire de trois adjectifs avec le bon préfixe négatif (in-, im-, il-, ir-).$$,
        $$Donne un exemple de mot dont la consonne finale se double devant un suffixe.$$,
        $$Explique pourquoi il faut parfois vérifier l'orthographe d'un mot au dictionnaire plutôt que d'appliquer une règle.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Choisis le mot correct : « Il faut interpréter les résultats avec prudence, ce ne sont que des (conjectures/conjonctures). »$$,
      'hint', $$Pense au mot qui signifie « hypothèses ».$$,
      'expected', $$Il faut interpréter les résultats avec prudence, ce ne sont que des conjectures.$$
    ),
    jsonb_build_object(
      'question', $$Ajoute le bon préfixe négatif à « mobile » et à « légal ».$$,
      'hint', $$Pense à la lettre qui suit le préfixe dans chaque mot.$$,
      'expected', $$immobile (devant m) et illégal (devant l).$$
    ),
    jsonb_build_object(
      'question', $$Quel est le féminin de « lion », et la consonne double-t-elle ?$$,
      'hint', $$Pense au féminin des noms d'animaux en -on.$$,
      'expected', $$Le féminin est « lionne » : le « n » se double devant le « e » du féminin.$$
    ),
    jsonb_build_object(
      'question', $$Pourquoi confond-on souvent « évoquer » et « invoquer » ? Explique la différence.$$,
      'hint', $$Ce sont des paronymes de sens différent.$$,
      'expected', $$Parce que ce sont des paronymes qui se ressemblent par leur forme ; « évoquer » signifie rappeler un souvenir ou un fait, tandis qu'« invoquer » signifie faire appel à une raison, une autorité ou une aide.$$
    )
  ),
  content_generated_at = now()
where id = 'fr-4e-orthographe-lexicale';
