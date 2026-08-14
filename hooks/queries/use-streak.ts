import { useQuery } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useAuth } from '@/context/auth';
import { getStreakInfo } from '@/lib/streak';

// Still reads the derived (3-table-scan) computation for now — the
// streaks table added in the foundation phase gets its first writer wired
// up in the focus-session/course-completion mutations, so switching this
// read over happens together with that in a later phase, not before.
export function useStreak() {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.streak.forUser(user?.id),
    queryFn: getStreakInfo,
    enabled: !!user,
  });
}
