import { createContext, useContext, useEffect, useMemo, useRef, useState, type ReactNode } from 'react';
import { useCompleteFocusSession } from '../hooks/queries/use-focus-session';

type Phase = 'idle' | 'running' | 'summary';

type FocusSessionContextValue = {
  phase: Phase;
  durationMinutes: number;
  remainingMs: number;
  xpAwarded: number | null;
  startSession: (durationMinutes: number) => void;
  abandonSession: () => void;
  dismissSummary: () => void;
};

const FocusSessionContext = createContext<FocusSessionContextValue | null>(null);

// Vit au-dessus du Stack (voir app/_layout.tsx) pour que la session survive à
// la navigation : l'élève peut lancer une session puis aller faire une leçon
// ou un exercice sans perdre le minuteur ni son XP en cours.
export function FocusSessionProvider({ children }: { children: ReactNode }) {
  const completeSession = useCompleteFocusSession();

  const [phase, setPhase] = useState<Phase>('idle');
  const [durationMinutes, setDurationMinutes] = useState(0);
  const [endAt, setEndAt] = useState<number | null>(null);
  const [remainingMs, setRemainingMs] = useState(0);
  const [xpAwarded, setXpAwarded] = useState<number | null>(null);
  const completingRef = useRef(false);

  useEffect(() => {
    if (phase !== 'running' || endAt === null) return;

    const tick = () => {
      const remaining = Math.max(0, endAt - Date.now());
      setRemainingMs(remaining);
      if (remaining === 0 && !completingRef.current) {
        completingRef.current = true;
        completeSession.mutateAsync(durationMinutes).then((result) => {
          setXpAwarded(result.xp_awarded);
          setPhase('summary');
        });
      }
    };

    tick();
    const interval = setInterval(tick, 1000);
    return () => clearInterval(interval);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [phase, endAt]);

  const value = useMemo<FocusSessionContextValue>(
    () => ({
      phase,
      durationMinutes,
      remainingMs,
      xpAwarded,
      startSession: (minutes: number) => {
        completingRef.current = false;
        setDurationMinutes(minutes);
        setEndAt(Date.now() + minutes * 60_000);
        setXpAwarded(null);
        setPhase('running');
      },
      abandonSession: () => {
        setEndAt(null);
        setPhase('idle');
      },
      dismissSummary: () => {
        setXpAwarded(null);
        setPhase('idle');
      },
    }),
    [phase, durationMinutes, remainingMs, xpAwarded]
  );

  return <FocusSessionContext.Provider value={value}>{children}</FocusSessionContext.Provider>;
}

export function useFocusSession() {
  const ctx = useContext(FocusSessionContext);
  if (!ctx) throw new Error('useFocusSession doit être utilisé dans FocusSessionProvider');
  return ctx;
}
