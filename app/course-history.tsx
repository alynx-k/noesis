import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { EmptyState } from '@/components/ui/empty-state';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useProgress } from '@/context/progress';
import { useCourseHistory } from '@/hooks/queries/use-course-history';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseHistoryEntry, CourseHistorySection, ErrorType } from '@/lib/course-history';

const ERROR_LABELS: Record<ErrorType, { singular: string; plural: string }> = {
  étourderie: { singular: 'étourderie', plural: 'étourderies' },
  confusion: { singular: 'confusion', plural: 'confusions' },
  méthode: { singular: 'méthode', plural: 'méthodes' },
};

function formatErrorBreakdown(errorCounts: Record<ErrorType, number>): string {
  return (Object.keys(errorCounts) as ErrorType[])
    .filter((type) => errorCounts[type] > 0)
    .map((type) => {
      const count = errorCounts[type];
      const label = count === 1 ? ERROR_LABELS[type].singular : ERROR_LABELS[type].plural;
      return `${count} ${label}`;
    })
    .join(', ');
}

function CourseRow({ course }: { course: CourseHistoryEntry }) {
  const COLORS = useThemeColors();
  const hasErrors = Object.values(course.errorCounts).some((count) => count > 0);

  const styles = StyleSheet.create({
    courseRow: {
      paddingVertical: SPACING.tight,
    },
    courseTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 4,
    },
    courseLine: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginBottom: 2,
    },
    reviewLine: {
      ...TYPOGRAPHY.caption,
      color: COLORS.accent,
      fontWeight: '700',
      marginTop: 2,
    },
  });

  return (
    <View style={styles.courseRow}>
      <ThemedText style={styles.courseTitle}>{course.courseTitle}</ThemedText>
      {course.total === 0 ? (
        <ThemedText style={styles.courseLine}>Pas encore de questions répondues.</ThemedText>
      ) : (
        <>
          <ThemedText style={styles.courseLine}>
            {course.goodPercentage}% de bonnes réponses · {course.total} question{course.total > 1 ? 's' : ''}
          </ThemedText>
          {hasErrors ? (
            <ThemedText style={styles.courseLine}>Erreurs : {formatErrorBreakdown(course.errorCounts)}</ThemedText>
          ) : null}
        </>
      )}
      {course.nextReviewDate ? (
        <ThemedText style={styles.reviewLine}>
          Prochaine révision :{' '}
          {course.nextReviewDate.toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' })}
        </ThemedText>
      ) : null}
    </View>
  );
}

function DisciplineSection({ section, isLast }: { section: CourseHistorySection; isLast: boolean }) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    cardSpacing: {
      marginBottom: SPACING.tight,
    },
    sectionHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginBottom: SPACING.element,
    },
    sectionIcon: {
      width: 28,
      height: 28,
      borderRadius: 14,
      alignItems: 'center',
      justifyContent: 'center',
    },
    sectionTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    separator: {
      borderTopWidth: 1,
      borderTopColor: COLORS.border,
      marginVertical: SPACING.tight,
    },
  });

  return (
    <ThemedView style={[styles.card, !isLast && styles.cardSpacing]}>
      <View style={styles.sectionHeader}>
        <LinearGradient
          colors={section.discipline.badgeGradient}
          start={{ x: 0, y: 0 }}
          end={{ x: 1, y: 1 }}
          style={styles.sectionIcon}>
          <IconSymbol name={section.discipline.icon} size={16} color={COLORS.accentText} />
        </LinearGradient>
        <ThemedText style={styles.sectionTitle}>{section.discipline.label}</ThemedText>
      </View>

      {section.courses.map((course, index) => (
        <View key={course.courseId}>
          <CourseRow course={course} />
          {index < section.courses.length - 1 ? <View style={styles.separator} /> : null}
        </View>
      ))}
    </ThemedView>
  );
}

export default function CourseHistoryScreen() {
  const COLORS = useThemeColors();
  const historyQuery = useCourseHistory();
  const { completedCourseIds } = useProgress();
  // This screen shows only what's actually finished, not the full syllabus
  // useCourseHistory loads (every course for the grade, so DisciplineSection
  // can be grouped/rendered without a second fetch) — filtering here keeps
  // that hook generic instead of baking "completed-only" into its query.
  const sections = (historyQuery.data ?? [])
    .map((section) => ({
      ...section,
      courses: section.courses.filter((course) => completedCourseIds.includes(course.courseId)),
    }))
    .filter((section) => section.courses.length > 0);

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
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Historique des cours</ThemedText>
          <View style={styles.backButton} />
        </View>

        <ScrollView contentContainerStyle={styles.scrollContent}>
          {historyQuery.isPending ? <SkeletonList count={3} cardHeight={120} /> : null}

          {historyQuery.isError ? (
            <ErrorState
              title="Impossible de charger l'historique"
              onRetry={() => historyQuery.refetch()}
            />
          ) : null}

          {historyQuery.isSuccess && sections.length === 0 ? (
            <EmptyState
              icon="time-outline"
              title="Aucun cours terminé pour l'instant"
              description="Les cours que tu termines apparaîtront ici."
            />
          ) : null}

          {sections.map((section, index) => (
            <DisciplineSection
              key={section.discipline.id}
              section={section}
              isLast={index === sections.length - 1}
            />
          ))}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
