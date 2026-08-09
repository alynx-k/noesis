-- Sourced from the official ecole-ci.org (Collège Numérique) PDF for EDHC
-- 4ème, Leçon 9 : "LES ALLIANCES INTERETHNIQUES, LES CULTURES DES KWA ET
-- DES KROU ET LA COHESION SOCIALE" (course/view.php?id=1429,
-- mod/resource id=9572, pluginfile 45144). Rewritten entirely in
-- original wording from the real lesson content (Kwa and Krou peoples,
-- definition and origins of interethnic alliances, examples of allied
-- peoples, importance for social cohesion); factual ethnonyms are kept
-- as stated in the source, but no sentence is copied verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Lors du festival culturel de sa commune, le maire affirme dans son discours que les alliances interethniques sont un moyen de préserver la cohésion sociale. Pour mieux comprendre cette affirmation, des élèves décident de s'informer sur les peuples Kwa et Krou et sur les alliances qui les unissent.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Les peuples Kwa et les peuples Krou$$,
        'body', $$Les peuples Kwa se répartissent en deux sous-groupes : les Kwa lagunaires (comme les Adioukrou, les Alladjan, les Abouré ou les Akyé, installés près des lagunes) et les Kwa Akan (comme les Baoulé, les Agni et les Abron, installés au centre et à l'est du pays). Les peuples Krou (comme les Bété, les Wê, les Godié, les Dida et les Kroumen) occupent plutôt l'ouest, le centre-ouest et le sud-ouest de la Côte d'Ivoire.$$,
        'highlights', array[$$peuples Kwa$$, $$peuples Krou$$]::text[],
        'fixation', jsonb_build_object('question', $$Dans quelle partie de la Côte d'Ivoire se trouvent principalement les peuples Krou ?$$, 'solution', $$Ils occupent principalement l'ouest, le centre-ouest et le sud-ouest du pays.$$)
      ),
      jsonb_build_object(
        'heading', $$Qu'est-ce qu'une alliance interethnique ?$$,
        'body', $$Une alliance interethnique est une parenté à plaisanterie fondée sur un pacte de non-agression entre deux peuples. Ces alliances trouvent souvent leur origine dans une assistance apportée lors d'un conflit passé, dans un pacte commercial, ou dans une médiation ayant permis de résoudre un différend ancien.$$,
        'highlights', array[$$alliance interethnique$$, $$pacte de non-agression$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Une alliance interethnique lie deux peuples par un pacte de non-agression et de plaisanterie réciproque, né le plus souvent d'une assistance, d'un échange commercial ou d'une médiation passée entre eux.$$),
        'example', jsonb_build_object('statement', $$Deux peuples se doivent assistance depuis qu'un conflit ancien a été réglé par la médiation de l'un d'eux. Peut-on parler d'alliance interethnique ?$$, 'solution', $$Oui, la médiation lors d'un conflit est l'une des origines reconnues des alliances interethniques.$$)
      ),
      jsonb_build_object(
        'heading', $$Des exemples d'alliances entre peuples de Côte d'Ivoire$$,
        'body', $$Des alliances existent aussi bien à l'intérieur d'un même grand groupe qu'entre les groupes Kwa et Krou : par exemple les Agni et les Baoulé, ou les M'batto et les Ebrié, sont alliés au sein des peuples Akan ; les Godié et les Dida sont alliés au sein des peuples Krou ; et les Dida sont notamment alliés aux Abbey, aux Abidji et aux Akyé, montrant que des alliances relient aussi les groupes Kwa et Krou entre eux.$$,
        'highlights', array[$$alliances entre peuples$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type d'alliance$$, $$Exemple de peuples alliés$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Au sein des Akan$$, $$Agni et Baoulé$$),
            jsonb_build_array($$Entre Kwa et Krou$$, $$Dida et Abbey$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Cite un exemple d'alliance entre deux peuples appartenant au groupe Krou.$$, 'solution', $$L'alliance entre les Godié et les Dida, par exemple.$$)
      ),
      jsonb_build_object(
        'heading', $$L'importance des alliances interethniques$$,
        'body', $$Les alliances interethniques sont des mécanismes de prévention et de règlement des conflits. Elles véhiculent des valeurs comme l'honnêteté, la solidarité, la non-violence et le respect de la parole donnée, et contribuent à la préservation de la paix à travers les médiations qu'elles rendent possibles entre alliés ou avec des tiers.$$,
        'highlights', array[$$prévention des conflits$$, $$paix$$]::text[],
        'example', jsonb_build_object('statement', $$Deux élèves de peuples alliés se disputent, et un camarade allié de l'un d'eux intervient pour les réconcilier. Ce geste illustre-t-il l'importance des alliances interethniques ?$$, 'solution', $$Oui, car les alliances interethniques favorisent justement ce rôle de médiation pour préserver la paix entre les personnes concernées.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Suite à un désaccord survenu lors d'un match de football, deux élèves de la même classe, issus de peuples traditionnellement alliés, ne se parlent plus. Le chef de classe sollicite un allié de l'un des deux pour les réconcilier.$$,
      'questions', array[
        $$Identifie le problème posé par cette situation.$$,
        $$Rappelle ce qu'est une alliance interethnique.$$,
        $$Explique pourquoi cet élève devrait accepter la mission de réconciliation.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Comment définit-on une alliance interethnique ?$$,
      'hint', $$Pense à une parenté à plaisanterie et à un pacte.$$,
      'expected', $$Une parenté à plaisanterie fondée sur un pacte de non-agression entre deux peuples.$$
    ),
    jsonb_build_object(
      'question', $$Cite deux origines possibles d'une alliance interethnique.$$,
      'hint', $$Pense à l'assistance lors d'un conflit, au commerce ou à la médiation.$$,
      'expected', $$Une assistance lors d'un conflit passé, un pacte commercial, ou une médiation ayant réglé un différend (deux exemples suffisent).$$
    ),
    jsonb_build_object(
      'question', $$Cite un exemple d'alliance entre deux peuples de Côte d'Ivoire.$$,
      'hint', $$Pense aux Agni et aux Baoulé, ou aux Godié et aux Dida.$$,
      'expected', $$Les Agni et les Baoulé, ou les Godié et les Dida, ou les Dida et les Abbey (un exemple suffit).$$
    ),
    jsonb_build_object(
      'question', $$Quelle est l'importance des alliances interethniques pour la société ?$$,
      'hint', $$Pense à la prévention des conflits et à la paix.$$,
      'expected', $$Elles préviennent et règlent les conflits, véhiculent des valeurs comme l'honnêteté et la solidarité, et contribuent à la préservation de la paix sociale.$$
    )
  ),
  content_generated_at = now()
where id = 'edhc-4e-alliances-kwa-krou';
