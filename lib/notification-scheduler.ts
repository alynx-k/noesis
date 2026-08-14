import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Notifications from 'expo-notifications';

import { formatNotification, getCategoryForHour, getRandomTemplate, NotificationCategory } from '@/lib/notification-templates';
import { isNotificationsEnabled, setNotificationsEnabled } from '@/lib/notifications';
import { getActiveDays, getStreakInfo } from '@/lib/streak';
import { supabase } from '@/lib/supabase';

// Ties the notification copy bank (lib/notification-templates.ts) to the
// streak/session data (lib/streak.ts) and the user's study schedule, to
// decide WHEN to nudge and WHICH category to use. There is no background
// task runner in this app (no expo-task-manager/expo-background-fetch) —
// everything here works by (re)computing and pre-scheduling local
// notifications with expo-notifications' DATE trigger, the same pattern
// already used by scheduleReviewReminder in lib/notifications.ts, rather
// than relying on a periodic OS-driven job. That means the functions below
// need to be called at points the app is already running: on startup /
// after login, when the user finishes a session, and when notification
// settings change — this module doesn't wire itself into those call sites.

// ---------------------------------------------------------------------
// 5. User preferences (AsyncStorage)
// ---------------------------------------------------------------------

const SMART_SCHEDULING_KEY = 'noesis:smart-scheduling-enabled';
const CUSTOM_TIME_KEY = 'noesis:custom-notification-time';

// Smart scheduling is on by default — it's the better experience, and a
// fresh install has no stored preference yet.
export async function isSmartSchedulingEnabled(): Promise<boolean> {
  const value = await AsyncStorage.getItem(SMART_SCHEDULING_KEY);
  return value === null ? true : value === 'true';
}

export async function setSmartSchedulingEnabled(enabled: boolean): Promise<void> {
  await AsyncStorage.setItem(SMART_SCHEDULING_KEY, enabled ? 'true' : 'false');
}

// Stored as "HH:MM" (24h). null means "no override" — smart scheduling (or
// the default fallback time) decides instead.
export async function getCustomNotificationTime(): Promise<string | null> {
  return AsyncStorage.getItem(CUSTOM_TIME_KEY);
}

export async function setCustomNotificationTime(time: string | null): Promise<void> {
  if (time === null) {
    await AsyncStorage.removeItem(CUSTOM_TIME_KEY);
  } else {
    await AsyncStorage.setItem(CUSTOM_TIME_KEY, time);
  }
}

// Re-exported under this module's naming so callers only need one import
// for all three settings — same underlying storage as the existing
// notifications on/off toggle in lib/notifications.ts, not a separate flag.
export const isPushNotificationsEnabled = isNotificationsEnabled;
export const setPushNotificationsEnabled = setNotificationsEnabled;

// ---------------------------------------------------------------------
// Temporary 48h push suppression (distinct from the user's own on/off
// toggle above) — set automatically after an abandon notification (4.).
// ---------------------------------------------------------------------

const SUPPRESSED_UNTIL_KEY = 'noesis:push-suppressed-until';

async function isPushSuppressed(): Promise<boolean> {
  const raw = await AsyncStorage.getItem(SUPPRESSED_UNTIL_KEY);
  if (!raw) {
    return false;
  }
  return Date.now() < Number(raw);
}

async function suppressPushFor48Hours(): Promise<void> {
  const until = Date.now() + 48 * 60 * 60 * 1000;
  await AsyncStorage.setItem(SUPPRESSED_UNTIL_KEY, String(until));
}

// ---------------------------------------------------------------------
// Today's scheduled-notification bookkeeping, for cancellation (3.)
// ---------------------------------------------------------------------

const TODAY_NOTIFICATION_IDS_KEY = 'noesis:today-notification-ids';

async function trackTodayNotificationId(identifier: string): Promise<void> {
  const raw = await AsyncStorage.getItem(TODAY_NOTIFICATION_IDS_KEY);
  const ids: string[] = raw ? JSON.parse(raw) : [];
  ids.push(identifier);
  await AsyncStorage.setItem(TODAY_NOTIFICATION_IDS_KEY, JSON.stringify(ids));
}

// 3. ANNULATION AUTOMATIQUE — call this the moment a session/focus session
// is validated. Cancels whatever's left scheduled for today (the smart
// B/C/D nudge, the 21h night-danger one, or both).
export async function cancelTodayNotifications(): Promise<void> {
  const raw = await AsyncStorage.getItem(TODAY_NOTIFICATION_IDS_KEY);
  const ids: string[] = raw ? JSON.parse(raw) : [];
  await Promise.all(ids.map((identifier) => Notifications.cancelScheduledNotificationAsync(identifier).catch(() => {})));
  await AsyncStorage.removeItem(TODAY_NOTIFICATION_IDS_KEY);
}

