import { useState } from 'react';
import { Pressable, SectionList, StyleSheet, TextInput, useColorScheme, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn, FadeOut, SlideInDown, SlideOutDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { ELEVATION, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY, Z_INDEX } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { ChatSessionSummary } from '@/lib/chat';

// A plain CSS percentage, not `useWindowDimensions().height * ratio` — that
// JS-computed pixel value depends on the dimensions hook resolving a real
// value the instant this component mounts (it's conditionally rendered from
// scratch every time it opens, via `if (!visible) return null` below), and
// this exact component has already caused two separate bugs from that
// timing (invisible-but-blocking on web, and never appearing on native).
// A percentage string is resolved by RN's own layout engine, with no JS
// timing dependency at all.
const SHEET_MAX_HEIGHT = '82%';

type SessionGroup = { title: string; data: ChatSessionSummary[] };

// Buckets sessions the way Gemini/ChatGPT do, by last activity — most
// recently active conversations surface at the top of "Aujourd'hui" rather
// than sitting wherever they were first created.
function groupSessionsByDate(sessions: ChatSessionSummary[]): SessionGroup[] {
  const now = new Date();
  const startOfToday = new Date(now.getFullYear(), now.getMonth(), now.getDate());
  const startOfYesterday = new Date(startOfToday);
  startOfYesterday.setDate(startOfYesterday.getDate() - 1);
  const sevenDaysAgo = new Date(startOfToday);
  sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);

  const buckets: SessionGroup[] = [
    { title: "Aujourd'hui", data: [] },
    { title: 'Hier', data: [] },
    { title: '7 derniers jours', data: [] },
    { title: 'Plus ancien', data: [] },
  ];

  for (const session of sessions) {
    const updatedAt = new Date(session.updatedAt);
    if (updatedAt >= startOfToday) {
      buckets[0].data.push(session);
    } else if (updatedAt >= startOfYesterday) {
      buckets[1].data.push(session);
    } else if (updatedAt >= sevenDaysAgo) {
      buckets[2].data.push(session);
    } else {
      buckets[3].data.push(session);
    }
  }

  return buckets.filter((group) => group.data.length > 0);
}

type ChatSidebarProps = {
  visible: boolean;
  onClose: () => void;
  sessions: ChatSessionSummary[];
  activeSessionId: string | null;
  onNewChat: () => void;
  onSelectSession: (id: string) => void;
  onRenameSession: (id: string, title: string) => void;
  onDeleteSession: (id: string) => void;
};

