-- Anglais 3ème catalog, sourced from the official DPFC programme éducatif
-- PDF (8 compétences, each with one thème and 2-3 leçons) — titles and
-- order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('anglais-souvenirs-vacances', '3eme', 'anglais', $$Souvenirs de vacances (My last holidays)$$, 1, null),
('anglais-souvenirs-ecole', '3eme', 'anglais', $$Souvenirs d'école (School memories)$$, 2, 'anglais-souvenirs-vacances'),
('anglais-travail-ecole', '3eme', 'anglais', $$Le travail à l'école (Work at school)$$, 3, 'anglais-souvenirs-ecole'),
('anglais-femme-rurale', '3eme', 'anglais', 'La femme rurale (Rural women)', 4, 'anglais-travail-ecole'),
('anglais-droits-devoirs-femme', '3eme', 'anglais', $$Droits et devoirs de la femme (Women's rights and duties)$$, 5, 'anglais-femme-rurale'),
('anglais-jeune-fille-ecole', '3eme', 'anglais', $$La jeune fille à l'école (Girls at school)$$, 6, 'anglais-droits-devoirs-femme'),
('anglais-moyens-transport', '3eme', 'anglais', 'Les moyens de transport (Means of transport)', 7, 'anglais-jeune-fille-ecole'),
('anglais-aeroport', '3eme', 'anglais', $$A l'aéroport (At the airport)$$, 8, 'anglais-moyens-transport'),
('anglais-tourisme', '3eme', 'anglais', 'Tourisme (Tourism)', 9, 'anglais-aeroport'),
('anglais-vetements', '3eme', 'anglais', 'Vêtements modernes et vêtements traditionnels (Modern and traditional clothes)', 10, 'anglais-tourisme'),
('anglais-defile-mode', '3eme', 'anglais', 'Défilé de mode (Fashion show)', 11, 'anglais-vetements'),
('anglais-produits-cosmetiques', '3eme', 'anglais', $$Produits cosmétiques (Cosmetics)$$, 12, 'anglais-defile-mode'),
('anglais-a-la-ville', '3eme', 'anglais', 'A la ville (City life)', 13, 'anglais-produits-cosmetiques'),
('anglais-au-village', '3eme', 'anglais', 'Au village (Village life)', 14, 'anglais-a-la-ville'),
('anglais-exode-rural', '3eme', 'anglais', 'Exode rural (Rural exodus)', 15, 'anglais-au-village'),
('anglais-droits-citoyen', '3eme', 'anglais', 'Les droits du citoyen (My rights)', 16, 'anglais-exode-rural'),
('anglais-devoirs-citoyen', '3eme', 'anglais', 'Les devoirs du citoyen (My duties)', 17, 'anglais-droits-citoyen'),
('anglais-tolerance', '3eme', 'anglais', 'La tolérance (Tolerance)', 18, 'anglais-devoirs-citoyen'),
('anglais-maladies-endemiques', '3eme', 'anglais', 'Les maladies endémiques (Endemic diseases)', 19, 'anglais-tolerance'),
('anglais-hygiene-ecole', '3eme', 'anglais', $$L'hygiène à l'école (Hygiene at school)$$, 20, 'anglais-maladies-endemiques'),
('anglais-vih-sida', '3eme', 'anglais', 'Le VIH/SIDA (HIV/AIDS)', 21, 'anglais-hygiene-ecole'),
('anglais-ordinateur', '3eme', 'anglais', $$L'ordinateur (The computer)$$, 22, 'anglais-vih-sida'),
('anglais-telephone', '3eme', 'anglais', 'Le téléphone (The telephone)', 23, 'anglais-ordinateur'),
('anglais-internet', '3eme', 'anglais', $$L'Internet (The Internet)$$, 24, 'anglais-telephone');
