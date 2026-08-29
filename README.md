# Noesis

App mobile d'éducation gamifiée pour collégiens et lycéens en Côte d'Ivoire. Voir `docs/PRD.md`, `docs/PLAN.md` et `docs/DESIGN.md` pour le contexte produit.

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

## Structure

- `app/onboarding/*` — création de compte (téléphone ou email, OTP), classe/série, objectifs
- `app/(tabs)/*` — coquille de navigation principale (seul Accueil est fonctionnel en Phase 1, le reste arrive dans les phases suivantes du `docs/PLAN.md`)
- `context/auth.tsx` — session Supabase + profil élève
- `context/onboarding.tsx` — état local du parcours d'inscription
- `supabase/migrations/` — schéma de base de données
