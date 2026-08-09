-- Fallback content (original, not sourced from ecole-ci.org): site login
-- wall blocked access this session (see
-- 20260806290000_anglais_droits_devoirs_femme_content.sql, the 3ème
-- equivalent, for the CourseContentV2 shape). 3ème covered "have the right
-- to" / "it's my duty to"; this 4ème lesson steps up to the passive voice
-- for rights ("be entitled to") and modal obligation with "ought to", a
-- more formal, legal register than the active-voice 3ème phrasing.
update public.courses
set
  content = jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A local NGO is drafting an English-language leaflet on women's rights and responsibilities for a community awareness campaign. They ask your English Club to help write formal statements, using the more official language found in real charters and declarations.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: rights in formal English$$,
        'body', $$Official documents about rights use a more formal vocabulary than everyday conversation -- words you will meet in charters, laws, and declarations.$$,
        'highlights', array[$$entitled$$, $$to guarantee$$, $$discrimination$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Word / Expression$$, $$Meaning$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$entitled (to something)$$, $$officially allowed to have something$$),
            jsonb_build_array($$to guarantee$$, $$to promise firmly that something will happen$$),
            jsonb_build_array($$discrimination$$, $$unfair treatment based on a group a person belongs to$$),
            jsonb_build_array($$equity$$, $$fairness between different groups$$),
            jsonb_build_array($$to uphold (a right)$$, $$to support and maintain a right$$),
            jsonb_build_array($$a charter$$, $$an official written statement of rights or principles$$)
          )
        ),
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$The passive voice ("be entitled to" + base verb) states a right formally, without naming who grants it: Every woman is entitled to own property. It sounds more official than the active "has the right to".$$),
        'example', jsonb_build_object('statement', $$Rewrite "Every woman has the right to vote" using the passive.$$, 'solution', $$Every woman is entitled to vote.$$),
        'fixation', jsonb_build_object('question', $$Complete with the passive: "Rural women ___ (entitle) to equal pay for equal work."$$, 'solution', $$Rural women are entitled to equal pay for equal work.$$)
      ),
      jsonb_build_object(
        'heading', $$Duties in formal English: "ought to" and "be obliged to"$$,
        'body', $$Duties, too, sound more formal in an official leaflet than in everyday speech, using structures closer to legal or moral obligation.$$,
        'highlights', array[$$ought to$$, $$obliged$$, $$bound (by duty)$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$"Ought to + base verb" expresses a moral obligation, close in meaning to "should" but more formal. "Be obliged to + base verb" is even stronger, close to "must": Society is obliged to protect women's rights.$$),
        'example', jsonb_build_object('statement', $$Rewrite "It's my duty to educate my children" using "ought to".$$, 'solution', $$I ought to educate my children.$$),
        'fixation', jsonb_build_object('question', $$Complete with "be obliged to": "The government ___ ensure equal access to education."$$, 'solution', $$The government is obliged to ensure equal access to education.$$)
      ),
      jsonb_build_object(
        'heading', $$Formal rights vs formal duties$$,
        'body', $$In official English, matching the right structure to rights and to duties makes a statement sound authoritative rather than casual.$$,
        'highlights', array[$$a formal right$$, $$a formal duty$$]::text[],
        'property', jsonb_build_object('label', $$Grammar$$, 'text', $$Use "be entitled to" for a formal right (something guaranteed to a person), and "ought to" / "be obliged to" for a formal duty (something a person or institution must do). Combine both in one text to sound like an official charter.$$),
        'example', jsonb_build_object('statement', $$Combine a formal right and a formal duty about education.$$, 'solution', $$Every girl is entitled to a full education, and the state is obliged to provide it free of charge.$$),
        'fixation', jsonb_build_object('question', $$Choose the correct structure: "Women ___ (be entitled to/ought to) equal treatment before the law."$$, 'solution', $$Women are entitled to equal treatment before the law, because this expresses a right, not a duty.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$The NGO's leaflet must present, in a formal register, one right and one duty related to women in the community.$$,
      'questions', array[
        $$State one right using "be entitled to".$$,
        $$State one duty of society using "ought to" or "be obliged to".$$,
        $$Explain, using vocabulary from the lesson, why discrimination is harmful.$$,
        $$Give your own recommendation for upholding women's rights in your community.$$
      ]::text[]
    )
  ),
  exercise_questions = jsonb_build_array(
    jsonb_build_object(
      'question', $$Rewrite formally using "be entitled to": "A woman has the right to inherit property."$$,
      'hint', $$Use the passive "be entitled to" instead of "has the right to".$$,
      'expected', $$A woman is entitled to inherit property.$$
    ),
    jsonb_build_object(
      'question', $$Complete with "ought to": "Employers ___ pay men and women equally for the same work."$$,
      'hint', $$Ought to + base verb expresses a moral obligation.$$,
      'expected', $$Employers ought to pay men and women equally for the same work.$$
    ),
    jsonb_build_object(
      'question', $$Complete with "be obliged to": "Schools ___ protect every student from discrimination."$$,
      'hint', $$Be obliged to + base verb, a strong formal duty.$$,
      'expected', $$Schools are obliged to protect every student from discrimination.$$
    ),
    jsonb_build_object(
      'question', $$Choose the correct formal structure: "Girls ___ (be entitled to/ought to) attend school just like boys."$$,
      'hint', $$This states a right, not a duty.$$,
      'expected', $$Girls are entitled to attend school just like boys.$$
    )
  ),
  content_generated_at = now()
where id = 'anglais-4e-droits-devoirs-femme';
