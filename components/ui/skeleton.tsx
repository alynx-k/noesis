import { useEffect } from 'react';
import { StyleProp, StyleSheet, View, ViewStyle } from 'react-native';
import Animated, {
  Easing,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withTiming,
} from 'react-native-reanimated';

import { RADIUS, SPACING } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

function usePulseStyle() {
  const opacity = useSharedValue(0.5);

  useEffect(() => {
    opacity.value = withRepeat(
      withTiming(1, { duration: 750, easing: Easing.inOut(Easing.ease) }),
      -1,
      true,
    );
  }, [opacity]);

  return useAnimatedStyle(() => ({ opacity: opacity.value }));
}

type SkeletonProps = {
  width?: number | `${number}%`;
  height?: number;
  radius?: number;
  style?: StyleProp<ViewStyle>;
};

export function Skeleton({ width = '100%', height = 16, radius = 8, style }: SkeletonProps) {
  const COLORS = useThemeColors();
  const pulseStyle = usePulseStyle();

  return (
    <Animated.View
      style={[
        { width, height, borderRadius: radius, backgroundColor: COLORS.border },
        pulseStyle,
        style,
      ]}
    />
  );
}

type SkeletonTextProps = {
  lines?: number;
  lastLineWidth?: `${number}%`;
};

export function SkeletonText({ lines = 3, lastLineWidth = '60%' }: SkeletonTextProps) {
  return (
    <View style={styles.textGroup}>
      {Array.from({ length: lines }).map((_, index) => (
        <Skeleton key={index} height={14} width={index === lines - 1 ? lastLineWidth : '100%'} />
      ))}
    </View>
  );
}

export function SkeletonCard({ height = 88 }: { height?: number }) {
  const COLORS = useThemeColors();
  const pulseStyle = usePulseStyle();

  return (
    <Animated.View
      style={[styles.card, { height, backgroundColor: COLORS.surface }, cardBorder(COLORS), pulseStyle]}
    />
  );
}

export function SkeletonList({ count = 3, cardHeight = 88 }: { count?: number; cardHeight?: number }) {
  return (
    <View style={styles.list}>
      {Array.from({ length: count }).map((_, index) => (
        <SkeletonCard key={index} height={cardHeight} />
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  textGroup: {
    gap: 8,
  },
  card: {
    borderRadius: RADIUS,
    overflow: 'hidden',
  },
  list: {
    gap: SPACING.tight + 2,
  },
});
