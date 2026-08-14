import { StyleProp, StyleSheet, View, ViewStyle } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type BadgeVariant = 'accent' | 'neutral' | 'success' | 'warning' | 'error';

type BadgeProps = {
  label: string;
  variant?: BadgeVariant;
  style?: StyleProp<ViewStyle>;
};

export function Badge({ label, variant = 'accent', style }: BadgeProps) {
  const COLORS = useThemeColors();

  const variantColors: Record<BadgeVariant, { background: string; text: string }> = {
    accent: { background: COLORS.accentSoft, text: COLORS.accent },
    neutral: { background: COLORS.lockedBackground, text: COLORS.mutedText },
    success: { background: '#2E7D321A', text: '#2E7D32' },
    warning: { background: '#ED6C021A', text: '#ED6C02' },
    error: { background: '#B3261E1A', text: '#B3261E' },
  };

  const { background, text } = variantColors[variant];

  return (
    <View style={[styles.base, { backgroundColor: background }, style]}>
      <ThemedText style={[styles.label, { color: text }]}>{label}</ThemedText>
    </View>
  );
}

const styles = StyleSheet.create({
  base: {
    borderRadius: PILL_RADIUS,
    paddingVertical: 4,
    paddingHorizontal: 10,
    alignSelf: 'flex-start',
  },
  label: {
    fontSize: 12,
    fontWeight: '700',
  },
});
