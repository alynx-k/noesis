import { BlurView } from 'expo-blur';
import { ReactNode } from 'react';
import { Platform, StyleSheet, useColorScheme, View } from 'react-native';

import { useThemeColors } from '@/hooks/use-theme-colors';

type FloatingBarProps = {
  children: ReactNode;
};

// Every usage lives inside a SafeAreaView (edges include 'bottom'), which
// already pads for the home indicator / gesture area. Adding
// useSafeAreaInsets() here too would double that padding.
export function FloatingBar({ children }: FloatingBarProps) {
  const colors = useThemeColors();
  const scheme = useColorScheme();

  return (
    <View style={styles.wrapper} pointerEvents="box-none">
      <BlurView
        intensity={70}
        tint={scheme === 'dark' ? 'dark' : 'light'}
        experimentalBlurMethod={Platform.OS === 'android' ? 'dimezisBlurView' : undefined}
        style={[styles.blur, { borderTopColor: colors.border }]}>
        {children}
      </BlurView>
    </View>
  );
}

const styles = StyleSheet.create({
  wrapper: {
    position: 'absolute',
    left: 0,
    right: 0,
    bottom: 0,
  },
  blur: {
    paddingTop: 12,
    paddingBottom: 12,
    paddingHorizontal: 24,
    borderTopWidth: StyleSheet.hairlineWidth,
    overflow: 'hidden',
  },
});
