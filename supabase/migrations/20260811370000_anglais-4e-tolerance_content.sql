-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806420000_anglais_tolerance_content.sql, the 3ème equivalent, for
-- the CourseContentV2 shape). 3ème covered reported statements, reported
-- yes/no questions, and reported wh-questions/commands; this 4ème lesson
-- steps up to reporting modal verbs ("said she would/could/might") and
-- reported requests, a harder layer of the same indirect-speech system.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A student mediation club at your school resolves conflicts between classmates from different backgrounds. As a note-taker, you must report not only what people said, but what they promised, offered, or requested during the mediation session.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: mediation and understanding$$,
        'body', $$Reporting a mediation session accurately means using vocabulary for compromise, respect, and resolving disagreement.$$,
        'highlights', array[$$to reconcile$$, $$a compromise$$, $$prejudice$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to reconcile$$, $$to make peace between people who disagreed$$),
            jsonb_build_array($$a compromise$$, $$an agreement where each side gives up something$$),
            jsonb_build_array($$prejudice$$, $$an unfair opinion formed without real knowledge$$),
            jsonb_build_array($$to coexist$$, $$to live together peacefully despite differences$$),
            jsonb_build_array($$mutual respect$$, $$respect that both sides show each other$$),
            jsonb_build_array($$open-minded$$, $$willing to consider new or different ideas$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$When reporting modal verbs, "will" becomes "would", "can" becomes "could", and "may" becomes "might": "I will apologise," she said → She said she would apologise.$$),
        'example', jsonb_build_object('statement', $$Report this promise: "I will listen to your side of the story," said Awa.$$, 'solution', $$Awa said she would listen to my side of the story.$$),
        'fixation', jsonb_build_object('question', $$Report this offer: "I can share my notes with you," said Yao.$$, 'solution', $$Yao said he could share his notes with me.$$)
      ),
      jsonb_build_object(
        'heading', $$Reporting requests$$,
        'body', $$A mediation often includes polite requests, which are reported differently from statements or questions -- closer to how commands are reported, but softer.$$,
        'highlights', array[$$asked + person + to$$, $$a polite request$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$A polite request ("Could you please...?" / "Would you...?") is reported with "asked + person + to + base verb": "Could you apologise to her?" he asked → He asked me to apologise to her.$$),
        'example', jsonb_build_object('statement', $$Report this request: "Could you explain your side calmly?" the mediator asked.$$, 'solution', $$The mediator asked me to explain my side calmly.$$),
        'fixation', jsonb_build_object('question', $$Report this request: "Would you please stop interrupting?" she asked him.$$, 'solution', $$She asked him to stop interrupting.$$)
      ),
      jsonb_build_object(
        'heading', $$Combining reported promises and requests$$,
        'body', $$A full mediation report weaves together what each side promised to do and what they were asked to do, showing the whole conversation indirectly.$$,
        'highlights', array[$$a promise$$, $$a request$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "said (that) + subject + would/could/might" for reported promises or offers, and "asked + person + to" for reported requests. Combining both gives a complete, indirect account of a conversation.$$),
        'example', jsonb_build_object('statement', $$Combine a reported promise and a reported request from the same session.$$, 'solution', $$Kader said he would apologise for the misunderstanding, and the mediator asked both students to shake hands.$$),
        'fixation', jsonb_build_object('question', $$Report both parts: "I will try to understand your culture," said Fatou. "Could you do the same?" she asked.$$, 'solution', $$Fatou said she would try to understand my culture, and she asked me to do the same.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your report for the student mediation club must describe, indirectly, what was promised and requested during a session between two students from different backgrounds.$$,
      'questions', array[
        $$Report one promise using "said (that) + subject + would/could/might".$$,
        $$Report one request using "asked + person + to".$$,
        $$Explain how the two students reached a compromise.$$,
        $$Give your opinion on why tolerance matters in a diverse community.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Report this promise: "I will respect your beliefs from now on," said Kouassi.$$,
      'hint', $$"Will" becomes "would" in reported speech.$$,
      'expected', $$Kouassi said he would respect my beliefs from now on.$$
    ),
    jsonb_build_object(
      'question', $$Report this request: "Could you please explain what happened?" the teacher asked.$$,
      'hint', $$Asked + person + to + base verb.$$,
      'expected', $$The teacher asked me to explain what had happened.$$
    ),
    jsonb_build_object(
      'question', $$Report this offer: "I can help you understand our customs," said Aminata.$$,
      'hint', $$"Can" becomes "could" in reported speech.$$,
      'expected', $$Aminata said she could help me understand their customs.$$
    ),
    jsonb_build_object(
      'question', $$Report this request: "Would you please stop making fun of his accent?" she asked the class.$$,
      'hint', $$Asked + person + to + base verb, negative with "stop".$$,
      'expected', $$She asked the class to stop making fun of his accent.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-tolerance';
