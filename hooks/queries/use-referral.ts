import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';

import { queryKeys } from '@/hooks/queries/query-keys';
import { useAuth } from '@/context/auth';
import { getMyReferralCode, redeemReferralCode } from '@/lib/referral';

export function useReferralCode() {
  const { user } = useAuth();

  return useQuery({
    queryKey: queryKeys.referral.code(user?.id),
    queryFn: getMyReferralCode,
    enabled: !!user,
    // A profile's own code never changes once generated — no point
    // refetching it on every focus like the rest of the app's queries do.
    staleTime: Infinity,
  });
}

export function useRedeemReferralCode() {
  const queryClient = useQueryClient();
  const { user } = useAuth();

  return useMutation({
    mutationFn: (code: string) => redeemReferralCode(code),
    onSuccess: (result) => {
      if (!('error' in result)) {
        queryClient.invalidateQueries({ queryKey: queryKeys.accessStatus.forUser(user?.id) });
      }
    },
  });
}
