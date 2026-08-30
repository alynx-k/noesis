import { useMemo } from 'react';
import { ActivityIndicator, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router } from 'expo-router';
import { useFlashcardDecks, useSrsReviews, isDueToday, type FlashcardDeckSummary } from '../../hooks/queries/use-flashcards';
import { useSubscription } from '../../hooks/queries/use-subscription';
import { ErrorState } from '../../components/ui/ErrorState';
import { EmptyState } from '../../components/ui/EmptyState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

export default function Fiches() {
  const theme = useAppTheme();
  const decks = useFlashcardDecks();
  const srs = useSrsReviews();
  const { isPremium } = useSubscription();

  const isLoading = decks.isLoading || srs.isLoading;
  const isError = decks.isError || srs.isError;

  const { personalDecks, sections } = useMemo(() => {
    const personal: FlashcardDeckSummary[] = [];
    const bySubject = new Map<string, { subjectName: string; decks: FlashcardDeckSummary[] }>();
    for (const deck of decks.data ?? []) {
      if (deck.user_id) {
        personal.push(deck);
        continue;
      }
      const subjectName = deck.lessons?.subjects?.name ?? 'Autre';
      const entry = bySubject.get(subjectName) ?? { subjectName, decks: [] };
      entry.decks.push(deck);
      bySubject.set(subjectName, entry);
    }
    return { personalDecks: personal, sections: Array.from(bySubject.values()) };
  }, [decks.data]);

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
            decks.refetch();
            srs.refetch();
          }}
        />
      </SafeAreaView>
    );
  }

  function handleCreateDeck() {
    router.push(isPremium ? '/personal-deck/new' : '/subscription');
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>Fiches</Text>

      <ScrollView contentContainerStyle={styles.scroll}>
        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={[styles.sectionTitle, { color: theme.textMuted }]}>Mes decks</Text>
            <Pressable onPress={handleCreateDeck}>
              <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold, fontSize: 13.5 }}>
                + Nouveau deck
              </Text>
            </Pressable>
          </View>
          {!isPremium ? (
            <Text style={[styles.hint, { color: theme.textMuted }]}>
              Passe Premium pour créer tes propres decks de flashcards.
            </Text>
          ) : null}
          {personalDecks.length === 0 ? (
            <Text style={[styles.hint, { color: theme.textMuted }]}>Aucun deck personnalisé pour l'instant.</Text>
          ) : (
            personalDecks.map((deck) => {
              const cardIds = deck.flashcards.map((f) => f.id);
              const dueCount = cardIds.filter((id) => isDueToday(srs.data?.get(id))).length;
              return (
                <Pressable
                  key={deck.id}
                  onPress={() => router.push({ pathname: '/personal-deck/[id]', params: { id: deck.id } })}
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
            })
          )}
        </View>

        {sections.length === 0 ? (
          <EmptyState
            title="Pas encore de fiches pour ta classe"
            message="Le contenu de ta classe arrive bientôt — reviens un peu plus tard."
          />
        ) : (
          sections.map((section) => (
            <View key={section.subjectName} style={styles.section}>
              <Text style={[styles.sectionTitle, { color: theme.textMuted }]}>{section.subjectName}</Text>
              {section.decks.map((deck) => {
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
                      <Text style={[styles.deckSubtitle, { color: theme.textMuted }]}>{deck.lessons?.title}</Text>
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
            </View>
          ))
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, padding: spacing.lg },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  title: { fontSize: 24, marginBottom: spacing.md },
  scroll: { paddingBottom: spacing.xl, gap: spacing.md },
  section: { gap: spacing.sm },
  sectionHeader: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' },
  sectionTitle: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 13,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
  hint: { fontFamily: fonts.body, fontSize: 13 },
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
