-- Espagnol 3ème catalog, sourced from the official DPFC programme éducatif
-- PDF (Compétences 1-7: découverte du monde hispanique, échange de
-- civilités, échange d'information, expression d'opinion, expression des
-- goûts/préférences, expression des sentiments, expression de l'ordre) —
-- titles and order only, content generated on demand.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('espagnol-decouverte-monde-hispanique', '3eme', 'espagnol', 'La découverte du monde hispanique', 1, null),
('espagnol-presentation-civilites', '3eme', 'espagnol', 'La présentation des civilités', 2, 'espagnol-decouverte-monde-hispanique'),
('espagnol-echange-information', '3eme', 'espagnol', $$L'échange d'information$$, 3, 'espagnol-presentation-civilites'),
('espagnol-expression-opinion', '3eme', 'espagnol', $$L'expression d'opinion$$, 4, 'espagnol-echange-information'),
('espagnol-expression-gouts-preferences', '3eme', 'espagnol', $$L'expression des goûts et des préférences$$, 5, 'espagnol-expression-opinion'),
('espagnol-expression-sentiments', '3eme', 'espagnol', $$L'expression des sentiments$$, 6, 'espagnol-expression-gouts-preferences'),
('espagnol-expression-ordre', '3eme', 'espagnol', $$L'expression de l'ordre$$, 7, 'espagnol-expression-sentiments');
