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

import { IconSymbol, IconSymbolName } from '@/components/ui/icon-symbol';

type LoadingBadgeProps = {
  icon: IconSymbolName;
  color: string;
  size?: number;
};

const DEFAULT_SIZE = 56;

// The app's one "actively working on something" motif — a spinning ring
// around a pulsing icon badge. Shared by ConfirmDialog (sign-out) and the
// root gate's loading overlay, so waiting reads the same everywhere instead
// of duplicating this per screen.
export function LoadingBadge({ icon, color, size = DEFAULT_SIZE }: LoadingBadgeProps) {
  const rotation = useSharedValue(0);
  const pulse = useSharedValue(0);

  useEffect(() => {
    rotation.value = withRepeat(withTiming(360, { duration: 1100, easing: Easing.linear }), -1);
    pulse.value = withRepeat(withSequence(withTiming(1, { duration: 480 }), withTiming(0, { duration: 480 })), -1, true);
    // Cancel both infinite loops on unmount — see components/ui/skeleton.tsx
    // for why (a stray post-unmount style write on web throws a
    // CSSStyleDeclaration error). Directly relevant here: this badge is only
    // ever shown mid-navigation-triggering action, exactly the moment a
    // component is likely to unmount while its animation is still running.
    return () => {
      cancelAnimation(rotation);
      cancelAnimation(pulse);
    };
  }, [rotation, pulse]);

  const ringStyle = useAnimatedStyle(() => ({ transform: [{ rotate: `${rotation.value}deg` }] }));
  const iconStyle = useAnimatedStyle(() => ({ transform: [{ scale: 1 + pulse.value * 0.14 }] }));

  const styles = StyleSheet.create({
    stage: {
      alignSelf: 'center',
      width: size,
      height: size,
      alignItems: 'center',
      justifyContent: 'center',
    },
    ring: {
      position: 'absolute',
      width: size,
      height: size,
      borderRadius: size / 2,
      borderWidth: 2.5,
      borderColor: 'transparent',
    },
    iconWrap: {
      width: size - 20,
      height: size - 20,
      borderRadius: (size - 20) / 2,
      alignItems: 'center',
      justifyContent: 'center',
    },
  });

  return (
    <View style={styles.stage}>
      <Animated.View style={[styles.ring, { borderTopColor: color, borderRightColor: color }, ringStyle]} />
      <Animated.View style={[styles.iconWrap, { backgroundColor: color }, iconStyle]}>
        <IconSymbol name={icon} size={size * 0.36} color="#FFFFFF" />
      </Animated.View>
    </View>
  );
}
