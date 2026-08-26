import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { useEffect } from 'react';
import { ScrollView, StyleSheet, useColorScheme, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';
import Svg, { Defs, LinearGradient as SvgLinearGradient, Path, Stop } from 'react-native-svg';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { PremiumNudgeBanner } from '@/components/premium-nudge-banner';
import { RocketIcon } from '@/components/rocket-icon';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { ErrorState } from '@/components/ui/error-state';
import { Halo } from '@/components/ui/halo';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton, SkeletonCard } from '@/components/ui/skeleton';
import { DISCIPLINES, Discipline, getDisciplineIdsFor } from '@/constants/disciplines';
import { GRADIENTS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useFocusSession } from '@/context/focus-session';
import { useProgress } from '@/context/progress';
import { useTour, useTourTarget } from '@/context/tour';
import { useCoursesForGrade } from '@/hooks/queries/use-courses';
import { useNextUpCourse } from '@/hooks/queries/use-next-up';
import { useProfile } from '@/hooks/queries/use-profile';
import { useStreak } from '@/hooks/queries/use-streak';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary } from '@/lib/courses';
import { getDisplayName } from '@/lib/profile';
import { consumeTourPending } from '@/lib/tour';

// Dark forest-green — the header avatar's own fixed color, not theme-driven
// (it's a brand mark, like the subject badges, not text-on-background).
const AVATAR_COLOR = '#1F5C4F';

function formatTime(totalSeconds: number): string {
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;
  return `${minutes}:${seconds.toString().padStart(2, '0')}`;
}

// Decorative pink wash behind the greeting only — an S-curve cuts it off
// right below the subtitle, so the rest of the page (action cards, subject
// grid, stats) sits on the plain flat background rather than a gradient
// that bleeds down the whole screen.
const HEADER_WAVE_HEIGHT = 300;

function HomeHeaderWave() {
  return (
    <Svg
      width="100%"
      height={HEADER_WAVE_HEIGHT}
      viewBox="0 0 400 300"
      preserveAspectRatio="none"
      style={StyleSheet.absoluteFillObject}>
      <Defs>
        <SvgLinearGradient id="homeWaveGrad" x1="1" y1="0" x2="0.1" y2="1">
          <Stop offset="0" stopColor="#F7DCEA" />
          <Stop offset="1" stopColor="#F4EBFA" />
        </SvgLinearGradient>
      </Defs>
      <Path d="M0,190 C130,255 260,95 400,35 L400,0 L0,0 Z" fill="url(#homeWaveGrad)" />
    </Svg>
  );
}

// Percentage of this discipline's courses (for the student's grade) marked
// completed — null when the discipline has no courses yet for this grade,
// which renders as "—" instead of "0 %" (a card with no assigned work isn't
// the same as a card the student hasn't started).
function disciplineProgress(discipline: Discipline, courses: CourseSummary[], completedIds: string[]): number | null {
  const subjectCourses = courses.filter((course) => discipline.subjects.includes(course.subject));
  if (subjectCourses.length === 0) {
    return null;
  }
  const completedCount = subjectCourses.filter((course) => completedIds.includes(course.id)).length;
  return Math.round((completedCount / subjectCourses.length) * 100);
}

