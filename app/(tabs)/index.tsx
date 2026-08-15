import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { useEffect } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { Easing, FadeIn, useAnimatedStyle, useSharedValue, withTiming } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { FlameIcon } from '@/components/flame-icon';
import { HomeWidgetPreview } from '@/components/home-widget-preview';
import { RocketIcon } from '@/components/rocket-icon';
import { StreakBadge } from '@/components/streak-badge';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { ErrorState } from '@/components/ui/error-state';
import { Halo } from '@/components/ui/halo';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton, SkeletonCard } from '@/components/ui/skeleton';
import { GRADIENTS, HALO_COLORS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useFocusSession } from '@/context/focus-session';
import { useNextUpCourse } from '@/hooks/queries/use-next-up';
import { useProfile } from '@/hooks/queries/use-profile';
import { useStreak } from '@/hooks/queries/use-streak';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { getDisplayName } from '@/lib/profile';

const WEEKDAY_LABELS = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

function formatTime(totalSeconds: number): string {
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;
  return `${minutes}:${seconds.toString().padStart(2, '0')}`;
}

// Animates its fill in from 0 on mount rather than snapping straight to the
// target width, so the week card reads as "filling up" instead of a static bar.
function WeekProgressBar({ completed, total, trackColor }: { completed: number; total: number; trackColor: string }) {
  const progress = useSharedValue(0);
  const target = total > 0 ? completed / total : 0;

  useEffect(() => {
    progress.value = withTiming(target, { duration: 600, easing: Easing.out(Easing.cubic) });
  }, [target, progress]);

  const fillStyle = useAnimatedStyle(() => ({
    width: `${progress.value * 100}%`,
  }));

  return (
    <View style={[progressBarStyles.track, { backgroundColor: trackColor }]}>
      <Animated.View style={fillStyle}>
        <LinearGradient
          colors={GRADIENTS.fire}
          start={{ x: 0, y: 0 }}
          end={{ x: 1, y: 0 }}
          style={progressBarStyles.fill}
        />
      </Animated.View>
    </View>
  );
}

const progressBarStyles = StyleSheet.create({
  track: {
    height: 8,
    borderRadius: 999,
    overflow: 'hidden',
  },
  fill: {
    height: 8,
    borderRadius: 999,
  },
});

