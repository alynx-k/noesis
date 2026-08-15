import { useQueryClient } from '@tanstack/react-query';
import { useEffect, useState } from 'react';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useProfile } from '@/hooks/queries/use-profile';
import { useAuth } from '@/context/auth';
import { getNextUpCourse } from '@/lib/course-history';
import { getStreakInfo } from '@/lib/streak';

export type GateState = 'loading' | 'needs-auth' | 'needs-grade' | 'needs-lv2' | 'ready';

// Once a sign-in/sign-up actually goes through, hold the "Connexion en
// cours..." screen for at least this long before revealing Home. Paired
// with the per-phase message below (rather than a flat unmoving screen) so
// the wait reads as "the app is actually doing something" instead of stalling
// — a static screen felt untrustworthy well before 5s, a progressing one
// doesn't. Deliberately scoped to justAuthenticated (see context/auth.tsx)
// so it only slows down the moment right after a login/signup submission,
// not an ordinary app reopen with an already-active session.
const POST_LOGIN_MIN_LOADING_MS = 5_000;

function usePostLoginFloor(justAuthenticated: boolean, clearJustAuthenticated: () => void) {
  const [floorActive, setFloorActive] = useState(false);

  useEffect(() => {
    if (!justAuthenticated) {
      return;
    }
    setFloorActive(true);
    const timeout = setTimeout(() => {
      setFloorActive(false);
      clearJustAuthenticated();
    }, POST_LOGIN_MIN_LOADING_MS);
    return () => clearTimeout(timeout);
  }, [justAuthenticated, clearJustAuthenticated]);

  return floorActive;
}

// Home-critical data prefetched right before the gate reports "ready", so
// the first frame of Home renders from a warm cache instead of showing its
// own skeletons immediately after the gate's own loading screen — one
// loading moment instead of two back to back. Keyed on the primitive grade/
// serie/userId fields (not the profile object itself, whose reference
// changes on every refetch) so this doesn't re-run more often than the
// values it actually depends on change; prefetchQuery is itself a no-op
// within DEFAULT_STALE_TIME, so this stays cheap either way.
function useHomePrefetch(userId: string | undefined, grade: string | null, serie: string | null) {
  const queryClient = useQueryClient();
  const [done, setDone] = useState(false);

  useEffect(() => {
    if (!userId || !grade) {
      setDone(false);
      return;
    }
    let cancelled = false;
    Promise.all([
      queryClient.prefetchQuery({ queryKey: queryKeys.streak.forUser(userId), queryFn: getStreakInfo }),
      queryClient.prefetchQuery({
        queryKey: ['next-up-course', grade, serie],
        queryFn: () => getNextUpCourse(grade, serie),
      }),
    ]).finally(() => {
      if (!cancelled) {
        setDone(true);
      }
    });
    return () => {
      cancelled = true;
    };
  }, [userId, grade, serie, queryClient]);

  return done;
}

export function useGateState(): {
  state: GateState;
  error: Error | null;
  retry: () => void;
  loadingMessage: string;
} {
  const { session, user, loading: authLoading, justAuthenticated, clearJustAuthenticated } = useAuth();
  const profileQuery = useProfile();
  const profile = profileQuery.data;
  const onboardingComplete = !!profile?.grade && !!profile?.lv2;

  const prefetchDone = useHomePrefetch(
    onboardingComplete ? user?.id : undefined,
    profile?.grade ?? null,
    profile?.serie ?? null,
  );
  const postLoginFloorActive = usePostLoginFloor(justAuthenticated, clearJustAuthenticated);

  const retry = () => {
    profileQuery.refetch();
  };

  if (authLoading) {
    return { state: 'loading', error: null, retry, loadingMessage: 'Vérification de la session…' };
  }
  if (!session) {
    return { state: 'needs-auth', error: null, retry, loadingMessage: '' };
  }
  if (profileQuery.isPending) {
    return { state: 'loading', error: null, retry, loadingMessage: 'Chargement de ton profil…' };
  }
  if (profileQuery.isError) {
    return { state: 'loading', error: profileQuery.error as Error, retry, loadingMessage: '' };
  }
  if (!profile || !profile.grade) {
    return { state: 'needs-grade', error: null, retry, loadingMessage: '' };
  }
  if (!profile.lv2) {
    return { state: 'needs-lv2', error: null, retry, loadingMessage: '' };
  }
  if (!prefetchDone) {
    return { state: 'loading', error: null, retry, loadingMessage: 'Préparation de ton tableau de bord…' };
  }
  if (postLoginFloorActive) {
    return { state: 'loading', error: null, retry, loadingMessage: 'Presque prêt…' };
  }
  return { state: 'ready', error: null, retry, loadingMessage: '' };
}
