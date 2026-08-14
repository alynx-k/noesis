import { LinearGradient } from 'expo-linear-gradient';
import { useState } from 'react';
import { KeyboardAvoidingView, Modal, Platform, ScrollView, StyleSheet, TextInput, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { MessageActions } from '@/components/message-actions';
import { StreamingText } from '@/components/streaming-text';
import { ThemedText } from '@/components/themed-text';
import { ThinkingPill } from '@/components/thinking-pill';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { GRADIENTS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, ThemeColors, useThemeColors } from '@/hooks/use-theme-colors';
import { supabase } from '@/lib/supabase';

type ChatMessage = { role: 'user' | 'assistant'; content: string };

export type TutorContext =
  | { type: 'exercise'; courseId: string; questionNumber: number }
  | { type: 'fiche'; deckId: string };

// 'onGradient' is used inside the contextual sheet (see AiTutorChat below),
// which sits on top of GRADIENTS.hero — text/icons there need to read
// against a colorful background instead of the flat, theme-aware
// background the standalone IA tab uses.
type Tone = 'light' | 'onGradient';

function getToneStyles(COLORS: ThemeColors, tone: Tone) {
  return tone === 'light'
    ? { icon: COLORS.accent, emptyText: COLORS.mutedText, chipBorder: COLORS.accent, chipText: COLORS.accent }
    : {
        icon: COLORS.accentText,
        emptyText: 'rgba(255,255,255,0.9)',
        chipBorder: 'rgba(255,255,255,0.7)',
        chipText: COLORS.accentText,
      };
}

function getDefaultSuggestions(context: TutorContext | undefined): string[] {
  if (!context) {
    return [];
  }
  if (context.type === 'exercise') {
    return ['Explique-moi cette question', 'Donne-moi un exemple', 'Je suis bloqué, aide-moi'];
  }
  return ['Résume ce chapitre', 'Explique-moi ce point', 'Donne-moi un exemple'];
}

type AiTutorChatBodyProps = {
  context?: TutorContext;
  tone?: Tone;
  suggestions?: string[];
  // Extra bottom padding for the input row — the IA tab needs this to clear
  // the floating (position: absolute) tab bar; the Modal wrapper doesn't,
  // since its SafeAreaView already reserves the bottom inset.
  bottomInset?: number;
  // Opt-in persistence — only the standalone IA tab (app/ai-chat.tsx) passes
  // these, to resume/save a real conversation history. The contextual modal
  // helper (exercises, flashcard fiches) omits them and stays ephemeral by
  // design: it's scoped to one question/deck, not a conversation worth
  // resuming.
  initialMessages?: ChatMessage[];
  onMessage?: (message: ChatMessage) => void;
};

// Core chat UI, reusable both standalone (the IA tab, embedded directly in
// its own screen) and wrapped in a Modal (contextual help from exercises and
// flashcard fiches — see AiTutorChat below).
export function AiTutorChatBody({
  context,
  tone = 'light',
  suggestions = [],
  bottomInset = 0,
  initialMessages = [],
  onMessage,
}: AiTutorChatBodyProps) {
  const COLORS = useThemeColors();
  const [messages, setMessages] = useState<ChatMessage[]>(initialMessages);
  const [input, setInput] = useState('');
  const [sending, setSending] = useState(false);
  const [error, setError] = useState<string | null>(null);
  // Index of the message currently mid-stream (word-by-word reveal) — the
  // action row under it stays hidden until the reveal finishes, matching
  // Gemini's "icons appear once the answer is fully written" behavior.
  const [streamingIndex, setStreamingIndex] = useState<number | null>(null);
  // Index of the assistant message currently being regenerated in place —
  // shows the thinking pill where its text used to be, rather than a new
  // exchange appended at the bottom.
  const [regeneratingIndex, setRegeneratingIndex] = useState<number | null>(null);
  const toneStyles = getToneStyles(COLORS, tone);
  const busy = sending || regeneratingIndex !== null;

  const requestReply = async (conversation: ChatMessage[]): Promise<string | null> => {
    const { data, error: invokeError } = await supabase.functions.invoke('ai-tutor', {
      body: { messages: conversation, context },
    });
    if (invokeError || !data?.reply) {
      console.error('Failed to get tutor reply:', invokeError, data);
      return null;
    }
    return data.reply as string;
  };

  const sendMessage = async (text: string) => {
    if (!text || busy) {
      return;
    }

    setError(null);
    const userMessage: ChatMessage = { role: 'user', content: text };
    const updatedMessages: ChatMessage[] = [...messages, userMessage];
    setMessages(updatedMessages);
    onMessage?.(userMessage);
    setInput('');
    setSending(true);

    const reply = await requestReply(updatedMessages);
    setSending(false);

    if (!reply) {
      setError("Erreur pendant la réponse, réessaie.");
      return;
    }

    const assistantMessage: ChatMessage = { role: 'assistant', content: reply };
    setMessages((previous) => {
      const next = [...previous, assistantMessage];
      setStreamingIndex(next.length - 1);
      return next;
    });
    onMessage?.(assistantMessage);
  };

  const handleRegenerate = async (index: number) => {
    if (busy) {
      return;
    }

    setError(null);
    setRegeneratingIndex(index);
    // Everything before this reply, ending with the user question that
    // produced it — regenerating asks the same question again rather than
    // continuing the conversation past this point.
    const conversation = messages.slice(0, index);
    const reply = await requestReply(conversation);
    setRegeneratingIndex(null);

    if (!reply) {
      setError("Erreur pendant la réponse, réessaie.");
      return;
    }

    setMessages((previous) =>
      previous.map((message, i) => (i === index ? { role: 'assistant', content: reply } : message)),
    );
    setStreamingIndex(index);
  };

  const styles = StyleSheet.create({
    flex: {
      flex: 1,
    },
    messagesContent: {
      padding: SPACING.screen,
      paddingTop: 0,
      flexGrow: 1,
    },
    emptyState: {
      alignItems: 'center',
      gap: SPACING.tight,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.element,
    },
    emptyStateText: {
      ...TYPOGRAPHY.body,
      textAlign: 'center',
    },
    suggestionsRow: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'center',
      gap: SPACING.tight,
      marginTop: SPACING.tight,
    },
    suggestionChip: {
      borderWidth: 1.5,
      borderRadius: PILL_RADIUS,
      paddingVertical: 8,
      paddingHorizontal: 14,
    },
    suggestionChipText: {
      fontSize: 13,
      fontWeight: '700',
    },
    bubble: {
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      maxWidth: '85%',
    },
    bubbleUser: {
      backgroundColor: COLORS.accent,
      alignSelf: 'flex-end',
    },
    bubbleTextUser: {
      ...TYPOGRAPHY.body,
      color: COLORS.accentText,
    },
    // Bot replies render straight on the screen background — no card, no
    // border — full-width and left-aligned, Gemini-style.
    assistantBlock: {
      alignSelf: 'stretch',
      marginBottom: SPACING.tight,
    },
    bubbleTextAssistant: {
      ...TYPOGRAPHY.body,
      color: tone === 'light' ? COLORS.text : COLORS.accentText,
    },
    error: {
      color: COLORS.danger,
      marginTop: SPACING.tight,
    },
    inputRow: {
      flexDirection: 'row',
      alignItems: 'flex-end',
      gap: SPACING.tight,
      paddingHorizontal: SPACING.screen,
      paddingBottom: SPACING.tight,
      paddingTop: SPACING.tight,
      borderTopWidth: 1,
    },
    input: {
      flex: 1,
      minHeight: 44,
      maxHeight: 120,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      paddingHorizontal: 14,
      paddingVertical: 10,
      fontSize: 16,
      color: COLORS.text,
      ...cardBorder(COLORS),
    },
    sendButton: {
      width: 44,
      height: 44,
      borderRadius: PILL_RADIUS,
      backgroundColor: COLORS.accent,
      alignItems: 'center',
      justifyContent: 'center',
    },
    sendButtonDisabled: {
      opacity: 0.4,
    },
  });

  return (
    <KeyboardAvoidingView style={styles.flex} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
      <ScrollView
        style={styles.flex}
        contentContainerStyle={styles.messagesContent}
        keyboardShouldPersistTaps="handled">
        {messages.length === 0 ? (
          <View style={styles.emptyState}>
            <IconSymbol name="sparkles" size={28} color={toneStyles.icon} />
            <ThemedText style={[styles.emptyStateText, { color: toneStyles.emptyText }]}>
              Pose ta question, je suis là pour t&apos;aider à comprendre.
            </ThemedText>

            {suggestions.length > 0 ? (
              <View style={styles.suggestionsRow}>
                {suggestions.map((suggestion) => (
                  <BouncyPressable
                    key={suggestion}
                    style={[styles.suggestionChip, { borderColor: toneStyles.chipBorder }]}
                    onPress={() => sendMessage(suggestion)}>
                    <ThemedText style={[styles.suggestionChipText, { color: toneStyles.chipText }]}>
                      {suggestion}
                    </ThemedText>
                  </BouncyPressable>
                ))}
              </View>
            ) : null}
          </View>
        ) : null}

        {messages.map((message, index) => {
          if (message.role === 'user') {
            return (
              <View key={index} style={[styles.bubble, styles.bubbleUser]}>
                <ThemedText style={styles.bubbleTextUser}>{message.content}</ThemedText>
              </View>
            );
          }

          if (index === regeneratingIndex) {
            return (
              <View key={index} style={styles.assistantBlock}>
                <ThinkingPill />
              </View>
            );
          }

          const isStreaming = index === streamingIndex;

          return (
            <View key={index} style={styles.assistantBlock}>
              {isStreaming ? (
                <StreamingText
                  text={message.content}
                  style={styles.bubbleTextAssistant}
                  onComplete={() => setStreamingIndex((current) => (current === index ? null : current))}
                />
              ) : (
                <ThemedText style={styles.bubbleTextAssistant}>{message.content}</ThemedText>
              )}

              {!isStreaming ? (
                <Animated.View entering={FadeIn.duration(300)}>
                  <MessageActions text={message.content} onRegenerate={() => handleRegenerate(index)} />
                </Animated.View>
              ) : null}
            </View>
          );
        })}

        {sending ? (
          <Animated.View entering={FadeIn.duration(200)} exiting={FadeOut.duration(250)}>
            <ThinkingPill />
          </Animated.View>
        ) : null}

        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}
      </ScrollView>

      <View
        style={[
          styles.inputRow,
          { borderTopColor: tone === 'light' ? COLORS.border : 'rgba(255,255,255,0.3)' },
          bottomInset > 0 && { paddingBottom: SPACING.tight + bottomInset },
        ]}>
        <TextInput
          style={styles.input}
          multiline
          editable={!busy}
          placeholder="Écris ta question..."
          placeholderTextColor={COLORS.placeholderText}
          value={input}
          onChangeText={setInput}
        />
        <BouncyPressable
          style={[styles.sendButton, (!input.trim() || busy) && styles.sendButtonDisabled]}
          onPress={() => sendMessage(input.trim())}
          disabled={!input.trim() || busy}>
          <IconSymbol name="paperplane.fill" size={18} color={COLORS.accentText} />
        </BouncyPressable>
      </View>
    </KeyboardAvoidingView>
  );
}

