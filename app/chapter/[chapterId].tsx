import { Link, router, useLocalSearchParams } from 'expo-router';
import { useMemo } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { EmptyState } from '@/components/ui/empty-state';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useProgress } from '@/context/progress';
import { useChaptersForGrade, useCoursesForGrade } from '@/hooks/queries/use-courses';
import { useNextReviewDates } from '@/hooks/queries/use-spaced-repetition';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

// A chapter's own reading list — reached by tapping a row on
// app/subject/[disciplineId].tsx's "Chapitres" section. Reuses the same
// grade-wide courses/chapters queries that screen already loads (no new
// per-chapter fetch), just filtered down to this one chapter's courses.
export default function ChapterScreen() {
  const COLORS = useThemeColors();
  const { chapterId } = useLocalSearchParams<{ chapterId: string }>();
  const { completedCourseIds, loading: progressLoading } = useProgress();
  const coursesQuery = useCoursesForGrade();
  const chaptersQuery = useChaptersForGrade();

  const chapter = chaptersQuery.data?.find((c) => c.id === chapterId);
  const chapterCourses = useMemo(
    () => (coursesQuery.data ?? []).filter((course) => course.chapterId === chapterId),
    [coursesQuery.data, chapterId],
  );
  const courseIds = chapterCourses.map((course) => course.id);
  const reviewDatesQuery = useNextReviewDates(courseIds);
  const nextReviewDates = reviewDatesQuery.data ?? {};

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
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
      flexShrink: 1,
    },
    scrollContent: {
      paddingHorizontal: SPACING.screen,
      paddingBottom: 40,
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
  });

  if (coursesQuery.isPending || chaptersQuery.isPending || progressLoading) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <View style={styles.scrollContent}>
            <SkeletonList count={4} cardHeight={64} />
          </View>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (coursesQuery.isError || chaptersQuery.isError) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ErrorState title="Impossible de charger ce chapitre" onRetry={() => coursesQuery.refetch()} />
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  return (
    <ScreenBackground color="#FAF8FC">
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle} numberOfLines={2}>
            {chapter?.title ?? 'Chapitre'}
          </ThemedText>
        </View>

        <ScrollView contentContainerStyle={styles.scrollContent}>
          {chapterCourses.length === 0 ? (
            <EmptyState icon="book-outline" title="Chapitre introuvable" description="Reviens à la matière pour voir la liste des chapitres." />
          ) : null}

          {chapterCourses.map((course) => {
            const prerequisiteSatisfied =
              course.requiresCourseId === null ||
              completedCourseIds.includes(course.requiresCourseId) ||
              nextReviewDates[course.requiresCourseId] != null;

            if (!prerequisiteSatisfied) {
              return (
                <View key={course.id} style={[styles.card, styles.cardLocked]}>
                  <ThemedText style={styles.cardTitleLocked}>{course.title}</ThemedText>
                  <IconSymbol name="lock.fill" size={18} color={COLORS.locked} />
                </View>
              );
            }

            const isCompleted = completedCourseIds.includes(course.id);

            return (
              <Link key={course.id} href={{ pathname: '/course/[id]', params: { id: course.id } }} asChild>
                <BouncyPressable style={styles.card}>
                  <View style={styles.cardHeader}>
                    <ThemedText style={styles.cardTitle}>{course.title}</ThemedText>
                    {isCompleted ? <IconSymbol name="checkmark.circle.fill" size={20} color={COLORS.accent} /> : null}
                  </View>
                </BouncyPressable>
              </Link>
            );
          })}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
