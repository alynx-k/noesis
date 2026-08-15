import { useProfile } from '@/hooks/queries/use-profile';
import { useAuth } from '@/context/auth';

export type GateState = 'loading' | 'needs-auth' | 'needs-grade' | 'needs-lv2' | 'ready';

// Single source of truth for the auth → grade → lv2 onboarding chain,
// consumed by app/_layout.tsx's Stack.Protected blocks. The placement step
// ("où en es-tu dans ton programme ?") used to be a 4th link in this chain,
// gating the whole app on one global flag — it's now a per-discipline
// prompt shown inline the first time a student opens that discipline (see
// app/subject/[disciplineId].tsx + hooks/queries/use-placement.ts), so it no
// longer belongs in a gate that only knows "ready" or "not ready" for the
// entire app.
export function useGateState(): { state: GateState; error: Error | null; retry: () => void } {
  const { session, loading: authLoading } = useAuth();
  const profileQuery = useProfile();

  const retry = () => {
    profileQuery.refetch();
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

  return { state: 'ready', error: null, retry };
}
