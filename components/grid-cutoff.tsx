import { StyleSheet, useWindowDimensions, View } from 'react-native';

import { useThemeColors } from '@/hooks/use-theme-colors';

type GridCutoffProps = {
  // Fraction of the screen height where the grid stops and the solid cream
  // sheet begins — tuned by default to land right around the streak card's
  // bottom edge on Home.
  heightRatio?: number;
};

// Parkeur's home screen: the grid is left fully intact near the top (no
// fade), and a solid cream sheet covers the rest of the screen below it,
// meeting the grid via a rounded edge rather than a hard straight line.
// Must be mounted inside a <ScreenBackground>, alongside GridBackground —
// see screen-background.tsx for why.
export function GridCutoff({ heightRatio = 0.36 }: GridCutoffProps) {
  const colors = useThemeColors();
  const { height } = useWindowDimensions();

  return (
    <View
      style={[styles.sheet, { top: height * heightRatio, backgroundColor: colors.background }]}
      pointerEvents="none"
    />
  );
}

const styles = StyleSheet.create({
  sheet: {
    position: 'absolute',
    left: 0,
    right: 0,
    bottom: 0,
    borderTopLeftRadius: 40,
    borderTopRightRadius: 40,
  },
});
