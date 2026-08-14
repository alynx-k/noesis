import { router } from 'expo-router';
import { StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { AiTutorChatBody } from '@/components/ai-tutor-chat';
import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonText } from '@/components/ui/skeleton';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useChatSession, useSaveChatMessage } from '@/hooks/queries/use-chat';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { ChatMessage } from '@/lib/chat';

export default function AiChatScreen() {
  const COLORS = useThemeColors();
  const sessionQuery = useChatSession();
  const saveMessage = useSaveChatMessage(sessionQuery.data?.sessionId);

  const handleMessage = (message: ChatMessage) => {
    saveMessage.mutate(message);
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
    backButton: {
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
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Assistant IA</ThemedText>
          <View style={styles.backButton} />
        </View>

        <View style={styles.actionsRow}>
          <BouncyPressable style={styles.actionCard} onPress={() => router.push('/homework')}>
            <View style={styles.actionIcon}>
              <IconSymbol name="doc.text.fill" size={16} color={COLORS.accent} />
            </View>
            <ThemedText style={styles.actionLabel}>Devoirs</ThemedText>
          </BouncyPressable>
        </View>

        {sessionQuery.isPending ? (
          <View style={styles.loadingArea}>
            <SkeletonText lines={3} />
          </View>
        ) : null}

        {sessionQuery.isError ? (
          <ErrorState
            title="Impossible de charger la conversation"
            onRetry={() => sessionQuery.refetch()}
          />
        ) : null}

        {sessionQuery.isSuccess ? (
          <AiTutorChatBody initialMessages={sessionQuery.data.messages} onMessage={handleMessage} />
        ) : null}
      </SafeAreaView>
    </ScreenBackground>
  );
}
