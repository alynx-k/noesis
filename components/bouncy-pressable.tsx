import { ReactNode } from 'react';
import { Pressable, PressableProps, StyleProp, ViewStyle } from 'react-native';
import Animated, { useAnimatedStyle, useSharedValue, withSpring } from 'react-native-reanimated';

const AnimatedPressable = Animated.createAnimatedComponent(Pressable);

type BouncyPressableProps = PressableProps & {
  children: ReactNode;
  style?: StyleProp<ViewStyle>;
};

export function BouncyPressable({ children, style, onPressIn, onPressOut, ...rest }: BouncyPressableProps) {
  const scale = useSharedValue(1);
  const depth = useSharedValue(0);

  const animatedStyle = useAnimatedStyle(() => ({
    transform: [{ scale: scale.value }, { translateY: depth.value }],
  }));

  return (
    <AnimatedPressable
      style={[style, animatedStyle]}
      onPressIn={(event) => {
        // A slight scale-down plus a 1px sink reads as a physical button
        // being pressed rather than a flat image shrinking.
        scale.value = withSpring(0.96, { damping: 15, stiffness: 420 });
        depth.value = withSpring(1, { damping: 15, stiffness: 420 });
        onPressIn?.(event);
      }}
      onPressOut={(event) => {
        scale.value = withSpring(1, { damping: 11, stiffness: 320 });
        depth.value = withSpring(0, { damping: 11, stiffness: 320 });
        onPressOut?.(event);
      }}
      {...rest}>
      {children}
    </AnimatedPressable>
  );
}
