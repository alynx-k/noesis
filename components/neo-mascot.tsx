import { useEffect } from 'react';
import { Image, StyleSheet } from 'react-native';
import Animated, { Easing, useAnimatedStyle, useSharedValue, withRepeat, withSequence, withTiming } from 'react-native-reanimated';

// The real illustrated Neo (assets/images/neo-mascot.png) — background
// flood-filled to transparent (see the session that produced this file for
// the script) so it drops onto any surface, light or dark, without a white
// box around it. Square source (1:1), so `size` sets both dimensions.
const NEO_ASSET = require('../assets/images/neo-mascot.png');

type NeoMascotProps = {
  size?: number;
  // Continuous idle bob, matching RocketIcon's `floating` — off by default
  // so static placements (e.g. a settled row) don't wobble.
  floating?: boolean;
};

// Neo, Noesis's mascot — a chibi black panther in the same rounded,
// big-eyed "plush toy" language as Duolingo's Duo, standing in for Duo in
// the streak-celebration flow (components/streak-celebration.tsx). Distinct
// from the more literal/angular panther silhouette MascotPanther
// (home-widget-preview.tsx) uses for the daily widget card.
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

  return (
    <Animated.View style={[{ width: size, height: size }, bobStyle]}>
      <Image source={NEO_ASSET} style={styles.image} resizeMode="contain" />
    </Animated.View>
  );
}

const styles = StyleSheet.create({
  image: {
    width: '100%',
    height: '100%',
  },
});
