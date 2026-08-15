import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { SkeletonList } from '@/components/ui/skeleton';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useLeaderboard } from '@/hooks/queries/use-leaderboard';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

export default function CommunauteScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const leaderboardQuery = useLeaderboard();
  const leaderboardEntries = leaderboardQuery.data ?? [];

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
      marginBottom: SPACING.section,
    },
    leaderboardRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    leaderboardRowYou: {
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
    leaderboardEmpty: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <ThemedText style={styles.title}>Classement</ThemedText>

          {leaderboardQuery.isPending ? <SkeletonList count={6} cardHeight={56} /> : null}

          {leaderboardQuery.isError ? (
            <ErrorState title="Impossible de charger le classement" onRetry={() => leaderboardQuery.refetch()} />
          ) : null}

          {leaderboardQuery.isSuccess && leaderboardEntries.length === 0 ? (
            <ThemedText style={styles.leaderboardEmpty}>
              Personne n&apos;a encore terminé de cours — termine-en un pour apparaître ici !
            </ThemedText>
          ) : null}

          {leaderboardQuery.isSuccess ? (
            <Animated.View entering={FadeIn.duration(400)}>
              {leaderboardEntries.map((entry) => (
                <View key={entry.rank} style={[styles.leaderboardRow, entry.isYou && styles.leaderboardRowYou]}>
                  <View style={styles.rankBadge}>
                    <ThemedText style={styles.rankText}>{entry.rank}</ThemedText>
                  </View>
                  <ThemedText style={styles.pseudonym}>{entry.isYou ? 'Toi' : entry.pseudonym}</ThemedText>
                  <ThemedText style={styles.countText}>{entry.completedCount} cours</ThemedText>
                </View>
              ))}
            </Animated.View>
          ) : null}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
