-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première C,
-- Anglais, categoryid=129.
-- Moodle course id 2242: "UNIT 8 : AFRICAN CULTURAL HERITAGE-Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=2242), resource id 20346.
-- (A second course, id 2245 "UNIT 8 : AFRICAN CULTURAL HERITAGE_Reading",
-- resource id 20370, was confirmed to point to the byte-for-byte identical
-- PDF via MD5 checksum — a duplicate listing, not distinct content — so
-- only one migration is authored for this lesson, consistent with the
-- single Reading lesson in the 1ère A version of this unit.)
-- Lesson structure (vocabulary, connectors: however/thereby/nevertheless/
-- also/as/after) reused from the source PDF (textbook "Far Ahead 1ère").
-- The reading text "African ceremonies: Passages" (adapted by the PDF's
-- authors from a Google Cultural Institute exhibit, a copyrighted
-- contemporary source that also directly quotes and names a real,
-- recently-deceased author, Malidoma Patrice Somé) is replaced by an
-- ENTIRELY ORIGINAL passage covering the same real, factual anthropological
-- content (rites of passage; Himba, Wodaabe and Maasai naming customs),
-- without reproducing the copyrighted wording or the named individual's
-- quote. Consistent with the 1ère A migration of this same unit.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-c-ang-unit8-african-heritage-reading',
  '1ere',
  'C',
  'anglais',
  $$Unit 8: African Cultural Heritage (Reading)$$,
  16,
  '1ere-c-ang-unit8-african-heritage-listening',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In this globalized world, it is harder and harder to keep African cultural heritage. In order to involve students in reflecting on the issue, the library of your school has launched an essay competition asking you to discuss what you consider to be the main African cultural legacy.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$Expectations means hopes. Custodians means guardians. Hazards means threats or dangers. To encompass means to incorporate or contain. To bind means to link. An ordeal means suffering, a painful experience.$$,
        'highlights', array[$$expectations, custodians, hazards$$, $$encompasses, bind, ordeal$$]::text[],
        'fixation', jsonb_build_object('question', $$What does "custodians" mean?$$, 'solution', $$Guardians.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: connecting ideas$$,
        'body', $$We use connectors to link ideas clearly. "However" introduces a contrast: "Education is good, however it has become expensive today." "After" introduces sequence: "After my exam, I will go to university." "As" can mean "because": "Daddy takes care of the family as he is the chief." "Thereby" introduces a result: "My students listen to English podcasts, thereby they learn native pronunciation." "Also" adds information: "Angbomon is a teacher and also an educator." "Nevertheless" introduces a contrast despite something: "Peter is top of the class, nevertheless he continues to make effort."$$,
        'highlights', array[$$however / nevertheless = contrast$$, $$thereby = result$$, $$as = because ; also = addition$$]::text[],
        'fixation', jsonb_build_object('question', $$Which connector would you use to introduce a result, similar to "so"?$$, 'solution', $$Thereby.$$)
      ),
      jsonb_build_object(
        'heading', $$Reading: African rites of passage$$,
        'body', $$Since ancient times, African societies have marked the major transitions of life — birth, coming of age, marriage, death — with rites of passage. These ceremonies matter both for the individual and for the community: they give people a clear sense of what society expects of them, as well as a strong sense of identity and belonging. From the moment of birth, an African child is connected to family, community and ancestors, and many ceremonies exist to reinforce this bond and prepare children to become the custodians of their people's culture. Because infant mortality has historically been high in many regions, several cultures developed protective customs around early childhood. The Himba of Namibia, for example, traditionally keep a baby close at all times, believing that a child left alone could be taken by a malevolent spirit. The Wodaabe of Niger have traditionally delayed naming a child until around age twelve, so that the spirit of death could not identify and target the child by name. The Maasai, however, follow the opposite custom: names are given by village elders very soon after birth, since they are considered essential to a child's identity from the start. As children grow, they learn skills and responsibilities that let them contribute to their community, but childhood is nevertheless also a time for imaginative play and creativity. As African youngsters reach their teenage years, they typically undergo initiation rituals guided by a group of elders. Initiates often withdraw to a special place — a sacred forest or a specially built house — where they leave behind their childhood identity. After a period of instruction, they face a final ordeal that marks the peak of the initiation and the beginning of their adult life, thereby binding them permanently to their community.$$,
        'highlights', array[$$rites of passage : birth, initiation, marriage, death$$, $$Himba, Wodaabe, Maasai : contrasting naming customs$$, $$initiation : instruction → ordeal → adult identity$$]::text[],
        'fixation', jsonb_build_object('question', $$Give two opposite customs regarding naming a baby, according to the text.$$, 'solution', $$The Wodaabe of Niger traditionally wait until around age twelve to name a child, while the Maasai give names very soon after birth.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$The National Coordination of English clubs has launched a writing contest on the topic: "Rites of initiation are useful in Africans' education."$$,
      'questions', array[
        $$Define what a rite of initiation is in traditional Africa.$$,
        $$List two or three rites of initiation still practised in your area.$$,
        $$Explain how these rites are useful in Africans' education.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$Why do many African cultures traditionally protect young children with special customs, according to the text?$$,
      'hint', $$It's linked to a historical demographic factor.$$,
      'expected', $$Because infant mortality has historically been high, leading to protective customs against perceived spiritual hazards.$$
    ),
    jsonb_build_object(
      'question', $$What do the Himba of Namibia traditionally believe could happen if a baby is left alone?$$,
      'hint', $$It involves a spiritual threat.$$,
      'expected', $$That the child could be taken by a malevolent spirit.$$
    ),
    jsonb_build_object(
      'question', $$Where do initiates often withdraw to during the training phase of an initiation?$$,
      'hint', $$Two examples are given in the text.$$,
      'expected', $$A sacred forest or a specially built house.$$
    ),
    jsonb_build_object(
      'question', $$What marks the end of the initiation and the beginning of adult life, according to the text?$$,
      'hint', $$It's a difficult final test.$$,
      'expected', $$A final ordeal (a painful or difficult encounter).$$
    )
  ),
  now()
);
