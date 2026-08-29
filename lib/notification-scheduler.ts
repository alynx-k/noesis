import AsyncStorage from '@react-native-async-storage/async-storage';
import * as Notifications from 'expo-notifications';

import { formatNotification, getCategoryForHour, getRandomTemplate, NotificationCategory } from '@/lib/notification-templates';
import {
  isFocusSessionActive,
  isNotificationCategoryEnabled,
  isNotificationsEnabled,
  setNotificationsEnabled,
} from '@/lib/notifications';
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

// Stored as "HH:MM" (24h). null means "no override" — smart scheduling (or
// the default fallback time) decides instead.
export async function getCustomNotificationTime(): Promise<string | null> {
  return AsyncStorage.getItem(CUSTOM_TIME_KEY);
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

// All the per-day/per-streak bookkeeping below is scoped by userId (see
// scopedKey) — these used to be flat, device-wide keys, which meant two
// accounts sharing a device (a family phone, say) could contaminate each
// other's notification state: account B signing in could read account A's
// leftover streak/suppression/dedup data and, on a bad day, misfire an
// "abandon" notification addressed to B for a streak B never had, and
// suppress push for both accounts for 48h as a result.
function scopedKey(base: string, userId: string): string {
  return `${base}:${userId}`;
}

const SUPPRESSED_UNTIL_KEY = 'noesis:push-suppressed-until';

async function isPushSuppressed(userId: string): Promise<boolean> {
  const raw = await AsyncStorage.getItem(scopedKey(SUPPRESSED_UNTIL_KEY, userId));
  if (!raw) {
    return false;
  }
  return Date.now() < Number(raw);
}

async function suppressPushFor48Hours(userId: string): Promise<void> {
  const until = Date.now() + 48 * 60 * 60 * 1000;
  await AsyncStorage.setItem(scopedKey(SUPPRESSED_UNTIL_KEY, userId), String(until));
}

// ---------------------------------------------------------------------
// Today's scheduled-notification bookkeeping, for cancellation (3.)
// ---------------------------------------------------------------------

const TODAY_NOTIFICATION_IDS_KEY = 'noesis:today-notification-ids';

async function trackTodayNotificationId(userId: string, identifier: string): Promise<void> {
  const key = scopedKey(TODAY_NOTIFICATION_IDS_KEY, userId);
  const raw = await AsyncStorage.getItem(key);
  const ids: string[] = raw ? JSON.parse(raw) : [];
  ids.push(identifier);
  await AsyncStorage.setItem(key, JSON.stringify(ids));
}

// 3. ANNULATION AUTOMATIQUE — call this the moment a session/focus session
// is validated. Cancels whatever's left scheduled for today (the smart
// B/C/D nudge, the 21h night-danger one, or both).
export async function cancelTodayNotifications(userId: string): Promise<void> {
  const key = scopedKey(TODAY_NOTIFICATION_IDS_KEY, userId);
  const raw = await AsyncStorage.getItem(key);
  const ids: string[] = raw ? JSON.parse(raw) : [];
  await Promise.all(ids.map((identifier) => Notifications.cancelScheduledNotificationAsync(identifier).catch(() => {})));
  await AsyncStorage.removeItem(key);
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
// 1. SMART SCHEDULING — up to three touchpoints a day (morning, afternoon/
// evening, night-danger) rather than a single pick: a lone daily nudge
// reads as an easy-to-miss one-shot, three spaced ones actually keep the
// day on the user's radar. One of the first two slots is personalized to
// the user's 7-day average study time (minus 20 minutes); the other stays
// a fixed anchor so there are always two "normal" touchpoints bracketing
// it, plus the always-fixed night-danger slot.
// ---------------------------------------------------------------------

const SEVEN_DAYS_MS = 7 * 24 * 60 * 60 * 1000;
// Fallback when there's no 7-day history yet and no custom time set —
// matches the previous static daily-reminder hour (lib/notifications.ts).
const DEFAULT_MINUTE_OF_DAY = 18 * 60;
const SMART_NUDGE_OFFSET_MINUTES = 20;
// Fixed anchors for the two non-personalized slots.
const MORNING_ANCHOR_MINUTE = 9 * 60;
const AFTERNOON_ANCHOR_MINUTE = 15 * 60;
// Keep at least 60 minutes of daylight between the afternoon slot and
// night-danger, so a late personalized time doesn't land right next to it.
const LATEST_AFTERNOON_MINUTE = 20 * 60;

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

// Decides which of the morning/afternoon slots gets personalized: whichever
// half of the day the user's 7-day average (minus 20 minutes) falls into
// keeps that computed time, the other slot stays at its fixed anchor. With
// no history (smart scheduling on) or smart scheduling off, both slots use
// their fixed anchors — except the afternoon one, which uses the custom
// time if the user set one.
async function computeSlotMinutes(): Promise<{ morning: number; afternoon: number }> {
  const smartEnabled = await isSmartSchedulingEnabled();

  if (!smartEnabled) {
    const customTime = await getCustomNotificationTime();
    const parsed = customTime ? parseTimeStringToMinutes(customTime) : null;
    return { morning: MORNING_ANCHOR_MINUTE, afternoon: parsed ?? DEFAULT_MINUTE_OF_DAY };
  }

  const average = await computeAverageStudyMinuteOfDay();
  if (average === null) {
    return { morning: MORNING_ANCHOR_MINUTE, afternoon: DEFAULT_MINUTE_OF_DAY };
  }

  const target = Math.round(average - SMART_NUDGE_OFFSET_MINUTES);
  if (target < 12 * 60) {
    return { morning: Math.max(0, target), afternoon: AFTERNOON_ANCHOR_MINUTE };
  }
  return { morning: MORNING_ANCHOR_MINUTE, afternoon: Math.min(target, LATEST_AFTERNOON_MINUTE) };
}

const NIGHT_DANGER_HOUR = 21;

async function scheduleAt(
  userId: string,
  minuteOfDay: number,
  category: NotificationCategory,
  context: NotificationContext & { streak: number },
): Promise<void> {
  const fireDate = todayAtMinuteOfDay(minuteOfDay);
  if (!fireDate) {
    return;
  }
  const template = getRandomTemplate(category);
  const body = formatNotification(template.id, context);
  const identifier = await Notifications.scheduleNotificationAsync({
    content: { title: 'Noesis', body },
    trigger: { type: Notifications.SchedulableTriggerInputTypes.DATE, date: fireDate },
  });
  await trackTodayNotificationId(userId, identifier);
}

// Schedules today's remaining touchpoints — morning + afternoon/evening
// nudge (one of the two personalized, see computeSlotMinutes) plus the
// fixed 21h00 night-danger fallback. Each slot no-ops independently once
// its time has passed today, so opening the app later in the day just
// means fewer of the three still get scheduled. No-ops entirely if push is
// off/suppressed — this needs to be re-run daily by the caller.
export async function scheduleTodayNotifications(userId: string, context: NotificationContext): Promise<void> {
  if (isFocusSessionActive()) {
    return;
  }
  if (!(await isPushNotificationsEnabled()) || (await isPushSuppressed(userId))) {
    return;
  }
  if (!(await isNotificationCategoryEnabled('revision'))) {
    return;
  }

  const { streak } = await getStreakInfo();
  const { morning, afternoon } = await computeSlotMinutes();
  const fullContext = { ...context, streak };

  await scheduleAt(userId, morning, smartCategoryForHour(Math.floor(morning / 60)), fullContext);
  await scheduleAt(userId, afternoon, smartCategoryForHour(Math.floor(afternoon / 60)), fullContext);
  await scheduleAt(userId, NIGHT_DANGER_HOUR * 60, 'E', fullContext);
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
export async function checkAndHandleStreakLoss(userId: string, context: NotificationContext): Promise<boolean> {
  if (!(await isPushNotificationsEnabled()) || !(await isNotificationCategoryEnabled('streaks'))) {
    return false;
  }

  const { streak: currentStreak } = await getStreakInfo();
  const key = scopedKey(LAST_KNOWN_STREAK_KEY, userId);
  const stored = await AsyncStorage.getItem(key);
  // No stored baseline yet (fresh install, or the first check ever for this
  // account on this device) — record it without treating it as a loss,
  // otherwise day one would immediately fire an abandon message.
  const previousStreak = stored === null ? currentStreak : Number(stored);
  await AsyncStorage.setItem(key, String(currentStreak));

  if (previousStreak > 0 && currentStreak === 0) {
    const joursInactif = await getDaysSinceLastActivity();
    await fireImmediately('F', { ...context, streak: previousStreak, jours_inactif: joursInactif });
    await suppressPushFor48Hours(userId);
    await cancelTodayNotifications(userId);
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

export async function runDailyNotificationCycle(userId: string, context: NotificationContext): Promise<void> {
  const justLostStreak = await checkAndHandleStreakLoss(userId, context);
  if (justLostStreak) {
    return;
  }

  if (!(await isPushNotificationsEnabled()) || (await isPushSuppressed(userId))) {
    return;
  }

  if (await hasCompletedSessionToday()) {
    return;
  }

  await scheduleTodayNotifications(userId, context);
}
