import { ActivityIndicator, StyleSheet, View } from 'react-native';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
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
  onConfirm: () => void;
  onCancel: () => void;
};

// Generic yes/no confirmation overlay — a centered card on a dimmed
// backdrop, matching the app's existing dialog language (see
// components/chat-sidebar.tsx's rename/delete dialogs, which this
// generalizes so a second use site — settings.tsx's sign-out confirm —
// doesn't have to re-implement the same backdrop/card/button styling.
export function ConfirmDialog({
  visible,
  title,
  message,
  confirmLabel = 'Confirmer',
  cancelLabel = 'Annuler',
  destructive = false,
  loading = false,
  onConfirm,
  onCancel,
}: ConfirmDialogProps) {
  const COLORS = useThemeColors();

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
    message: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
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
      backgroundColor: destructive ? COLORS.danger : COLORS.accent,
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
      <View style={styles.card}>
        <ThemedText style={styles.title}>{title}</ThemedText>
        {message ? <ThemedText style={styles.message}>{message}</ThemedText> : null}
        <View style={styles.actions}>
          <BouncyPressable style={styles.cancelButton} onPress={onCancel} disabled={loading}>
            <ThemedText style={styles.cancelText}>{cancelLabel}</ThemedText>
          </BouncyPressable>
          <BouncyPressable style={styles.confirmButton} onPress={onConfirm} disabled={loading}>
            {loading ? <ActivityIndicator color={COLORS.accentText} /> : <ThemedText style={styles.confirmText}>{confirmLabel}</ThemedText>}
          </BouncyPressable>
        </View>
      </View>
    </Animated.View>
  );
}
