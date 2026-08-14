import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TextInput, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { SkeletonList } from '@/components/ui/skeleton';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { DISCIPLINES, getDisciplineIdsFor } from '@/constants/disciplines';
import { FEEDBACK_COLORS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseSummary, getCoursesForGrade } from '@/lib/courses';
import { getGradeProfile } from '@/lib/grade';
import { getLv2 } from '@/lib/lv2';
import {
  buildPracticeTest,
  gradePracticeTest,
  PracticeQuestion,
  PracticeResultItem,
  StudyPlanEntry,
} from '@/lib/prepare-homework';

type Stage = 'subject' | 'courses' | 'test' | 'results';

function verdictColor(verdict: string): string {
  const normalized = verdict.toLowerCase();
  if (normalized.startsWith('correct')) {
    return FEEDBACK_COLORS.correct;
  }
  if (normalized.startsWith('partiel') || normalized.startsWith('partial')) {
    return FEEDBACK_COLORS.partial;
  }
  return FEEDBACK_COLORS.incorrect;
}

export default function PrepareHomeworkScreen() {
  const COLORS = useThemeColors();
  const [stage, setStage] = useState<Stage>('subject');
  const [availableSubjects, setAvailableSubjects] = useState(DISCIPLINES);
  const [loadingSubjects, setLoadingSubjects] = useState(true);
  const [courses, setCourses] = useState<CourseSummary[]>([]);
  const [selectedCourseIds, setSelectedCourseIds] = useState<Set<string>>(new Set());
  const [loadingCourses, setLoadingCourses] = useState(false);
  const [preparing, setPreparing] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const [questions, setQuestions] = useState<PracticeQuestion[]>([]);
  const [answers, setAnswers] = useState<string[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [grading, setGrading] = useState(false);

  const [results, setResults] = useState<{ score: string; items: PracticeResultItem[]; studyPlan: StudyPlanEntry[] } | null>(
    null,
  );

  useEffect(() => {
    Promise.all([getLv2(), getGradeProfile()])
      .then(([lv2Choice, profile]) => {
        const disciplineIdsForGrade = profile ? getDisciplineIdsFor(profile.grade, profile.serie) : DISCIPLINES.map((d) => d.id);
        setAvailableSubjects(
          DISCIPLINES.filter(
            (d) =>
              disciplineIdsForGrade.includes(d.id) &&
              ((d.id !== 'espagnol' && d.id !== 'allemand') || d.id === lv2Choice),
          ),
        );
      })
      .catch(() => setError('Impossible de charger tes matières, réessaie.'))
      .finally(() => setLoadingSubjects(false));
  }, []);

  const handleSelectSubject = async (disciplineId: string) => {
    setSelectedCourseIds(new Set());
    setLoadingCourses(true);
    setError(null);
    setStage('courses');

    const profile = await getGradeProfile();
    if (!profile) {
      setLoadingCourses(false);
      setError('Impossible de déterminer ta classe.');
      return;
    }

    const discipline = DISCIPLINES.find((d) => d.id === disciplineId);
    const allCourses = await getCoursesForGrade(profile.grade, profile.serie);
    setCourses(allCourses.filter((c) => discipline?.subjects.includes(c.subject)));
    setLoadingCourses(false);
  };

  const toggleCourse = (courseId: string) => {
    setSelectedCourseIds((previous) => {
      const next = new Set(previous);
      if (next.has(courseId)) {
        next.delete(courseId);
      } else {
        next.add(courseId);
      }
      return next;
    });
  };

  const handleGenerate = async () => {
    if (selectedCourseIds.size === 0) {
      return;
    }
    setError(null);
    setPreparing(true);
    const result = await buildPracticeTest(Array.from(selectedCourseIds));
    setPreparing(false);

    if ('error' in result) {
      setError(result.error);
      return;
    }
    setQuestions(result.questions);
    setAnswers(new Array(result.questions.length).fill(''));
    setCurrentIndex(0);
    setStage('test');
  };

  const handleNext = () => {
    if (currentIndex + 1 < questions.length) {
      setCurrentIndex((previous) => previous + 1);
      return;
    }
    handleSubmitTest();
  };

  const handleSubmitTest = async () => {
    setError(null);
    setGrading(true);
    const outcome = await gradePracticeTest(questions, answers);
    setGrading(false);

    if (outcome.status !== 'graded') {
      setError(outcome.message);
      return;
    }
    setResults(outcome);
    setStage('results');
  };

  const updateAnswer = (text: string) => {
    setAnswers((previous) => previous.map((value, index) => (index === currentIndex ? text : value)));
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
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.section,
    },
    backButton: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.section,
    },
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      paddingVertical: 14,
      paddingHorizontal: 16,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    rowSelected: {
      backgroundColor: COLORS.accent,
      borderColor: COLORS.accent,
    },
    rowText: {
      fontSize: 16,
      fontWeight: '700',
      color: COLORS.text,
    },
    rowTextSelected: {
      color: COLORS.accentText,
    },
    primaryButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
      marginTop: SPACING.element,
    },
    primaryButtonDisabled: {
      opacity: 0.5,
    },
    primaryButtonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    progress: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      marginBottom: SPACING.element,
    },
    courseBadge: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginBottom: 4,
    },
    question: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      marginBottom: SPACING.section,
    },
    input: {
      minHeight: 120,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: 16,
      fontSize: 16,
      color: COLORS.text,
      textAlignVertical: 'top',
      marginBottom: SPACING.section,
      ...cardBorder(COLORS),
    },
    scoreCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
      alignItems: 'center',
      ...cardBorder(COLORS),
    },
    scoreText: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.accent,
    },
    itemCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    itemQuestion: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    verdictBadge: {
      alignSelf: 'flex-start',
      borderRadius: 999,
      paddingVertical: 4,
      paddingHorizontal: 10,
      marginBottom: SPACING.tight,
    },
    verdictBadgeText: {
      color: '#FFFFFF',
      fontSize: 12,
      fontWeight: '700',
      textTransform: 'capitalize',
    },
    itemFeedback: {
      ...TYPOGRAPHY.body,
      fontSize: 14,
      color: COLORS.text,
    },
    studyPlanTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginTop: SPACING.element,
      marginBottom: SPACING.tight,
    },
    studyPlanRow: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    studyPlanText: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      flex: 1,
    },
  });

  const header = (title: string, onBack: () => void) => (
    <View style={styles.header}>
      <BouncyPressable style={styles.backButton} onPress={onBack} hitSlop={8}>
        <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
      </BouncyPressable>
      <ThemedText style={styles.headerTitle}>{title}</ThemedText>
      <View style={styles.backButton} />
    </View>
  );

  if (stage === 'subject') {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ScrollView contentContainerStyle={styles.scrollContent}>
            {header('Me prépare', () => router.back())}
            <ThemedText style={styles.subtitle}>Choisis la matière sur laquelle tu veux t&apos;entraîner.</ThemedText>

            {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

            {loadingSubjects ? (
              <SkeletonList count={4} cardHeight={52} />
            ) : (
              availableSubjects
                .filter((d) => d.available)
                .map((discipline) => (
                  <BouncyPressable
                    key={discipline.id}
                    style={styles.row}
                    onPress={() => handleSelectSubject(discipline.id)}>
                    <ThemedText style={styles.rowText}>{discipline.label}</ThemedText>
                    <IconSymbol name="chevron.right" size={16} color={COLORS.mutedText} />
                  </BouncyPressable>
                ))
            )}
          </ScrollView>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (stage === 'courses') {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ScrollView contentContainerStyle={styles.scrollContent}>
            {header('Choisis tes cours', () => setStage('subject'))}
            <ThemedText style={styles.subtitle}>
              Sélectionne un ou plusieurs cours — le test portera sur leur contenu.
            </ThemedText>

            {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

            {loadingCourses ? (
              <SkeletonList count={4} cardHeight={52} />
            ) : courses.length === 0 ? (
              <ThemedText style={styles.subtitle}>Aucun cours disponible pour cette matière.</ThemedText>
            ) : (
              courses.map((course) => {
                const selected = selectedCourseIds.has(course.id);
                return (
                  <BouncyPressable
                    key={course.id}
                    style={[styles.row, selected && styles.rowSelected]}
                    onPress={() => toggleCourse(course.id)}>
                    <ThemedText style={[styles.rowText, selected && styles.rowTextSelected]}>{course.title}</ThemedText>
                    {selected ? <IconSymbol name="checkmark" size={16} color={COLORS.accentText} /> : null}
                  </BouncyPressable>
                );
              })
            )}

            <BouncyPressable
              style={[styles.primaryButton, (selectedCourseIds.size === 0 || preparing) && styles.primaryButtonDisabled]}
              onPress={handleGenerate}
              disabled={selectedCourseIds.size === 0 || preparing}>
              <ThemedText style={styles.primaryButtonText}>{preparing ? 'Préparation...' : 'Générer le test'}</ThemedText>
            </BouncyPressable>
          </ScrollView>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (stage === 'test') {
    const currentQuestion = questions[currentIndex];
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <KeyboardAvoidingView style={{ flex: 1 }} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
            <ScrollView contentContainerStyle={styles.scrollContent}>
              {header('Test', () => setStage('courses'))}
              <ThemedText style={styles.progress}>
                Question {currentIndex + 1}/{questions.length}
              </ThemedText>
              <ThemedText style={styles.courseBadge}>{currentQuestion.courseTitle}</ThemedText>
              <ThemedText style={styles.question}>{currentQuestion.question}</ThemedText>

              <TextInput
                style={styles.input}
                multiline
                editable={!grading}
                placeholder="Écris ta réponse ici..."
                placeholderTextColor={COLORS.placeholderText}
                value={answers[currentIndex]}
                onChangeText={updateAnswer}
              />

              {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

              <BouncyPressable style={styles.primaryButton} onPress={handleNext} disabled={grading}>
                <ThemedText style={styles.primaryButtonText}>
                  {grading ? 'Correction...' : currentIndex + 1 < questions.length ? 'Suivant' : 'Terminer'}
                </ThemedText>
              </BouncyPressable>
            </ScrollView>
          </KeyboardAvoidingView>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
      <ScrollView contentContainerStyle={styles.scrollContent}>
        {header('Résultats', () => router.back())}

        <View style={styles.scoreCard}>
          <ThemedText style={styles.scoreText}>{results?.score}</ThemedText>
        </View>

        {results?.items.map((item, index) => (
          <View key={index} style={styles.itemCard}>
            <ThemedText style={styles.itemQuestion}>{item.question}</ThemedText>
            <View style={[styles.verdictBadge, { backgroundColor: verdictColor(item.verdict) }]}>
              <ThemedText style={styles.verdictBadgeText}>{item.verdict}</ThemedText>
            </View>
            <ThemedText style={styles.itemFeedback}>{item.feedback}</ThemedText>
          </View>
        ))}

        {results && results.studyPlan.length > 0 ? (
          <>
            <ThemedText style={styles.studyPlanTitle}>Plan d&apos;étude</ThemedText>
            {results.studyPlan.map((entry) => (
              <BouncyPressable
                key={entry.courseId}
                style={styles.studyPlanRow}
                onPress={() => router.push({ pathname: '/course/[id]', params: { id: entry.courseId } })}>
                <ThemedText style={styles.studyPlanText}>Revois « {entry.courseTitle} »</ThemedText>
                <IconSymbol name="chevron.right" size={16} color={COLORS.mutedText} />
              </BouncyPressable>
            ))}
          </>
        ) : null}
      </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
