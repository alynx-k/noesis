import * as Haptics from 'expo-haptics';
import { useEffect, useMemo } from 'react';
import { StyleSheet, useWindowDimensions, View } from 'react-native';
import Animated, {
  Easing,
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withSequence,
  withTiming,
} from 'react-native-reanimated';

const CONFETTI_COLORS = ['#0F6E56', '#F2C879', '#8FE3A8', '#7C6FE0', '#F2A65A', '#93E7B0', '#FFFFFF'];
const PARTICLE_COUNT = 50;

type Particle = {
  startX: number;
  width: number;
  height: number;
  color: string;
  fallDuration: number;
  delay: number;
  drift: number;
  driftCycles: number;
  spin: number;
};

function Confetto({ particle, screenHeight }: { particle: Particle; screenHeight: number }) {
  const progress = useSharedValue(0);

  useEffect(() => {
    progress.value = withDelay(
      particle.delay,
      withTiming(1, { duration: particle.fallDuration, easing: Easing.in(Easing.quad) }),
    );
  }, [particle, progress]);

  const style = useAnimatedStyle(() => {
    const fallDistance = screenHeight + 120;
    const translateY = -80 + progress.value * fallDistance;
    const translateX = Math.sin(progress.value * Math.PI * particle.driftCycles) * particle.drift;
    const opacity = progress.value < 0.05 ? progress.value / 0.05 : progress.value > 0.82 ? (1 - progress.value) / 0.18 : 1;

    return {
      opacity,
      transform: [
        { translateY },
        { translateX },
        { perspective: 500 },
        { rotateZ: `${progress.value * particle.spin}deg` },
        { rotateY: `${progress.value * particle.spin * 1.6}deg` },
      ],
    };
  });

  return (
    <Animated.View
      style={[
        styles.particle,
        style,
        {
          left: particle.startX,
          backgroundColor: particle.color,
          width: particle.width,
          height: particle.height,
        },
      ]}
    />
  );
}

function Flash() {
  const opacity = useSharedValue(0.55);

  useEffect(() => {
    opacity.value = withSequence(withTiming(0.55, { duration: 0 }), withTiming(0, { duration: 450 }));
  }, [opacity]);

  const style = useAnimatedStyle(() => ({ opacity: opacity.value }));

  return <Animated.View style={[styles.flash, style]} pointerEvents="none" />;
}

// Full-screen confetti rain + flash + success haptic, meant to be mounted
// once at the moment something is completed (course exercise, focus
// session). Pieces fall from above the screen with a 3D tumble
// (perspective + rotateY/rotateZ) across the FULL device width/height, not
// a small burst from a fixed point. Purely decorative:
// `pointerEvents="none"` so it never blocks taps on the screen behind it.
export function CelebrationBurst() {
  const { width, height } = useWindowDimensions();

  const particles = useMemo<Particle[]>(
    () =>
      Array.from({ length: PARTICLE_COUNT }, (_, index) => ({
        startX: Math.random() * width,
        width: 7 + Math.random() * 6,
        height: 10 + Math.random() * 8,
        color: CONFETTI_COLORS[index % CONFETTI_COLORS.length],
        fallDuration: 1800 + Math.random() * 1400,
        delay: Math.random() * 500,
        drift: 20 + Math.random() * 40,
        driftCycles: 1.5 + Math.random() * 2,
        spin: 240 + Math.random() * 480 * (Math.random() > 0.5 ? 1 : -1),
      })),
    [width],
  );

  useEffect(() => {
    Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success);
  }, []);

  return (
    <View style={StyleSheet.absoluteFillObject} pointerEvents="none">
      <Flash />
      {particles.map((particle, index) => (
        <Confetto key={index} particle={particle} screenHeight={height} />
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  flash: {
    ...StyleSheet.absoluteFillObject,
    backgroundColor: '#FFFFFF',
  },
  particle: {
    position: 'absolute',
    top: 0,
    borderRadius: 2,
  },
});
