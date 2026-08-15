import { router, usePathname } from 'expo-router';
import { createContext, ReactNode, useCallback, useContext, useRef, useState } from 'react';
import { View } from 'react-native';

import { TOUR_STEPS, TourStep } from '@/lib/tour';

type TargetRect = { x: number; y: number; width: number; height: number };

type TourContextValue = {
  active: boolean;
  step: TourStep | null;
  stepNumber: number;
  totalSteps: number;
  targets: Record<string, TargetRect>;
  registerTarget: (id: string, rect: TargetRect) => void;
  start: () => void;
  next: () => void;
  skip: () => void;
};

const TourContext = createContext<TourContextValue | undefined>(undefined);

export function TourProvider({ children }: { children: ReactNode }) {
  const pathname = usePathname();
  const [active, setActive] = useState(false);
  const [stepIndex, setStepIndex] = useState(0);
  const [targets, setTargets] = useState<Record<string, TargetRect>>({});

  const registerTarget = useCallback((id: string, rect: TargetRect) => {
    setTargets((previous) => ({ ...previous, [id]: rect }));
  }, []);

  // All steps live on Home (spotlighted content, or just described while
  // Home's own tab bar is visible behind the overlay — see lib/tour.ts), so
  // starting the tour from elsewhere (the "Revoir le tutoriel" row in
  // Réglages) needs to get back there first. Already-on-Home is the common
  // case (auto-start right after onboarding), so this skips the navigation
  // then to avoid a pointless replace-to-self.
  const start = useCallback(() => {
    if (pathname !== '/') {
      router.replace('/');
    }
    setStepIndex(0);
    setActive(true);
  }, [pathname]);

  const stop = useCallback(() => {
    setActive(false);
    setStepIndex(0);
  }, []);

  const next = useCallback(() => {
    setStepIndex((previous) => {
      if (previous + 1 >= TOUR_STEPS.length) {
        setActive(false);
        return 0;
      }
      return previous + 1;
    });
  }, []);

  return (
    <TourContext.Provider
      value={{
        active,
        step: active ? TOUR_STEPS[stepIndex] : null,
        stepNumber: stepIndex + 1,
        totalSteps: TOUR_STEPS.length,
        targets,
        registerTarget,
        start,
        next,
        skip: stop,
      }}>
      {children}
    </TourContext.Provider>
  );
}

export function useTour() {
  const context = useContext(TourContext);
  if (!context) {
    throw new Error('useTour must be used within a TourProvider');
  }
  return context;
}

// Measures the wrapping View in window coordinates and registers it under
// `id` — TourOverlay looks targets up by the current step's targetId to know
// where to cut the spotlight hole. Re-measures on every layout change (tab
// switches, font-scale, rotation), so the hole never drifts from the live
// element; fires regardless of whether the tour is active since that's
// cheap for the handful of elements that call this.
export function useTourTarget(id: string) {
  const { registerTarget } = useTour();
  const ref = useRef<View>(null);

  const onLayout = useCallback(() => {
    // measureInWindow needs a frame after layout to read accurate values on
    // some Android devices.
    requestAnimationFrame(() => {
      ref.current?.measureInWindow((x, y, width, height) => {
        if (width > 0 && height > 0) {
          registerTarget(id, { x, y, width, height });
        }
      });
    });
  }, [id, registerTarget]);

  return { ref, onLayout };
}
