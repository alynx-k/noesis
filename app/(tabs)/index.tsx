import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { FlameIcon } from '@/components/flame-icon';
import { GridBackground } from '@/components/grid-background';
import { GridCutoff } from '@/components/grid-cutoff';
import { RocketIcon } from '@/components/rocket-icon';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton, SkeletonCard, SkeletonList } from '@/components/ui/skeleton';
import { DISCIPLINES, getDisciplineIdsFor } from '@/constants/disciplines';
import { GRADIENTS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useFocusSession } from '@/context/focus-session';
import { useProfile } from '@/hooks/queries/use-profile';
import { useStreak } from '@/hooks/queries/use-streak';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

const WEEKDAY_LABELS = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];

function firstNameFromEmail(email: string | undefined | null): string {
  if (!email) {
    return '';
  }
  const local = email.split('@')[0];
  return local.charAt(0).toUpperCase() + local.slice(1);
}

function formatTime(totalSeconds: number): string {
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;
  return `${minutes}:${seconds.toString().padStart(2, '0')}`;
}

export default function HomeScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const { phase: focusPhase, remainingSeconds } = useFocusSession();
  const tabBarHeight = useBottomTabBarHeight();

  // No gating/redirect logic here anymore — Stack.Protected in app/_layout.tsx
  // guarantees session+grade+lv2+placement are all satisfied before this
  // screen can even mount. This just loads what it needs to render, and each
  // widget degrades independently: a failed streak fetch doesn't blank the
  // subject grid, only the profile fetch (which the grid needs) does.
  const profileQuery = useProfile();
  const streakQuery = useStreak();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
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
    streakPill: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      borderRadius: 999,
      paddingVertical: 4,
      paddingHorizontal: 12,
      // Fallback so the pill is never invisible if the gradient fails to paint.
      backgroundColor: '#C9B8FF',
    },
    streakPillText: {
      fontSize: 13,
      fontWeight: '700',
      color: COLORS.text,
    },
    weekRow: {
      flexDirection: 'row',
      justifyContent: 'space-between',
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
    },
    weekDayCircleDone: {
      backgroundColor: COLORS.accent,
    },
    weekDayLabel: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
    },
    focusCardWrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
      marginBottom: SPACING.section,
    },
    focusCard: {
      padding: SPACING.element,
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      // Fallback so the card is never invisible if the gradient fails to paint.
      backgroundColor: '#7C6FE0',
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
    sectionTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: SPACING.tight,
    },
    aiCardWrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
      marginTop: SPACING.element,
    },
    aiCard: {
      padding: SPACING.element,
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      // Fallback so the card is never invisible if the gradient fails to paint.
      backgroundColor: '#4B3F94',
    },
    matieresGrid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'space-between',
    },
    gridItem: {
      width: '48%',
      marginBottom: SPACING.tight,
    },
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    iconBadge: {
      width: 40,
      height: 40,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
      // Fallback so the badge is never invisible if the gradient fails to paint.
      backgroundColor: COLORS.accent,
    },
    iconBadgeLocked: {
      backgroundColor: COLORS.lockedBackground,
    },
    cardTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    cardLocked: {
      backgroundColor: COLORS.lockedBackground,
      borderColor: COLORS.borderStrong,
    },
    cardTitleLocked: {
      ...TYPOGRAPHY.body,
      fontWeight: '600',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    badge: {
      alignSelf: 'flex-start',
      backgroundColor: COLORS.surface,
      borderRadius: 999,
      paddingVertical: 4,
      paddingHorizontal: 10,
      borderWidth: 1,
      borderColor: COLORS.borderStrong,
    },
    badgeText: {
      fontSize: 11,
      fontWeight: '700',
      color: COLORS.text,
    },
  });

  if (profileQuery.isPending) {
    return (
      <ScreenBackground>
        <GridBackground />
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <View style={styles.scrollContent}>
            <Skeleton height={34} width="70%" style={{ marginBottom: SPACING.element }} />
            <SkeletonCard height={104} />
            <View style={{ height: SPACING.element }} />
            <SkeletonCard height={80} />
            <View style={{ height: SPACING.section }} />
            <SkeletonList count={4} cardHeight={90} />
          </View>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (profileQuery.isError) {
    return (
      <ScreenBackground>
        <GridBackground />
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

  const profile = profileQuery.data;
  const disciplineIdsForGrade = profile?.grade ? getDisciplineIdsFor(profile.grade, profile.serie) : [];
  const visibleDisciplines = DISCIPLINES.filter(
    (discipline) =>
      disciplineIdsForGrade.includes(discipline.id) &&
      ((discipline.id !== 'espagnol' && discipline.id !== 'allemand') || discipline.id === profile?.lv2),
  );
  const streakInfo = streakQuery.data ?? { streak: 0, weekDays: [false, false, false, false, false, false, false] };

  const firstName = firstNameFromEmail(user?.email);

  return (
    <ScreenBackground>
      <GridBackground />
      <GridCutoff />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <ThemedText style={styles.greeting}>
            Hey 👋 On révise{'\n'}
            <ThemedText style={styles.greetingName}>{firstName}</ThemedText> ?
          </ThemedText>

          <Link href="/streak-overview" asChild>
            <BouncyPressable style={styles.streakCard}>
              <View style={styles.streakHeader}>
                <ThemedText style={styles.streakTitle}>Série de révision</ThemedText>
                {streakQuery.isPending ? (
                  <Skeleton width={56} height={26} radius={999} />
                ) : (
                  <LinearGradient
                    colors={GRADIENTS.badge}
                    start={{ x: 0, y: 0 }}
                    end={{ x: 1, y: 1 }}
                    style={styles.streakPill}>
                    {streakQuery.isError ? (
                      <Ionicons name="warning" size={14} color={COLORS.text} />
                    ) : (
                      <FlameIcon size={18} />
                    )}
                    <ThemedText style={styles.streakPillText}>
                      {streakQuery.isError ? '—' : streakInfo.streak}
                    </ThemedText>
                  </LinearGradient>
                )}
              </View>
              <View style={styles.weekRow}>
                {WEEKDAY_LABELS.map((label, index) => {
                  const done = streakInfo.weekDays[index];
                  return (
                    <View key={label} style={styles.weekDay}>
                      <View style={[styles.weekDayCircle, done && styles.weekDayCircleDone]}>
                        {done ? <IconSymbol name="checkmark" size={16} color={COLORS.accentText} /> : null}
                      </View>
                      <ThemedText style={styles.weekDayLabel}>{label}</ThemedText>
                    </View>
                  );
                })}
              </View>
            </BouncyPressable>
          </Link>

          <Link href="/focus-session" asChild>
            <BouncyPressable style={styles.focusCardWrapper}>
              <LinearGradient
                colors={GRADIENTS.hero}
                start={{ x: 0, y: 0 }}
                end={{ x: 1, y: 1 }}
                style={styles.focusCard}>
                <RocketIcon size={24} floating />
                <View style={styles.focusCardText}>
                  <ThemedText style={styles.focusCardTitle}>
                    {focusPhase === 'running' ? 'Session en cours' : 'Session de concentration'}
                  </ThemedText>
                  <ThemedText style={styles.focusCardSubtitle}>
                    {focusPhase === 'running'
                      ? `${formatTime(remainingSeconds)} restantes — la fusée vole`
                      : 'Lance une fusée en restant concentré'}
                  </ThemedText>
                </View>
              </LinearGradient>
            </BouncyPressable>
          </Link>

          <ThemedText style={styles.sectionTitle}>Mes matières</ThemedText>

          <View style={styles.matieresGrid}>
            {visibleDisciplines.map((discipline, index) => {
              if (!discipline.available) {
                return (
                  <Animated.View
                    key={discipline.id}
                    entering={FadeInDown.delay(index * 60).springify().damping(16)}
                    style={styles.gridItem}>
                    <View style={[styles.card, styles.cardLocked]}>
                      <View style={[styles.iconBadge, styles.iconBadgeLocked]}>
                        <IconSymbol name={discipline.icon} size={20} color={COLORS.text} />
                      </View>
                      <ThemedText style={styles.cardTitleLocked}>{discipline.label}</ThemedText>
                      <View style={styles.badge}>
                        <ThemedText style={styles.badgeText}>Bientôt disponible</ThemedText>
                      </View>
                    </View>
                  </Animated.View>
                );
              }

              return (
                <Animated.View
                  key={discipline.id}
                  entering={FadeInDown.delay(index * 60).springify().damping(16)}
                  style={styles.gridItem}>
                  <Link href={{ pathname: '/subject/[disciplineId]', params: { disciplineId: discipline.id } }} asChild>
                    <BouncyPressable style={styles.card}>
                      <LinearGradient
                        colors={discipline.gradient}
                        start={{ x: 0, y: 0 }}
                        end={{ x: 1, y: 1 }}
                        style={styles.iconBadge}>
                        <IconSymbol name={discipline.icon} size={20} color={COLORS.accentText} />
                      </LinearGradient>
                      <ThemedText style={styles.cardTitle}>{discipline.label}</ThemedText>
                    </BouncyPressable>
                  </Link>
                </Animated.View>
              );
            })}
          </View>

          <Link href="/ai-chat" asChild>
            <BouncyPressable style={styles.aiCardWrapper}>
              <LinearGradient
                colors={GRADIENTS.cosmic}
                start={{ x: 0, y: 0 }}
                end={{ x: 1, y: 1 }}
                style={styles.aiCard}>
                <IconSymbol name="sparkles" size={24} color={COLORS.accentText} />
                <View style={styles.focusCardText}>
                  <ThemedText style={styles.focusCardTitle}>Discuter avec l&apos;IA</ThemedText>
                  <ThemedText style={styles.focusCardSubtitle}>
                    Pose une question, corrige un devoir, prépare-toi pour un contrôle
                  </ThemedText>
                </View>
              </LinearGradient>
            </BouncyPressable>
          </Link>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
