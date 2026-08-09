-- Français 6ème catalog, sourced from the official DPFC programme éducatif
-- PDF (Compétence 1: expression orale, Compétence 2: lecture — œuvre
-- intégrale et textes autonomes, Compétence 3: expression écrite,
-- Compétence 4: grammaire, Compétence 5: orthographe) — titles and order
-- only, content generated on demand. Where the source repeats a lesson
-- title across two activities (lecture vs. expression écrite), the title
-- is qualified in parentheses to keep catalog entries unique.
insert into public.courses (id, grade, subject, title, order_index, requires_course_id) values
('fr-6e-dialogue-oral', '6eme', 'francais', 'Le dialogue oral', 1, null),
('fr-6e-oeuvre-integrale', '6eme', 'francais', $$L'étude d'une œuvre intégrale$$, 2, 'fr-6e-dialogue-oral'),
('fr-6e-lecture-lettre-personnelle', '6eme', 'francais', 'La lettre personnelle (lecture)', 3, 'fr-6e-oeuvre-integrale'),
('fr-6e-texte-narratif', '6eme', 'francais', 'Le texte narratif', 4, 'fr-6e-lecture-lettre-personnelle'),
('fr-6e-texte-descriptif', '6eme', 'francais', 'Le texte descriptif', 5, 'fr-6e-texte-narratif'),
('fr-6e-ecriture-lettre-personnelle', '6eme', 'francais', $$La lettre personnelle (rédaction)$$, 6, 'fr-6e-texte-descriptif'),
('fr-6e-recit', '6eme', 'francais', 'Le récit', 7, 'fr-6e-ecriture-lettre-personnelle'),
('fr-6e-description', '6eme', 'francais', 'La description', 8, 'fr-6e-recit'),
('fr-6e-phrase', '6eme', 'francais', 'La phrase', 9, 'fr-6e-description'),
('fr-6e-groupe-nominal', '6eme', 'francais', 'Le groupe nominal', 10, 'fr-6e-phrase'),
('fr-6e-discours-direct-indirect', '6eme', 'francais', 'Le discours direct et le discours indirect', 11, 'fr-6e-groupe-nominal'),
('fr-6e-verbe', '6eme', 'francais', 'Le verbe', 12, 'fr-6e-discours-direct-indirect'),
('fr-6e-groupe-verbal', '6eme', 'francais', 'Le groupe verbal', 13, 'fr-6e-verbe'),
('fr-6e-adverbes', '6eme', 'francais', 'Les adverbes', 14, 'fr-6e-groupe-verbal'),
('fr-6e-orthographe-lexicale', '6eme', 'francais', 'Orthographe lexicale', 15, 'fr-6e-adverbes'),
('fr-6e-orthographe-grammaticale', '6eme', 'francais', 'Orthographe grammaticale', 16, 'fr-6e-orthographe-lexicale');
