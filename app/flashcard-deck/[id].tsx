import { useEffect, useState } from 'react';
import { ActivityIndicator, Pressable, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Stack, useLocalSearchParams } from 'expo-router';
import {
  useFlashcardDecks,
  useFlashcardsForDeck,
  useSrsReviews,
  useReviewFlashcard,
  isDueToday,
  type Flashcard,
} from '../../hooks/queries/use-flashcards';
import { MarkdownLite } from '../../components/markdown-lite';
import { Button } from '../../components/ui/Button';
import { ErrorState } from '../../components/ui/ErrorState';
import { EmptyState } from '../../components/ui/EmptyState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

export default function FlashcardDeckReview() {
  const theme = useAppTheme();
  const { id } = useLocalSearchParams<{ id: string }>();
  const decks = useFlashcardDecks();
  const cards = useFlashcardsForDeck(id);
  const srs = useSrsReviews();
  const review = useReviewFlashcard();

  const [queue, setQueue] = useState<Flashcard[] | null>(null);
  const [index, setIndex] = useState(0);
  const [revealed, setRevealed] = useState(false);
  const [sessionXp, setSessionXp] = useState(0);
  const [sessionCount, setSessionCount] = useState(0);
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    if (queue !== null || !cards.data || !srs.data) return;
    const due = cards.data
      .filter((card) => isDueToday(srs.data!.get(card.id)))
      .sort((a, b) => (srs.data!.get(a.id)?.due_at ?? '') .localeCompare(srs.data!.get(b.id)?.due_at ?? ''));
    setQueue(due);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [cards.data, srs.data]);

  const deckTitle = decks.data?.find((d) => d.id === id)?.title ?? '';

  const headerOptions = {
    headerShown: true,
    title: deckTitle,
    headerStyle: { backgroundColor: theme.background },
    headerTintColor: theme.text,
  } as const;

  const isLoading = cards.isLoading || srs.isLoading || queue === null;

  if (isLoading) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ActivityIndicator color={theme.primary} />
      </SafeAreaView>
    );
  }

  if (cards.isError || srs.isError) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ErrorState onRetry={() => cards.refetch()} />
      </SafeAreaView>
    );
  }

  async function handleAnswer(known: boolean) {
    const card = queue![index];
    setSubmitting(true);
    try {
      const result = await review.mutateAsync({ flashcardId: card.id, known });
      setSessionXp((xp) => xp + result.xp_awarded);
      setSessionCount((c) => c + 1);
      setIndex((i) => i + 1);
      setRevealed(false);
    } finally {
      setSubmitting(false);
    }
  }

  if (queue!.length === 0) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <EmptyState title="Tout est à jour !" message="Aucune carte à revoir aujourd'hui. Reviens demain." />
      </SafeAreaView>
    );
  }

  if (index >= queue!.length) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <View style={styles.center}>
          <Text style={[styles.summaryTitle, { color: theme.text, fontFamily: fonts.display }]}>
            Session terminée !
          </Text>
          <Text style={{ color: theme.textMuted, fontFamily: fonts.body, fontSize: 15, marginTop: spacing.xs }}>
            {sessionCount} carte{sessionCount > 1 ? 's' : ''} revue{sessionCount > 1 ? 's' : ''}
          </Text>
          <View style={[styles.xpBanner, { backgroundColor: theme.primaryTint }]}>
            <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold }}>+{sessionXp} XP gagné !</Text>
          </View>
        </View>
      </SafeAreaView>
    );
  }

  const card = queue![index];

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen options={headerOptions} />
      <Text style={[styles.progress, { color: theme.textMuted }]}>
        {index + 1} / {queue!.length}
      </Text>

      <Pressable
        onPress={() => !revealed && setRevealed(true)}
        style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}
      >
        <MarkdownLite>{card.front_md}</MarkdownLite>
        {revealed ? (
          <View style={[styles.separator, { borderTopColor: theme.border }]}>
            <MarkdownLite>{card.back_md}</MarkdownLite>
          </View>
        ) : (
          <Text style={[styles.reveal, { color: theme.primary }]}>Toucher pour voir la réponse</Text>
        )}
      </Pressable>

      {revealed ? (
        <View style={styles.actions}>
          <Button
            label="Encore"
            variant="secondary"
            loading={submitting}
            onPress={() => handleAnswer(false)}
            style={{ flex: 1 }}
          />
          <Button label="Je savais" loading={submitting} onPress={() => handleAnswer(true)} style={{ flex: 1 }} />
        </View>
      ) : null}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, padding: spacing.lg },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  progress: { fontFamily: fonts.data, fontSize: 13, textAlign: 'center', marginBottom: spacing.md },
  card: {
    flex: 1,
    borderWidth: 1,
    borderRadius: radius.lg,
    padding: spacing.lg,
    justifyContent: 'center',
    gap: spacing.md,
  },
  separator: { borderTopWidth: 1, paddingTop: spacing.md, marginTop: spacing.sm },
  reveal: { fontFamily: fonts.bodySemiBold, fontSize: 13.5, textAlign: 'center', marginTop: spacing.md },
  actions: { flexDirection: 'row', gap: spacing.sm, marginTop: spacing.md },
  summaryTitle: { fontSize: 22 },
  xpBanner: { borderRadius: 12, padding: spacing.sm, marginTop: spacing.md },
});
