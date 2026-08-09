-- SVT 4ème catalog, sourced from the official DPFC programme éducatif PDF
-- (Compétence 1: reproduction humaine, Compétence 2: formation et
-- dégradation des roches endogènes, Compétence 3: formation des sols et
-- leurs caractéristiques, Compétence 4: utilisation de l'eau et santé de
-- l'Homme) — titles and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('svt-4e-transformations-corps-humain', '4eme', 'svt', $$Les différentes transformations du corps humain de l'enfance à l'adolescence$$, 1, null),
('svt-4e-devenir-cellules-sexuelles', '4eme', 'svt', $$Le devenir des cellules sexuelles chez l'Homme$$, 2, 'svt-4e-transformations-corps-humain'),
('svt-4e-formation-roches-endogenes', '4eme', 'svt', 'La formation des roches endogènes', 3, 'svt-4e-devenir-cellules-sexuelles'),
('svt-4e-degradation-roches-endogenes', '4eme', 'svt', 'La dégradation des roches endogènes', 4, 'svt-4e-formation-roches-endogenes'),
('svt-4e-formation-sols', '4eme', 'svt', 'La formation des sols', 5, 'svt-4e-degradation-roches-endogenes'),
('svt-4e-textures-sols', '4eme', 'svt', 'Les textures des sols', 6, 'svt-4e-formation-sols'),
('svt-4e-maladies-liees-eau', '4eme', 'svt', $$Les maladies liées à l'eau$$, 7, 'svt-4e-textures-sols'),
('svt-4e-lutte-maladies-liees-eau', '4eme', 'svt', $$La lutte contre les maladies liées à l'eau$$, 8, 'svt-4e-maladies-liees-eau'),
('svt-4e-traitement-eau-souillee', '4eme', 'svt', $$Le traitement de l'eau souillée$$, 9, 'svt-4e-lutte-maladies-liees-eau');
