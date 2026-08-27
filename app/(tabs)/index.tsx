import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { useEffect } from 'react';
import { Image, ScrollView, StyleSheet, useColorScheme, View } from 'react-native';
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
import { ELEVATION, GRADIENTS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useFocusSession } from '@/context/focus-session';
import { useProgress } from '@/context/progress';
import { useTour, useTourTarget } from '@/context/tour';
import { useCoursesForGrade } from '@/hooks/queries/use-courses';
import { useProfile } from '@/hooks/queries/use-profile';
import { useStreak } from '@/hooks/queries/use-streak';
import { useWeeklyLessonsCompleted } from '@/hooks/queries/use-weekly-lessons';
import { useWeeklyQuizChallenge } from '@/hooks/queries/use-xp';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary } from '@/lib/courses';
import { WEEKLY_LESSONS_TARGET } from '@/lib/objectives';
import { getDisplayName } from '@/lib/profile';
import { consumeTourPending } from '@/lib/tour';
import { WEEKLY_QUIZ_BONUS_XP } from '@/lib/xp';

const ROCKET_3D = require('@/assets/images/3d/rocket.png');
const CHAT_BUBBLES_3D = require('@/assets/images/3d/chat-bubbles.png');
const TROPHY_3D = require('@/assets/images/3d/trophy.png');
const TARGET_3D = require('@/assets/images/3d/target.png');
const BRAIN_3D = require('@/assets/images/3d/brain.png');

// Real weekly-challenge target crossed the mockup's exact "6/10" fixture
// value into a hardcoded display number — explicitly requested even after
// being told it wouldn't move with real activity. The underlying XP award
// (lib/xp.ts / hooks/queries/use-xp.ts) is unaffected: it still only pays
// out once a genuine 10 quizzes are completed, this only touches the
// number rendered in this one place.
const CHALLENGE_DISPLAY_COUNT = 6;

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

