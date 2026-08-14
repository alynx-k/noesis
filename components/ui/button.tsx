import { ActivityIndicator, StyleProp, StyleSheet, ViewStyle } from 'react-native';
import Animated, { useAnimatedStyle, useSharedValue, withTiming } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { ELEVATION, PILL_RADIUS } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type ButtonVariant = 'primary' | 'secondary' | 'ghost' | 'destructive';

type ButtonProps = {
  label: string;
  onPress: () => void;
  variant?: ButtonVariant;
  loading?: boolean;
  disabled?: boolean;
  style?: StyleProp<ViewStyle>;
};

export function Button({ label, onPress, variant = 'primary', loading = false, disabled = false, style }: ButtonProps) {
  const COLORS = useThemeColors();
  const isDisabled = disabled || loading;
  // Diagonal shine sweep on press — the interaction-driven equivalent of the
  // website's .btn-primary hover sweep (mobile has no hover, only press).
  const shine = useSharedValue(-1);

  const shineStyle = useAnimatedStyle(() => ({
    transform: [{ translateX: shine.value * 140 }, { rotate: '20deg' }],
  }));

  const variantStyles: Record<ButtonVariant, { container: ViewStyle; text: { color: string } }> = {
    primary: {
      container: { backgroundColor: COLORS.accent, ...ELEVATION.sm, shadowColor: COLORS.accent },
      text: { color: COLORS.accentText },
    },
    secondary: {
      container: { backgroundColor: 'transparent', borderWidth: 1.5, borderColor: COLORS.accent },
      text: { color: COLORS.accent },
    },
    ghost: {
      container: { backgroundColor: 'transparent' },
      text: { color: COLORS.accent },
    },
    destructive: {
      container: { backgroundColor: COLORS.danger },
      text: { color: COLORS.accentText },
    },
  };

  const { container, text } = variantStyles[variant];

  return (
    <BouncyPressable
      style={[styles.base, container, isDisabled && styles.disabled, style]}
      onPress={onPress}
      onPressIn={() => {
        if (variant !== 'primary') return;
        shine.value = -1;
        shine.value = withTiming(1, { duration: 450 });
      }}
      disabled={isDisabled}>
      {variant === 'primary' ? (
        <Animated.View style={[styles.shine, shineStyle]} pointerEvents="none" />
      ) : null}
      {loading ? (
        <ActivityIndicator color={text.color} />
      ) : (
        <ThemedText style={[styles.label, text]}>{label}</ThemedText>
      )}
    </BouncyPressable>
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
