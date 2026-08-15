import * as Haptics from 'expo-haptics';
import { ReactNode } from 'react';
import { Pressable, PressableProps, StyleProp, StyleSheet, ViewStyle } from 'react-native';

type BouncyPressableProps = PressableProps & {
  children: ReactNode;
  style?: StyleProp<ViewStyle>;
};

// Despite the name (kept as-is rather than renaming ~30 call sites across
// the app), this no longer scales/sinks on press — that spring-based
// animation read as an unwanted "liquid" jiggle on every single tap in the
// app, not a deliberate tactile detail. Down to a flat opacity dim (closer
// to the platform's own default Pressable feedback) plus the haptic tick it
// already had.
export function BouncyPressable({ children, style, onPressIn, ...rest }: BouncyPressableProps) {
  return (
    <Pressable
      style={({ pressed }) => [style, pressed && styles.pressed]}
      onPressIn={(event) => {
        if (process.env.EXPO_OS === 'ios') {
          Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light);
        }
        onPressIn?.(event);
      }}
      {...rest}>
      {children}
    </Pressable>
  );
}

const styles = StyleSheet.create({
  pressed: {
    opacity: 0.7,
  },
});
