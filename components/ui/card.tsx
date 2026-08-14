import { ReactNode } from 'react';
import { StyleProp, StyleSheet, View, ViewStyle } from 'react-native';

import { RADIUS, SPACING } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type CardProps = {
  children: ReactNode;
  style?: StyleProp<ViewStyle>;
  padding?: number;
};

export function Card({ children, style, padding = SPACING.element }: CardProps) {
  const COLORS = useThemeColors();

  return (
    <View
      style={[
        styles.base,
        { backgroundColor: COLORS.surface, padding },
        cardBorder(COLORS),
        style,
      ]}>
      {children}
    </View>
  );
}

const styles = StyleSheet.create({
  base: {
    borderRadius: RADIUS,
  },
});
