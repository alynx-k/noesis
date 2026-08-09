-- Anglais 4ème catalog, sourced from the official DPFC programme éducatif
-- PDF (Compétences 1-8: vie à l'école, femme au travail, voyages, mode,
-- ville/village, droits humains, hygiène et santé, TIC), 3 leçons per
-- compétence — titles and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('anglais-4e-souvenirs-vacances', '4eme', 'anglais', 'Souvenirs de vacances', 1, null),
('anglais-4e-souvenirs-ecole', '4eme', 'anglais', $$Souvenirs d'école$$, 2, 'anglais-4e-souvenirs-vacances'),
('anglais-4e-travail-ecole', '4eme', 'anglais', $$Le travail à l'école$$, 3, 'anglais-4e-souvenirs-ecole'),
('anglais-4e-femme-rurale', '4eme', 'anglais', 'La femme rurale', 4, 'anglais-4e-travail-ecole'),
('anglais-4e-droits-devoirs-femme', '4eme', 'anglais', 'Droits et devoirs de la femme', 5, 'anglais-4e-femme-rurale'),
('anglais-4e-jeune-fille-ecole', '4eme', 'anglais', $$La jeune fille à l'école$$, 6, 'anglais-4e-droits-devoirs-femme'),
('anglais-4e-moyens-transport', '4eme', 'anglais', 'Les moyens de transport', 7, 'anglais-4e-jeune-fille-ecole'),
('anglais-4e-aeroport', '4eme', 'anglais', $$À l'aéroport$$, 8, 'anglais-4e-moyens-transport'),
('anglais-4e-tourisme', '4eme', 'anglais', 'Tourisme', 9, 'anglais-4e-aeroport'),
('anglais-4e-vetements-modernes-traditionnels', '4eme', 'anglais', 'Vêtements modernes et vêtements traditionnels', 10, 'anglais-4e-tourisme'),
('anglais-4e-defile-mode', '4eme', 'anglais', 'Défilé de mode', 11, 'anglais-4e-vetements-modernes-traditionnels'),
('anglais-4e-produits-cosmetiques', '4eme', 'anglais', 'Produits cosmétiques', 12, 'anglais-4e-defile-mode'),
('anglais-4e-ville', '4eme', 'anglais', 'À la ville', 13, 'anglais-4e-produits-cosmetiques'),
('anglais-4e-village', '4eme', 'anglais', 'Au village', 14, 'anglais-4e-ville'),
('anglais-4e-exode-rural', '4eme', 'anglais', 'Exode rural', 15, 'anglais-4e-village'),
('anglais-4e-droits-citoyen', '4eme', 'anglais', 'Les droits du citoyen', 16, 'anglais-4e-exode-rural'),
('anglais-4e-devoirs-citoyen', '4eme', 'anglais', 'Les devoirs du citoyen', 17, 'anglais-4e-droits-citoyen'),
('anglais-4e-tolerance', '4eme', 'anglais', 'La tolérance', 18, 'anglais-4e-devoirs-citoyen'),
('anglais-4e-maladies-endemiques', '4eme', 'anglais', 'Les maladies endémiques', 19, 'anglais-4e-tolerance'),
('anglais-4e-hygiene-ecole', '4eme', 'anglais', $$L'hygiène à l'école$$, 20, 'anglais-4e-maladies-endemiques'),
('anglais-4e-vih-sida', '4eme', 'anglais', 'Le VIH/SIDA', 21, 'anglais-4e-hygiene-ecole'),
('anglais-4e-ordinateur', '4eme', 'anglais', $$L'ordinateur$$, 22, 'anglais-4e-vih-sida'),
('anglais-4e-telephone', '4eme', 'anglais', 'Le téléphone', 23, 'anglais-4e-ordinateur'),
('anglais-4e-internet', '4eme', 'anglais', $$L'Internet$$, 24, 'anglais-4e-telephone');
