import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { Pressable, ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { Subject, SUBJECT_LABELS } from '@/constants/courses';
import { GradeId } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary, getCoursesForGrade } from '@/lib/courses';
import { getGradeProfile } from '@/lib/grade';
import { applyPlacement } from '@/lib/placement';
import { markPlacementHandled } from '@/lib/placement-storage';

const SUBJECTS: Subject[] = ['geographie', 'histoire'];

export default function PlacementScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const [gradeId, setGradeId] = useState<GradeId | null>(null);
  const [courses, setCourses] = useState<CourseSummary[]>([]);
  const [selections, setSelections] = useState<Partial<Record<Subject, string>>>({});
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    getGradeProfile().then((profile) => {
      if (profile) {
        setGradeId(profile.grade);
        getCoursesForGrade(profile.grade).then(setCourses);
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
    await applyPlacement(user.id, gradeId, selections);
    setSubmitting(false);
    finish();
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    container: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: 40,
    },
    title: {
      ...TYPOGRAPHY.title,
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.section,
    },
    section: {
      marginBottom: SPACING.section,
    },
    sectionTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      marginBottom: SPACING.element,
    },
    list: {
      gap: 10,
    },
    row: {
      borderWidth: 1,
      borderColor: COLORS.border,
      borderRadius: RADIUS,
      paddingVertical: 12,
      paddingHorizontal: 16,
    },
    rowSelected: {
      borderColor: COLORS.accent,
      backgroundColor: COLORS.accent,
    },
    rowText: {
      fontSize: 15,
    },
    rowTextSelected: {
      color: COLORS.accentText,
      fontWeight: '600',
    },
    validateButton: {
      backgroundColor: COLORS.accent,
      borderRadius: RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
      marginTop: SPACING.element,
    },
    validateButtonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '600',
    },
    skipButton: {
      paddingVertical: 14,
      alignItems: 'center',
    },
    skipButtonText: {
      color: COLORS.mutedText,
      fontSize: 14,
      fontWeight: '600',
      textDecorationLine: 'underline',
    },
  });

  return (
    <ThemedView style={styles.container}>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={styles.scrollContent}>
          <ThemedText style={styles.title}>Où en es-tu dans ton programme ?</ThemedText>
          <ThemedText style={styles.subtitle}>
            Tu peux déjà indiquer où tu en es dans ton programme scolaire réel, pour débloquer directement ce que
            tu as déjà vu en classe. Tu peux aussi passer cette étape et tout débloquer dans l'ordre normalement.
          </ThemedText>

          {SUBJECTS.map((subject) => {
            const coursesForSubject = courses.filter((course) => course.subject === subject);
            if (coursesForSubject.length === 0) {
              return null;
            }

            return (
              <View key={subject} style={styles.section}>
                <ThemedText style={styles.sectionTitle}>{SUBJECT_LABELS[subject]}</ThemedText>
                <View style={styles.list}>
                  {coursesForSubject.map((course) => {
                    const isSelected = selections[subject] === course.id;
                    return (
                      <Pressable
                        key={course.id}
                        style={[styles.row, isSelected && styles.rowSelected]}
                        onPress={() => handleToggle(subject, course.id)}>
                        <ThemedText style={[styles.rowText, isSelected && styles.rowTextSelected]}>
                          {course.title}
                        </ThemedText>
                      </Pressable>
                    );
                  })}
                </View>
              </View>
            );
          })}

          <Pressable style={styles.validateButton} onPress={handleValidate} disabled={submitting}>
            <ThemedText style={styles.validateButtonText}>
              {submitting ? 'Enregistrement...' : 'Valider'}
            </ThemedText>
          </Pressable>

          <Pressable style={styles.skipButton} onPress={handleSkip} disabled={submitting}>
            <ThemedText style={styles.skipButtonText}>Passer cette étape</ThemedText>
          </Pressable>
        </ScrollView>
      </SafeAreaView>
    </ThemedView>
  );
}
