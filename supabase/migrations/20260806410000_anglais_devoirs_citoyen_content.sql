-- Same CourseContentV2 shape as anglais-souvenirs-vacances (see
-- 20260806250000_anglais_souvenirs_vacances_content.sql for the
-- rationale/pattern). Structure follows the official ecole-ci.org "UNIT 6
-- LESSON 2: My duties" PDF (expressing necessity and absence of necessity),
-- but every sentence, name, and exercise is an original rewrite.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$Your English Club is preparing a presentation on citizens' duties for a school civic education day. Before the presentation, you need vocabulary and grammar to talk about obligations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: responsibility and duty$$,
        'body', $$Being a responsible citizen means understanding words about accepting responsibility and following the rules of a community.$$,
        'highlights', array[$$to be in charge of$$, $$to comply with$$, $$a regulation$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$to be in charge of$$, $$to be responsible for something$$),
            jsonb_build_array($$to comply with$$, $$to obey or follow a rule$$),
            jsonb_build_array($$to be accountable for$$, $$to answer for or explain something you are responsible for$$),
            jsonb_build_array($$to be dutiful to$$, $$to be respectful towards someone$$),
            jsonb_build_array($$to take part in$$, $$to participate in something$$),
            jsonb_build_array($$a regulation$$, $$a rule that must be followed$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To express necessity, use "have to + base verb", "need to + base verb", or "must + base verb": Citizens have to respect the laws. We must comply with the regulations.$$),
        'example', jsonb_build_object('statement', $$Say what a responsible citizen must do, using two different structures.$$, 'solution', $$A responsible citizen has to pay their taxes. Every citizen must comply with the law.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "need to": "Students must respect school regulations."$$, 'solution', $$Students need to respect school regulations.$$)
      ),
      jsonb_build_object(
        'heading', $$Vocabulary: everyday obligations$$,
        'body', $$Not every duty is about the law -- some obligations are part of everyday life, at home and at school.$$,
        'highlights', array[$$a chore$$, $$mandatory$$, $$to blame$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$employment$$, $$a job$$),
            jsonb_build_array($$a chore$$, $$a small task that needs to be done regularly$$),
            jsonb_build_array($$mandatory$$, $$obligatory; required by a rule$$),
            jsonb_build_array($$school regulations$$, $$the official rules of a school$$),
            jsonb_build_array($$an impost$$, $$a tax$$),
            jsonb_build_array($$to blame someone for$$, $$to say someone is responsible for something wrong$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$To say something is NOT necessary, use "don't/doesn't have to", "don't/doesn't need to", or "needn't + base verb": You don't have to be rich to be honest. You needn't worry about it.$$),
        'example', jsonb_build_object('statement', $$Say that being a leader doesn't require being an adult, using "needn't".$$, 'solution', $$You needn't be an adult to show leadership in your community.$$),
        'fixation', jsonb_build_object('question', $$Rewrite using "don't have to": "It isn't necessary for children to lie to their parents."$$, 'solution', $$Children don't have to lie to their parents.$$)
      ),
      jsonb_build_object(
        'heading', $$Must vs mustn't vs don't have to$$,
        'body', $$These three forms are often confused, but they express three very different ideas about obligation.$$,
        'highlights', array[$$an obligation$$, $$a prohibition$$, $$no obligation$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Must + base verb" expresses an obligation (you have to do it). "Mustn't + base verb" expresses a prohibition (you must NOT do it). "Don't have to + base verb" expresses an absence of obligation (it isn't necessary, but you can if you want).$$),
        'example', jsonb_build_object('statement', $$Compare "You mustn't cheat in exams" and "You don't have to attend the extra class."$$, 'solution', $$"You mustn't cheat in exams" is a prohibition -- it's forbidden. "You don't have to attend the extra class" means it's optional, not forbidden.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct form: "Students ___ (mustn't/don't have to) bring their own chairs; the school provides them."$$, 'solution', $$Students don't have to bring their own chairs; the school provides them -- it's simply not necessary, not forbidden.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$Your English Club is presenting a short talk on citizens' duties for the school's civic education day.$$,
      'questions', array[
        $$Explain two duties every citizen must respect, using "have to" or "must".$$,
        $$Give one example of something that is NOT necessary, using "don't have to" or "needn't".$$,
        $$Explain the difference between a duty and a prohibition, using an example of each.$$,
        $$Conclude by explaining why duties matter for a country's development.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Fill the gap: Citizens ___ (have to) pay their taxes to support public services.$$,
      'hint', $$have to + base verb expresses necessity.$$,
      'expected', $$Citizens have to pay their taxes to support public services.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "must": "It is necessary for students to respect their teachers."$$,
      'hint', $$must + base verb.$$,
      'expected', $$Students must respect their teachers.$$
    ),
    jsonb_build_object(
      'question', $$Rewrite using "don't need to": "It isn't necessary to be famous to help your community."$$,
      'hint', $$don't need to + base verb.$$,
      'expected', $$You don't need to be famous to help your community.$$
    ),
    jsonb_build_object(
      'question', $$Choose the correct form: "You ___ (mustn't/don't have to) steal; it is against the law."$$,
      'hint', $$This describes something forbidden, not just optional.$$,
      'expected', $$You mustn't steal; it is against the law.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-devoirs-citoyen';
