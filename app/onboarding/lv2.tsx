import { router } from 'expo-router';
import Animated, { FadeInDown } from 'react-native-reanimated';
import { StyleSheet } from 'react-native';

import { Lv2Picker } from '@/components/lv2-picker';
import { OnboardingHeader } from '@/components/onboarding-header';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { Screen } from '@/components/ui/screen';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { Lv2Id } from '@/constants/lv2';
import { useOnboarding } from '@/context/onboarding';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function OnboardingLv2Screen() {
  const COLORS = useThemeColors();
  const { answers, setAnswers } = useOnboarding();

  const styles = StyleSheet.create({
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.section,
    },
  });

  return (
    <Screen>
      <OnboardingHeader step={3} totalSteps={8} />
      <Animated.View entering={FadeInDown.duration(300)} style={{ flex: 1 }}>
        <ThemedText style={styles.title}>Quelle LV2 étudies-tu ?</ThemedText>
        <ThemedText style={styles.subtitle}>Espagnol ou Allemand, selon ce que tu apprends à l&apos;école.</ThemedText>

        <Lv2Picker selected={answers.lv2} onSelect={(lv2: Lv2Id) => setAnswers({ lv2 })} />

        <Button label="Suivant" onPress={() => router.push('/onboarding/objectifs')} disabled={!answers.lv2} />
      </Animated.View>
    </Screen>
  );
}
