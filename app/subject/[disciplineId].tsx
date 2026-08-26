import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Link, router, useLocalSearchParams } from 'expo-router';
import { useMemo, useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { LessonCoverBanner } from '@/components/lesson-cover-banner';
import { ScreenBackground } from '@/components/screen-background';
import { SubjectPlacementPrompt } from '@/components/subject-placement-prompt';
import { ThemedText } from '@/components/themed-text';
import { EmptyState } from '@/components/ui/empty-state';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { ProgressRing } from '@/components/ui/progress-ring';
import { SkeletonList } from '@/components/ui/skeleton';
import { SUBJECT_LABELS } from '@/constants/courses';
import { FEEDBACK_COLORS, PILL_RADIUS, RADIUS, SPACING, STATUS_COLORS, TYPOGRAPHY, Z_INDEX } from '@/constants/design';
import { DISCIPLINES, DisciplineId } from '@/constants/disciplines';
import { useProgress } from '@/context/progress';
import { useCoursesForGrade } from '@/hooks/queries/use-courses';
import { useCourseHistory } from '@/hooks/queries/use-course-history';
import { useFlashcardDecks } from '@/hooks/queries/use-flashcards';
import { usePlacementStatus } from '@/hooks/queries/use-placement';
import { useProfile } from '@/hooks/queries/use-profile';
import { useNextReviewDates } from '@/hooks/queries/use-spaced-repetition';
import { useStreak } from '@/hooks/queries/use-streak';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary } from '@/lib/courses';

const VISIBLE_COURSES_LIMIT = 5;

function subjectLabel(subject: string): string {
  return SUBJECT_LABELS[subject as keyof typeof SUBJECT_LABELS] ?? subject;
}

