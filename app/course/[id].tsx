import { useState } from 'react';
import { ActivityIndicator, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useLesson } from '../../hooks/queries/use-lessons';
import { useCompletedLessonIds, useCompleteLesson } from '../../hooks/queries/use-lesson-progress';
import { MarkdownLite } from '../../components/markdown-lite';
import { Button } from '../../components/ui/Button';
import { ErrorState } from '../../components/ui/ErrorState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, spacing } from '../../constants/theme';

export default function CourseDetail() {
  const theme = useAppTheme();
  const { id } = useLocalSearchParams<{ id: string }>();
  const lesson = useLesson(id);
  const progress = useCompletedLessonIds();
  const completeLesson = useCompleteLesson();
  const [xpBanner, setXpBanner] = useState<number | null>(null);

  const isDone = progress.data?.has(id ?? '') ?? false;

  const headerOptions = {
    headerShown: true,
    title: lesson.data?.title ?? '',
    headerStyle: { backgroundColor: theme.background },
    headerTintColor: theme.text,
  } as const;

  if (lesson.isLoading) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ActivityIndicator color={theme.primary} />
      </SafeAreaView>
    );
  }

  if (lesson.isError || !lesson.data) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ErrorState onRetry={() => lesson.refetch()} />
      </SafeAreaView>
    );
  }

  async function handleComplete() {
    if (!id) return;
    const result = await completeLesson.mutateAsync(id);
    if (!result.already_completed) setXpBanner(result.xp_awarded);
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen options={headerOptions} />
      <ScrollView contentContainerStyle={styles.scroll}>
        <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>{lesson.data.title}</Text>

        {xpBanner != null ? (
          <View style={[styles.xpBanner, { backgroundColor: theme.primaryTint }]}>
            <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold }}>+{xpBanner} XP gagné !</Text>
          </View>
        ) : null}

        <MarkdownLite>{lesson.data.content_md}</MarkdownLite>
      </ScrollView>

      <View style={styles.footer}>
        <Button
          label={isDone ? 'Leçon terminée ✓' : 'Marquer comme terminée'}
          variant={isDone ? 'ghost' : 'primary'}
          disabled={isDone}
          loading={completeLesson.isPending}
          onPress={handleComplete}
        />
        <View style={{ height: spacing.sm }} />
        <Button
          label="Voir les exercices"
          variant="secondary"
          onPress={() => router.push({ pathname: '/exercise/[lessonId]', params: { lessonId: id } })}
        />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  scroll: { padding: spacing.lg, paddingBottom: spacing.xl, gap: spacing.sm },
  title: { fontSize: 24, marginBottom: spacing.xs },
  xpBanner: {
    borderRadius: 12,
    padding: spacing.sm,
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  footer: { padding: spacing.lg },
});
