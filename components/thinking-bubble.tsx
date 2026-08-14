import { useEffect } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, {
  Easing,
  interpolateColor,
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withRepeat,
  withSequence,
  withTiming,
} from 'react-native-reanimated';

import { RADIUS, SPACING } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

// Blue -> pink/red, the same two hues yo-yo back and forth continuously
// while the AI is "thinking" — a colored pulse rather than a flat spinner,
// signalling active work rather than a stalled load.
const GLOW_FROM = '#4F8BFF';
const GLOW_TO = '#FF4D7D';

function useDotStyle(delay: number) {
  const value = useSharedValue(0);

  useEffect(() => {
    value.value = withDelay(
      delay,
      withRepeat(
        withSequence(
          withTiming(1, { duration: 380, easing: Easing.out(Easing.quad) }),
          withTiming(0, { duration: 380, easing: Easing.in(Easing.quad) }),
        ),
        -1,
      ),
    );
  }, [value, delay]);

  return useAnimatedStyle(() => ({
    opacity: 0.35 + value.value * 0.65,
    transform: [{ translateY: -value.value * 3 }],
  }));
}

// A dialogue bubble with three bouncing dots, wrapped in a soft glow that
// breathes between blue and pink — shown while the AI tutor is generating a
// reply. Mounted with entering/exiting so it fades in and, crucially, fades
// back OUT smoothly the instant the real reply is ready, instead of just
// popping out of existence.
export function ThinkingBubble() {
  const COLORS = useThemeColors();
  const glow = useSharedValue(0);

  useEffect(() => {
    glow.value = withRepeat(withTiming(1, { duration: 1600, easing: Easing.inOut(Easing.ease) }), -1, true);
  }, [glow]);

  const glowStyle = useAnimatedStyle(() => ({
    backgroundColor: interpolateColor(glow.value, [0, 1], [GLOW_FROM, GLOW_TO]),
  }));

  const dot1 = useDotStyle(0);
  const dot2 = useDotStyle(140);
  const dot3 = useDotStyle(280);

  const styles = StyleSheet.create({
    wrapper: {
      width: 76,
      height: 56,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
      alignSelf: 'flex-start',
    },
    glowOuter: {
      position: 'absolute',
      width: 74,
      height: 54,
      borderRadius: 27,
      opacity: 0.16,
    },
    glowInner: {
      position: 'absolute',
      width: 56,
      height: 42,
      borderRadius: 21,
      opacity: 0.28,
    },
    bubble: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 5,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      paddingVertical: 14,
      paddingHorizontal: 18,
      ...cardBorder(COLORS),
    },
    dot: {
      width: 7,
      height: 7,
      borderRadius: 4,
      backgroundColor: COLORS.mutedText,
    },
  });

  return (
    <View style={styles.wrapper}>
      <Animated.View style={[styles.glowOuter, glowStyle]} pointerEvents="none" />
      <Animated.View style={[styles.glowInner, glowStyle]} pointerEvents="none" />
      <View style={styles.bubble}>
        <Animated.View style={[styles.dot, dot1]} />
        <Animated.View style={[styles.dot, dot2]} />
        <Animated.View style={[styles.dot, dot3]} />
      </View>
    </View>
  );
}
