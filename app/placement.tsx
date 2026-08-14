import { useEffect, useState } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { Screen } from '@/components/ui/screen';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { Subject, SUBJECT_LABELS } from '@/constants/courses';
import { GradeId, SeriesId } from '@/constants/grades';
import { useRecordPlacementHandled } from '@/hooks/queries/use-placement';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary, getCoursesForGrade } from '@/lib/courses';
import { getGradeProfile } from '@/lib/grade';
import { applyPlacement } from '@/lib/placement';
import { useAuth } from '@/context/auth';

const SUBJECTS: Subject[] = ['geographie', 'histoire'];

export default function PlacementScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const [gradeId, setGradeId] = useState<GradeId | null>(null);
  const [serie, setSerie] = useState<SeriesId | null>(null);
  const [courses, setCourses] = useState<CourseSummary[]>([]);
  const [selections, setSelections] = useState<Partial<Record<Subject, string>>>({});
  const [applying, setApplying] = useState(false);
  const recordHandled = useRecordPlacementHandled();

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

  const handleSkip = () => {
    recordHandled.mutate(true);
  };

  const handleValidate = async () => {
    if (!user || !gradeId || applying) {
      return;
    }
    setApplying(true);
    await applyPlacement(user.id, gradeId, selections, serie);
    setApplying(false);
    recordHandled.mutate(false);
  };

  const submitting = applying || recordHandled.isPending;

  const styles = StyleSheet.create({
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
      marginTop: SPACING.tight,
    },
  });

  return (
    <Screen scroll contentContainerStyle={{ paddingBottom: 40 }}>
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

      <Button
        label={submitting ? 'Enregistrement...' : 'Valider'}
        onPress={handleValidate}
        loading={submitting}
        style={styles.validateButton}
      />
    </Screen>
  );
}
