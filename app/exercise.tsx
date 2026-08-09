import { useFocusEffect } from '@react-navigation/native';
import { useLocalSearchParams } from 'expo-router';
import { useCallback, useState } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TextInput } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { AiTutorChat } from '@/components/ai-tutor-chat';
import { BouncyPressable } from '@/components/bouncy-pressable';
import { CelebrationBurst } from '@/components/celebration-burst';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { FEEDBACK_COLORS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useProgress } from '@/context/progress';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { ExerciseQuestion, getCourseTitle, getExerciseQuestions } from '@/lib/courses';
import { isNotificationsEnabled, scheduleReviewReminder } from '@/lib/notifications';
import { scheduleNextReview } from '@/lib/spaced-repetition';
import { playCorrectSound, playLessonCompleteSound } from '@/lib/sound';
import { supabase } from '@/lib/supabase';

type Confidence = 'unsure' | 'sure' | null;
type Verdict = 'correct' | 'partial' | 'incorrect';

const VERDICT_LABELS: Record<Verdict, string> = {
  correct: 'Correct',
  partial: 'Pas tout à fait',
  incorrect: 'Incorrect',
};

const HELP_THRESHOLD = 2;
const SKIP_THRESHOLD = 4;

async function getConsecutiveWrongCount(courseId: string, questionNumber: number): Promise<number> {
  const { data, error } = await supabase
    .from('answer_attempts')
    .select('error_type')
    .eq('course_id', courseId)
    .eq('question_number', questionNumber)
    .order('created_at', { ascending: false })
    .limit(10);

  if (error || !data) {
    console.error('Failed to load attempt count:', error);
    return 0;
  }

  let count = 0;
  for (const row of data) {
    if (row.error_type !== null) {
      count += 1;
    } else {
      break;
    }
  }
  return count;
}

