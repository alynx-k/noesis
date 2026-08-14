import { ReactNode } from 'react';
import { ScrollView, ScrollViewProps, StyleProp, StyleSheet, View, ViewStyle } from 'react-native';
import { Edge, SafeAreaView } from 'react-native-safe-area-context';

import { ScreenBackground } from '@/components/screen-background';
import { SPACING } from '@/constants/design';

type ScreenProps = {
  children: ReactNode;
  scroll?: boolean;
  edges?: Edge[];
  padded?: boolean;
  style?: StyleProp<ViewStyle>;
  contentContainerStyle?: ScrollViewProps['contentContainerStyle'];
  color?: string;
};

// Standardizes the app's default screen root — a uniform cream/dark
// background + SafeAreaView + optional scroll — so every screen shares the
// same flat background instead of each re-deriving it.
export function Screen({
  children,
  scroll = false,
  edges = ['top', 'bottom'],
  padded = true,
  style,
  contentContainerStyle,
  color,
}: ScreenProps) {
  const padding = padded ? SPACING.screen : 0;

  return (
    <ScreenBackground color={color}>
      <SafeAreaView style={styles.safeArea} edges={edges}>
        {scroll ? (
          <ScrollView
            contentContainerStyle={[{ padding }, contentContainerStyle]}
            keyboardShouldPersistTaps="handled">
            {children}
          </ScrollView>
        ) : (
          <View style={[{ flex: 1, padding }, style]}>{children}</View>
        )}
      </SafeAreaView>
    </ScreenBackground>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
  },
});
