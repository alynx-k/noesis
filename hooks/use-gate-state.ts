import { useProfile } from '@/hooks/queries/use-profile';
import { usePlacementStatus } from '@/hooks/queries/use-placement';
import { useAuth } from '@/context/auth';

export type GateState =
  | 'loading'
  | 'needs-auth'
  | 'needs-grade'
  | 'needs-lv2'
  | 'needs-placement'
  | 'ready';

// Single source of truth for the auth → grade → lv2 → placement onboarding
// chain, consumed by app/_layout.tsx's Stack.Protected blocks. Replaces the
// sequential router.replace() chain that used to live in (tabs)/index.tsx.
export function useGateState(): { state: GateState; error: Error | null; retry: () => void } {
  const { session, loading: authLoading } = useAuth();
  const profileQuery = useProfile();
  const placementQuery = usePlacementStatus();

  const retry = () => {
    profileQuery.refetch();
    placementQuery.refetch();
  };

  if (authLoading) {
    return { state: 'loading', error: null, retry };
  }

  if (!session) {
    return { state: 'needs-auth', error: null, retry };
  }

  if (profileQuery.isPending) {
    return { state: 'loading', error: null, retry };
  }

  if (profileQuery.isError) {
    return { state: 'loading', error: profileQuery.error as Error, retry };
  }

  const profile = profileQuery.data;

  if (!profile || !profile.grade) {
    return { state: 'needs-grade', error: null, retry };
  }

  if (!profile.lv2) {
    return { state: 'needs-lv2', error: null, retry };
  }

  if (placementQuery.isPending) {
    return { state: 'loading', error: null, retry };
  }

  if (placementQuery.isError) {
    return { state: 'loading', error: placementQuery.error as Error, retry };
  }

  if (!placementQuery.data?.handled) {
    return { state: 'needs-placement', error: null, retry };
  }

  return { state: 'ready', error: null, retry };
}
