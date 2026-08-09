import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Notifications from 'expo-notifications';
import { Platform } from 'react-native';

const NOTIFICATIONS_ENABLED_KEY = 'noesis:notifications-enabled';
const STREAK_REMINDER_ID_KEY = 'noesis:streak-reminder-id';
const STREAK_REMINDER_HOUR = 18;

// Registered once at app startup (see app/_layout.tsx): controls whether a
// notification banner shows while the app is in the foreground. Without
// this, SDK 54 no longer shows foreground notifications by default.
export function initNotificationHandler(): void {
  Notifications.setNotificationHandler({
    handleNotification: async () => ({
      shouldShowBanner: true,
      shouldShowList: true,
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

// Android 13+ requires a channel to exist before the permission prompt is
// meaningful; harmless no-op on iOS/web.
async function ensureAndroidChannel(): Promise<void> {
  if (Platform.OS !== 'android') {
    return;
  }
  await Notifications.setNotificationChannelAsync('default', {
    name: 'Rappels',
    importance: Notifications.AndroidImportance.DEFAULT,
  });
}

export async function requestNotificationPermissions(): Promise<boolean> {
  await ensureAndroidChannel();
  const { status } = await Notifications.requestPermissionsAsync({
    ios: { allowAlert: true, allowBadge: true, allowSound: true },
  });
  return status === 'granted';
}

export async function scheduleDailyStreakReminder(): Promise<void> {
  await cancelDailyStreakReminder();
  const identifier = await Notifications.scheduleNotificationAsync({
    content: {
      title: 'Ta série de révision',
      body: "N'oublie pas ta série aujourd'hui !",
    },
    trigger: {
      type: Notifications.SchedulableTriggerInputTypes.DAILY,
      hour: STREAK_REMINDER_HOUR,
      minute: 0,
    },
  });
  await AsyncStorage.setItem(STREAK_REMINDER_ID_KEY, identifier);
}

export async function cancelDailyStreakReminder(): Promise<void> {
  const identifier = await AsyncStorage.getItem(STREAK_REMINDER_ID_KEY);
  if (identifier) {
    await Notifications.cancelScheduledNotificationAsync(identifier);
    await AsyncStorage.removeItem(STREAK_REMINDER_ID_KEY);
  }
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
  await AsyncStorage.multiRemove([STREAK_REMINDER_ID_KEY]);
}