// ---------------------------------------------------------------------
// Shared helpers
// ---------------------------------------------------------------------

export type NotificationContext = {
  prenom: string;
  matiere: string;
};

async function hasCompletedSessionToday(): Promise<boolean> {
  const activeDays = await getActiveDays();
  return activeDays.has(new Date().toDateString());
}

// Days since the last day with any real activity, capped at 60 so a user
// who has genuinely never opened the app doesn't get a nonsensical number
// in the {jours_inactif} slot.
async function getDaysSinceLastActivity(): Promise<number> {
  const activeDays = await getActiveDays();
  const cursor = new Date();
  for (let daysBack = 0; daysBack <= 60; daysBack++) {
    if (activeDays.has(cursor.toDateString())) {
      return daysBack;
    }
    cursor.setDate(cursor.getDate() - 1);
  }
  return 60;
}

function parseTimeStringToMinutes(time: string): number | null {
  const match = /^(\d{1,2}):(\d{2})$/.exec(time.trim());
  if (!match) {
    return null;
  }
  const hours = Number(match[1]);
  const minutes = Number(match[2]);
  if (hours > 23 || minutes > 59) {
    return null;
  }
  return hours * 60 + minutes;
}

// Today at the given minute-of-day, or null if that time has already
// passed — the daily notifications are recomputed each time the app runs
// this cycle, so "already passed" just means nothing to schedule today.
function todayAtMinuteOfDay(minuteOfDay: number): Date | null {
  const clamped = Math.min(1439, Math.max(0, Math.round(minuteOfDay)));
  const date = new Date();
  date.setHours(Math.floor(clamped / 60), clamped % 60, 0, 0);
  return date.getTime() > Date.now() ? date : null;
}

async function fireImmediately(category: NotificationCategory, context: NotificationContext & { streak?: number; jours_inactif?: number }): Promise<void> {
  const template = getRandomTemplate(category);
  const body = formatNotification(template.id, context);
  await Notifications.scheduleNotificationAsync({
    content: { title: 'Noesis', body },
    trigger: null,
  });
}

// ---------------------------------------------------------------------
// 1. SMART SCHEDULING — average study time over the last 7 days, minus 20
// minutes, using the matching B/C/D category for that hour.
// ---------------------------------------------------------------------

const SEVEN_DAYS_MS = 7 * 24 * 60 * 60 * 1000;
// Fallback when there's no 7-day history yet and no custom time set —
// matches the previous static daily-reminder hour (lib/notifications.ts).
const DEFAULT_MINUTE_OF_DAY = 18 * 60;
const SMART_NUDGE_OFFSET_MINUTES = 20;

// Mean minute-of-day (0-1439) across every graded answer, completed
// course, and successful focus session in the last 7 days — a plain
// arithmetic mean of minutes-since-midnight, not a circular mean. Fine
// here since real study hours don't wrap around midnight; null if there's
// no activity to average.
async function computeAverageStudyMinuteOfDay(): Promise<number | null> {
  const sinceIso = new Date(Date.now() - SEVEN_DAYS_MS).toISOString();

  const [attempts, progress, sessions] = await Promise.all([
    supabase.from('answer_attempts').select('created_at').gte('created_at', sinceIso),
    supabase
      .from('course_progress')
      .select('completed_at')
      .eq('completed', true)
      .not('completed_at', 'is', null)
      .gte('completed_at', sinceIso),
    supabase
      .from('focus_sessions')
      .select('completed_at')
      .eq('succeeded', true)
      .not('completed_at', 'is', null)
      .gte('completed_at', sinceIso),
  ]);

  const timestamps = [
    ...(attempts.data ?? []).map((row) => row.created_at as string),
    ...(progress.data ?? []).map((row) => row.completed_at as string),
    ...(sessions.data ?? []).map((row) => row.completed_at as string),
  ].filter((value): value is string => !!value);

  if (timestamps.length === 0) {
    return null;
  }

  const minutesOfDay = timestamps.map((iso) => {
    const date = new Date(iso);
    return date.getHours() * 60 + date.getMinutes();
  });
  return minutesOfDay.reduce((sum, minutes) => sum + minutes, 0) / minutesOfDay.length;
}

// Night danger (E) is its own dedicated trigger — the smart nudge never
// uses it, even if the computed/custom time lands at or after 21h.
function smartCategoryForHour(hour: number): 'B' | 'C' | 'D' {
  const category = getCategoryForHour(hour);
  if (category === 'B' || category === 'C' || category === 'D') {
    return category;
  }
  return 'D';
}

