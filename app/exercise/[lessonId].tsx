import { useEffect, useRef, useState } from 'react';
import { ActivityIndicator, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useLesson } from '../../hooks/queries/use-lessons';
import { useExercises, useExerciseProgress, useSubmitExercise, type Exercise, type SubmitExerciseResult } from '../../hooks/queries/use-exercises';
import { useSubscription } from '../../hooks/queries/use-subscription';
import { MarkdownLite } from '../../components/markdown-lite';
import { Button } from '../../components/ui/Button';
import { ErrorState } from '../../components/ui/ErrorState';
import { EmptyState } from '../../components/ui/EmptyState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

export default function ExerciseList() {
  const theme = useAppTheme();
  const { lessonId } = useLocalSearchParams<{ lessonId: string }>();
  const lesson = useLesson(lessonId);
  const exercises = useExercises(lessonId);
  const progress = useExerciseProgress();
  const { isPremium } = useSubscription();
  const submit = useSubmitExercise();

  const [corrections, setCorrections] = useState<Record<string, SubmitExerciseResult>>({});
  const [pendingIds, setPendingIds] = useState<Set<string>>(new Set());
  const rehydrated = useRef(new Set<string>());

  // Un exercice déjà répondu (progress) n'a pas sa correction complète en cache
  // côté client (explanation_md/correct_option_id ne sont jamais select-ables
  // directement, voir RLS de exercise_answers) : on rappelle le RPC, idempotent,
  // pour la récupérer sans re-comptabiliser d'XP.
  useEffect(() => {
    if (!exercises.data || !progress.data) return;
    for (const exercise of exercises.data) {
      const attempt = progress.data.get(exercise.id);
      if (attempt && !rehydrated.current.has(exercise.id)) {
        rehydrated.current.add(exercise.id);
        submit.mutate(
          { exerciseId: exercise.id, selectedOptionId: attempt.selected_option_id },
          { onSuccess: (result) => setCorrections((prev) => ({ ...prev, [exercise.id]: result })) },
        );
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [exercises.data, progress.data]);

  const isLoading = lesson.isLoading || exercises.isLoading;

  const headerOptions = {
    headerShown: true,
    title: 'Exercices',
    headerStyle: { backgroundColor: theme.background },
    headerTintColor: theme.text,
  } as const;

  if (isLoading) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ActivityIndicator color={theme.primary} />
      </SafeAreaView>
    );
  }

  if (lesson.isError || exercises.isError) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ErrorState onRetry={() => exercises.refetch()} />
      </SafeAreaView>
    );
  }

  async function handleSubmit(exerciseId: string, selectedOptionId: string) {
    setPendingIds((prev) => new Set(prev).add(exerciseId));
    try {
      const result = await submit.mutateAsync({ exerciseId, selectedOptionId });
      setCorrections((prev) => ({ ...prev, [exerciseId]: result }));
    } finally {
      setPendingIds((prev) => {
        const next = new Set(prev);
        next.delete(exerciseId);
        return next;
      });
    }
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen options={headerOptions} />
      <ScrollView contentContainerStyle={styles.scroll}>
        <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>
          {lesson.data?.title}
        </Text>

        {!isPremium ? (
          <View style={[styles.upsell, { backgroundColor: theme.primaryTint }]}>
            <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold, marginBottom: spacing.xs }}>
              Réservé aux élèves Premium
            </Text>
            <Text style={{ color: theme.text, fontFamily: fonts.body, fontSize: 13.5, marginBottom: spacing.sm }}>
              Passe Premium pour valider tes réponses et voir la correction détaillée.
            </Text>
            <Button label="Passer Premium" onPress={() => router.push('/subscription')} />
          </View>
        ) : null}

        {(exercises.data ?? []).length === 0 ? (
          <EmptyState title="Aucun exercice pour cette leçon" message="Reviens bientôt, le contenu arrive." />
        ) : (
          (exercises.data ?? []).map((exercise, index) => (
            <ExerciseCard
              key={exercise.id}
              index={index}
              exercise={exercise}
              locked={!isPremium}
              correction={corrections[exercise.id]}
              submitting={pendingIds.has(exercise.id)}
              onSubmit={(optionId) => handleSubmit(exercise.id, optionId)}
            />
          ))
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

function ExerciseCard({
  index,
  exercise,
  locked,
  correction,
  submitting,
  onSubmit,
}: {
  index: number;
  exercise: Exercise;
  locked: boolean;
  correction: SubmitExerciseResult | undefined;
  submitting: boolean;
  onSubmit: (optionId: string) => void;
}) {
  const theme = useAppTheme();
  const [selected, setSelected] = useState<string | null>(null);
  const isAnswered = !!correction;

  return (
    <View style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}>
      <Text style={[styles.question, { color: theme.text }]}>
        {index + 1}.
      </Text>
      <MarkdownLite>{exercise.question_md}</MarkdownLite>

      <View style={styles.options}>
        {exercise.options.map((option) => {
          const isSelected = selected === option.id;
          const isCorrectOption = correction?.correct_option_id === option.id;
          const isWrongSelected = isAnswered && isSelected && !correction?.is_correct;

          let borderColor = theme.border;
          let backgroundColor = theme.background;
          if (isAnswered) {
            if (isCorrectOption) {
              borderColor = theme.success;
              backgroundColor = theme.success + '22';
            } else if (isWrongSelected) {
              borderColor = theme.error;
              backgroundColor = theme.error + '22';
            }
          } else if (isSelected) {
            borderColor = theme.primary;
            backgroundColor = theme.primaryTint;
          }

          return (
            <Pressable
              key={option.id}
              disabled={locked || isAnswered}
              onPress={() => setSelected(option.id)}
              style={[styles.option, { borderColor, backgroundColor }]}
            >
              <Text style={{ color: theme.text, fontFamily: fonts.bodyMedium }}>{option.text}</Text>
            </Pressable>
          );
        })}
      </View>

      {isAnswered ? (
        <View style={styles.correction}>
          <Text
            style={{
              color: correction!.is_correct ? theme.success : theme.error,
              fontFamily: fonts.bodySemiBold,
              marginBottom: spacing.xs,
            }}
          >
            {correction!.is_correct ? 'Bonne réponse !' : 'Mauvaise réponse.'}
          </Text>
          {correction!.explanation_md ? <MarkdownLite>{correction!.explanation_md}</MarkdownLite> : null}
        </View>
      ) : !locked ? (
        <Button
          label="Valider"
          disabled={!selected}
          loading={submitting}
          onPress={() => selected && onSubmit(selected)}
        />
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  scroll: { padding: spacing.lg, paddingBottom: spacing.xl, gap: spacing.md },
  title: { fontSize: 22, marginBottom: spacing.xs },
  upsell: { borderRadius: radius.md, padding: spacing.md },
  card: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md, gap: spacing.sm },
  question: { fontFamily: fonts.bodySemiBold, fontSize: 15 },
  options: { gap: spacing.sm },
  option: { borderWidth: 1.5, borderRadius: radius.md, padding: spacing.sm },
  correction: { marginTop: spacing.xs },
});
