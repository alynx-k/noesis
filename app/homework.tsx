import { router } from 'expo-router';
import { StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

// Single entry point for both homework flows — previously two separate,
// visually redundant cards sitting above the chat on ai-chat.tsx. Now one
// "Devoirs" card leads here, where the choice is explicit.
export default function HomeworkChooserScreen() {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.section,
    },
    backButton: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    content: {
      paddingHorizontal: SPACING.screen,
      gap: SPACING.element,
    },
    optionCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.section,
      ...cardBorder(COLORS),
    },
    optionIcon: {
      width: 44,
      height: 44,
      borderRadius: 14,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.element,
    },
    optionTitle: {
      ...TYPOGRAPHY.title,
      fontSize: 18,
      color: COLORS.text,
      marginBottom: 4,
    },
    optionSubtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Devoirs</ThemedText>
          <View style={styles.backButton} />
        </View>

        <View style={styles.content}>
          <BouncyPressable style={styles.optionCard} onPress={() => router.push('/correct-homework')}>
            <View style={styles.optionIcon}>
              <IconSymbol name="doc.text.fill" size={20} color={COLORS.accent} />
            </View>
            <ThemedText style={styles.optionTitle}>Corriger un devoir</ThemedText>
            <ThemedText style={styles.optionSubtitle}>
              Prends ton devoir en photo, l&apos;IA le corrige à partir de ton cours.
            </ThemedText>
          </BouncyPressable>

          <BouncyPressable style={styles.optionCard} onPress={() => router.push('/prepare-homework')}>
            <View style={styles.optionIcon}>
              <IconSymbol name="checkmark.circle.fill" size={20} color={COLORS.accent} />
            </View>
            <ThemedText style={styles.optionTitle}>Me préparer pour un devoir</ThemedText>
            <ThemedText style={styles.optionSubtitle}>
              Choisis tes cours, l&apos;IA génère un test et un plan de révision.
            </ThemedText>
          </BouncyPressable>
        </View>
      </SafeAreaView>
    </ScreenBackground>
  );
}
