import AsyncStorage from '@react-native-async-storage/async-storage';

export type SpotlightTourStep = {
  id: string;
  kind: 'spotlight';
  targetId: string;
  title: string;
  description: string;
};

export type AnchoredTourStep = {
  id: string;
  kind: 'anchored';
  title: string;
  description: string;
};

export type TourStep = SpotlightTourStep | AnchoredTourStep;

// The guided tour a new account sees right after finishing onboarding
// (select-language.tsx marks it pending, Home's mount effect consumes and
// starts it — see markTourPending/consumeTourPending below). Steps 1-4
// spotlight real elements on Home via useTourTarget; steps 5-7 just describe
// the other three tabs while Home (and its real tab bar) sit behind the
// overlay — spotlighting the literal tab bar icons would mean reaching into
// React Navigation's own tab bar internals, which isn't worth the fragility
// for three explanatory steps.
export const TOUR_STEPS: TourStep[] = [
  {
    id: 'greeting',
    kind: 'spotlight',
    targetId: 'home-greeting',
    title: 'Bienvenue sur Noesis 👋',
    description: 'Ton Accueil résume tout ce qu’il te reste à faire aujourd’hui, en un coup d’œil.',
  },
  {
    id: 'focus-session',
    kind: 'spotlight',
    targetId: 'home-focus-session',
    title: 'Session de concentration',
    description: 'Lance une fusée et reste concentré pendant la durée que tu choisis, sans distraction.',
  },
  {
    id: 'ai-chat',
    kind: 'spotlight',
    targetId: 'home-ai-chat',
    title: 'Ton tuteur IA',
    description: 'Pose une question, fais corriger un devoir en photo, ou prépare-toi pour un contrôle — à toute heure.',
  },
  {
    id: 'subjects',
    kind: 'spotlight',
    targetId: 'home-subjects',
    title: 'Tes matières',
    description: 'Toutes tes matières et leurs cours sont juste en dessous, organisées par ta classe.',
  },
  {
    id: 'tab-communaute',
    kind: 'anchored',
    title: 'Onglet Communauté',
    description: 'Compare ta progression à celle des autres élèves grâce au classement.',
  },
  {
    id: 'tab-fiches',
    kind: 'anchored',
    title: 'Onglet Fiches',
    description: 'Prends tes notes en photo, Noesis en fait des fiches de révision et des cartes mémo.',
  },
  {
    id: 'tab-profil',
    kind: 'anchored',
    title: 'Onglet Profil',
    description: 'Suis tes statistiques, ton atlas spatial, et gère ton compte depuis les réglages.',
  },
];

const TOUR_PENDING_KEY = 'noesis:tour-pending';

// Set right when onboarding completes (select-language.tsx) — Home's own
// mount effect consumes it on the very next render, which is the only
// moment that reliably distinguishes "just-onboarded new account" from
// "returning user reopening the app" (both land on the same Home screen).
export async function markTourPending(): Promise<void> {
  await AsyncStorage.setItem(TOUR_PENDING_KEY, 'true');
}

// Reads and clears in one call — a step ahead like isTourPending() would
// leave a window where two callers could both see "pending" and both start
// the tour.
export async function consumeTourPending(): Promise<boolean> {
  const value = await AsyncStorage.getItem(TOUR_PENDING_KEY);
  if (value !== 'true') {
    return false;
  }
  await AsyncStorage.removeItem(TOUR_PENDING_KEY);
  return true;
}
