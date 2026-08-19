-- REAL content sourced from lyc.ecole-ci.org (Lycée Numérique), Première A,
-- Anglais, categoryid=118.
-- Moodle course id 1558: "Unit7_Political change_Reading"
-- (https://lyc.ecole-ci.org/course/view.php?id=1558), resource id 12194.
-- Lesson structure (vocabulary, prepositions in phrasal verbs) reused from
-- the source PDF (textbook "Far Ahead 1ère"). The reading text "The Harlem
-- Renaissance" is a textbook excerpt (copyrighted commercial material);
-- its wording is replaced by an ENTIRELY ORIGINAL composition, though the
-- real historical facts and figures it describes (Harlem Renaissance,
-- 1920s-1930s, Langston Hughes, W.E.B. Du Bois, Duke Ellington, Louis
-- Armstrong, Augusta Savage, Lois Mailou Jones, the NAACP) are factual
-- public-domain history and are stated directly, as in the source.
insert into public.courses (
  id, grade, serie, subject, title, order_index, requires_course_id,
  content, exercise_questions, content_generated_at
) values (
  '1ere-a-ang-unit7-political-change-reading',
  '1ere',
  'A',
  'anglais',
  $$Unit 7: Political Change (Reading)$$,
  13,
  '1ere-a-ang-unit6-technology-lives-writing',
  jsonb_build_object(
    'situation', jsonb_build_object(
      'text', $$In order to discuss the Black people's fight for political change in the United States of America, the English Club of your school has invited a guest speaker to give a talk about the African-American renaissance, so that members can get more information.$$
    ),
    'sections', jsonb_build_array(
      jsonb_build_object(
        'heading', $$Vocabulary$$,
        'body', $$Stereotyped views are preconceived ideas with no scientific foundation. Ashamed means feeling sorry for an act. Civic activities are activities related to one's rights and duties as a citizen. To seek means to look for. To despise means to hate. A labour union is an association of workers formed to defend their rights. The civil rights movement refers to actions and manifestations related to people's rights. To achieve means to accomplish, realize or obtain.$$,
        'highlights', array[$$stereotyped, ashamed, civic activities$$, $$to seek, despise, labour union, achieve$$]::text[],
        'fixation', jsonb_build_object('question', $$What is a "labour union"?$$, 'solution', $$An association of workers formed to defend their rights.$$)
      ),
      jsonb_build_object(
        'heading', $$Language function: prepositions in phrasal expressions$$,
        'body', $$Several fixed expressions use specific prepositions: "to take part IN elections" (to participate in elections), "to take away FROM" (to remove or deny something), "to break free FROM" (to no longer be associated with), "to be proud OF" (to be honoured by something), "to bring an end TO" (to stop), "to be forced INTO" (to be obliged to do something).$$,
        'highlights', array[$$take part IN$$, $$proud OF$$, $$forced INTO$$, $$break free FROM$$]::text[],
        'fixation', jsonb_build_object('question', $$Which preposition follows "to be proud"?$$, 'solution', $$Of (to be proud of).$$)
      ),
      jsonb_build_object(
        'heading', $$Reading: The Harlem Renaissance$$,
        'body', $$Harlem, a neighborhood in New York City, was the center of a remarkable cultural rebirth among African Americans during the 1920s and 1930s, known as the Harlem Renaissance. Its background lies in the aftermath of the American Civil War (1861-1865), which finally ended slavery. Although African Americans briefly gained rights such as owning land and voting, many of these rights were soon taken away, and many were forced into conditions close to slavery again, working on plantations. Life in the South remained extremely hard, pushing many African Americans to move to less racist, more urban areas in the North — especially New York — where they met educated African and Caribbean immigrants who were also seeking better lives. Together, they developed a new pride in their African heritage, and Harlem became the symbolic capital of this new artistic and literary movement. Writers such as Langston Hughes and W.E.B. Du Bois inspired people to question and demand their rights. Painters like Lois Mailou Jones and sculptors like Augusta Savage proved that Black women could be brilliant artists. Musicians Duke Ellington and Louis Armstrong made jazz popular across the world. The movement was closely linked to the civil rights movement: writers contributed to publications from organizations such as the NAACP (National Association for the Advancement of Colored People) and the Brotherhood of Sleeping Car Porters, a Black labour union. Through this combination of culture and activism, African Americans gradually achieved greater freedom.$$,
        'highlights', array[$$Harlem Renaissance : 1920s-1930s, New York$$, $$writers : Langston Hughes, W.E.B. Du Bois$$, $$musicians : Duke Ellington, Louis Armstrong$$, $$linked to NAACP and civil rights movement$$]::text[],
        'fixation', jsonb_build_object('question', $$Who are two writers mentioned as inspiring people to demand their rights during the Harlem Renaissance?$$, 'solution', $$Langston Hughes and W.E.B. Du Bois.$$)
      )
    ),
    'evaluation', jsonb_build_object(
      'scenario', $$After reading a text on the African-American renaissance, your teacher asks you to write a paragraph about Black people's living conditions at that period so as to make the notion of "renaissance" clearer.$$,
      'questions', array[
        $$Explain the problems that African Americans had.$$,
        $$List some actions they undertook to change this situation.$$,
        $$Tell what improvements African Americans experienced in their lives later.$$
      ]::text[]
    )
  ),
  jsonb_build_array(
    jsonb_build_object(
      'question', $$During which decades did the Harlem Renaissance take place?$$,
      'hint', $$Two consecutive decades.$$,
      'expected', $$The 1920s and 1930s.$$
    ),
    jsonb_build_object(
      'question', $$Which two musicians made jazz popular all over the world, according to the text?$$,
      'hint', $$Both are famous jazz figures.$$,
      'expected', $$Duke Ellington and Louis Armstrong.$$
    ),
    jsonb_build_object(
      'question', $$What does NAACP stand for?$$,
      'hint', $$It's an organization for the advancement of a specific group.$$,
      'expected', $$The National Association for the Advancement of Colored People.$$
    ),
    jsonb_build_object(
      'question', $$Complete: "The politicians took part ___ the national festival." (which preposition?)$$,
      'hint', $$Same preposition as "take part in elections".$$,
      'expected', $$In.$$
    )
  ),
  now()
);