export default function HomeScreen() {
  const COLORS = useThemeColors();
  const isLight = useColorScheme() !== 'dark';
  const { user } = useAuth();
  const { phase: focusPhase, remainingSeconds } = useFocusSession();
  const tabBarHeight = useBottomTabBarHeight();

  // No gating/redirect logic here anymore — Stack.Protected in app/_layout.tsx
  // guarantees session+grade+lv2+placement are all satisfied before this
  // screen can even mount. Each widget degrades independently: a failed
  // streak or next-up fetch doesn't blank the rest of the screen.
  const profileQuery = useProfile();
  const nextUpQuery = useNextUpCourse();
  const coursesQuery = useCoursesForGrade();
  const streakQuery = useStreak();
  const { completedCourseIds } = useProgress();
  const tour = useTour();
  const greetingTarget = useTourTarget('home-greeting');
  const focusTarget = useTourTarget('home-focus-session');
  const aiTarget = useTourTarget('home-ai-chat');
  const subjectsTarget = useTourTarget('home-subjects');

  // Starts the guided tour exactly once, right after a brand-new account
  // finishes onboarding — see select-language.tsx (sets the flag) and
  // lib/tour.ts (consumeTourPending clears it in the same call, so a
  // remount here can't start it twice).
  useEffect(() => {
    consumeTourPending().then((shouldStart) => {
      if (shouldStart) {
        tour.start();
      }
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
    },
    waveWrap: {
      position: 'absolute',
      top: 0,
      left: 0,
      right: 0,
      height: HEADER_WAVE_HEIGHT,
    },
    haloWrap: {
      position: 'absolute',
      top: -60,
      right: -80,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'flex-start',
      justifyContent: 'space-between',
      marginBottom: SPACING.tight,
    },
    greeting: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginTop: SPACING.tight,
      marginBottom: SPACING.section,
    },
    avatar: {
      width: 52,
      height: 52,
      borderRadius: 26,
      backgroundColor: AVATAR_COLOR,
      alignItems: 'center',
      justifyContent: 'center',
    },
    avatarText: {
      color: '#FFFFFF',
      fontSize: 18,
      fontWeight: '700',
    },
    actionRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      marginBottom: SPACING.section,
    },
    actionCardWrapper: {
      flex: 1,
      borderRadius: RADIUS,
      overflow: 'hidden',
    },
    actionCard: {
      padding: SPACING.element,
      minHeight: 180,
    },
    actionIconBadge: {
      width: 48,
      height: 48,
      borderRadius: 16,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.element,
    },
    actionCardTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      marginBottom: 6,
    },
    actionCardSubtitleRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 4,
    },
    actionCardSubtitle: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
    },
    sectionHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    sectionTitleRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
    },
    sectionTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    seeAllPill: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 2,
      backgroundColor: COLORS.surface,
      borderRadius: PILL_RADIUS,
      borderWidth: 1,
      borderColor: '#C7D6F5',
      paddingVertical: 8,
      paddingHorizontal: 14,
    },
    seeAllText: {
      color: '#3B82F6',
      fontSize: 13,
      fontWeight: '700',
    },
    subjectGrid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'space-between',
      rowGap: SPACING.tight,
    },
    subjectGridItem: {
      width: '31%',
    },
    subjectCardWrapper: {
      borderRadius: 18,
      overflow: 'hidden',
    },
    subjectCard: {
      padding: 12,
      minHeight: 142,
      justifyContent: 'space-between',
    },
    subjectIconBadge: {
      width: 44,
      height: 44,
      borderRadius: 14,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: 10,
    },
    subjectCardTitle: {
      fontSize: 13,
      lineHeight: 16,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 8,
    },
    subjectBadge: {
      alignSelf: 'flex-start',
      backgroundColor: COLORS.surface,
      borderRadius: 999,
      paddingVertical: 4,
      paddingHorizontal: 9,
      borderWidth: 1,
      borderColor: COLORS.borderStrong,
    },
    subjectBadgeText: {
      fontSize: 10,
      fontWeight: '700',
      color: COLORS.text,
    },
    statsBar: {
      flexDirection: 'row',
      backgroundColor: '#EDE9FA',
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginTop: SPACING.section,
      alignItems: 'center',
    },
    statItem: {
      flex: 1,
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
    },
    statDivider: {
      width: StyleSheet.hairlineWidth,
      alignSelf: 'stretch',
      backgroundColor: '#D6D0EE',
      marginHorizontal: SPACING.tight,
    },
    statEmoji: {
      fontSize: 26,
    },
    statNumber: {
      fontSize: 18,
      fontWeight: '700',
      color: COLORS.text,
    },
    statLabel: {
      fontSize: 12,
      color: COLORS.mutedText,
      lineHeight: 15,
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
  const avatarInitial = firstName.charAt(0).toUpperCase();
  const profile = profileQuery.data;
  const disciplineIdsForGrade = profile?.grade ? getDisciplineIdsFor(profile.grade, profile.serie) : [];
  const visibleDisciplines = DISCIPLINES.filter(
    (discipline) =>
      disciplineIdsForGrade.includes(discipline.id) &&
      ((discipline.id !== 'espagnol' && discipline.id !== 'allemand') || discipline.id === profile?.lv2),
  );

  const courses = coursesQuery.data ?? [];
  const discCompletionRates = visibleDisciplines.map((discipline) => disciplineProgress(discipline, courses, completedCourseIds));
  const inProgressCount = discCompletionRates.filter((rate) => rate !== null && rate > 0 && rate < 100).length;

  return (
    <ScreenBackground color={isLight ? undefined : COLORS.background}>
      {isLight ? (
        <View style={styles.waveWrap} pointerEvents="none">
          <HomeHeaderWave />
        </View>
      ) : null}
      <View style={styles.haloWrap} pointerEvents="none">
        <Halo color="#F6C6E0" size={280} opacity={0.35} />
      </View>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <Animated.View entering={FadeIn.duration(450)}>
            <View style={styles.header}>
              <View ref={greetingTarget.ref} onLayout={greetingTarget.onLayout} style={{ flex: 1 }}>
                <ThemedText style={styles.greeting}>Hey 👋</ThemedText>
                <ThemedText style={styles.greeting}>On révise, {firstName} !</ThemedText>
              </View>
              <View style={styles.avatar}>
                <ThemedText style={styles.avatarText}>{avatarInitial}</ThemedText>
              </View>
            </View>
            <ThemedText style={styles.subtitle}>Un peu chaque jour, un grand pas demain.</ThemedText>

            <View style={styles.actionRow}>
              {nextUp ? (
                <Link href={{ pathname: '/course/[id]', params: { id: nextUp.courseId } }} asChild>
                  <BouncyPressable style={styles.actionCardWrapper}>
                    <LinearGradient
                      colors={GRADIENTS.mint}
                      start={{ x: 0, y: 0 }}
                      end={{ x: 1, y: 1 }}
                      style={[styles.actionCard, { backgroundColor: GRADIENTS.mint[0] }]}>
                      <LinearGradient colors={GRADIENTS.badgeMint} style={[styles.actionIconBadge, { backgroundColor: GRADIENTS.badgeMint[0] }]}>
                        <Ionicons name="flash" size={22} color="#FFFFFF" />
                      </LinearGradient>
                      <ThemedText style={[styles.actionCardTitle, { color: '#0F5C46' }]}>Reprise rapide</ThemedText>
                      <View style={styles.actionCardSubtitleRow}>
                        <ThemedText style={styles.actionCardSubtitle} numberOfLines={2}>
                          {nextUp.courseTitle}
                        </ThemedText>
                        <IconSymbol name="chevron.right" size={14} color={COLORS.mutedText} />
                      </View>
                    </LinearGradient>
                  </BouncyPressable>
                </Link>
              ) : null}

              <View ref={focusTarget.ref} onLayout={focusTarget.onLayout} style={styles.actionCardWrapper}>
                <Link href="/focus-session" asChild>
                  <BouncyPressable>
                    <LinearGradient
                      colors={GRADIENTS.hero}
                      start={{ x: 0, y: 0 }}
                      end={{ x: 1, y: 1 }}
                      style={[styles.actionCard, { backgroundColor: GRADIENTS.hero[0] }]}>
                      <LinearGradient colors={GRADIENTS.badgeViolet} style={[styles.actionIconBadge, { backgroundColor: GRADIENTS.badgeViolet[0] }]}>
                        <RocketIcon size={22} floating />
                      </LinearGradient>
                      <ThemedText style={[styles.actionCardTitle, { color: '#5B3FA8' }]}>Session focus</ThemedText>
                      <ThemedText style={styles.actionCardSubtitle}>
                        {focusPhase === 'running' ? `${formatTime(remainingSeconds)}` : '20 min'}
                      </ThemedText>
                      <ThemedText style={styles.actionCardSubtitle}>
                        {focusPhase === 'running' ? 'La fusée vole 🚀' : 'Concentration intense 🚀'}
                      </ThemedText>
                    </LinearGradient>
                  </BouncyPressable>
                </Link>
              </View>

              <View ref={aiTarget.ref} onLayout={aiTarget.onLayout} style={styles.actionCardWrapper}>
                <Link href="/ai-chat" asChild>
                  <BouncyPressable>
                    <LinearGradient
                      colors={GRADIENTS.cosmic}
                      start={{ x: 0, y: 0 }}
                      end={{ x: 1, y: 1 }}
                      style={[styles.actionCard, { backgroundColor: GRADIENTS.cosmic[0] }]}>
                      <LinearGradient colors={GRADIENTS.badgeAzure} style={[styles.actionIconBadge, { backgroundColor: GRADIENTS.badgeAzure[0] }]}>
                        <Ionicons name="chatbubble-ellipses" size={22} color="#FFFFFF" />
                      </LinearGradient>
                      <ThemedText style={[styles.actionCardTitle, { color: COLORS.text }]}>Discuter avec IA</ThemedText>
                      <View style={styles.actionCardSubtitleRow}>
                        <ThemedText style={styles.actionCardSubtitle} numberOfLines={2}>
                          Pose une question, progresse plus vite
                        </ThemedText>
                        <IconSymbol name="chevron.right" size={14} color={COLORS.mutedText} />
                      </View>
                    </LinearGradient>
                  </BouncyPressable>
                </Link>
              </View>
            </View>

            <PremiumNudgeBanner />

            <View ref={subjectsTarget.ref} onLayout={subjectsTarget.onLayout} style={styles.sectionHeader}>
              <View style={styles.sectionTitleRow}>
                <IconSymbol name="book.fill" size={20} color={COLORS.text} />
                <ThemedText style={styles.sectionTitle}>Mes matières</ThemedText>
              </View>
              <View style={styles.seeAllPill}>
                <ThemedText style={styles.seeAllText}>Voir tout</ThemedText>
                <Ionicons name="chevron-forward" size={14} color="#3B82F6" />
              </View>
            </View>
            <View style={styles.subjectGrid}>
              {visibleDisciplines.map((discipline) => {
                if (!discipline.available) {
                  return (
                    <View key={discipline.id} style={styles.subjectGridItem}>
                      <View style={[styles.subjectCardWrapper, { backgroundColor: COLORS.lockedBackground }]}>
                        <View style={styles.subjectCard}>
                          <View style={[styles.subjectIconBadge, { backgroundColor: COLORS.locked }]}>
                            <IconSymbol name={discipline.icon} size={22} color={COLORS.text} />
                          </View>
                          <ThemedText style={styles.subjectCardTitle} numberOfLines={2}>
                            {discipline.label}
                          </ThemedText>
                          <View style={styles.subjectBadge}>
                            <ThemedText style={styles.subjectBadgeText} numberOfLines={1}>
                              Bientôt disponible
                            </ThemedText>
                          </View>
                        </View>
                      </View>
                    </View>
                  );
                }

                return (
                  <View key={discipline.id} style={styles.subjectGridItem}>
                    <Link href={{ pathname: '/subject/[disciplineId]', params: { disciplineId: discipline.id } }} asChild>
                      <BouncyPressable style={styles.subjectCardWrapper}>
                        <LinearGradient
                          colors={discipline.cardGradient}
                          start={{ x: 0, y: 0 }}
                          end={{ x: 1, y: 1 }}
                          style={[styles.subjectCard, { backgroundColor: discipline.cardGradient[0] }]}>
                          <LinearGradient
                            colors={discipline.badgeGradient}
                            style={[styles.subjectIconBadge, { backgroundColor: discipline.badgeGradient[0] }]}>
                            <IconSymbol name={discipline.icon} size={22} color="#FFFFFF" />
                          </LinearGradient>
                          <ThemedText style={styles.subjectCardTitle} numberOfLines={2}>
                            {discipline.label}
                          </ThemedText>
                        </LinearGradient>
                      </BouncyPressable>
                    </Link>
                  </View>
                );
              })}
            </View>

            <View style={styles.statsBar}>
              <View style={styles.statItem}>
                <ThemedText style={styles.statEmoji}>🔥</ThemedText>
                <View>
                  <ThemedText style={styles.statNumber}>{streakQuery.data?.streak ?? 0}</ThemedText>
                  <ThemedText style={styles.statLabel}>Séries de{'\n'}jours</ThemedText>
                </View>
              </View>
              <View style={styles.statDivider} />
              <View style={styles.statItem}>
                <ThemedText style={styles.statEmoji}>🎯</ThemedText>
                <View>
                  <ThemedText style={styles.statNumber}>{inProgressCount}</ThemedText>
                  <ThemedText style={styles.statLabel}>Objectifs{'\n'}en cours</ThemedText>
                </View>
              </View>
            </View>
          </Animated.View>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
