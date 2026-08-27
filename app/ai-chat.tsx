import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { useRef, useState } from 'react';
import { StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { AiTutorChatBody, HOME_TUTOR_SUGGESTIONS } from '@/components/ai-tutor-chat';
import { BouncyPressable } from '@/components/bouncy-pressable';
import { ChatSidebar } from '@/components/chat-sidebar';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonText } from '@/components/ui/skeleton';
import { GRADIENTS, SPACING, TYPOGRAPHY } from '@/constants/design';
import {
  useChatMessages,
  useChatSessions,
  useCreateChatSession,
  useDeleteChatSession,
  useRenameChatSession,
  useSaveChatMessage,
} from '@/hooks/queries/use-chat';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { ChatMessage, deriveSessionTitle } from '@/lib/chat';

// Wires the reusable chat body to a specific session's persistence: creates
// the session lazily on the first message (rather than eagerly on "+
// Nouvelle discussion", which would litter the sidebar with empty
// conversations the user never actually used), then saves every message
// after that. Deliberately keyed by the parent (see AiChatScreen) so
// switching sessions remounts this with fresh initialMessages instead of
// this component's own session id changing mid-conversation.
function ChatSessionView({
  initialSessionId,
  initialMessages,
}: {
  initialSessionId: string | null;
  initialMessages: ChatMessage[];
}) {
  const sessionIdRef = useRef(initialSessionId);
  const creatingRef = useRef<Promise<string> | null>(null);
  const createSession = useCreateChatSession();
  const saveMessage = useSaveChatMessage();
  const renameSession = useRenameChatSession();

  const ensureSessionId = async (firstMessageContent?: string): Promise<string> => {
    if (sessionIdRef.current) {
      return sessionIdRef.current;
    }
    if (!creatingRef.current) {
      creatingRef.current = createSession.mutateAsync().then((id) => {
        sessionIdRef.current = id;
        if (firstMessageContent) {
          renameSession.mutate({ sessionId: id, title: deriveSessionTitle(firstMessageContent) });
        }
        return id;
      });
    }
    return creatingRef.current;
  };

  const handleMessage = async (message: ChatMessage) => {
    try {
      const sessionId = await ensureSessionId(message.role === 'user' ? message.content : undefined);
      saveMessage.mutate({ sessionId, message });
    } catch (error) {
      console.error('Failed to create chat session:', error);
    }
  };

  return (
    <AiTutorChatBody
      initialMessages={initialMessages}
      onMessage={handleMessage}
      intro={{
        title: "Comment puis-je t'aider aujourd'hui ?",
        subtitle: "Pose une question, demande une explication, de l'aide pour un devoir ou révise un sujet.",
      }}
      popularSuggestions={HOME_TUTOR_SUGGESTIONS}
      onCorrectTextPress={() => router.push('/homework')}
    />
  );
}

export default function AiChatScreen() {
  const COLORS = useThemeColors();
  const [sidebarVisible, setSidebarVisible] = useState(false);
  // null = a fresh, unsaved conversation; a string = viewing that saved
  // session. Every visit to this screen starts a new draft rather than
  // resuming the last conversation — explicitly requested: reopening the
  // app used to always drop back into the same old thread.
  const [selectedSessionId, setSelectedSessionId] = useState<string | null>(null);
  const [draftNonce, setDraftNonce] = useState(0);

  const sessionsQuery = useChatSessions();
  const renameMutation = useRenameChatSession();
  const deleteMutation = useDeleteChatSession();

  const isNewDraft = selectedSessionId === null;
  const messagesQuery = useChatMessages(isNewDraft ? null : selectedSessionId);

  const handleNewChat = () => {
    setSelectedSessionId(null);
    setDraftNonce((n) => n + 1);
    setSidebarVisible(false);
  };

  const handleSelectSession = (id: string) => {
    setSelectedSessionId(id);
    setSidebarVisible(false);
  };

  const handleRenameSession = (id: string, title: string) => {
    renameMutation.mutate({ sessionId: id, title });
  };

  const handleDeleteSession = (id: string) => {
    deleteMutation.mutate(id);
    if (selectedSessionId === id) {
      setSelectedSessionId(null);
      setDraftNonce((n) => n + 1);
    }
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'flex-start',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.element,
    },
    headerButton: {
      width: 44,
      height: 44,
      borderRadius: 16,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
    },
    headerIconButtonsRow: {
      flexDirection: 'row',
      gap: SPACING.element,
      paddingTop: 10,
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    headerCenter: {
      flex: 1,
      alignItems: 'center',
    },
    headerBadge: {
      width: 48,
      height: 48,
      borderRadius: 16,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      fontSize: 22,
      color: COLORS.text,
    },
    headerSubtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginTop: 4,
    },
    loadingArea: {
      padding: SPACING.screen,
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.headerButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <View style={styles.headerCenter}>
            <LinearGradient colors={GRADIENTS.badgeAzure} style={[styles.headerBadge, { backgroundColor: GRADIENTS.badgeAzure[0] }]}>
              <IconSymbol name="text.bubble.fill" size={22} color="#FFFFFF" />
            </LinearGradient>
            <ThemedText style={styles.headerTitle}>Discuter avec l&apos;IA</ThemedText>
            <ThemedText style={styles.headerSubtitle}>Ton tuteur intelligent, toujours là pour t&apos;aider.</ThemedText>
          </View>
          <View style={styles.headerIconButtonsRow}>
            <BouncyPressable onPress={() => setSidebarVisible(true)} hitSlop={8}>
              <IconSymbol name="clock.arrow.circlepath" size={22} color={COLORS.text} />
            </BouncyPressable>
          </View>
        </View>

        {!isNewDraft && messagesQuery.isPending ? (
          <View style={styles.loadingArea}>
            <SkeletonText lines={3} />
          </View>
        ) : null}

        {!isNewDraft && messagesQuery.isError ? (
          <ErrorState title="Impossible de charger la conversation" onRetry={() => messagesQuery.refetch()} />
        ) : null}

        {isNewDraft || messagesQuery.isSuccess ? (
          <ChatSessionView
            key={isNewDraft ? `draft-${draftNonce}` : selectedSessionId}
            initialSessionId={isNewDraft ? null : (selectedSessionId as string)}
            initialMessages={isNewDraft ? [] : (messagesQuery.data ?? [])}
          />
        ) : null}
      </SafeAreaView>

      <ChatSidebar
        visible={sidebarVisible}
        onClose={() => setSidebarVisible(false)}
        sessions={sessionsQuery.data ?? []}
        activeSessionId={selectedSessionId}
        onNewChat={handleNewChat}
        onSelectSession={handleSelectSession}
        onRenameSession={handleRenameSession}
        onDeleteSession={handleDeleteSession}
      />
    </ScreenBackground>
  );
}
