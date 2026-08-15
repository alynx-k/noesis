import { router } from 'expo-router';
import { useEffect, useRef, useState } from 'react';
import { StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { AiTutorChatBody, GENERAL_TUTOR_SUGGESTIONS } from '@/components/ai-tutor-chat';
import { BouncyPressable } from '@/components/bouncy-pressable';
import { ChatSidebar } from '@/components/chat-sidebar';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonText } from '@/components/ui/skeleton';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import {
  useChatMessages,
  useChatSessions,
  useCreateChatSession,
  useDeleteChatSession,
  useRenameChatSession,
  useSaveChatMessage,
} from '@/hooks/queries/use-chat';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
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
      suggestions={GENERAL_TUTOR_SUGGESTIONS}
    />
  );
}

export default function AiChatScreen() {
  const COLORS = useThemeColors();
  const [sidebarVisible, setSidebarVisible] = useState(false);
  // undefined = not yet decided (waiting on the session list to resolve
  // which conversation to resume); null = explicitly a fresh, unsaved
  // conversation; a string = viewing that session.
  const [selectedSessionId, setSelectedSessionId] = useState<string | null | undefined>(undefined);
  const [draftNonce, setDraftNonce] = useState(0);

  const sessionsQuery = useChatSessions();
  const renameMutation = useRenameChatSession();
  const deleteMutation = useDeleteChatSession();

  useEffect(() => {
    // Resume the most recently active conversation by default — same feel
    // as the old single-thread screen — rather than always opening blank.
    if (selectedSessionId === undefined && sessionsQuery.isSuccess) {
      setSelectedSessionId(sessionsQuery.data[0]?.id ?? null);
    }
  }, [selectedSessionId, sessionsQuery.isSuccess, sessionsQuery.data]);

  const isNewDraft = selectedSessionId === null;
  const isResolving = selectedSessionId === undefined || sessionsQuery.isPending;
  const messagesQuery = useChatMessages(isNewDraft ? null : (selectedSessionId ?? null));

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
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.tight,
    },
    headerButton: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    actionsRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      paddingHorizontal: SPACING.screen,
      paddingBottom: SPACING.element,
    },
    actionCard: {
      flex: 1,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      gap: SPACING.tight,
      ...cardBorder(COLORS),
    },
    actionIcon: {
      width: 32,
      height: 32,
      borderRadius: 16,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    actionLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
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
          <ThemedText style={styles.headerTitle}>Assistant IA</ThemedText>
          <BouncyPressable style={styles.headerButton} onPress={() => setSidebarVisible(true)} hitSlop={8}>
            <IconSymbol name="line.3.horizontal" size={18} color={COLORS.text} />
          </BouncyPressable>
        </View>

        <View style={styles.actionsRow}>
          <BouncyPressable style={styles.actionCard} onPress={() => router.push('/homework')}>
            <View style={styles.actionIcon}>
              <IconSymbol name="doc.text.fill" size={16} color={COLORS.accent} />
            </View>
            <ThemedText style={styles.actionLabel}>Devoirs</ThemedText>
          </BouncyPressable>
        </View>

        {isResolving ? (
          <View style={styles.loadingArea}>
            <SkeletonText lines={3} />
          </View>
        ) : null}

        {!isResolving && !isNewDraft && messagesQuery.isPending ? (
          <View style={styles.loadingArea}>
            <SkeletonText lines={3} />
          </View>
        ) : null}

        {!isResolving && !isNewDraft && messagesQuery.isError ? (
          <ErrorState title="Impossible de charger la conversation" onRetry={() => messagesQuery.refetch()} />
        ) : null}

        {!isResolving && (isNewDraft || messagesQuery.isSuccess) ? (
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
        activeSessionId={selectedSessionId ?? null}
        onNewChat={handleNewChat}
        onSelectSession={handleSelectSession}
        onRenameSession={handleRenameSession}
        onDeleteSession={handleDeleteSession}
      />
    </ScreenBackground>
  );
}
