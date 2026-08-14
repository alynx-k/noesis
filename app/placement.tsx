import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GridBackground } from '@/components/grid-background';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { Subject, SUBJECT_LABELS } from '@/constants/courses';
import { GradeId, SeriesId } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary, getCoursesForGrade } from '@/lib/courses';
import { getGradeProfile } from '@/lib/grade';
import { applyPlacement } from '@/lib/placement';
import { markPlacementHandled } from '@/lib/placement-storage';

const SUBJECTS: Subject[] = ['geographie', 'histoire'];

export default function PlacementScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const [gradeId, setGradeId] = useState<GradeId | null>(null);
  const [serie, setSerie] = useState<SeriesId | null>(null);
  const [courses, setCourses] = useState<CourseSummary[]>([]);
  const [selections, setSelections] = useState<Partial<Record<Subject, string>>>({});
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    getGradeProfile().then((profile) => {
      if (profile) {
        setGradeId(profile.grade);
        setSerie(profile.serie);
        getCoursesForGrade(profile.grade, profile.serie).then(setCourses);
      }
    });
  }, []);

  const handleToggle = (subject: Subject, courseId: string) => {
    setSelections((previous) => ({
      ...previous,
      [subject]: previous[subject] === courseId ? undefined : courseId,
    }));
  };

  const finish = async () => {
    await markPlacementHandled();
    router.replace('/');
  };

  const handleSkip = () => {
    finish();
  };

  const handleValidate = async () => {
    if (!user || !gradeId || submitting) {
      return;
    }
    setSubmitting(true);
    await applyPlacement(user.id, gradeId, selections, serie);
    setSubmitting(false);
    finish();
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: 40,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'flex-start',
      justifyContent: 'space-between',
      gap: SPACING.tight,
      marginBottom: SPACING.section,
    },
    headerText: {
      flex: 1,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
    skipButton: {
      paddingVertical: 6,
      paddingHorizontal: 4,
    },
    skipButtonText: {
      color: COLORS.mutedText,
      fontSize: 14,
      fontWeight: '700',
    },
    section: {
      marginBottom: SPACING.section,
    },
    sectionTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      textTransform: 'uppercase',
      marginBottom: SPACING.element,
    },
    list: {
      gap: 10,
    },
    row: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      paddingVertical: 14,
      paddingHorizontal: 16,
      ...cardBorder(COLORS),
    },
    rowSelected: {
      borderColor: COLORS.accent,
      backgroundColor: COLORS.accent,
    },
    rowText: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      fontWeight: '600',
    },
    rowTextSelected: {
      color: COLORS.accentText,
    },
    validateButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
      marginTop: SPACING.tight,
    },
    validateButtonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
  });

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={styles.scrollContent}>
          <View style={styles.header}>
            <View style={styles.headerText}>
              <ThemedText style={styles.title}>Où en es-tu dans ton programme ?</ThemedText>
              <ThemedText style={styles.subtitle}>
                Indique ce que tu as déjà vu en classe pour débloquer directement la suite — ou passe cette étape.
              </ThemedText>
            </View>
            <BouncyPressable style={styles.skipButton} onPress={handleSkip} disabled={submitting}>
              <ThemedText style={styles.skipButtonText}>Passer</ThemedText>
            </BouncyPressable>
          </View>

          {SUBJECTS.map((subject, subjectIndex) => {
            const coursesForSubject = courses.filter((course) => course.subject === subject);
            if (coursesForSubject.length === 0) {
              return null;
            }

            return (
              <Animated.View
                key={subject}
                entering={FadeInDown.delay(subjectIndex * 80).springify().damping(16)}
                style={styles.section}>
                <ThemedText style={styles.sectionTitle}>{SUBJECT_LABELS[subject]}</ThemedText>
                <View style={styles.list}>
                  {coursesForSubject.map((course) => {
                    const isSelected = selections[subject] === course.id;
                    return (
                      <BouncyPressable
                        key={course.id}
                        style={[styles.row, isSelected && styles.rowSelected]}
                        onPress={() => handleToggle(subject, course.id)}>
                        <ThemedText style={[styles.rowText, isSelected && styles.rowTextSelected]}>
                          {course.title}
                        </ThemedText>
                      </BouncyPressable>
                    );
                  })}
                </View>
              </Animated.View>
            );
          })}

          <BouncyPressable style={styles.validateButton} onPress={handleValidate} disabled={submitting}>
            <ThemedText style={styles.validateButtonText}>
              {submitting ? 'Enregistrement...' : 'Valider'}
            </ThemedText>
          </BouncyPressable>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
