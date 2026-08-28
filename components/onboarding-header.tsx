import { router } from 'expo-router';
import { StyleSheet, View } from 'react-native';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SPACING } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type OnboardingHeaderProps = {
  step: number;
  totalSteps: number;
  onBack?: () => void;
};

// Thin segmented progress bar + back chevron shared by every data-collecting
// onboarding screen (steps 2-8 of the mockup) — screens 1 (welcome) and 9
// (celebration) render neither.
export function OnboardingHeader({ step, totalSteps, onBack }: OnboardingHeaderProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginBottom: SPACING.section,
    },
    track: {
      flex: 1,
      height: 4,
      borderRadius: 2,
      backgroundColor: COLORS.border,
      overflow: 'hidden',
    },
    fill: {
      height: '100%',
      borderRadius: 2,
      backgroundColor: COLORS.accent,
      width: `${Math.min(100, Math.round((step / totalSteps) * 100))}%`,
    },
    backButton: {
      width: 32,
      height: 32,
      alignItems: 'center',
      justifyContent: 'center',
    },
  });

  return (
    <View style={styles.row}>
      <BouncyPressable style={styles.backButton} onPress={onBack ?? (() => router.back())}>
        <IconSymbol name="chevron.left" size={20} color={COLORS.text} />
      </BouncyPressable>
      <View style={styles.track}>
        <View style={styles.fill} />
      </View>
    </View>
  );
}