// Schedules today's smart B/C/D nudge: 20 minutes before the user's 7-day
// average study time (smart scheduling on), at their chosen custom time
// (smart scheduling off with a custom time set), or at the default hour
// (neither). No-ops past that time today, if push is off/suppressed, or
// disabled by settings — this needs to be re-run daily by the caller.
export async function scheduleSmartDailyNotification(context: NotificationContext): Promise<void> {
  if (!(await isPushNotificationsEnabled()) || (await isPushSuppressed())) {
    return;
  }

  let targetMinuteOfDay: number;
  const smartEnabled = await isSmartSchedulingEnabled();

  if (smartEnabled) {
    const average = await computeAverageStudyMinuteOfDay();
    targetMinuteOfDay = average !== null ? average - SMART_NUDGE_OFFSET_MINUTES : DEFAULT_MINUTE_OF_DAY;
  } else {
    const customTime = await getCustomNotificationTime();
    const parsed = customTime ? parseTimeStringToMinutes(customTime) : null;
    targetMinuteOfDay = parsed ?? DEFAULT_MINUTE_OF_DAY;
  }

  const fireDate = todayAtMinuteOfDay(targetMinuteOfDay);
  if (!fireDate) {
    return;
  }

  const { streak } = await getStreakInfo();
  const category = smartCategoryForHour(fireDate.getHours());
  const template = getRandomTemplate(category);
  const body = formatNotification(template.id, { ...context, streak });

  const identifier = await Notifications.scheduleNotificationAsync({
    content: { title: 'Noesis', body },
    trigger: { type: Notifications.SchedulableTriggerInputTypes.DATE, date: fireDate },
  });
  await trackTodayNotificationId(identifier);
}

// ---------------------------------------------------------------------
// 2. NIGHT DANGER — pre-scheduled category E for 21h00 today, so it fires
// via the OS even if the app isn't running by then. Cancelled along with
// everything else the moment a session is validated (see 3.), so it only
// actually reaches the user if today's session is still undone at 21h.
// ---------------------------------------------------------------------

const NIGHT_DANGER_HOUR = 21;

export async function scheduleNightDangerNotification(context: NotificationContext): Promise<void> {
  if (!(await isPushNotificationsEnabled()) || (await isPushSuppressed())) {
    return;
  }

  const fireDate = todayAtMinuteOfDay(NIGHT_DANGER_HOUR * 60);
  if (!fireDate) {
    return;
  }

  const { streak } = await getStreakInfo();
  const template = getRandomTemplate('E');
  const body = formatNotification(template.id, { ...context, streak });

  const identifier = await Notifications.scheduleNotificationAsync({
    content: { title: 'Noesis', body },
    trigger: { type: Notifications.SchedulableTriggerInputTypes.DATE, date: fireDate },
  });
  await trackTodayNotificationId(identifier);
}

// ---------------------------------------------------------------------
// 4. ABANDON STRATÉGIQUE (48h) — fires the moment a streak that was > 0
// drops to 0, then mutes push for 48h. There's no persisted "streak just
// lost" event anywhere in the schema, so this detects the transition
// itself by comparing against the last streak value it saw.
// ---------------------------------------------------------------------

const LAST_KNOWN_STREAK_KEY = 'noesis:last-known-streak';

// Returns true if a loss was detected (and the abandon notification was
// fired) this call, so the caller can skip scheduling anything else today.
export async function checkAndHandleStreakLoss(context: NotificationContext): Promise<boolean> {
  if (!(await isPushNotificationsEnabled())) {
    return false;
  }

  const { streak: currentStreak } = await getStreakInfo();
  const stored = await AsyncStorage.getItem(LAST_KNOWN_STREAK_KEY);
  // No stored baseline yet (fresh install) — record it without treating it
  // as a loss, otherwise day one would immediately fire an abandon message.
  const previousStreak = stored === null ? currentStreak : Number(stored);
  await AsyncStorage.setItem(LAST_KNOWN_STREAK_KEY, String(currentStreak));

  if (previousStreak > 0 && currentStreak === 0) {
    const joursInactif = await getDaysSinceLastActivity();
    await fireImmediately('F', { ...context, streak: previousStreak, jours_inactif: joursInactif });
    await suppressPushFor48Hours();
    await cancelTodayNotifications();
    return true;
  }

  return false;
}

// ---------------------------------------------------------------------
// Orchestrator — run once per day the app is opened (e.g. after auth
// resolves) to bring today's notifications up to date: checks for a fresh
// streak loss first, then (if the day isn't already lost/done) schedules
// today's smart nudge and night-danger fallback.
// ---------------------------------------------------------------------

export async function runDailyNotificationCycle(context: NotificationContext): Promise<void> {
  const justLostStreak = await checkAndHandleStreakLoss(context);
  if (justLostStreak) {
    return;
  }

  if (!(await isPushNotificationsEnabled()) || (await isPushSuppressed())) {
    return;
  }

  if (await hasCompletedSessionToday()) {
    return;
  }

  await scheduleSmartDailyNotification(context);
  await scheduleNightDangerNotification(context);
}