export default function HomeScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const { phase: focusPhase, remainingSeconds } = useFocusSession();
  const tabBarHeight = useBottomTabBarHeight();

  // No gating/redirect logic here anymore — Stack.Protected in app/_layout.tsx
  // guarantees session+grade+lv2+placement are all satisfied before this
  // screen can even mount. Each widget degrades independently: a failed
  // streak or next-up fetch doesn't blank the rest of the screen.
  const profileQuery = useProfile();
  const streakQuery = useStreak();
  const nextUpQuery = useNextUpCourse();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
    },
    haloWrap: {
      position: 'absolute',
      top: -80,
      right: -60,
    },
    greeting: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      marginBottom: SPACING.element,
    },
    greetingName: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
    },
    streakCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
    },
    streakHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    streakTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    weekRow: {
      flexDirection: 'row',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    weekDay: {
      alignItems: 'center',
      gap: 6,
    },
    weekDayCircle: {
      width: 32,
      height: 32,
      borderRadius: 16,
      backgroundColor: COLORS.lockedBackground,
      alignItems: 'center',
      justifyContent: 'center',
      overflow: 'hidden',
    },
    weekDayLabel: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
    },
    weekDayLabelDone: {
      color: COLORS.text,
      fontWeight: '700',
    },
    nextUpCardWrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
      marginBottom: SPACING.element,
    },
    nextUpCard: {
      backgroundColor: COLORS.surface,
      padding: SPACING.element,
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      ...cardBorder(COLORS),
    },
    nextUpIcon: {
      width: 40,
      height: 40,
      borderRadius: 12,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    nextUpText: {
      flex: 1,
    },
    nextUpLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      textTransform: 'uppercase',
      marginBottom: 2,
    },
    nextUpTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    focusCardWrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
      marginBottom: SPACING.element,
    },
    focusCard: {
      padding: SPACING.element,
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      // Fallback so the card is never invisible if the gradient fails to paint.
      backgroundColor: '#7C6FE0',
    },
    actionIconBadge: {
      width: 52,
      height: 52,
      borderRadius: 18,
      backgroundColor: 'rgba(255,255,255,0.16)',
      borderWidth: 1,
      borderColor: 'rgba(255,255,255,0.28)',
      alignItems: 'center',
      justifyContent: 'center',
    },
    focusCardText: {
      flexShrink: 1,
    },
    focusCardTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.accentText,
    },
    focusCardSubtitle: {
      ...TYPOGRAPHY.caption,
      color: COLORS.accentText,
      opacity: 0.9,
      marginTop: 2,
    },
    aiCardWrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
    },
    aiCard: {
      padding: SPACING.element,
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      // Fallback so the card is never invisible if the gradient fails to paint.
      backgroundColor: '#4B3F94',
    },
  });

  if (profileQuery.isPending) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <View style={styles.scrollContent}>
            <Skeleton height={34} width="70%" style={{ marginBottom: SPACING.element }} />
            <SkeletonCard height={104} />
            <View style={{ height: SPACING.element }} />
            <SkeletonCard height={72} />
            <View style={{ height: SPACING.element }} />
            <SkeletonCard height={80} />
          </View>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (profileQuery.isError) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ErrorState
            title="Impossible de charger ton profil"
            description="Vérifie ta connexion et réessaie."
            onRetry={() => profileQuery.refetch()}
          />
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  const streakInfo = streakQuery.data ?? { streak: 0, weekDays: [false, false, false, false, false, false, false] };
  const nextUp = nextUpQuery.data;
  const firstName = getDisplayName(user);

  return (
    <ScreenBackground>
      <View style={styles.haloWrap} pointerEvents="none">
        <Halo color={HALO_COLORS.gold} size={220} opacity={0.22} />
      </View>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <Animated.View entering={FadeIn.duration(450)}>
            <ThemedText style={styles.greeting}>
              Hey 👋 On révise{'\n'}
              <ThemedText style={styles.greetingName}>{firstName}</ThemedText> ?
            </ThemedText>

            <HomeWidgetPreview />

            <Link href="/streak-overview" asChild>
              <BouncyPressable style={styles.streakCard}>
                <View style={styles.streakHeader}>
                  <ThemedText style={styles.streakTitle}>Série de révision</ThemedText>
                  <StreakBadge streak={streakInfo.streak} isPending={streakQuery.isPending} isError={streakQuery.isError} />
                </View>
                <View style={styles.weekRow}>
                  {WEEKDAY_LABELS.map((label, index) => {
                    const done = streakInfo.weekDays[index];
                    return (
                      <View key={label} style={styles.weekDay}>
                        <View style={styles.weekDayCircle}>
                          {done ? (
                            <LinearGradient
                              colors={GRADIENTS.fire}
                              start={{ x: 0, y: 0 }}
                              end={{ x: 1, y: 1 }}
                              style={StyleSheet.absoluteFill}
                            />
                          ) : null}
                          {done ? <FlameIcon size={16} animated={false} /> : null}
                        </View>
                        <ThemedText style={[styles.weekDayLabel, done && styles.weekDayLabelDone]}>{label}</ThemedText>
                      </View>
                    );
                  })}
                </View>
                <WeekProgressBar
                  completed={streakInfo.weekDays.filter(Boolean).length}
                  total={streakInfo.weekDays.length}
                  trackColor={COLORS.lockedBackground}
                />
              </BouncyPressable>
            </Link>

            {nextUp ? (
              <Link href={{ pathname: '/course/[id]', params: { id: nextUp.courseId } }} asChild>
                <BouncyPressable style={styles.nextUpCardWrapper}>
                  <View style={styles.nextUpCard}>
                    <View style={styles.nextUpIcon}>
                      <Ionicons name="refresh" size={20} color={COLORS.accent} />
                    </View>
                    <View style={styles.nextUpText}>
                      <ThemedText style={styles.nextUpLabel}>Reprise rapide</ThemedText>
                      <ThemedText style={styles.nextUpTitle}>{nextUp.courseTitle}</ThemedText>
                    </View>
                    <IconSymbol name="chevron.right" size={16} color={COLORS.mutedText} />
                  </View>
                </BouncyPressable>
              </Link>
            ) : null}

            <Link href="/focus-session" asChild>
              <BouncyPressable style={styles.focusCardWrapper}>
                <LinearGradient
                  colors={GRADIENTS.hero}
                  start={{ x: 0, y: 0 }}
                  end={{ x: 1, y: 1 }}
                  style={styles.focusCard}>
                  <View style={styles.actionIconBadge}>
                    <RocketIcon size={26} floating />
                  </View>
                  <View style={styles.focusCardText}>
                    <ThemedText style={styles.focusCardTitle}>
                      {focusPhase === 'running' ? 'Session en cours' : 'Session de concentration'}
                    </ThemedText>
                    <ThemedText style={styles.focusCardSubtitle}>
                      {focusPhase === 'running'
                        ? `${formatTime(remainingSeconds)} restantes — la fusée vole`
                        : 'Lance une fusée et reste concentré 20 minutes 🚀'}
                    </ThemedText>
                  </View>
                </LinearGradient>
              </BouncyPressable>
            </Link>

            <Link href="/ai-chat" asChild>
              <BouncyPressable style={styles.aiCardWrapper}>
                <LinearGradient
                  colors={GRADIENTS.cosmic}
                  start={{ x: 0, y: 0 }}
                  end={{ x: 1, y: 1 }}
                  style={styles.aiCard}>
                  <View style={styles.actionIconBadge}>
                    <IconSymbol name="sparkles" size={26} color={COLORS.accentText} />
                  </View>
                  <View style={styles.focusCardText}>
                    <ThemedText style={styles.focusCardTitle}>Discuter avec ton tuteur IA</ThemedText>
                    <ThemedText style={styles.focusCardSubtitle}>
                      Pose une question, corrige un devoir, prépare-toi pour un contrôle
                    </ThemedText>
                  </View>
                </LinearGradient>
              </BouncyPressable>
            </Link>
          </Animated.View>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
