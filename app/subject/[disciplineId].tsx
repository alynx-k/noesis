import { ActivityIndicator, FlatList, Pressable, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useLessonsForSubject } from '../../hooks/queries/use-lessons';
import { useCompletedLessonIds } from '../../hooks/queries/use-lesson-progress';
import { ErrorState } from '../../components/ui/ErrorState';
import { EmptyState } from '../../components/ui/EmptyState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

export default function SubjectDetail() {
  const theme = useAppTheme();
  const { disciplineId, name } = useLocalSearchParams<{ disciplineId: string; name: string }>();
  const lessons = useLessonsForSubject(disciplineId);
  const progress = useCompletedLessonIds();

  const isLoading = lessons.isLoading || progress.isLoading;

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: name ?? '',
          headerStyle: { backgroundColor: theme.background },
          headerTintColor: theme.text,
        }}
      />
      <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>{name}</Text>

      {isLoading ? (
        <View style={styles.center}>
          <ActivityIndicator color={theme.primary} />
        </View>
      ) : lessons.isError ? (
        <ErrorState onRetry={() => lessons.refetch()} />
      ) : (lessons.data ?? []).length === 0 ? (
        <EmptyState title="Aucune leçon pour l'instant" message="Reviens bientôt, le contenu arrive." />
      ) : (
        <FlatList
          data={lessons.data}
          keyExtractor={(item) => item.id}
          contentContainerStyle={styles.list}
          renderItem={({ item, index }) => {
            const isDone = progress.data?.has(item.id) ?? false;
            return (
              <Pressable
                onPress={() => router.push({ pathname: '/course/[id]', params: { id: item.id } })}
                style={[styles.row, { backgroundColor: theme.card, borderColor: theme.border }]}
              >
                <View
                  style={[
                    styles.badge,
                    { backgroundColor: isDone ? theme.primary : theme.border },
                  ]}
                >
                  <Text style={{ color: isDone ? '#FFFFFF' : theme.textMuted, fontFamily: fonts.dataBold, fontSize: 12 }}>
                    {isDone ? '✓' : index + 1}
                  </Text>
                </View>
                <Text style={[styles.rowTitle, { color: theme.text }]}>{item.title}</Text>
              </Pressable>
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
  title: { fontSize: 22, marginBottom: spacing.md },
  list: { gap: spacing.sm, paddingBottom: spacing.xl },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
    borderWidth: 1,
    borderRadius: radius.md,
    padding: spacing.md,
  },
  badge: {
    width: 28,
    height: 28,
    borderRadius: radius.full,
    alignItems: 'center',
    justifyContent: 'center',
  },
  rowTitle: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 14.5,
    flex: 1,
  },
});
