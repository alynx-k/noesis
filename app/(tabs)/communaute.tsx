import Ionicons from '@expo/vector-icons/Ionicons';
import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import { LinearGradient } from 'expo-linear-gradient';
import { Image, ImageSourcePropType, ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { GRADIENTS, RADIUS, SPACING, STATUS_COLORS, TYPOGRAPHY } from '@/constants/design';
import { useMyLeague } from '@/hooks/queries/use-league';
import { LeagueTier } from '@/lib/league';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

const TIER_LABELS: Record<LeagueTier, string> = {
  bronze: 'Bronze',
  argent: 'Argent',
  or: 'Or',
  platine: 'Platine',
  diamant: 'Diamant',
  heroique: 'Héroïque',
  maitre: 'Maître',
  grand_maitre: 'Grand Maître',
};

const TIER_GRADIENTS: Record<LeagueTier, readonly [string, string, ...string[]]> = {
  bronze: GRADIENTS.bronze,
  argent: GRADIENTS.silver,
  or: GRADIENTS.gold,
  platine: GRADIENTS.platinum,
  diamant: GRADIENTS.diamond,
  heroique: GRADIENTS.heroic,
  maitre: GRADIENTS.master,
  grand_maitre: GRADIENTS.grandmaster,
};

// Only 5 of 8 tier badges exist so far — bronze/argent/maitre fall back to
// the generic trophy icon below until their images arrive (require() needs
// a literal, existing path, so these can't be filled in speculatively).
const TIER_BADGE_IMAGES: Partial<Record<LeagueTier, ImageSourcePropType>> = {
  or: require('@/assets/images/leagues/or.png'),
  platine: require('@/assets/images/leagues/platine.png'),
  diamant: require('@/assets/images/leagues/diamant.png'),
  heroique: require('@/assets/images/leagues/heroique.png'),
  grand_maitre: require('@/assets/images/leagues/grand_maitre.png'),
};

export default function CommunauteScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const leagueQuery = useMyLeague();
  const league = leagueQuery.data ?? null;

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
      marginBottom: SPACING.tight,
    },
    tierBanner: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
    },
    tierIconBadge: {
      width: 48,
      height: 48,
      borderRadius: 24,
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: 'rgba(255,255,255,0.35)',
    },
    tierBadgeImage: {
      width: 64,
      height: 64,
    },
    tierTitle: {
      ...TYPOGRAPHY.title,
      color: '#FFFFFF',
    },
    tierSubtitle: {
      ...TYPOGRAPHY.caption,
      color: 'rgba(255,255,255,0.9)',
      marginTop: 2,
    },
    zoneBanner: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
    },
    zoneText: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      flex: 1,
    },
    leagueRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    leagueRowYou: {
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
    leagueEmpty: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
  });

  const promoteCount = league ? Math.max(1, Math.ceil(league.groupSize * 0.3)) : 0;
  const relegateCount = league ? Math.max(1, Math.ceil(league.groupSize * 0.3)) : 0;

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <ThemedText style={styles.title}>Classement</ThemedText>

          {leagueQuery.isPending ? <SkeletonList count={6} cardHeight={56} /> : null}

          {leagueQuery.isError ? (
            <ErrorState title="Impossible de charger ton classement" onRetry={() => leagueQuery.refetch()} />
          ) : null}

          {leagueQuery.isSuccess && !league ? (
            <ThemedText style={styles.leagueEmpty}>
              Termine ta classe pour rejoindre une ligue et apparaître ici !
            </ThemedText>
          ) : null}

          {league ? (
            <Animated.View entering={FadeIn.duration(400)}>
              <LinearGradient colors={TIER_GRADIENTS[league.tier]} style={styles.tierBanner}>
                {TIER_BADGE_IMAGES[league.tier] ? (
                  <Image source={TIER_BADGE_IMAGES[league.tier]} style={styles.tierBadgeImage} resizeMode="contain" />
                ) : (
                  <View style={styles.tierIconBadge}>
                    <IconSymbol name="trophy.fill" size={24} color="#FFFFFF" />
                  </View>
                )}
                <View>
                  <ThemedText style={styles.tierTitle}>Ligue {TIER_LABELS[league.tier]}</ThemedText>
                  <ThemedText style={styles.tierSubtitle}>
                    {league.groupSize} élèves de ta classe · cette semaine
                  </ThemedText>
                </View>
              </LinearGradient>

              {league.promotionZone ? (
                <View style={[styles.zoneBanner, { backgroundColor: `${STATUS_COLORS.success}22` }]}>
                  <Ionicons name="arrow-up-circle" size={18} color={STATUS_COLORS.success} />
                  <ThemedText style={[styles.zoneText, { color: STATUS_COLORS.success }]}>
                    Tu es dans le top {promoteCount} — tu vas monter de ligue lundi !
                  </ThemedText>
                </View>
              ) : null}
              {league.relegationZone ? (
                <View style={[styles.zoneBanner, { backgroundColor: `${STATUS_COLORS.error}18` }]}>
                  <Ionicons name="arrow-down-circle" size={18} color={STATUS_COLORS.error} />
                  <ThemedText style={[styles.zoneText, { color: STATUS_COLORS.error }]}>
                    Attention, tu es dans les {relegateCount} derniers — termine des leçons pour rester dans ta ligue.
                  </ThemedText>
                </View>
              ) : null}

              {league.entries.map((entry) => (
                <View key={entry.userId} style={[styles.leagueRow, entry.isYou && styles.leagueRowYou]}>
                  <View style={styles.rankBadge}>
                    <ThemedText style={styles.rankText}>{entry.rank}</ThemedText>
                  </View>
                  <ThemedText style={styles.pseudonym}>{entry.isYou ? 'Toi' : entry.pseudonym}</ThemedText>
                  <ThemedText style={styles.countText}>{entry.lessonsThisWeek} leçons</ThemedText>
                </View>
              ))}
            </Animated.View>
          ) : null}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