export default function SubjectScreen() {
  const COLORS = useThemeColors();
  const { disciplineId } = useLocalSearchParams<{ disciplineId: DisciplineId }>();
  const discipline = DISCIPLINES.find((d) => d.id === disciplineId);

  const { completedCourseIds, loading: progressLoading } = useProgress();
  const coursesQuery = useCoursesForGrade();
  const profileQuery = useProfile();
  const placementQuery = usePlacementStatus(disciplineId);
  const streakQuery = useStreak();
  const historyQuery = useCourseHistory();
  const decksQuery = useFlashcardDecks();
  const [lockedInfo, setLockedInfo] = useState<CourseSummary | null>(null);
  const [showAllCourses, setShowAllCourses] = useState(false);

  const courses = useMemo(() => coursesQuery.data ?? [], [coursesQuery.data]);
  const coursesForDiscipline = useMemo(
    () => (discipline ? courses.filter((course) => discipline.subjects.includes(course.subject)) : []),
    [courses, discipline],
  );
  const courseIds = coursesForDiscipline.map((course) => course.id);
  const reviewDatesQuery = useNextReviewDates(courseIds);
  const nextReviewDates = reviewDatesQuery.data ?? {};

  const historySection = historyQuery.data?.find((section) => section.discipline.id === disciplineId);
  const attemptedEntries = (historySection?.courses ?? []).filter((entry) => entry.total > 0);
  const totalDeckCards = (decksQuery.data ?? []).reduce((sum, deck) => sum + deck.cardCount, 0);

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      paddingBottom: 40,
    },
    header: {
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: 56,
      borderBottomLeftRadius: 32,
      borderBottomRightRadius: 32,
    },
    headerTopRow: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    headerButton: {
      width: 40,
      height: 40,
      borderRadius: 14,
      backgroundColor: 'rgba(255,255,255,0.2)',
      alignItems: 'center',
      justifyContent: 'center',
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    streakPill: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 4,
      backgroundColor: 'rgba(255,255,255,0.2)',
      borderRadius: PILL_RADIUS,
      paddingVertical: 8,
      paddingHorizontal: 12,
    },
    streakText: {
      color: '#FFFFFF',
      fontWeight: '700',
      fontSize: 14,
    },
    headerMain: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
    },
    headerIconBadge: {
      width: 52,
      height: 52,
      borderRadius: 18,
      backgroundColor: 'rgba(255,255,255,0.2)',
      alignItems: 'center',
      justifyContent: 'center',
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      fontSize: 22,
      color: '#FFFFFF',
    },
    headerSubtitle: {
      fontSize: 14,
      color: 'rgba(255,255,255,0.85)',
      marginTop: 2,
    },
    progressCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginHorizontal: SPACING.screen,
      marginTop: -40,
      marginBottom: SPACING.section,
      ...cardBorder(COLORS),
    },
    progressTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.element,
    },
    progressRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
    },
    ringBlock: {
      alignItems: 'center',
      width: 96,
    },
    ringOverlay: {
      position: 'absolute',
      alignItems: 'center',
    },
    ringPercent: {
      fontSize: 20,
      fontWeight: '800',
      color: COLORS.text,
    },
    ringLabel: {
      fontSize: 11,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginTop: 4,
    },
    statsGrid: {
      flex: 1,
      flexDirection: 'row',
      flexWrap: 'wrap',
    },
    statItem: {
      width: '50%',
      alignItems: 'center',
      paddingVertical: SPACING.tight,
    },
    statBadge: {
      width: 32,
      height: 32,
      borderRadius: 11,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: 4,
    },
    statNumber: {
      fontSize: 15,
      fontWeight: '800',
      color: COLORS.text,
    },
    statLabel: {
      fontSize: 10.5,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
    section: {
      paddingHorizontal: SPACING.screen,
      marginBottom: SPACING.section,
    },
    sectionHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.tight,
    },
    sectionTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    sectionSeeAll: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 2,
    },
    sectionSeeAllText: {
      fontSize: 13,
      fontWeight: '700',
      color: COLORS.accent,
    },
    subjectLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: SPACING.tight,
      marginTop: SPACING.tight,
    },
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    seeMoreButton: {
      flexDirection: 'row',
      alignSelf: 'center',
      alignItems: 'center',
      gap: 4,
      marginTop: SPACING.tight,
      paddingVertical: SPACING.tight,
      paddingHorizontal: SPACING.element,
    },
    seeMoreText: {
      fontSize: 13,
      fontWeight: '700',
      color: COLORS.accent,
    },
    continueCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.tight,
      ...cardBorder(COLORS),
    },
    continueRow: {
      flexDirection: 'row',
      gap: SPACING.element,
    },
    continueBody: {
      flex: 1,
      justifyContent: 'center',
    },
    continueBadge: {
      alignSelf: 'flex-start',
      backgroundColor: COLORS.accentSoft,
      borderRadius: PILL_RADIUS,
      paddingVertical: 3,
      paddingHorizontal: 10,
      marginBottom: 6,
    },
    continueBadgeText: {
      fontSize: 11,
      fontWeight: '700',
      color: COLORS.accent,
    },
    continueTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 8,
    },
    continueFooter: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginTop: 'auto',
    },
    continuePercent: {
      fontSize: 12,
      fontWeight: '700',
      color: COLORS.accent,
    },
    continueButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 8,
      paddingHorizontal: 16,
    },
    continueButtonText: {
      color: COLORS.accentText,
      fontSize: 13,
      fontWeight: '700',
    },
    resourceGrid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      gap: SPACING.tight,
    },
    resourceCard: {
      width: '47%',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    resourceCardDisabled: {
      opacity: 0.55,
    },
    resourceIcon: {
      width: 36,
      height: 36,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
    },
    resourceLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 2,
    },
    resourceCount: {
      fontSize: 12,
      color: COLORS.mutedText,
    },
    exerciseRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      paddingVertical: SPACING.tight,
    },
    exerciseIconBadge: {
      width: 36,
      height: 36,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
    },
    exerciseText: {
      flex: 1,
    },
    exerciseTitle: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    exercisePercent: {
      fontSize: 15,
      fontWeight: '700',
    },
    cardHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      gap: SPACING.tight,
    },
    cardTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      flexShrink: 1,
    },
    cardSubtitle: {
      ...TYPOGRAPHY.caption,
      color: COLORS.accent,
      fontWeight: '600',
      marginTop: 6,
    },
    cardLocked: {
      backgroundColor: COLORS.lockedBackground,
      borderColor: COLORS.lockedBackground,
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
    },
    cardTitleLocked: {
      ...TYPOGRAPHY.body,
      fontWeight: '600',
      color: COLORS.locked,
      flexShrink: 1,
      marginRight: SPACING.tight,
    },
    lockDialogBackdrop: {
      position: 'absolute',
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      backgroundColor: 'rgba(0,0,0,0.4)',
      alignItems: 'center',
      justifyContent: 'center',
      padding: SPACING.screen,
      zIndex: Z_INDEX.modal,
    },
    lockDialogCard: {
      width: '100%',
      maxWidth: 360,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      alignItems: 'center',
      gap: SPACING.tight,
      ...cardBorder(COLORS),
    },
    lockDialogIcon: {
      width: 52,
      height: 52,
      borderRadius: 26,
      backgroundColor: COLORS.lockedBackground,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: 4,
    },
    lockDialogTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
    },
    lockDialogMessage: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
    lockDialogButton: {
      marginTop: SPACING.tight,
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 12,
      paddingHorizontal: 28,
    },
    lockDialogButtonText: {
      color: COLORS.accentText,
      fontWeight: '700',
      fontSize: 15,
    },
  });

  if (!discipline) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ErrorState title="Matière introuvable" />
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (coursesQuery.isPending || progressLoading) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <View style={styles.section}>
            <ThemedText style={[TYPOGRAPHY.largeTitle, { color: COLORS.text, marginBottom: SPACING.section }]}>
              {discipline.label}
            </ThemedText>
            <SkeletonList count={6} cardHeight={64} />
          </View>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (coursesQuery.isError) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ErrorState
            title="Impossible de charger les cours"
            description="Vérifie ta connexion et réessaie."
            onRetry={() => coursesQuery.refetch()}
          />
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  const showPlacementPrompt =
    placementQuery.isSuccess && !placementQuery.data.handled && !!profileQuery.data?.grade;

  const totalCourses = coursesForDiscipline.length;
  const completedCount = coursesForDiscipline.filter((course) => completedCourseIds.includes(course.id)).length;
  const overallProgress = totalCourses > 0 ? Math.round((completedCount / totalCourses) * 100) : 0;

  const averageScore =
    attemptedEntries.length > 0
      ? Math.round(attemptedEntries.reduce((sum, entry) => sum + entry.goodPercentage, 0) / attemptedEntries.length)
      : null;

  // First course the student hasn't finished yet, in curriculum order,
  // skipping anything still locked behind a prerequisite.
  let nextCourse: CourseSummary | null = null;
  for (const course of coursesForDiscipline) {
    if (completedCourseIds.includes(course.id)) {
      continue;
    }
    const prerequisiteSatisfied =
      course.requiresCourseId === null ||
      completedCourseIds.includes(course.requiresCourseId) ||
      nextReviewDates[course.requiresCourseId] != null;
    if (prerequisiteSatisfied) {
      nextCourse = course;
      break;
    }
  }
  const nextCourseHistory = nextCourse ? historySection?.courses.find((entry) => entry.courseId === nextCourse!.id) : undefined;

  const recentExercises = attemptedEntries.slice(0, 3);

  // Shared between the chapters branch and the flat-list fallback below —
  // same card, same lock/complete/next-review logic, just grouped differently.
  function renderCourseCard(course: CourseSummary) {
    const prerequisiteSatisfied =
      course.requiresCourseId === null ||
      completedCourseIds.includes(course.requiresCourseId) ||
      nextReviewDates[course.requiresCourseId] != null;

    if (!prerequisiteSatisfied) {
      return (
        <BouncyPressable
          key={course.id}
          style={[styles.card, styles.cardLocked]}
          onPress={() => setLockedInfo(course)}>
          <ThemedText style={styles.cardTitleLocked}>{course.title}</ThemedText>
          <IconSymbol name="lock.fill" size={18} color={COLORS.locked} />
        </BouncyPressable>
      );
    }

    const isCompleted = completedCourseIds.includes(course.id);
    const nextReviewDate = nextReviewDates[course.id];

    return (
      <Link key={course.id} href={{ pathname: '/course/[id]', params: { id: course.id } }} asChild>
        <BouncyPressable style={styles.card}>
          <View style={styles.cardHeader}>
            <ThemedText style={styles.cardTitle}>{course.title}</ThemedText>
            {isCompleted ? <IconSymbol name="checkmark.circle.fill" size={20} color={COLORS.accent} /> : null}
          </View>
          {nextReviewDate ? (
            <ThemedText style={styles.cardSubtitle}>
              Prochaine révision :{' '}
              {nextReviewDate.toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' })}
            </ThemedText>
          ) : null}
        </BouncyPressable>
      </Link>
    );
  }

  return (
    <ScreenBackground color="#FAF8FC">
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={styles.scrollContent}>
          <Animated.View entering={FadeIn.duration(400)}>
            <LinearGradient
              colors={discipline.badgeGradient}
              start={{ x: 0, y: 0 }}
              end={{ x: 1, y: 1 }}
              style={[styles.header, { backgroundColor: discipline.badgeGradient[0] }]}>
              <View style={styles.headerTopRow}>
                <BouncyPressable style={styles.headerButton} onPress={() => router.back()} hitSlop={8}>
                  <IconSymbol name="chevron.right" size={18} color="#FFFFFF" style={styles.backIcon} />
                </BouncyPressable>
                <View style={styles.streakPill}>
                  <ThemedText style={{ fontSize: 14 }}>🔥</ThemedText>
                  <ThemedText style={styles.streakText}>{streakQuery.data?.streak ?? 0}</ThemedText>
                </View>
                {/* Decorative for now — no per-discipline settings/menu exists yet. */}
                <BouncyPressable style={styles.headerButton} hitSlop={8}>
                  <Ionicons name="ellipsis-horizontal" size={18} color="#FFFFFF" />
                </BouncyPressable>
              </View>
              <View style={styles.headerMain}>
                <View style={styles.headerIconBadge}>
                  <IconSymbol name={discipline.icon} size={26} color="#FFFFFF" />
                </View>
                <View>
                  <ThemedText style={styles.headerTitle}>{discipline.label}</ThemedText>
                  <ThemedText style={styles.headerSubtitle}>Apprends, révise, progresse 🚀</ThemedText>
                </View>
              </View>
            </LinearGradient>

            <View style={styles.progressCard}>
              <ThemedText style={styles.progressTitle}>Ma progression</ThemedText>
              <View style={styles.progressRow}>
                <View style={styles.ringBlock}>
                  <ProgressRing progress={overallProgress} size={84} strokeWidth={8} color={discipline.solidColor} trackColor={COLORS.border} />
                  <View style={styles.ringOverlay}>
                    <ThemedText style={styles.ringPercent}>{overallProgress}%</ThemedText>
                  </View>
                  <ThemedText style={styles.ringLabel}>Progression générale</ThemedText>
                </View>
                <View style={styles.statsGrid}>
                  <View style={styles.statItem}>
                    <View style={[styles.statBadge, { backgroundColor: discipline.solidColor }]}>
                      <Ionicons name="book" size={16} color="#FFFFFF" />
                    </View>
                    <ThemedText style={styles.statNumber}>{`${completedCount}/${totalCourses}`}</ThemedText>
                    <ThemedText style={styles.statLabel}>Leçons complétées</ThemedText>
                  </View>
                  <View style={styles.statItem}>
                    <View style={[styles.statBadge, { backgroundColor: STATUS_COLORS.info }]}>
                      <Ionicons name="eye" size={16} color="#FFFFFF" />
                    </View>
                    <ThemedText style={styles.statNumber}>{attemptedEntries.length}</ThemedText>
                    <ThemedText style={styles.statLabel}>Leçons vues</ThemedText>
                  </View>
                  <View style={styles.statItem}>
                    <View style={[styles.statBadge, { backgroundColor: FEEDBACK_COLORS.correct }]}>
                      <Ionicons name="checkmark-circle" size={16} color="#FFFFFF" />
                    </View>
                    <ThemedText style={styles.statNumber}>{averageScore !== null ? `${averageScore}%` : '—'}</ThemedText>
                    <ThemedText style={styles.statLabel}>Score moyen aux exercices</ThemedText>
                  </View>
                  <View style={styles.statItem}>
                    <View style={[styles.statBadge, { backgroundColor: STATUS_COLORS.warning }]}>
                      <Ionicons name="flag" size={16} color="#FFFFFF" />
                    </View>
                    <ThemedText style={styles.statNumber}>{totalCourses - completedCount}</ThemedText>
                    <ThemedText style={styles.statLabel}>Leçons restantes</ThemedText>
                  </View>
                </View>
              </View>
            </View>

            <View style={styles.section}>
              <View style={styles.sectionHeader}>
                <ThemedText style={styles.sectionTitle}>Cours</ThemedText>
              </View>
              {(() => {
                const visibleCourses = showAllCourses ? coursesForDiscipline : coursesForDiscipline.slice(0, VISIBLE_COURSES_LIMIT);
                const remaining = coursesForDiscipline.length - visibleCourses.length;

                return (
                  <>
                    {discipline.subjects.map((subject) => {
                      const coursesForSubject = visibleCourses.filter((course) => course.subject === subject);
                      if (coursesForSubject.length === 0) {
                        return null;
                      }

                      return (
                        <View key={subject}>
                          {discipline.subjects.length > 1 ? (
                            <ThemedText style={styles.subjectLabel}>{subjectLabel(subject)}</ThemedText>
                          ) : null}
                          {coursesForSubject.map((course) => renderCourseCard(course))}
                        </View>
                      );
                    })}

                    {coursesForDiscipline.length === 0 ? (
                      <EmptyState
                        icon="book-outline"
                        title="Aucun cours disponible"
                        description="Rien n'est encore disponible pour ta classe dans cette matière."
                      />
                    ) : null}

                    {remaining > 0 ? (
                      <BouncyPressable style={styles.seeMoreButton} onPress={() => setShowAllCourses(true)}>
                        <ThemedText style={styles.seeMoreText}>Voir plus ({remaining})</ThemedText>
                        <Ionicons name="chevron-down" size={16} color={COLORS.accent} />
                      </BouncyPressable>
                    ) : null}
                  </>
                );
              })()}
            </View>

            {nextCourse ? (
              <View style={styles.section}>
                <ThemedText style={styles.sectionTitle}>Continuer à apprendre</ThemedText>
                <View style={{ height: SPACING.tight }} />
                <View style={styles.continueCard}>
                  <View style={styles.continueRow}>
                    <LessonCoverBanner
                      courseId={nextCourse.id}
                      icon={discipline.icon}
                      cardGradient={discipline.cardGradient}
                      badgeGradient={discipline.badgeGradient}
                    />
                    <View style={styles.continueBody}>
                      <View style={styles.continueBadge}>
                        <ThemedText style={styles.continueBadgeText}>
                          {nextCourseHistory && nextCourseHistory.total > 0 ? 'Leçon en cours' : 'Prochaine leçon'}
                        </ThemedText>
                      </View>
                      <ThemedText style={styles.continueTitle} numberOfLines={2}>
                        {nextCourse.title}
                      </ThemedText>
                      <View style={styles.continueFooter}>
                        <ThemedText style={styles.continuePercent}>
                          {nextCourseHistory ? `${nextCourseHistory.goodPercentage}%` : '0%'}
                        </ThemedText>
                        <Link href={{ pathname: '/course/[id]', params: { id: nextCourse.id } }} asChild>
                          <BouncyPressable style={styles.continueButton}>
                            <ThemedText style={styles.continueButtonText}>Continuer</ThemedText>
                          </BouncyPressable>
                        </Link>
                      </View>
                    </View>
                  </View>
                </View>
              </View>
            ) : null}

            <View style={styles.section}>
              <ThemedText style={styles.sectionTitle}>Ressources</ThemedText>
              <View style={{ height: SPACING.tight }} />
              <View style={styles.resourceGrid}>
                <BouncyPressable style={styles.resourceCard} onPress={() => router.push('/flashcards')}>
                  <View style={[styles.resourceIcon, { backgroundColor: STATUS_COLORS.info }]}>
                    <Ionicons name="document-text" size={18} color="#FFFFFF" />
                  </View>
                  <ThemedText style={styles.resourceLabel}>Fiches de révision</ThemedText>
                  <ThemedText style={styles.resourceCount}>{totalDeckCards} fiches (toutes matières)</ThemedText>
                </BouncyPressable>
                <View style={[styles.resourceCard, styles.resourceCardDisabled]}>
                  <View style={[styles.resourceIcon, { backgroundColor: FEEDBACK_COLORS.correct }]}>
                    <Ionicons name="list" size={18} color="#FFFFFF" />
                  </View>
                  <ThemedText style={styles.resourceLabel}>Quiz</ThemedText>
                  <ThemedText style={styles.resourceCount}>Bientôt disponible</ThemedText>
                </View>
                <View style={[styles.resourceCard, styles.resourceCardDisabled]}>
                  <View style={[styles.resourceIcon, { backgroundColor: '#8B6FF0' }]}>
                    <Ionicons name="play" size={18} color="#FFFFFF" />
                  </View>
                  <ThemedText style={styles.resourceLabel}>Vidéos</ThemedText>
                  <ThemedText style={styles.resourceCount}>Bientôt disponible</ThemedText>
                </View>
                <View style={[styles.resourceCard, styles.resourceCardDisabled]}>
                  <View style={[styles.resourceIcon, { backgroundColor: STATUS_COLORS.warning }]}>
                    <Ionicons name="download" size={18} color="#FFFFFF" />
                  </View>
                  <ThemedText style={styles.resourceLabel}>Documents</ThemedText>
                  <ThemedText style={styles.resourceCount}>Bientôt disponible</ThemedText>
                </View>
              </View>
            </View>

            {recentExercises.length > 0 ? (
              <View style={styles.section}>
                <View style={styles.sectionHeader}>
                  <ThemedText style={styles.sectionTitle}>Derniers exercices</ThemedText>
                  <BouncyPressable style={styles.sectionSeeAll} onPress={() => router.push('/course-history')}>
                    <ThemedText style={styles.sectionSeeAllText}>Voir tout</ThemedText>
                    <Ionicons name="chevron-forward" size={13} color={COLORS.accent} />
                  </BouncyPressable>
                </View>
                <View style={styles.card}>
                  {recentExercises.map((entry) => {
                    const isFull = entry.goodPercentage >= 100;
                    return (
                      <View key={entry.courseId} style={styles.exerciseRow}>
                        <View
                          style={[styles.exerciseIconBadge, { backgroundColor: isFull ? '#DFF4E7' : '#FCE7CF' }]}>
                          <Ionicons name={isFull ? 'checkmark-circle' : 'time'} size={16} color={isFull ? '#22A55D' : '#F5893A'} />
                        </View>
                        <View style={styles.exerciseText}>
                          <ThemedText style={styles.exerciseTitle} numberOfLines={1}>
                            {entry.courseTitle}
                          </ThemedText>
                        </View>
                        <ThemedText style={[styles.exercisePercent, { color: isFull ? '#22A55D' : '#F5893A' }]}>
                          {entry.goodPercentage}%
                        </ThemedText>
                      </View>
                    );
                  })}
                </View>
              </View>
            ) : null}
          </Animated.View>
        </ScrollView>
      </SafeAreaView>

      {lockedInfo ? (
        <Animated.View entering={FadeIn.duration(180)} exiting={FadeOut.duration(150)} style={styles.lockDialogBackdrop}>
          <View style={styles.lockDialogCard}>
            <View style={styles.lockDialogIcon}>
              <IconSymbol name="lock.fill" size={22} color={COLORS.locked} />
            </View>
            <ThemedText style={styles.lockDialogTitle}>Cours verrouillé</ThemedText>
            <ThemedText style={styles.lockDialogMessage}>
              {lockedInfo.requiresCourseId
                ? `Termine « ${courses.find((c) => c.id === lockedInfo.requiresCourseId)?.title ?? 'le chapitre précédent'} » pour débloquer ce cours !`
                : 'Termine le chapitre précédent pour débloquer ce cours !'}
            </ThemedText>
            <BouncyPressable style={styles.lockDialogButton} onPress={() => setLockedInfo(null)}>
              <ThemedText style={styles.lockDialogButtonText}>Compris</ThemedText>
            </BouncyPressable>
          </View>
        </Animated.View>
      ) : null}

      {profileQuery.data?.grade ? (
        <SubjectPlacementPrompt
          visible={showPlacementPrompt}
          discipline={discipline}
          courses={coursesForDiscipline}
          grade={profileQuery.data.grade}
          serie={profileQuery.data.serie}
          onDone={() => placementQuery.refetch()}
        />
      ) : null}
    </ScreenBackground>
  );
}
