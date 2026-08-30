# Noesis

App mobile d'éducation gamifiée pour collégiens et lycéens en Côte d'Ivoire. Voir `docs/PRD.md`, `docs/PLAN.md` et `docs/DESIGN.md` pour le contexte produit.

![Architecture Noesis : ce qui se construit sur quoi](docs/diagrams/diagram-architecture-phases.png)

## Setup — Phase 1 (Auth & Onboarding)

### 1. Dépendances

```
npm install
```

### 2. Projet Supabase

Cette phase nécessite un projet Supabase réel pour que l'inscription/connexion fonctionne.

1. Crée un projet sur [supabase.com](https://supabase.com).
2. Dans **Project Settings → API**, récupère l'URL du projet et la clé `anon public`.
3. Copie `.env.example` en `.env` et renseigne ces deux valeurs :
   ```
   EXPO_PUBLIC_SUPABASE_URL=...
   EXPO_PUBLIC_SUPABASE_ANON_KEY=...
   ```
4. Applique la migration `supabase/migrations/20260829053100_profiles.sql` sur ton projet (via le SQL Editor du dashboard, ou `supabase db push` si tu utilises la CLI Supabase et l'as liée avec `supabase link`).

### 3. Auth par email (OTP)

Fonctionne par défaut dès que le projet est connecté — Supabase envoie un code à 6 chiffres par email (aucune configuration supplémentaire nécessaire pour tester, en dehors des limites du plan gratuit sur le volume d'emails).

### 4. Auth par téléphone (OTP SMS)

Nécessite un fournisseur SMS configuré côté Supabase :

1. Dashboard Supabase → **Authentication → Providers → Phone**.
2. Active le provider et configure un compte Twilio (ou Vonage/MessageBird) avec les identifiants demandés.
3. Les numéros sont envoyés au format international (`+225XXXXXXXXXX` pour la Côte d'Ivoire) — déjà géré par l'app.

Sans provider SMS configuré, la connexion par téléphone échouera avec une erreur explicite ; la connexion par email reste utilisable en attendant.

### 5. Lancer l'app

```
npm run android   # ou npm run ios / npm run web
```

## Setup — Phase 2 (Cours)

![Pipeline de contenu : de l'IA à l'élève](docs/diagrams/diagram-pipeline-contenu.png)

### 1. Migration

Applique aussi `supabase/migrations/20260829060000_courses.sql` (matières, leçons, progression, XP, séries, admins). Elle inclut un seed de quelques leçons publiées en 3ème (Maths, Français) pour tester l'app élève sans attendre le pipeline IA.

### 2. Edge function `generate-course` (génération de leçons par IA)

1. Récupère une clé API sur [Google AI Studio](https://aistudio.google.com/app/apikey).
2. Définis le secret côté Supabase : `supabase secrets set GEMINI_API_KEY=...` (ou Dashboard → Edge Functions → Secrets).
3. Déploie la fonction : `supabase functions deploy generate-course`.
4. Appelle-la (depuis l'admin ou `curl`) avec un JWT admin en `Authorization: Bearer <token>` et un body `{ "subjectSlug": "maths", "grade": "3e", "title": "Les fractions" }` — elle insère la leçon en statut `draft`.

Sans `GEMINI_API_KEY`, la fonction répond une erreur explicite ; le contenu seedé reste disponible pour tester le reste du pipeline.

### 3. Créer ton premier compte admin

1. Crée un utilisateur Supabase (Dashboard → Authentication → Users → Add user, email + mot de passe), ou inscris-toi une fois depuis l'app admin (l'inscription se fait via Supabase Auth — utilise le SQL editor pour créer l'utilisateur si l'admin web ne propose pas encore de formulaire d'inscription).
2. Dans le SQL Editor, ajoute-le à la table admins :
   ```sql
   insert into public.admins (user_id) values ('<uuid-de-l-utilisateur>');
   ```

### 4. Lancer l'admin web

```
cd admin
npm install
cp .env.example .env.local   # renseigne la même URL/clé anon que l'app mobile
npm run dev
```

Ouvre `http://localhost:3000`, connecte-toi avec le compte admin créé ci-dessus.

## Setup — Phase 3 (Abonnement Premium)

### 1. Migration

Applique `supabase/migrations/20260829180000_subscriptions.sql` (table `subscriptions`, fonction `is_premium()`).

### 2. Comptes marchands à créer

Aucun de ces comptes ne peut être créé pour toi (KYC/entreprise requis) :

1. **Wave Business** — [wave.com/business](https://wave.com/en/business/) → créer un compte marchand, récupérer une clé API.
2. **MTN MoMo Developer** — [momodeveloper.mtn.com](https://momodeveloper.mtn.com) → créer une app "Collections", récupérer `Subscription Key`, `API User`, `API Key`.
3. **Orange Money Web Payment** — portail développeur Orange CI → créer une app, récupérer `Client ID`, `Client Secret`, `Merchant Key`.

### 3. Secrets Supabase

```
supabase secrets set WAVE_API_KEY=...
supabase secrets set MTN_SUBSCRIPTION_KEY=... MTN_API_USER=... MTN_API_KEY=...
supabase secrets set ORANGE_CLIENT_ID=... ORANGE_CLIENT_SECRET=... ORANGE_MERCHANT_KEY=...
```

### 4. Déployer les fonctions

```
supabase functions deploy create-checkout-session
supabase functions deploy wave-webhook
supabase functions deploy mtn-webhook
supabase functions deploy orange-webhook
```

Configure l'URL de chaque webhook (`https://<projet>.supabase.co/functions/v1/<nom>-webhook`) dans le dashboard de chaque fournisseur.

⚠️ Les appels aux API Wave/MTN/Orange sont écrits à partir de leur documentation publique mais n'ont pas pu être testés faute de comptes réels — à vérifier/ajuster une fois les identifiants obtenus.

### 5. IAP (App Store / Google Play) — reporté

Volontairement pas implémenté dans cette phase : nécessite `react-native-iap` (module natif absent d'Expo Go, donc un dev client EAS) ainsi que des comptes développeur Apple (99$/an) et Google (25$ unique) que je ne peux pas créer. Le schéma `subscriptions` prévoit déjà les providers `iap_ios`/`iap_android` pour l'ajouter plus tard sans migration.

## Setup — Phase 4 (Exercices corrigés)

### 1. Migration

Applique `supabase/migrations/20260829200000_exercises.sql` (tables `exercises`/`exercise_answers`/`exercise_progress`, fonction `submit_exercise_attempt()`).

### 2. Créer des exercices

Depuis l'admin web (`/lessons/[id]`), en dessous de l'éditeur de leçon : ajoute une question, 4 options, sélectionne la bonne réponse et une explication, puis publie l'exercice. Aucune génération IA pour l'instant — création manuelle uniquement.

### 3. Comportement

- Un élève Premium peut valider une réponse et voit immédiatement la correction (bonne réponse + explication), avec 10 XP crédités à la première tentative.
- Un élève gratuit voit la question mais ne peut pas valider ; un bandeau invite à passer Premium.
- La bonne réponse et l'explication ne sont jamais renvoyées au client avant soumission (table `exercise_answers` séparée, sans policy de lecture élève — uniquement lisible par la fonction `submit_exercise_attempt()`).

## Setup — Phase 5 (Flashcards gratuites)

### 1. Migration

Applique `supabase/migrations/20260829210000_flashcards.sql` (tables `flashcard_decks`/`flashcards`/`srs_reviews`, fonction `review_flashcard()`).

### 2. Créer des decks

Depuis l'admin web (`/lessons/[id]`), section "Decks de flashcards" : crée un deck, publie-le, puis ouvre `/decks/[id]` pour ajouter des cartes (recto/verso). Aucune génération IA pour l'instant — création manuelle uniquement.

### 3. Comportement

- Gratuit pour tout élève, sans gating Premium (contrairement aux exercices).
- Répétition espacée simplifiée (SM-2) : une carte "Je savais" repousse son échéance (1 jour → 6 jours → intervalle × ease) ; "Encore" la remet à J+1. Seules les cartes dues sont proposées dans une session de révision.
- Chaque révision crédite 3 XP ; la fonction `review_flashcard()` refuse de créditer une carte qui n'est pas encore due (anti-abus).
- Onglet "Fiches" : liste des decks groupés par matière avec un badge du nombre de cartes dues aujourd'hui.

## Setup — Phase 6 (Flashcards personnalisées)

### 1. Migration

Applique `supabase/migrations/20260829220000_personal_flashcards.sql` (colonne `flashcard_decks.user_id`, policies RLS pour les decks perso, `review_flashcard()` mis à jour pour gérer les deux types de deck).

### 2. Comportement

- Un élève Premium peut créer, éditer et supprimer ses propres decks/cartes depuis l'onglet "Fiches" ("Mes decks" → "+ Nouveau deck").
- Un élève gratuit voit l'option de création verrouillée (redirection vers `/subscription`).
- Un deck personnalisé entre dans le même moteur de répétition espacée que les decks pré-faits (`review_flashcard()` inchangé côté SRS/XP) ; il reste révisable même si l'abonnement expire ensuite — seules création/édition/suppression sont gatées Premium (appliqué à la fois par RLS et par l'UI).
- Un deck est soit pré-fait (`lesson_id`, géré par l'admin) soit personnel (`user_id`, géré par son propriétaire), jamais les deux (contrainte `flashcard_decks_owner_xor_lesson_check`).

## Setup — Phase 7 (Tuteur IA — chat)

### 1. Migration

Applique `supabase/migrations/20260829230000_ai_tutor.sql` (colonne `profiles.ai_trials_used`, tables `ai_conversations`/`ai_messages`).

### 2. Déployer la fonction

```
supabase functions deploy ai-tutor-chat
```

### 3. Secret Gemini

Réutilise le même secret que `generate-course` (Phase 2), déjà configuré sur le projet live :

```
supabase secrets set GEMINI_API_KEY=...
supabase secrets set GEMINI_MODEL=gemini-3.6-flash   # gemini-2.5-flash n'est plus disponible
```

### 4. Comportement

- Un élève Premium peut discuter sans limite avec le tuteur IA (`app/ai-chat.tsx`, historique des conversations) et reprendre une conversation précédente.
- Un élève gratuit dispose de 3 essais à vie (`AI_FREE_TRIAL_LIMIT`, compteur affiché) partagés avec la Phase 8 (devoirs par photo) puis est bloqué avec une invitation Premium ; le compteur (`profiles.ai_trials_used`) n'est incrémenté qu'après une réponse réussie du tuteur.
- Le prompt système adapte le niveau de réponse à la classe (et série) de l'élève, et encourage la pédagogie plutôt que la réponse brute à un exercice.
- Conversations/messages ne sont jamais écrits par le client : uniquement par la fonction `ai-tutor-chat` (service role), comme les paiements en Phase 3.

## Setup — Phase 8 (Tuteur IA — devoirs par photo)

### 1. Déployer la fonction

```
supabase functions deploy homework-photo
```

Réutilise les mêmes secrets `GEMINI_API_KEY`/`GEMINI_MODEL` que la Phase 7 — rien à configurer en plus.

### 2. Comportement

- Deux modes depuis l'écran "Tuteur IA" : "Corriger un devoir" (photo d'un devoir déjà fait → correction détaillée réponse par réponse) et "Préparer un devoir" (photo d'un énoncé → accompagnement guidé, jamais la réponse finale directe) — US-10, US-11.
- Photo vraiment illisible (page blanche, floue, noire) : le prompt demande à Gemini de répondre par un marqueur `ILLISIBLE` plutôt que d'improviser ; l'app affiche alors un message clair invitant à reprendre la photo, sans consommer d'essai (US-35). ⚠️ Cette condition a été volontairement resserrée après un bug où une clause trop large ("ou ne montre pas un devoir d'élève") faisait déclencher `ILLISIBLE` même sur des photos parfaitement nettes dès qu'elles ne ressemblaient pas à un cahier manuscrit — voir l'historique Git pour le détail de l'investigation.
- Partage le même quota Premium/essais gratuits que le chat (`profiles.ai_trials_used`, logique commune dans `supabase/functions/_shared/ai-trials.ts`).
- Aucun historique persisté (contrairement au chat) : chaque photo est un aller-retour ponctuel, conformément aux critères d'acceptation de cette phase.
- Nécessite `expo-image-picker` (permissions caméra/galerie déclarées dans `app.json`) et `expo-image-manipulator` (normalise la taille/compression de la photo avant l'envoi à Gemini).

## Setup — Phase 9 (Focus session)

### 1. Migration

Applique `supabase/migrations/20260830000000_focus_session.sql` (fonction `complete_focus_session()`).

### 2. Comportement

- Un élève choisit une durée (15/25/45/60 min) et lance une session chronométrée ; à la fin, un résumé affiche la durée et l'XP gagné (1 XP par minute) — US-17, US-20.
- **Blocage des notifications géré manuellement des deux côtés**, pas automatiquement sur Android : un bandeau explique comment activer Ne pas déranger (Android) ou un Focus dédié (iOS), avec un bouton qui ouvre directement les réglages système concernés (`Linking.sendIntent('android.settings.ZEN_MODE_SETTINGS')` sur Android, réglages de l'app sur iOS faute de lien profond public vers Focus) — US-18, US-19.
- ⚠️ Écart assumé par rapport au critère d'acceptation strict ("les notifications sont *effectivement* bloquées" sur Android) : l'activation automatique du mode Ne pas déranger nécessite une permission système privilégiée (`ACCESS_NOTIFICATION_POLICY`) inaccessible depuis Expo Go — il faudrait un dev client EAS custom, comme pour l'IAP (Phase 3). Choix fait pour garder l'app testable dans Expo Go ; à revisiter si le projet passe un jour à un dev client.
- La durée créditée est limitée aux paliers fixes (15/25/45/60) côté serveur : un client ne peut pas déclarer une durée arbitraire non réellement chronométrée.

## Structure

- `app/onboarding/*` — création de compte (téléphone ou email, OTP), classe/série, objectifs
- `app/(tabs)/*` — coquille de navigation principale (Accueil et Cours fonctionnels, le reste arrive dans les phases suivantes du `docs/PLAN.md`)
- `app/subject/[disciplineId].tsx`, `app/course/[id].tsx` — liste des leçons d'une matière, lecture d'une leçon
- `context/auth.tsx` — session Supabase + profil élève
- `context/onboarding.tsx` — état local du parcours d'inscription
- `hooks/queries/*` — accès aux données (React Query + Supabase), gestion explicite chargement/erreur
- `components/markdown-lite.tsx` — rendu Markdown minimal pour le contenu de cours (pas de dépendance markdown-it/linkify-it, vulnérable et incompatible avec le bundling Metro)
- `supabase/migrations/` — schéma de base de données
- `supabase/functions/generate-course/` — génération de leçons par IA (Gemini)
- `app/subscription.tsx` — paywall Premium, choix Wave/MTN/Orange
- `supabase/functions/create-checkout-session/`, `*-webhook/` — paiement Premium (mobile money)
- `app/exercise/[lessonId].tsx` — QCM corrigés d'une leçon, verrouillés hors Premium
- `app/(tabs)/fiches.tsx`, `app/lesson-flashcards/[lessonId].tsx`, `app/flashcard-deck/[id].tsx` — decks de flashcards par matière, sélection du deck d'une leçon, session de révision
- `app/personal-deck/new.tsx`, `app/personal-deck/[id].tsx` — création et gestion (CRUD) des decks personnalisés, réservé Premium
- `app/ai-chat.tsx`, `app/ai-chat/[id].tsx` — historique des conversations et chat avec le tuteur IA (Gemini), essais limités hors Premium
- `supabase/functions/ai-tutor-chat/` — chat multi-tour avec le tuteur IA (Gemini), quota d'essais gratuits
- `app/correct-homework.tsx`, `app/prepare-homework.tsx`, `components/homework-photo-screen.tsx` — devoir corrigé ou préparé à partir d'une photo
- `supabase/functions/homework-photo/`, `supabase/functions/_shared/ai-trials.ts` — tuteur IA sur photo (Gemini vision), quota partagé avec le chat
- `app/focus-session.tsx` — session de concentration chronométrée, guidage Ne pas déranger/Focus, résumé XP
- `admin/` — app web Next.js séparée pour la relecture/publication du contenu (leçons, exercices, flashcards pré-faites)
