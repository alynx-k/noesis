-- Espagnol 4ème catalog, sourced from the official DPFC programme éducatif
-- PDF (Compétences 1-7: découverte du monde hispanique, échange de
-- civilités, échange d'information, expression d'opinion, expression des
-- goûts/préférences, expression des sentiments, expression de l'ordre) —
-- titles and order only, content generated on demand. Note: the official
-- 4ème programme reuses the exact same 7 compétences/titles as 3ème,
-- applied to more advanced situations; only the id prefix distinguishes
-- this catalog from the 3ème one.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('espagnol-4e-decouverte-monde-hispanique', '4eme', 'espagnol', 'La découverte du monde hispanique', 1, null),
('espagnol-4e-presentation-civilites', '4eme', 'espagnol', 'La présentation des civilités', 2, 'espagnol-4e-decouverte-monde-hispanique'),
('espagnol-4e-echange-information', '4eme', 'espagnol', $$L'échange d'information$$, 3, 'espagnol-4e-presentation-civilites'),
('espagnol-4e-expression-opinion', '4eme', 'espagnol', $$L'expression d'opinion$$, 4, 'espagnol-4e-echange-information'),
('espagnol-4e-expression-gouts-preferences', '4eme', 'espagnol', $$L'expression des goûts et des préférences$$, 5, 'espagnol-4e-expression-opinion'),
('espagnol-4e-expression-sentiments', '4eme', 'espagnol', $$L'expression des sentiments$$, 6, 'espagnol-4e-expression-gouts-preferences'),
('espagnol-4e-expression-ordre', '4eme', 'espagnol', $$L'expression de l'ordre$$, 7, 'espagnol-4e-expression-sentiments');
