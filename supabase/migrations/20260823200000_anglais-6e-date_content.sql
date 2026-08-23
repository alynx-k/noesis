-- REAL content sourced from coll.ecole-ci.org (Collège Numérique), Sixième,
-- Anglais, categoryid=43.
-- Moodle: "6è_UNIT 3_TIME AND DATE_Lesson 1_Writing (What's the date?)".
-- Contenu réécrit à partir du PDF source (Learn it, do it 6è, programme
-- officiel MENA) ; situation d'apprentissage, vocabulaire, dialogues et
-- exercices reformulés, non copiés verbatim.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$To reply to their English-speaking pen pals, 6ème students at Lycée Moderne 1 de Daloa write to present their timetable and the birth dates of their family members.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Days of the week$$,
        'body', $$Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday. To ask about today, we say "What's the day today?" — answer: "Today is Wednesday." To ask about the order of a day, we say "What's the second day of the week?" — answer: "It's Tuesday."$$,
        'highlights', array[$$Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday$$, $$What's the day today? → Today is...$$]::text[],
        'fixation', jsonb_build_object('question', $$What's the first day of the week?$$, 'solution', $$"It's Monday."$$)
      ),
      jsonb_build_object(
        'heading', $$Ordinal numbers from 1st to 20th$$,
        'body', $$1st the first, 2nd the second, 3rd the third, 4th the fourth, 5th the fifth, 6th the sixth, 7th the seventh, 8th the eighth, 9th the ninth, 10th the tenth, 11th the eleventh... up to 20th the twentieth. Ordinal numbers are used to say the day of the month and the order of the days of the week.$$,
        'highlights', array[$$1st-3rd are irregular: first, second, third$$, $$from 4th on, add "-th" to the number (with spelling changes: fifth, eighth, ninth, twelfth...)$$]::text[],
        'example', jsonb_build_object('statement', $$Monday is the first day of the week. Write a similar sentence about Wednesday (the third day).$$, 'solution', $$"Wednesday is the third day of the week."$$),
        'fixation', jsonb_build_object('question', $$How do you write "12th" in letters?$$, 'solution', $$"The twelfth."$$)
      ),
      jsonb_build_object(
        'heading', $$Months and asking/giving the date$$,
        'body', $$January, February, March, April, May, June, July, August, September, October, November, December. Ordinal numbers continue: 21st the twenty-first, 30th the thirtieth, 31st the thirty-first, up to 50th the fiftieth. To say the date, we use the day, the month, an ordinal number and the year: "Today is Wednesday, April 15th, 2020." To ask, we say "What's the date today?"$$,
        'highlights', array[$$day + month + ordinal number + year$$, $$What's the date today? → Today is [Day], [Month] [ordinal], [year]$$]::text[],
        'example', jsonb_build_object('statement', $$Write the date "Monday 12/16/2015" in full letters.$$, 'solution', $$"Monday, December the sixteenth, two thousand fifteen."$$),
        'fixation', jsonb_build_object('question', $$Which three elements, besides the day of the week, do you need to say a full date?$$, 'solution', $$The month, an ordinal number (for the day of the month), and the year.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$To get to know his Ghanaian pen pal better, a 6ème student at Lycée Moderne 2 de Daloa writes a five-line paragraph about the birth dates of his family members.$$,
      'questions', array[
        $$Name the seven days of the week and the twelve months of the year.$$,
        $$Write today's date in full letters.$$,
        $$Write a five-line paragraph about your family members giving the birth date of each one.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Reorder the letters to write a day: "UNSADY"$$,
      'hint', $$It's the last day of the week.$$,
      'expected', $$Sunday.$$
    ),
    jsonb_build_object(
      'question', $$What's the fifth day of the week?$$,
      'hint', $$Count from Monday.$$,
      'expected', $$"It's Friday."$$
    ),
    jsonb_build_object(
      'question', $$How do you write "23rd" in letters?$$,
      'hint', $$It's built on "twenty" + a unit.$$,
      'expected', $$"The twenty-third."$$
    ),
    jsonb_build_object(
      'question', $$Write "Saturday 03/31/2014" in full letters.$$,
      'hint', $$Day + month + ordinal number + year.$$,
      'expected', $$"Saturday, March the thirty-first, two thousand fourteen."$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-6e-date';
