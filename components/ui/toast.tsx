import Ionicons from '@expo/vector-icons/Ionicons';
import { ReactNode, useEffect, useState } from 'react';
import { StyleSheet } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import Animated, {
  runOnJS,
  useAnimatedStyle,
  useSharedValue,
  withSpring,
  withTiming,
} from 'react-native-reanimated';

import { ThemedText } from '@/components/themed-text';
import { ELEVATION, PILL_RADIUS, SPACING, STATUS_COLORS, Z_INDEX } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type ToastVariant = 'default' | 'success' | 'error';

type ToastPayload = {
  message: string;
  variant: ToastVariant;
  duration: number;
};

// Module-scoped so any code — a mutation's onError handler, a lib/*.ts
// function, a screen — can trigger a toast without threading a prop down.
// The provider registers itself as the sink on mount.
let pushToast: ((payload: ToastPayload) => void) | null = null;

export const toast = {
  show(message: string, options?: { variant?: ToastVariant; duration?: number }) {
    pushToast?.({
      message,
      variant: options?.variant ?? 'default',
      duration: options?.duration ?? 2500,
    });
  },
};

const VARIANT_ICON: Record<ToastVariant, keyof typeof Ionicons.glyphMap> = {
  default: 'information-circle',
  success: 'checkmark-circle',
  error: 'alert-circle',
};

export function ToastProvider({ children }: { children: ReactNode }) {
  const COLORS = useThemeColors();
  const insets = useSafeAreaInsets();
  const [current, setCurrent] = useState<ToastPayload | null>(null);
  const translateY = useSharedValue(80);
  const opacity = useSharedValue(0);

  useEffect(() => {
    pushToast = (payload) => setCurrent(payload);
    return () => {
      pushToast = null;
    };
  }, []);

  useEffect(() => {
    if (!current) return;

    translateY.value = withSpring(0, { damping: 18, stiffness: 220 });
    opacity.value = withTiming(1, { duration: 200 });

    const timeout = setTimeout(() => {
      opacity.value = withTiming(0, { duration: 200 });
      translateY.value = withTiming(80, { duration: 200 }, (finished) => {
        if (finished) {
          runOnJS(setCurrent)(null);
        }
      });
    }, current.duration);

    return () => clearTimeout(timeout);
  }, [current, opacity, translateY]);

  const animatedStyle = useAnimatedStyle(() => ({
    opacity: opacity.value,
    transform: [{ translateY: translateY.value }],
  }));

  const variantColor = current
    ? current.variant === 'success'
      ? STATUS_COLORS.success
      : current.variant === 'error'
        ? STATUS_COLORS.error
        : COLORS.accent
    : COLORS.accent;

  return (
    <>
      {children}
      {current ? (
        <Animated.View
          pointerEvents="none"
          style={[
            styles.toast,
            ELEVATION.md,
            { backgroundColor: COLORS.surface, bottom: insets.bottom + 24 },
            animatedStyle,
          ]}>
          <Ionicons name={VARIANT_ICON[current.variant]} size={18} color={variantColor} />
          <ThemedText style={[styles.text, { color: COLORS.text }]}>{current.message}</ThemedText>
        </Animated.View>
      ) : null}
    </>
  );
}

const styles = StyleSheet.create({
  toast: {
    position: 'absolute',
    left: SPACING.screen,
    right: SPACING.screen,
    flexDirection: 'row',
    alignItems: 'center',
    gap: 10,
    borderRadius: PILL_RADIUS,
    paddingVertical: 12,
    paddingHorizontal: 18,
    zIndex: Z_INDEX.toast,
  },
  text: {
    fontSize: 14,
    fontWeight: '600',
    flexShrink: 1,
  },
});
