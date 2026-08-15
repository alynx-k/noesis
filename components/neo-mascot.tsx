import { useEffect } from 'react';
import Svg, { Defs, Ellipse, LinearGradient, Path, Stop } from 'react-native-svg';
import Animated, { Easing, useAnimatedStyle, useSharedValue, withRepeat, withSequence, withTiming } from 'react-native-reanimated';

type NeoMascotProps = {
  size?: number;
  // Continuous idle bob, matching RocketIcon's `floating` — off by default
  // so static placements (e.g. a settled row) don't wobble.
  floating?: boolean;
};

// Neo, Noesis's mascot — a chibi black panther drawn in the same rounded,
// big-eyed "plush toy" language as Duolingo's Duo (single rounded body
// silhouette, oversized white eyes with dark pupils + a specular highlight,
// stubby side arms, small round ears) rather than the more literal/angular
// panther silhouette MascotPanther (home-widget-preview.tsx) used. A
// code-drawn placeholder — swap the body of this component for a Lottie
// <LottieView> or an illustrated asset once real artwork for Neo exists;
// every caller only ever renders <NeoMascot>, so nothing else changes.
export function NeoMascot({ size = 120, floating = false }: NeoMascotProps) {
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

  const bobStyle = useAnimatedStyle(() => ({
    transform: [{ translateY: -bob.value * 5 }],
  }));

  const height = size * (150 / 140);

  return (
    <Animated.View style={[{ width: size, height }, bobStyle]}>
      <Svg width={size} height={height} viewBox="0 0 140 150">
        <Defs>
          <LinearGradient id="neoBody" x1="0.3" y1="0" x2="0.7" y2="1">
            <Stop offset="0" stopColor="#24262E" />
            <Stop offset="1" stopColor="#101116" />
          </LinearGradient>
        </Defs>

        {/* Tail */}
        <Path
          d="M108 118 C 124 112, 132 96, 122 84 C 130 98, 124 112, 106 116 Z"
          fill="url(#neoBody)"
        />

        {/* Side arms */}
        <Ellipse cx="23" cy="98" rx="11" ry="15" fill="url(#neoBody)" transform="rotate(-18 23 98)" />
        <Ellipse cx="117" cy="98" rx="11" ry="15" fill="url(#neoBody)" transform="rotate(18 117 98)" />

        {/* Ears */}
        <Ellipse cx="46" cy="39" rx="14" ry="14" fill="url(#neoBody)" />
        <Ellipse cx="94" cy="39" rx="14" ry="14" fill="url(#neoBody)" />

        {/* Body */}
        <Path
          d="M70 30
             C 100 30, 120 52, 120 82
             C 120 112, 98 130, 70 130
             C 42 130, 20 112, 20 82
             C 20 52, 40 30, 70 30 Z"
          fill="url(#neoBody)"
        />

        {/* Muzzle */}
        <Ellipse cx="70" cy="96" rx="23" ry="16" fill="#2E313B" />

        {/* Eyes */}
        <Ellipse cx="54" cy="74" rx="17" ry="18" fill="#FFFFFF" />
        <Ellipse cx="86" cy="74" rx="17" ry="18" fill="#FFFFFF" />
        <Ellipse cx="57" cy="78" rx="8" ry="9" fill="#14151A" />
        <Ellipse cx="89" cy="78" rx="8" ry="9" fill="#14151A" />
        <Ellipse cx="53" cy="73" rx="3" ry="3.5" fill="#FFFFFF" opacity="0.9" />
        <Ellipse cx="85" cy="73" rx="3" ry="3.5" fill="#FFFFFF" opacity="0.9" />

        {/* Nose + smile */}
        <Path d="M65 90 L75 90 L70 96 Z" fill="#E8879B" />
        <Path
          d="M58 100 C 62 108, 78 108, 82 100"
          stroke="#0B0C10"
          strokeWidth="2.4"
          strokeLinecap="round"
          fill="none"
        />
      </Svg>
    </Animated.View>
  );
}
