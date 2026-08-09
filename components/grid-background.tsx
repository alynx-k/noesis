import { Dimensions, StyleSheet, View } from 'react-native';

import { useThemeColors } from '@/hooks/use-theme-colors';

const GRID_SIZE = 28;

// Subtle graph-paper texture behind screen content, Parkeur-style. Plain
// hairline Views rather than an image/SVG asset — cheap, no new asset to
// ship. Must be mounted inside a <ScreenBackground>, not directly inside a
// SafeAreaView — see screen-background.tsx for why.
export function GridBackground() {
  const colors = useThemeColors();
  const { width, height } = Dimensions.get('window');
  const columns = Math.ceil(width / GRID_SIZE);
  const rows = Math.ceil(height / GRID_SIZE);

  return (
    <View style={StyleSheet.absoluteFill} pointerEvents="none">
      {Array.from({ length: columns }).map((_, index) => (
        <View key={`v-${index}`} style={[styles.verticalLine, { left: index * GRID_SIZE, backgroundColor: colors.gridLine }]} />
      ))}
      {Array.from({ length: rows }).map((_, index) => (
        <View key={`h-${index}`} style={[styles.horizontalLine, { top: index * GRID_SIZE, backgroundColor: colors.gridLine }]} />
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  verticalLine: {
    position: 'absolute',
    top: 0,
    bottom: 0,
    width: StyleSheet.hairlineWidth,
  },
  horizontalLine: {
    position: 'absolute',
    left: 0,
    right: 0,
    height: StyleSheet.hairlineWidth,
  },
});
