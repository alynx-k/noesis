import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useAuth } from '@/context/auth';
import { getPlacementState, recordPlacementHandled } from '@/lib/placement';

export function usePlacementStatus() {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.placement.forUser(user?.id),
    queryFn: getPlacementState,
    enabled: !!user,
  });
}

export function useRecordPlacementHandled() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: (skipped: boolean) => {
      if (!user) throw new Error('Not authenticated');
      return recordPlacementHandled(user.id, skipped);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.placement.forUser(user?.id) });
    },
  });
}
