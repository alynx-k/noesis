-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Anglais, categoryid=129.
-- Moodle course id 2214: "Unit 4_Crime and Violence_Speaking"
-- (https://lyc.ecole-ci.org/course/view.php?id=2214), resource id 20010.
-- Contenu réécrit à partir du PDF source (vocabulaire des crimes, fonction
-- langagière "expressing an opinion"). Vocabulaire et exercices factuels
-- repris/adaptés tels quels ; explications reformulées. Consistent with
-- the 1ère A migration of this same unit.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-ang-unit4-crime-violence-speaking',
  '1ere',
  'C',
  'anglais',
  $$Unit 4: Crime and Violence (Speaking)$$,
  8,
  '1ere-c-ang-unit4-crime-violence-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Every day on TV, criminal and violent actions are broadcasted. Students of 1ère C are talking about the different types of crimes in order to give their opinions and suggest some solutions to this problem.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$A misdemeanor is a misconduct, a small crime. A felony is a serious crime. Abduction means kidnapping. Rape means forced sex, sexual assault. Murder means the deliberate killing of a person. Arson is the fact of deliberately starting a fire to cause damage. Burglary means breaking and entering, theft.$$,
        'highlights', array[$$misdemeanor (small crime) vs felony (serious crime)$$, $$abduction, rape, murder, arson, burglary$$]::text[],
        'fixation', jsonb_build_object('question', $$What is the difference between a misdemeanor and a felony?$$, 'solution', $$A misdemeanor is a small crime (misconduct), while a felony is a serious crime.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: expressing an opinion$$,
        'body', $$To express an opinion, we can use "I believe that...", "As I see it...", or "In my view...". Example: "I believe that criminals should be punished." / "As I see it, criminals should be punished." / "In my view, criminals should be punished."$$,
        'highlights', array[$$I believe that... / As I see it... / In my view...$$],
        'fixation', jsonb_build_object('question', $$Give one expression, other than "I believe that", used to introduce an opinion.$$, 'solution', $$For example "As I see it" or "In my view".$$)
      ),
      jsonb_build_object(
        'heading', $$Classifying crimes and giving reasons$$,
        'body', $$Crimes can be classified by seriousness: misdemeanors (small crimes) include cheating, theft (pickpocketing) — while felonies (serious crimes) include murder, rape, abduction, and arson. Each crime has typical facts associated with it: burglary is when someone enters a place and steals something; abduction is when someone is held until a ransom is paid; arson is when someone deliberately sets fire to a building; murder is the deliberate killing of a person.$$,
        'highlights', array[$$misdemeanor : cheating, theft, pickpocketing$$, $$felony : murder, rape, abduction, arson$$]::text[],
        'example', jsonb_build_object('statement', $$Classify "arson" and "cheating": which one is a felony, and which is a misdemeanor?$$, 'solution', $$Arson is a felony (a serious crime), while cheating is a misdemeanor (a small crime).$$),
        'fixation', jsonb_build_object('question', $$What fact typically corresponds to the crime of "abduction"?$$, 'solution', $$Someone is held (kidnapped) until a ransom is paid.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$The members of your English club attended a conference about Crime and Violence. Back at school, you discuss the information you got.$$,
      'questions', array[
        $$List the different kinds of crimes you know and tell your friends what each of them consists in.$$,
        $$Give your opinion about criminality.$$,
        $$Suggest some solutions to stop criminality in your country.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Is "burglary" a misdemeanor or a felony?$$,
      'hint', $$It involves breaking and entering.$$,
      'expected', $$A felony (a serious crime).$$
    ),
    jsonb_build_object(
      'question', $$What does "arson" mean?$$,
      'hint', $$It's related to fire.$$,
      'expected', $$Deliberately starting a fire to cause damage.$$
    ),
    jsonb_build_object(
      'question', $$Give an opinion sentence using "In my view" about criminal punishment.$$,
      'hint', $$Follow the pattern from the lesson.$$,
      'expected', $$Any grammatically correct sentence starting with "In my view", e.g. "In my view, criminals should be punished."$$
    ),
    jsonb_build_object(
      'question', $$What is "abduction" also called?$$,
      'hint', $$It's a synonym given in the vocabulary list.$$,
      'expected', $$Kidnapping.$$
    )
  ),
  now()
);
