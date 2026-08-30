import { useEffect, useRef, useState } from 'react';
import {
  ActivityIndicator,
  KeyboardAvoidingView,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack, useLocalSearchParams } from 'expo-router';
import { useAiMessages, useSendTutorMessage, type AiMessage } from '../../hooks/queries/use-ai-tutor';
import { MarkdownLite } from '../../components/markdown-lite';
import { Input } from '../../components/ui/Input';
import { Button } from '../../components/ui/Button';
import { ErrorState } from '../../components/ui/ErrorState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

export default function AiChatConversation() {
  const theme = useAppTheme();
  const { id } = useLocalSearchParams<{ id: string }>();
  const isNew = id === 'new';
  const [conversationId, setConversationId] = useState<string | null>(isNew ? null : id ?? null);

  const messagesQuery = useAiMessages(conversationId ?? undefined);
  const sendMessage = useSendTutorMessage();

  const [messages, setMessages] = useState<AiMessage[]>([]);
  const seeded = useRef(false);
  const [draft, setDraft] = useState('');
  const [error, setError] = useState<string | null>(null);
  const scrollRef = useRef<ScrollView>(null);

  useEffect(() => {
    if (seeded.current || !conversationId || !messagesQuery.data) return;
    seeded.current = true;
    setMessages(messagesQuery.data);
  }, [conversationId, messagesQuery.data]);

  const headerOptions = {
    headerShown: true,
    title: 'Tuteur IA',
    headerStyle: { backgroundColor: theme.background },
    headerTintColor: theme.text,
  } as const;

  if (conversationId && messagesQuery.isLoading) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ActivityIndicator color={theme.primary} />
      </SafeAreaView>
    );
  }

  if (conversationId && messagesQuery.isError) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <ErrorState onRetry={() => messagesQuery.refetch()} />
      </SafeAreaView>
    );
  }

  async function handleSend() {
    const text = draft.trim();
    if (!text) return;
    setError(null);
    setDraft('');
    setMessages((prev) => [...prev, { id: `local-${Date.now()}`, role: 'user', content: text, created_at: new Date().toISOString() }]);

    try {
      const result = await sendMessage.mutateAsync({ conversationId: conversationId ?? undefined, message: text });
      setMessages((prev) => [
        ...prev,
        { id: `reply-${Date.now()}`, role: 'assistant', content: result.reply, created_at: new Date().toISOString() },
      ]);
      if (!conversationId) {
        setConversationId(result.conversationId);
        router.setParams({ id: result.conversationId });
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Le tuteur IA est indisponible pour le moment.');
    }
  }

  const isLocked = error?.toLowerCase().includes('essais gratuits');

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen options={headerOptions} />
      <KeyboardAvoidingView
        style={{ flex: 1 }}
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
        keyboardVerticalOffset={90}
      >
        <ScrollView
          ref={scrollRef}
          contentContainerStyle={styles.scroll}
          onContentSizeChange={() => scrollRef.current?.scrollToEnd({ animated: true })}
        >
          {messages.length === 0 ? (
            <Text style={[styles.empty, { color: theme.textMuted }]}>
              Pose une question sur ton programme, une leçon ou un exercice.
            </Text>
          ) : (
            messages.map((message) => (
              <View
                key={message.id}
                style={[
                  styles.bubble,
                  message.role === 'user'
                    ? { alignSelf: 'flex-end', backgroundColor: theme.primary }
                    : { alignSelf: 'flex-start', backgroundColor: theme.card, borderColor: theme.border, borderWidth: 1 },
                ]}
              >
                {message.role === 'assistant' ? (
                  <MarkdownLite>{message.content}</MarkdownLite>
                ) : (
                  <Text style={{ color: '#FFFFFF', fontFamily: fonts.body, fontSize: 15 }}>{message.content}</Text>
                )}
              </View>
            ))
          )}
          {sendMessage.isPending ? (
            <View style={[styles.bubble, { alignSelf: 'flex-start', backgroundColor: theme.card, borderColor: theme.border, borderWidth: 1 }]}>
              <ActivityIndicator color={theme.primary} size="small" />
            </View>
          ) : null}
        </ScrollView>

        {error ? (
          <View style={[styles.errorBanner, { backgroundColor: theme.primaryTint }]}>
            <Text style={{ color: theme.error, fontFamily: fonts.bodySemiBold, fontSize: 13.5, marginBottom: spacing.xs }}>
              {error}
            </Text>
            {isLocked ? <Button label="Passer Premium" onPress={() => router.push('/subscription')} /> : null}
          </View>
        ) : null}

        <View style={[styles.composer, { borderTopColor: theme.border }]}>
          <Input
            value={draft}
            onChangeText={setDraft}
            placeholder="Écris ta question…"
            multiline
            style={styles.input}
          />
          <Button label="Envoyer" disabled={!draft.trim() || sendMessage.isPending} onPress={handleSend} />
        </View>
      </KeyboardAvoidingView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  scroll: { padding: spacing.lg, gap: spacing.sm },
  empty: { fontFamily: fonts.body, fontSize: 14, textAlign: 'center', marginTop: spacing.xl },
  bubble: { maxWidth: '85%', borderRadius: radius.lg, padding: spacing.sm + 2 },
  errorBanner: { margin: spacing.md, padding: spacing.md, borderRadius: radius.md },
  composer: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    gap: spacing.sm,
    padding: spacing.md,
    borderTopWidth: 1,
  },
  input: { flex: 1, minHeight: 44, maxHeight: 100 },
});
