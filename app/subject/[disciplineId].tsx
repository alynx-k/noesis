import { Link, useLocalSearchParams } from 'expo-router';
import { useState } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { EmptyState } from '@/components/ui/empty-state';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Screen } from '@/components/ui/screen';
import { SkeletonList } from '@/components/ui/skeleton';
import { SUBJECT_LABELS } from '@/constants/courses';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY, Z_INDEX } from '@/constants/design';
import { DISCIPLINES, DisciplineId } from '@/constants/disciplines';
import { useProgress } from '@/context/progress';
import { useCoursesForGrade } from '@/hooks/queries/use-courses';
import { useNextReviewDates } from '@/hooks/queries/use-spaced-repetition';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary } from '@/lib/courses';

function subjectLabel(subject: string): string {
  return SUBJECT_LABELS[subject as keyof typeof SUBJECT_LABELS] ?? subject;
}

export default function SubjectScreen() {
  const COLORS = useThemeColors();
  const { disciplineId } = useLocalSearchParams<{ disciplineId: DisciplineId }>();
  const discipline = DISCIPLINES.find((d) => d.id === disciplineId);

  const { completedCourseIds, loading: progressLoading } = useProgress();
  const coursesQuery = useCoursesForGrade();
  const [lockedInfo, setLockedInfo] = useState<CourseSummary | null>(null);

  const courses = coursesQuery.data ?? [];
  const coursesForDiscipline = discipline ? courses.filter((course) => discipline.subjects.includes(course.subject)) : [];
  const courseIds = coursesForDiscipline.map((course) => course.id);
  const reviewDatesQuery = useNextReviewDates(courseIds);
  const nextReviewDates = reviewDatesQuery.data ?? {};

  const styles = StyleSheet.create({
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
      <Screen>
        <ErrorState title="Matière introuvable" />
      </Screen>
    );
  }

  if (coursesQuery.isPending || progressLoading) {
    return (
      <Screen scroll contentContainerStyle={{ paddingBottom: 40 }}>
        <ThemedText style={styles.title}>{discipline.label}</ThemedText>
        <SkeletonList count={6} cardHeight={64} />
      </Screen>
    );
  }

  if (coursesQuery.isError) {
    return (
      <Screen>
        <ErrorState
          title="Impossible de charger les cours"
          description="Vérifie ta connexion et réessaie."
          onRetry={() => coursesQuery.refetch()}
        />
      </Screen>
    );
  }

  return (
    <Screen scroll contentContainerStyle={{ paddingBottom: 40 }}>
      <Animated.View entering={FadeIn.duration(400)}>
      <ThemedText style={styles.title}>{discipline.label}</ThemedText>

      {discipline.subjects.map((subject) => {
        const coursesForSubject = coursesForDiscipline.filter((course) => course.subject === subject);
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

      {coursesForDiscipline.length === 0 ? (
        <EmptyState
          icon="book-outline"
          title="Aucun cours disponible"
          description="Rien n'est encore disponible pour ta classe dans cette matière."
        />
      ) : null}
      </Animated.View>

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
    </Screen>
  );
}
