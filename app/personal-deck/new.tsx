import { useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack } from 'expo-router';
import { useCreatePersonalDeck } from '../../hooks/queries/use-flashcards';
import { Input } from '../../components/ui/Input';
import { Button } from '../../components/ui/Button';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, spacing } from '../../constants/theme';

export default function NewPersonalDeck() {
  const theme = useAppTheme();
  const [title, setTitle] = useState('');
  const [error, setError] = useState<string | null>(null);
  const createDeck = useCreatePersonalDeck();

  async function handleCreate() {
    setError(null);
    try {
      const deck = await createDeck.mutateAsync(title.trim());
      router.replace({ pathname: '/personal-deck/[id]', params: { id: deck.id } });
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Impossible de créer le deck.');
    }
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: 'Nouveau deck',
          headerStyle: { backgroundColor: theme.background },
          headerTintColor: theme.text,
        }}
      />
      <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>Nouveau deck</Text>
      <View style={{ gap: spacing.md }}>
        <Input
          label="Titre du deck"
          placeholder="Ex : Vocabulaire anglais - unité 3"
          value={title}
          onChangeText={setTitle}
          errorMessage={error ?? undefined}
        />
        <Button label="Créer" loading={createDeck.isPending} disabled={!title.trim()} onPress={handleCreate} />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, padding: spacing.lg },
  title: { fontSize: 22, marginBottom: spacing.md },
});
