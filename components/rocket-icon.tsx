import { useEffect } from 'react';
import Svg, { Circle, Defs, Ellipse, LinearGradient, Path, Stop } from 'react-native-svg';
import Animated, { Easing, useAnimatedStyle, useSharedValue, withRepeat, withSequence, withTiming } from 'react-native-reanimated';

type RocketIconProps = {
  size?: number;
  // Subtle continuous hover bob + wobble, for a "3D toy" feel on hero
  // placements (Home's focus card, the idle launch preview). Off by
  // default so static grids (garden, stat cards) stay calm.
  floating?: boolean;
};

function RocketSvg({ size }: { size: number }) {
  const height = size * 1.4;

  return (
    <Svg width={size} height={height} viewBox="0 0 44 62">
      <Defs>
        <LinearGradient id="rocketBody" x1="0" y1="0" x2="1" y2="1">
          <Stop offset="0" stopColor="#F2C879" />
          <Stop offset="1" stopColor="#7C6FE0" />
        </LinearGradient>
      </Defs>
      <Ellipse cx="22" cy="59" rx="10" ry="2.4" fill="#000000" opacity="0.1" />
      <Path d="M22 48 C17 54, 17 61, 22 61 C27 61, 27 54, 22 48 Z" fill="#F2994A" />
      <Path d="M13 38 L2 53 L15 47 Z" fill="#5B4FC7" />
      <Path d="M31 38 L42 53 L29 47 Z" fill="#5B4FC7" />
      <Path d="M22 0 C33 9, 33 33, 29 45 L15 45 C11 33, 11 9, 22 0 Z" fill="url(#rocketBody)" />
      <Path d="M22 0 C26 5, 28 14, 27 24 L23 24 C23.5 15, 22.5 6, 20 1 Z" fill="#FFFFFF" opacity="0.18" />
      <Circle cx="22" cy="19" r="6.5" fill="#FFFFFF" />
      <Circle cx="22" cy="19" r="4.2" fill="#8FE3A8" />
      <Circle cx="20" cy="17" r="1.4" fill="#FFFFFF" opacity="0.7" />
    </Svg>
  );
}

export function RocketIcon({ size = 44, floating = false }: RocketIconProps) {
  const bob = useSharedValue(0);

  useEffect(() => {
    if (!floating) {
      return;
    }
    bob.value = withRepeat(
      withSequence(
        withTiming(1, { duration: 1400, easing: Easing.inOut(Easing.sin) }),
        withTiming(0, { duration: 1400, easing: Easing.inOut(Easing.sin) }),
      ),
      -1,
      true,
    );
  }, [floating, bob]);

  const hoverStyle = useAnimatedStyle(() => ({
    transform: [{ translateY: -bob.value * 4 }, { rotate: `${(bob.value - 0.5) * 4}deg` }],
  }));

  if (!floating) {
    return <RocketSvg size={size} />;
  }

  return (
    <Animated.View style={hoverStyle}>
      <RocketSvg size={size} />
    </Animated.View>
  );
}
