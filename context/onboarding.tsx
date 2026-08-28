import { createContext, ReactNode, useContext, useMemo, useState } from 'react';

import type { GradeId, SeriesId } from '@/constants/grades';
import type { Lv2Id } from '@/constants/lv2';
import type { DailyTimeId, MotivationId } from '@/constants/onboarding';

// Everything the 9-screen onboarding flow collects before the final commit
// (app/onboarding/pret.tsx calls completeOnboarding once, see lib/onboarding.ts)
// — kept in memory only, so abandoning partway through never leaves a
// half-set profile row behind.
type OnboardingState = {
  grade: GradeId | null;
  serie: SeriesId | null;
  lv2: Lv2Id | null;
  motivations: MotivationId[];
  dailyTime: DailyTimeId | null;
  notifRevision: boolean;
  notifStreaks: boolean;
  notifCommunity: boolean;
  notificationsEnabled: boolean;
  prenom: string;
  city: string;
  avatarLocalUri: string | null;
  referralCode: string;
};

const initialState: OnboardingState = {
  grade: null,
  serie: null,
  lv2: null,
  motivations: [],
  dailyTime: null,
  notifRevision: true,
  notifStreaks: true,
  notifCommunity: true,
  notificationsEnabled: false,
  prenom: '',
  city: '',
  avatarLocalUri: null,
  referralCode: '',
};

type OnboardingContextValue = {
  answers: OnboardingState;
  setAnswers: (patch: Partial<OnboardingState>) => void;
  toggleMotivation: (id: MotivationId) => void;
};

const OnboardingContext = createContext<OnboardingContextValue | undefined>(undefined);

export function OnboardingProvider({ children }: { children: ReactNode }) {
  const [answers, setAnswersState] = useState<OnboardingState>(initialState);

  const value = useMemo<OnboardingContextValue>(
    () => ({
      answers,
      setAnswers: (patch) => setAnswersState((previous) => ({ ...previous, ...patch })),
      toggleMotivation: (id) =>
        setAnswersState((previous) => ({
          ...previous,
          motivations: previous.motivations.includes(id)
            ? previous.motivations.filter((motivationId) => motivationId !== id)
            : [...previous.motivations, id],
        })),
    }),
    [answers],
  );

  return <OnboardingContext.Provider value={value}>{children}</OnboardingContext.Provider>;
}

export function useOnboarding() {
  const context = useContext(OnboardingContext);
  if (!context) {
    throw new Error('useOnboarding must be used within an OnboardingProvider');
  }
  return context;
}
