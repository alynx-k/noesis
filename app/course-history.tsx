import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GridBackground } from '@/components/grid-background';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseHistoryEntry, CourseHistorySection, ErrorType, loadCourseHistory } from '@/lib/course-history';
import { getGradeProfile } from '@/lib/grade';

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
          colors={section.discipline.gradient}
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
  const [sections, setSections] = useState<CourseHistorySection[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getGradeProfile().then((profile) => {
      if (!profile) {
        setLoading(false);
        return;
      }
      loadCourseHistory(profile.grade, profile.serie).then((result) => {
        setSections(result);
        setLoading(false);
      });
    });
  }, []);

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
    emptyText: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginTop: SPACING.section,
    },
  });

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Historique des cours</ThemedText>
          <View style={styles.backButton} />
        </View>

        <ScrollView contentContainerStyle={styles.scrollContent}>
          {!loading && sections.length === 0 ? (
            <ThemedText style={styles.emptyText}>Aucun cours pour l&apos;instant.</ThemedText>
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
