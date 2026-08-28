import Ionicons from '@expo/vector-icons/Ionicons';
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
import { MOTIVATIONS } from '@/constants/onboarding';
import { useOnboarding } from '@/context/onboarding';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function OnboardingObjectifsScreen() {
  const COLORS = useThemeColors();
  const { answers, toggleMotivation } = useOnboarding();

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
    checkbox: {
      width: 24,
      height: 24,
      borderRadius: 12,
      borderWidth: 2,
      borderColor: COLORS.border,
      alignItems: 'center',
      justifyContent: 'center',
    },
    checkboxSelected: {
      backgroundColor: COLORS.accent,
      borderColor: COLORS.accent,
    },
  });

  return (
    <Screen>
      <OnboardingHeader step={4} totalSteps={8} />
      <Animated.View entering={FadeInDown.duration(300)} style={{ flex: 1 }}>
        <ThemedText style={styles.title}>Quels sont tes objectifs ?</ThemedText>
        <ThemedText style={styles.subtitle}>Choisis ce qui te motive le plus.</ThemedText>

        <View style={styles.list}>
          {MOTIVATIONS.map((motivation) => {
            const selected = answers.motivations.includes(motivation.id);
            return (
              <BouncyPressable
                key={motivation.id}
                style={[styles.row, selected && styles.rowSelected]}
                onPress={() => toggleMotivation(motivation.id)}>
                <Ionicons name={motivation.icon} size={20} color={selected ? COLORS.accent : COLORS.mutedText} />
                <ThemedText style={styles.label}>{motivation.label}</ThemedText>
                <View style={[styles.checkbox, selected && styles.checkboxSelected]}>
                  {selected ? <IconSymbol name="checkmark" size={14} color={COLORS.accentText} /> : null}
                </View>
              </BouncyPressable>
            );
          })}
        </View>

        <Button label="Suivant" onPress={() => router.push('/onboarding/temps')} />
      </Animated.View>
    </Screen>
  );
}
