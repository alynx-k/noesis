import AsyncStorage from '@react-native-async-storage/async-storage';
import { useEffect, useRef } from 'react';

import { useAuth } from '@/context/auth';
import { useNextUpCourse } from '@/hooks/queries/use-next-up';
import { runDailyNotificationCycle } from '@/lib/notification-scheduler';
import { getDisplayName } from '@/lib/profile';

const LAST_RUN_DATE_KEY = 'noesis:notification-cycle-last-run-date';

// Runs the notification scheduler's daily cycle (streak-loss check, then —
// if the day isn't already lost or done — today's smart nudge + night-
// danger fallback) once per calendar day, as soon as the protected app
// shell is ready. There's no background task runner in this app (see
// lib/notification-scheduler.ts), so "once a day" means "once per day the
// app happens to be opened," not a guaranteed midnight tick.
export function useNotificationScheduling(enabled: boolean): void {
  const { user } = useAuth();
  const nextUpQuery = useNextUpCourse();
  const ranThisMountRef = useRef(false);

  useEffect(() => {
    if (!enabled || !user || ranThisMountRef.current) {
      return;
    }
    // Set synchronously, before the first await, so a dependency change
    // that re-fires this effect while the async work below is still in
    // flight can't slip past the guard and trigger a second run.
    ranThisMountRef.current = true;

    (async () => {
      const today = new Date().toDateString();
      const lastRun = await AsyncStorage.getItem(LAST_RUN_DATE_KEY);
      if (lastRun === today) {
        return;
      }
      await runDailyNotificationCycle({
        prenom: getDisplayName(user),
        matiere: nextUpQuery.data?.courseTitle ?? 'tes cours',
      });
      await AsyncStorage.setItem(LAST_RUN_DATE_KEY, today);
    })();
  }, [enabled, user, nextUpQuery.data?.courseTitle]);
}