// Custom sliding panel rather than react-navigation's Drawer — this app's
// navigation is Stack-only (see app/_layout.tsx's Stack.Protected gating),
// so a real Drawer navigator would mean restructuring routing just for one
// screen. A conditionally-rendered absolute overlay + Reanimated slide gets
// the same result without touching the route tree.
export function ChatSidebar({
  visible,
  onClose,
  sessions,
  activeSessionId,
  onNewChat,
  onSelectSession,
  onRenameSession,
  onDeleteSession,
}: ChatSidebarProps) {
  const COLORS = useThemeColors();
  const scheme = useColorScheme();
  const [renamingSession, setRenamingSession] = useState<ChatSessionSummary | null>(null);
  const [deletingSession, setDeletingSession] = useState<ChatSessionSummary | null>(null);

  const styles = StyleSheet.create({
    overlay: {
      position: 'absolute',
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      zIndex: Z_INDEX.modal,
      justifyContent: 'flex-end',
    },
    backdrop: {
      position: 'absolute',
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      overflow: 'hidden',
    },
    backdropTint: {
      flex: 1,
      backgroundColor: scheme === 'dark' ? 'rgba(0,0,0,0.32)' : 'rgba(20,24,27,0.18)',
    },
    sheet: {
      maxHeight: SHEET_MAX_HEIGHT,
      backgroundColor: COLORS.surface,
      borderTopLeftRadius: 28,
      borderTopRightRadius: 28,
      ...ELEVATION.lg,
    },
    flex: {
      flex: 1,
    },
    grabber: {
      alignSelf: 'center',
      width: 40,
      height: 5,
      borderRadius: 3,
      backgroundColor: COLORS.borderStrong,
      marginTop: 10,
      marginBottom: 4,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.element,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.tight,
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    closeButton: {
      width: 32,
      height: 32,
      borderRadius: 16,
      alignItems: 'center',
      justifyContent: 'center',
    },
    newChatButton: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'center',
      gap: SPACING.tight,
      marginHorizontal: SPACING.element,
      marginBottom: SPACING.element,
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 12,
    },
    newChatText: {
      color: COLORS.accentText,
      fontWeight: '700',
      fontSize: 15,
    },
    listContent: {
      flexGrow: 1,
      paddingHorizontal: SPACING.tight,
      paddingBottom: SPACING.section,
    },
    groupLabel: {
      fontSize: 12,
      fontWeight: '700',
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      letterSpacing: 0.4,
      marginTop: SPACING.element,
      marginBottom: SPACING.xs,
      marginLeft: SPACING.tight,
    },
    emptyState: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center',
      paddingHorizontal: SPACING.section,
      paddingTop: SPACING.section,
      paddingBottom: SPACING.section,
      gap: SPACING.tight,
    },
    emptyIconBadge: {
      width: 56,
      height: 56,
      borderRadius: 28,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: 4,
    },
    emptyTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      textAlign: 'center',
    },
    emptyText: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  if (!visible) {
    return null;
  }

  const groups = groupSessionsByDate(sessions);

  return (
    <View style={styles.overlay}>
      <Animated.View entering={FadeIn.duration(220)} exiting={FadeOut.duration(200)} style={styles.backdrop}>
        <View style={styles.backdropTint} />
        <Pressable style={StyleSheet.absoluteFill} onPress={onClose} />
      </Animated.View>

      <Animated.View entering={SlideInDown.duration(300)} exiting={SlideOutDown.duration(240)} style={styles.sheet}>
        <SafeAreaView style={styles.flex} edges={['bottom']}>
          <View style={styles.grabber} />
          <View style={styles.header}>
            <ThemedText style={styles.headerTitle}>Discussions</ThemedText>
            <BouncyPressable style={styles.closeButton} onPress={onClose} hitSlop={8}>
              <IconSymbol name="xmark" size={18} color={COLORS.text} />
            </BouncyPressable>
          </View>

          <BouncyPressable style={styles.newChatButton} onPress={onNewChat}>
            <IconSymbol name="plus" size={18} color={COLORS.accentText} />
            <ThemedText style={styles.newChatText}>Nouvelle discussion</ThemedText>
          </BouncyPressable>

          <SectionList
            sections={groups}
            keyExtractor={(session) => session.id}
            contentContainerStyle={styles.listContent}
            renderSectionHeader={({ section }) => <ThemedText style={styles.groupLabel}>{section.title}</ThemedText>}
            renderItem={({ item }) => (
              <SessionRow
                session={item}
                active={item.id === activeSessionId}
                onPress={() => onSelectSession(item.id)}
                onRename={() => setRenamingSession(item)}
                onDelete={() => setDeletingSession(item)}
              />
            )}
            ListEmptyComponent={
              <View style={styles.emptyState}>
                <View style={styles.emptyIconBadge}>
                  <IconSymbol name="sparkles" size={26} color={COLORS.accent} />
                </View>
                <ThemedText style={styles.emptyTitle}>Pose ta première question à ton tuteur IA !</ThemedText>
                <ThemedText style={styles.emptyText}>Tes discussions apparaîtront ici, groupées par date.</ThemedText>
              </View>
            }
          />
        </SafeAreaView>
      </Animated.View>

      {renamingSession ? (
        <RenameDialog
          initialValue={renamingSession.title ?? ''}
          onCancel={() => setRenamingSession(null)}
          onConfirm={(title) => {
            onRenameSession(renamingSession.id, title);
            setRenamingSession(null);
          }}
        />
      ) : null}

      {deletingSession ? (
        <ConfirmDeleteDialog
          title={deletingSession.title || 'Nouvelle discussion'}
          onCancel={() => setDeletingSession(null)}
          onConfirm={() => {
            onDeleteSession(deletingSession.id);
            setDeletingSession(null);
          }}
        />
      ) : null}
    </View>
  );
}

type SessionRowProps = {
  session: ChatSessionSummary;
  active: boolean;
  onPress: () => void;
  onRename: () => void;
  onDelete: () => void;
};

function SessionRow({ session, active, onPress, onRename, onDelete }: SessionRowProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      borderRadius: RADIUS,
      paddingVertical: 10,
      paddingHorizontal: SPACING.tight,
      gap: SPACING.xs,
    },
    rowActive: {
      backgroundColor: COLORS.accentSoft,
    },
    title: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      flex: 1,
    },
    iconButton: {
      width: 28,
      height: 28,
      borderRadius: 14,
      alignItems: 'center',
      justifyContent: 'center',
    },
  });

  return (
    <BouncyPressable style={[styles.row, active && styles.rowActive]} onPress={onPress}>
      <ThemedText style={styles.title} numberOfLines={1}>
        {session.title || 'Nouvelle discussion'}
      </ThemedText>
      <BouncyPressable
        style={styles.iconButton}
        hitSlop={4}
        onPress={(event) => {
          event.stopPropagation();
          onRename();
        }}>
        <IconSymbol name="pencil" size={15} color={COLORS.mutedText} />
      </BouncyPressable>
      <BouncyPressable
        style={styles.iconButton}
        hitSlop={4}
        onPress={(event) => {
          event.stopPropagation();
          onDelete();
        }}>
        <IconSymbol name="trash.fill" size={15} color={COLORS.mutedText} />
      </BouncyPressable>
    </BouncyPressable>
  );
}

