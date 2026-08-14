import { ActivityIndicator, StyleProp, StyleSheet, ViewStyle } from 'react-native';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS } from '@/constants/design';
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

  const variantStyles: Record<ButtonVariant, { container: ViewStyle; text: { color: string } }> = {
    primary: {
      container: { backgroundColor: COLORS.accent },
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
      disabled={isDisabled}>
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
  },
  label: {
    fontSize: 16,
    fontWeight: '700',
  },
  disabled: {
    opacity: 0.5,
  },
});
