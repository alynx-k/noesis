import { useState } from 'react';
import { ActivityIndicator, Alert, FlatList, Pressable, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';
import { useCourseSummaries, useDeleteCourseSummary, type CourseSummary } from '../hooks/queries/use-course-summaries';
import { MarkdownLite } from '../components/markdown-lite';
import { Button } from '../components/ui/Button';
import { ErrorState } from '../components/ui/ErrorState';
import { EmptyState } from '../components/ui/EmptyState';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

function formatDate(iso: string): string {
  const date = new Date(iso);
  return date.toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
}

export default function Summaries() {
  const theme = useAppTheme();
  const summaries = useCourseSummaries();
  const deleteSummary = useDeleteCourseSummary();
  const [expandedId, setExpandedId] = useState<string | null>(null);

  function handleDelete(item: CourseSummary) {
    Alert.alert('Supprimer cette synthèse ?', `"${item.title}" sera définitivement supprimée.`, [
      { text: 'Annuler', style: 'cancel' },
      { text: 'Supprimer', style: 'destructive', onPress: () => deleteSummary.mutate(item.id) },
    ]);
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: 'Mes synthèses',
          headerStyle: { backgroundColor: theme.background },
          headerTintColor: theme.text,
        }}
      />

      <View style={styles.content}>
        <Button label="Nouvelle synthèse" icon="camera-outline" onPress={() => router.push('/create-summary')} />

        {summaries.isLoading ? (
          <View style={styles.center}>
            <ActivityIndicator color={theme.primary} />
          </View>
        ) : summaries.isError ? (
          <ErrorState onRetry={() => summaries.refetch()} />
        ) : (summaries.data ?? []).length === 0 ? (
          <EmptyState
            title="Aucune synthèse pour l'instant"
            message="Prends en photo ton cahier pour générer ta première fiche de révision."
          />
        ) : (
          <FlatList
            data={summaries.data}
            keyExtractor={(item) => item.id}
            contentContainerStyle={styles.list}
            renderItem={({ item }) => {
              const isExpanded = expandedId === item.id;
              return (
                <View style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}>
                  <Pressable
                    style={styles.cardHeader}
                    onPress={() => setExpandedId(isExpanded ? null : item.id)}
                  >
                    <View style={{ flex: 1 }}>
                      <Text style={[styles.cardTitle, { color: theme.text }]}>{item.title}</Text>
                      <Text style={[styles.cardDate, { color: theme.textMuted }]}>{formatDate(item.created_at)}</Text>
                    </View>
                    <Ionicons
                      name={isExpanded ? 'chevron-up' : 'chevron-down'}
                      size={20}
                      color={theme.textMuted}
                    />
                  </Pressable>

                  {isExpanded ? (
                    <View style={[styles.cardBody, { borderTopColor: theme.border }]}>
                      <MarkdownLite>{item.content_md}</MarkdownLite>
                      <Pressable onPress={() => handleDelete(item)} style={styles.deleteRow}>
                        <Ionicons name="trash-outline" size={16} color={theme.error} />
                        <Text style={{ color: theme.error, fontFamily: fonts.bodySemiBold, fontSize: 13.5 }}>
                          Supprimer
                        </Text>
                      </Pressable>
                    </View>
                  ) : null}
                </View>
              );
            }}
          />
        )}
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  content: { flex: 1, padding: spacing.lg, gap: spacing.md },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  list: { gap: spacing.sm, paddingBottom: spacing.xl },
  card: { borderWidth: 1, borderRadius: radius.md, overflow: 'hidden' },
  cardHeader: { flexDirection: 'row', alignItems: 'center', gap: spacing.sm, padding: spacing.md },
  cardTitle: { fontFamily: fonts.bodySemiBold, fontSize: 15 },
  cardDate: { fontFamily: fonts.body, fontSize: 12.5, marginTop: 2 },
  cardBody: { borderTopWidth: 1, padding: spacing.md, gap: spacing.md },
  deleteRow: { flexDirection: 'row', alignItems: 'center', gap: spacing.xs, alignSelf: 'flex-start' },
});