function useDialogStyles() {
  const COLORS = useThemeColors();
  return {
    COLORS,
    styles: StyleSheet.create({
      backdrop: {
        position: 'absolute',
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        backgroundColor: 'rgba(0,0,0,0.4)',
        alignItems: 'center',
        justifyContent: 'center',
        padding: SPACING.screen,
        zIndex: Z_INDEX.modal + 1,
      },
      card: {
        width: '100%',
        maxWidth: 360,
        backgroundColor: COLORS.surface,
        borderRadius: RADIUS,
        padding: SPACING.element,
        gap: SPACING.element,
        ...cardBorder(COLORS),
      },
      title: {
        ...TYPOGRAPHY.title,
        color: COLORS.text,
      },
      message: {
        ...TYPOGRAPHY.body,
        color: COLORS.mutedText,
      },
      input: {
        borderRadius: RADIUS,
        borderWidth: 1,
        borderColor: COLORS.borderStrong,
        paddingHorizontal: 14,
        paddingVertical: 10,
        fontSize: 16,
        color: COLORS.text,
      },
      actions: {
        flexDirection: 'row',
        justifyContent: 'flex-end',
        gap: SPACING.tight,
      },
      cancelButton: {
        paddingVertical: 10,
        paddingHorizontal: 16,
        borderRadius: PILL_RADIUS,
      },
      cancelText: {
        color: COLORS.mutedText,
        fontWeight: '700',
      },
      confirmButton: {
        paddingVertical: 10,
        paddingHorizontal: 16,
        borderRadius: PILL_RADIUS,
        backgroundColor: COLORS.accent,
      },
      confirmText: {
        color: COLORS.accentText,
        fontWeight: '700',
      },
    } as const),
  };
}

function RenameDialog({
  initialValue,
  onCancel,
  onConfirm,
}: {
  initialValue: string;
  onCancel: () => void;
  onConfirm: (title: string) => void;
}) {
  const [value, setValue] = useState(initialValue);
  const { COLORS, styles } = useDialogStyles();

  return (
    <Animated.View entering={FadeIn.duration(180)} exiting={FadeOut.duration(150)} style={styles.backdrop}>
      <View style={styles.card}>
        <ThemedText style={styles.title}>Renommer la discussion</ThemedText>
        <TextInput
          style={styles.input}
          value={value}
          onChangeText={setValue}
          placeholder="Titre de la discussion"
          placeholderTextColor={COLORS.placeholderText}
          autoFocus
        />
        <View style={styles.actions}>
          <BouncyPressable style={styles.cancelButton} onPress={onCancel}>
            <ThemedText style={styles.cancelText}>Annuler</ThemedText>
          </BouncyPressable>
          <BouncyPressable
            style={styles.confirmButton}
            onPress={() => {
              const trimmed = value.trim();
              if (trimmed) {
                onConfirm(trimmed);
              }
            }}>
            <ThemedText style={styles.confirmText}>Enregistrer</ThemedText>
          </BouncyPressable>
        </View>
      </View>
    </Animated.View>
  );
}

function ConfirmDeleteDialog({ title, onCancel, onConfirm }: { title: string; onCancel: () => void; onConfirm: () => void }) {
  const { COLORS, styles } = useDialogStyles();

  return (
    <Animated.View entering={FadeIn.duration(180)} exiting={FadeOut.duration(150)} style={styles.backdrop}>
      <View style={styles.card}>
        <ThemedText style={styles.title}>Supprimer la discussion ?</ThemedText>
        <ThemedText style={styles.message}>« {title} » sera définitivement supprimée.</ThemedText>
        <View style={styles.actions}>
          <BouncyPressable style={styles.cancelButton} onPress={onCancel}>
            <ThemedText style={styles.cancelText}>Annuler</ThemedText>
          </BouncyPressable>
          <BouncyPressable style={[styles.confirmButton, { backgroundColor: COLORS.danger }]} onPress={onConfirm}>
            <ThemedText style={styles.confirmText}>Supprimer</ThemedText>
          </BouncyPressable>
        </View>
      </View>
    </Animated.View>
  );
}
