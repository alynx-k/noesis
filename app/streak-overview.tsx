import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { FlameIcon } from '@/components/flame-icon';
import { GridBackground } from '@/components/grid-background';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonCard } from '@/components/ui/skeleton';
import { GRADIENTS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useMonthOverview } from '@/hooks/queries/use-month-overview';
import { useStreak } from '@/hooks/queries/use-streak';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

const WEEKDAY_LABELS = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

// Monday-first index (0 = Monday .. 6 = Sunday) for a given date's weekday.
function mondayIndex(date: Date): number {
  const day = date.getDay();
  return day === 0 ? 6 : day - 1;
}

export default function StreakOverviewScreen() {
  const COLORS = useThemeColors();
  const streakQuery = useStreak();
  const overviewQuery = useMonthOverview();
  const streakInfo = streakQuery.data ?? { streak: 0, weekDays: [false, false, false, false, false, false, false] };
  const overview = overviewQuery.data ?? null;

  const leadingBlanks = overview ? mondayIndex(overview.days[0].date) : 0;

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
      padding: SPACING.screen,
      paddingTop: 0,
      paddingBottom: 40,
    },
    streakRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      marginBottom: SPACING.element,
    },
    streakBadge: {
      width: 56,
      height: 56,
      borderRadius: 28,
      alignItems: 'center',
      justifyContent: 'center',
      // Fallback so the badge is never invisible if the gradient fails to paint.
      backgroundColor: '#8F7BF0',
    },
    streakNumber: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
    },
    streakLabel: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
    explainer: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginBottom: SPACING.section,
    },
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    monthTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.element,
    },
    weekdayRow: {
      flexDirection: 'row',
      marginBottom: SPACING.tight,
    },
    weekdayLabel: {
      width: `${100 / 7}%`,
      textAlign: 'center',
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
    },
    grid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
    },
    dayCell: {
      width: `${100 / 7}%`,
      alignItems: 'center',
      marginBottom: SPACING.tight,
    },
    dayCircle: {
      width: 32,
      height: 32,
      borderRadius: 16,
      alignItems: 'center',
      justifyContent: 'center',
    },
    dayCircleActive: {
      backgroundColor: COLORS.accent,
    },
    dayCircleToday: {
      borderWidth: 1.5,
      borderColor: COLORS.accent,
    },
    dayNumber: {
      ...TYPOGRAPHY.caption,
      color: COLORS.text,
    },
    dayNumberActive: {
      color: COLORS.accentText,
      fontWeight: '700',
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
          <ThemedText style={styles.headerTitle}>Série de révision</ThemedText>
          <View style={styles.backButton} />
        </View>

        <ScrollView contentContainerStyle={styles.scrollContent}>
          <View style={styles.streakRow}>
            <LinearGradient colors={GRADIENTS.badge} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }} style={styles.streakBadge}>
              <FlameIcon size={30} />
            </LinearGradient>
            <View>
              <ThemedText style={styles.streakNumber}>{streakInfo.streak}</ThemedText>
              <ThemedText style={styles.streakLabel}>
                {streakInfo.streak > 1 ? 'jours consécutifs' : 'jour consécutif'}
              </ThemedText>
            </View>
          </View>

          <ThemedText style={styles.explainer}>
            Un jour compte dès que tu réponds à une question, termines un cours ou réussis une session de
            concentration.
          </ThemedText>

          {overviewQuery.isPending ? <SkeletonCard height={280} /> : null}

          {overviewQuery.isError ? (
            <ErrorState title="Impossible de charger le calendrier" onRetry={() => overviewQuery.refetch()} />
          ) : null}

          {overview ? (
            <ThemedView style={styles.card}>
              <ThemedText style={styles.monthTitle}>{overview.monthLabel}</ThemedText>

              <View style={styles.weekdayRow}>
                {WEEKDAY_LABELS.map((label, index) => (
                  <ThemedText key={`${label}-${index}`} style={styles.weekdayLabel}>
                    {label}
                  </ThemedText>
                ))}
              </View>

              <View style={styles.grid}>
                {Array.from({ length: leadingBlanks }).map((_, index) => (
                  <View key={`blank-${index}`} style={styles.dayCell} />
                ))}
                {overview.days.map((day) => (
                  <View key={day.date.toISOString()} style={styles.dayCell}>
                    <View
                      style={[
                        styles.dayCircle,
                        day.active && styles.dayCircleActive,
                        day.isToday && styles.dayCircleToday,
                      ]}>
                      <ThemedText style={[styles.dayNumber, day.active && styles.dayNumberActive]}>
                        {day.date.getDate()}
                      </ThemedText>
                    </View>
                  </View>
                ))}
              </View>
            </ThemedView>
          ) : null}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
