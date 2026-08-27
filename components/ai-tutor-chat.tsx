import * as DocumentPicker from 'expo-document-picker';
import * as ImagePicker from 'expo-image-picker';
import { LinearGradient } from 'expo-linear-gradient';
import { useRef, useState } from 'react';
import {
  Alert,
  Image,
  KeyboardAvoidingView,
  Modal,
  NativeScrollEvent,
  NativeSyntheticEvent,
  Platform,
  ScrollView,
  StyleSheet,
  TextInput,
  View,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { MessageActions } from '@/components/message-actions';
import { StreamingText } from '@/components/streaming-text';
import { ThemedText } from '@/components/themed-text';
import { ThinkingPill } from '@/components/thinking-pill';
import { IconSymbol, IconSymbolName } from '@/components/ui/icon-symbol';
import { GRADIENTS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, ThemeColors, useThemeColors } from '@/hooks/use-theme-colors';
import { ChatMessage as PersistedChatMessage } from '@/lib/chat';
import { assetToDataUrl } from '@/lib/image-capture';
import { supabase } from '@/lib/supabase';

// The richer, in-flight message shape used only while a conversation is
// live in this component — content can carry an image for the model to
// look at. Persistence (lib/chat.ts, `chat_messages.content` is a plain
// text column) only ever stores the string form: onMessage always receives
// a PersistedChatMessage, never one of these with array content.
type ChatContentPart = { type: 'text'; text: string } | { type: 'image'; image: string };
type ChatMessage = { role: 'user' | 'assistant'; content: string | ChatContentPart[] };

// Staged by the quick-actions row before the next message is sent — cleared
// once sendMessage picks it up. Text files are inlined into the outgoing
// text (the tutor reads them as part of the question); images travel as a
// real image content part so the model can actually look at them.
type PendingAttachment = { kind: 'image'; dataUrl: string; previewUri: string } | { kind: 'file'; name: string; content: string };

const MAX_TEXT_FILE_CHARS = 6000;

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

// Shown above the input on the standalone IA tab (app/ai-chat.tsx), which
// has no exercise/fiche context to derive suggestions from — generic
// prompts that cover the tab's three stated use cases (question, devoir,
// révision) rather than leaving the input's empty state suggestion-less.
export const GENERAL_TUTOR_SUGGESTIONS = [
  'Explique-moi ce théorème',
  'Résume mon cours',
  'Aide-moi à réviser pour un contrôle',
];

// Always-visible "popular suggestions" cards shown above the conversation on
// the standalone IA tab (not the emptystate-only pills above) — 'glyph'
// suggestions render a literal character (Σ, EN) instead of an icon, for the
// two prompts where that's what the reference design actually shows.
export type PopularSuggestion = {
  id: string;
  label: string;
  badgeColor: string;
} & ({ kind: 'icon'; icon: IconSymbolName } | { kind: 'glyph'; glyph: string });

export const HOME_TUTOR_SUGGESTIONS: PopularSuggestion[] = [
  { id: 'fractions', label: 'Explique-moi les fractions', badgeColor: '#6D5BD0', kind: 'glyph', glyph: 'Σ' },
  { id: 'athenes', label: 'Résume la démocratie athénienne', badgeColor: '#1F9C55', kind: 'icon', icon: 'globe' },
  { id: 'physique', label: 'Aide-moi en physique', badgeColor: '#E8544F', kind: 'icon', icon: 'flask.fill' },
  { id: 'anglais', label: 'Corrige mon texte en anglais', badgeColor: '#3B82F6', kind: 'glyph', glyph: 'EN' },
];

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
  // Standalone-IA-tab-only: an always-visible intro card + popular-suggestion
  // cards above the conversation (not just in the empty state, unlike
  // `suggestions` above) — omitted by the contextual modal, which keeps the
  // simpler emptystate-only pills.
  intro?: { title: string; subtitle: string };
  popularSuggestions?: PopularSuggestion[];
  // "Corriger un texte" in the quick-actions row routes here instead of the
  // "coming soon" notice the other three (still-unbuilt) actions show — the
  // app already has a real homework-correction flow, this is just its entry
  // point moved to match the reference layout.
  onCorrectTextPress?: () => void;
  // Extra bottom padding for the input row — the IA tab needs this to clear
  // the floating (position: absolute) tab bar; the Modal wrapper doesn't,
  // since its SafeAreaView already reserves the bottom inset.
  bottomInset?: number;
  // Opt-in persistence — only the standalone IA tab (app/ai-chat.tsx) passes
  // these, to resume/save a real conversation history. The contextual modal
  // helper (exercises, flashcard fiches) omits them and stays ephemeral by
  // design: it's scoped to one question/deck, not a conversation worth
  // resuming.
  initialMessages?: PersistedChatMessage[];
  onMessage?: (message: PersistedChatMessage) => void;
};

