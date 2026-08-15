import { useEffect } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, {
  Easing,
  FadeIn,
  FadeOut,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withSequence,
  withTiming,
} from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol, IconSymbolName } from '@/components/ui/icon-symbol';
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

const RING_SIZE = 56;

// The spinning-ring-around-a-pulsing-icon motif already established by
// components/thinking-pill.tsx (AI chat) and the login screen's logo ring —
// reused here so "the app is working on something" reads consistently
// everywhere it happens, not as three different loading languages.
function LoadingBadge({ icon, color }: { icon: IconSymbolName; color: string }) {
  const rotation = useSharedValue(0);
  const pulse = useSharedValue(0);

  useEffect(() => {
    rotation.value = withRepeat(withTiming(360, { duration: 1100, easing: Easing.linear }), -1);
    pulse.value = withRepeat(withSequence(withTiming(1, { duration: 480 }), withTiming(0, { duration: 480 })), -1, true);
  }, [rotation, pulse]);

  const ringStyle = useAnimatedStyle(() => ({ transform: [{ rotate: `${rotation.value}deg` }] }));
  const iconStyle = useAnimatedStyle(() => ({ transform: [{ scale: 1 + pulse.value * 0.14 }] }));

  return (
    <View style={badgeStyles.stage}>
      <Animated.View style={[badgeStyles.ring, { borderTopColor: color, borderRightColor: color }, ringStyle]} />
      <Animated.View style={[badgeStyles.iconWrap, { backgroundColor: color }, iconStyle]}>
        <IconSymbol name={icon} size={20} color="#FFFFFF" />
      </Animated.View>
    </View>
  );
}

const badgeStyles = StyleSheet.create({
  stage: {
    alignSelf: 'center',
    width: RING_SIZE,
    height: RING_SIZE,
    alignItems: 'center',
    justifyContent: 'center',
  },
  ring: {
    position: 'absolute',
    width: RING_SIZE,
    height: RING_SIZE,
    borderRadius: RING_SIZE / 2,
    borderWidth: 2.5,
    borderColor: 'transparent',
  },
  iconWrap: {
    width: RING_SIZE - 20,
    height: RING_SIZE - 20,
    borderRadius: (RING_SIZE - 20) / 2,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

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
