import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Link, router, useLocalSearchParams } from 'expo-router';
import { useMemo, useRef, useState } from 'react';
import { ActivityIndicator, NativeScrollEvent, NativeSyntheticEvent, ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { CourseContent } from '@/components/course-content';
import { LessonCoverBanner } from '@/components/lesson-cover-banner';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { DISCIPLINES } from '@/constants/disciplines';
import { useCourseDetail, useCoursesForGrade } from '@/hooks/queries/use-courses';
import { useCourseHistory } from '@/hooks/queries/use-course-history';
import { useStreak } from '@/hooks/queries/use-streak';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { estimateReadingMinutes } from '@/lib/reading-time';

export default function CourseScreen() {
  const COLORS = useThemeColors();
  const { id } = useLocalSearchParams<{ id: string }>();
  const courseQuery = useCourseDetail(id ?? '');
  const coursesQuery = useCoursesForGrade();
  const historyQuery = useCourseHistory();
  const streakQuery = useStreak();
  const course = courseQuery.data;

  const scrollRef = useRef<ScrollView>(null);
  const sectionOffsets = useRef<Record<number, number>>({});
  const [activeStep, setActiveStep] = useState(0);

  const courseSummary = coursesQuery.data?.find((c) => c.id === id);
  const discipline = courseSummary ? DISCIPLINES.find((d) => d.subjects.includes(courseSummary.subject)) : undefined;
  const sameSubjectCourses = useMemo(
    () =>
      (coursesQuery.data ?? [])
        .filter((c) => c.subject === courseSummary?.subject)
        .sort((a, b) => a.orderIndex - b.orderIndex),
    [coursesQuery.data, courseSummary?.subject],
  );
  const lessonRank = sameSubjectCourses.findIndex((c) => c.id === id) + 1;

  const historyEntry = historyQuery.data
    ?.flatMap((section) => section.courses)
    .find((entry) => entry.courseId === id);

  const hasContentV2 = course && 'sections' in course.content;
  const contentV2 = hasContentV2 ? (course!.content as Extract<typeof course.content, { sections: unknown }>) : null;

  const steps = useMemo(() => {
    if (!contentV2) {
      return [] as { label: string; minutes: number }[];
    }
    const list = [
      { label: 'Introduction', minutes: estimateReadingMinutes(contentV2.situation.text) },
      ...contentV2.sections.map((section) => ({ label: section.heading, minutes: estimateReadingMinutes(section.body) })),
    ];
    if (contentV2.evaluation) {
      list.push({
        label: 'Bilan',
        minutes: estimateReadingMinutes([contentV2.evaluation.scenario, ...contentV2.evaluation.questions].join(' ')),
      });
    }
    return list;
  }, [contentV2]);

  const totalMinutes = steps.reduce((sum, step) => sum + step.minutes, 0);
  const partsCount = steps.length;

  const handleScroll = (event: NativeSyntheticEvent<NativeScrollEvent>) => {
    const y = event.nativeEvent.contentOffset.y;
    let current = 0;
    for (const [index, offset] of Object.entries(sectionOffsets.current)) {
      if (offset - 80 <= y) {
        current = Math.max(current, Number(index));
      }
    }
    setActiveStep(current);
  };

  const scrollToStep = (index: number) => {
    const offset = sectionOffsets.current[index];
    if (offset !== undefined) {
      scrollRef.current?.scrollTo({ y: Math.max(0, offset - 16), animated: true });
    }
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      paddingBottom: 100,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.element,
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
    headerCenter: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      flex: 1,
      justifyContent: 'center',
    },
    headerIconBadge: {
      width: 32,
      height: 32,
      borderRadius: 11,
      backgroundColor: 'rgba(255,255,255,0.2)',
      alignItems: 'center',
      justifyContent: 'center',
    },
    headerTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: '#FFFFFF',
    },
    streakPill: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 4,
      backgroundColor: 'rgba(255,255,255,0.2)',
      borderRadius: PILL_RADIUS,
      paddingVertical: 6,
      paddingHorizontal: 10,
      marginRight: SPACING.tight,
    },
    streakText: {
      color: '#FFFFFF',
      fontWeight: '700',
      fontSize: 13,
    },
    introSection: {
      paddingHorizontal: SPACING.screen,
      marginBottom: SPACING.section,
    },
    introCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    introTopRow: {
      flexDirection: 'row',
      gap: SPACING.element,
    },
    introTextCol: {
      flex: 1,
    },
    lessonPill: {
      alignSelf: 'flex-start',
      backgroundColor: COLORS.accentSoft,
      borderRadius: PILL_RADIUS,
      paddingVertical: 4,
      paddingHorizontal: 10,
      marginBottom: SPACING.tight,
    },
    lessonPillText: {
      fontSize: 12,
      fontWeight: '700',
      color: COLORS.accent,
    },
    lessonTitle: {
      ...TYPOGRAPHY.title,
      fontSize: 20,
      color: COLORS.text,
      marginBottom: 6,
    },
    lessonDescription: {
      fontSize: 13,
      lineHeight: 18,
      color: COLORS.mutedText,
    },
    metaRow: {
      flexDirection: 'row',
      gap: SPACING.element,
      marginTop: SPACING.element,
    },
    metaItem: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 4,
    },
    metaText: {
      fontSize: 12,
      fontWeight: '600',
      color: COLORS.mutedText,
    },
    progressRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginTop: SPACING.element,
    },
    progressTrack: {
      flex: 1,
      height: 6,
      borderRadius: 3,
      backgroundColor: COLORS.border,
      overflow: 'hidden',
    },
    progressFill: {
      height: '100%',
      borderRadius: 3,
      backgroundColor: COLORS.accent,
    },
    progressPercent: {
      fontSize: 12,
      fontWeight: '700',
      color: COLORS.accent,
    },
    tabsRow: {
      flexDirection: 'row',
      gap: SPACING.section,
      paddingHorizontal: SPACING.screen,
      marginBottom: SPACING.element,
      borderBottomWidth: 1,
      borderBottomColor: COLORS.border,
    },
    tab: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      paddingBottom: SPACING.tight,
      borderBottomWidth: 2,
      borderBottomColor: 'transparent',
    },
    tabActive: {
      borderBottomColor: COLORS.accent,
    },
    tabText: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.mutedText,
    },
    tabTextActive: {
      color: COLORS.accent,
    },
    bodyRow: {
      flexDirection: 'row',
      paddingHorizontal: SPACING.screen,
      gap: SPACING.element,
    },
    stepperCol: {
      width: 64,
      alignItems: 'center',
    },
    stepItem: {
      alignItems: 'center',
      paddingBottom: SPACING.element,
      position: 'relative',
    },
    stepCircle: {
      width: 28,
      height: 28,
      borderRadius: 14,
      alignItems: 'center',
      justifyContent: 'center',
      borderWidth: 2,
      borderColor: COLORS.border,
      backgroundColor: COLORS.surface,
      marginBottom: 4,
    },
    stepCircleActive: {
      backgroundColor: COLORS.accent,
      borderColor: COLORS.accent,
    },
    stepCircleDone: {
      backgroundColor: COLORS.accentSoft,
      borderColor: COLORS.accent,
    },
    stepNumber: {
      fontSize: 12,
      fontWeight: '700',
      color: COLORS.mutedText,
    },
    stepNumberActive: {
      color: '#FFFFFF',
    },
    stepLine: {
      position: 'absolute',
      top: 28,
      bottom: -SPACING.element,
      width: 2,
      backgroundColor: COLORS.border,
    },
    stepLabel: {
      fontSize: 10,
      fontWeight: '600',
      color: COLORS.mutedText,
      textAlign: 'center',
    },
    contentCol: {
      flex: 1,
    },
    paragraph: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      marginBottom: SPACING.element,
    },
    exerciseBar: {
      position: 'absolute',
      left: 0,
      right: 0,
      bottom: 0,
      padding: SPACING.element,
      backgroundColor: COLORS.surface,
      borderTopWidth: 1,
      borderTopColor: COLORS.border,
    },
    exerciseButton: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'center',
      gap: 8,
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
    },
    exerciseButtonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
    centered: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center',
      padding: SPACING.screen,
      gap: SPACING.element,
    },
    loadingTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: SPACING.tight,
    },
    loadingSubtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  if (!course) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          {courseQuery.isError ? (
            <ErrorState
              title="Impossible d'ouvrir ce cours"
              description={(courseQuery.error as Error)?.message}
              onRetry={() => courseQuery.refetch()}
            />
          ) : (
            <View style={styles.centered}>
              <ActivityIndicator color={COLORS.accent} size="large" />
              <View>
                <ThemedText style={styles.loadingTitle}>Préparation de ton cours...</ThemedText>
                <ThemedText style={styles.loadingSubtitle}>
                  Ça peut prendre quelques secondes la première fois — les prochains élèves l&apos;auront
                  instantanément.
                </ThemedText>
              </View>
            </View>
          )}
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  const headerColors = discipline?.badgeGradient ?? (['#6D5BD0', '#4F3A9E'] as const);
  const progressPercent = historyEntry && historyEntry.total > 0 ? historyEntry.goodPercentage : 0;
  const shortDescription = contentV2 ? contentV2.situation.text.slice(0, 110).trim() + '…' : '';

  return (
    <ScreenBackground color="#FAF8FC">
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <LinearGradient colors={headerColors} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }} style={[styles.header, { backgroundColor: headerColors[0] }]}>
          <BouncyPressable style={styles.headerButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color="#FFFFFF" style={styles.backIcon} />
          </BouncyPressable>
          <View style={styles.headerCenter}>
            {discipline ? (
              <View style={styles.headerIconBadge}>
                <IconSymbol name={discipline.icon} size={16} color="#FFFFFF" />
              </View>
            ) : null}
            <ThemedText style={styles.headerTitle} numberOfLines={1}>
              {discipline?.label ?? course.title}
            </ThemedText>
          </View>
          <View style={styles.streakPill}>
            <ThemedText style={{ fontSize: 13 }}>🔥</ThemedText>
            <ThemedText style={styles.streakText}>{streakQuery.data?.streak ?? 0}</ThemedText>
          </View>
        </LinearGradient>

        <ScrollView ref={scrollRef} contentContainerStyle={styles.scrollContent} onScroll={handleScroll} scrollEventThrottle={100}>
          <View style={styles.introSection}>
            <View style={styles.introCard}>
              <View style={styles.introTopRow}>
                <View style={styles.introTextCol}>
                  {lessonRank > 0 ? (
                    <View style={styles.lessonPill}>
                      <ThemedText style={styles.lessonPillText}>
                        Leçon {lessonRank} sur {sameSubjectCourses.length}
                      </ThemedText>
                    </View>
                  ) : null}
                  <ThemedText style={styles.lessonTitle}>{course.title}</ThemedText>
                  {shortDescription ? <ThemedText style={styles.lessonDescription}>{shortDescription}</ThemedText> : null}
                </View>
                {discipline ? (
                  <LessonCoverBanner
                    courseId={course.id}
                    icon={discipline.icon}
                    cardGradient={discipline.cardGradient}
                    badgeGradient={discipline.badgeGradient}
                  />
                ) : null}
              </View>

              {contentV2 ? (
                <View style={styles.metaRow}>
                  <View style={styles.metaItem}>
                    <Ionicons name="time-outline" size={14} color={COLORS.mutedText} />
                    <ThemedText style={styles.metaText}>{totalMinutes} min</ThemedText>
                  </View>
                  <View style={styles.metaItem}>
                    <Ionicons name="reader-outline" size={14} color={COLORS.mutedText} />
                    <ThemedText style={styles.metaText}>{partsCount} parties</ThemedText>
                  </View>
                </View>
              ) : null}

              <View style={styles.progressRow}>
                <View style={styles.progressTrack}>
                  <View style={[styles.progressFill, { width: `${progressPercent}%` }]} />
                </View>
                <ThemedText style={styles.progressPercent}>{progressPercent}%</ThemedText>
              </View>
            </View>
          </View>

          <View style={styles.tabsRow}>
            <View style={[styles.tab, styles.tabActive]}>
              <Ionicons name="book" size={16} color={COLORS.accent} />
              <ThemedText style={[styles.tabText, styles.tabTextActive]}>Leçon</ThemedText>
            </View>
            <Link href={{ pathname: '/exercise', params: { courseId: course.id } }} asChild>
              <BouncyPressable style={styles.tab}>
                <Ionicons name="create-outline" size={16} color={COLORS.mutedText} />
                <ThemedText style={styles.tabText}>Exercices</ThemedText>
              </BouncyPressable>
            </Link>
          </View>

          <View style={styles.bodyRow}>
            {contentV2 ? (
              <View style={styles.stepperCol}>
                {steps.map((step, index) => (
                  <BouncyPressable key={index} style={styles.stepItem} onPress={() => scrollToStep(index)}>
                    {index < steps.length - 1 ? <View style={styles.stepLine} /> : null}
                    <View
                      style={[
                        styles.stepCircle,
                        index === activeStep && styles.stepCircleActive,
                        index < activeStep && styles.stepCircleDone,
                      ]}>
                      <ThemedText style={[styles.stepNumber, index === activeStep && styles.stepNumberActive]}>
                        {index + 1}
                      </ThemedText>
                    </View>
                    <ThemedText style={styles.stepLabel} numberOfLines={2}>
                      {step.label}
                    </ThemedText>
                  </BouncyPressable>
                ))}
              </View>
            ) : null}

            <View style={styles.contentCol}>
              {contentV2 ? (
                <CourseContent
                  content={contentV2}
                  onSectionLayout={(index, y) => {
                    sectionOffsets.current[index] = y;
                  }}
                />
              ) : 'paragraphs' in course.content ? (
                course.content.paragraphs.map((paragraph, index) => (
                  <ThemedText key={index} style={styles.paragraph}>
                    {paragraph}
                  </ThemedText>
                ))
              ) : null}
            </View>
          </View>
        </ScrollView>

        <View style={styles.exerciseBar}>
          <Link href={{ pathname: '/exercise', params: { courseId: course.id } }} asChild>
            <BouncyPressable style={styles.exerciseButton}>
              <ThemedText style={styles.exerciseButtonText}>Commencer l&apos;exercice</ThemedText>
            </BouncyPressable>
          </Link>
        </View>
      </SafeAreaView>
    </ScreenBackground>
  );
}
