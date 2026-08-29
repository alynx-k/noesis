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
- `admin/` — app web Next.js séparée pour la relecture/publication du contenu