type AiTutorChatProps = {
  visible: boolean;
  onClose: () => void;
  context?: TutorContext;
  title?: string;
};

// Full-screen sheet on a GRADIENTS.hero background — the same gradient as
// the home screen's focus-session card — for contextual help launched from
// exercises and flashcard fiches. Comes pre-loaded with quick suggestions
// matching the context, so the student doesn't have to figure out what to
// ask first. Uses the native 'pageSheet' presentation on iOS, which gives a
// swipe-down-to-dismiss gesture and rounded top corners for free, instead of
// a hand-rolled half-height sheet (which fought the safe-area/keyboard math
// on this RN version and kept leaving a stray white gap).
export function AiTutorChat({ visible, onClose, context, title = 'Tuteur IA' }: AiTutorChatProps) {
  const COLORS = useThemeColors();
  const suggestions = getDefaultSuggestions(context);

  const styles = StyleSheet.create({
    flex: {
      flex: 1,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.element,
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.accentText,
    },
    closeButton: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: 'rgba(255,255,255,0.25)',
      alignItems: 'center',
      justifyContent: 'center',
    },
  });

  return (
    <Modal
      visible={visible}
      animationType="slide"
      presentationStyle={Platform.OS === 'ios' ? 'pageSheet' : undefined}
      onRequestClose={onClose}>
      <LinearGradient colors={GRADIENTS.hero} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }} style={styles.flex}>
        <SafeAreaView style={styles.flex} edges={['top', 'bottom']}>
          <View style={styles.header}>
            <ThemedText style={styles.headerTitle}>{title}</ThemedText>
            <BouncyPressable style={styles.closeButton} onPress={onClose} hitSlop={8}>
              <IconSymbol name="checkmark" size={18} color={COLORS.accentText} />
            </BouncyPressable>
          </View>
          <AiTutorChatBody context={context} tone="onGradient" suggestions={suggestions} />
        </SafeAreaView>
      </LinearGradient>
    </Modal>
  );
}
