import { router } from 'expo-router';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { OnboardingHeader } from '@/components/onboarding-header';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Screen } from '@/components/ui/screen';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { DAILY_TIME_OPTIONS } from '@/constants/onboarding';
import { useOnboarding } from '@/context/onboarding';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function OnboardingTempsScreen() {
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
    list: {
      gap: 10,
      flex: 1,
    },
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      borderWidth: 2,
      borderColor: COLORS.border,
      paddingVertical: 14,
      paddingHorizontal: 16,
    },
    rowSelected: {
      backgroundColor: COLORS.accentSoft,
      borderColor: COLORS.accent,
    },
    label: {
      ...TYPOGRAPHY.body,
      fontWeight: '600',
      color: COLORS.text,
      flex: 1,
    },
    radio: {
      width: 22,
      height: 22,
      borderRadius: 11,
      borderWidth: 2,
      borderColor: COLORS.border,
      alignItems: 'center',
      justifyContent: 'center',
    },
    radioSelected: {
      borderColor: COLORS.accent,
    },
    radioDot: {
      width: 12,
      height: 12,
      borderRadius: 6,
      backgroundColor: COLORS.accent,
    },
  });

  return (
    <Screen>
      <OnboardingHeader step={5} totalSteps={8} />
      <Animated.View entering={FadeInDown.duration(300)} style={{ flex: 1 }}>
        <ThemedText style={styles.title}>Combien de temps par jour peux-tu consacrer à tes révisions ?</ThemedText>
        <ThemedText style={styles.subtitle}>Sois honnête, on s&apos;adapte à toi.</ThemedText>

        <View style={styles.list}>
          {DAILY_TIME_OPTIONS.map((option) => {
            const selected = answers.dailyTime === option.id;
            return (
              <BouncyPressable
                key={option.id}
                style={[styles.row, selected && styles.rowSelected]}
                onPress={() => setAnswers({ dailyTime: option.id })}>
                <IconSymbol name="clock.arrow.circlepath" size={20} color={selected ? COLORS.accent : COLORS.mutedText} />
                <ThemedText style={styles.label}>{option.label}</ThemedText>
                <View style={[styles.radio, selected && styles.radioSelected]}>
                  {selected ? <View style={styles.radioDot} /> : null}
                </View>
              </BouncyPressable>
            );
          })}
        </View>

        <Button label="Suivant" onPress={() => router.push('/onboarding/notifications')} disabled={!answers.dailyTime} />
      </Animated.View>
    </Screen>
  );
}
