import { createContext, ReactNode, useCallback, useContext, useEffect, useRef, useState } from 'react';
import { AppState } from 'react-native';

import { Destination } from '@/constants/destinations';
import { useAuth } from '@/context/auth';
import { destinationForSequence, newlyUnlockedDestination } from '@/lib/atlas';
import { finishFocusSession, getSuccessfulSessionCount, startFocusSession } from '@/lib/focus-session';
import { recordActivity } from '@/lib/streak';

type Phase = 'idle' | 'running' | 'success' | 'failed';

type FocusSessionContextValue = {
  phase: Phase;
  durationMinutes: number;
  remainingSeconds: number;
  // Space-atlas destination this run reached, and whether it was reached
  // for the first time (vs. revisiting a destination already unlocked
  // earlier) — only meaningful once `phase === 'success'`.
  destinationReached: Destination | null;
  destinationJustUnlocked: boolean;
  start: (minutes: number) => Promise<void>;
  reset: () => void;
};

const FocusSessionContext = createContext<FocusSessionContextValue | undefined>(undefined);

// Lives at the app root (not on the focus-session screen) so the timer keeps
// running — and the tree keeps growing — while the student browses other
// screens. Only actually leaving Noesis (backgrounding, locking the phone)
// kills the tree; navigating inside the app no longer does.
export function FocusSessionProvider({ children }: { children: ReactNode }) {
  const { user } = useAuth();
  const [phase, setPhase] = useState<Phase>('idle');
  const [durationMinutes, setDurationMinutes] = useState(25);
  const [remainingSeconds, setRemainingSeconds] = useState(0);
  const sessionIdRef = useRef<string | null>(null);
  const startedAtRef = useRef<number | null>(null);
  const finalizedRef = useRef(false);
  // Successful-session count *before* this run started, captured at launch
  // time so the atlas unlock check never races the DB write from `succeed`.
  const priorSessionCountRef = useRef(0);
  const [destinationReached, setDestinationReached] = useState<Destination | null>(null);
  const [destinationJustUnlocked, setDestinationJustUnlocked] = useState(false);

  const fail = useCallback(() => {
    if (finalizedRef.current) {
      return;
    }
    finalizedRef.current = true;
    setPhase('failed');
    if (sessionIdRef.current) {
      finishFocusSession(sessionIdRef.current, false);
    }
  }, []);

  const succeed = useCallback(() => {
    if (finalizedRef.current) {
      return;
    }
    finalizedRef.current = true;
    const sequence = priorSessionCountRef.current + 1;
    setDestinationReached(destinationForSequence(sequence));
    setDestinationJustUnlocked(newlyUnlockedDestination(sequence) !== null);
    setPhase('success');
    if (sessionIdRef.current) {
      finishFocusSession(sessionIdRef.current, true);
      recordActivity();
    }
  }, []);

  useEffect(() => {
    const subscription = AppState.addEventListener('change', (nextState) => {
      if (nextState !== 'active') {
        fail();
      }
    });
    return () => subscription.remove();
  }, [fail]);

  useEffect(() => {
    if (phase !== 'running') {
      return;
    }
    const totalSeconds = durationMinutes * 60;
    const interval = setInterval(() => {
      const startedAt = startedAtRef.current ?? Date.now();
      const elapsed = Math.floor((Date.now() - startedAt) / 1000);
      const remaining = Math.max(totalSeconds - elapsed, 0);
      setRemainingSeconds(remaining);
      if (remaining <= 0) {
        succeed();
      }
    }, 1000);
    return () => clearInterval(interval);
  }, [phase, durationMinutes, succeed]);

  const start = useCallback(
    async (minutes: number) => {
      if (!user) {
        return;
      }
      finalizedRef.current = false;
      startedAtRef.current = Date.now();
      setDurationMinutes(minutes);
      setRemainingSeconds(minutes * 60);
      setDestinationReached(null);
      setDestinationJustUnlocked(false);
      setPhase('running');
      const [sessionId, priorCount] = await Promise.all([
        startFocusSession(user.id, minutes),
        getSuccessfulSessionCount(),
      ]);
      sessionIdRef.current = sessionId;
      priorSessionCountRef.current = priorCount;
    },
    [user],
  );

  const reset = useCallback(() => {
    sessionIdRef.current = null;
    startedAtRef.current = null;
    finalizedRef.current = false;
    setDestinationReached(null);
    setDestinationJustUnlocked(false);
    setPhase('idle');
  }, []);

  return (
    <FocusSessionContext.Provider
      value={{ phase, durationMinutes, remainingSeconds, destinationReached, destinationJustUnlocked, start, reset }}>
      {children}
    </FocusSessionContext.Provider>
  );
}

export function useFocusSession() {
  const context = useContext(FocusSessionContext);
  if (!context) {
    throw new Error('useFocusSession must be used within a FocusSessionProvider');
  }
  return context;
}
