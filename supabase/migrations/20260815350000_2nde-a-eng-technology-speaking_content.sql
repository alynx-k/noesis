-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Seconde A,
-- Anglais, categoryid=95.
-- Moodle course id 1436: "Unit 3_Technology_Speaking"
-- (https://lyc.ecole-ci.org/course/view.php?id=1436)
-- Resource "Je lis le résumé de la leçon", mod_resource id 10730,
-- redirecting to pluginfile "Unit 3_Technology_Speaking.pdf" (Far Ahead).
-- Read directly in the browser PDF viewer (page-by-page screenshots,
-- zoomed in where needed); no file was persisted to disk.
-- Rewritten/paraphrased from the source worksheet: the computer-parts
-- vocabulary (computer system, webcam, download, headset, printer,
-- speakers, monitor, base unit, USB flash drive) illustrated in the
-- worksheet's "A Computer System" infographic, the "expressing purposes"
-- structures (to be used for + verb-ing / to be used to + bare
-- infinitive), the question-and-answer practice about each part's
-- function, and the closing speaking tasks (describing a new computer to
-- a friend, presenting a useful application to the English Club). 100%
-- original wording; no sentence copied from the source. Course content
-- and exercises are entirely in English by design: this is an
-- English-immersion lesson, not a lesson about English taught in French.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '2nde-a-eng-technology-speaking',
  '2nde',
  'A',
  'anglais',
  $$Unit 3 - Technology: Speaking About Computer Parts$$,
  6,
  '2nde-a-eng-technology-reading',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$A picture of a desktop computer, with its monitor, base unit, keyboard, mouse and speakers, is shown to the class. Students are asked what technology device they see, which parts of it they can already name, and what each part might be used for. To answer confidently, they first need vocabulary for computer parts and the right grammar to talk about purpose.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary: the parts of a computer system$$,
        'body', $$A computer system is made up of several parts working together. The base unit is the box that contains the processor and does the main computing work. The monitor displays images and text on screen. A webcam captures video, often for online calls. A headset lets you listen to sound and, if it has a microphone, speak as well. Speakers output sound to the room. A printer produces a paper copy of what is on screen. A USB flash drive is a small, portable device used to store and transfer files. To download something means to copy a file from the internet onto your own device.$$,
        'highlights', array[$$base unit$$, $$monitor$$, $$USB flash drive$$]::text[],
        'table', jsonb_build_object(
          'headers', array[$$Part$$, $$Main use$$]::text[],
          'rows', jsonb_build_array(
            jsonb_build_array($$Base unit$$, $$Contains the processor; does the main computing work$$),
            jsonb_build_array($$Monitor$$, $$Displays images and text on screen$$),
            jsonb_build_array($$Webcam$$, $$Captures video, often for online calls$$),
            jsonb_build_array($$Headset$$, $$Lets you listen to (and sometimes record) sound$$),
            jsonb_build_array($$Speakers$$, $$Output sound to the room$$),
            jsonb_build_array($$Printer$$, $$Produces a paper copy of on-screen content$$),
            jsonb_build_array($$USB flash drive$$, $$Stores and transfers files$$)
          )
        ),
        'fixation', jsonb_build_object('question', $$Which part of a computer system contains the processor and does the main computing work?$$, 'solution', $$The base unit.$$)
      ),
      jsonb_build_object(
        'heading', $$Expressing purpose: what something is used for$$,
        'body', $$To explain what a device or an object is for, English uses two similar structures. "Be used for" is followed by a verb in the -ing form: "A monitor is used for displaying images." "Be used to" is followed by the bare infinitive (the base form of the verb without "to" doubled): "A monitor is used to display images." Both sentences mean the same thing, but the grammar after "for" and "to" is different.$$,
        'highlights', array[$$to be used for + verb-ing$$, $$to be used to + bare infinitive$$]::text[],
        'example', jsonb_build_object('statement', $$Say, in two different ways, what a printer is used for.$$, 'solution', $$"A printer is used for making paper copies of documents." / "A printer is used to make paper copies of documents."$$),
        'fixation', jsonb_build_object('question', $$Complete: "A USB flash drive __________ (use) __________ (store) files."$$, 'solution', $$"A USB flash drive is used to store files." (or "is used for storing files")$$)
      ),
      jsonb_build_object(
        'heading', $$Practising questions and answers about computer parts$$,
        'body', $$Once you know the vocabulary and the purpose structures, you can ask and answer questions about any part of a computer system, such as: What is a printer used for? Which part of the computer is used to output sound? What do we use the monitor for? What is the use of the base unit? What helps you enter information into a computer system? What is the function of a USB flash drive?$$,
        'highlights', array[$$question and answer practice$$]::text[],
        'example', jsonb_build_object('statement', $$Answer: "Which part of the computer is used to output sound?"$$, 'solution', $$"The speakers are used to output sound." (or "are used for outputting sound")$$),
        'fixation', jsonb_build_object('question', $$Answer: "What helps you enter information into a computer system?"$$, 'solution', $$The keyboard and the mouse (input devices) help you enter information into a computer system.$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking task: describing your new computer$$,
        'body', $$After receiving a new computer as a gift, you might want to share your excitement with a foreign friend by recording a voice message. In that message, you should describe your new computer and its characteristics, explain what you plan to do with it, and list some of the benefits of owning such a computer.$$,
        'highlights', array[$$describing a device$$, $$voice message$$]::text[],
        'fixation', jsonb_build_object('question', $$Name one benefit you could mention when describing a new computer to a friend.$$, 'solution', $$For example: it helps with schoolwork and research, or it lets you stay in touch with friends and family.$$)
      ),
      jsonb_build_object(
        'heading', $$Speaking task: presenting a useful application$$,
        'body', $$Technology vocabulary is also useful for talking about software, not just hardware. A common speaking task asks you to present, to fellow English Club members, an application you have recently discovered and found useful: you name the application, explain what it is used for, and encourage your classmates to try it.$$,
        'highlights', array[$$presenting an app$$]::text[],
        'fixation', jsonb_build_object('question', $$If you were presenting a translation app to your English Club, what would you say it "is used for"?$$, 'solution', $$For example: "It is used for translating words and sentences between languages." (or "is used to translate...")$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$You want to record a short voice message for a friend abroad, describing the new computer you just received and explaining, part by part, what each element is used for.$$,
      'questions', array[
        $$Name three parts of a computer system and say what each one is used for.$$,
        $$Using "to be used for + verb-ing", explain what a webcam is used for.$$,
        $$Using "to be used to + bare infinitive", explain what a USB flash drive is used to do.$$,
        $$Present, in a few sentences, a useful application you know and explain what it is used for.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Which part of a computer displays images and text on screen?$$,
      'hint', $$It is the screen itself.$$,
      'expected', $$The monitor.$$
    ),
    jsonb_build_object(
      'question', $$Complete with the correct form: "A printer is used __________ (make) paper copies."$$,
      'hint', $$After "used to", use the bare infinitive.$$,
      'expected', $$"A printer is used to make paper copies."$$
    ),
    jsonb_build_object(
      'question', $$Complete with the correct form: "Speakers are used __________ (output) sound."$$,
      'hint', $$After "used for", use the -ing form.$$,
      'expected', $$"Speakers are used for outputting sound."$$
    ),
    jsonb_build_object(
      'question', $$What is a USB flash drive mainly used for?$$,
      'hint', $$Think about carrying files between computers.$$,
      'expected', $$It is used to store and transfer files.$$
    )
  ),
  now()
);
