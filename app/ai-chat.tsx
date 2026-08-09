import { router } from 'expo-router';
import { StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { AiTutorChatBody } from '@/components/ai-tutor-chat';
import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

export default function AiChatScreen() {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
      backgroundColor: COLORS.background,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.tight,
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
    actionsRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      paddingHorizontal: SPACING.screen,
      paddingBottom: SPACING.element,
    },
    actionCard: {
      flex: 1,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      gap: SPACING.tight,
      ...cardBorder(COLORS),
    },
    actionIcon: {
      width: 32,
      height: 32,
      borderRadius: 16,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    actionLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
  });

  return (
    <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
      <View style={styles.header}>
        <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
          <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
        </BouncyPressable>
        <ThemedText style={styles.headerTitle}>Assistant IA</ThemedText>
        <View style={styles.backButton} />
      </View>

      <View style={styles.actionsRow}>
        <BouncyPressable style={styles.actionCard} onPress={() => router.push('/correct-homework')}>
          <View style={styles.actionIcon}>
            <IconSymbol name="doc.text.fill" size={16} color={COLORS.accent} />
          </View>
          <ThemedText style={styles.actionLabel}>Corrige mon devoir</ThemedText>
        </BouncyPressable>
        <BouncyPressable style={styles.actionCard} onPress={() => router.push('/prepare-homework')}>
          <View style={styles.actionIcon}>
            <IconSymbol name="checkmark.circle.fill" size={16} color={COLORS.accent} />
          </View>
          <ThemedText style={styles.actionLabel}>Me prépare pour un devoir</ThemedText>
        </BouncyPressable>
      </View>

      <AiTutorChatBody />
    </SafeAreaView>
  );
}
