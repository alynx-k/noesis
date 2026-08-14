import AsyncStorage from '@react-native-async-storage/async-storage';

import { getActiveDays, getStreakInfo } from '@/lib/streak';

export type WidgetState = 'COMPLETED' | 'MORNING' | 'AFTERNOON' | 'NIGHT_DANGER' | 'BROKEN';

export type WidgetData = {
  state: WidgetState;
  streak: number;
  matiere: string;
  updatedAt: string; // ISO
};

type WidgetStateInput = {
  streak: number;
  hasCompletedToday: boolean;
  hour: number; // 0-23
};

// 1. ÉTATS DU WIDGET — the spec only defines MORNING (8-12), AFTERNOON
// (12-18) and NIGHT_DANGER (21-24); the 18-21 and 0-8 gaps aren't covered
// by a dedicated state, so they fall back to the neighbor with the closest
// tone: 18-21 reads as AFTERNOON ("incitatif"), 0-8 reads as MORNING
// ("motivée/prête") since nobody's realistically anxious about revision at
// 3am. hasCompletedToday always wins (celebrate first), streak === 0 is
// the same "lost streak" detection used by the notification scheduler
// (lib/notification-scheduler.ts's checkAndHandleStreakLoss).
export function computeWidgetState({ streak, hasCompletedToday, hour }: WidgetStateInput): WidgetState {
  if (hasCompletedToday) {
    return 'COMPLETED';
  }
  if (streak === 0) {
    return 'BROKEN';
  }
  if (hour >= 21) {
    return 'NIGHT_DANGER';
  }
  if (hour >= 12) {
    return 'AFTERNOON';
  }
  return 'MORNING';
}

// For NIGHT_DANGER's "compte à rebours avant minuit".
export function getMillisecondsUntilMidnight(reference: Date = new Date()): number {
  const midnight = new Date(reference);
  midnight.setHours(24, 0, 0, 0);
  return midnight.getTime() - reference.getTime();
}

// ---------------------------------------------------------------------
// 3. PONT DE DONNÉES (shared storage)
// ---------------------------------------------------------------------

const WIDGET_DATA_KEY = 'noesis:widget-data';

// Bridge to what a real home-screen widget reads (App Group UserDefaults on
// iOS, SharedPreferences on Android via Glance). Neither exists yet — this
// project has no native ios/ or android/ project (managed Expo workflow, no
// eas.json) — so this writes to AsyncStorage instead, which keeps the
// in-app preview (components/home-widget-preview.tsx) always in sync.
// Swap the body of this one function for a real native bridge (a config
// plugin + a small native module — e.g. react-native-shared-group-
// preferences for iOS App Groups, a Kotlin SharedPreferences bridge for
// Android Glance) once the project moves to EAS Build; every caller only
// ever goes through this function, so nothing else needs to change.
export async function updateWidgetData(data: WidgetData): Promise<void> {
  await AsyncStorage.setItem(WIDGET_DATA_KEY, JSON.stringify(data));
}

export async function getStoredWidgetData(): Promise<WidgetData | null> {
  const raw = await AsyncStorage.getItem(WIDGET_DATA_KEY);
  return raw ? (JSON.parse(raw) as WidgetData) : null;
}

// ---------------------------------------------------------------------
// 2. DONNÉES EN TEMPS RÉEL — live computation from the streak + activity
// data, called whenever something that can change them happens (a session
// finishing, app foreground, etc. — see updateWidgetData's comment above
// for why this isn't wired to those call sites automatically yet).
// ---------------------------------------------------------------------

export async function computeWidgetData(matiere: string): Promise<WidgetData> {
  const [{ streak }, activeDays] = await Promise.all([getStreakInfo(), getActiveDays()]);
  const hasCompletedToday = activeDays.has(new Date().toDateString());
  const state = computeWidgetState({ streak, hasCompletedToday, hour: new Date().getHours() });

  return {
    state,
    streak,
    matiere,
    updatedAt: new Date().toISOString(),
  };
}

// Computes fresh widget data and writes it through the storage bridge in
// one call.
export async function refreshWidgetData(matiere: string): Promise<WidgetData> {
  const data = await computeWidgetData(matiere);
  await updateWidgetData(data);
  return data;
}
