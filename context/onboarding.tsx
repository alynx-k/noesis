import { createContext, useContext, useMemo, useState, type ReactNode } from 'react';
import type { Grade, Serie } from '../constants/grades';
import type { ObjectiveId } from '../constants/objectives';

type OnboardingState = {
  grade: Grade | null;
  serie: Serie | null;
  objectiveIds: ObjectiveId[];
};

type OnboardingContextValue = OnboardingState & {
  setGrade: (grade: Grade) => void;
  setSerie: (serie: Serie | null) => void;
  toggleObjective: (id: ObjectiveId) => void;
  isComplete: boolean;
  reset: () => void;
};

const initialState: OnboardingState = {
  grade: null,
  serie: null,
  objectiveIds: [],
};

const OnboardingContext = createContext<OnboardingContextValue | null>(null);

export function OnboardingProvider({ children }: { children: ReactNode }) {
  const [state, setState] = useState<OnboardingState>(initialState);

  const value = useMemo<OnboardingContextValue>(
    () => ({
      ...state,
      setGrade: (grade) =>
        setState((prev) => ({
          ...prev,
          grade,
          // Changer de classe invalide un choix de série précédent (ex: 1ère -> 6e).
          serie: grade === prev.grade ? prev.serie : null,
        })),
      setSerie: (serie) => setState((prev) => ({ ...prev, serie })),
      toggleObjective: (id) =>
        setState((prev) => ({
          ...prev,
          objectiveIds: prev.objectiveIds.includes(id)
            ? prev.objectiveIds.filter((o) => o !== id)
            : [...prev.objectiveIds, id],
        })),
      isComplete: state.grade !== null && state.objectiveIds.length > 0,
      reset: () => setState(initialState),
    }),
    [state]
  );

  return <OnboardingContext.Provider value={value}>{children}</OnboardingContext.Provider>;
}

export function useOnboarding() {
  const ctx = useContext(OnboardingContext);
  if (!ctx) throw new Error('useOnboarding doit être utilisé dans OnboardingProvider');
  return ctx;
}
