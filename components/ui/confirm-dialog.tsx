import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { IconSymbolName } from '@/components/ui/icon-symbol';
import { LoadingBadge } from '@/components/ui/loading-badge';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY, Z_INDEX } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type ConfirmDialogProps = {
  visible: boolean;
  title: string;
  message?: string;
  confirmLabel?: string;
  cancelLabel?: string;
  destructive?: boolean;
  loading?: boolean;
  // Shown instead of title/message once loading — the confirm/cancel
  // buttons disappear entirely at that point (there's nothing left to
  // confirm or cancel), replaced by a spinning-ring + pulsing-icon badge
  // so waiting reads as "actively doing something" rather than a frozen
  // button. Defaults to reusing title/message if not given.
  loadingIcon?: IconSymbolName;
  loadingTitle?: string;
  loadingMessage?: string;
  onConfirm: () => void;
  onCancel: () => void;
};

// Generic confirm-then-(optionally slow) action overlay — a centered card
// on a dimmed backdrop, matching the app's existing dialog language (see
// components/chat-sidebar.tsx's rename/delete dialogs, which this
// generalizes so other confirm flows don't re-implement the same
// backdrop/card/button styling).
export function ConfirmDialog({
  visible,
  title,
  message,
  confirmLabel = 'Confirmer',
  cancelLabel = 'Annuler',
  destructive = false,
  loading = false,
  loadingIcon = 'checkmark.circle.fill',
  loadingTitle,
  loadingMessage,
  onConfirm,
  onCancel,
}: ConfirmDialogProps) {
  const COLORS = useThemeColors();
  const accentColor = destructive ? COLORS.danger : COLORS.accent;

  const styles = StyleSheet.create({
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
    titleCentered: {
      textAlign: 'center',
    },
    message: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
    messageCentered: {
      textAlign: 'center',
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
      minWidth: 96,
      alignItems: 'center',
      paddingVertical: 10,
      paddingHorizontal: 16,
      borderRadius: PILL_RADIUS,
      backgroundColor: accentColor,
    },
    confirmText: {
      color: COLORS.accentText,
      fontWeight: '700',
    },
  });

  if (!visible) {
    return null;
  }

  return (
    <Animated.View entering={FadeIn.duration(180)} exiting={FadeOut.duration(150)} style={styles.backdrop}>
      <Animated.View key={loading ? 'loading' : 'confirm'} entering={FadeIn.duration(160)} style={styles.card}>
        {loading ? (
          <>
            <LoadingBadge icon={loadingIcon} color={accentColor} />
            <ThemedText style={[styles.title, styles.titleCentered]}>{loadingTitle ?? title}</ThemedText>
            {loadingMessage || message ? (
              <ThemedText style={[styles.message, styles.messageCentered]}>{loadingMessage ?? message}</ThemedText>
            ) : null}
          </>
        ) : (
          <>
            <ThemedText style={styles.title}>{title}</ThemedText>
            {message ? <ThemedText style={styles.message}>{message}</ThemedText> : null}
            <View style={styles.actions}>
              <BouncyPressable style={styles.cancelButton} onPress={onCancel}>
                <ThemedText style={styles.cancelText}>{cancelLabel}</ThemedText>
              </BouncyPressable>
              <BouncyPressable style={styles.confirmButton} onPress={onConfirm}>
                <ThemedText style={styles.confirmText}>{confirmLabel}</ThemedText>
              </BouncyPressable>
            </View>
          </>
        )}
      </Animated.View>
    </Animated.View>
  );
}
