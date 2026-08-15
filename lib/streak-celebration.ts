import AsyncStorage from '@react-native-async-storage/async-storage';

// One-time "ta série est née" moment (flame ignition + goal picker) — shown
// exactly once, ever, the first time the student completes an activity,
// never again after that (unlike the daily widget, this isn't meant to
// repeat: Duolingo's goal-setting step is an onboarding beat, not a daily
// celebration). Gated by a lifetime flag rather than a per-day one.
const SEEN_KEY = 'noesis:streak-celebration-seen';
const GOAL_KEY = 'noesis:streak-goal-days';

export async function hasSeenStreakCelebration(): Promise<boolean> {
  const value = await AsyncStorage.getItem(SEEN_KEY);
  return value === '1';
}

export async function markStreakCelebrationSeen(): Promise<void> {
  await AsyncStorage.setItem(SEEN_KEY, '1');
}

export async function setStreakGoalDays(days: number): Promise<void> {
  await AsyncStorage.setItem(GOAL_KEY, String(days));
}

export async function getStreakGoalDays(): Promise<number | null> {
  const value = await AsyncStorage.getItem(GOAL_KEY);
  return value ? parseInt(value, 10) : null;
}

// Dev-only escape hatch (see app/settings.tsx's __DEV__-gated preview row):
// forces the modal open on the next Home focus regardless of the lifetime
// flag or today's activity — otherwise previewing/tweaking Neo's design
// means completing a real activity (or clearing app storage) every time.
const PREVIEW_KEY = 'noesis:streak-celebration-preview';

export async function requestStreakCelebrationPreview(): Promise<void> {
  await AsyncStorage.setItem(PREVIEW_KEY, '1');
}

// Read-and-clear so it only fires once per request, not on every focus.
export async function consumeStreakCelebrationPreview(): Promise<boolean> {
  const value = await AsyncStorage.getItem(PREVIEW_KEY);
  if (value === '1') {
    await AsyncStorage.removeItem(PREVIEW_KEY);
    return true;
  }
  return false;
}
