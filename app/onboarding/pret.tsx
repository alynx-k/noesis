import { Image, StyleSheet } from 'react-native';
import Animated, { FadeInDown, ZoomIn } from 'react-native-reanimated';

import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { Screen } from '@/components/ui/screen';
import { toast } from '@/components/ui/toast';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { useOnboarding } from '@/context/onboarding';
import { useCompleteOnboarding } from '@/hooks/queries/use-onboarding';
import { useRedeemReferralCode } from '@/hooks/queries/use-referral';
import { useThemeColors } from '@/hooks/use-theme-colors';

const ROCKET_3D = require('@/assets/images/3d/onboarding-rocket.png');

// "Accéder à mon espace" is the real commit point: it's the first moment
// profile.grade actually gets written, which is also what the root gate
// (useGateState) watches to leave this whole onboarding stack — committing
// any earlier would yank the user away from this celebration screen (or
// even the récap screen) before they saw it.
export default function OnboardingPretScreen() {
  const COLORS = useThemeColors();
  const { answers } = useOnboarding();
  const completeOnboarding = useCompleteOnboarding();
  const redeemReferralCode = useRedeemReferralCode();

  const styles = StyleSheet.create({
    content: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
    },
    illustration: {
      width: 200,
      height: 200,
      marginBottom: SPACING.section,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: SPACING.tight,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginBottom: SPACING.section,
    },
    footer: {
      width: '100%',
    },
  });

  const handleFinish = async () => {
    if (!answers.grade) {
      return;
    }
    const result = await completeOnboarding.mutateAsync({
      grade: answers.grade,
      serie: answers.serie,
      lv2: answers.lv2,
      motivations: answers.motivations,
      dailyTime: answers.dailyTime,
      city: answers.city,
      avatarLocalUri: answers.avatarLocalUri,
    });
    if (result.error) {
      toast.show(result.error, { variant: 'error' });
      return;
    }
    // Best-effort and silent-ish on failure — a wrong/expired code isn't
    // worth blocking the very last onboarding step over.
    if (answers.referralCode.trim()) {
      const redeemResult = await redeemReferralCode.mutateAsync(answers.referralCode.trim());
      if ('error' in redeemResult) {
        toast.show(redeemResult.error, { variant: 'error' });
      } else {
        toast.show(`Code appliqué — ${redeemResult.rewardDays} jours de Premium offerts !`, { variant: 'success' });
      }
    }
    // No manual navigation — the mutation's success invalidates the profile
    // query, the root gate re-resolves, and Stack.Protected takes it from
    // here (select-language if LV2 isn't set yet, otherwise Home).
  };

  return (
    <Screen>
      <Animated.View entering={ZoomIn.duration(500)} style={styles.content}>
        <Image source={ROCKET_3D} style={styles.illustration} resizeMode="contain" />
        <Animated.View entering={FadeInDown.duration(400).delay(200)}>
          <ThemedText style={styles.title}>Tout est prêt ! 🎉</ThemedText>
          <ThemedText style={styles.subtitle}>Bienvenue dans l&apos;aventure noesis. Tu vas aller loin !</ThemedText>
        </Animated.View>
      </Animated.View>
      <Animated.View entering={FadeInDown.duration(400).delay(300)} style={styles.footer}>
        <Button label="Accéder à mon espace" onPress={handleFinish} loading={completeOnboarding.isPending} />
      </Animated.View>
    </Screen>
  );
}
