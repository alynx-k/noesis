import { useEffect } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, {
  cancelAnimation,
  Easing,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withSequence,
  withTiming,
} from 'react-native-reanimated';

import { IconSymbol } from '@/components/ui/icon-symbol';
import { ELEVATION, HALO_COLORS, SPACING } from '@/constants/design';

export type MascotState = 'COMPLETED' | 'MORNING' | 'AFTERNOON' | 'NIGHT_DANGER' | 'BROKEN' | 'NEW';

const EYE_COLOR: Record<MascotState, string> = {
  COMPLETED: HALO_COLORS.gold,
  MORNING: '#8FE3A8',
  AFTERNOON: HALO_COLORS.violet,
  NIGHT_DANGER: '#FF5A4E',
  BROKEN: 'rgba(255,255,255,0.32)',
  NEW: HALO_COLORS.gold,
};

const PANTHER_SIZE = 92;

// A code-drawn stand-in for the black panther mascot (no illustrated asset
// exists in the app yet) — dark silhouette, pointed ears, glowing eyes
// whose color and motion change with state: a light bouncy pop for
// COMPLETED/NEW, a slow alert tilt for MORNING, a calm breathing scale for
// AFTERNOON, a fast nervous shake for NIGHT_DANGER, a slow ghostly drift
// for BROKEN. Continuous ambient motion tied to state, not a mount-time
// entrance effect — same discipline as the login screen's rotating ring
// and the AI chat's ThinkingPill.
export function MascotPanther({ state }: { state: MascotState }) {
  const motion = useSharedValue(0);

  useEffect(() => {
    switch (state) {
      case 'COMPLETED':
      case 'NEW':
        motion.value = withRepeat(
          withSequence(
            withTiming(1, { duration: 260, easing: Easing.out(Easing.quad) }),
            withTiming(0, { duration: 260, easing: Easing.in(Easing.quad) }),
          ),
          -1,
          true,
        );
        break;
      case 'NIGHT_DANGER':
        motion.value = withRepeat(
          withSequence(withTiming(1, { duration: 90 }), withTiming(-1, { duration: 90 })),
          -1,
          true,
        );
        break;
      case 'BROKEN':
        motion.value = withRepeat(withTiming(1, { duration: 1800, easing: Easing.inOut(Easing.ease) }), -1, true);
        break;
      default:
        motion.value = withRepeat(withTiming(1, { duration: 1400, easing: Easing.inOut(Easing.ease) }), -1, true);
    }
    // Cancel the infinite loop on unmount — see components/ui/skeleton.tsx
    // for why (a stray post-unmount style write on web throws a
    // CSSStyleDeclaration error). This mascot lives on screens that unmount
    // on navigation away from them — exactly the condition that triggers
    // this.
    return () => cancelAnimation(motion);
  }, [state, motion]);

  const bodyStyle = useAnimatedStyle(() => {
    if (state === 'COMPLETED' || state === 'NEW') {
      return { transform: [{ translateY: -motion.value * 6 }, { scale: 1 + motion.value * 0.04 }] };
    }
    if (state === 'NIGHT_DANGER') {
      return { transform: [{ rotate: `${motion.value * 4}deg` }] };
    }
    if (state === 'BROKEN') {
      return { transform: [{ translateY: motion.value * 5 }], opacity: 0.55 + motion.value * 0.1 };
    }
    return { transform: [{ scale: 1 + motion.value * 0.02 }] };
  });

  const eyeColor = EYE_COLOR[state];

  return (
    <View style={mascotStyles.wrapper}>
      <Animated.View style={[mascotStyles.body, bodyStyle]}>
        <View style={[mascotStyles.ear, mascotStyles.earLeft]} />
        <View style={[mascotStyles.ear, mascotStyles.earRight]} />
        <View style={mascotStyles.face}>
          <View style={[mascotStyles.eye, { backgroundColor: eyeColor }]} />
          <View style={[mascotStyles.eye, { backgroundColor: eyeColor }]} />
        </View>
        {state === 'NIGHT_DANGER' ? (
          <View style={mascotStyles.badge}>
            <IconSymbol name="flame.fill" size={16} color="#FF7A30" />
          </View>
        ) : null}
        {state === 'COMPLETED' ? (
          <View style={mascotStyles.badge}>
            <IconSymbol name="sparkles" size={14} color={HALO_COLORS.gold} />
          </View>
        ) : null}
        {state === 'NEW' ? (
          <View style={mascotStyles.badge}>
            <IconSymbol name="heart.fill" size={14} color={HALO_COLORS.gold} />
          </View>
        ) : null}
      </Animated.View>
      {state === 'NIGHT_DANGER' ? (
        <View style={mascotStyles.tears}>
          <View style={mascotStyles.tearDrop} />
          <View style={mascotStyles.tearDrop} />
        </View>
      ) : null}
    </View>
  );
}

const mascotStyles = StyleSheet.create({
  wrapper: {
    alignItems: 'center',
    justifyContent: 'center',
    height: PANTHER_SIZE + 26,
    marginVertical: SPACING.tight,
  },
  body: {
    width: PANTHER_SIZE,
    height: PANTHER_SIZE,
    borderRadius: PANTHER_SIZE / 2,
    backgroundColor: '#0B0C10',
    alignItems: 'center',
    justifyContent: 'center',
    ...ELEVATION.md,
  },
  ear: {
    position: 'absolute',
    top: -9,
    width: 20,
    height: 20,
    borderRadius: 6,
    backgroundColor: '#0B0C10',
    transform: [{ rotate: '45deg' }],
  },
  earLeft: {
    left: 12,
  },
  earRight: {
    right: 12,
  },
  face: {
    flexDirection: 'row',
    gap: 14,
  },
  eye: {
    width: 11,
    height: 11,
    borderRadius: 6,
  },
  badge: {
    position: 'absolute',
    bottom: -4,
    right: -4,
    width: 28,
    height: 28,
    borderRadius: 14,
    backgroundColor: '#1A1B20',
    alignItems: 'center',
    justifyContent: 'center',
  },
  tears: {
    flexDirection: 'row',
    gap: 18,
    marginTop: 2,
  },
  tearDrop: {
    width: 6,
    height: 10,
    borderRadius: 3,
    backgroundColor: '#5AC8FA',
  },
});
