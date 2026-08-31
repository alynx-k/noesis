# Design System — Noesis

## Product Context
- **Quoi** : App mobile d'éducation gamifiée (cours, tuteur IA, flashcards SRS, ligues hebdomadaires, séries/XP, Premium) pour le programme scolaire ivoirien.
- **Pour qui** : Collégiens et lycéens ivoiriens (11-18 ans), zone urbaine, smartphone Android d'entrée de gamme majoritairement.
- **Espace** : Edtech grand public gamifiée, référence Duolingo — mais enjeu BEPC/BAC qui exige plus de crédibilité qu'une app de langue casual.
- **Type** : App mobile grand public (React Native/Expo).
- **Memorable thing** : "Que ce soit perçu comme une bonne app" — traduit en direction concrète : suffisamment chaleureuse et ludique pour que la gamification fonctionne, sans jamais paraître futile aux yeux d'un parent qui paie pour du BEPC/BAC.

## Aesthetic Direction
- **Direction** : Playful/Toy-like tempéré.
- **Décoration** : Intentionnelle — illustration et couleur réservées aux moments clés (palier de ligue, jalon de série), pas de mascotte permanente ni d'animations lourdes.
- **Mood** : Chaleureux et énergique au quotidien (streak, XP), mais structuré et confiant dès qu'il s'agit du contenu de cours ou de Premium.
- **Références** : Duolingo (mécaniques de gamification), Khan Academy (registre edtech sérieux) — direction volontairement différenciée des deux sur la couleur pour ne pas paraître clone.

## Typography
- **Display/Hero** : Cabinet Grotesk (Bold/Black) — géométrique avec du caractère, porte les moments forts (accueil, jalons, promotions de ligue). Auto-hébergée (licence ITF Free Font License, usage commercial mobile autorisé) car absente de Google Fonts.
- **Body** : Plus Jakarta Sans — chaleureuse, très lisible en petite taille sur écran Android d'entrée de gamme.
- **Data/Tables** : Geist (tabular-nums) — alignement propre des chiffres qui changent souvent (XP, classement, série).
- **Code** : JetBrains Mono — réservé à l'outil d'admin de contenu (file de relecture).
- **Loading** : `@expo-google-fonts/plus-jakarta-sans`, `@expo-google-fonts/geist`, `@expo-google-fonts/jetbrains-mono` ; Cabinet Grotesk chargée via `expo-font` depuis `assets/fonts/`.
- **Scale** : 12 / 13 / 14 / 15.5 / 16 / 17 / 22 / 26 / 32 / 40-84 (hero fluide) px.

## Color
- **Approche** : Balanced — orange en primaire, navy en secondaire, sémantiques standards.
- **Primary** : `#E85D2C` — CTA, streak, énergie du quotidien.
- **Secondary** : `#17203D` — structure, Premium, en-têtes, cartes de ligue.
- **Neutrals** : `#FBF9F6` → `#F3EFE9` → `#D8D2C7` → `#8A8272` → `#4A4438` → `#221F19` (clair → sombre, teinte chaude).
- **Semantic** : success `#2F9E5B`, warning `#E0A324`, error `#D64545`, info `#3172C7`.
- **Dark mode** : Fond `#221F19` / cartes `#2C2820` / texte `#FBF9F6` ; primary/secondary inchangés, tints ajustés pour le contraste (`primaryTint` `#3A2416`, `secondaryTint` `#1D2438`). Bascule automatique via `userInterfaceStyle: "automatic"` (`useColorScheme`), pas de sélecteur manuel en Phase 1 — prévu Phase 12.

## League Tier Colors
- **Approche** : 8 paliers, du plus bas (Bois) au plus haut (Diamant). 4 réutilisent les couleurs sémantiques déjà tranchées (Or = Warning, Rubis = Error, Émeraude = Success, Diamant ≈ Info éclairci) ; seuls Fer, Bronze et Argent sont des teintes nouvelles — pas d'explosion de palette pour un système de statut secondaire.
- **Bois** `#8A8272` (= Neutral 500)
- **Fer** `#6B7280`
- **Bronze** `#C77B3E`
- **Argent** `#9CA3AF`
- **Or** `#E0A324` (= Warning)
- **Rubis** `#D64545` (= Error)
- **Émeraude** `#2F9E5B` (= Success)
- **Diamant** `#5EC9E8`

## Iconography
- **Librairie** : Ionicons via `@expo/vector-icons` — déjà inclus avec Expo, zéro dépendance ajoutée.
- **Style** : variante `-outline` pour l'état inactif/par défaut, pleine (filled) pour l'état actif/sélectionné — même logique que la sélection d'onglet déjà en place dans la nav.
- **Usage** : navigation (onglets), actions (partage, réglages, support), retours d'état (succès/erreur).
- **Alternative envisagée, non retenue** : Phosphor (`phosphor-react-native`) — traits plus arrondis et distinctifs, mais dépendance supplémentaire à maintenir pour un gain marginal à ce stade.

## Brand Mark
- **Approche** : wordmark typographique — "Noesis" en Cabinet Grotesk Black, pas de mark pictural séparé à produire/maintenir.
- **Icône d'app** : un "N" recadré du wordmark, sur fond secondaire (navy `#17203D`).
- **Rationale** : cohérent avec "la typo porte les moments forts" déjà tranché en Typography ; bon marché à produire sans illustrateur dédié, se recadre proprement à toutes les tailles d'icône.

## Illustration
- **Approche** : formes géométriques plates dans la palette existante (blocs de couleur, éclats façon confettis anguleux) — pas de personnage/mascotte, cohérent avec la Décoration "intentionnelle" déjà tranchée en Aesthetic Direction.
- **Usage** : réservé aux moments de célébration (montée de palier de ligue, jalon de série 7/30/100 jours) — pas de décor permanent ailleurs dans l'app.

## Spacing
- **Base** : 8px.
- **Densité** : Confortable — zones de tap généreuses pour un usage à une main sur écran milieu de gamme.
- **Scale** : 2xs(2) xs(4) sm(8) md(16) lg(24) xl(32) 2xl(48) 3xl(64).

## Layout
- **Approche** : Grid-disciplined — navigation par onglets, grilles de cartes prévisibles.
- **Grid** : Mobile uniquement (pas de breakpoints desktop pour l'app élève) ; grilles de cartes 2 colonnes pour les sélecteurs (ex. classe).
- **Max content width** : N/A (mobile plein écran, padding horizontal `lg` = 24px).
- **Border radius** : sm:8px, md:14px, lg:20px, full:9999px (réservé aux pills/boutons/avatars, jamais appliqué systématiquement).

## Motion
- **Approche** : Intentionnel — célébrations ciblées (fin de leçon, montée de palier, jalon de série), pas de chorégraphie constante.
- **Easing** : enter(ease-out) exit(ease-in) move(ease-in-out).
- **Duration** : micro(50-100ms) court(150-250ms) moyen(250-400ms) long(400-700ms).

## Decisions Log
| Date | Décision | Rationale |
|------|----------|-----------|
| 2026-08-29 | Création initiale | `/design` — App édition gamifiée Côte d'Ivoire ; orange+navy choisi pour se différencier de Duolingo (vert) et Khan Academy (bleu) tout en gardant assez de sérieux pour un contexte BEPC/BAC payé par les parents |
| 2026-08-29 | Palette et typographie implémentées en Phase 1 | `constants/theme.ts` — thème clair/sombre appliqué dès l'onboarding et l'authentification |
