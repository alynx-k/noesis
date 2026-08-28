import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Notifications from 'expo-notifications';
import { Platform } from 'react-native';

const NOTIFICATIONS_ENABLED_KEY = 'noesis:notifications-enabled';

// In-memory only, set by FocusSessionProvider for the lifetime of a running
// session — deliberately not persisted, there's nothing to restore across
// app restarts since backgrounding the app already fails the session (see
// context/focus-session.tsx).
let focusSessionActive = false;

export function setFocusSessionActive(active: boolean): void {
  focusSessionActive = active;
}

export function isFocusSessionActive(): boolean {
  return focusSessionActive;
}

// Registered once at app startup (see app/_layout.tsx): controls whether a
// notification banner shows while the app is in the foreground. Without
// this, SDK 54 no longer shows foreground notifications by default. While a
// focus session is running, every notification is suppressed outright —
// this is the one thing this app can genuinely block (see the focus-session
// screen's toggles: real notification blocking, a deep link to the OS's own
// Do Not Disturb settings for everything else, since no third-party app can
// toggle system-wide DND).
export function initNotificationHandler(): void {
  Notifications.setNotificationHandler({
    handleNotification: async () => ({
      shouldShowBanner: !focusSessionActive,
      shouldShowList: !focusSessionActive,
      shouldPlaySound: false,
      shouldSetBadge: false,
    }),
  });
}

export async function isNotificationsEnabled(): Promise<boolean> {
  const value = await AsyncStorage.getItem(NOTIFICATIONS_ENABLED_KEY);
  return value === 'true';
}

export async function setNotificationsEnabled(enabled: boolean): Promise<void> {
  await AsyncStorage.setItem(NOTIFICATIONS_ENABLED_KEY, enabled ? 'true' : 'false');
}

// Three independent categories a student can toggle on the onboarding
// notifications screen (and later in settings): each gates a genuinely
// distinct trigger in lib/notification-scheduler.ts, not just cosmetic
// checkboxes. "Messages de la communauté" is the one exception — there is
// no community/messaging feature in the app yet, so nothing ever fires for
// it today; the toggle still stores a real preference so whichever feature
// eventually sends that kind of notification can respect it from day one,
// rather than lying about a checkbox doing something right now.
export type NotificationCategoryKey = 'revision' | 'streaks' | 'community';

const CATEGORY_STORAGE_KEYS: Record<NotificationCategoryKey, string> = {
  revision: 'noesis:notif-category-revision',
  streaks: 'noesis:notif-category-streaks',
  community: 'noesis:notif-category-community',
};

// Defaults to on — matches the onboarding screen's pre-checked toggles, and
// means an account created before these categories existed keeps behaving
// exactly as it did (nothing was gated before this).
export async function isNotificationCategoryEnabled(category: NotificationCategoryKey): Promise<boolean> {
  const value = await AsyncStorage.getItem(CATEGORY_STORAGE_KEYS[category]);
  return value === null ? true : value === 'true';
}

export async function setNotificationCategoryEnabled(category: NotificationCategoryKey, enabled: boolean): Promise<void> {
  await AsyncStorage.setItem(CATEGORY_STORAGE_KEYS[category], enabled ? 'true' : 'false');
}

// Android 13+ requires a channel to exist before the permission prompt is
// meaningful; harmless no-op on iOS/web.
async function ensureAndroidChannel(): Promise<void> {
  if (Platform.OS !== 'android') {
    return;
  }
  await Notifications.setNotificationChannelAsync('default', {
    name: 'Rappels',
    importance: Notifications.AndroidImportance.DEFAULT,
    // Same teal as the app icon/notification icon tint (app.json's
    // expo-notifications color) — devices with a notification LED use this
    // instead of the system default (usually blue).
    lightColor: '#0F6E56',
  });
}

export async function requestNotificationPermissions(): Promise<boolean> {
  await ensureAndroidChannel();
  const { status } = await Notifications.requestPermissionsAsync({
    ios: { allowAlert: true, allowBadge: true, allowSound: true },
  });
  return status === 'granted';
}

function reviewReminderStorageKey(courseId: string): string {
  return `noesis:review-reminder-id:${courseId}`;
}

export async function scheduleReviewReminder(courseId: string, courseTitle: string, dueDate: Date): Promise<void> {
  await cancelReviewReminder(courseId);

  if (dueDate.getTime() <= Date.now()) {
    return;
  }

  const identifier = await Notifications.scheduleNotificationAsync({
    content: {
      title: 'Révision à faire',
      body: `${courseTitle} est à réviser aujourd'hui.`,
      data: { courseId },
    },
    trigger: {
      type: Notifications.SchedulableTriggerInputTypes.DATE,
      date: dueDate,
    },
  });
  await AsyncStorage.setItem(reviewReminderStorageKey(courseId), identifier);
}

export async function cancelReviewReminder(courseId: string): Promise<void> {
  const key = reviewReminderStorageKey(courseId);
  const identifier = await AsyncStorage.getItem(key);
  if (identifier) {
    await Notifications.cancelScheduledNotificationAsync(identifier);
    await AsyncStorage.removeItem(key);
  }
}

export async function cancelAllReminders(): Promise<void> {
  await Notifications.cancelAllScheduledNotificationsAsync();
}
