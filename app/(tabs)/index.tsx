import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { RocketIcon } from '@/components/rocket-icon';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { ErrorState } from '@/components/ui/error-state';
import { Halo } from '@/components/ui/halo';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton, SkeletonCard } from '@/components/ui/skeleton';
import { DISCIPLINES, getDisciplineIdsFor } from '@/constants/disciplines';
import { GRADIENTS, HALO_COLORS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useFocusSession } from '@/context/focus-session';
import { useNextUpCourse } from '@/hooks/queries/use-next-up';
import { useProfile } from '@/hooks/queries/use-profile';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { getDisplayName } from '@/lib/profile';

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
  // screen can even mount. Each widget degrades independently: a failed
  // streak or next-up fetch doesn't blank the rest of the screen.
  const profileQuery = useProfile();
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
    sectionTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      marginTop: SPACING.section,
      marginBottom: SPACING.element,
    },
    subjectGrid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'space-between',
    },
    subjectGridItem: {
      width: '48%',
      marginBottom: SPACING.tight,
    },
    subjectCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      // Fixed height so every card lines up regardless of label length —
      // without this, a two-line label (e.g. "Histoire-Géographie") makes
      // its card taller than its single-line neighbors.
      minHeight: 132,
      justifyContent: 'center',
      ...cardBorder(COLORS),
    },
    subjectIconBadge: {
      width: 40,
      height: 40,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
      backgroundColor: COLORS.accent,
    },
    subjectIconBadgeLocked: {
      backgroundColor: COLORS.lockedBackground,
    },
    subjectCardTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    subjectCardLocked: {
      backgroundColor: COLORS.lockedBackground,
      borderColor: COLORS.borderStrong,
    },
    subjectCardTitleLocked: {
      ...TYPOGRAPHY.body,
      fontWeight: '600',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    subjectBadge: {
      alignSelf: 'flex-start',
      backgroundColor: COLORS.surface,
      borderRadius: 999,
      paddingVertical: 4,
      paddingHorizontal: 10,
      borderWidth: 1,
      borderColor: COLORS.borderStrong,
    },
    subjectBadgeText: {
      fontSize: 11,
      fontWeight: '700',
      color: COLORS.text,
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

  const nextUp = nextUpQuery.data;
  const firstName = getDisplayName(user);
  const profile = profileQuery.data;
  const disciplineIdsForGrade = profile?.grade ? getDisciplineIdsFor(profile.grade, profile.serie) : [];
  const visibleDisciplines = DISCIPLINES.filter(
    (discipline) =>
      disciplineIdsForGrade.includes(discipline.id) &&
      ((discipline.id !== 'espagnol' && discipline.id !== 'allemand') || discipline.id === profile?.lv2),
  );

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

            <ThemedText style={styles.sectionTitle}>Mes matières</ThemedText>
            <View style={styles.subjectGrid}>
              {visibleDisciplines.map((discipline) => {
                if (!discipline.available) {
                  return (
                    <View key={discipline.id} style={styles.subjectGridItem}>
                      <View style={[styles.subjectCard, styles.subjectCardLocked]}>
                        <View style={[styles.subjectIconBadge, styles.subjectIconBadgeLocked]}>
                          <IconSymbol name={discipline.icon} size={20} color={COLORS.text} />
                        </View>
                        <ThemedText style={styles.subjectCardTitleLocked} numberOfLines={2}>
                          {discipline.label}
                        </ThemedText>
                        <View style={styles.subjectBadge}>
                          <ThemedText style={styles.subjectBadgeText}>Bientôt disponible</ThemedText>
                        </View>
                      </View>
                    </View>
                  );
                }

                return (
                  <View key={discipline.id} style={styles.subjectGridItem}>
                    <Link href={{ pathname: '/subject/[disciplineId]', params: { disciplineId: discipline.id } }} asChild>
                      <BouncyPressable style={styles.subjectCard}>
                        <LinearGradient
                          colors={discipline.gradient}
                          start={{ x: 0, y: 0 }}
                          end={{ x: 1, y: 1 }}
                          style={styles.subjectIconBadge}>
                          <IconSymbol name={discipline.icon} size={20} color={COLORS.accentText} />
                        </LinearGradient>
                        <ThemedText style={styles.subjectCardTitle} numberOfLines={2}>
                          {discipline.label}
                        </ThemedText>
                      </BouncyPressable>
                    </Link>
                  </View>
                );
              })}
            </View>
          </Animated.View>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
