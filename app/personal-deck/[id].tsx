import { useState } from 'react';
import { ActivityIndicator, Alert, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack, useLocalSearchParams } from 'expo-router';
import {
  useFlashcardDecks,
  useFlashcardsForDeck,
  useCreateFlashcard,
  useUpdateFlashcard,
  useDeleteFlashcard,
  useDeletePersonalDeck,
  type Flashcard,
} from '../../hooks/queries/use-flashcards';
import { useSubscription } from '../../hooks/queries/use-subscription';
import { Input } from '../../components/ui/Input';
import { Button } from '../../components/ui/Button';
import { ErrorState } from '../../components/ui/ErrorState';
import { EmptyState } from '../../components/ui/EmptyState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

export default function PersonalDeckEditor() {
  const theme = useAppTheme();
  const { id } = useLocalSearchParams<{ id: string }>();
  const decks = useFlashcardDecks();
  const cards = useFlashcardsForDeck(id);
  const { isPremium } = useSubscription();
  const createCard = useCreateFlashcard(id ?? '');
  const updateCard = useUpdateFlashcard(id ?? '');
  const deleteCard = useDeleteFlashcard(id ?? '');
  const deleteDeck = useDeletePersonalDeck();

  const [editingId, setEditingId] = useState<string | null>(null);
  const [adding, setAdding] = useState(false);
  const [frontMd, setFrontMd] = useState('');
  const [backMd, setBackMd] = useState('');
  const [error, setError] = useState<string | null>(null);

  const deck = decks.data?.find((d) => d.id === id);

  const headerOptions = {
    headerShown: true,
    title: deck?.title ?? 'Deck',
    headerStyle: { backgroundColor: theme.background },
    headerTintColor: theme.text,
  } as const;

  if (cards.isLoading) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ActivityIndicator color={theme.primary} />
      </SafeAreaView>
    );
  }

  if (cards.isError) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ErrorState onRetry={() => cards.refetch()} />
      </SafeAreaView>
    );
  }

  function resetForm() {
    setEditingId(null);
    setAdding(false);
    setFrontMd('');
    setBackMd('');
    setError(null);
  }

  function startEdit(card: Flashcard) {
    setEditingId(card.id);
    setAdding(false);
    setFrontMd(card.front_md);
    setBackMd(card.back_md);
  }

  async function handleSave() {
    setError(null);
    try {
      if (editingId) {
        await updateCard.mutateAsync({ cardId: editingId, frontMd, backMd });
      } else {
        await createCard.mutateAsync({ frontMd, backMd, sortOrder: cards.data?.length ?? 0 });
      }
      resetForm();
    } catch (e) {
      setError(e instanceof Error ? e.message : "Impossible d'enregistrer la carte.");
    }
  }

  function confirmDeleteCard(cardId: string) {
    Alert.alert('Supprimer cette carte ?', 'Cette action est irréversible.', [
      { text: 'Annuler', style: 'cancel' },
      {
        text: 'Supprimer',
        style: 'destructive',
        onPress: () => {
          deleteCard.mutate(cardId);
          if (editingId === cardId) resetForm();
        },
      },
    ]);
  }

  function confirmDeleteDeck() {
    Alert.alert('Supprimer ce deck ?', 'Toutes les cartes seront supprimées définitivement.', [
      { text: 'Annuler', style: 'cancel' },
      {
        text: 'Supprimer',
        style: 'destructive',
        onPress: async () => {
          await deleteDeck.mutateAsync(id!);
          router.replace('/(tabs)/fiches');
        },
      },
    ]);
  }

  const showForm = adding || editingId !== null;

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen options={headerOptions} />
      <ScrollView contentContainerStyle={styles.scroll}>
        <Button
          label="Réviser ce deck"
          onPress={() => router.push({ pathname: '/flashcard-deck/[id]', params: { id: id! } })}
        />

        {!isPremium ? (
          <View style={[styles.upsell, { backgroundColor: theme.primaryTint }]}>
            <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold, marginBottom: spacing.xs }}>
              Réservé aux élèves Premium
            </Text>
            <Text style={{ color: theme.text, fontFamily: fonts.body, fontSize: 13.5, marginBottom: spacing.sm }}>
              Ton abonnement Premium a expiré : tu peux encore réviser ce deck, mais plus le modifier.
            </Text>
            <Button label="Passer Premium" onPress={() => router.push('/subscription')} />
          </View>
        ) : null}

        {(cards.data ?? []).length === 0 && !showForm ? (
          <EmptyState title="Aucune carte" message="Ajoute ta première carte pour commencer à réviser." />
        ) : (
          (cards.data ?? []).map((card) => (
            <Pressable
              key={card.id}
              disabled={!isPremium}
              onPress={() => startEdit(card)}
              style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}
            >
              <Text style={[styles.cardFront, { color: theme.text }]}>{card.front_md}</Text>
              <Text style={[styles.cardBack, { color: theme.textMuted }]}>{card.back_md}</Text>
              {isPremium ? (
                <Pressable onPress={() => confirmDeleteCard(card.id)} style={styles.deleteButton}>
                  <Text style={{ color: theme.error, fontFamily: fonts.bodySemiBold, fontSize: 13 }}>Supprimer</Text>
                </Pressable>
              ) : null}
            </Pressable>
          ))
        )}

        {isPremium && showForm ? (
          <View style={[styles.form, { backgroundColor: theme.card, borderColor: theme.border }]}>
            <Input
              label="Recto"
              placeholder="Question / terme"
              value={frontMd}
              onChangeText={setFrontMd}
              multiline
              style={styles.textarea}
            />
            <Input
              label="Verso"
              placeholder="Réponse / définition"
              value={backMd}
              onChangeText={setBackMd}
              multiline
              style={styles.textarea}
            />
            {error ? <Text style={{ color: theme.error, fontFamily: fonts.body, fontSize: 13 }}>{error}</Text> : null}
            <View style={styles.formActions}>
              <Button label="Annuler" variant="ghost" onPress={resetForm} style={{ flex: 1 }} />
              <Button
                label={editingId ? 'Enregistrer' : 'Ajouter'}
                disabled={!frontMd.trim() || !backMd.trim()}
                loading={createCard.isPending || updateCard.isPending}
                onPress={handleSave}
                style={{ flex: 1 }}
              />
            </View>
          </View>
        ) : isPremium ? (
          <Button label="+ Ajouter une carte" variant="secondary" onPress={() => setAdding(true)} />
        ) : null}

        {isPremium ? (
          <Pressable onPress={confirmDeleteDeck} style={styles.deleteDeckButton}>
            <Text style={{ color: theme.error, fontFamily: fonts.bodySemiBold, fontSize: 13.5 }}>
              Supprimer le deck
            </Text>
          </Pressable>
        ) : null}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  scroll: { padding: spacing.lg, paddingBottom: spacing.xl, gap: spacing.md },
  upsell: { borderRadius: radius.md, padding: spacing.md },
  card: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md, gap: spacing.xs },
  cardFront: { fontFamily: fonts.bodySemiBold, fontSize: 14.5 },
  cardBack: { fontFamily: fonts.body, fontSize: 13.5 },
  deleteButton: { alignSelf: 'flex-end', marginTop: spacing.xs },
  form: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md, gap: spacing.sm },
  textarea: { minHeight: 70, textAlignVertical: 'top' },
  formActions: { flexDirection: 'row', gap: spacing.sm, marginTop: spacing.xs },
  deleteDeckButton: { alignItems: 'center', marginTop: spacing.md },
});
