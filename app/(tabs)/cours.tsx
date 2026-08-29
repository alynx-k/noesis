import { useMemo } from 'react';
import { ActivityIndicator, FlatList, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router } from 'expo-router';
import { useSubjects } from '../../hooks/queries/use-subjects';
import { useVisibleLessons } from '../../hooks/queries/use-lessons';
import { useCompletedLessonIds } from '../../hooks/queries/use-lesson-progress';
import { SubjectCard } from '../../components/subject-card';
import { ErrorState } from '../../components/ui/ErrorState';
import { EmptyState } from '../../components/ui/EmptyState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, spacing } from '../../constants/theme';

export default function Cours() {
  const theme = useAppTheme();
  const subjects = useSubjects();
  const lessons = useVisibleLessons();
  const progress = useCompletedLessonIds();

  const isLoading = subjects.isLoading || lessons.isLoading || progress.isLoading;
  const isError = subjects.isError || lessons.isError || progress.isError;

  const lessonsBySubject = useMemo(() => {
    const map = new Map<string, string[]>();
    for (const lesson of lessons.data ?? []) {
      const list = map.get(lesson.subject_id) ?? [];
      list.push(lesson.id);
      map.set(lesson.subject_id, list);
    }
    return map;
  }, [lessons.data]);

  if (isLoading) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: theme.background }]}>
        <ActivityIndicator color={theme.primary} />
      </SafeAreaView>
    );
  }

  if (isError) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <ErrorState
          onRetry={() => {
            subjects.refetch();
            lessons.refetch();
            progress.refetch();
          }}
        />
      </SafeAreaView>
    );
  }

  const subjectsWithLessons = (subjects.data ?? []).filter((s) => (lessonsBySubject.get(s.id) ?? []).length > 0);

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>Cours</Text>
      {subjectsWithLessons.length === 0 ? (
        <EmptyState
          title="Pas encore de cours pour ta classe"
          message="Le contenu de ta classe arrive bientôt — reviens un peu plus tard."
        />
      ) : (
        <FlatList
          data={subjectsWithLessons}
          keyExtractor={(item) => item.id}
          contentContainerStyle={styles.list}
          renderItem={({ item }) => {
            const ids = lessonsBySubject.get(item.id) ?? [];
            const completed = ids.filter((id) => progress.data?.has(id)).length;
            return (
              <SubjectCard
                name={item.name}
                completed={completed}
                total={ids.length}
                onPress={() => router.push({ pathname: '/subject/[disciplineId]', params: { disciplineId: item.id, name: item.name } })}
              />
            );
          }}
        />
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, padding: spacing.lg },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  title: { fontSize: 24, marginBottom: spacing.md },
  list: { gap: spacing.sm, paddingBottom: spacing.xl },
});
