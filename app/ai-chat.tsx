import { ActivityIndicator, FlatList, Pressable, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack } from 'expo-router';
import { useAiConversations } from '../hooks/queries/use-ai-tutor';
import { useAiQuota } from '../hooks/use-ai-quota';
import { AiTrialBanner } from '../components/ai-trial-banner';
import { Button } from '../components/ui/Button';
import { ErrorState } from '../components/ui/ErrorState';
import { EmptyState } from '../components/ui/EmptyState';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

export default function AiChatHistory() {
  const theme = useAppTheme();
  const conversations = useAiConversations();
  const { isPremium, trialsRemaining, isLocked } = useAiQuota();

  function handleNewConversation() {
    router.push(isLocked ? '/subscription' : { pathname: '/ai-chat/[id]', params: { id: 'new' } });
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: 'Tuteur IA',
          headerStyle: { backgroundColor: theme.background },
          headerTintColor: theme.text,
        }}
      />
      <View style={styles.content}>
        <AiTrialBanner isPremium={isPremium} trialsRemaining={trialsRemaining} isLocked={isLocked} />

        <View style={styles.quickActions}>
          <Pressable
            onPress={() => router.push(isLocked ? '/subscription' : '/correct-homework')}
            style={[styles.actionCard, { backgroundColor: theme.card, borderColor: theme.border }]}
          >
            <Text style={[styles.actionTitle, { color: theme.text }]}>Corriger un devoir</Text>
            <Text style={[styles.actionBody, { color: theme.textMuted }]}>Photo d'un devoir déjà fait</Text>
          </Pressable>
          <Pressable
            onPress={() => router.push(isLocked ? '/subscription' : '/prepare-homework')}
            style={[styles.actionCard, { backgroundColor: theme.card, borderColor: theme.border }]}
          >
            <Text style={[styles.actionTitle, { color: theme.text }]}>Préparer un devoir</Text>
            <Text style={[styles.actionBody, { color: theme.textMuted }]}>Photo d'un énoncé à faire</Text>
          </Pressable>
        </View>

        <Button label="+ Nouvelle conversation" onPress={handleNewConversation} />

        {conversations.isLoading ? (
          <View style={styles.center}>
            <ActivityIndicator color={theme.primary} />
          </View>
        ) : conversations.isError ? (
          <ErrorState onRetry={() => conversations.refetch()} />
        ) : (conversations.data ?? []).length === 0 ? (
          <EmptyState
            title="Aucune conversation"
            message="Pose ta première question au tuteur IA pour commencer."
          />
        ) : (
          <FlatList
            data={conversations.data}
            keyExtractor={(item) => item.id}
            contentContainerStyle={styles.list}
            renderItem={({ item }) => (
              <Pressable
                onPress={() => router.push({ pathname: '/ai-chat/[id]', params: { id: item.id } })}
                style={[styles.row, { backgroundColor: theme.card, borderColor: theme.border }]}
              >
                <Text style={[styles.rowTitle, { color: theme.text }]} numberOfLines={1}>
                  {item.title}
                </Text>
              </Pressable>
            )}
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
  quickActions: { flexDirection: 'row', gap: spacing.sm },
  actionCard: { flex: 1, borderWidth: 1, borderRadius: radius.md, padding: spacing.md, gap: spacing.xs },
  actionTitle: { fontFamily: fonts.bodySemiBold, fontSize: 14 },
  actionBody: { fontFamily: fonts.body, fontSize: 12.5 },
  list: { gap: spacing.sm, paddingBottom: spacing.xl },
  row: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md },
  rowTitle: { fontFamily: fonts.bodySemiBold, fontSize: 14.5 },
});
