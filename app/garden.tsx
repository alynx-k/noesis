import { router } from 'expo-router';
import { useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GridBackground } from '@/components/grid-background';
import { PlanetIcon } from '@/components/planet-icon';
import { ScreenBackground } from '@/components/screen-background';
import { RocketIcon } from '@/components/rocket-icon';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAtlasOverview, useLaunches } from '@/hooks/queries/use-atlas';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type Tab = 'atlas' | 'historique';

export default function GardenScreen() {
  const COLORS = useThemeColors();
  const [tab, setTab] = useState<Tab>('atlas');
  const overviewQuery = useAtlasOverview();
  const launchesQuery = useLaunches();

  const overview = overviewQuery.data ?? { entries: [], totalSessions: 0, unlockedCount: 0 };
  const launches = launchesQuery.data ?? [];

  const totalDestinations = overview.entries.length;
  const progressRatio = totalDestinations > 0 ? overview.unlockedCount / totalDestinations : 0;

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
    tabRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      paddingHorizontal: SPACING.screen,
      paddingBottom: SPACING.element,
    },
    tabButton: {
      flex: 1,
      paddingVertical: 10,
      borderRadius: PILL_RADIUS,
      alignItems: 'center',
      backgroundColor: COLORS.surface,
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
    },
    tabButtonActive: {
      backgroundColor: COLORS.accent,
      borderColor: COLORS.accent,
    },
    tabButtonText: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    tabButtonTextActive: {
      color: COLORS.accentText,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingTop: 0,
      paddingBottom: 40,
    },
    progressCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
    },
    progressHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.tight,
    },
    progressTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    progressCount: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
    },
    progressTrack: {
      height: 8,
      borderRadius: 4,
      backgroundColor: COLORS.lockedBackground,
      overflow: 'hidden',
    },
    progressFill: {
      height: 8,
      borderRadius: 4,
      backgroundColor: COLORS.accent,
    },
    grid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'space-between',
    },
    destinationCard: {
      width: '48%',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      alignItems: 'center',
      ...cardBorder(COLORS),
    },
    destinationName: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      textAlign: 'center',
      marginTop: SPACING.tight,
    },
    destinationNameLocked: {
      color: COLORS.mutedText,
    },
    destinationDistance: {
      ...TYPOGRAPHY.caption,
      color: COLORS.accent,
      fontWeight: '700',
      marginTop: 2,
    },
    destinationFact: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginTop: 6,
    },
    destinationLockHint: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginTop: 6,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.element,
    },
    emptyCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    emptyTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 4,
    },
    emptyText: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
    launchGrid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      gap: SPACING.element,
    },
    launchSlot: {
      width: 84,
      alignItems: 'center',
    },
    launchDate: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginTop: 6,
    },
  });

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Atlas spatial</ThemedText>
          <View style={styles.backButton} />
        </View>

        <View style={styles.tabRow}>
          <BouncyPressable
            style={[styles.tabButton, tab === 'atlas' && styles.tabButtonActive]}
            onPress={() => setTab('atlas')}>
            <ThemedText style={[styles.tabButtonText, tab === 'atlas' && styles.tabButtonTextActive]}>Atlas</ThemedText>
          </BouncyPressable>
          <BouncyPressable
            style={[styles.tabButton, tab === 'historique' && styles.tabButtonActive]}
            onPress={() => setTab('historique')}>
            <ThemedText style={[styles.tabButtonText, tab === 'historique' && styles.tabButtonTextActive]}>
              Historique
            </ThemedText>
          </BouncyPressable>
        </View>

        <ScrollView contentContainerStyle={styles.scrollContent}>
          {tab === 'atlas' && overviewQuery.isPending ? <SkeletonList count={4} cardHeight={140} /> : null}
          {tab === 'atlas' && overviewQuery.isError ? (
            <ErrorState
              title="Impossible de charger l'atlas"
              onRetry={() => overviewQuery.refetch()}
            />
          ) : null}

          {tab === 'atlas' && overviewQuery.isSuccess ? (
            <>
              <View style={styles.progressCard}>
                <View style={styles.progressHeader}>
                  <ThemedText style={styles.progressTitle}>
                    {overview.unlockedCount}/{totalDestinations} destinations découvertes
                  </ThemedText>
                  <ThemedText style={styles.progressCount}>{overview.totalSessions} lancements réussis</ThemedText>
                </View>
                <View style={styles.progressTrack}>
                  <View style={[styles.progressFill, { width: `${Math.round(progressRatio * 100)}%` }]} />
                </View>
              </View>

              <Animated.View entering={FadeIn.duration(400)} style={styles.grid}>
                {overview.entries.map((entry) => (
                  <View key={entry.destination.id} style={styles.destinationCard}>
                    <PlanetIcon
                      size={56}
                      baseColor={entry.destination.baseColor}
                      shadeColor={entry.destination.shadeColor}
                      hasRing={entry.destination.hasRing}
                      locked={!entry.unlocked}
                    />
                    <ThemedText style={[styles.destinationName, !entry.unlocked && styles.destinationNameLocked]}>
                      {entry.unlocked ? entry.destination.name : '???'}
                    </ThemedText>
                    {entry.unlocked ? (
                      <>
                        <ThemedText style={styles.destinationDistance}>{entry.destination.distanceLabel}</ThemedText>
                        <ThemedText style={styles.destinationFact}>{entry.destination.funFact}</ThemedText>
                      </>
                    ) : (
                      <ThemedText style={styles.destinationLockHint}>
                        Encore {entry.sessionsRemaining} session{entry.sessionsRemaining > 1 ? 's' : ''}
                      </ThemedText>
                    )}
                  </View>
                ))}
              </Animated.View>
            </>
          ) : null}

          {tab === 'historique' && launchesQuery.isPending ? <SkeletonList count={3} cardHeight={64} /> : null}
          {tab === 'historique' && launchesQuery.isError ? (
            <ErrorState title="Impossible de charger l'historique" onRetry={() => launchesQuery.refetch()} />
          ) : null}

          {tab === 'historique' && launchesQuery.isSuccess ? (
            <>
              <ThemedText style={styles.subtitle}>
                {launches.length > 0
                  ? `${launches.length} fusée${launches.length > 1 ? 's' : ''} lancée${launches.length > 1 ? 's' : ''}, pour toujours.`
                  : ''}
              </ThemedText>

              {launches.length === 0 ? (
                <ThemedView style={styles.emptyCard}>
                  <ThemedText style={styles.emptyTitle}>Aucun lancement pour l&apos;instant</ThemedText>
                  <ThemedText style={styles.emptyText}>
                    Termine une session de concentration jusqu&apos;au bout pour réussir ton premier lancement.
                  </ThemedText>
                </ThemedView>
              ) : (
                <Animated.View entering={FadeIn.duration(400)} style={styles.launchGrid}>
                  {launches.map((launch) => (
                    <View key={launch.id} style={styles.launchSlot}>
                      <RocketIcon size={36} />
                      <ThemedText style={styles.launchDate}>
                        {launch.completedAt.toLocaleDateString('fr-FR', { day: 'numeric', month: 'short' })}
                      </ThemedText>
                    </View>
                  ))}
                </Animated.View>
              )}
            </>
          ) : null}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
