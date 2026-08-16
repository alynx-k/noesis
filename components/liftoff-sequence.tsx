import { LinearGradient } from 'expo-linear-gradient';
import { useEffect, useMemo } from 'react';
import { StyleSheet, useWindowDimensions, View } from 'react-native';
import Animated, {
  cancelAnimation,
  Easing,
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withSequence,
  withTiming,
} from 'react-native-reanimated';

import { Halo } from '@/components/ui/halo';
import { RocketIcon } from '@/components/rocket-icon';
import { GRADIENTS, HALO_COLORS } from '@/constants/design';

// Timed to match lib/sound.ts's playLaunchSound exactly (see the generator
// script's comment for the same phase boundaries: charge, ignition, thrust,
// fade) — this is the whole point of this component existing separately
// from the idle/running screens: sound and picture hit their beats together
// instead of an instant cut with an unrelated noise over it. The thrust and
// fade phases share one continuous ease-in motion here, so only the charge/
// ignition boundary and the overall duration are needed as constants.
const CHARGE_END_MS = 150;
const IGNITION_END_MS = 220;
const TOTAL_MS = 2200;

type SmokePuff = {
  angle: number;
  distance: number;
  size: number;
  delay: number;
};

const SMOKE_PUFFS: SmokePuff[] = [
  { angle: -140, distance: 34, size: 30, delay: 0 },
  { angle: -70, distance: 30, size: 26, delay: 30 },
  { angle: -110, distance: 42, size: 34, delay: 15 },
  { angle: -40, distance: 26, size: 22, delay: 55 },
  { angle: 200, distance: 36, size: 28, delay: 40 },
];

function Puff({ puff }: { puff: SmokePuff }) {
  const opacity = useSharedValue(0);
  const scale = useSharedValue(0.3);

  useEffect(() => {
    opacity.value = withDelay(
      CHARGE_END_MS + puff.delay,
      withSequence(withTiming(0.85, { duration: 120 }), withTiming(0, { duration: 900 })),
    );
    scale.value = withDelay(
      CHARGE_END_MS + puff.delay,
      withTiming(1.8, { duration: 1000, easing: Easing.out(Easing.quad) }),
    );
    return () => {
      cancelAnimation(opacity);
      cancelAnimation(scale);
    };
  }, [puff, opacity, scale]);

  const radians = (puff.angle * Math.PI) / 180;
  const offsetX = Math.cos(radians) * puff.distance;
  const offsetY = Math.sin(radians) * puff.distance;

  const style = useAnimatedStyle(() => ({
    opacity: opacity.value,
    transform: [{ translateX: offsetX }, { translateY: offsetY }, { scale: scale.value }],
  }));

  return (
    <Animated.View
      style={[
        styles.puff,
        { width: puff.size, height: puff.size, borderRadius: puff.size / 2 },
        style,
      ]}
    />
  );
}

type LiftoffSequenceProps = {
  onComplete: () => void;
};

// A short cinematic beat between pressing "Lancer la fusée" and the running
// screen taking over — charge (jitter) -> ignition (flash + smoke burst) ->
// thrust (rocket accelerates up and away, shrinking into the distance).
// Self-contained and full-screen, like NightSkyBackdrop/LaunchPreview,
// rather than an overlay coordinated with the idle screen's small preview
// rocket — a clean cut into this, then a clean cut into the running screen
// once onComplete fires, reads better than trying to visually thread
// continuity between three different rocket renderings.
export function LiftoffSequence({ onComplete }: LiftoffSequenceProps) {
  const { height } = useWindowDimensions();
  const shakeX = useSharedValue(0);
  const flash = useSharedValue(0);
  const liftY = useSharedValue(0);
  const rocketScale = useSharedValue(1);

  const flightDistance = useMemo(() => height * 0.85, [height]);

  useEffect(() => {
    shakeX.value = withSequence(
      withTiming(4, { duration: 35 }),
      withTiming(-4, { duration: 35 }),
      withTiming(3, { duration: 35 }),
      withTiming(-3, { duration: 35 }),
      withTiming(0, { duration: 20 }),
    );

    flash.value = withDelay(CHARGE_END_MS, withSequence(withTiming(1, { duration: 40 }), withTiming(0, { duration: 260 })));

    const thrustDuration = TOTAL_MS - IGNITION_END_MS;
    liftY.value = withDelay(
      IGNITION_END_MS,
      withTiming(-flightDistance, { duration: thrustDuration, easing: Easing.in(Easing.cubic) }),
    );
    rocketScale.value = withDelay(
      IGNITION_END_MS,
      withTiming(0.3, { duration: thrustDuration, easing: Easing.in(Easing.cubic) }),
    );

    const timeout = setTimeout(onComplete, TOTAL_MS);
    return () => {
      clearTimeout(timeout);
      cancelAnimation(shakeX);
      cancelAnimation(flash);
      cancelAnimation(liftY);
      cancelAnimation(rocketScale);
    };
    // onComplete is expected to be stable enough for the duration of one
    // sequence (a fresh mount per launch attempt) — re-running this on every
    // parent render would restart the whole timed sequence.
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [flightDistance]);

  const shakeStyle = useAnimatedStyle(() => ({ transform: [{ translateX: shakeX.value }] }));
  const flashStyle = useAnimatedStyle(() => ({ opacity: flash.value }));
  const rocketStyle = useAnimatedStyle(() => ({
    transform: [{ translateY: liftY.value }, { scale: rocketScale.value }],
  }));

  return (
    <View style={styles.container} pointerEvents="none">
      <LinearGradient colors={GRADIENTS.night} style={StyleSheet.absoluteFill} start={{ x: 0, y: 0 }} end={{ x: 0.3, y: 1 }} />
      <Animated.View style={[styles.stage, shakeStyle]}>
        <Animated.View style={[styles.flashWrap, flashStyle]} pointerEvents="none">
          <Halo color={HALO_COLORS.gold} size={200} opacity={1} />
        </Animated.View>
        {SMOKE_PUFFS.map((puff, index) => (
          <Puff key={index} puff={puff} />
        ))}
        <Animated.View style={[styles.rocketWrap, rocketStyle]}>
          <RocketIcon size={56} />
        </Animated.View>
      </Animated.View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    ...StyleSheet.absoluteFillObject,
    alignItems: 'center',
    justifyContent: 'center',
    // Fallback so the sky is never invisible if the gradient fails to paint.
    backgroundColor: '#1C1650',
  },
  stage: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  flashWrap: {
    position: 'absolute',
  },
  puff: {
    position: 'absolute',
    backgroundColor: 'rgba(255,255,255,0.55)',
  },
  rocketWrap: {
    alignItems: 'center',
    justifyContent: 'center',
  },
});
