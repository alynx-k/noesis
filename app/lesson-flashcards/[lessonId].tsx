import { ActivityIndicator, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useFlashcardDecksForLesson, useSrsReviews, isDueToday } from '../../hooks/queries/use-flashcards';
import { ErrorState } from '../../components/ui/ErrorState';
import { EmptyState } from '../../components/ui/EmptyState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

export default function LessonFlashcardDecks() {
  const theme = useAppTheme();
  const { lessonId } = useLocalSearchParams<{ lessonId: string }>();
  const decks = useFlashcardDecksForLesson(lessonId);
  const srs = useSrsReviews();

  const isLoading = decks.isLoading || srs.isLoading;

  const headerOptions = {
    headerShown: true,
    title: 'Flashcards',
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

  if (decks.isError || srs.isError) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ErrorState onRetry={() => decks.refetch()} />
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen options={headerOptions} />
      {(decks.data ?? []).length === 0 ? (
        <EmptyState title="Aucune fiche pour cette leçon" message="Reviens bientôt, le contenu arrive." />
      ) : (
        <ScrollView contentContainerStyle={styles.scroll}>
          {(decks.data ?? []).map((deck) => {
            const cardIds = deck.flashcards.map((f) => f.id);
            const dueCount = cardIds.filter((id) => isDueToday(srs.data?.get(id))).length;
            return (
              <Pressable
                key={deck.id}
                onPress={() => router.push({ pathname: '/flashcard-deck/[id]', params: { id: deck.id } })}
                style={[styles.deckRow, { backgroundColor: theme.card, borderColor: theme.border }]}
              >
                <View style={{ flex: 1 }}>
                  <Text style={[styles.deckTitle, { color: theme.text }]}>{deck.title}</Text>
                  <Text style={[styles.deckSubtitle, { color: theme.textMuted }]}>
                    {cardIds.length} carte{cardIds.length > 1 ? 's' : ''}
                  </Text>
                </View>
                {dueCount > 0 ? (
                  <View style={[styles.badge, { backgroundColor: theme.primaryTint }]}>
                    <Text style={{ color: theme.primary, fontFamily: fonts.dataBold, fontSize: 12 }}>
                      {dueCount}
                    </Text>
                  </View>
                ) : (
                  <Text style={{ color: theme.success, fontFamily: fonts.bodySemiBold, fontSize: 13 }}>✓</Text>
                )}
              </Pressable>
            );
          })}
        </ScrollView>
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, padding: spacing.lg },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  scroll: { gap: spacing.sm, paddingBottom: spacing.xl },
  deckRow: {
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 1,
    borderRadius: radius.md,
    padding: spacing.md,
    gap: spacing.sm,
  },
  deckTitle: { fontFamily: fonts.bodySemiBold, fontSize: 14.5 },
  deckSubtitle: { fontFamily: fonts.body, fontSize: 12.5, marginTop: 2 },
  badge: {
    minWidth: 26,
    height: 26,
    borderRadius: radius.full,
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: spacing.xs,
  },
});
