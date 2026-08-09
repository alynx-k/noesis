import { ReactNode } from 'react';
import { StyleSheet, View } from 'react-native';

import { useThemeColors } from '@/hooks/use-theme-colors';

type ScreenBackgroundProps = {
  color?: string;
  children: ReactNode;
};

// The true root of every screen — spans the full physical device screen,
// unlike SafeAreaView, whose internal padding shrinks the box its children
// fill. Put SafeAreaView *inside* this, not the other way around: a
// decorative background (grid, night sky) mounted inside SafeAreaView stops
// at the safe-area padding, exposing a sliver of the navigator's own
// background color (white/black, not the screen's own color) right at the
// true top/bottom edges.
export function ScreenBackground({ color, children }: ScreenBackgroundProps) {
  const colors = useThemeColors();
  return <View style={[styles.root, { backgroundColor: color ?? colors.background }]}>{children}</View>;
}

const styles = StyleSheet.create({
  root: {
    flex: 1,
  },
});
