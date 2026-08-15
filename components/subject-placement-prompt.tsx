import { useState } from 'react';
import { Modal, Platform, ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { SelectableCard } from '@/components/ui/selectable-card';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { Subject, SUBJECT_LABELS } from '@/constants/courses';
import { Discipline } from '@/constants/disciplines';
import { GradeId, SeriesId } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { useRecordPlacementHandled } from '@/hooks/queries/use-placement';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary } from '@/lib/courses';
import { applyPlacement } from '@/lib/placement';

type SubjectPlacementPromptProps = {
  visible: boolean;
  discipline: Discipline;
  courses: CourseSummary[];
  grade: GradeId;
  serie: SeriesId | null;
  onDone: () => void;
};

// Shown the first time a student opens a given discipline (see
// app/subject/[disciplineId].tsx), not once globally at onboarding — asks
// "what have you already covered in class for THIS subject" so the app can
// unlock straight past it, rather than assuming everyone starts a fresh
// discipline from chapter one. Replaces the old app/placement.tsx, which
// only ever covered histoire-géographie and only ran once, before the
// student had even picked a subject to open.
export function SubjectPlacementPrompt({
  visible,
  discipline,
  courses,
  grade,
  serie,
  onDone,
}: SubjectPlacementPromptProps) {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const recordHandled = useRecordPlacementHandled(discipline.id);
  const [selections, setSelections] = useState<Partial<Record<Subject, string>>>({});
  const [applying, setApplying] = useState(false);

  const handleToggle = (subject: Subject, courseId: string) => {
    setSelections((previous) => ({
      ...previous,
      [subject]: previous[subject] === courseId ? undefined : courseId,
    }));
  };

  const handleSkip = () => {
    recordHandled.mutate(true, { onSuccess: onDone });
  };

  const handleValidate = async () => {
    if (!user || applying) {
      return;
    }
    setApplying(true);
    await applyPlacement(user.id, grade, selections, serie);
    setApplying(false);
    recordHandled.mutate(false, { onSuccess: onDone });
  };

  const submitting = applying || recordHandled.isPending;

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
    validateButton: {
      marginTop: SPACING.tight,
    },
  });

  return (
    <Modal
      visible={visible}
      animationType="slide"
      presentationStyle={Platform.OS === 'ios' ? 'pageSheet' : undefined}
      onRequestClose={handleSkip}>
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ScrollView contentContainerStyle={styles.scrollContent}>
            <View style={styles.header}>
              <View style={styles.headerText}>
                <ThemedText style={styles.title}>Où en es-tu en {discipline.label} ?</ThemedText>
                <ThemedText style={styles.subtitle}>
                  Indique ce que tu as déjà vu en classe pour débloquer directement la suite — ou passe cette étape.
                </ThemedText>
              </View>
              <BouncyPressable style={styles.skipButton} onPress={handleSkip} disabled={submitting}>
                <ThemedText style={styles.skipButtonText}>Passer</ThemedText>
              </BouncyPressable>
            </View>

            {discipline.subjects.map((subject) => {
              const coursesForSubject = courses.filter((course) => course.subject === subject);
              if (coursesForSubject.length === 0) {
                return null;
              }

              return (
                <View key={subject} style={styles.section}>
                  {discipline.subjects.length > 1 ? (
                    <ThemedText style={styles.sectionTitle}>{SUBJECT_LABELS[subject as Subject]}</ThemedText>
                  ) : null}
                  <View style={styles.list}>
                    {coursesForSubject.map((course) => (
                      <SelectableCard
                        key={course.id}
                        label={course.title}
                        selected={selections[subject as Subject] === course.id}
                        onPress={() => handleToggle(subject as Subject, course.id)}
                      />
                    ))}
                  </View>
                </View>
              );
            })}

            <Button
              label={submitting ? 'Enregistrement...' : 'Valider'}
              onPress={handleValidate}
              loading={submitting}
              style={styles.validateButton}
            />
          </ScrollView>
        </SafeAreaView>
      </ScreenBackground>
    </Modal>
  );
}
