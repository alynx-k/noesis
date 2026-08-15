import * as Haptics from 'expo-haptics';
import { ActivityIndicator, Pressable, StyleProp, StyleSheet, ViewStyle } from 'react-native';
import Animated, { useAnimatedStyle, useSharedValue, withTiming } from 'react-native-reanimated';

import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

const AnimatedPressable = Animated.createAnimatedComponent(Pressable);

type ButtonVariant = 'primary' | 'secondary' | 'ghost' | 'destructive';

type ButtonProps = {
  label: string;
  onPress: () => void;
  variant?: ButtonVariant;
  loading?: boolean;
  disabled?: boolean;
  style?: StyleProp<ViewStyle>;
};

// How far the button sinks on press, in px — also the resting
// borderBottomWidth, so pressing all the way down visually erases the "3D"
// edge exactly as it moves down to meet it (the Duolingo button mechanic).
const PRESS_DEPTH = 4;

function darken(hex: string, amount: number): string {
  const num = parseInt(hex.replace('#', ''), 16);
  const r = Math.max(0, Math.floor(((num >> 16) & 0xff) * (1 - amount)));
  const g = Math.max(0, Math.floor(((num >> 8) & 0xff) * (1 - amount)));
  const b = Math.max(0, Math.floor((num & 0xff) * (1 - amount)));
  return `#${((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1)}`;
}

export function Button({ label, onPress, variant = 'primary', loading = false, disabled = false, style }: ButtonProps) {
  const COLORS = useThemeColors();
  const isDisabled = disabled || loading;
  // 0 = resting (full depth) -> 1 = pressed flat against its own shadow edge.
  const press = useSharedValue(0);
  const shine = useSharedValue(-1);

  const shineStyle = useAnimatedStyle(() => ({
    transform: [{ translateX: shine.value * 140 }, { rotate: '20deg' }],
  }));

  const depthStyle = useAnimatedStyle(() => ({
    transform: [{ translateY: press.value * PRESS_DEPTH }],
    borderBottomWidth: PRESS_DEPTH - press.value * PRESS_DEPTH,
  }));

  const variants: Record<ButtonVariant, { container: ViewStyle; text: string; depth: boolean }> = {
    primary: {
      container: { backgroundColor: COLORS.accent, borderBottomColor: darken(COLORS.accent, 0.24) },
      text: COLORS.accentText,
      depth: true,
    },
    secondary: {
      container: {
        backgroundColor: COLORS.surface,
        borderWidth: 1.5,
        borderColor: COLORS.accent,
        borderBottomColor: COLORS.accent,
      },
      text: COLORS.accent,
      depth: true,
    },
    destructive: {
      container: { backgroundColor: COLORS.danger, borderBottomColor: darken(COLORS.danger, 0.24) },
      text: COLORS.accentText,
      depth: true,
    },
    ghost: {
      container: { backgroundColor: 'transparent' },
      text: COLORS.accent,
      depth: false,
    },
  };

  const { container, text, depth } = variants[variant];

  return (
    <AnimatedPressable
      style={[
        styles.base,
        container,
        depth && { borderBottomWidth: PRESS_DEPTH },
        depth && depthStyle,
        isDisabled && styles.disabled,
        style,
      ]}
      onPress={onPress}
      onPressIn={() => {
        if (isDisabled) {
          return;
        }
        if (depth) {
          press.value = withTiming(1, { duration: 80 });
        }
        if (variant === 'primary') {
          shine.value = -1;
          shine.value = withTiming(1, { duration: 450 });
        }
        if (process.env.EXPO_OS === 'ios') {
          Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light);
        }
      }}
      onPressOut={() => {
        press.value = withTiming(0, { duration: 120 });
      }}
      disabled={isDisabled}>
      {variant === 'primary' ? <Animated.View style={[styles.shine, shineStyle]} pointerEvents="none" /> : null}
      {loading ? <ActivityIndicator color={text} /> : <ThemedText style={[styles.label, { color: text }]}>{label}</ThemedText>}
    </AnimatedPressable>
  );
}

const styles = StyleSheet.create({
  base: {
    borderRadius: PILL_RADIUS,
    paddingVertical: 16,
    paddingHorizontal: 24,
    alignItems: 'center',
    justifyContent: 'center',
    overflow: 'hidden',
  },
  label: {
    fontSize: 16,
    fontWeight: '700',
  },
  disabled: {
    opacity: 0.5,
  },
  shine: {
    position: 'absolute',
    top: -20,
    bottom: -20,
    width: 40,
    left: '30%',
    backgroundColor: 'rgba(255,255,255,0.35)',
  },
});
