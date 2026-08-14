import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { GridBackground } from '@/components/grid-background';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useLeaderboard } from '@/hooks/queries/use-leaderboard';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

export default function CommunityScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const leaderboardQuery = useLeaderboard();
  const entries = leaderboardQuery.data ?? [];

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
    },
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
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    rowYou: {
      borderColor: COLORS.accent,
      borderWidth: 1.5,
    },
    rankBadge: {
      width: 32,
      height: 32,
      borderRadius: 16,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    rankText: {
      fontSize: 14,
      fontWeight: '800',
      color: COLORS.accent,
    },
    pseudonym: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      flex: 1,
    },
    countText: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.mutedText,
    },
    emptyState: {
      alignItems: 'center',
      gap: SPACING.tight,
      paddingTop: SPACING.section,
    },
    emptyIcon: {
      width: 64,
      height: 64,
      borderRadius: 32,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    emptyText: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <ThemedText style={styles.title}>Classement</ThemedText>
          <ThemedText style={styles.subtitle}>Les élèves avec le plus de cours terminés.</ThemedText>

          {leaderboardQuery.isPending ? <SkeletonList count={5} cardHeight={56} /> : null}

          {leaderboardQuery.isError ? (
            <ErrorState
              title="Impossible de charger le classement"
              onRetry={() => leaderboardQuery.refetch()}
            />
          ) : null}

          {leaderboardQuery.isSuccess && entries.length === 0 ? (
            <View style={styles.emptyState}>
              <View style={styles.emptyIcon}>
                <IconSymbol name="trophy.fill" size={28} color={COLORS.accent} />
              </View>
              <ThemedText style={styles.emptyText}>
                Personne n&apos;a encore terminé de cours — termine-en un pour apparaître ici !
              </ThemedText>
            </View>
          ) : (
            entries.map((entry) => (
              <View key={entry.rank} style={[styles.row, entry.isYou && styles.rowYou]}>
                <View style={styles.rankBadge}>
                  <ThemedText style={styles.rankText}>{entry.rank}</ThemedText>
                </View>
                <ThemedText style={styles.pseudonym}>{entry.isYou ? 'Toi' : entry.pseudonym}</ThemedText>
                <ThemedText style={styles.countText}>{entry.completedCount} cours</ThemedText>
              </View>
            ))
          )}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
