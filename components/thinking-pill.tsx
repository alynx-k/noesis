import { LinearGradient } from 'expo-linear-gradient';
import { useEffect } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, {
  cancelAnimation,
  Easing,
  interpolateColor,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withTiming,
} from 'react-native-reanimated';

import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS, SPACING } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

// Blue -> violet -> pink, the exact hues the animated ring and ambient glow
// both cycle through — a continuous loop rather than a single static tint,
// so the pill reads as "actively working" rather than "stuck".
const GLOW_STOPS = ['#4F8BFF', '#8B5CF6', '#FF4D8D'] as const;

// Oversized relative to the pill so that, however it's rotated, it always
// fully covers the ring — the standard trick for an "animated gradient
// border" on a platform with no native conic-gradient support: rotate a
// large linear gradient behind a same-shaped, slightly-inset solid pill and
// only the thin uncovered edge reads as a moving colored ring.
const RING_GRADIENT_SIZE = 220;

type ThinkingPillProps = { label?: string };

export function ThinkingPill({ label = 'Réflexion...' }: ThinkingPillProps) {
  const COLORS = useThemeColors();
  const glow = useSharedValue(0);
  const spin = useSharedValue(0);

  useEffect(() => {
    glow.value = withRepeat(withTiming(1, { duration: 2200, easing: Easing.inOut(Easing.ease) }), -1, true);
    spin.value = withRepeat(withTiming(1, { duration: 2800, easing: Easing.linear }), -1);
    // Cancel both infinite loops on unmount — see
    // components/ui/skeleton.tsx for why (a stray post-unmount style write
    // on web throws a CSSStyleDeclaration error).
    return () => {
      cancelAnimation(glow);
      cancelAnimation(spin);
    };
  }, [glow, spin]);

  const glowStyle = useAnimatedStyle(() => ({
    backgroundColor: interpolateColor(glow.value, [0, 0.5, 1], [...GLOW_STOPS]),
  }));

  const ringStyle = useAnimatedStyle(() => ({
    transform: [{ rotate: `${spin.value * 360}deg` }],
  }));

  const styles = StyleSheet.create({
    wrapper: {
      alignSelf: 'flex-start',
      marginBottom: SPACING.element,
    },
    glow: {
      position: 'absolute',
      top: -10,
      left: -10,
      right: -10,
      bottom: -10,
      borderRadius: PILL_RADIUS,
      opacity: 0.2,
    },
    ring: {
      borderRadius: PILL_RADIUS,
      padding: 1.5,
      overflow: 'hidden',
    },
    ringGradientWrapper: {
      position: 'absolute',
      top: '50%',
      left: '50%',
      width: RING_GRADIENT_SIZE,
      height: RING_GRADIENT_SIZE,
      marginLeft: -RING_GRADIENT_SIZE / 2,
      marginTop: -RING_GRADIENT_SIZE / 2,
    },
    pill: {
      flexDirection: 'row',
      alignItems: 'center',
      backgroundColor: COLORS.background,
      borderRadius: PILL_RADIUS,
      paddingVertical: 8,
      paddingHorizontal: 16,
    },
    label: {
      fontSize: 13,
      fontWeight: '600',
      color: COLORS.mutedText,
    },
  });

  return (
    <View style={styles.wrapper}>
      <Animated.View style={[styles.glow, glowStyle]} pointerEvents="none" />
      <View style={styles.ring}>
        <Animated.View style={[styles.ringGradientWrapper, ringStyle]}>
          <LinearGradient
            colors={[...GLOW_STOPS, ...GLOW_STOPS]}
            start={{ x: 0, y: 0 }}
            end={{ x: 1, y: 1 }}
            style={StyleSheet.absoluteFill}
          />
        </Animated.View>
        <View style={styles.pill}>
          <ThemedText style={styles.label}>{label}</ThemedText>
        </View>
      </View>
    </View>
  );
}
