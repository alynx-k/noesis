import { useEffect } from 'react';
import Svg, { Defs, Ellipse, LinearGradient, Path, Stop } from 'react-native-svg';
import Animated, {
  cancelAnimation,
  Easing,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withSequence,
  withTiming,
} from 'react-native-reanimated';

type FlameIconProps = {
  size?: number;
  animated?: boolean;
};

// Glossy "sticker" style flame (layered gradient teardrops + a specular
// highlight + a grounding shadow) used for the streak badge — a flat emoji
// read as static, this reads as a small 3D object and gently flickers.
export function FlameIcon({ size = 32, animated = true }: FlameIconProps) {
  const flicker = useSharedValue(1);

  useEffect(() => {
    if (!animated) {
      return;
    }
    flicker.value = withRepeat(
      withSequence(
        withTiming(1.06, { duration: 620, easing: Easing.inOut(Easing.sin) }),
        withTiming(0.94, { duration: 620, easing: Easing.inOut(Easing.sin) }),
      ),
      -1,
      true,
    );
    // Cancel the infinite loop on unmount — see components/ui/skeleton.tsx
    // for why (a stray post-unmount style write on web throws a
    // CSSStyleDeclaration error).
    return () => cancelAnimation(flicker);
  }, [animated, flicker]);

  const wobbleStyle = useAnimatedStyle(() => ({
    transform: [{ scale: flicker.value }],
  }));

  const height = size * 1.2;

  return (
    <Animated.View style={[{ width: size, height }, wobbleStyle]}>
      <Svg width={size} height={height} viewBox="0 0 32 38">
        <Defs>
          <LinearGradient id="flameOuter" x1="0.2" y1="0" x2="0.8" y2="1">
            <Stop offset="0" stopColor="#FFB648" />
            <Stop offset="1" stopColor="#E8472B" />
          </LinearGradient>
          <LinearGradient id="flameInner" x1="0.2" y1="0" x2="0.8" y2="1">
            <Stop offset="0" stopColor="#FFE9A8" />
            <Stop offset="1" stopColor="#FFB648" />
          </LinearGradient>
        </Defs>
        <Ellipse cx="16" cy="34" rx="8" ry="2.4" fill="#000000" opacity="0.12" />
        <Path
          d="M16 2C16 2 26 14.5 26 23C26 29.0751 21.5228 34 16 34C10.4772 34 6 29.0751 6 23C6 14.5 16 2 16 2Z"
          fill="url(#flameOuter)"
        />
        <Path
          d="M16.5 12C16.5 12 21.5 19 21.5 24C21.5 27.3137 19.2614 30 16.5 30C13.7386 30 11.5 27.3137 11.5 24C11.5 19 16.5 12 16.5 12Z"
          fill="url(#flameInner)"
        />
        <Ellipse cx="13" cy="10" rx="2.4" ry="3.4" fill="#FFFFFF" opacity="0.55" />
      </Svg>
    </Animated.View>
  );
}