export default function ExerciseScreen() {
  const COLORS = useThemeColors();
  const { courseId: courseIdParam } = useLocalSearchParams<{ courseId?: string }>();
  const courseId = courseIdParam ?? 'mondialisation';

  const { user } = useAuth();
  const { completeCourse } = useProgress();
  const [questions, setQuestions] = useState<ExerciseQuestion[]>([]);
  const [courseTitle, setCourseTitle] = useState('');
  const [loadingQuestions, setLoadingQuestions] = useState(true);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [finalVerdicts, setFinalVerdicts] = useState<Verdict[]>([]);
  const [answerText, setAnswerText] = useState('');
  const [confidence, setConfidence] = useState<Confidence>(null);
  const [grading, setGrading] = useState(false);
  const [verdict, setVerdict] = useState<Verdict | null>(null);
  const [gradingError, setGradingError] = useState<string | null>(null);
  const [consecutiveWrong, setConsecutiveWrong] = useState(0);
  const [hintRevealed, setHintRevealed] = useState(false);
  const [tutorVisible, setTutorVisible] = useState(false);

  useFocusEffect(
    useCallback(() => {
      setLoadingQuestions(true);
      setCurrentIndex(0);
      setFinalVerdicts([]);
      getExerciseQuestions(courseId).then((result) => {
        setQuestions(result);
        setLoadingQuestions(false);
      });
      getCourseTitle(courseId).then(setCourseTitle);
    }, [courseId]),
  );

  const isFinished = !loadingQuestions && currentIndex >= questions.length;

  const proceedToNext = (updatedFinalVerdicts: Verdict[]) => {
    const isLastQuestion = currentIndex === questions.length - 1;
    if (isLastQuestion) {
      playLessonCompleteSound();
      completeCourse(courseId);
      if (user) {
        const correctCount = updatedFinalVerdicts.filter((v) => v === 'correct').length;
        scheduleNextReview(user.id, courseId, correctCount / questions.length).then((dueDate) => {
          if (!dueDate) {
            return;
          }
          isNotificationsEnabled().then((enabled) => {
            if (enabled) {
              scheduleReviewReminder(courseId, courseTitle, dueDate);
            }
          });
        });
      }
    }
    setFinalVerdicts(updatedFinalVerdicts);
    setAnswerText('');
    setConfidence(null);
    setVerdict(null);
    setConsecutiveWrong(0);
    setHintRevealed(false);
    setCurrentIndex((previous) => previous + 1);
  };

  const handleValidate = async () => {
    setGradingError(null);
    setVerdict(null);
    setGrading(true);

    const { data, error } = await supabase.functions.invoke('grade-answer', {
      body: { questionNumber: currentIndex + 1, studentAnswer: answerText, courseId },
    });

    setGrading(false);

    if (error) {
      console.error('Failed to grade answer:', error);
      setGradingError("Erreur pendant l'évaluation, réessaie.");
      return;
    }

    if (data?.limitReached) {
      setGradingError(data.message ?? 'Limite quotidienne atteinte. Reviens demain, ou passe premium pour un accès illimité.');
      return;
    }

    if (!data?.verdict) {
      console.error('Failed to grade answer: no verdict in response', data);
      setGradingError("Erreur pendant l'évaluation, réessaie.");
      return;
    }

    const currentVerdict = data.verdict as Verdict;
    setVerdict(currentVerdict);

    if (currentVerdict === 'correct') {
      playCorrectSound();
      const updatedFinalVerdicts = [...finalVerdicts, currentVerdict];
      setTimeout(() => proceedToNext(updatedFinalVerdicts), 1800);
      return;
    }

    setHintRevealed(false);
    const count = await getConsecutiveWrongCount(courseId, currentIndex + 1);
    setConsecutiveWrong(count);
  };

  const handleSkip = () => {
    proceedToNext([...finalVerdicts, 'incorrect']);
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    container: {
      flex: 1,
      backgroundColor: COLORS.background,
    },
    centered: {
      justifyContent: 'center',
      alignItems: 'center',
      padding: SPACING.screen,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: 40,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
    },
    progressRow: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      backgroundColor: 'transparent',
      marginBottom: SPACING.element,
    },
    progress: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
    },
    tutorButton: {
      width: 32,
      height: 32,
      borderRadius: 16,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
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
    confidenceRow: {
      flexDirection: 'row',
      gap: 12,
      marginBottom: SPACING.section,
      backgroundColor: 'transparent',
    },
    confidenceButton: {
      borderWidth: 1.5,
      borderColor: COLORS.accent,
      borderRadius: 999,
      paddingVertical: 8,
      paddingHorizontal: 18,
    },
    confidenceButtonSelected: {
      backgroundColor: COLORS.accent,
    },
    confidenceButtonText: {
      color: COLORS.accent,
      fontSize: 14,
      fontWeight: '700',
    },
    confidenceButtonTextSelected: {
      color: COLORS.accentText,
    },
    verdictBadge: {
      borderRadius: RADIUS,
      paddingVertical: 14,
      alignItems: 'center',
      marginBottom: SPACING.element,
    },
    verdictBadgeText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
    error: {
      color: FEEDBACK_COLORS.incorrect,
      marginBottom: SPACING.element,
    },
    helpButton: {
      borderWidth: 1.5,
      borderColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 10,
      alignItems: 'center',
      marginBottom: SPACING.element,
    },
    helpButtonText: {
      color: COLORS.accent,
      fontSize: 14,
      fontWeight: '700',
    },
    hint: {
      ...TYPOGRAPHY.body,
      fontSize: 14,
      fontStyle: 'italic',
      color: COLORS.mutedText,
      marginBottom: SPACING.element,
    },
    skipButton: {
      paddingVertical: 10,
      alignItems: 'center',
      marginBottom: SPACING.element,
    },
    skipButtonText: {
      color: COLORS.mutedText,
      fontSize: 14,
      fontWeight: '600',
      textDecorationLine: 'underline',
    },
    validateButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
      marginTop: SPACING.element,
    },
    validateButtonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
  });

  if (loadingQuestions) {
    return <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']} />;
  }

  if (isFinished) {
    return (
      <ThemedView style={styles.container}>
        <SafeAreaView style={[styles.safeArea, styles.centered]} edges={['top', 'bottom']}>
          <CelebrationBurst />
          <ThemedText style={styles.title}>Exercice terminé, bravo !</ThemedText>
        </SafeAreaView>
      </ThemedView>
    );
  }

  return (
    <ThemedView style={styles.container}>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <KeyboardAvoidingView
          style={styles.container}
          behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
        <ScrollView contentContainerStyle={styles.scrollContent}>
          <ThemedView style={styles.progressRow}>
            <ThemedText style={styles.progress}>
              Question {currentIndex + 1}/{questions.length}
            </ThemedText>
            <BouncyPressable style={styles.tutorButton} onPress={() => setTutorVisible(true)} hitSlop={8}>
              <IconSymbol name="sparkles" size={18} color={COLORS.accent} />
            </BouncyPressable>
          </ThemedView>

          <ThemedText style={styles.question}>{questions[currentIndex]?.question}</ThemedText>

          {verdict === 'correct' ? (
            <ThemedView style={[styles.verdictBadge, { backgroundColor: FEEDBACK_COLORS.correct }]}>
              <ThemedText style={styles.verdictBadgeText}>{VERDICT_LABELS.correct}</ThemedText>
            </ThemedView>
          ) : (
            <>
              <TextInput
                style={styles.input}
                multiline
                editable={!grading}
                placeholder="Écris ta réponse ici..."
                placeholderTextColor={COLORS.placeholderText}
                value={answerText}
                onChangeText={setAnswerText}
              />

              <ThemedView style={styles.confidenceRow}>
                <BouncyPressable
                  disabled={grading}
                  style={[styles.confidenceButton, confidence === 'unsure' && styles.confidenceButtonSelected]}
                  onPress={() => setConfidence('unsure')}>
                  <ThemedText
                    style={[
                      styles.confidenceButtonText,
                      confidence === 'unsure' && styles.confidenceButtonTextSelected,
                    ]}>
                    Pas sûr
                  </ThemedText>
                </BouncyPressable>
                <BouncyPressable
                  disabled={grading}
                  style={[styles.confidenceButton, confidence === 'sure' && styles.confidenceButtonSelected]}
                  onPress={() => setConfidence('sure')}>
                  <ThemedText
                    style={[styles.confidenceButtonText, confidence === 'sure' && styles.confidenceButtonTextSelected]}>
                    Sûr
                  </ThemedText>
                </BouncyPressable>
              </ThemedView>

              {verdict ? (
                <ThemedView style={[styles.verdictBadge, { backgroundColor: FEEDBACK_COLORS[verdict] }]}>
                  <ThemedText style={styles.verdictBadgeText}>{VERDICT_LABELS[verdict]}</ThemedText>
                </ThemedView>
              ) : null}

              {gradingError ? <ThemedText style={styles.error}>{gradingError}</ThemedText> : null}

              {consecutiveWrong >= HELP_THRESHOLD && !hintRevealed ? (
                <BouncyPressable style={styles.helpButton} onPress={() => setHintRevealed(true)}>
                  <ThemedText style={styles.helpButtonText}>Besoin d'aide ?</ThemedText>
                </BouncyPressable>
              ) : null}

              {hintRevealed ? (
                <ThemedText style={styles.hint}>{questions[currentIndex]?.hint}</ThemedText>
              ) : null}

              {consecutiveWrong >= SKIP_THRESHOLD ? (
                <BouncyPressable style={styles.skipButton} onPress={handleSkip}>
                  <ThemedText style={styles.skipButtonText}>Passer cette question</ThemedText>
                </BouncyPressable>
              ) : null}

              <BouncyPressable style={styles.validateButton} onPress={handleValidate} disabled={grading}>
                <ThemedText style={styles.validateButtonText}>{grading ? 'Évaluation...' : 'Valider'}</ThemedText>
              </BouncyPressable>
            </>
          )}
        </ScrollView>
        </KeyboardAvoidingView>
      </SafeAreaView>

      <AiTutorChat
        visible={tutorVisible}
        onClose={() => setTutorVisible(false)}
        context={{ type: 'exercise', courseId, questionNumber: currentIndex + 1 }}
      />
    </ThemedView>
  );
}
