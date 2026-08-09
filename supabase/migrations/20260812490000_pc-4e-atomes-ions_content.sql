-- Physique-Chimie 4ème — Atomes et ions.
-- FALLBACK content (see header of
-- 20260812400000_pc-4e-sources-recepteurs-lumiere_content.sql for the
-- sourcing attempts this pass). Written from solid general knowledge of
-- the standard 4ème chemistry competency (structure de l'atome, neutralité
-- électrique, numéro atomique Z, formation des ions par perte/gain
-- d'électrons, cations et anions courants). Original wording throughout,
-- not copied from any source.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le sel de cuisine, dissous dans l'eau, conduit le courant électrique, alors que le sucre, lui aussi dissous, n'en conduit pas. Cette différence s'explique par la présence, dans l'eau salée, de particules chargées électriquement appelées ions, absentes de l'eau sucrée. D'où viennent ces ions, et quel lien ont-ils avec les atomes ?$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Structure de l'atome$$,
        'body', $$Un atome est constitué d'un noyau central, très petit mais concentrant presque toute la masse de l'atome, autour duquel se déplacent des électrons, des particules chargées négativement. Le noyau contient des protons, chargés positivement, et des neutrons, électriquement neutres.$$,
        'highlights', array[$$atome$$, $$noyau$$, $$électrons$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$L'atome est constitué d'un noyau (protons chargés positivement et neutrons neutres) entouré d'électrons chargés négativement, en mouvement autour du noyau.$$),
        'example', jsonb_build_object('statement', $$Un atome possède 6 protons dans son noyau. Quelle est la charge électrique globale de ce noyau ?$$, 'solution', $$Le noyau, constitué de 6 protons chargés positivement (et de neutrons neutres), porte une charge positive globale.$$),
        'fixation', jsonb_build_object('question', $$Quelles sont les deux particules présentes dans le noyau d'un atome ?$$, 'solution', $$Les protons (chargés positivement) et les neutrons (électriquement neutres).$$)
      ),
      jsonb_build_object(
        'heading', $$Neutralité électrique de l'atome$$,
        'body', $$Un atome est électriquement neutre : le nombre de protons de son noyau est exactement égal au nombre d'électrons qui l'entourent. Ce nombre, caractéristique d'un élément chimique, est appelé numéro atomique, noté Z.$$,
        'highlights', array[$$neutralité$$, $$numéro atomique$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Dans un atome neutre, le nombre d'électrons est égal au nombre de protons, noté Z (numéro atomique). Chaque charge élémentaire vaut environ 1,6×10⁻¹⁹ C, positive pour le proton, négative pour l'électron.$$),
        'example', jsonb_build_object('statement', $$L'atome de sodium a pour numéro atomique Z = 11. Combien possède-t-il de protons et d'électrons ?$$, 'solution', $$Il possède 11 protons et, étant neutre, également 11 électrons.$$),
        'fixation', jsonb_build_object('question', $$Un atome possède 17 électrons. Combien de protons contient son noyau, sachant qu'il est électriquement neutre ?$$, 'solution', $$Il contient également 17 protons.$$)
      ),
      jsonb_build_object(
        'heading', $$Formation des ions$$,
        'body', $$Un atome peut perdre ou gagner un ou plusieurs électrons. Il devient alors chargé électriquement et prend le nom d'ion. Un ion issu de la perte d'électrons est chargé positivement : c'est un cation. Un ion issu du gain d'électrons est chargé négativement : c'est un anion.$$,
        'highlights', array[$$ion$$, $$cation$$, $$anion$$]::text[],
        'property', jsonb_build_object('label', $$Définition$$, 'text', $$Un cation se forme par perte d'électrons (charge positive), un anion se forme par gain d'électrons (charge négative). Le nombre de charges de l'ion correspond au nombre d'électrons perdus ou gagnés.$$),
        'example', jsonb_build_object('statement', $$Un atome de sodium (Z=11, donc 11 électrons) perd un électron. Quel ion obtient-on, et quelle est sa charge ?$$, 'solution', $$L'atome perd un électron négatif : il devient un cation sodium Na+, de charge positive.$$),
        'fixation', jsonb_build_object('question', $$Un atome de chlore gagne un électron. L'ion obtenu est-il un cation ou un anion ?$$, 'solution', $$C'est un anion, chargé négativement, car l'atome a gagné un électron.$$),
        'table', jsonb_build_object(
          'headers', array[$$Particule$$, $$Formation$$, $$Charge$$, $$Exemple$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Atome$$, $$—$$, $$Neutre$$, $$Na, Cl$$),
            jsonb_build_array($$Cation$$, $$Perte d'électron(s)$$, $$Positive$$, $$Na+, Cu2+$$),
            jsonb_build_array($$Anion$$, $$Gain d'électron(s)$$, $$Négative$$, $$Cl-, O2-$$)
          )
        )
      ),
      jsonb_build_object(
        'heading', $$Quelques ions courants$$,
        'body', $$De nombreux ions interviennent dans la vie courante et dans le corps humain. Le sel de cuisine, ou chlorure de sodium, est constitué d'ions sodium Na+ et d'ions chlorure Cl-. D'autres ions fréquents sont l'ion calcium Ca2+, l'ion cuivre Cu2+ (responsable de la couleur bleue des solutions de sulfate de cuivre) ou l'ion aluminium Al3+.$$,
        'highlights', array[$$chlorure de sodium$$, $$ions courants$$]::text[],
        'property', jsonb_build_object('label', $$Propriété$$, 'text', $$Le nombre de charges d'un ion se note en exposant après le symbole de l'élément : Na+ (une charge positive), Cu2+ (deux charges positives), Cl- (une charge négative), O2- (deux charges négatives).$$),
        'example', jsonb_build_object('statement', $$Une solution de sulfate de cuivre a une couleur bleue caractéristique. Quel ion est responsable de cette couleur ?$$, 'solution', $$L'ion cuivre Cu2+.$$),
        'fixation', jsonb_build_object('question', $$De quels deux ions le sel de cuisine (chlorure de sodium) est-il constitué ?$$, 'solution', $$L'ion sodium Na+ et l'ion chlorure Cl-.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Un atome de calcium possède 20 protons dans son noyau. Il perd deux électrons pour former un ion.$$,
      'questions', array[
        $$Combien d'électrons possède l'atome de calcium neutre ?$$,
        $$Quel ion obtient-on après la perte des deux électrons ? Précise son symbole et sa charge.$$,
        $$Cet ion est-il un cation ou un anion ? Justifie.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Quelles sont les deux particules chargées présentes dans un atome, et quelles sont leurs charges respectives ?$$,
      'hint', $$L'une est dans le noyau, l'autre l'entoure.$$,
      'expected', $$Le proton, chargé positivement (dans le noyau), et l'électron, chargé négativement (autour du noyau).$$
    ),
    jsonb_build_object(
      'question', $$Un atome neutre possède 13 protons. Combien possède-t-il d'électrons ?$$,
      'hint', $$Pense à la neutralité électrique de l'atome.$$,
      'expected', $$13 électrons, car un atome neutre a autant d'électrons que de protons.$$
    ),
    jsonb_build_object(
      'question', $$Un atome de magnésium perd deux électrons. Quel type d'ion obtient-on, et quelle est sa charge ?$$,
      'hint', $$Perte d'électrons = cation.$$,
      'expected', $$On obtient un cation Mg2+, de charge positive (deux charges positives).$$
    ),
    jsonb_build_object(
      'question', $$Un ion oxyde a pour symbole O2-. Est-ce un cation ou un anion, et comment s'est-il formé à partir de l'atome d'oxygène ?$$,
      'hint', $$Une charge négative provient d'un gain d'électrons.$$,
      'expected', $$C'est un anion : l'atome d'oxygène a gagné deux électrons pour former l'ion O2-.$$
    )
  ),
  content_generated_at = now()
where id = 'pc-4e-atomes-ions';
