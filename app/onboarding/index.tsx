import { Redirect } from 'expo-router';

import { LoadingBadge } from '@/components/ui/loading-badge';
import { Screen } from '@/components/ui/screen';
import { useProfile } from '@/hooks/queries/use-profile';
import { useThemeColors } from '@/hooks/use-theme-colors';

// Entry point for the whole onboarding stack — a returning user who already
// joined the niveau waitlist (see app/onboarding/niveau.tsx) has a real
// profiles row with no grade, so they land back on their waitlist status
// instead of restarting the 9-screen flow from the welcome video every time.
export default function OnboardingIndex() {
  const COLORS = useThemeColors();
  const profileQuery = useProfile();

  if (profileQuery.isPending) {
    return (
      <Screen>
        <LoadingBadge icon="hourglass" color={COLORS.accent} size={48} />
      </Screen>
    );
  }

  if (profileQuery.data?.niveauWaitlist) {
    return <Redirect href="/onboarding/waitlist" />;
  }

  return <Redirect href="/onboarding/welcome" />;
}