// Real completion for this discipline: courses for the student's grade that
// belong to it, vs. how many are in completedCourseIds — null (rendered as
// no count/bar at all) when the discipline has no courses yet for this
// grade, since a card with no assigned work isn't the same as 0% done.
function disciplineProgress(
  discipline: Discipline,
  courses: CourseSummary[],
  completedIds: string[],
): { total: number; completed: number; percent: number } | null {
  const subjectCourses = courses.filter((course) => discipline.subjects.includes(course.subject));
  if (subjectCourses.length === 0) {
    return null;
  }
  const completed = subjectCourses.filter((course) => completedIds.includes(course.id)).length;
  return { total: subjectCourses.length, completed, percent: Math.round((completed / subjectCourses.length) * 100) };
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
  // streak or weekly-progress fetch doesn't blank the rest of the screen.
  const profileQuery = useProfile();
  const streakQuery = useStreak();
  const weeklyLessonsQuery = useWeeklyLessonsCompleted();
  const quizChallenge = useWeeklyQuizChallenge();
  const coursesQuery = useCoursesForGrade();
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
    headerText: {
      flex: 1,
    },
    hey: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    greeting: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
    },
    greetingAccent: {
      color: COLORS.accent,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginTop: SPACING.tight,
      marginBottom: SPACING.section,
    },
    avatarWrap: {
      width: 52,
      height: 52,
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
    streakBadge: {
      position: 'absolute',
      bottom: -8,
      right: -10,
      flexDirection: 'row',
      alignItems: 'center',
      gap: 3,
      backgroundColor: COLORS.surface,
      borderRadius: 999,
      paddingVertical: 3,
      paddingHorizontal: 7,
      ...cardBorder(COLORS),
    },
    streakBadgeEmoji: {
      fontSize: 12,
    },
    streakBadgeText: {
      fontSize: 12,
      fontWeight: '800',
      color: COLORS.accent,
    },
    todayCard: {
      flexDirection: 'row',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.section,
      ...cardBorder(COLORS),
    },
    todayCol: {
      flex: 1,
    },
    todayDivider: {
      width: StyleSheet.hairlineWidth,
      backgroundColor: COLORS.border,
      marginHorizontal: SPACING.element,
    },
    todayIconBadge: {
      width: 36,
      height: 36,
      borderRadius: 12,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
    },
    todayIconImage: {
      width: 26,
      height: 26,
    },
    todayLabel: {
      fontSize: 12,
      fontWeight: '700',
      color: COLORS.mutedText,
      marginBottom: 2,
    },
    todayValue: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    progressTrack: {
      height: 6,
      borderRadius: 3,
      backgroundColor: COLORS.lockedBackground,
      overflow: 'hidden',
    },
    progressFill: {
      height: '100%',
      borderRadius: 3,
      backgroundColor: COLORS.accent,
    },
    progressCaption: {
      fontSize: 11,
      color: COLORS.mutedText,
      marginTop: 4,
      textAlign: 'right',
    },
    streakRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 4,
    },
    streakEmoji: {
      fontSize: 14,
    },
    streakValue: {
      fontSize: 22,
      fontWeight: '800',
      color: COLORS.accent,
    },
    streakCaption: {
      fontSize: 12,
      color: COLORS.mutedText,
      marginTop: 2,
    },
    actionRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      marginBottom: SPACING.section,
    },
    actionCardWrapper: {
      flex: 1,
      borderRadius: RADIUS,
      ...ELEVATION.sm,
    },
    actionCard: {
      flex: 1,
      justifyContent: 'space-between',
      borderRadius: RADIUS,
      padding: SPACING.element,
      minHeight: 180,
    },
    actionCardDecoration: {
      position: 'absolute',
      right: -8,
      bottom: -6,
      width: 58,
      height: 58,
    },
    actionPillButton: {
      alignSelf: 'flex-start',
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      backgroundColor: 'rgba(255,255,255,0.9)',
      borderRadius: 25,
      paddingVertical: 8,
      paddingHorizontal: 16,
      marginTop: SPACING.tight,
    },
    actionPillButtonText: {
      fontSize: 13,
      fontWeight: '700',
      color: COLORS.text,
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
      paddingRight: 24,
    },
    actionCardSubtitle: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
    },
    sectionTitleRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginBottom: SPACING.element,
    },
    sectionTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    subjectGrid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'space-between',
      rowGap: SPACING.tight,
      marginBottom: SPACING.section,
    },
    subjectGridItem: {
      width: '31%',
    },
    subjectCardWrapper: {
      borderRadius: 18,
      ...ELEVATION.sm,
    },
    subjectCard: {
      borderRadius: 18,
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
      marginBottom: 4,
    },
    subjectLessonCount: {
      fontSize: 11,
      color: COLORS.text,
      opacity: 0.75,
      marginBottom: 8,
    },
    challengeCard: {
      flexDirection: 'row',
      alignItems: 'center',
      backgroundColor: COLORS.accentSoft,
      borderRadius: RADIUS,
      padding: SPACING.element,
      gap: SPACING.element,
      marginBottom: SPACING.section,
      ...ELEVATION.sm,
    },
    challengeIconBadge: {
      width: 52,
      height: 52,
      borderRadius: 16,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
    },
    challengeIconImage: {
      width: 40,
      height: 40,
    },
    recommendedCard: {
      flexDirection: 'row',
      alignItems: 'center',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      gap: SPACING.element,
      ...cardBorder(COLORS),
      ...ELEVATION.sm,
    },
    recommendedIconBadge: {
      width: 44,
      height: 44,
      borderRadius: 14,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    recommendedIconImage: {
      width: 32,
      height: 32,
    },
    recommendedBody: {
      flex: 1,
    },
    recommendedTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    recommendedSubtitle: {
      fontSize: 12,
      color: COLORS.mutedText,
      marginTop: 2,
    },
    recommendedPlayButton: {
      width: 40,
      height: 40,
      borderRadius: 20,
      backgroundColor: COLORS.accent,
      alignItems: 'center',
      justifyContent: 'center',
    },
    challengeBody: {
      flex: 1,
    },
    challengeTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.accent,
      marginBottom: 2,
    },
    challengeText: {
      fontSize: 13,
      lineHeight: 18,
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    challengeCaption: {
      fontSize: 11,
      color: COLORS.mutedText,
      marginTop: 4,
    },
    challengeButton: {
      borderRadius: 999,
      borderWidth: 1.5,
      borderColor: COLORS.accent,
      paddingVertical: 8,
      paddingHorizontal: 14,
    },
    challengeButtonText: {
      color: COLORS.accent,
      fontWeight: '700',
      fontSize: 13,
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

  const firstName = getDisplayName(user);
  const avatarInitial = firstName.charAt(0).toUpperCase();
  const profile = profileQuery.data;
  const disciplineIdsForGrade = profile?.grade ? getDisciplineIdsFor(profile.grade, profile.serie) : [];
  const visibleDisciplines = DISCIPLINES.filter(
    (discipline) =>
      disciplineIdsForGrade.includes(discipline.id) &&
      ((discipline.id !== 'espagnol' && discipline.id !== 'allemand') || discipline.id === profile?.lv2),
  );

  const streak = streakQuery.data?.streak ?? 0;
  const lessonsThisWeek = Math.min(weeklyLessonsQuery.data ?? 0, WEEKLY_LESSONS_TARGET);
  const lessonsProgress = WEEKLY_LESSONS_TARGET > 0 ? lessonsThisWeek / WEEKLY_LESSONS_TARGET : 0;
  const quizProgress = quizChallenge.target > 0 ? CHALLENGE_DISPLAY_COUNT / quizChallenge.target : 0;

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
              <View ref={greetingTarget.ref} onLayout={greetingTarget.onLayout} style={styles.headerText}>
                <ThemedText style={styles.hey}>Hey {firstName} 👋</ThemedText>
                <ThemedText style={styles.greeting}>Prêt à devenir</ThemedText>
                <ThemedText style={[styles.greeting, styles.greetingAccent]}>ta meilleure version ?</ThemedText>
              </View>
              <View style={styles.avatarWrap}>
                <View style={styles.avatar}>
                  <ThemedText style={styles.avatarText}>{avatarInitial}</ThemedText>
                </View>
                <View style={styles.streakBadge}>
                  <ThemedText style={styles.streakBadgeEmoji}>🔥</ThemedText>
                  <ThemedText style={styles.streakBadgeText}>{streak}</ThemedText>
                </View>
              </View>
            </View>
            <ThemedText style={styles.subtitle}>Chaque jour compte. Chaque révision te rapproche de tes objectifs.</ThemedText>

            <View style={styles.todayCard}>
              <View style={styles.todayCol}>
                <View style={styles.todayIconBadge}>
                  <Image source={TARGET_3D} style={styles.todayIconImage} resizeMode="contain" />
                </View>
                <ThemedText style={styles.todayLabel}>Objectif de la semaine</ThemedText>
                <ThemedText style={styles.todayValue}>Terminer {WEEKLY_LESSONS_TARGET} leçons</ThemedText>
                <View style={styles.progressTrack}>
                  <View style={[styles.progressFill, { width: `${Math.round(lessonsProgress * 100)}%` }]} />
                </View>
                <ThemedText style={styles.progressCaption}>
                  {lessonsThisWeek}/{WEEKLY_LESSONS_TARGET}
                </ThemedText>
              </View>

              <View style={styles.todayDivider} />

              <View style={styles.todayCol}>
                <View style={styles.streakRow}>
                  <ThemedText style={styles.streakEmoji}>🔥</ThemedText>
                  <ThemedText style={styles.todayLabel}>Série actuelle</ThemedText>
                </View>
                <ThemedText style={styles.streakValue}>{streak} jours</ThemedText>
                <ThemedText style={styles.streakCaption}>Continue comme ça !</ThemedText>
              </View>
            </View>

            <View style={styles.actionRow}>
              <View ref={focusTarget.ref} onLayout={focusTarget.onLayout} style={styles.actionCardWrapper}>
                <Link href="/focus-session" asChild>
                  <BouncyPressable>
                    <LinearGradient
                      colors={GRADIENTS.hero}
                      start={{ x: 0, y: 0 }}
                      end={{ x: 1, y: 1 }}
                      style={[styles.actionCard, { backgroundColor: GRADIENTS.hero[0] }]}>
                      <View>
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
                      </View>
                      <Image source={ROCKET_3D} style={styles.actionCardDecoration} resizeMode="contain" />
                      <View style={styles.actionPillButton}>
                        <ThemedText style={styles.actionPillButtonText}>Commencer</ThemedText>
                        <IconSymbol name="chevron.right" size={13} color={COLORS.text} />
                      </View>
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
                      <View>
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
                      </View>
                      <Image source={CHAT_BUBBLES_3D} style={styles.actionCardDecoration} resizeMode="contain" />
                      <View style={styles.actionPillButton}>
                        <ThemedText style={styles.actionPillButtonText}>Commencer</ThemedText>
                        <Ionicons name="chatbubble-ellipses" size={13} color={COLORS.text} />
                      </View>
                    </LinearGradient>
                  </BouncyPressable>
                </Link>
              </View>
            </View>

            <PremiumNudgeBanner />

            <View ref={subjectsTarget.ref} onLayout={subjectsTarget.onLayout} style={styles.sectionTitleRow}>
              <IconSymbol name="book.fill" size={20} color={COLORS.text} />
              <ThemedText style={styles.sectionTitle}>Mes matières</ThemedText>
            </View>
            <View style={styles.subjectGrid}>
              {visibleDisciplines.map((discipline) => {
                const progress = disciplineProgress(discipline, coursesQuery.data ?? [], completedCourseIds);

                return (
                  <View key={discipline.id} style={styles.subjectGridItem}>
                    <Link href={{ pathname: '/subject/[disciplineId]', params: { disciplineId: discipline.id } }} asChild>
                      <BouncyPressable style={styles.subjectCardWrapper}>
                        <LinearGradient
                          colors={discipline.cardGradient}
                          start={{ x: 0, y: 0 }}
                          end={{ x: 1, y: 1 }}
                          style={[styles.subjectCard, { backgroundColor: discipline.cardGradient[0] }]}>
                          <View>
                            <LinearGradient
                              colors={discipline.badgeGradient}
                              style={[styles.subjectIconBadge, { backgroundColor: discipline.badgeGradient[0] }]}>
                              <IconSymbol name={discipline.icon} size={22} color="#FFFFFF" />
                            </LinearGradient>
                            <ThemedText
                              style={styles.subjectCardTitle}
                              numberOfLines={2}
                              adjustsFontSizeToFit
                              minimumFontScale={0.85}>
                              {discipline.label}
                            </ThemedText>
                            {progress ? (
                              <ThemedText style={styles.subjectLessonCount}>{progress.total} leçons</ThemedText>
                            ) : null}
                          </View>
                        </LinearGradient>
                      </BouncyPressable>
                    </Link>
                  </View>
                );
              })}
            </View>

            <View style={styles.challengeCard}>
              <View style={styles.challengeIconBadge}>
                <Image source={TROPHY_3D} style={styles.challengeIconImage} resizeMode="contain" />
              </View>
              <View style={styles.challengeBody}>
                <ThemedText style={styles.challengeTitle}>Défi de la semaine</ThemedText>
                <ThemedText style={styles.challengeText}>
                  Réussis {quizChallenge.target} quiz cette semaine et gagne {WEEKLY_QUIZ_BONUS_XP} XP bonus !
                </ThemedText>
                <View style={styles.progressTrack}>
                  <View style={[styles.progressFill, { width: `${Math.round(quizProgress * 100)}%` }]} />
                </View>
                <ThemedText style={styles.challengeCaption}>
                  {CHALLENGE_DISPLAY_COUNT}/{quizChallenge.target}
                </ThemedText>
              </View>
              <Link href="/prepare-homework" asChild>
                <BouncyPressable style={styles.challengeButton}>
                  <ThemedText style={styles.challengeButtonText}>Voir mon défi</ThemedText>
                </BouncyPressable>
              </Link>
            </View>

            <View style={styles.sectionTitleRow}>
              <IconSymbol name="sparkles" size={20} color={COLORS.text} />
              <ThemedText style={styles.sectionTitle}>Recommandé pour toi</ThemedText>
            </View>
            <Link href="/flashcards" asChild>
              <BouncyPressable style={styles.recommendedCard}>
                <View style={styles.recommendedIconBadge}>
                  <Image source={BRAIN_3D} style={styles.recommendedIconImage} resizeMode="contain" />
                </View>
                <View style={styles.recommendedBody}>
                  <ThemedText style={styles.recommendedTitle}>Réviser intelligemment</ThemedText>
                  <ThemedText style={styles.recommendedSubtitle}>5 min de lecture</ThemedText>
                </View>
                <View style={styles.recommendedPlayButton}>
                  <Ionicons name="play" size={16} color={COLORS.accentText} />
                </View>
              </BouncyPressable>
            </Link>
          </Animated.View>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
