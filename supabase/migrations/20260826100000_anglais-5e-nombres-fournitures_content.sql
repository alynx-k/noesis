-- Contenu de secours (fallback) : aucun PDF source correspondant à cette
-- leçon n'a pu être retrouvé sur coll.ecole-ci.org (lien indisponible).
-- Contenu rédigé à partir du programme éducatif officiel DPFC de 5ème
-- (Anglais, compétence "Numbers and school things"), dans le registre des
-- leçons voisines.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Le professeur d'anglais demande aux élèves de 5ème de faire l'inventaire du matériel scolaire dans leur sac, en anglais, pour préparer la rentrée.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: school things$$,
        'body', $$Key words: a bag, a notebook, a textbook, a pen, a pencil, a ruler, an eraser, a pencil case, a sheet of paper, a schoolbag.$$,
        'highlights', array[$$a bag, a notebook, a textbook, a pen, a pencil$$, $$a ruler, an eraser, a pencil case, a sheet of paper$$]::text[],
        'fixation', jsonb_build_object('question', $$What tool do you use to draw a straight line?$$, 'solution', $$A ruler.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: numbers$$,
        'body', $$Numbers 1-20: one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty.$$,
        'highlights', array[$$one to twenty$$]::text[],
        'fixation', jsonb_build_object('question', $$How do you say "quinze" in English?$$, 'solution', $$Fifteen.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: Counting school things$$,
        'body', $$To ask about quantities: "How many pens do you have? — I have three pens." "How many notebooks are there in your bag? — There are five notebooks."$$,
        'highlights', array[$$How many [object]s do you have? / I have [number] [object]s$$]::text[],
        'example', jsonb_build_object('statement', $$Ask how many pencils Kouadio has, knowing the answer is "four".$$, 'solution', $$How many pencils does Kouadio have? — He has four pencils.$$),
        'fixation', jsonb_build_object('question', $$Complete: "There ___ two rulers in my bag." (is/are)$$, 'solution', $$are.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Ton professeur d'anglais te demande de faire l'inventaire de ton sac de classe.$$,
      'questions', array[
        $$Cite cinq objets scolaires que tu as dans ton sac.$$,
        $$Donne le nombre exact de chaque objet en anglais.$$,
        $$Demande à un camarade combien de stylos il possède.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Translate: "J'ai douze crayons dans ma trousse."$$,
      'hint', $$Use "I have + number + pencils".$$,
      'expected', $$I have twelve pencils in my pencil case.$$
    ),
    jsonb_build_object(
      'question', $$What do you call the small object used to erase pencil marks?$$,
      'hint', $$It removes mistakes.$$,
      'expected', $$An eraser.$$
    ),
    jsonb_build_object(
      'question', $$How do you write "18" in letters?$$,
      'hint', $$Between seventeen and nineteen.$$,
      'expected', $$Eighteen.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "How many ___ do you have?" (asking about textbooks)$$,
      'hint', $$Use the plural form of "textbook".$$,
      'expected', $$textbooks.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-5e-nombres-fournitures';
