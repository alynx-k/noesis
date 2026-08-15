import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { RocketIcon } from '@/components/rocket-icon';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton, SkeletonList } from '@/components/ui/skeleton';
import { GRADIENTS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useProgress } from '@/context/progress';
import { useSuccessfulSessionCount } from '@/hooks/queries/use-atlas';
import { useCoursesForGrade } from '@/hooks/queries/use-courses';
import { useLeaderboard } from '@/hooks/queries/use-leaderboard';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { getDisplayName } from '@/lib/profile';

const LEADERBOARD_PREVIEW_SIZE = 5;

export default function ProfileScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const { user } = useAuth();
  const { completedCourseIds } = useProgress();
  const coursesQuery = useCoursesForGrade();
  const sessionCountQuery = useSuccessfulSessionCount();
  const leaderboardQuery = useLeaderboard();
  const totalCourses = coursesQuery.data?.length ?? 0;
  const treesPlanted = sessionCountQuery.data ?? 0;
  const leaderboardEntries = (leaderboardQuery.data ?? []).slice(0, LEADERBOARD_PREVIEW_SIZE);

  const displayName = getDisplayName(user);
  const initial = displayName.charAt(0).toUpperCase();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'flex-start',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    avatar: {
      width: 64,
      height: 64,
      borderRadius: 32,
      alignItems: 'center',
      justifyContent: 'center',
      // Fallback so the avatar is never invisible if the gradient fails to paint.
      backgroundColor: '#8F7BF0',
    },
    avatarText: {
      fontSize: 28,
      fontWeight: '800',
      color: COLORS.accentText,
    },
    settingsButton: {
      padding: 4,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      marginBottom: SPACING.section,
    },
    sectionTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: SPACING.tight,
      marginTop: SPACING.element,
    },
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    statsRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      marginBottom: SPACING.element,
    },
    // Fixed minHeight so both stat cards line up exactly, regardless of small
    // content differences between them.
    statCard: {
      flex: 1,
      minHeight: 150,
    },
    rocketCardWrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
    },
    rocketCard: {
      flex: 1,
      borderRadius: RADIUS,
      padding: SPACING.element,
      // Fallback so the card is never invisible if the gradient fails to paint.
      backgroundColor: '#4B3F94',
    },
    // Matches badgeIcon's 36px + marginBottom footprint exactly, so this card
    // has the same content height as the "Cours terminés" card next to it.
    rocketIconSlot: {
      height: 36,
      justifyContent: 'center',
      alignItems: 'flex-start',
      marginBottom: SPACING.tight,
    },
    rocketCardLabel: {
      ...TYPOGRAPHY.caption,
      color: 'rgba(255,255,255,0.85)',
      marginBottom: 4,
    },
    rocketCardNumber: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.accentText,
    },
    badgeIcon: {
      width: 36,
      height: 36,
      borderRadius: 18,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
      // Fallback so the badge is never invisible if the gradient fails to paint.
      backgroundColor: '#8F7BF0',
    },
    statLabel: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginBottom: 4,
    },
    statNumberRow: {
      flexDirection: 'row',
      alignItems: 'baseline',
    },
    statNumber: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
    },
    statNumberTotal: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginLeft: 2,
    },
    historyRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    historyIcon: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    historyLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      flex: 1,
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
          <Animated.View entering={FadeIn.duration(400)}>
            <View style={styles.header}>
              <LinearGradient colors={GRADIENTS.badge} style={styles.avatar} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }}>
                <ThemedText style={styles.avatarText}>{initial}</ThemedText>
              </LinearGradient>
              <Link href="/settings" asChild>
                <BouncyPressable style={styles.settingsButton} hitSlop={8}>
                  <IconSymbol name="gearshape.fill" size={22} color={COLORS.mutedText} />
                </BouncyPressable>
              </Link>
            </View>

            <ThemedText style={styles.title}>{displayName}</ThemedText>

            <ThemedText style={styles.sectionTitle}>Apprentissage</ThemedText>
            <View style={styles.statsRow}>
              <ThemedView style={[styles.card, styles.statCard]}>
                <LinearGradient colors={GRADIENTS.badge} style={styles.badgeIcon} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }}>
                  <IconSymbol name="checkmark" size={18} color={COLORS.accentText} />
                </LinearGradient>
                <ThemedText style={styles.statLabel}>Cours terminés</ThemedText>
                {coursesQuery.isPending ? (
                  <Skeleton width={70} height={28} />
                ) : (
                  <View style={styles.statNumberRow}>
                    <Animated.Text key={completedCourseIds.length} entering={FadeIn.duration(350)} style={styles.statNumber}>
                      {completedCourseIds.length}
                    </Animated.Text>
                    <ThemedText style={styles.statNumberTotal}>/{totalCourses}</ThemedText>
                  </View>
                )}
              </ThemedView>
              <Link href="/garden" asChild>
                <BouncyPressable style={[styles.statCard, styles.rocketCardWrapper]}>
                  <LinearGradient
                    colors={GRADIENTS.cosmic}
                    start={{ x: 0, y: 0 }}
                    end={{ x: 1, y: 1 }}
                    style={styles.rocketCard}>
                    <View style={styles.rocketIconSlot}>
                      <RocketIcon size={26} floating />
                    </View>
                    <ThemedText style={styles.rocketCardLabel}>Fusées lancées</ThemedText>
                    {sessionCountQuery.isPending ? (
                      <Skeleton width={40} height={28} style={{ backgroundColor: 'rgba(255,255,255,0.25)' }} />
                    ) : (
                      <Animated.Text key={treesPlanted} entering={FadeIn.duration(350)} style={styles.rocketCardNumber}>
                        {treesPlanted}
                      </Animated.Text>
                    )}
                  </LinearGradient>
                </BouncyPressable>
              </Link>
            </View>

            <Link href="/course-history" asChild>
              <BouncyPressable style={styles.historyRow}>
                <View style={styles.historyIcon}>
                  <IconSymbol name="doc.text.fill" size={18} color={COLORS.accent} />
                </View>
                <ThemedText style={styles.historyLabel}>Historique des cours</ThemedText>
                <IconSymbol name="chevron.right" size={16} color={COLORS.mutedText} />
              </BouncyPressable>
            </Link>

            <ThemedText style={styles.sectionTitle}>Classement</ThemedText>

            {leaderboardQuery.isPending ? <SkeletonList count={3} cardHeight={56} /> : null}

            {leaderboardQuery.isError ? (
              <ErrorState title="Impossible de charger le classement" onRetry={() => leaderboardQuery.refetch()} />
            ) : null}

            {leaderboardQuery.isSuccess && leaderboardEntries.length === 0 ? (
              <ThemedText style={styles.leaderboardEmpty}>
                Personne n&apos;a encore terminé de cours — termine-en un pour apparaître ici !
              </ThemedText>
            ) : null}

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
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