function formatClockTime(date: Date): string {
  return date.toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' });
}

// Core chat UI, reusable both standalone (the IA tab, embedded directly in
// its own screen) and wrapped in a Modal (contextual help from exercises and
// flashcard fiches — see AiTutorChat below).
export function AiTutorChatBody({
  context,
  tone = 'light',
  suggestions = [],
  intro,
  popularSuggestions = [],
  onCorrectTextPress,
  bottomInset = 0,
  initialMessages = [],
  onMessage,
}: AiTutorChatBodyProps) {
  const COLORS = useThemeColors();
  const [messages, setMessages] = useState<ChatMessage[]>(initialMessages);
  const [input, setInput] = useState('');
  const [sending, setSending] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const scrollRef = useRef<ScrollView>(null);
  const [showScrollDown, setShowScrollDown] = useState(false);
  // Real "sent at" times, captured client-side the moment a message is
  // added this session — never fabricated for messages loaded from history,
  // which just render without a time rather than a made-up one.
  const [sentAt, setSentAt] = useState<Record<number, string>>({});
  const inputRef = useRef<TextInput>(null);
  // Index of the message currently mid-stream (word-by-word reveal) — the
  // action row under it stays hidden until the reveal finishes, matching
  // Gemini's "icons appear once the answer is fully written" behavior.
  const [streamingIndex, setStreamingIndex] = useState<number | null>(null);
  // Index of the assistant message currently being regenerated in place —
  // shows the thinking pill where its text used to be, rather than a new
  // exchange appended at the bottom.
  const [regeneratingIndex, setRegeneratingIndex] = useState<number | null>(null);
  const [pendingAttachment, setPendingAttachment] = useState<PendingAttachment | null>(null);
  const [attaching, setAttaching] = useState(false);
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

  const sendMessage = async (text: string, attachment: PendingAttachment | null = null) => {
    if ((!text && !attachment) || busy) {
      return;
    }

    setError(null);

    let content: ChatMessage['content'];
    let persistedContent: string;

    if (attachment?.kind === 'image') {
      const parts: ChatContentPart[] = [{ type: 'image', image: attachment.dataUrl }];
      if (text) {
        parts.push({ type: 'text', text });
      }
      content = parts;
      persistedContent = text ? `${text}\n\n[Image jointe]` : '[Image jointe]';
    } else if (attachment?.kind === 'file') {
      content = text
        ? `${text}\n\n[Fichier joint : ${attachment.name}]\n"""\n${attachment.content}\n"""`
        : `[Fichier joint : ${attachment.name}]\n"""\n${attachment.content}\n"""`;
      persistedContent = content;
    } else {
      content = text;
      persistedContent = text;
    }

    const userMessage: ChatMessage = { role: 'user', content };
    const updatedMessages: ChatMessage[] = [...messages, userMessage];
    setMessages(updatedMessages);
    setSentAt((previous) => ({ ...previous, [updatedMessages.length - 1]: formatClockTime(new Date()) }));
    onMessage?.({ role: 'user', content: persistedContent });
    setInput('');
    setPendingAttachment(null);
    setSending(true);

    const reply = await requestReply(updatedMessages);
    setSending(false);

    if (!reply) {
      setError("Erreur pendant la réponse, réessaie.");
      return;
    }

    const assistantMessage = { role: 'assistant' as const, content: reply };
    setMessages((previous) => {
      const next = [...previous, assistantMessage];
      setStreamingIndex(next.length - 1);
      setSentAt((times) => ({ ...times, [next.length - 1]: formatClockTime(new Date()) }));
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
    setSentAt((times) => ({ ...times, [index]: formatClockTime(new Date()) }));
    setStreamingIndex(index);
  };

  const stageImage = async (asset: ImagePicker.ImagePickerAsset) => {
    setAttaching(true);
    const dataUrl = await assetToDataUrl(asset);
    setAttaching(false);
    if (!dataUrl) {
      setError('Impossible de traiter cette image, réessaie.');
      return;
    }
    setPendingAttachment({ kind: 'image', dataUrl, previewUri: asset.uri });
  };

  const handleTakePhoto = async () => {
    const permission = await ImagePicker.requestCameraPermissionsAsync();
    if (!permission.granted) {
      setError("Autorisation caméra refusée.");
      return;
    }
    const result = await ImagePicker.launchCameraAsync({ quality: 0.7 });
    if (!result.canceled && result.assets[0]) {
      await stageImage(result.assets[0]);
    }
  };

  const handlePickImageFromLibrary = async () => {
    // On web, permission is a meaningless stub that always resolves
    // granted (there's no real browser permission for "media library") —
    // awaiting it first burns the click's user-activation window, which is
    // what the browser requires to let launchImageLibraryAsync open its
    // hidden file input. Skipping straight to it keeps the picker call in
    // the same tick as the tap.
    if (Platform.OS !== 'web') {
      const permission = await ImagePicker.requestMediaLibraryPermissionsAsync();
      if (!permission.granted) {
        setError('Autorisation galerie refusée.');
        return;
      }
    }
    const result = await ImagePicker.launchImageLibraryAsync({ quality: 0.7 });
    if (!result.canceled && result.assets[0]) {
      await stageImage(result.assets[0]);
    }
  };

  const handleSendImagePress = () => {
    if (busy || attaching) {
      return;
    }
    setError(null);
    // Alert.alert has no web implementation (silently does nothing there),
    // so the camera/gallery choice sheet only makes sense on native — web
    // goes straight to the file/gallery picker instead of doing nothing.
    if (Platform.OS === 'web') {
      handlePickImageFromLibrary();
      return;
    }
    Alert.alert('Envoyer une image', undefined, [
      { text: 'Prendre une photo', onPress: handleTakePhoto },
      { text: 'Choisir dans la galerie', onPress: handlePickImageFromLibrary },
      { text: 'Annuler', style: 'cancel' },
    ]);
  };

  const handleAttachFile = async () => {
    if (busy || attaching) {
      return;
    }
    setError(null);
    const result = await DocumentPicker.getDocumentAsync({
      type: ['text/plain', 'text/markdown', 'text/csv'],
      copyToCacheDirectory: true,
    });
    if (result.canceled || !result.assets[0]) {
      return;
    }
    const file = result.assets[0];
    if (!file.mimeType?.startsWith('text/')) {
      setError('Seuls les fichiers texte (.txt, .md) sont pris en charge pour le moment.');
      return;
    }
    setAttaching(true);
    try {
      const raw = await (await fetch(file.uri)).text();
      const truncated =
        raw.length > MAX_TEXT_FILE_CHARS ? `${raw.slice(0, MAX_TEXT_FILE_CHARS)}\n[...tronqué]` : raw;
      setPendingAttachment({ kind: 'file', name: file.name, content: truncated });
    } catch (readError) {
      console.error('Failed to read attached file:', readError);
      setError('Impossible de lire ce fichier, réessaie.');
    } finally {
      setAttaching(false);
    }
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
      backgroundColor: tone === 'light' ? '#E3DCF9' : COLORS.accent,
      alignSelf: 'flex-end',
    },
    bubbleTextUser: {
      ...TYPOGRAPHY.body,
      color: tone === 'light' ? COLORS.text : COLORS.accentText,
    },
    attachedImage: {
      width: 180,
      height: 180,
      borderRadius: RADIUS - 4,
      marginBottom: SPACING.tight,
    },
    attachmentPreviewRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginHorizontal: SPACING.screen,
      marginBottom: SPACING.tight,
      padding: SPACING.tight,
      borderRadius: RADIUS - 4,
      backgroundColor: COLORS.surface,
      ...cardBorder(COLORS),
    },
    attachmentPreviewImage: {
      width: 36,
      height: 36,
      borderRadius: 8,
    },
    attachmentPreviewIcon: {
      width: 36,
      height: 36,
      borderRadius: 8,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    attachmentPreviewText: {
      flex: 1,
      fontSize: 13,
      fontWeight: '600',
      color: COLORS.text,
    },
    attachmentRemoveButton: {
      width: 28,
      height: 28,
      borderRadius: 14,
      alignItems: 'center',
      justifyContent: 'center',
    },
    // Bot replies render straight on the screen background — no card, no
    // border — full-width and left-aligned, Gemini-style. (onGradient tone
    // only — the light/standalone tab uses assistantRow/assistantCard below.)
    assistantBlock: {
      alignSelf: 'stretch',
      marginBottom: SPACING.tight,
    },
    bubbleTextAssistant: {
      ...TYPOGRAPHY.body,
      color: tone === 'light' ? COLORS.text : COLORS.accentText,
    },
    timestampRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 4,
      alignSelf: 'flex-end',
      marginTop: 6,
    },
    timestampText: {
      fontSize: 11,
      color: COLORS.mutedText,
    },
    error: {
      color: COLORS.danger,
      marginTop: SPACING.tight,
    },
    introCard: {
      flexDirection: 'row',
      gap: SPACING.element,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.section,
      ...cardBorder(COLORS),
    },
    introIconBadge: {
      width: 44,
      height: 44,
      borderRadius: 14,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    introText: {
      flex: 1,
    },
    introTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 4,
    },
    introSubtitle: {
      fontSize: 13,
      lineHeight: 18,
      color: COLORS.mutedText,
    },
    popularTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    popularGrid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      gap: SPACING.tight,
      marginBottom: SPACING.section,
    },
    popularCard: {
      width: '47%',
      backgroundColor: COLORS.surface,
      borderRadius: 16,
      padding: SPACING.tight + 2,
      ...cardBorder(COLORS),
    },
    popularBadge: {
      width: 36,
      height: 36,
      borderRadius: 11,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
    },
    popularBadgeGlyph: {
      color: '#FFFFFF',
      fontWeight: '800',
      fontSize: 15,
    },
    popularLabel: {
      fontSize: 12.5,
      lineHeight: 16,
      fontWeight: '700',
      color: COLORS.text,
    },
    assistantRow: {
      flexDirection: 'row',
      alignItems: 'flex-start',
      gap: SPACING.tight,
      marginBottom: SPACING.tight,
    },
    assistantAvatar: {
      width: 32,
      height: 32,
      borderRadius: 11,
      backgroundColor: COLORS.accent,
      alignItems: 'center',
      justifyContent: 'center',
      marginTop: 2,
    },
    assistantCard: {
      flex: 1,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    scrollDownButton: {
      position: 'absolute',
      bottom: 10,
      alignSelf: 'center',
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      ...cardBorder(COLORS),
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
    plusButton: {
      width: 44,
      height: 44,
      borderRadius: PILL_RADIUS,
      backgroundColor: COLORS.lockedBackground,
      alignItems: 'center',
      justifyContent: 'center',
    },
    inputPillWrap: {
      flex: 1,
      flexDirection: 'row',
      alignItems: 'center',
      minHeight: 44,
      maxHeight: 120,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      paddingLeft: 14,
      paddingRight: 6,
      ...cardBorder(COLORS),
    },
    input: {
      flex: 1,
      paddingVertical: 10,
      fontSize: 16,
      color: COLORS.text,
    },
    inputStandalone: {
      minHeight: 44,
      maxHeight: 120,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      paddingHorizontal: 14,
      paddingVertical: 10,
      ...cardBorder(COLORS),
    },
    micButton: {
      width: 32,
      height: 32,
      borderRadius: 16,
      alignItems: 'center',
      justifyContent: 'center',
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
    quickActionsRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
    },
    quickActionButton: {
      flex: 1,
      alignItems: 'center',
      gap: 4,
      paddingVertical: SPACING.tight,
      borderRadius: 14,
      backgroundColor: COLORS.surface,
      ...cardBorder(COLORS),
    },
    quickActionLabel: {
      fontSize: 10.5,
      fontWeight: '600',
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  const handleScroll = (event: NativeSyntheticEvent<NativeScrollEvent>) => {
    const { contentOffset, contentSize, layoutMeasurement } = event.nativeEvent;
    const distanceFromBottom = contentSize.height - contentOffset.y - layoutMeasurement.height;
    setShowScrollDown(distanceFromBottom > 120);
  };

  // The bottom composer row's extra controls (attach/camera/voice) aren't
  // wired to anything real yet — surfacing that honestly through the
  // existing error banner rather than a silent no-op or a fake upload flow.
  const notifyComingSoon = () => setError('Bientôt disponible.');

  return (
    <KeyboardAvoidingView style={styles.flex} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
      <View style={styles.flex}>
        <ScrollView
          ref={scrollRef}
          style={styles.flex}
          contentContainerStyle={styles.messagesContent}
          keyboardShouldPersistTaps="handled"
          onScroll={handleScroll}
          scrollEventThrottle={100}>
          {tone === 'light' && intro ? (
            <View style={styles.introCard}>
              <View style={styles.introIconBadge}>
                <IconSymbol name="sparkles" size={20} color={COLORS.accent} />
              </View>
              <View style={styles.introText}>
                <ThemedText style={styles.introTitle}>{intro.title}</ThemedText>
                <ThemedText style={styles.introSubtitle}>{intro.subtitle}</ThemedText>
              </View>
            </View>
          ) : null}

          {tone === 'light' && popularSuggestions.length > 0 ? (
            <>
              <ThemedText style={styles.popularTitle}>Suggestions populaires</ThemedText>
              <View style={styles.popularGrid}>
                {popularSuggestions.map((item) => (
                  <BouncyPressable
                    key={item.id}
                    style={styles.popularCard}
                    onPress={() => sendMessage(item.label)}
                    disabled={busy}>
                    <View style={[styles.popularBadge, { backgroundColor: item.badgeColor }]}>
                      {item.kind === 'icon' ? (
                        <IconSymbol name={item.icon} size={18} color="#FFFFFF" />
                      ) : (
                        <ThemedText style={styles.popularBadgeGlyph}>{item.glyph}</ThemedText>
                      )}
                    </View>
                    <ThemedText style={styles.popularLabel} numberOfLines={2}>
                      {item.label}
                    </ThemedText>
                  </BouncyPressable>
                ))}
              </View>
            </>
          ) : null}

          {messages.length === 0 && !(tone === 'light' && intro) ? (
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
            const time = sentAt[index];

            if (message.role === 'user') {
              const textContent =
                typeof message.content === 'string'
                  ? message.content
                  : (message.content.find((part) => part.type === 'text') as { text: string } | undefined)?.text;
              const imagePart = Array.isArray(message.content)
                ? (message.content.find((part) => part.type === 'image') as { image: string } | undefined)
                : undefined;

              return (
                <View key={index} style={[styles.bubble, styles.bubbleUser]}>
                  {imagePart ? (
                    <Image source={{ uri: imagePart.image }} style={styles.attachedImage} resizeMode="cover" />
                  ) : null}
                  {textContent ? <ThemedText style={styles.bubbleTextUser}>{textContent}</ThemedText> : null}
                  {tone === 'light' && time ? (
                    <View style={styles.timestampRow}>
                      <ThemedText style={styles.timestampText}>{time}</ThemedText>
                      <IconSymbol name="checkmark" size={12} color={COLORS.mutedText} />
                    </View>
                  ) : null}
                </View>
              );
            }

            if (index === regeneratingIndex) {
              return tone === 'light' ? (
                <View key={index} style={styles.assistantRow}>
                  <View style={styles.assistantAvatar}>
                    <IconSymbol name="sparkles" size={16} color="#FFFFFF" />
                  </View>
                  <View style={styles.assistantCard}>
                    <ThinkingPill />
                  </View>
                </View>
              ) : (
                <View key={index} style={styles.assistantBlock}>
                  <ThinkingPill />
                </View>
              );
            }

            const isStreaming = index === streamingIndex;
            // Assistant replies are always plain text in practice (only
            // user turns can carry an image part) — narrowed here so
            // StreamingText/MessageActions, which take a string, type-check.
            const assistantText = typeof message.content === 'string' ? message.content : '';
            const body = (
              <>
                {isStreaming ? (
                  <StreamingText
                    text={assistantText}
                    style={styles.bubbleTextAssistant}
                    onComplete={() => setStreamingIndex((current) => (current === index ? null : current))}
                  />
                ) : (
                  <ThemedText style={styles.bubbleTextAssistant}>{assistantText}</ThemedText>
                )}
                {tone === 'light' && time && !isStreaming ? (
                  <ThemedText style={[styles.timestampText, { marginTop: 8 }]}>{time}</ThemedText>
                ) : null}
                {!isStreaming ? (
                  <Animated.View entering={FadeIn.duration(300)}>
                    <MessageActions text={assistantText} onRegenerate={() => handleRegenerate(index)} />
                  </Animated.View>
                ) : null}
              </>
            );

            return tone === 'light' ? (
              <View key={index} style={styles.assistantRow}>
                <View style={styles.assistantAvatar}>
                  <IconSymbol name="sparkles" size={16} color="#FFFFFF" />
                </View>
                <View style={styles.assistantCard}>{body}</View>
              </View>
            ) : (
              <View key={index} style={styles.assistantBlock}>
                {body}
              </View>
            );
          })}

          {sending ? (
            <Animated.View entering={FadeIn.duration(200)} exiting={FadeOut.duration(250)}>
              {tone === 'light' ? (
                <View style={styles.assistantRow}>
                  <View style={styles.assistantAvatar}>
                    <IconSymbol name="sparkles" size={16} color="#FFFFFF" />
                  </View>
                  <View style={styles.assistantCard}>
                    <ThinkingPill />
                  </View>
                </View>
              ) : (
                <ThinkingPill />
              )}
            </Animated.View>
          ) : null}

          {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}
        </ScrollView>

        {tone === 'light' && showScrollDown ? (
          <BouncyPressable
            style={styles.scrollDownButton}
            onPress={() => scrollRef.current?.scrollToEnd({ animated: true })}>
            <IconSymbol name="chevron.down" size={18} color={COLORS.text} />
          </BouncyPressable>
        ) : null}
      </View>

      {pendingAttachment ? (
        <View style={styles.attachmentPreviewRow}>
          {pendingAttachment.kind === 'image' ? (
            <Image source={{ uri: pendingAttachment.previewUri }} style={styles.attachmentPreviewImage} />
          ) : (
            <View style={styles.attachmentPreviewIcon}>
              <IconSymbol name="doc.text.fill" size={16} color={COLORS.accent} />
            </View>
          )}
          <ThemedText style={styles.attachmentPreviewText} numberOfLines={1}>
            {pendingAttachment.kind === 'image' ? 'Image jointe' : pendingAttachment.name}
          </ThemedText>
          <BouncyPressable style={styles.attachmentRemoveButton} onPress={() => setPendingAttachment(null)}>
            <IconSymbol name="xmark" size={14} color={COLORS.mutedText} />
          </BouncyPressable>
        </View>
      ) : null}

      <View
        style={[
          styles.inputRow,
          { borderTopColor: tone === 'light' ? COLORS.border : 'rgba(255,255,255,0.3)' },
          bottomInset > 0 && { paddingBottom: SPACING.tight + bottomInset },
        ]}>
        {tone === 'light' ? (
          <BouncyPressable style={styles.plusButton} onPress={notifyComingSoon}>
            <IconSymbol name="plus" size={20} color={COLORS.mutedText} />
          </BouncyPressable>
        ) : null}

        {tone === 'light' ? (
          <View style={styles.inputPillWrap}>
            <TextInput
              ref={inputRef}
              style={styles.input}
              multiline
              editable={!busy}
              placeholder="Pose ta question ici..."
              placeholderTextColor={COLORS.placeholderText}
              value={input}
              onChangeText={setInput}
            />
            <BouncyPressable style={styles.micButton} onPress={notifyComingSoon}>
              <IconSymbol name="mic.fill" size={16} color={COLORS.mutedText} />
            </BouncyPressable>
          </View>
        ) : (
          <TextInput
            style={styles.inputStandalone}
            multiline
            editable={!busy}
            placeholder="Écris ta question..."
            placeholderTextColor={COLORS.placeholderText}
            value={input}
            onChangeText={setInput}
          />
        )}
        <BouncyPressable
          style={[styles.sendButton, (!(input.trim() || pendingAttachment) || busy) && styles.sendButtonDisabled]}
          onPress={() => sendMessage(input.trim(), pendingAttachment)}
          disabled={!(input.trim() || pendingAttachment) || busy}>
          <IconSymbol name="paperplane.fill" size={18} color={COLORS.accentText} />
        </BouncyPressable>
      </View>

      {tone === 'light' ? (
        <View style={styles.quickActionsRow}>
          <BouncyPressable style={styles.quickActionButton} onPress={handleSendImagePress} disabled={busy || attaching}>
            <IconSymbol name="camera.fill" size={18} color={COLORS.mutedText} />
            <ThemedText style={styles.quickActionLabel}>Envoyer{'\n'}une image</ThemedText>
          </BouncyPressable>
          <BouncyPressable style={styles.quickActionButton} onPress={handleAttachFile} disabled={busy || attaching}>
            <IconSymbol name="paperclip" size={18} color={COLORS.mutedText} />
            <ThemedText style={styles.quickActionLabel}>Joindre{'\n'}un fichier</ThemedText>
          </BouncyPressable>
          <BouncyPressable style={styles.quickActionButton} onPress={onCorrectTextPress ?? notifyComingSoon}>
            <IconSymbol name="pencil" size={18} color={COLORS.mutedText} />
            <ThemedText style={styles.quickActionLabel}>Corriger{'\n'}un texte</ThemedText>
          </BouncyPressable>
          <BouncyPressable style={styles.quickActionButton} onPress={notifyComingSoon}>
            <IconSymbol name="mic.fill" size={18} color={COLORS.mutedText} />
            <ThemedText style={styles.quickActionLabel}>Enregistrer{'\n'}ma voix</ThemedText>
          </BouncyPressable>
        </View>
      ) : null}
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
