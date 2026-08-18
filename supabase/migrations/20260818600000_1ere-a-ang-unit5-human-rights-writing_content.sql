-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Anglais, categoryid=118.
-- Moodle course id 1549: "Unit 5_Human Rights_ Writing"
-- (https://lyc.ecole-ci.org/course/view.php?id=1549), resource id 12098.
-- Contenu réécrit à partir du PDF source (vocabulaire, third conditional,
-- plan et stratégies de la lettre formelle). Vocabulaire, structure
-- grammaticale et plan de lettre repris/adaptés tels quels ; explications
-- reformulées.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-ang-unit5-human-rights-writing',
  '1ere',
  'A',
  'anglais',
  $$Unit 5: We All Have Rights and Deserve Respect (Writing)$$,
  9,
  '1ere-a-ang-unit4-crime-violence-speaking',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$After a visit to a prison, students of 1ère A decide to write a formal letter to the representative of Human Rights Watch in order to meet the prison officials and help improve prisoners' lives.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$A formal letter is one addressed to an official of an institution or organization. Civil rights are the rights of citizens to political and social freedom and equality. Welfare means the health, happiness and fortunes of a person or a group. To mistreat means to treat badly.$$,
        'highlights', array[$$formal letter, civil rights$$, $$welfare, to mistreat$$]::text[],
        'fixation', jsonb_build_object('question', $$What are "civil rights"?$$, 'solution', $$The rights of citizens to political and social freedom and equality.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: the third conditional (impossible conditions)$$,
        'body', $$We use the third conditional to talk about an unreal, impossible situation in the past. Structure: If + subject + past perfect, subject + would have + past participle. Example: "If citizens had respected civil rights, there wouldn't have been any crime." Another example: "Nobody would have contracted the disease if everybody had respected the instructions."$$,
        'highlights', array[$$If + past perfect, + would have + past participle$$],
        'example', jsonb_build_object('statement', $$Complete: "If they ___ (study) harder, they would have passed the exam."$$, 'solution', $$If they had studied harder, they would have passed the exam.$$),
        'fixation', jsonb_build_object('question', $$What verb form follows "if" in the third conditional?$$, 'solution', $$The past perfect (had + past participle).$$)
      ),
      jsonb_build_object(
        'heading', $$Writing a formal letter$$,
        'body', $$A formal letter follows a clear plan: the writer's address, the date, the receiver's address, the title of the letter, the opening salutation ("Dear Sir/Madam,"), the purpose of the letter, the details (explanations and examples), and the actions requested by the writer. To sound formal: avoid contractions and abbreviations, avoid colloquial expressions ("cool!", "great!"), avoid the first or second person (prefer the third person), avoid the imperative (which can sound rude), and prefer the passive voice over the active voice.$$,
        'highlights', array[$$plan : addresses, date, salutation, purpose, details, requested actions$$, $$formal style : no contractions, no imperative, prefer passive$$]::text[],
        'fixation', jsonb_build_object('question', $$Why should a formal letter avoid the imperative mood?$$, 'solution', $$Because the imperative can sound rude; the passive voice is preferred instead.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$After a visit to the prison of Abidjan, your teacher asks you to organise yourselves in groups to write a formal letter to the representative of Human Rights Watch in order to help improve the prisoners' life.$$,
      'questions', array[
        $$Say why you are writing this letter.$$,
        $$Describe the prisoners' conditions of life.$$,
        $$Mention the actions you would like Human Rights Watch to take for the prisoners.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$What is a "formal letter"?$$,
      'hint', $$Think about who it is addressed to.$$,
      'expected', $$A letter addressed to an official of an institution or organization.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "If I ___ (see) you yesterday, I would have told you about the problem."$$,
      'hint', $$Use the past perfect.$$,
      'expected', $$If I had seen you yesterday, I would have told you about the problem.$$
    ),
    jsonb_build_object(
      'question', $$Name two techniques to make a letter sound more formal.$$,
      'hint', $$Think about pronouns and contractions.$$,
      'expected', $$For example avoiding contractions/abbreviations, and using the third person instead of the first or second person (also valid: avoiding the imperative, preferring the passive voice).$$
    ),
    jsonb_build_object(
      'question', $$In the plan of a formal letter, what comes right after the opening salutation?$$,
      'hint', $$It's the reason you are writing.$$,
      'expected', $$The purpose of the letter.$$
    )
  ),
  now()
);
