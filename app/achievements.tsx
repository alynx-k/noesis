import { router } from 'expo-router';
import { StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAchievements } from '@/hooks/queries/use-achievements';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

export default function AchievementsScreen() {
  const COLORS = useThemeColors();
  const { data: achievements, isPending } = useAchievements();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.element,
    },
    backButton: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      ...cardBorder(COLORS),
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    scrollContent: {
      paddingHorizontal: SPACING.screen,
      paddingBottom: 40,
    },
    card: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    cardLocked: {
      opacity: 0.5,
    },
    badge: {
      width: 48,
      height: 48,
      borderRadius: 16,
      alignItems: 'center',
      justifyContent: 'center',
    },
    badgeLocked: {
      backgroundColor: COLORS.locked,
    },
    textCol: {
      flex: 1,
    },
    title: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 2,
    },
    description: {
      fontSize: 13,
      color: COLORS.mutedText,
    },
    date: {
      fontSize: 12,
      fontWeight: '600',
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
          <ThemedText style={styles.headerTitle}>Mes succès</ThemedText>
        </View>

        <View style={styles.scrollContent}>
          {isPending || !achievements ? (
            <SkeletonList count={5} cardHeight={72} />
          ) : (
            achievements.map(({ achievement, unlocked, unlockedAt }) => (
              <View key={achievement.id} style={[styles.card, !unlocked && styles.cardLocked]}>
                <View style={[styles.badge, unlocked ? { backgroundColor: achievement.color } : styles.badgeLocked]}>
                  <IconSymbol name={unlocked ? achievement.icon : 'lock.fill'} size={22} color="#FFFFFF" />
                </View>
                <View style={styles.textCol}>
                  <ThemedText style={styles.title}>{achievement.title}</ThemedText>
                  <ThemedText style={styles.description}>{achievement.description}</ThemedText>
                </View>
                {unlocked && unlockedAt ? (
                  <ThemedText style={styles.date}>
                    {unlockedAt.toLocaleDateString('fr-FR', { day: 'numeric', month: 'short', year: 'numeric' })}
                  </ThemedText>
                ) : null}
              </View>
            ))
          )}
        </View>
      </SafeAreaView>
    </ScreenBackground>
  );
}
