import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { DisciplineId } from '@/constants/disciplines';
import { useAuth } from '@/context/auth';
import { getPlacementState, recordPlacementHandled } from '@/lib/placement';

export function usePlacementStatus(disciplineId: DisciplineId) {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.placement.forDiscipline(user?.id, disciplineId),
    queryFn: () => getPlacementState(disciplineId),
    enabled: !!user,
  });
}

export function useRecordPlacementHandled(disciplineId: DisciplineId) {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: (skipped: boolean) => {
      if (!user) throw new Error('Not authenticated');
      return recordPlacementHandled(user.id, disciplineId, skipped);
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.placement.forDiscipline(user?.id, disciplineId) });
    },
  });
}
