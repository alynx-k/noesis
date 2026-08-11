-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1449: "Unit 6_Citizenship_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1449)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10886,
-- redirecting to pluginfile "Unit 6_Citizenship_Reading.pdf". Read
-- directly in the browser PDF viewer (page-by-page screenshots, zoomed in
-- where needed); no file was persisted to disk. The worksheet's own
-- reading passage ("The Amerindians' Last Stand", extracted from "An
-- Illustrated History of the USA" by Bryn O'Callaghan) is a copyrighted
-- textbook excerpt, so it is NOT reproduced or closely paraphrased here:
-- the reading text below is original writing conveying the same general,
-- historical, non-copyrightable facts (broken government promises to a
-- Native American community, a spiritual movement that raised false
-- hopes, a tragic confrontation, and later 20th-century reforms
-- recognising citizenship and self-governance) in different wording and
-- with different specific phrasing. The conditional-sentence language
-- function (type 2: if + simple past, would + verb; type 3: if + past
-- perfect, would have + past participle), the activity types
-- (vocabulary-in-context, matching conditional clauses, comprehension
-- questions), and the closing communication task about sharing an African
-- minority's story are paraphrased from the worksheet's instructions.
-- 100% original wording; no sentence copied from the source. Course
-- content and exercises are entirely in English by design: this is an
-- English-immersion lesson, not a lesson about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-citizenship-reading',
  '2nde',
  'A',
  'anglais',
  $$Unit 6 - Citizenship: Reading About Human Rights$$,
  11,
  '2nde-a-eng-gender-education-listening',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Before reading, students are asked to give two examples of human rights violations, and to think about the reasons that might push some people to violate the rights of others. To collect material for an upcoming English Club debate, they then read a short historical account about a community whose rights were denied for a long time.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Grammar: expressing conditions (types 2 and 3)$$,
        'body', $$To talk about an imagined present or future condition and its result, English uses: If + subject + simple past, subject + would + base verb. Example: "If citizens knew their rights, they would claim them." To talk about an imagined past condition that did NOT happen, and its imagined past result, English uses: If + subject + past perfect, subject + would have + past participle. Example: "If we had attended the conference, we would have received more information."$$,
        'highlights', array[$$if + simple past, would + verb$$, $$if + past perfect, would have + past participle$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Type$$, $$Structure$$, $$Example$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Type 2 (unreal present/future)$$, $$If + simple past, would + verb$$, $$If all states respected human rights, citizens would live better.$$),
            jsonb_build_array($$Type 3 (unreal past)$$, $$If + past perfect, would have + past participle$$, $$If the law had been passed earlier, they would have reached a higher level of development.$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Which conditional type talks about something that did NOT happen in the past, and its imagined past result?$$, 'solution', $$Type 3: if + past perfect, would have + past participle.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary related to rights and conflict$$,
        'body', $$Texts about human rights and historical conflicts often use words like: a reservation, an area of land set aside for a particular group; violated, meaning not respected; combatants, people fighting in a conflict; security, safety or protection; arms, meaning weapons; and committees, small organised groups given responsibility for a specific task, such as self-governance.$$,
        'highlights', array[$$reservation$$, $$violated$$, $$combatants$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Reservation$$, $$Area of land set aside for a particular group$$),
            jsonb_build_array($$Violated$$, $$Not respected$$),
            jsonb_build_array($$Combatants$$, $$People fighting in a conflict$$),
            jsonb_build_array($$Security$$, $$Safety, protection$$),
            jsonb_build_array($$Arms$$, $$Weapons$$),
            jsonb_build_array($$Committees$$, $$Organised groups responsible for a specific task$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$What does it mean for a right to be "violated"?$$, 'solution', $$It means the right was not respected.$$)
      ),
      jsonb_build_object(
        'heading', $$Reading text: A Broken Promise$$,
        'body', $$In the nineteenth century, a government promised a Native American community that it would protect the reservation set aside for them, and provide food, tools and materials to help them farm the land. Over time, most of these promises were broken, and disease spread through the community, killing many. In their difficulty, some turned to a new spiritual movement, whose followers were told that performing a certain ceremony would soon bring back their way of life and make the newcomers' weapons powerless against them. Fearing an uprising, soldiers were sent to disarm the community, and the encounter ended in tragedy, with many men, women, and children killed. It took decades for real change to follow: in the 1920s, a law finally recognised Native Americans as full citizens with the right to vote, and a further law in the 1930s allowed communities to set up their own committees to govern local affairs. Despite these improvements, many of the community's people remained far behind other Americans in health, wealth, and education.$$,
        'highlights', array[$$broken promises$$, $$citizenship rights$$, $$self-governance$$]::text[]
      ),
      jsonb_build_object(
        'heading', $$Practice: building conditional sentences$$,
        'body', $$A common activity gives you the first half of several conditional sentences and asks you to match each with the ending that makes it meaningful and grammatically consistent, paying attention to whether the sentence is type 2 or type 3.$$,
        'highlights', array[$$conditional practice$$],
        'example', jsonb_build_object('statement', $$Match: "If the citizens performed their duties," with the correct ending: (a) the government would provide more protection to them, (b) they would have reached a higher level of development.$$, 'solution', $$(a) "...the government would provide more protection to them." (type 2: simple past condition, "would" result)$$),
        'fixation', jsonb_build_object('question', $$Complete with the correct form: "If the law __________ (pass) earlier, the community __________ (reach) a higher level of development sooner."$$, 'solution', $$"If the law had been passed earlier, the community would have reached a higher level of development sooner." (type 3)$$)
      ),
      jsonb_build_object(
        'heading', $$Comprehension questions about the text$$,
        'body', $$After reading, typical comprehension questions ask: in which country does this situation take place, and how do you know? What were the consequences of the government's broken promises? Why did some members of the community turn to the new spiritual movement? How did the government react to the movement's popularity? And why do certain years mentioned in the text represent turning points for the community's rights?$$,
        'highlights', array[$$comprehension questions$$]::text[],
        'fixation', jsonb_build_object('question', $$Why might a government be alarmed by a popular spiritual or political movement among a group whose rights it has denied?$$, 'solution', $$Because such a movement could unite people and lead them to resist or demand their rights more forcefully, which the government may see as a threat.$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking task: sharing another people's story$$,
        'body', $$After learning about this history, imagine sharing, in an audio message to an American friend, the story of an African minority group. In your recording, you should give the name of the minority group, say where it is from, mention the difficulties it has faced, and explain how it eventually obtained recognition of its rights.$$,
        'highlights', array[$$minority rights$$, $$audio message$$]::text[],
        'fixation', jsonb_build_object('question', $$What four pieces of information should your audio message include about the minority group you choose?$$, 'solution', $$Its name, where it is from, the difficulties it has faced, and how it obtained recognition of its rights.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You are recording an audio message for an American Facebook friend, sharing the story of an African minority group whose rights were denied for a long time before being recognised.$$,
      'questions', array[
        $$Name the minority group you have chosen to talk about and say where it is from.$$,
        $$Describe the main difficulties this group has faced.$$,
        $$Explain how this group eventually obtained recognition of its rights.$$,
        $$Using a type 2 or type 3 conditional sentence, express what might have been different if this group's rights had been respected earlier.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Complete: "If all states __________ (respect) human rights, citizens __________ (live) better."$$,
      'hint', $$This is a type 2 conditional (unreal present).$$,
      'expected', $$"If all states respected human rights, citizens would live better."$$
    ),
    jsonb_build_object(
      'question', $$Complete: "If the conference __________ (organise) earlier, we __________ (receive) more information."$$,
      'hint', $$This is a type 3 conditional (unreal past).$$,
      'expected', $$"If the conference had been organised earlier, we would have received more information."$$
    ),
    jsonb_build_object(
      'question', $$What does the word "reservation" mean in the context of this lesson's reading text?$$,
      'hint', $$Think about land set aside for a group.$$,
      'expected', $$An area of land set aside for a particular group.$$
    ),
    jsonb_build_object(
      'question', $$According to the reading text, what change happened in the 1920s for the community described?$$,
      'hint', $$Think about voting rights.$$,
      'expected', $$A law recognised them as full citizens with the right to vote.$$
    )
  ),
  now()
);
