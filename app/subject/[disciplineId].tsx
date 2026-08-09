import { useFocusEffect } from '@react-navigation/native';
import { Link, useLocalSearchParams } from 'expo-router';
import { useCallback, useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GridBackground } from '@/components/grid-background';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SUBJECT_LABELS } from '@/constants/courses';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { DISCIPLINES, DisciplineId } from '@/constants/disciplines';
import { GradeId } from '@/constants/grades';
import { useProgress } from '@/context/progress';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary, getCoursesForGrade } from '@/lib/courses';
import { getGradeProfile } from '@/lib/grade';
import { getNextReviewDate } from '@/lib/spaced-repetition';

function subjectLabel(subject: string): string {
  return SUBJECT_LABELS[subject as keyof typeof SUBJECT_LABELS] ?? subject;
}

export default function SubjectScreen() {
  const COLORS = useThemeColors();
  const { disciplineId } = useLocalSearchParams<{ disciplineId: DisciplineId }>();
  const discipline = DISCIPLINES.find((d) => d.id === disciplineId);

  const { completedCourseIds, loading: progressLoading } = useProgress();
  const [gradeId, setGradeId] = useState<GradeId | null>(null);
  const [courses, setCourses] = useState<CourseSummary[]>([]);
  const [nextReviewDates, setNextReviewDates] = useState<Record<string, Date | null>>({});
  const [loadingCourses, setLoadingCourses] = useState(true);

  // Refetch on focus, not just on mount: Expo Router keeps this screen instance
  // alive in the stack, so returning here from an exercise (no remount) would
  // otherwise keep showing next-review dates fetched before that exercise ran.
  useFocusEffect(
    useCallback(() => {
      if (!discipline) {
        return;
      }
      getGradeProfile().then((profile) => {
        if (!profile) {
          return;
        }
        setGradeId(profile.grade);

        getCoursesForGrade(profile.grade).then((coursesForGrade) => {
          const coursesForDiscipline = coursesForGrade.filter((course) => discipline.subjects.includes(course.subject));
          setCourses(coursesForDiscipline);
          setLoadingCourses(false);

          Promise.all(coursesForDiscipline.map((course) => getNextReviewDate(course.id))).then((dates) => {
            const map: Record<string, Date | null> = {};
            coursesForDiscipline.forEach((course, index) => {
              map[course.id] = dates[index];
            });
            setNextReviewDates(map);
          });
        });
      });
    }, [discipline]),
  );

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: 40,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      marginBottom: SPACING.section,
    },
    section: {
      marginBottom: SPACING.element,
    },
    sectionTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: SPACING.tight,
    },
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
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
    emptyText: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
  });

  if (!discipline || progressLoading || !gradeId || loadingCourses) {
    return <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']} />;
  }

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={styles.scrollContent}>
          <ThemedText style={styles.title}>{discipline.label}</ThemedText>

          {discipline.subjects.map((subject) => {
            const coursesForSubject = courses.filter((course) => course.subject === subject);
            if (coursesForSubject.length === 0) {
              return null;
            }

            return (
              <View key={subject} style={styles.section}>
                {discipline.subjects.length > 1 ? (
                  <ThemedText style={styles.sectionTitle}>{subjectLabel(subject)}</ThemedText>
                ) : null}
                {coursesForSubject.map((course) => {
                  // A course also counts as unlocked when its prerequisite already has
                  // spaced-repetition state, which is how auto-placement grants access
                  // to lessons a student already saw in class without marking them
                  // "completed" one by one.
                  const prerequisiteSatisfied =
                    course.requiresCourseId === null ||
                    completedCourseIds.includes(course.requiresCourseId) ||
                    nextReviewDates[course.requiresCourseId] != null;
                  const isLocked = !prerequisiteSatisfied;

                  if (isLocked) {
                    return (
                      <View key={course.id} style={[styles.card, styles.cardLocked]}>
                        <ThemedText style={styles.cardTitleLocked}>{course.title}</ThemedText>
                        <IconSymbol name="lock.fill" size={18} color={COLORS.locked} />
                      </View>
                    );
                  }

                  const isCompleted = completedCourseIds.includes(course.id);
                  const nextReviewDate = nextReviewDates[course.id];

                  return (
                    <Link key={course.id} href={{ pathname: '/course/[id]', params: { id: course.id } }} asChild>
                      <BouncyPressable style={styles.card}>
                        <View style={styles.cardHeader}>
                          <ThemedText style={styles.cardTitle}>{course.title}</ThemedText>
                          {isCompleted ? (
                            <IconSymbol name="checkmark.circle.fill" size={20} color={COLORS.accent} />
                          ) : null}
                        </View>
                        {nextReviewDate ? (
                          <ThemedText style={styles.cardSubtitle}>
                            Prochaine révision :{' '}
                            {nextReviewDate.toLocaleDateString('fr-FR', {
                              day: 'numeric',
                              month: 'long',
                              year: 'numeric',
                            })}
                          </ThemedText>
                        ) : null}
                      </BouncyPressable>
                    </Link>
                  );
                })}
              </View>
            );
          })}

          {courses.length === 0 ? (
            <ThemedText style={styles.emptyText}>Aucun cours disponible pour ta classe pour l'instant.</ThemedText>
          ) : null}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
