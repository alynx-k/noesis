import { useFocusEffect } from '@react-navigation/native';
import { router, useLocalSearchParams } from 'expo-router';
import { useCallback, useRef, useState } from 'react';
import { ActivityIndicator, KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TextInput } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { AiTutorChat } from '@/components/ai-tutor-chat';
import { BouncyPressable } from '@/components/bouncy-pressable';
import { CelebrationBurst } from '@/components/celebration-burst';
import { PremiumUpsellCard } from '@/components/premium-upsell-card';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { FEEDBACK_COLORS, PILL_RADIUS, RADIUS, SPACING, STATUS_COLORS, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useProgress } from '@/context/progress';
import { useExercise } from '@/hooks/queries/use-exercise';
import { useScheduleNextReview } from '@/hooks/queries/use-spaced-repetition';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { isNotificationsEnabled, scheduleReviewReminder } from '@/lib/notifications';
import { playCorrectSound, playLessonCompleteSound } from '@/lib/sound';
import { supabase } from '@/lib/supabase';

type Confidence = 'unsure' | 'sure' | null;
type Verdict = 'correct' | 'partial' | 'incorrect';

// Quick-insert symbols for calculation/fraction answers — RN's default
// keyboard buries these behind the symbols page on most devices, so a
// student writing "3/4" or "x^2" has to hunt for them every time.
// Appended at the end of the current answer rather than at the cursor:
// tracking/restoring cursor position through controlled TextInput
// re-renders is fragile on RN, and "append" matches how a student actually
// builds up a short numeric answer.
const MATH_SYMBOLS = ['/', '^', '+', '-', '×'] as const;

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
  // Empty, not a real course id, when the param is missing — see the
  // `!courseIdParam` guard below (after `styles`, alongside the other
  // early-return states) for what actually happens in that case. This used
  // to silently fall back to a hardcoded real course id ('mondialisation'),
  // which meant any visit to the web build's /exercise with no ?courseId=
  // (typed by hand, a stale link, a crawler) loaded and could complete a
  // course the student never chose, writing real progress rows for it.
  const courseId = courseIdParam ?? '';

  const { user } = useAuth();
  const { completeCourse } = useProgress();
  const exerciseQuery = useExercise(courseId);
  const questions = exerciseQuery.data?.questions ?? [];
  const courseTitle = exerciseQuery.data?.courseTitle ?? '';
  const [currentIndex, setCurrentIndex] = useState(0);
  const [finalVerdicts, setFinalVerdicts] = useState<Verdict[]>([]);
  const [answerText, setAnswerText] = useState('');
  const [confidence, setConfidence] = useState<Confidence>(null);
  const [grading, setGrading] = useState(false);
  const [verdict, setVerdict] = useState<Verdict | null>(null);
  const [gradingError, setGradingError] = useState<string | null>(null);
  const [limitReached, setLimitReached] = useState(false);
  const [consecutiveWrong, setConsecutiveWrong] = useState(0);
  const [hintRevealed, setHintRevealed] = useState(false);
  const [tutorVisible, setTutorVisible] = useState(false);

  // Each visit to this screen is a fresh attempt at the exercise, regardless
  // of whether the underlying questions are freshly fetched or served from
  // cache — this reset is about UI state, not data freshness.
  useFocusEffect(
    useCallback(() => {
      setCurrentIndex(0);
      setFinalVerdicts([]);
    }, []),
  );

  const isFinished = exerciseQuery.isSuccess && currentIndex >= questions.length;

  const scheduleReview = useScheduleNextReview();

  const proceedToNext = (updatedFinalVerdicts: Verdict[]) => {
    const isLastQuestion = currentIndex === questions.length - 1;
    if (isLastQuestion) {
      playLessonCompleteSound();
      completeCourse(courseId);
      if (user) {
        const correctCount = updatedFinalVerdicts.filter((v) => v === 'correct').length;
        scheduleReview
          .mutateAsync({ courseId, accuracyRate: correctCount / questions.length })
          .then((dueDate) => {
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

  // `grading` (state) isn't enough on its own to stop a double-submit — a
  // fast double-tap/double-click can fire handleValidate a second time
  // before React commits the setGrading(true) re-render that would disable
  // the button. A ref is checked synchronously, before that re-render, so
  // it actually blocks the second call instead of racing it.
  const isGradingRef = useRef(false);

  const handleValidate = async () => {
    if (isGradingRef.current) {
      return;
    }
    isGradingRef.current = true;
    try {
      setGradingError(null);
      setLimitReached(false);
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
        setLimitReached(true);
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
    } finally {
      isGradingRef.current = false;
    }
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
      ...cardBorder(COLORS),
    },
    mathToolbar: {
      flexDirection: 'row',
      gap: 8,
      marginTop: SPACING.tight,
      marginBottom: SPACING.section,
    },
    mathKey: {
      width: 40,
      height: 40,
      borderRadius: 12,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      borderBottomWidth: 3,
      borderBottomColor: COLORS.borderStrong,
      ...cardBorder(COLORS),
    },
    mathKeyText: {
      fontSize: 17,
      fontWeight: '700',
      color: COLORS.text,
    },
    confidenceRow: {
      flexDirection: 'row',
      gap: 12,
      marginBottom: SPACING.section,
      backgroundColor: 'transparent',
    },
    confidenceButton: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
      borderRadius: 999,
      paddingVertical: 8,
      paddingHorizontal: 18,
    },
    confidenceButtonUnsureSelected: {
      backgroundColor: STATUS_COLORS.warning,
      borderColor: STATUS_COLORS.warning,
    },
    confidenceButtonSureSelected: {
      backgroundColor: FEEDBACK_COLORS.correct,
      borderColor: FEEDBACK_COLORS.correct,
    },
    confidenceButtonText: {
      color: COLORS.mutedText,
      fontSize: 14,
      fontWeight: '700',
    },
    confidenceButtonTextSelected: {
      color: '#FFFFFF',
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

  if (!courseId) {
    // useExercise's `enabled: !!courseId` keeps the query permanently
    // isPending (never disabled-but-resolved) when there's no id to fetch —
    // this has to be checked first, or a missing param would otherwise fall
    // into the isPending branch below and spin forever with no explanation.
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ErrorState
            title="Aucun cours sélectionné"
            description="Reviens depuis un cours pour commencer un exercice."
            onRetry={() => router.replace('/')}
            retryLabel="Retour à l'accueil"
          />
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (exerciseQuery.isPending) {
    return (
      <ScreenBackground>
        <SafeAreaView style={[styles.safeArea, styles.centered]} edges={['top', 'bottom']}>
          <ActivityIndicator color={COLORS.accent} size="large" />
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (exerciseQuery.isError) {
    return (
      <ScreenBackground>
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <ErrorState
            title="Impossible de charger l'exercice"
            description={(exerciseQuery.error as Error)?.message}
            onRetry={() => exerciseQuery.refetch()}
          />
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  if (isFinished) {
    return (
      <ScreenBackground>
        <SafeAreaView style={[styles.safeArea, styles.centered]} edges={['top', 'bottom']}>
          <CelebrationBurst />
          <ThemedText style={styles.title}>Exercice terminé, bravo !</ThemedText>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  return (
    <ScreenBackground>
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

              <ThemedView style={styles.mathToolbar}>
                {MATH_SYMBOLS.map((symbol) => (
                  <BouncyPressable
                    key={symbol}
                    disabled={grading}
                    style={styles.mathKey}
                    onPress={() => setAnswerText((previous) => previous + symbol)}
                    hitSlop={4}>
                    <ThemedText style={styles.mathKeyText}>{symbol}</ThemedText>
                  </BouncyPressable>
                ))}
              </ThemedView>

              <ThemedView style={styles.confidenceRow}>
                <BouncyPressable
                  disabled={grading}
                  style={[styles.confidenceButton, confidence === 'unsure' && styles.confidenceButtonUnsureSelected]}
                  onPress={() => setConfidence('unsure')}>
                  {confidence === 'unsure' ? <IconSymbol name="checkmark" size={14} color="#FFFFFF" /> : null}
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
                  style={[styles.confidenceButton, confidence === 'sure' && styles.confidenceButtonSureSelected]}
                  onPress={() => setConfidence('sure')}>
                  {confidence === 'sure' ? <IconSymbol name="checkmark" size={14} color="#FFFFFF" /> : null}
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

              {limitReached && gradingError ? <PremiumUpsellCard message={gradingError} /> : null}
              {!limitReached && gradingError ? <ThemedText style={styles.error}>{gradingError}</ThemedText> : null}

              {consecutiveWrong >= HELP_THRESHOLD && !hintRevealed ? (
                <BouncyPressable style={styles.helpButton} onPress={() => setHintRevealed(true)}>
                  <ThemedText style={styles.helpButtonText}>Besoin d&apos;aide ?</ThemedText>
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
    </ScreenBackground>
  );
}
