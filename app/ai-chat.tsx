import { ActivityIndicator, FlatList, Pressable, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack } from 'expo-router';
import { useAiConversations } from '../hooks/queries/use-ai-tutor';
import { useSubscription } from '../hooks/queries/use-subscription';
import { useAuth } from '../context/auth';
import { AI_FREE_TRIAL_LIMIT } from '../constants/ai-tutor';
import { Button } from '../components/ui/Button';
import { ErrorState } from '../components/ui/ErrorState';
import { EmptyState } from '../components/ui/EmptyState';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

export default function AiChatHistory() {
  const theme = useAppTheme();
  const conversations = useAiConversations();
  const { isPremium } = useSubscription();
  const { profile } = useAuth();

  const trialsRemaining = isPremium ? null : Math.max(0, AI_FREE_TRIAL_LIMIT - (profile?.ai_trials_used ?? 0));
  const isLocked = !isPremium && trialsRemaining === 0;

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
        {!isPremium ? (
          <View style={[styles.banner, { backgroundColor: theme.primaryTint }]}>
            {isLocked ? (
              <>
                <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold, marginBottom: spacing.xs }}>
                  Essais gratuits épuisés
                </Text>
                <Text style={{ color: theme.text, fontFamily: fonts.body, fontSize: 13.5, marginBottom: spacing.sm }}>
                  Passe Premium pour continuer à discuter avec le tuteur IA sans limite.
                </Text>
                <Button label="Passer Premium" onPress={() => router.push('/subscription')} />
              </>
            ) : (
              <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold }}>
                {trialsRemaining} essai{trialsRemaining! > 1 ? 's' : ''} gratuit{trialsRemaining! > 1 ? 's' : ''} restant
                {trialsRemaining! > 1 ? 's' : ''}
              </Text>
            )}
          </View>
        ) : null}

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
  banner: { borderRadius: radius.md, padding: spacing.md },
  list: { gap: spacing.sm, paddingBottom: spacing.xl },
  row: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md },
  rowTitle: { fontFamily: fonts.bodySemiBold, fontSize: 14.5 },
});
